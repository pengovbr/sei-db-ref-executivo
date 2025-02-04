/*
SCRIPT DE LIMPEZA DE DADOS DA BASE DE DADOS DO SIP - SEI 4.1.0 (ORACLE)
*/

connect sip@sip

/* Reconstrui as tabelas de log e auditoria e as sequences correspondentes */

delete from infra_auditoria;

delete from infra_log;
 
alter sequence seq_infra_auditoria increment by 1 minvalue 0;

alter sequence seq_infra_log increment by 1 minvalue 0;


delete from login;

delete from usuario_historico;

delete from codigo_bloqueio;

delete from dispositivo_acesso;

delete from codigo_acesso;

delete from recurso_vinculado;



/********************************************************************************************************************************************************/



