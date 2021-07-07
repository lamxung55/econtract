using E_Contract.Models;
using System;
using System.IO;
using System.Web.Http;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.Xsl;

namespace E_Contract.Controllers
{
    public class EContractController : ApiController
    {
        [Route("CreateEContract")]
        public Response CreateEContract(CreateEContractRequest request)
        {
            Response res = new Response();
            res.ErrorCode = "0";
            res.ErrorDesc = ToXML(request.GetType(), request);
            File.WriteAllText("C:\\running_projects\\E-Contract\\myEContract.xml", res.ErrorDesc);
           
            try
            {
                //pdf.BindXml("C:\\running_projects\\E-Contract\\E-Contract\\E-Contract\\Template\\test.xml", "C:\\running_projects\\E-Contract\\E-Contract\\E-Contract\\Template\\test.xslt");
                ////Save the document
                //pdf.Save("C:\\running_projects\\E-Contract\\E-Contract\\E-Contract\\Template\\test.pdf");
                string xml = File.ReadAllText("C:\\running_projects\\E-Contract\\E-Contract\\E-Contract\\Template\\test.xml");
                string xslt = File.ReadAllText("C:\\running_projects\\E-Contract\\E-Contract\\E-Contract\\Template\\test.xslt");
                string html = TransformXMLToHTML(xml, xslt);
                File.WriteAllText("C:\\running_projects\\E-Contract\\E-Contract\\E-Contract\\Template\\out.html", html);

                res.ErrorDesc = html;
                /**
                PDF from HTML String
                anchor-create-a-pdf-with-an-html-string-in-net-c
                **/
                // Render any HTML fragment or document to HTML
                var Renderer = new IronPdf.HtmlToPdf();
                var PDF = Renderer.RenderHtmlAsPdf(html);
                var OutputPath = "C:\\running_projects\\E-Contract\\E-Contract\\E-Contract\\Template\\HtmlToPDF.pdf";
                PDF.SaveAs(OutputPath);
            }
            catch (Exception ex)
            {
                res.ErrorDesc = ex.Message;
                return res;
            }

            return res;
        }

        public static string TransformXMLToHTML(string inputXml, string xsltString)
        {
            XslCompiledTransform transform = new XslCompiledTransform();
            using (XmlReader reader = XmlReader.Create(new StringReader(xsltString)))
            {
                transform.Load(reader);
            }
            StringWriter results = new StringWriter();
            using (XmlReader reader = XmlReader.Create(new StringReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }
            return results.ToString();
        }


        public string ToXML(Type type, Object obj)
        {
            StringWriter sw = new StringWriter();
            XmlTextWriter tw = null;
            try
            {
                XmlSerializer serializer = new XmlSerializer(type);
                tw = new XmlTextWriter(sw);
                serializer.Serialize(tw, obj);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                sw.Close();
                if (tw != null)
                {
                    tw.Close();
                }
            }
            return sw.ToString();
        }
    }
}