/*
SCRIPT DE LIMPEZA DE DADOS DA BASE DE DADOS DO SIP - SEI 4.1.0 (Postgresql)
*/

/* Reconstrui as tabelas de log e auditoria e tabelas sequenciais correspondentes */
delete from infra_auditoria;
select setval ('seq_infra_auditoria', 1);

delete from infra_log;
select setval ('seq_infra_log', 1);

delete from login;

delete from recurso_vinculado;

delete from codigo_bloqueio;

delete from dispositivo_acesso;

delete from codigo_acesso;

delete from usuario_historico;

/********************************************************************************************************************************************************/
