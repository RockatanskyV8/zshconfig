import pandas as pd

class FinanceCalc():

    def __init__(self, dataset: pd.DataFrame, value_column: str):
        self.dataset = dataset
        self.value_column = value_column

    def maxs_per_year(self, x_column: str, year: str):
        MOD_DATASET = self.dataset[ self.dataset['ANO DE PAGAMENTO'] == year ]
        info_names  = []
        info_values = []

        for name in MOD_DATASET[x_column].unique():
            soma_total = sum(MOD_DATASET[MOD_DATASET[x_column] == name][self.value_column])
            info_names.append(name)
            info_values.append(soma_total)

        df_new = pd.DataFrame({ 'names': info_names, 'values': info_values })

        return df_new

    def monthly_payed(self, column: str, month: str, year: str):
        MOD_DATASET = self.dataset[ self.dataset['ANO DE PAGAMENTO'] == year ]
        MOD_DATASET = MOD_DATASET[ MOD_DATASET['MÊS DE PAGAMENTO'] == month ]
        MOD_DATASET['TOTAL'] = sum(MOD_DATASET[self.value_column])

        return MOD_DATASET[[column, 'MÊS DE PAGAMENTO', self.value_column, 'TOTAL']]

    def filter_dataset_year(self, year: str, column: str, content: str):
        MOD_DATASET = self.dataset[ self.dataset['ANO DE PAGAMENTO'] == year ]
        MOD_DATASET = MOD_DATASET[MOD_DATASET[column].str.contains(content)]
        MOD_DATASET = MOD_DATASET.sort_values('MÊS DE PAGAMENTO')

        return MOD_DATASET[[column, 'MÊS DE PAGAMENTO', self.value_column]]
