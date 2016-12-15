(:: pragma bea:global-element-parameter parameter="$parametrosVerificaWhiteList" element="ns1:parametrosVerificaWhiteList" location="../../../../ESB/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns2:ParametrosWhiteList" location="../Interfaces/Schemas/InternalWhiteList.xsd" ::)

declare namespace ns2 = "http://whitelist.com.br/SN/WhiteList";
declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Amaral";
declare namespace xf = "http://tempuri.org/OSB_Amaral/ServicosNegocio/Credito/Resources/Transformations/VerificaWhiteListParametroToInternalWhiteListParametro/";

declare function xf:VerificaWhiteListParametroToInternalWhiteListParametro($parametrosVerificaWhiteList as element(ns1:parametrosVerificaWhiteList))
    as element(ns2:ParametrosWhiteList) {
        <ns2:ParametrosWhiteList>
            <ns2:num_documento>{ data($parametrosVerificaWhiteList/ns1:pessoa/ns0:cnpj) }</ns2:num_documento>
        </ns2:ParametrosWhiteList>
};

declare variable $parametrosVerificaWhiteList as element(ns1:parametrosVerificaWhiteList) external;

xf:VerificaWhiteListParametroToInternalWhiteListParametro($parametrosVerificaWhiteList)
