<?xml version="1.0" encoding="utf-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:inv="http://laphoadon.gdt.gov.vn/2014/09/invoicexml/v1"
               xmlns:ds="http://www.w3.org/2000/09/xmldsig#"
               version="1.0">
    <xsl:strip-space elements="*"/>
    <xsl:decimal-format grouping-separator="."/>
    <xsl:template match="inv:invoice">
        <html>
        <head>
            <title>HÓA ĐƠN DỊCH VỤ VIỄN THÔNG (GTGT)</title>
        </head >
        <body>
        <table ALIGN="center" style="margin-left:auto;margin-right:auto;border: 3px solid #00919F;border-collapse: collapse;">
            <tr>
                <td align="center">
                    <img src="logo.png" align = "middle"></img>
                </td>
                <td width="60%" align = "center"  style="font-weight:bold; font-size:18px;color: #00919F;vertical-align:top">
                    <xsl:value-of select="inv:invoiceData/inv:invoiceName"/>
                    <br/>
                    <font style="font-style: italic; font-size:16px;color: #00919F">BẢN THỂ HIỆN CỦA HÓA ĐƠN ĐIỆN TỬ</font>
                </td>
                <td width="20%" style = "vertical-align:top;">
                    <table align="right" cellspacing="0" cellpadding="0" border="0" width="170px" style="vertical-align:top;font-weight:bold; border-right: #00919F 1px solid; border-top: #00919F 1px solid; border-left: #00919F 1px solid; border-bottom: #00919F 1px solid">
                        <tr style = "vertical-align:top">
                            <td align="left" style="font-weight:bold; vertical-align:top; color: #00919F;">Mẫu số:</td>
                            <td align="left" style="font-weight:bold; vertical-align:top; color: #00919F;">
                                <xsl:value-of select="inv:invoiceData/inv:templateCode"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="font-weight:bold; vertical-align:top;color: #00919F;">Ký hiệu:</td>
                            <td align="left" style="font-weight:bold;vertical-align:top;color: #00919F;">
                                <xsl:value-of select="inv:invoiceData/inv:invoiceSeries"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="font-weight:bold; vertical-align:top;color: #00919F;">Số:</td>
                            <td align="left" style="font-weight:normal;vertical-align:top;">
                                <xsl:value-of select="inv:invoiceData/inv:invoiceNumber"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="font-weight:bold; vertical-align:top;color: #00919F;">Ngày lập:</td>
                            <td align="left" style="font-weight:normal;">
                                <xsl:value-of select="concat(substring(inv:invoiceData/inv:invoiceIssuedDate, 9, 2),'/',substring(inv:invoiceData/inv:invoiceIssuedDate, 6, 2),'/',substring(inv:invoiceData/inv:invoiceIssuedDate, 1, 4))"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="font-size:14px;">
                    <table>
                        <tr>
                            <td style="font-weight:bold;color: #00919F;">
                                <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerLegalName"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="color: #00919F;">
                                <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerAddressLine"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="">
                    <table>
                        <tr>
                            <td>
                                <font style = "color: #00919F;">Mã số thuế:</font>
                                <font style = "font-weight:bold;color: #00919F;">
                                    <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerTaxCode"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!--<tr>
                <td colspan="3" style="">
                    <table width = "100%">
                        <tr>
                            <td style = "width: 50%">Số TK: <font style = "font-weight:bold">
                                    <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerBankName"/>
                                </font>
                            </td>
                            <td >Tại ngân hàng: <font style = "font-weight:bold">
                                    <xsl:value-of select="inv:invoiceData/inv:seller/inv:sellerBankAccount"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>-->
            <tr height="5px">
                <td colspan="3" height="5px" style = "color: #00919F;">
                    <hr size="2" color="#00919F"/>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="">
                    <table>
                        <tr>
                            <td colspan="3" style = "width: 50%">
                                <font style = "color: #00919F;">Đơn vị thu: </font>
                                <font style = "font-weight:bold">
                                    <xsl:value-of select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/collectionGroupName>'),'&lt;collectionGroupName>')"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table align="left" style = "width:100%">
                        <tr>
                            <td align="left" style = "width: 50%" >
                                <font style = "color: #00919F;">Tên khách hàng: </font>
                                <font style = "font-weight:bold">
                                    <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerDisplayName"/>
                                </font>
                            </td>
                            <td align="left" style="">
                                <font style = "color: #00919F;">Mã số thuế: </font>
                                <font style = "font-weight:bold">
                                    <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerTaxCode"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table align="left" width = "100%">
                        <tr>
                            <td style = "width: 50%">
                                <font style = "color: #00919F;">Tên đơn vị: </font>
                                <xsl:variable name="buyerUnitName" select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/buyerUnitName>'),'&lt;buyerUnitName>')"/>
                                <xsl:if test="$buyerUnitName != 'null'">
                                    <font style="font-weight: bold">
                                        <xsl:value-of select="$buyerUnitName"/>
                                    </font>
                                </xsl:if>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table align="left" width = "100%">
                        <tr>
                            <td style = "width: 50%">
                                <font style = "color: #00919F;">Địa chỉ: </font>
                                <font style="font-weight: bold">
                                    <xsl:value-of select="inv:invoiceData/inv:buyer/inv:buyerAddressLine"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table align="left" width = "100%">
                        <tr>
                            <td align="left" style = "width: 50%">
                                <xsl:variable name="feeType" select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/feeType>'),'&lt;feeType>')"/>	<!--bo sung 17/02/2016-->
                                <font style = "color: #00919F;">Số thuê bao:</font>
                                <font style = "font-weight:bold">
                                    <xsl:choose>
                                        <xsl:when test="$feeType = 2"><!--bo sung 17/02/2016-->
                                            <xsl:value-of select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/subscriberNumber>'),'&lt;subscriberNumber>')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="subscriberNumber" select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/subscriberNumber>'),'&lt;subscriberNumber>')"/>
                                            <xsl:if test="$subscriberNumber != ''">
                                                Đại diện (<xsl:value-of select="$subscriberNumber"/>)
                                            </xsl:if>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </font>
                            </td>
                            <td align="left" style="">
                                <xsl:variable name="feeType" select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/feeType>'),'&lt;feeType>')"/>
                                <xsl:variable name = "adjustmentType" select = "inv:invoiceData/inv:adjustmentType"/>
                                <xsl:variable name = "billCycleStart" select = "substring(substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/billCycleStartDate>'),'&lt;billCycleStartDate>'),4,7)"/>
                                <xsl:variable name = "billCycleEnd" select = "substring(substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/billCycleEndDate>'),'&lt;billCycleEndDate>'),4,7)"/>
                                <xsl:variable name="prepaidDuration" select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/prepaidDuration>'),'&lt;prepaidDuration>')"/>
                                <xsl:choose>
                                    <xsl:when test="$feeType = 1">
                                        <font style = "color: #00919F;">Kỳ cước: </font>
                                        <font style = "font-weight:bold">Cước đóng trước</font>
                                    </xsl:when>
                                    <xsl:when test="$feeType = 2">
                                        <font style = "color: #00919F;">Kỳ cước:</font>
                                        <font style = "font-weight:bold">Cước đóng trước </font>
                                        <font style = "font-weight:bold">
                                            <xsl:value-of select="$prepaidDuration"/>
                                        </font>
                                    </xsl:when>
                                    <xsl:when test="$feeType = 3">
                                        <font style = "color: #00919F;">Kỳ cước:</font>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test="$adjustmentType = 5">
                                                <font style = "font-weight:normal;color: #00919F;">Kỳ cước: </font>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:choose>
                                                    <xsl:when test="$billCycleStart = 'null' and $billCycleEnd = 'null'">
                                                        <font style = "color: #00919F;">Kỳ cước:</font>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:choose>
                                                            <xsl:when test="$billCycleStart = $billCycleEnd">
                                                                <font style = "color: #00919F;">Kỳ cước:</font>
                                                                <font style = "font-weight:bold">
                                                                    Tháng <xsl:value-of select="$billCycleEnd"/>
                                                                </font>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <font style = "color: #00919F;">Kỳ cước:</font>
                                                                <font style = "font-weight:bold">
                                                                    Từ tháng <xsl:value-of select="$billCycleStart"/>
                                                                    đến tháng <xsl:value-of select="$billCycleEnd"/>
                                                                </font>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table align="left" width = "100%">
                        <tr>
                            <td align="left" style = "width: 50%" >
                                <font style = "color: #00919F;">Số hợp đồng: </font>
                                <font style = "font-weight:bold">
                                    <xsl:value-of select="inv:invoiceData/inv:contractNumber"/>
                                </font>
                            </td>
                            <td align="left">
                                <font style = "color: #00919F;">Hình thức thanh toán: </font>
                                <font style = "font-weight:bold">
                                    <xsl:value-of select="inv:invoiceData/inv:payments/inv:payment/inv:paymentMethodName"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <table width="100%" style="border: 1px solid #006699;border-collapse: collapse;">
                        <tr width="100%">
                            <th width="5%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">STT</th>
                            <th width="35%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">DIỄN GIẢI</th>
                            <th width="12%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">SỐ LƯỢNG TB</th>
                            <th width="12%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">TIỀN DỊCH VỤ</th>
                            <th width="13%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">THUẾ SUẤT(%)</th>
                            <th width="10%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">TIỀN THUẾ</th>
                            <th align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;" >CỘNG</th>
                        </tr>
                        <tr width="100%">
                            <th width="5%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">a</th>
                            <th width="35%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">b</th>
                            <th width="12%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">c</th>
                            <th width="12%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">1</th>
                            <th width="13%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">2</th>
                            <th width="10%" align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">3=1x2</th>
                            <th  align="center" style="border: 1px solid #006699;border-collapse: collapse;color: #00919F;">4=1+3</th>
                        </tr>
                        <xsl:for-each select="inv:invoiceData/inv:items/inv:item">
                            <tr>
                                <td align="center" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                    <xsl:value-of select="inv:lineNumber"/>
                                </td>
                                <td align="left" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                    <xsl:value-of select="inv:itemName"/>
                                </td>
                                <td align="center" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                    <xsl:choose>
                                        <xsl:when test="inv:quantity = null">
                                            <xsl:value-of select="inv:quantity"/>
                                        </xsl:when>
                                        <xsl:when test="string-length(inv:quantity) = 1">
                                            0<xsl:value-of select="inv:quantity"/>
                                        </xsl:when>
                                        <xsl:when test="string-length(inv:quantity) > 1">
                                            <xsl:value-of select="inv:quantity"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="inv:quantity"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td align="right" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                    <xsl:if test="inv:itemTotalAmountWithoutVat != 'null' and inv:itemTotalAmountWithoutVat >= 0">
                                        <xsl:value-of select="format-number(inv:itemTotalAmountWithoutVat, '###.###')"/>
                                    </xsl:if>

                                </td>
                                <td align="right" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                    <!--<xsl:if test="inv:vatPercentage != 'null' and inv:vatPercentage > 0">-->
                                    <!--<xsl:value-of select="format-number(inv:vatPercentage, '###.###')"/>-->
                                    <!--</xsl:if>-->
                                    <xsl:choose>
                                        <xsl:when test="inv:vatPercentage != 'null' and inv:vatPercentage >= 0 ">
                                            <xsl:value-of select="format-number(inv:vatPercentage, '###.###')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            \
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td align="right" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                    <!--<xsl:if test="inv:vatAmount != 'null' and inv:vatAmount > 0">-->
                                    <!--<xsl:value-of select="format-number(inv:vatAmount, '###.###')"/>-->
                                    <!--</xsl:if>-->

                                    <xsl:choose>
                                        <xsl:when test="inv:vatAmount != 'null' and inv:vatAmount > 0 ">
                                            <xsl:value-of select="format-number(inv:vatAmount, '###.###')"/>
                                        </xsl:when>
                                        <xsl:when test="inv:vatAmount != 'null' and inv:vatAmount = 0 and inv:vatPercentage != 'null' and inv:vatPercentage >= 0 ">
                                            <xsl:value-of select="format-number(inv:vatAmount, '###.###')"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            \
                                        </xsl:otherwise>
                                    </xsl:choose>

                                </td>
                                <td align="right" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                    <xsl:if test="inv:itemTotalAmountWithoutVat != 'null' and inv:itemTotalAmountWithoutVat >= 0 and inv:vatAmount != 'null'">
                                        <!--<xsl:value-of select="format-number(inv:vatAmount+inv:itemTotalAmountWithoutVat, '###.###')"/>-->
                                        <xsl:choose>
                                            <xsl:when test="inv:vatAmount = null">
                                                <xsl:value-of select="format-number(inv:itemTotalAmountWithoutVat, '###.###')"/>
                                            </xsl:when>
                                            <xsl:when test="inv:vatAmount = ''">
                                                <xsl:value-of select="format-number(inv:itemTotalAmountWithoutVat, '###.###')"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number(inv:vatAmount+inv:itemTotalAmountWithoutVat, '###.###')"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td align="left" colspan="2" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                <font style = "font-weight: bold;color: #00919F;">CỘNG</font>
                            </td>
                            <td align="center" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                <!--<xsl:value-of select='sum(inv:invoiceData/inv:items/inv:item/inv:quantity)'/>-->
                                <!--<xsl:variable name = "sumQuantity" select = "sum(inv:invoiceData/inv:items/inv:item/inv:quantity)"/>-->
                                <!--<xsl:choose>-->
                                    <!--<xsl:when test="$sumQuantity = null">-->
                                    <!--</xsl:when>-->
                                    <!--<xsl:when test="$sumQuantity = 0">-->
                                    <!--</xsl:when>-->
                                    <!--<xsl:when test="string-length($sumQuantity) = 1 and $sumQuantity!=0">-->
                                        <!--0<xsl:value-of select="$sumQuantity"/>-->
                                    <!--</xsl:when>-->
                                    <!--<xsl:when test="string-length($sumQuantity) > 1">-->
                                        <!--<xsl:value-of select="$sumQuantity"/>-->
                                    <!--</xsl:when>-->
                                    <!--<xsl:otherwise>-->
                                        <!--<xsl:value-of select="$sumQuantity"/>-->
                                    <!--</xsl:otherwise>-->
                                <!--</xsl:choose>-->
                            </td>
                            <td align="right" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                <xsl:if test="inv:invoiceData/inv:sumOfTotalLineAmountWithoutVAT != 'null' and inv:invoiceData/inv:sumOfTotalLineAmountWithoutVAT > 0">
                                    <xsl:value-of select="format-number(inv:invoiceData/inv:sumOfTotalLineAmountWithoutVAT, '###.###')"/>
                                </xsl:if>
                            </td>
                            <td align="right" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                            </td>
                            <td align="right" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                <xsl:if test="inv:invoiceData/inv:totalVATAmount != 'null' and inv:invoiceData/inv:totalVATAmount > 0">
                                    <xsl:value-of select="format-number(inv:invoiceData/inv:totalVATAmount, '###.###')"/>
                                </xsl:if>
                            </td>
                            <td align="right" rowspan="2" style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                <xsl:if test="inv:invoiceData/inv:totalAmountWithVAT != 'null' and inv:invoiceData/inv:totalAmountWithVAT > 0">
                                    <xsl:value-of select="format-number(inv:invoiceData/inv:totalAmountWithVAT, '###.###')"/>
                                </xsl:if>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="6"  style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                <font style="font-weight:bold;color: #00919F;">TỔNG CỘNG TIỀN THANH TOÁN</font>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" colspan="7"  style="border: 1px solid #006699;border-collapse: collapse;cellpadding:5px 5px 5px 5px;">
                                <font style="font-weight:bold;color: #00919F;">SỐ TIỀN VIẾT BẰNG CHỮ:</font>
                                <font style="font-weight:bold;">
                                    <xsl:value-of select="inv:invoiceData/inv:totalAmountWithVATInWords"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="3" style="">
                    <table>
                        <tr>
                            <td colspan="3" style = "width: 50%">
                                <font style = "font-weight:bold; color: #00919F;">
                                    <xsl:value-of select="substring-after(substring-before(inv:invoiceData/inv:userDefines,'&lt;/vtciData>'),'&lt;vtciData>')"/>
                                </font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
        </body>
        </html>
    </xsl:template>
</xsl:transform>
