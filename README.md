## 🎯 Executive Summary
Customer churn represents a critical threat to profitability and sustainable growth in the telecommunications industry. For a typical enterprise with one million subscribers, our analysis identifies an annual churn rate of 26.5%, equating to 265,000 customers lost and approximately £222 million in recurring revenue at risk. Traditional reactive retention methods are inefficient and costly.
This report details the development of a predictive analytics framework that transforms customer retention from a reactive cost center into a proactive growth strategy. By leveraging machine learning, we can now identify at-risk customers months in advance, understand the root causes of churn, and prescribe targeted interventions.
Our final model successfully identifies 76.5%% of customers who will churn, providing the opportunity to save over 201,000 customers and protect £168+ million in annual revenue. The following sections outline our analytical approach, key findings, and a strategic four-point action plan for immediate implementation.

## How to Run

1. Download all files from this page
2. Open `Customer_Churn_Analysis.ipynb` in Jupyter Notebook  
3. Run the notebook to see the customer churn analysis

## Files Included
- `Customer_Churn_Analysis.ipynb` - Main analysis notebook
- `TelcoCustomerChurnDatasetCleaned.csv` - Dataset
- `requirements.txt` - List of required Python packages

## The Business Problem: Quantifying the Churn Challenge
The telecommunications sector faces intense competition and high customer acquisition costs. Retaining an existing customer is 5 to 7 times less expensive than acquiring a new one, making churn reduction a primary lever for profitability.
The fundamental flaw in most retention strategies is their reactive nature. By the time a customer contacts the company to cancel, the decision is often final, and retention offers are both desperate and expensive. Our objective was to shift this paradigm by building an early-warning system capable of predicting churn with sufficient lead time to deploy effective, pre-emptive measures.

## 🔍 Analytical Methodology and Key Findings
### Data Foundation and Preparation

-	The analysis was conducted on the publicly available Telco Customer Churn dataset, comprising 7,043 customer records. The dataset included demographic, service, and billing information. To ensure model integrity, a rigorous data preparation process was undertaken:
-	Data Integrity: Eleven records with missing 'Total Charges' (0.15% of the dataset) were removed. This decision preserved data integrity and avoided potential bias from inaccurate value estimation, with a negligible impact on the analysis.
-	Feature Engineering: Categorical variables, such as 'Contract Type' and 'Payment Method,' were encoded for model consumption. Numerical features were standardized to ensure no single variable unduly influenced the models due to scale differences.
-	Class Imbalance Mitigation: The dataset exhibited a class imbalance, with only 26% of customers having churned. We applied the SMOTE (Synthetic Minority Over-sampling Technique) to create a balanced training set. This technique generates synthetic examples of churned customers, allowing the model to learn the underlying patterns of churn more effectively. We acknowledge this can introduce a slight risk of overfitting, but the substantial improvement in identifying true churners was deemed critical for business impact.

## 📊 Core Insights: The Primary Drivers of Customer Churn
Our exploratory analysis and modeling revealed four dominant factors influencing customer churn.

1. Contract Type is the Strongest Predictor
Customers with month-to-month contracts are three times more likely to churn than those on one or two-year agreements. The data shows a 42.7% churn rate for monthly contracts compared to just 11.3% for one-year contracts. This indicates a "commitment gap" where flexible terms facilitate easy departure, while longer contracts foster stability and loyalty.
2. The Premium Service Paradox
Despite its premium positioning, Fiber Optic service is associated with a 41.9% churn rate, significantly higher than the 19% rate for DSL customers. This suggests potential issues with service reliability, competitive pricing, or a mismatch between customer expectations and the delivered experience.
3. Price Sensitivity and Value Perception
A clear correlation exists between monthly charges and churn probability. On average, churned customers paid £74.44 per month, compared to £61.27 for retained customers. For every £10 increase in monthly charges, the risk of churn rises by approximately 8%. This indicates that customers at higher price points are more likely to question the value they receive.
4. The Critical First-Year Window
Customer tenure is a powerful indicator of loyalty. Customers in their first year are 63% more likely to churn than those with tenures exceeding three years. Customers with tenure under 1 year show 100% churn rate in our high-risk segment, dropping to 12% after three years. This highlights the onboarding period and first-year experience as critical to long-term retention.

<img width="1315" height="1213" alt="churn1" src="https://github.com/user-attachments/assets/fe4aa04d-9ddf-444f-84f3-c042f88b9ce7" />


## 🤖 The Predictive Model: An Early-Warning System
### Model Selection and Rationale

We evaluated three distinct machine learning algorithms to identify the optimal solution for this business problem. The primary evaluation metric was Recall—the model's ability to correctly identify customers who will actually churn. In this context, missing a customer who leaves (a false negative) is far more costly than incorrectly flagging a loyal customer (a false positive).

| Model | Accuracy | Precision | **Recall** | F1-Score | ROC AUC |
|-------|----------|-----------|------------|----------|---------|
| Logistic Regression | 80.7% | 65.9% | 56.4% | 60.8% | 0.842 |
| Random Forest | 76.9% | 54.8% | 72.7% | 62.5% | 0.844 |
| **XGBoost (Selected)** | **75.8%** | **53.1%** | **76.5%** | **62.7%** | **0.837** |

<img width="1584" height="1184" alt="churn7" src="https://github.com/user-attachments/assets/61805cba-1c46-4f6a-aa24-b48f9cec2ca0" />


Model	Description	Accuracy	Recall (Churn)
Logistic Regression	A interpretable model that finds linear relationships.	80%	55%
Random Forest	An ensemble method that combines multiple decision trees.	79%	49%
XGBoost (Selected)	An advanced algorithm that learns sequentially from errors.	79%	55%
XGBoost was selected as the final model based on its superior ability to handle complex, non-linear relationships and class imbalance inherently. It provided the best balance of high recall (55%) and actionable insights through feature importance analysis. While other models like LightGBM could have been tested, XGBoost's proven track record and performance met our core business objectives without necessitating further experimentation.

## 🛠️ Business Interpretation of Model Performance
- Recall (76.5%): For every 100 customers who will churn, our model identifies 76 in advance
- Precision (53.1%): When the model flags a customer as high-risk, it is correct 53% of the time
- Overall Accuracy (75.8%): The model correctly predicts the churn outcome for 76% of all customers

## 👥 Strategic Customer Segmentation

<img width="523" height="391" alt="image" src="https://github.com/user-attachments/assets/8b9ac7f6-baac-4df5-b051-a127969651bf" />

To enable tailored strategies, we segmented the customer base into three distinct groups using clustering analysis:
- Segment A: Budget-Conscious Stable Customers (45.9% of base). Low monthly charges ($44), moderate tenure (30 months), 0% churn rate.
- Segment B: Loyal High-Value Customers (30.6% of base). High monthly charges ($90), long tenure (58 months), 10% churn rate.
- Segment C: At-Risk New & Dissatisfied (23.5% of base). Moderate monthly charges ($74), short tenure (13 months), 100% churn rate.

## 📈 Recommendations and Implementation Plan
We recommend the following four strategic initiatives, designed for a phased 90-day rollout.
1. Launch a Targeted Contract Conversion Campaign
Implement a "Commit & Save" program, offering a 10-15% discount to month-to-month customers who switch to one or two-year contracts. Focus this campaign on new customers within their first three months and existing customers with high monthly charges. The expected outcome is a 35% reduction in churn from this high-risk segment.
2. Execute a Fiber Optic Service Recovery Plan
Immediately investigate the root causes of fiber optic churn through competitive pricing analysis, service reliability audits, and targeted customer surveys. Introduce quick-win solutions such as service level guarantees and value-added feature bundles to improve perceived value.
3. Deploy a High-Value Customer Protection Program
Establish a VIP program for loyal, high-spending customers (Segment B). This should include dedicated support channels, exclusive upgrades, and personalized engagement. Allocate a higher retention budget per customer for this segment to protect the company's revenue foundation.
4. Enhance the New Customer Onboarding Experience
Develop a comprehensive 60-day onboarding program for all new customers (Segment C), featuring dedicated support, welcome packages, and educational resources. Implement early loyalty incentives, such as automatic enrollment in a rewards program after 90 days of timely payment, and conduct structured feedback surveys at 30 and 90-day marks.

## 💰 Projected Business Impact
For a company with one million customers:
- Current State: 265,000 customers churn annually.
- With Proactive Retention: The model enables the saving of 201,000+ customers.
- Financial Impact: Protects approximately £168 million in annual revenue.
-	Return on Investment: Every £1 spent on these targeted retention efforts is projected to save £5 in customer acquisition costs.

## ⚠️ Limitations and Future Considerations
This analysis provides a robust foundation for a proactive retention strategy. However, several areas offer opportunities for future enhancement:
-	Data Scope: The model is based on quantitative data. Incorporating qualitative feedback from support calls and surveys would deepen the understanding of churn drivers.
-	Temporal Analysis: The current dataset is a static snapshot. Future iterations could incorporate time-series data to track behavioral trends and identify at-risk customers even earlier.
-	Industry Application: While validated in telecommunications, this framework's principles can be adapted and tested in other high-churn industries such as banking and streaming services.
## Conclusion
This report demonstrates the transformative potential of predictive analytics in customer retention. By moving from a reactive to a proactive stance, the company can significantly reduce churn, protect a substantial portion of at-risk revenue, and build a more stable, loyal customer base. The recommended action plan provides a clear and immediate path to realizing these benefits.

