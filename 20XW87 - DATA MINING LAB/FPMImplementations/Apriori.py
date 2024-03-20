# %%
import pandas as pd
import itertools
from mlxtend.frequent_patterns import apriori, association_rules

# %%
df = pd.read_csv('KaggleCovidDataset.csv').applymap(lambda x : 1 if x == "Yes" else 0)
df

# %%
def apriori_algorithm(df, min_support=0.1, use_original_colnames=False):
    """
    Implements the Apriori algorithm for frequent itemset mining.
    
    Parameters:
    df (DataFrame): The transaction dataset where each row is a transaction and each column is an item.
    min_support (float): The minimum support threshold. Defaults to 0.1.
    use_original_colnames (bool): Flag to use original column names in the returned DataFrame. Defaults to False.
    
    Returns:
    DataFrame: The DataFrame of frequent itemsets with columns ['support', 'itemsets'].
    """
    
    df_copy = df.copy(deep=True)
    if not use_original_colnames:
        df_copy.columns = [idx for idx in range(len(df_copy.columns))]

    # Generate 1-itemsets
    frequent_one_itemsets = df_copy.apply(lambda x: x.value_counts(normalize=True).get(1, 0)).loc[lambda x: x >= min_support].to_dict()
    frequent_one_itemsets = {frozenset((item,)): support for item, support in frequent_one_itemsets.items()}

    # Function to generate k-itemsets
    def generate_frequent_k_itemsets(frequent_itemset, k):
        """
        Generate k-itemsets from the given itemset.
        
        Parameters:
        frequent_itemset (set): The set of frequent (k-1)-itemsets.
        k (int): The itemset size.
        
        Returns:
        dict: The dictionary of frequent k-itemsets and their support.
        """
        
        frequent_k_itemsets = set()
        
        # For each unique pair of itemsets
        for itemset1, itemset2 in itertools.combinations(frequent_itemset, 2):
            union_itemset = itemset1.union(itemset2)
            if len(union_itemset) == k:
                # Generate all (k-1)-subsets of the union
                subsets = [frozenset(c) for c in itertools.combinations(union_itemset, k-1)]
                
                # If all subsets are frequent, add the union to the set of k-itemsets
                if all([subset in frequent_itemset for subset in subsets]):
                    frequent_k_itemsets.add(union_itemset)
        
        # Compute support
        frequent_k_itemsets_support = {}
        for k_itemset in frequent_k_itemsets:
            support = df_copy[list(k_itemset)].all(axis=1).mean()
            if support >= min_support:
                frequent_k_itemsets_support[k_itemset] = support
        
        return frequent_k_itemsets_support
    
    all_frequent_itemsets = {**frequent_one_itemsets}
    
    frequent_k_itemsets = frequent_one_itemsets
    k = 2
    while len(frequent_k_itemsets) > 0:
        frequent_k_itemsets = generate_frequent_k_itemsets(set(frequent_k_itemsets.keys()), k)
        all_frequent_itemsets.update(frequent_k_itemsets)
        k += 1

    return pd.DataFrame([(support, itemset) for itemset, support in all_frequent_itemsets.items()], columns=['support', 'itemsets'])

def generate_association_rules(df, min_confidence):
    """
    Implements the association rules algorithm for frequent itemset mining.
    
    Parameters:
    df (DataFrame): The DataFrame of frequent itemsets with columns ['support', 'itemsets'].
    min_confidence (float): The minimum confidence threshold. Defaults to 0.1.
    
    Returns:
    DataFrame: The DataFrame of association rules with columns ['antecedents', 'consequents', 'confidence'].
    """
    
    frequent_itemsets_dict = {frozenset(itemset): support for itemset, support in zip(df['itemsets'], df['support'])}
    association_rules_list = []
    
    for itemset in frequent_itemsets_dict:
        if len(itemset) > 1:
            for i in range(1, len(itemset)):
                antecedent_itemsets = list(itertools.combinations(itemset, i))
                
                for antecedent in antecedent_itemsets:
                    antecedent = frozenset(antecedent)
                    consequent = itemset.difference(antecedent)
                    
                    confidence = frequent_itemsets_dict[itemset] / frequent_itemsets_dict[antecedent]
                    if confidence >= min_confidence:
                        association_rules_list.append((antecedent, consequent, confidence))
    
    return pd.DataFrame(association_rules_list, columns=['antecedents', 'consequents', 'confidence'])


# %%
aBadDF = apriori_algorithm(df, 0.1, True)
aDF = apriori(df, 0.1, True)

# %%
good, bad = set(aDF['itemsets']), set(aBadDF['itemsets'])
whatsnotthere = good.difference(bad)
whatsnotthere

# %%
generate_association_rules(aBadDF, min_confidence=0.6)

# %%
association_rules(aDF, metric='confidence', min_threshold=0.6)[['antecedents', 'consequents', 'confidence']]


