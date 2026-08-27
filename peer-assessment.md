# Karolina's Peer Assessment for Aaron

## Automate
#### The entire analysis is automated

- Data reading and cleaning is handled in a standalone script that creates intermediate output(s).

Meets spec: The data reading and cleaning is handled in a standalone script 1_clean_data.R.

- The analysis is performed in a Quarto document that reads intermediate outputs.

Not yet: The analysis is still performed in the paper Quarto doc, even though there is an output folder containing the cleaned dataset.

- Files in the R/ folder exclusively define functions and have no other side effects.

Meets spec: Yes, the one file in the R/ folder defines the moving_average function and that's it.

- All scripts run without errors.

Meets spec: Yes, all scripts run without errors.


#### The analysis produces the expected output

- The Quarto document performs the data analysis (moving average).

Meets spec: Yes, the Quarto document does perform the moving average data analysis.

- The Quarto document creates a figure that is a reasonable approximation of the original.

Meets spec: Yes, the Quarto document creates a figure that looks similar to the original.


## Organize

#### Data are properly organized

- Raw data is contained in its own folder.

Meets spec: Yes, the raw data is contained in the data folder.

- Outputs are contained in a separate folder from raw data.

Meets spec: Yes, the outputted dataset is in the output folder, separate from raw data.

#### Code is properly organized

- At least one function is defined in a script in R/ and used elsewhere in the workflow.

Meets spec: Yes, the moving_average function is defined in an .R script in R/ and is called in the Quarto file.

- All code in the repo (except in the scratch/ folder) is required for the analysis (i.e., no “safety blanket” code remaining)

Meets spec: Yes, all code in the repo is required for analysis. There is no unneccessary code.


## Document

#### The repo has an effective README

- A short, but descriptive title

Meets spec: Yes, the README has a short, descriptive title.

- A brief explanation of the repository’s purpose

Not yet: There is a very brief explanation of the repo's purpose, but it can be expanded on a bit more.

- A concise description of what’s housed in the repository

Not yet: The description of what's housed in the repo has a good start, and I see it's unfinished, so adding on to it a bit more would be nice.

- Details regarding data access

Not yet: There are not yet any details on how the data for this analysis was accessed.

- A list of authors or current contributors (for collaborative work)

Not yet: There are no authors or contributors listed yet.

- References

Not yet: There are no references listed yet.


#### Code follows a professional style
- All code files follow a consistent style (the Air formatter automates this).

Meets spec: The code does follow a consistent, professional style (except for comments, mentioned below).

- The code has an appropriate amount of comments.

Not yet: The moving_average file has an appropriate amount of comments, but it would be helpful to add comments to the paper Quarto and to 1_clean_data file.
