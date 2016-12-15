(:: pragma bea:global-element-parameter parameter="$resultadoWhiteList" element="ns2:ResultadoWhiteList" location="../Interfaces/Schemas/InternalWhiteList.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoVerificaWhiteList" location="../../../../ESB/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns2 = "http://whitelist.com.br/SN/WhiteList";
declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Amaral";
declare namespace xf = "http://tempuri.org/OSB_Amaral/ServicosNegocio/Credito/Resources/Transformations/InternalWhiteListRespostaToVerificaWhiteListResposta/";

declare function xf:InternalWhiteListRespostaToVerificaWhiteListResposta($resultadoWhiteList as element(ns2:ResultadoWhiteList))
    as element(ns1:resultadoVerificaWhiteList) {
        <ns1:resultadoVerificaWhiteList>
            <ns1:mensagemRetorno>
                <ns0:isAtivo>{ data($resultadoWhiteList/ns2:indica_white_list) }</ns0:isAtivo>
            </ns1:mensagemRetorno>
        </ns1:resultadoVerificaWhiteList>
};

declare variable $resultadoWhiteList as element(ns2:ResultadoWhiteList) external;

xf:InternalWhiteListRespostaToVerificaWhiteListResposta($resultadoWhiteList)
