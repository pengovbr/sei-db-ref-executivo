/*
SCRIPT DE LIMPEZA DE PROCESSOS, DOCUMENTOS E OPERAÇÕES DE USUÁRIOS DA BASE DE DADOS DO SEI 5.0.0 (PostgresSQL)    
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

delete from acao_federacao;
delete from acesso;
delete from acesso_externo;
delete from acesso_federacao;
delete from acompanhamento;
delete from andamento_instalacao;
delete from andamento_marcador;
delete from andamento_plano_trabalho;
delete from andamento_situacao;
delete from anexo;
delete from anotacao;
delete from arquivamento;
delete from assinatura;
delete from atividade;
delete from atributo_andam_plano_trab;
delete from atributo_andamento;
delete from atributo_instalacao;
delete from auditoria_protocolo;
delete from avaliacao_documental;
delete from aviso;
delete from base_conhecimento;
delete from bloco;
delete from campo_pesquisa;
delete from categoria;
delete from comentario;
delete from controle_prazo;
delete from documento;
delete from documento_conteudo;
delete from documento_geracao;
delete from edital_eliminacao;
delete from edital_eliminacao_conteudo;
delete from edital_eliminacao_erro;
delete from email_grupo_email;
delete from estatisticas;
delete from etapa_trabalho;
delete from feed;
delete from grupo_acompanhamento;
delete from grupo_bloco;
delete from grupo_email;
delete from grupo_federacao;
delete from grupo_protocolo_modelo;
delete from infra_captcha;
delete from infra_erro_php;
delete from instalacao_federacao;
delete from item_etapa;
delete from lembrete;
delete from marcador;
delete from monitoramento_servico;
delete from notificacao;
delete from numeracao;
delete from observacao;
delete from orgao_federacao;
delete from parametro_acao_federacao;
delete from participante;
delete from pesquisa;
delete from plano_trabalho;
delete from procedimento;
delete from protocolo;
delete from protocolo_federacao;
delete from protocolo_modelo;
delete from publicacao;
delete from reabertura_programada;
delete from rel_acesso_ext_protocolo;
delete from rel_acesso_ext_serie;
delete from rel_aviso_orgao;
delete from rel_base_conhec_tipo_proced;
delete from rel_bloco_protocolo;
delete from rel_bloco_unidade;
delete from rel_grupo_fed_orgao_fed;
delete from rel_item_etapa_documento;
delete from rel_item_etapa_serie;
delete from rel_item_etapa_unidade;
delete from rel_notificacao_documento;
delete from rel_orgao_pesquisa;
delete from rel_protocolo_assunto;
delete from rel_protocolo_atributo;
delete from rel_protocolo_protocolo;
delete from rel_serie_plano_trabalho;
delete from rel_usuario_grupo_acomp;
delete from rel_usuario_grupo_bloco;
delete from rel_usuario_marcador;
delete from rel_usuario_tipo_prioridade;
delete from rel_usuario_tipo_proced;
delete from rel_usuario_usuario_unidade;
delete from replicacao_federacao;
delete from retorno_programado;
delete from secao_documento;
delete from serie_escolha;
delete from serie_publicacao;
delete from sinalizacao_federacao;
delete from texto_padrao_interno;
delete from tipo_prioridade;
delete from tipo_procedimento_escolha;
delete from unidade_federacao;
delete from unidade_publicacao;
delete from usuario_federacao;
delete from versao_secao_documento;
delete from lixeira;
delete from orgao_historico;
delete from solicitacao_ouvidoria;
delete from usuario_login;


select setval('seq_acesso',1);
select setval('seq_acesso_externo',1);
select setval('seq_acompanhamento',1);
select setval('seq_andamento_marcador',1);
select setval('seq_andamento_plano_trabalho',1);
select setval('seq_andamento_situacao',1);
select setval('seq_anexo',1);
select setval('seq_anotacao',1);
select setval('seq_assinatura',1);
select setval('seq_atividade',1);
select setval('seq_atributo_andam_plano_trab',1);
select setval('seq_atributo_andamento',1);
select setval('seq_auditoria_protocolo',1);
select setval('seq_avaliacao_documental',1);
select setval('seq_aviso',1);
select setval('seq_base_conhecimento',1);
select setval('seq_bloco',1);
select setval('seq_controle_interno',1);
select setval('seq_edital_eliminacao',1);
select setval('seq_edital_eliminacao_conteudo',1);
select setval('seq_edital_eliminacao_erro',1);
select setval('seq_email_grupo_email',1);
select setval('seq_estatisticas',1);
select setval('seq_etapa_trabalho',1);
select setval('seq_feed',1);
select setval('seq_grupo_acompanhamento',1);
select setval('seq_grupo_email',1);
select setval('seq_grupo_protocolo_modelo',1);
select setval('seq_item_etapa',1);
select setval('seq_marcador',1);
select setval('seq_monitoramento_servico',1);
select setval('seq_notificacao',1);
select setval('seq_numeracao',1);
select setval('seq_observacao',1);
select setval('seq_participante',1);
select setval('seq_plano_trabalho',1);
select setval('seq_protocolo',1);
select setval('seq_protocolo_modelo',1);
select setval('seq_publicacao',1);
select setval('seq_reabertura_programada',1);
select setval('seq_rel_protocolo_protocolo',1);
select setval('seq_retorno_programado',1);
select setval('seq_secao_documento',1);
select setval('seq_serie_publicacao',1);
select setval('seq_situacao',1);
select setval('seq_texto_padrao_interno',1);
select setval('seq_tipo_formulario',1);
select setval('seq_tipo_prioridade',1);
select setval('seq_tipo_proced_restricao',1);
select setval('seq_unidade_publicacao',1);
select setval('seq_upload',1);
select setval('seq_versao_secao_documento',1);




/* Se no banco a ser limpo tenha Grupos de E-mail Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de E-mail dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_email where sta_tipo='U';
*/

delete from grupo_unidade;
select setval('seq_grupo_unidade',1);

/* Se no banco a ser limpo tenha Grupos de Envio Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de Envio dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_unidade where sta_tipo='U';
*/

/*Tabelas limpeza condicional - apenas se for necessário, pois podem conter dados do usuário inseridos durante os testes

delete from atributo;
delete from cargo_funcao;
delete from controle_interno;
delete from controle_unidade;
delete from dominio;
delete from email_utilizado;
delete from grupo_contato;
delete from infra_auditoria;
delete from infra_log;
delete from localizador;
delete from lugar_localizador;
delete from mapeamento_assunto;
delete from novidade;
delete from operacao_servico;
delete from ordenador_despesa;
delete from publicacao_legado;
delete from rel_controle_interno_orgao;
delete from rel_controle_interno_serie;
delete from rel_controle_interno_tipo_proc;
delete from rel_controle_interno_unidade;
delete from rel_grupo_contato;
delete from rel_grupo_unidade_unidade;
delete from rel_serie_assunto;
delete from rel_situacao_unidade;
delete from serie_restricao;
delete from servico;
delete from situacao;
delete from tipo_formulario;
delete from tipo_localizador;
delete from tipo_proced_restricao;
delete from titulo;
select setval('seq_atributo',1);
select setval('seq_controle_unidade',1);
select setval('seq_dominio',1);
select setval('seq_email_utilizado',1);
select setval('seq_grupo_contato',1);
select setval('seq_infra_auditoria',1);
select setval('seq_infra_log',1);
select setval('seq_localizador',1);
select setval('seq_lugar_localizador',1);
select setval('seq_novidade',1);
select setval('seq_operacao_servico',1);
select setval('seq_ordenador_despesa',1);
select setval('seq_serie_restricao',1);
select setval('seq_servico',1);
select setval('seq_tipo_localizador',1);

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
