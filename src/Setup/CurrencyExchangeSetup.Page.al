page 50103 "Demo Currency Exchange Setup"
{
    Caption = 'Currency Exchange Setup';
    PageType = Card;
    SourceTable = "Demo Currency Exchange Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Converter; Rec."Currency Converter")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then
            Rec.Insert();
    end;
}
