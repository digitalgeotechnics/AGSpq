# About
Base power query M scripts which allow reading of an AGS4 data file.  Using power query makes allows AGS data to transformed and dashboarded directly from several apps including MS Excel, Power BI, and cloud Dataverse Dataflows.

# Setup
The scripts are in power query M language.  They are not "installed" or "imported" - they need to be manually copied actoss to a blank pq query:
First launch the power query editor.  

Open the power query editor in MS Excel:
1. Open Excel
2. Data > Get Data > launch power query editor

Create a new parameter named `AGSfilePath`.  Set the value to be the path to an ags file on your computer

Add `SourceAGS` and `getGroupData` queries
1. New Query/New Source > Other Sources > Blank Query
2. Copy paste the code from the queries in this repo

To retrieve the data from a specific group/table within an AGS file:
1. select function `getGroupData`
2. enter a table name as a value for parameter `AGSgroupName`
3. hit "invoke"
