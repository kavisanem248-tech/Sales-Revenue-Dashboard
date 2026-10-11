# Sales & Revenue Analysis Dashboard: Project Guide

## IMPORTANT: what is and is not in this package
- **No `.pbix` file is included.** A `.pbix` can only be created by Power BI Desktop (Windows). I cannot generate one, and I did not fake one.
- **Included instead (the closest working alternative):**

| File | What it is |
|---|---|
| `Sales_Dashboard_Preview.html` | A **working interactive dashboard** built from your real data (open in any browser). It shows the exact design, layout and filter behaviour to copy. It is NOT a Power BI file. |
| `LoadData.m` | Power Query script that loads your "Sales Data" sheet with correct data types |
| `Measures.dax` | The 6 DAX measures |
| `Sales_Dashboard_Theme.json` | Navy / blue / light-blue / white theme to import in Power BI |
| `Validation_Report.md` | Proof that figures match your Excel summary sheets (all checks passed) |

The Power BI report itself must still be assembled by you in Power BI Desktop (about 30-40 minutes using the steps below).

## Build the .pbix (Power BI Desktop)
1. **Load data:** Home > Get Data > Excel workbook > tick only **Sales Data** > Transform Data. (Or paste `LoadData.m` via Blank Query > Advanced Editor and edit the file path.) Close & Apply.
2. **Apply theme:** View > Themes > Browse for themes > choose `Sales_Dashboard_Theme.json`.
3. **Add measures:** paste each line from `Measures.dax` using New measure. Format Sales/Profit/AOV as currency (Rs) and Profit Margin % as percentage.
4. **Sort months chronologically:** Data view > click `Month Name` > Column tools > Sort by column > **Month**.
5. **Add visuals** (canvas 1280 x 720, Insert > Shapes > Rectangle in navy `#0B2A5B` for the header):

| Visual | Fields | Position (x, y, w, h) |
|---|---|---|
| Header text | "Sales & Revenue Analysis Dashboard" (white on navy) | 0, 0, 1280, 56 |
| 4 Slicers (Order Date = Between; Region, Category, Product = Dropdown) | `Order Date`, `Region`, `Category`, `Product` | left column x=10, width 190, stacked from y=70 |
| 6 Cards | Total Sales, Total Profit, Total Orders, Total Quantity Sold, Average Order Value, Profit Margin % | y=70, h=80, each w=170, from x=215 |
| Line chart | X `Month Name` (or `Year-Month`), Y `Total Sales` | 215, 165, 620, 250 |
| Donut chart | Legend `Category`, Values `Total Sales` | 850, 165, 420, 250 |
| Clustered bar | Y `Product`, X `Total Sales`; Filters pane: Product > Top N > Top 5 by `Total Sales` | 215, 430, 340, 270 |
| Clustered column | X `Region`, Y `Total Sales` | 565, 430, 340, 270 |
| Clustered bar | Y `Salesperson`, X `Total Sales` + `Total Profit` | 915, 430, 355, 270 |
| Table | `Year-Month`, `Total Sales`, `Total Profit`, `Total Quantity Sold`, `Total Orders` | place on a second page "Monthly Summary", or shrink the charts above |

6. **Slicers filter all visuals automatically** because every visual uses the same table. Test: choose Region = Madurai and check that all cards and charts change.
7. **Validate:** with no filters, the cards must equal the table in `Measures.dax`.
8. **Save:** File > Save as > `Sales_Revenue_Dashboard.pbix`.

## Using the HTML preview
Open it in a browser. Use the left filters (date range, Region, Category, Product), or click any bar/column/legend item to filter. "Reset filters" clears everything. Its Key Insights box recalculates for whatever is selected.

## Data notes
- Source: sheet "Sales Data", 100 orders, 1 Jan to 28 Sep 2026 (September is partial).
- Your uploaded file name is `kavi_intern_1st_project.xlsx` (underscores).
- Do not import the summary sheets; Power BI recalculates them from Sales Data.
