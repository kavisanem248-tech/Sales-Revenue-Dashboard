// Power Query (M) script. Use: Home > Get Data > Blank Query > Advanced Editor > paste this.
// Change FilePath to where your Excel file is saved on YOUR computer.
let
    FilePath = "C:\Users\YourName\Documents\kavi_intern_1st_project.xlsx",
    Source   = Excel.Workbook(File.Contents(FilePath), null, true),
    Sheet    = Source{[Item = "Sales Data", Kind = "Sheet"]}[Data],
    Headers  = Table.PromoteHeaders(Sheet, [PromoteAllScalars = true]),
    Typed    = Table.TransformColumnTypes(Headers, {
        {"Order ID", type text}, {"Order Date", type date}, {"Product", type text},
        {"Category", type text}, {"Region", type text}, {"Salesperson", type text},
        {"Quantity", Int64.Type}, {"Unit Price", type number}, {"Sales", type number},
        {"Profit", type number}, {"Year", Int64.Type}, {"Month", Int64.Type},
        {"Month Name", type text}, {"Year-Month", type text}, {"Profit Margin %", type number}
    })
in
    Typed
