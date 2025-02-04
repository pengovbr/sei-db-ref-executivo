/*
SCRIPT DE LIMPEZA DE PROCESSOS, DOCUMENTOS E OPERAÇÕES DE USUÁRIOS DA BASE DE DADOS DO SEI 4.1.0.0 (MySQL)    
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

use sei;

/* Limpeza de tabelas associadas a Protocolo de Processos, de Documentos Gerados e Externos e de Operações dos Usuários */

SET FOREIGN_KEY_CHECKS=0;


truncate table acao_federacao;

truncate table acesso;
truncate table seq_acesso;

truncate table acesso_externo;
truncate table seq_acesso_externo;

truncate table acesso_federacao;

truncate table acompanhamento;

truncate table seq_acompanhamento;
truncate table andamento_instalacao;

truncate table andamento_marcador;
truncate table seq_andamento_marcador;

truncate table andamento_plano_trabalho;
truncate table seq_andamento_plano_trabalho;

truncate table andamento_situacao;
truncate table seq_andamento_situacao;

truncate table anexo;
truncate table seq_anexo;

truncate table anotacao;
truncate table seq_anotacao;

truncate table arquivamento;

truncate table assinatura;
truncate table seq_assinatura;

truncate table atividade;
truncate table seq_atividade;

truncate table atributo_andam_plano_trab;
truncate table seq_atributo_andam_plano_trab;

truncate table atributo_andamento;
truncate table seq_atributo_andamento;

truncate table atributo_instalacao;

truncate table auditoria_protocolo;
truncate table seq_auditoria_protocolo;

truncate table avaliacao_documental;
truncate table seq_avaliacao_documental;

truncate table aviso;
truncate table seq_aviso;

truncate table base_conhecimento;
truncate table seq_base_conhecimento;

truncate table bloco;
truncate table seq_bloco;

truncate table campo_pesquisa;

truncate table categoria;

truncate table comentario;
truncate table seq_controle_interno;

truncate table controle_prazo;

truncate table documento;

truncate table documento_conteudo;

truncate table documento_geracao;

truncate table edital_eliminacao;
truncate table seq_edital_eliminacao;

truncate table edital_eliminacao_conteudo;
truncate table seq_edital_eliminacao_conteudo;

truncate table edital_eliminacao_erro;
truncate table seq_edital_eliminacao_erro;

truncate table email_grupo_email;
truncate table seq_email_grupo_email;

truncate table estatisticas;
truncate table seq_estatisticas;

truncate table etapa_trabalho;
truncate table seq_etapa_trabalho;

truncate table feed;
truncate table seq_feed;

truncate table grupo_acompanhamento;
truncate table seq_grupo_acompanhamento;

truncate table grupo_bloco;

truncate table grupo_email;
truncate table seq_grupo_email;

truncate table grupo_federacao;

truncate table grupo_protocolo_modelo;
truncate table seq_grupo_protocolo_modelo;

truncate table infra_captcha;

truncate table infra_erro_php;

truncate table instalacao_federacao;

truncate table item_etapa;
truncate table seq_item_etapa;

truncate table lembrete;

truncate table mapeamento_assunto;

truncate table marcador;
truncate table seq_marcador;

truncate table monitoramento_servico;
truncate table seq_monitoramento_servico;

truncate table notificacao;
truncate table seq_notificacao;

truncate table numeracao;
truncate table seq_numeracao;

truncate table observacao;
truncate table seq_observacao;

truncate table orgao_federacao;

truncate table parametro_acao_federacao;

truncate table participante;
truncate table seq_participante;

truncate table pesquisa;

truncate table plano_trabalho;
truncate table seq_plano_trabalho;

truncate table procedimento;

truncate table protocolo;
truncate table seq_protocolo;

truncate table protocolo_federacao;

truncate table protocolo_modelo;
truncate table seq_protocolo_modelo;

truncate table publicacao;
truncate table seq_publicacao;

truncate table reabertura_programada;
truncate table seq_reabertura_programada;

truncate table rel_acesso_ext_protocolo;

truncate table rel_acesso_ext_serie;

truncate table rel_aviso_orgao;

truncate table rel_base_conhec_tipo_proced;

truncate table rel_bloco_protocolo;

truncate table rel_bloco_unidade;

truncate table rel_grupo_fed_orgao_fed;

truncate table rel_item_etapa_documento;

truncate table rel_item_etapa_serie;

truncate table rel_item_etapa_unidade;

truncate table rel_notificacao_documento;

truncate table rel_orgao_pesquisa;

truncate table rel_protocolo_assunto;

truncate table rel_protocolo_atributo;

truncate table rel_protocolo_protocolo;

truncate table seq_rel_protocolo_protocolo;

truncate table rel_serie_plano_trabalho;

truncate table rel_usuario_grupo_acomp;

truncate table rel_usuario_grupo_bloco;

truncate table rel_usuario_marcador;

truncate table rel_usuario_tipo_prioridade;

truncate table rel_usuario_tipo_proced;

truncate table rel_usuario_usuario_unidade;

truncate table replicacao_federacao;

truncate table retorno_programado;
truncate table seq_retorno_programado;

truncate table secao_documento;
truncate table seq_secao_documento;

truncate table serie_escolha;
truncate table seq_serie_publicacao;

truncate table serie_publicacao;

truncate table sinalizacao_federacao;

truncate table seq_texto_padrao_interno;
truncate table texto_padrao_interno;

truncate table seq_tipo_formulario;

truncate table seq_tipo_prioridade;
truncate table tipo_prioridade;

truncate table seq_tipo_proced_restricao;

truncate table tipo_procedimento_escolha;

truncate table unidade_federacao;
truncate table seq_unidade_publicacao;

truncate table unidade_publicacao;

truncate table seq_upload;

truncate table usuario_federacao;

truncate table seq_versao_secao_documento;
truncate table versao_secao_documento;

truncate table lixeira;

truncate table orgao_historico;

truncate table solicitacao_ouvidoria;

truncate table usuario_login;



/*As seguintes tabelas devem ser avaliadas antes de executar o procedimento de limpeza, para que não provoque exclusão indevida de dados inseridos pelo usuário durante os testes


truncate table atributo;
truncate table seq_atributo;

truncate table cargo_funcao;

truncate table controle_interno;

truncate table controle_unidade;
truncate table seq_controle_unidade;

truncate table dominio;
truncate table seq_dominio;

truncate table email_utilizado;
truncate table seq_email_utilizado;

truncate table grupo_contato;
truncate table seq_grupo_contato;

truncate table grupo_unidade;
truncate table seq_grupo_unidade;

truncate table localizador;
truncate table seq_localizador;

truncate table lugar_localizador;
truncate table seq_lugar_localizador;

truncate table novidade;
truncate table seq_novidade;

truncate table operacao_servico;
truncate table seq_operacao_servico;

truncate table ordenador_despesa;
truncate table seq_ordenador_despesa;

truncate table publicacao_legado;

truncate table rel_controle_interno_orgao;

truncate table rel_controle_interno_serie;

truncate table rel_controle_interno_tipo_proc;

truncate table rel_controle_interno_unidade;

truncate table rel_grupo_contato;

truncate table rel_grupo_unidade_unidade;

truncate table rel_serie_assunto;

truncate table rel_situacao_unidade;

truncate table seq_serie_restricao;
truncate table serie_restricao;

truncate table seq_servico;
truncate table servico;

truncate table situacao;
truncate table seq_situacao;

truncate table tipo_formulario;

truncate table seq_tipo_localizador;
truncate table tipo_localizador;

truncate table tipo_proced_restricao;

truncate table titulo;
*/

/* Reconstrui as tabelas de log e auditoria e tabelas sequenciais correspondentes */
truncate table infra_auditoria;
truncate table seq_infra_auditoria;

truncate table infra_log;
truncate table seq_infra_log;

truncate table infra_navegador;
truncate table seq_infra_navegador;

truncate table infra_dado_usuario;


SET FOREIGN_KEY_CHECKS=1;


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




