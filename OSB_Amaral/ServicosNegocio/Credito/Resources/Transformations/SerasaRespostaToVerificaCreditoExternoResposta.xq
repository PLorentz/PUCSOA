(:: pragma bea:global-element-parameter parameter="$resultadoSerasa" element="ns1:ResultadoSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)
(:: pragma bea:global-element-return element="ns2:resultadoVerificaCreditoExterno" location="../../../../ESB/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://serasa.com.br/SN/Serasa";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Amaral";
declare namespace xf = "http://tempuri.org/OSB_Amaral/ServicosNegocio/Credito/Resources/Transformations/SerasaRespostaToVerificaCreditoExternoResposta/";

declare function xf:SerasaRespostaToVerificaCreditoExternoResposta($resultadoSerasa as element(ns1:ResultadoSerasa))
    as element(ns2:resultadoVerificaCreditoExterno) {
        <ns2:resultadoVerificaCreditoExterno>
            <ns2:credito>
                <ns0:pessoa>
                    <ns0:cpf>{ data($resultadoSerasa/ns1:num_documento) }</ns0:cpf>
                </ns0:pessoa>
                <ns0:valorRestricao>{ data($resultadoSerasa/ns1:valor_restricao) }</ns0:valorRestricao>
            </ns2:credito>
        </ns2:resultadoVerificaCreditoExterno>
};

declare variable $resultadoSerasa as element(ns1:ResultadoSerasa) external;

xf:SerasaRespostaToVerificaCreditoExternoResposta($resultadoSerasa)
