###################################################################
 #  Author: Ed Ekpoudom
 #  Last Updated: 18 January 2017
 #
 ##################################################################
import numpy as np

class PythonRegression:
    def __init__(self, endog, exog):
        self.endog = endog
        self.exog = exog
        self.betahat = np.zeros((exog.shape[1],1))

    def fit(self):
        Q,R = np.linalg.qr(self.exog)
        Qb = np.dot(Q.T, self.endog)
        self.betahat = np.linalg.solve(R, Qb)
        return self.betahat

if __name__ == '__main__':
    data = np.loadtxt(open("boston2.csv", "rb"), delimiter=",")
    endog = data[:,[14]]
    exog = data[:, 0: 14]
    lm = PythonRegression(endog, exog)
    bhat = lm.fit()

    results = [['Intcpt', bhat[0,0]],['crim', bhat[1,0]],['zn', bhat[2,0]],['indus', bhat[3,0]],
               ['chas', bhat[4,0]],['nox',bhat[5,0]],['rm', bhat[6,0]],['age', bhat[7,0]],
                ['dis', bhat[8,0]],['rad', bhat[9,0]],['tax', bhat[10,0]],['ptrtio', bhat[11,0]],
               ['black', bhat[12,0]],['lstat', bhat[13,0]]]

    print('Coefficients:\n')

    for item in results:
        print("{:8}= {:06.4f}".format(item[0], item[1]))
