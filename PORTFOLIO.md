# טקסטים לתיק העבודות ב-Upwork

ב-Upwork כל פרויקט בתיק מקבל כותרת, תפקיד, תיאור, כישורים ותמונות. הנה שני הפרויקטים מוכנים להעתקה.

---

## פרויקט 1

**Title:**
```
AI Invoice Data Extraction API (FastAPI + LLM)
```

**Your role:**
```
Backend developer – design, implementation, testing
```

**Project description:**
```
Problem: Finance teams retype vendor names, dates and totals from invoice PDFs into spreadsheets by hand – slow and error-prone, especially with Hebrew and English documents mixed together.

Solution: A FastAPI service that accepts a PDF or image and returns clean, structured JSON (vendor, tax ID, invoice number, date, currency, subtotal, VAT, total, line items). It reads the PDF text layer when available and falls back to vision for scanned documents. Every result is cross-checked: if subtotal + VAT doesn't match the total or line items don't add up, the response carries a warning instead of silently returning bad numbers.

Tech: Python, FastAPI, Pydantic, OpenAI / Claude (switchable via config), pypdf, Docker, pytest (18 automated tests).
```

**Skills (מקסימום 5):** FastAPI, Python, API Integration, OpenAI API, Data Extraction

**תמונות מומלצות:**
1. דף ההעלאה עם תוצאה (שדות + JSON)
2. מסך Swagger ב-`/docs`
3. דיאגרמת הזרימה מה-README

---

## פרויקט 2

**Title:**
```
Invoice Automation: Email → AI Extraction → Google Sheets → Slack (n8n)
```

**Your role:**
```
Automation developer – workflow design, integration, testing
```

**Project description:**
```
Problem: Invoices arrive by email and someone has to open each one, copy the details into a spreadsheet, and catch mistakes.

Solution: An n8n workflow that watches Gmail for invoice attachments (or takes uploads through a web form), sends each file to my AI extraction API, appends a row to Google Sheets, and alerts Slack only when the API flags a problem. Clean invoices flow through with no human involved; people only look at the exceptions.

Built so the client can change it: extraction and validation live in tested Python code, while the n8n workflow handles routing – any trigger (Gmail, Outlook, Drive, webhook) can be swapped in without touching the rest.

Tech: n8n, FastAPI, OpenAI / Claude, Gmail API, Google Sheets API, Slack API, Docker Compose.
```

**Skills (מקסימום 5):** n8n, Automation, API Integration, Google Sheets, Artificial Intelligence

**תמונות מומלצות:**
1. הקנבס של n8n עם כל התהליך
2. הגיליון עם כמה שורות, כולל שורה אחת עם NEEDS REVIEW
3. הודעת ההתראה בסלאק
