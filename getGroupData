//returns the data table belonging to a group with:
//  * the GROUP, TYPE, and UNIT rows removed
//  * the columns renamed according to the HEADING row
//
// Parameters:
//  * renameHeaders will replace the AGS heading name with the heading description
//  * keysonly will return only the key fields as defined in the dictionary

(AGSgroupName as text, optional LOCAfilter as list, optional keysonly as logical) => 
let
    //Load AGS file from disc
    Source = SourceAGS,

    //find start of required table/group by looking for a row with syntax "GROUP","SAMP"
    Position=Table.PositionOf(Source,[Column1="""GROUP"",""" & AGSgroupName & """"]),
    SubTable=Table.Range(Source,Position),

    //the end of the table will be the next blank line that is found, thus we can isolate the desired table
    EndOfGroup=Table.PositionOf(SubTable,[Column1=""]),
    TargetGroup=Table.FirstN(SubTable,EndOfGroup),

    //we can now discard the first row
    RemoveGroupHeader = Table.Skip(TargetGroup,1),

    //split columns by delimiter and rename columns
    Split = Table.SplitColumn(RemoveGroupHeader, "Column1", Splitter.SplitTextByDelimiter(",", QuoteStyle.Csv)),
    PromoteHeaders = Table.PromoteHeaders(Split, [PromoteAllScalars=true]),
    
    //Select only the rows defined as data
    RefineRows = Table.RemoveColumns(Table.SelectRows(PromoteHeaders, each [HEADING]="DATA"),"HEADING"),
    RefineRowsByLOCA =
        if not (LOCAfilter = null) then 
            Table.SelectRows(RefineRows, each List.Contains(LOCAfilter, [LOCA_ID]))
        else
            RefineRows,
    RefineColumns = 
        if keysonly = true then
            Table.SelectColumns(RefineRowsByLOCA, getGroupKeysAsList(AGSgroupName))
        else
            RefineRowsByLOCA,
    TheData = RefineColumns
        
in
    TheData
