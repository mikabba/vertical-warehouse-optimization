function report(f)
import mlreportgen.dom.*;
import mlreportgen.report.*;
rpt = Report("myreport","pdf");
open(rpt);
if strcmpi(rpt.Type,"pdf")
    pageLayoutObj = PDFPageLayout;
else
    pageLayoutObj = DOCXPageLayout;
end
pageLayoutObj.PageSize.Orientation = "landscape";
pageLayoutObj.PageSize.Height = "8.5in";
pageLayoutObj.PageSize.Width = "11in";
pageLayoutObj.PageMargins.Top = "0.5in";
pageLayoutObj.PageMargins.Bottom = "0.5in";
pageLayoutObj.PageMargins.Left = "0.5in";
pageLayoutObj.PageMargins.Right = "0.5in";

pageLayoutObj.PageMargins.Header = "0.3in";
pageLayoutObj.PageMargins.Footer = "0.3in";
add(rpt,pageLayoutObj);
centerFigure(f,rpt);
delete(f);
rptview(rpt);
close(rpt);

end

