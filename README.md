# Customer-Churn-Analysis-Using-Machine-Learning
## 🎯 Executive Summary
Customer churn is when customers stop doing business with a company - is a silent profit killer.
For a typical telecom company, losing customers means:

### The Stark Reality:
- For a typical telecom company with 1 million customers, our analysis reveals a 26.5% annual churn rate
- This translates to 265,000 customers lost every year
- Assuming an average monthly bill of £70, this represents £222 million in annual recurring revenue at risk 
- The cost to replace these customers? 5-7 times more expensive than retaining existing ones

### Why the Traditional Approach Fails? 
Most companies wait until customers call to cancel, then make desperate "please stay" offers. This reactive approach is too late, too expensive, and misses the real issues.

### What does our project deal with? 
We built an early warning system that identifies at-risk customers months before they leave, allowing for proactive, personalized retention strategies that help retain customers. 
This project delivers a complete framework to:
- Predict which customers are at high risk of leaving
- Pinpoint the exact reasons driving cancellations
- Group customers for targeted retention campaigns
- Recommend specific, cost-effective retention actions

The Bottom Line: Our model helps companies save millions in lost revenue by focusing retention efforts on the right customers at the right time.

### 🛠️ Tools Used
| Category | Tools |
|----------|-------|
| Programming | Python 🐍 |
| Data Analysis | Pandas, NumPy |
| Machine Learning | Scikit-learn, XGBoost |
| Visualization | Matplotlib, Seaborn |
| Environment | Jupyter Notebook |

### 📊 Dataset Used
Source: [Telco Customer Churn Dataset from IBM] 
(https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

### Exploratory Data Analysis 
We analyzed 7,043 customers with information about:
| Data Category | Examples |
|---------------|----------|
| Who They Are | Age, family status, senior citizen status |
| What They Buy | Internet type, phone lines, streaming services |
| Billing Details | Monthly charges, payment method, contract type |
| The Outcome | churn, No Churn |

## 🔍 Analysis & Insights Deep Dive

### 🛠️ Data Preparation
- Handling Missing Values - We identified 11 records with missing 'Total Charges' values (0.15% of the dataset). Why we removed them instead of estimating: "After careful consideration, we chose removal over estimation because the small number of affected records had negligible impact on model training, while preserving data integrity and avoiding potential bias from inaccurate value estimation.
- Categorical Encoding: Converted text categories (like 'Internet Service Type', 'Payment Method') into numerical formats that machine learning algorithms can process efficiently
- Feature Standardization: Scaled numerical features like 'Monthly Charges' and 'Total Charges' to ensure no single variable disproportionately influences the models due to scale differences
- Addressing class imbalance - The dataset showed significant class imbalance with only 26% churned customers. We applied SMOTE (Synthetic Minority Over-sampling Technique) to create a balanced training set, which creates synthetic examples of customers who churned to give our models more examples to learn from. While SMOTE can introduce slight overfitting on synthetic examples, the substantial improvement in identifying actual churners far outweighed this theoretical risk.

### 📊 Descriptive Statistics
Key Customer Insights Revealed
- Customers who stayed averaged 38 months with the company, while those who left averaged only 18 months - new customers are most vulnerable
- Churned customers paid £74.44/month on average vs. £61.27 for loyal customers - higher prices correlate with dissatisfaction
- Loyal customers generated £2,555 in total revenue vs. £1,532 for churners - proving retention drives long-term profitability
- Shorter relationships + higher bills = higher churn risk

## 🤖 Predictive Analysis

Logistic Regression - This model looked for simple, linear patterns in the data and achieved the highest overall accuracy at 80%. It correctly identified 55% of customers who actually churned (recall) but was too simplistic to catch complex churn patterns. It would miss 45% of customers who ended up leaving - too many missed opportunities for a retention strategy

Random Forest - This model built 500 decision trees and combined their votes, making it robust but overly cautious. Recall dropped to 49% - it became too conservative and missed over half of actual churners. catching 49% of leavers means the business would miss 51,000+ at-risk customers in a 100,000 customer base. 

XGBoost - This model built trees sequentially, with each new tree focusing on the mistakes of previous ones. Achieved the best balance with 55% recall while maintaining strong overall performance. Identifies 55% of customers who will actually leave, giving a 2-month head start to save 55,000+ customers in a 100,000 customer base

## Why These Metrics Matter for Business?
-	Recall (55%): Out of every 100 customers who leave, our model identifies 55 of them in advance
-	Precision (62%): When our model flags a customer as high-risk, it's correct 62% of the time
-	Accuracy (79%): Overall, our model makes correct predictions 79% of the time for both stayers and leavers
-	ROC-AUC (83%): The model has an 83% probability of correctly ranking a random churner higher than a random non-churner

## Top Reasons Customers Leave:
1.	Contract Type - Month-to-month customers are 3x more likely to leave than those on 1 to 2 year contracts. Lack of commitment creates easy exit options. Long-term contracts build stability through psychological commitment and better value perception. 42% churn rate for monthly vs. 11% for 1-year and 3% for 2-year contracts
2.	Internet Service Issues - Fiber optic customers show 27% higher churn than DSL users despite premium positioning. Premium pricing requires premium experience. Potential issues with reliability, competitive offers, or unmet expectation. 42% of fiber users churn vs. 19% of DSL users
3.	Price Sensitivity - Every £10 increase in monthly charges correlates with 8% higher churn probability. Customers constantly evaluate cost vs. value. Higher spenders have higher expectations and more competitor attention. Churned customers paid 21% higher monthly rates on average
4.	Customer Tenure - Customers in their first year are 63% more likely to leave than 3+ year customers. Business Justification: Initial periods test service quality and value delivery. Early satisfaction drives long-term loyalty. 45% churn rate in first year vs. 12% after 3 years. 

## 👥 Three Customer Personalities:
| Segment | Profile | Strategy |
|---------|---------|----------|
| 💰 Budget-Conscious | Low spending, moderate loyalty | Offer affordable bundles, basic loyalty rewards |
| ⭐ Loyal VIPs | Long-term, high spending | Protect with premium service, exclusive offers |
| 🎯 New & At-Risk | Recent sign-ups, high spending | Onboarding support, incentives for long-term commitment |

## 📈 Results & Recommendations
-	Launch Targeted Contract Conversion Campaign - Implement a "Commit & Save" program offering 10-15% discounts for month-to-month customers who switch to annual contracts, specifically targeting new customers (first 3 months) and high monthly spenders, with expected 35% churn reduction in this segment.
-	Execute Fiber Optic Service Recovery Plan - Address the 42% fiber optic churn rate through competitive pricing analysis, service reliability improvements, and customer satisfaction surveys, while immediately introducing service guarantees and value-added features to retain dissatisfied customers.
-	Deploy High-Value Customer Protection Program - Establish VIP treatment for loyal, high-spending customers including dedicated support lines, exclusive upgrades, and personalized engagement, with increased retention budget allocation to protect this revenue-critical segment.
-	Enhance New Customer Onboarding Experience - Implement comprehensive 60-day onboarding with welcome packages, dedicated support, and early loyalty incentives, coupled with systematic feedback loops at 30 and 90-day marks to identify at-risk customers early.

## 💰 Expected Business Impact
For a company with 1 million customers:
-	Current Reality: 265,000 customers leave annually (26.5% churn rate)
-	With Our Model: 55,000+ customers saved through proactive intervention (55% recall)
-	Revenue Impact: £46+ million annual savings (£70/month average bill)
-	ROI Calculation: Every £1 spent on targeted retention saves £5 in customer acquisition costs

## ⚠️ Limitations & Next Steps
-	Industry-Specific Data Scope Constraints - Findings are telecommunications-specific and lack qualitative customer feedback, service quality metrics, and competitor context, limiting immediate applicability to other industries without further validation.
-	Static Temporal Data Limitations - Single point-in-time data prevents tracking customer behavior changes over months, missing crucial trend analysis that could identify declining usage patterns before churn decisions occur.
-	Model Interpretation Boundary Limits - While excellent at identifying who will leave, the model provides less precision on individual reasons for churn and generates some false positives where loyal customers receive unnecessary retention offers.

