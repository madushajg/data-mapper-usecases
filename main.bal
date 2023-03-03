public type Invoice record {
    InvoiceItem[] invoice_items?;
    int id?;
    int client_id?;
};

public type InvoiceItem record {
    string price?;
    string title?;
    int quantity?;
    boolean taxable?;
    int id?;
};

public type InvoiceCreateObject record {
    anydata[] Line;
    ReferenceType CustomerRef;
};

public type ReferenceType record {
    string value?;
    string name?;
};

isolated function clientaryInvoiceToQuickBooksInvoice(Invoice invoice) returns InvoiceCreateObject|error =>
{
    CustomerRef: {
        value: check getId(invoice.id, invoice.client_id)
    },
    Line: from var invoiceItem in invoice.invoice_items ?: []
        let int quantity = invoiceItem.quantity ?: 0
        let string price = invoiceItem.price ?: "0.0"
        select {
            DetailType: "SalesItemLineDetail",
            Description: invoiceItem.title ?: "",
            SalesItemLineDetail: {
                Qty: invoiceItem.quantity ?: 0,
                UnitPrice: invoiceItem.price ?: ""
            }
        }
};

isolated function getId(int? clientaryInvoiceId, int? clientaryClientId) returns string|error {
    return "";
}
