# Predictive Customer Churn Analysis: Data-Driven Retention Strategy
![churnimg](https://github.com/user-attachments/assets/1b9cc689-3320-47a2-a417-9f3e5c7c7f69)

## 🎯 Executive Summary
Customer churn represents a critical threat to profitability and sustainable growth in the telecommunications industry. For a typical enterprise with one million subscribers, this analysis identifies an annual churn rate of 26.5%, equating to 265,000 customers lost and approximately £222 million in recurring revenue at risk. Traditional reactive retention methods are inefficient and costly because they only engage customers after cancellation requests, when loyalty is already eroded and retention offers become desperate price concessions rather than value-driven solutions.

This report details the development of a predictive analytics framework that transforms customer retention from a reactive cost centre into a proactive growth strategy. By leveraging machine learning, we can now identify ‘at-risk customers’ months in advance, understand the root causes of churn, and prescribe targeted interventions.

Our final model successfully identifies 76.5% of customers who will churn, providing the opportunity to save over 201,000 customers and protect £168+ million in annual revenue. 

The following sections outline our analytical approach, key findings, and a strategic four-point action plan for immediate implementation.

## How to Run

1. Download all files from this page
2. Open `Customer_Churn_Analysis.ipynb` in Jupyter Notebook  
3. Run the notebook to see the customer churn analysis

## Files Included
- `Customer_Churn_Analysis.ipynb` - Main analysis notebook
- `TelcoCustomerChurnDatasetCleaned.csv` - Dataset
- `requirements.txt` - List of required Python packages
- `telco_customer_churn.sql`  - SQL queries for data cleaning

## The Business Problem: Quantifying the Churn Challenge
The telecommunications sector faces intense competition and high customer acquisition costs. Retaining an existing customer is 5 to 7 times less expensive than acquiring a new one, making churn reduction a primary lever for profitability.

The fundamental flaw in most retention strategies is their reactive nature. By the time a customer contacts the company to cancel, the decision is often final, and retention offers are both desperate and expensive. Our objective was to shift this paradigm by building an early-warning system capable of predicting churn with sufficient lead time to deploy effective, pre-emptive measures.

## 🔍 Analysis
### Data Prepration

The analysis was conducted on the publicly available Telco Customer Churn dataset, which initially comprised 7,043 customer records with demographics, service, and billing information. A two-stage data preparation pipeline was implemented to ensure data quality and model readiness.

1. Data Cleaning & Integrity using SQL

- Handling Missing Values: 11 customer records (0.15% of the dataset) with missing 'Total Charges' were identified and removed. This decision preserved data integrity by avoiding biased imputation and had a negligible impact on the overall analysis.
- Values in various columns were standardized for consistency (e.g., yes/no/no internet service were standardised to yes/no).

2. Feature Engineering & Preprocessing in Python
- Categorical variables, such as 'Contract Type' and 'Payment Method', were converted into numerical formats using one-hot encoding. The target variable, 'Churn', was encoded by mapping 'Yes' to 1 and 'No' to 0.
- All numerical features were standardized to a common scale, ensuring that no single variable would unduly influence the models due to its original magnitude.

### Exploratory Data Analysis
<img width="374" height="356" alt="image" src="https://github.com/user-attachments/assets/bc01952a-362e-4bcf-8d07-7725b3998c7b" />

Our analysis reveals that 26.5% of customers churn annually, representing a significant revenue risk for the business. This visualization provides immediate context for the scale of the churn challenge:

- 73.5% Customer Retention: The majority of customers continue their service, representing the stable foundation of the business
- 26.5% Customer Attrition: Nearly 1 in 4 customers leave annually, highlighting the urgent need for proactive retention measures

Business Context: For a company with 1 million subscribers, this 26.5% churn rate translates to 265,000 customers lost each year. At an average revenue of £70 per customer monthly, this represents approximately £222 million in annual recurring revenue at risk.

## 🤖 The Predictive Model: An Early-Warning System

We evaluated three distinct machine learning algorithms to identify the optimal solution for this business problem. The primary evaluation metric was Recall—the model's ability to correctly identify customers who will actually churn. In this context, missing a customer who leaves (a false negative) is far more costly than incorrectly flagging a loyal customer (a false positive).

| Model | Accuracy | Precision | **Recall** | F1-Score | ROC AUC |
|-------|----------|-----------|------------|----------|---------|
| Logistic Regression | 80.7% | 65.9% | 56.4% | 60.8% | 0.842 |
| Random Forest | 76.9% | 54.8% | 72.7% | 62.5% | 0.844 |
| **XGBoost (Selected)** | **75.8%** | **53.1%** | **76.5%** | **62.7%** | **0.837** |

Logistic Regression successfully identified clear linear patterns, confirming that contract type and monthly charges were strong churn indicators. It established that month-to-month customers were 3x more likely to churn and revealed a £13+ price gap between churned and retained customers. However, despite these valuable insights, it missed 44% of customers who actually churned—representing unacceptable revenue risk due to its inability to capture complex behavioral patterns.

We then advanced to Random Forest, which uncovered more sophisticated relationships by analyzing hundreds of feature combinations. It validated that tenure duration and total customer value were critical factors, while also detecting subtle service usage patterns that influenced churn decisions. The model's ensemble approach provided robust pattern recognition, but it became overly conservative in practice—actually reducing recall and missing more churners than our baseline, despite its deeper analytical capabilities.

XGBoost was selected as the final model based on its superior ability to handle complex, non-linear relationships and class imbalance inherently. It provided the best balance of high recall (55%) and actionable insights through feature importance analysis. While other models like Light GBM could have been tested, XGBoost's proven track record and performance met our core business objectives of maximizing churn detection, providing interpretable feature importance for strategic decisions, and delivering production-ready performance without necessitating further experimentation.

<img width="620" height="404" alt="image" src="https://github.com/user-attachments/assets/3c4b8d57-61b3-41a8-bb02-14b99886ffab" />

This chart evaluates our models using recall, a metric that answers the question: "Of all customers who actually churned, how many did the model correctly flag?" A higher recall means fewer churning customers are missed. Based on this, XGBoost is the top performer, correctly identifying 76.5% of all true churn cases.

## What do these metrics mean for the business?
- Recall (76.5%): For every 100 customers who will churn, our model identifies 76 in advance
- Precision (53.1%): When the model flags a customer as high-risk, it is correct 53% of the time
- Overall Accuracy (75.8%): The model correctly predicts the churn outcome for 76% of all customers
- F1-Score (62.7%): Balances precision and recall, indicating strong overall performance in identifying true churners while managing false positives
- ROC AUC (83.7%): Demonstrates 84% probability of correctly ranking a random churner higher than a random non-churner

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

## 👥 Strategic Customer Segmentation
<img width="627" height="465" alt="image" src="https://github.com/user-attachments/assets/5a8d193b-c3da-4b42-aaab-171cc1869185" />

Customer segmentation was performed using the Elbow Method, which indicated three as the optimal number of clusters. The customers were accordingly grouped into three distinct segment to enable tailored strategies.

- Segment A: Budget-Conscious Stable Customers (45.9% of base). Low monthly charges ($44), moderate tenure (30 months), 0% churn rate.
- Segment B: Loyal High-Value Customers (30.6% of base). High monthly charges ($90), long tenure (58 months), 10% churn rate.
- Segment C: At-Risk New & Dissatisfied (23.5% of base). Moderate monthly charges ($74), short tenure (13 months), 100% churn rate.

## 📈 Recommendations and Implementation Plan
Based on our data-driven insights, we propose four strategic initiatives for immediate execution:

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

While this analysis establishes a strong predictive framework, several enhancements could further strengthen our retention capabilities:

-	Data Scope: The model is based on quantitative data. Incorporating qualitative feedback from support calls and surveys would deepen the understanding of churn drivers.
-	Temporal Analysis: The current dataset is a static snapshot. Future iterations could incorporate time-series data to track behavioral trends and identify at-risk customers even earlier.
-	Industry Application: While validated in telecommunications, this framework's principles can be adapted and tested in other high-churn industries such as banking and streaming services.


