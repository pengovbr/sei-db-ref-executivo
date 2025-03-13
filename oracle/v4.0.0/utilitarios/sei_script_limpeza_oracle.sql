/*
SCRIPT DE LIMPEZA DE PROCESSOS E DOCUMENTOS DA BASE DE DADOS DO SEI 2.6.0 (ORACLE)
  Antes de executar o script:
    1) Retirar o sistema do "AR" (derrubar todas sessõµes).
    2) Fazer uma cópia da base imediatamente antes de executar o script.
    3) Executar o script de limpeza. Se der erro, restaurar a base com a cópia feita no passo 2.

  Depois de executar o script com sucesso, sendo aconselhável conferir algumas tabelas abaixo e sequenciais de protocolo de processo na tabela "infra_sequencia":
    1) Apagar todos os arquivos e estrutura de pastas no Filesystem do sei_esquema.
    2) Excluir os Índices do Solr, conforme orientado no final do capítulo do Solr no Manual de Instalação do SEI:
      18 - Caso,  no  futuro,  seja  preciso  reindexar  todos  os  dados  é  aconselhável  limpar  antes  os  Índices usando os comandos abaixo:
        http://[servidor_solr]:8080/solr/sei-protocolos/update?stream.body=<delete><query>*:*</query></delete>&commit=true
				http://[servidor_solr]:8080/solr/sei-bases-conhecimento/update?stream.body=<delete><query>*:*</query></delete>&commit=true
				http://[servidor_solr]:8080/solr/sei-publicacoes/update?stream.body=<delete><query>*:*</query></delete>&commit=true
		4) Colocar o sistema de volta ao "AR".
*/

connect sei_esquema/sei_esquema@teste
 
/* Limpeza de tabelas afetas a Protocolo de Processos, de Documentos Gerados e Externos */

--Procedure para reiniciar sequence de acordo com o valor máximo da tabela correspondente
create or replace procedure reset_seq( p_seq_name in varchar2 )
is
l_val number;
begin
execute immediate 'select ' || p_seq_name || '.nextval from dual' INTO l_val;

execute immediate 'alter sequence ' || p_seq_name || ' increment by -' || l_val || ' minvalue 0';

execute immediate 'select ' || p_seq_name || '.nextval from dual' INTO l_val;

execute immediate 'alter sequence ' || p_seq_name || ' increment by 1 minvalue 0';
end;
/

--Início - Desabilitando as FKs
set echo off 
set feedback off 
set verify off 
set heading off
set termout off
set pagesize 1000
set colwidth 500
set linesize 500
spool disable_fk.sql
select 'ALTER TABLE '||cons.table_name||' DISABLE CONSTRAINT '||constraint_name||' CASCADE;'
from   user_tables tabs
       INNER JOIN user_constraints cons on (cons.table_name = tabs.table_name)       
where cons.CONSTRAINT_TYPE = 'R';
spool off
@disable_fk.sql;
/
--Fim - Desabilitando as FKs

truncate table anexo;
exec reset_seq('sei_esquema.seq_anexo');

truncate table numeracao;
exec reset_seq('sei_esquema.seq_numeracao');

truncate table acesso;
exec reset_seq('sei_esquema.seq_acesso');

truncate table acesso_externo;
exec reset_seq('sei_esquema.seq_acesso_externo');

truncate table acompanhamento;
exec reset_seq('sei_esquema.seq_acompanhamento');

truncate table grupo_acompanhamento;
exec reset_seq('sei_esquema.seq_grupo_acompanhamento');

truncate table andamento_situacao;
exec reset_seq('sei_esquema.seq_andamento_situacao');

truncate table anotacao;
exec reset_seq('sei_esquema.seq_anotacao');

truncate table assinatura;
exec reset_seq('sei_esquema.seq_assinatura');

truncate table estatisticas;
exec reset_seq('sei_esquema.seq_estatisticas');

truncate table base_conhecimento;
exec reset_seq('seq_base_conhecimento');

truncate table rel_base_conhec_tipo_proced;

truncate table versao_secao_documento;
exec reset_seq('sei_esquema.seq_versao_secao_documento');

truncate table secao_documento;
exec reset_seq('sei_esquema.seq_secao_documento');

truncate table atributo_andamento;
exec reset_seq('sei_esquema.seq_atributo_andamento');

truncate table retorno_programado;
exec reset_seq('sei_esquema.seq_retorno_programado');

truncate table participante;
exec reset_seq('sei_esquema.seq_participante');

truncate table observacao;
exec reset_seq('sei_esquema.seq_observacao');

truncate table rel_protocolo_assunto;

truncate table rel_protocolo_protocolo;
exec reset_seq('sei_esquema.seq_rel_protocolo_protocolo');

truncate table publicacao;
exec reset_seq('sei_esquema.seq_publicacao');

truncate table rel_bloco_protocolo;

truncate table rel_bloco_unidade;

truncate table protocolo_modelo;
exec reset_seq('sei_esquema.seq_protocolo_modelo');

truncate table grupo_protocolo_modelo;
exec reset_seq('seq_grupo_protocolo_modelo');

truncate table unidade_publicacao;
exec reset_seq('sei_esquema.seq_unidade_publicacao');

truncate table serie_escolha;

truncate table serie_publicacao;
exec reset_seq('sei_esquema.seq_serie_publicacao');

truncate table texto_padrao_interno;
exec reset_seq('sei_esquema.seq_texto_padrao_interno');

truncate table rel_protocolo_atributo;

truncate table feed;
exec reset_seq('sei_esquema.seq_feed');

truncate table velocidade_transferencia;

exec reset_seq('sei_esquema.seq_atributo_andamento_situaca');

truncate table auditoria_protocolo;
exec reset_seq('sei_esquema.seq_auditoria_protocolo');

truncate table rel_notificacao_documento;

truncate table estatisticas;
exec reset_seq('sei_esquema.seq_estatisticas');

truncate table atributo_andamento;
exec reset_seq('sei_esquema.seq_atributo_andamento');

truncate table notificacao;

truncate table bloco;
exec reset_seq('sei_esquema.seq_bloco');

truncate table atividade;
exec reset_seq('sei_esquema.seq_atividade');

truncate table documento;
exec reset_seq('sei_esquema.seq_documento');

truncate table procedimento;

truncate table tipo_procedimento_escolha;

truncate table protocolo;
exec reset_seq('sei_esquema.seq_protocolo');

truncate table email_grupo_email;
exec reset_seq('sei_esquema.seq_email_grupo_email');

truncate table grupo_email;
exec reset_seq('sei_esquema.seq_grupo_email');

truncate table acao_federacao;

truncate table acesso_federacao;

truncate table andamento_instalacao;
exec reset_seq('sei_esquema.seq_andamento_instalacao');

truncate table andamento_marcador;
exec reset_seq('sei_esquema.seq_andamento_marcador');

truncate table seq_andamento_situacao;

truncate table arquivamento;

truncate table atributo_instalacao;
exec reset_seq('sei_esquema.seq_atributo_instalacao');

truncate table campo_pesquisa;
exec reset_seq('sei_esquema.seq_campo_pesquisa');

truncate table categoria;
exec reset_seq('sei_esquema.seq_categoria');

truncate table comentario;
exec reset_seq('sei_esquema.seq_comentario');

truncate table controle_prazo;
exec reset_seq('sei_esquema.seq_controle_prazo');

truncate table documento_conteudo;

truncate table grupo_bloco;
exec reset_seq('sei_esquema.seq_grupo_bloco');

truncate table grupo_federacao;
exec reset_seq('sei_esquema.seq_grupo_federacao');

truncate table instalacao_federacao;

truncate table lembrete;
exec reset_seq('sei_esquema.seq_lembrete');

truncate table marcador;
exec reset_seq('sei_esquema.seq_marcador');

truncate table monitoramento_servico;
exec reset_seq('sei_esquema.seq_monitoramento_servico');

truncate table orgao_federacao;

truncate table parametro_acao_federacao;

truncate table pesquisa;
exec reset_seq('sei_esquema.seq_pesquisa');

truncate table protocolo_federacao;

truncate table rel_acesso_ext_protocolo;

truncate table rel_acesso_ext_serie;

truncate table rel_grupo_fed_orgao_fed;

truncate table rel_usuario_grupo_acomp;

truncate table rel_usuario_grupo_bloco;

truncate table rel_usuario_marcador;

truncate table rel_usuario_tipo_proced;

truncate table rel_usuario_usuario_unidade;

truncate table replicacao_federacao;

truncate table sinalizacao_federacao;

truncate table unidade_federacao;

truncate table usuario_federacao;

/* Se no banco a ser limpo tenha Grupos de E-mail Institucionais configurados na Administraçã£o do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de E-mail dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_email where sta_tipo='U';
*/

truncate table grupo_unidade;
exec reset_seq('sei_esquema.seq_grupo_unidade');

/* Se no banco a ser limpo tenha Grupos de Envio Institucionais configurados na Administração do SEI, verifique a possibilidade de reconfigurá-los manualmente pela aplicação. Caso tenha necessidade de mantê-los no banco, em vez de executar os dois comandos acima, deve executar o comando abaixo para deletar apenas os Grupos de Envio dos Usuários, não sendo possível o realinhamento dos IDs:
	delete from grupo_unidade where sta_tipo='U';
*/


/* Reconstrui as tabelas de log e auditoria e tabelas sequenciais correspondentes */
truncate table infra_auditoria;
exec reset_seq('sei_esquema.seq_infra_auditoria');

truncate table infra_log;
exec reset_seq('sei_esquema.seq_infra_log');

truncate table infra_navegador;
exec reset_seq('sei_esquema.seq_infra_navegador');

truncate table infra_dado_usuario;

--Início - Habilitando as FKs
set echo off 
set feedback off 
set verify off 
set heading off
set termout off
set pagesize 1000
set colwidth 500
set linesize 500
spool enable_fk.sql
select 'ALTER TABLE '||cons.table_name||' ENABLE CONSTRAINT '||constraint_name||';'
from   user_tables tabs
       INNER JOIN user_constraints cons on (cons.table_name = tabs.table_name)       
where cons.CONSTRAINT_TYPE = 'R';
spool off
@enable_fk.sql;
/
--Fim - Habilitando as FKs

/*
Sobre a última linha abaixo, a tabela de sequência anual de protocolo de processos pode ser qualquer um dos formatos abaixo (de acordo com a configuração da numeração de protocolo):
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
