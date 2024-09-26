# Assignment 1: Design a Logical Model
## By: Danica Leung

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

![alt text](<assignment_1 - Q1.png>)

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

![alt text](<assignment_1 - Q2.png>)

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

![alt text](<assignment_1 - Q3.png>)

Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
When it comes to databases, there are advantages to keeping more data especially when it comes to traceability and history. However, there are privacy implications when we keep more data than is required. I don't believe that old addresses are something that needs to be stored especially for a small bookstore. There does not seem to be an advantage to having this information for the business or for the customer. The business only needs the current address of a customer to bill and ship its products to them. Keeping this extra information makes both the customer and the bookstore vulnerable if there was ever a data breach. This is especially true if the customer is unaware their old addresses are being saved. If an issue arises that requires an old address, it can be resolved on a case-by-case basis.

If this were a bigger operation, there are benefits to saving multiple addresses. It could be as simple as giving customers the option to save multiple shipping addresses in their account profile like Amazon. Regardless of the size of operation, it's important that customers are aware of how their data is saved and gives consent. 

## Question 4
Review the AdventureWorks Schema [here](https://imgur.com/a/u0m8fX6)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Your answer...
The first obvious difference is that the AdventureWorks Schema is much bigger and complex than my ERD. While our tables are broken down into the same general classifications, the bookstore does not have a purchasing schema. In my ERD, product and vendor information is combined under the "book inventory" table. In the AdventureWorks Schema, product and vendor are separated into purchasing and production schemas. Another difference is that most of the AdventureWorks tables are not type 1 SCD whereas my ERD is. In reality, most databases retain their changes especially as the operation expands. 

If I were to change my ERD, I would make most of my tables type 2 SCD. As my small bookstore becomes more complex, it would make operations more efficient if I didn't delete my old information. I would also expand my book inventory table by breaking it down into multiple tables. Books can be categorized in so many ways. They can be sorted by type of book (hardcover, softcover or digital), genre, age group, author etc. By creating multiple tables, it will make it easier to track my book inventory especially as I acquire more stock.

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `September 28, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-4-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
