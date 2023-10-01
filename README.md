# Analyzing App Store data using SQL
I used SQL to analyze App Store data for 7197 iOS apps in order to find what App Store-specific factors contribute to the success (high user ratings) of an app, including app genre, price, languages supported, and app description.

The SQL code utilizes window and aggregate functions to list the top-rated apps for each genre. Final recommendations are provided for stakeholders based on the SQL output.

## Situation

What is the purpose of the project, and who are we building our analysis for?

**Scenario**

Our stakeholder needs data-driven insights to determine what type of app they should build for the Apple App Store.

**Questions to be answered**

- What app categories are the most popular?

- What price should the app be?

- How do I maximize user ratings?

**My Responsibilities**

Based on the situation above, I have used a data set that includes data for 7197 iOS apps from the Apple App Store from July 2017. The data set has been obtained from [Kaggle](https://www.kaggle.com/datasets/ramamet4/app-store-apple-data-set-10k-apps).

From this data set, I used two tables in the SQL code in order to analyze the data and make meaningful conclusions:

- AppleStore (relevant fields: app ID, app name, size, price, user rating, genre)

- AppleStore_Description (relevant fields: app ID, app name, size, app description)

## What I Did

**Exploratory Data Analysis (EDA)**

*Before diving into advanced analysis using SQL, I conduct EDA on the data set to understand the characteristics and structure of the data, and any issues that need to be addressed beforehand, such as missing or inconsistent data or data types, and any errors or outliers. I also query the data for the min, max, and average ratings.*

- Checking the number of unique apps in both tables
  
- Check for any missing values in key fields (app name, user rating, app genre, description) from both tables

- Finding out the number of apps per genre
  
- Get an overview of the apps' ratings

## Data Analysis

**Once I've established that there is no missing data, and have a basic statistical summary of the data (min, max, average), I move on to the actual data analysis**

- Checking whether paid apps have higher ratings than free apps

- Checking if apps with more supported languages have higher ratings

- Checking what genres have the lowest ratings

- Checking if correlation exists between length of app description and user rating

- Checking the top-rated apps for each genre

## Results & Recommendations

- The SQL output shows that paid apps generally have better ratings than free apps—this doesn't necessarily mean that paid apps are "better" than free apps. It may mean that users who pay for an app have higher engagement with the app and thus have a higher perceived value for it. The recommendation to the stakeholder is to charge a price for their app if they believe it solves a critical pain point in a high quality manner
- The output also shows that apps that support 10-30 languages have a higher rating than apps that support less than 10 or more than 30 languages. This does not necessarily mean that apps that support between 10-30 languages are of higher quality, but that apps with a good amount of language support focus on the right audience, and satisfy user a higher number of users since they cater to a larger audience. An app with more than 30 languages may receive lower ratings since it may lack a balance between useful functionality and language support
- App genres such as "Finance" and "Book" received one of the lowest ratings, suggesting that there is room for improvement for apps in these industries. However, this may also mean these apps in these industries are harder to build and maintain and therefore harder to get a good rating from users
- Apps with a longer description have better ratings—it is likely that users appreciate apps that have a clear and transparent description of the features and limitations of the app before they download it, which sets appropriate expectations, leading to higher ratings
- During the EDA phase, the SQL query to find the number of apps per genre provides an output where the Games and Entertainment app genres have the highest number of apps. This suggests that these are highly competitive app categories and it may be difficult for a new app in these spaces to gain meaningful traction
