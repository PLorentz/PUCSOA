(:: pragma bea:global-element-parameter parameter="$resultadoCreditLegacy" element="ns1:ResultadoCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)
(:: pragma bea:global-element-return element="ns2:resultadoVerificaCreditoInterno" location="../../../../ESB/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns2 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace ns0 = "http://pucminas.br/MC/SOA/Amaral";
declare namespace xf = "http://tempuri.org/OSB_Amaral/ServicosNegocio/Credito/Resources/Transformations/CreditLegacyRespostaToVerificaCreditoInternoResposta/";

declare function xf:CreditLegacyRespostaToVerificaCreditoInternoResposta($resultadoCreditLegacy as element(ns1:ResultadoCreditLegacy))
    as element(ns2:resultadoVerificaCreditoInterno) {
        <ns2:resultadoVerificaCreditoInterno>
            <ns2:credito>
                <ns0:pessoa>
                    <ns0:cpf>{ data($resultadoCreditLegacy/ns1:cpf) }</ns0:cpf>
                </ns0:pessoa>
                <ns0:quantidadeRestricoes>{ fn:count($resultadoCreditLegacy//*:restricao) }</ns0:quantidadeRestricoes>
                <ns0:valorRestricao>{ fn:sum($resultadoCreditLegacy//*:valor) }</ns0:valorRestricao>
            </ns2:credito>
        </ns2:resultadoVerificaCreditoInterno>
};

declare variable $resultadoCreditLegacy as element(ns1:ResultadoCreditLegacy) external;

xf:CreditLegacyRespostaToVerificaCreditoInternoResposta($resultadoCreditLegacy)
