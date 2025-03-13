/*
SCRIPT DE LIMPEZA DE PROCESSOS, DOCUMENTOS E OPERAÇÕES DE USUÁRIOS DA BASE DE DADOS DO SEI 4.0.0 (PostgresSQL)    
	Antes de executar o script:
		1) Retirar o sistema do "AR" (derrubar todas sessões).
		2) Fazer uma cópia da base imediatamente antes de executar o script.
		3) Executar o script de limpeza. Se der erro, restaurar a base com a cópia feita no passo 2.
	
	Depois de executar o script com sucesso, sendo aconselhável conferir algumas tabelas abaixo e sequenciais de protocolo de processo na tabela "infra_sequencia":
		1) Apagar todos os arquivos e estrutura de pastas no Filesystem do SEI.
		2) Excluir os índices do Solr, conforme orientado no final do capítulo do Solr no Manual de Instalação do SEI:
			18 - Caso,  no  futuro,  seja  preciso  reindexar  todos  os  dados  é  aconselhável  limpar  antes  os  índices usando os comandos abaixo:
				http://[servidor_solr]:8080/solr/sei-protocolos/update?stream.body=<delete><query>*:*</query></delete>&commit=true
				http://[servidor_solr]:8080/solr/sei-bases-conhecimento/update?stream.body=<delete><query>*:*</query></delete>&commit=true
				http://[servidor_solr]:8080/solr/sei-publicacoes/update?stream.body=<delete><query>*:*</query></delete>&commit=true
		4) Colocar o sistema de volta ao "AR".
*/



/* Limpeza de tabelas afetas a Protocolo de Processos, de Documentos Gerados e Externos e de Operações dos Usuários */

/*SET FOREIGN_KEY_CHECKS=0;*/

DROP FUNCTION fc_habilitar_triggers;

CREATE FUNCTION fc_habilitar_triggers( nome_schema TEXT, habilitar BOOLEAN )
RETURNS VOID AS 
$BODY$
DECLARE
    tbl RECORD;
BEGIN
    FOR tbl IN SELECT schemaname || '.' || tablename AS nome FROM pg_tables WHERE schemaname = nome_schema
    LOOP
        IF ( habilitar = TRUE ) THEN
            EXECUTE 'ALTER TABLE ' || tbl.nome || ' ENABLE TRIGGER ALL';
        ELSE
            EXECUTE 'ALTER TABLE ' || tbl.nome || ' DISABLE TRIGGER ALL';
        END IF;
    END LOOP;

    RETURN;
END;
$BODY$
LANGUAGE 'plpgsql';


SELECT fc_habilitar_triggers('public', FALSE );

delete from anexo;
select setval('seq_anexo',1);

delete from numeracao;
select setval('seq_numeracao',1);

delete from acesso;
select setval('seq_acesso',1);

delete from acesso_externo;
select setval('seq_acesso_externo',1);

delete from acompanhamento;
select setval('seq_acompanhamento',1);

delete from grupo_acompanhamento;
select setval('seq_grupo_acompanhamento',1);

delete from andamento_situacao;
select setval('seq_andamento_situacao',1);

delete from anotacao;
select setval('seq_anotacao',1);

delete from assinatura;
select setval('seq_assinatura',1);

delete from estatisticas;
select setval('seq_estatisticas',1);

delete from base_conhecimento;
select setval('seq_base_conhecimento',1);

delete from rel_base_conhec_tipo_proced;

delete from versao_secao_documento;
select setval('seq_versao_secao_documento',1);

delete from secao_documento;
select setval('seq_secao_documento',1);

delete from atributo_andamento;
select setval('seq_atributo_andamento',1);

delete from retorno_programado;
select setval('seq_retorno_programado',1);

delete from participante;
select setval('seq_participante',1);

delete from observacao;
select setval('seq_observacao',1);

delete from rel_protocolo_assunto;

delete from rel_protocolo_protocolo;
select setval('seq_rel_protocolo_protocolo',1);

delete from publicacao;
select setval('seq_publicacao',1);

delete from rel_bloco_protocolo;

delete from rel_bloco_unidade;

delete from protocolo_modelo;
select setval('seq_protocolo_modelo',1);

delete from grupo_protocolo_modelo;
select setval('seq_grupo_protocolo_modelo',1);

delete from unidade_publicacao;
select setval('seq_unidade_publicacao',1);

delete from serie_escolha;

delete from serie_publicacao;
select setval('seq_serie_publicacao',1);

delete from texto_padrao_interno;
select setval('seq_texto_padrao_interno',1);

delete from rel_protocolo_atributo;

delete from feed;
select setval('seq_feed',1);

delete from velocidade_transferencia;

select setval('seq_atributo_andamento_situaca',1);

delete from auditoria_protocolo;
select setval('seq_auditoria_protocolo',1);

delete from rel_notificacao_documento;

delete from notificacao;

delete from bloco;
select setval('seq_bloco',1);

delete from atividade;
select setval('seq_atividade',1);

delete from documento;
select setval('seq_documento',1);

delete from procedimento;

delete from tipo_procedimento_escolha;

delete from protocolo;
select setval('seq_protocolo',1);

delete from email_grupo_email;
select setval('seq_email_grupo_email',1);

delete from grupo_email;
select setval('seq_grupo_email',1);

delete from acao_federacao;

delete from acesso_federacao;

delete from andamento_instalacao;
select setval('seq_andamento_instalacao',1);

delete from andamento_marcador;
select setval('seq_andamento_marcador',1);

select setval('seq_andamento_situacao',1);

delete from arquivamento;

delete from atributo_instalacao;
select setval('seq_atributo_instalacao',1);

delete from campo_pesquisa;
select setval('seq_campo_pesquisa',1);

delete from categoria;
select setval('seq_categoria',1);

delete from comentario;
select setval('seq_comentario',1);

delete from controle_prazo;
select setval('seq_controle_prazo',1);

delete from documento_conteudo;

delete from grupo_bloco;
select setval('seq_grupo_bloco',1);

delete from grupo_federacao;
select setval('seq_grupo_federacao',1);

delete from instalacao_federacao;

delete from lembrete;
select setval('seq_lembrete',1);

delete from marcador;
select setval('seq_marcador',1);

delete from monitoramento_servico;
select setval('seq_monitoramento_servico',1);

delete from orgao_federacao;

delete from parametro_acao_federacao;

delete from pesquisa;
select setval('seq_pesquisa',1);

delete from protocolo_federacao;

delete from rel_acesso_ext_protocolo;

delete from rel_acesso_ext_serie;

delete from rel_grupo_fed_orgao_fed;

delete from rel_usuario_grupo_acomp;

delete from rel_usuario_grupo_bloco;

delete from rel_usuario_marcador;

delete from rel_usuario_tipo_proced;

delete from rel_usuario_usuario_unidade;

delete from replicacao_federacao;

delete from sinalizacao_federacao;

delete from unidade_federacao;

delete from usuario_federacao;



/* Se no banco a ser limpo tenha Grupos de E-mail Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de E-mail dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_email where sta_tipo='U';
*/

delete from grupo_unidade;
select setval('seq_grupo_unidade',1);

/* Se no banco a ser limpo tenha Grupos de Envio Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de Envio dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_unidade where sta_tipo='U';
*/



/* Reconstrui as tabelas de log e auditoria e tabelas sequenciais correspondentes */
delete from infra_auditoria;
select setval('seq_infra_auditoria',1);

delete from infra_log;
select setval('seq_infra_log',1);

delete from infra_navegador;
select setval('seq_infra_navegador',1);

delete from infra_dado_usuario;

SELECT fc_habilitar_triggers('public', TRUE );

/*SET FOREIGN_KEY_CHECKS=1;*/


/* Sobre a última linha abaixo, de acordo com a configuração da fórmula de numeração de protocolo de processo, a tabela de sequência anual de processos pode ser qualquer um dos formatos abaixo:
	seq_[ano]_org_sip_[id sip]
	seq_[ano]_org_sei_[cod sei]
	seq_[ano]_uni_sip_[id sip]
	seq_[ano]_uni_sei_[cod sei]
*/

delete from infra_sequencia where nome_tabela like 'seq_%_uni_sei_%';
delete from infra_sequencia where nome_tabela like 'seq_%_uni_sip_%';
delete from infra_sequencia where nome_tabela like 'seq_%_org_sei_%';
delete from infra_sequencia where nome_tabela like 'seq_%_org_sip_%';

update infra_sequencia set num_atual=0 where nome_tabela='infra_log';
update infra_sequencia set num_atual=0 where nome_tabela='infra_navegador';

/********************************************************************************************************************************************************/
