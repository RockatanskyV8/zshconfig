import seaborn as sns
import matplotlib.pyplot as plt

class FinancePlots():

    def __init__(self, dataset: pd.DataFrame, value_column: str):
        self.dataset = dataset
        self.value_column = value_column

    def line_plot(self, x_value: str):
        plt.figure(figsize = (17,15))
        ax = sns.lineplot(data=self.dataset, x=x_value, y=self.value_column, sort=False)
        plt.show()

    def bar_plot(self, x_value: str):
        plt.figure(figsize = (17,15))
        ax = sns.barplot(data=self.dataset, x=x_value, y=self.value_column)
        plt.show()
