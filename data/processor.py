import xlrd
# Load data
loc = ("lyricsForJava.xlsx")
loveWords = ["love","baby","like","hug","miss","kiss","beautiful","dance","soul","shine","honey","without you","loving",
             "friends","smiling","touch","us","good","your side","care","heart"]

# To open Workbook
wb = xlrd.open_workbook(loc)
sheet = wb.sheet_by_index(0)
sheet.cell_value(0, 0)
eminem,fiftycent, britney, coldplay, celine, beyonce = 0,0,0,0,0,0
eminem_total,fiftycent_total, britney_total, coldplay_total, celine_total, beyonce_total = 0,0,0,0,0,0
eminem_rows,fiftycent_rows, britney_rows, coldplay_rows, celine_rows, beyonce_rows = 0,0,0,0,0,0

for row in range(sheet.nrows):
    if sheet.cell_value(row, 3) == 'eminem':
        eminem_total += len(sheet.cell_value(row, 5).split())
        eminem_rows += 1
    elif sheet.cell_value(row, 3) == '50-cent':
        fiftycent_total += len(sheet.cell_value(row, 5).split())
        fiftycent_rows += 1
    elif sheet.cell_value(row, 3) == 'britney-spears':
        britney_total += len(sheet.cell_value(row, 5).split())
        britney_rows += 1
    elif sheet.cell_value(row, 3) == 'coldplay':
        coldplay_total += len(sheet.cell_value(row, 5).split())
        coldplay_rows += 1
    elif sheet.cell_value(row, 3) == 'celine-dion':
        celine_total += len(sheet.cell_value(row, 5).split())
        celine_rows += 1
    elif sheet.cell_value(row, 3) == 'beyonce':
        beyonce_total += len(sheet.cell_value(row, 5).split())
        beyonce_rows += 1
    if any(word in sheet.cell_value(row, 5) for word in loveWords):
        if sheet.cell_value(row, 3) == 'eminem':
            eminem += sum(sheet.cell_value(row, 5).lower().count(word) for word in loveWords)
        elif sheet.cell_value(row, 3) == '50-cent':
            fiftycent += 1
        elif sheet.cell_value(row, 3) == 'britney-spears':
            britney += 1
        elif sheet.cell_value(row, 3) == 'coldplay':
            coldplay += 1
        elif sheet.cell_value(row, 3) == 'celine-dion':
            celine += 1
        elif sheet.cell_value(row, 3) == 'beyonce':
            beyonce += sum(sheet.cell_value(row, 5).lower().count(word) for word in loveWords)
print("Percentage of love words usage:")
print("Beyonce: {}").format(float(beyonce)/beyonce_total)
print("Eminem: {}").format(float(eminem)/eminem_total)
print("50-Cent: {}").format(float(fiftycent)/fiftycent_total)
print("Coldplay: {}").format(float(coldplay)/coldplay_total)
print("Celine: {}").format(float(celine)/celine_total)
print("Britney Spears: {}").format(float(britney)/britney_total)
print("Total songs:")
print("Beyonce: {}").format(beyonce_rows)
print("Eminem: {}").format(eminem_rows)
print("50-Cent: {}").format(fiftycent_rows)
print("Coldplay: {}").format(coldplay_rows)
print("Celine: {}").format(celine_rows)
print("Britney Spears: {}").format(britney_rows)