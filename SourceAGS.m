//loads an ags file from disk
//expects an existing parameter named AGSFilePath

let
    Source = Table.FromColumns({Lines.FromBinary(File.Contents(AGSfilePath), null, null, 1252)})
in
    Source
