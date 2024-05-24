-- Criar usuários
DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'caique') THEN
        CREATE USER caique WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'ysadora') THEN
        CREATE USER ysadora WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'shelle') THEN
        CREATE USER shelle WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'victor') THEN
        CREATE USER victor WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'jonas') THEN
        CREATE USER jonas WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'samuel') THEN
        CREATE USER samuel WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'jackson') THEN
        CREATE USER jackson WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'kaique') THEN
        CREATE USER kaique WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'vinicius') THEN
        CREATE USER vinicius WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'aragao') THEN
        CREATE USER aragao WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'felipe') THEN
        CREATE USER felipe WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'gustavo') THEN
        CREATE USER gustavo WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'igor') THEN
        CREATE USER igor WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'luis') THEN
        CREATE USER luis WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
    
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_user WHERE usename = 'lucca') THEN
        CREATE USER lucca WITH PASSWORD 'Magna@123' SUPERUSER;
    END IF;
END $$;

-- Dropar tabelas já existentes e criar tabelas

drop table if exists tb_edicoes_livro;
drop table if exists tb_autores_livro; 
drop table if exists tb_livros_colecao;
drop table if exists tb_categorias_livro;

drop table if exists tb_colecao;
drop table if exists tb_categoria;
drop table if exists tb_edicao;
drop table if exists tb_livro;
DROP table if exists tb_autor;
drop table if exists tb_editora;

drop extension if exists pg_stat_statements;
drop view if exists pg_stat_statements;
drop view if exists pg_stat_statements_info;

-- vacuum full;

CREATE TABLE tb_editora (
	pk_cod_editora SERIAL PRIMARY KEY,
	telefone VARCHAR(255),
	nn_nome VARCHAR(255) not null,
	email VARCHAR(255)
);

CREATE TABLE tb_autor (
	pk_cod_autor SERIAL PRIMARY KEY,
	telefone VARCHAR(255),
	nn_nome VARCHAR(255) not null,
	email VARCHAR(255),
	data_nascimento DATE
);

CREATE TABLE tb_categoria (
	pk_cod_categoria SERIAL PRIMARY KEY,
	nn_genero VARCHAR(255) not null
);

CREATE TABLE tb_livro (
	pk_cod_livro SERIAL PRIMARY KEY,
	nn_ISBN VARCHAR(255) not null unique,
	fk_cod_editora INTEGER REFERENCES tb_editora (pk_cod_editora),
	titulo VARCHAR(255),
	descricao TEXT,
	data_publicacao DATE,
	idioma VARCHAR(255),
	nn_valor NUMERIC(10,2) not null
);

CREATE TABLE tb_colecao (
	pk_cod_colecao SERIAL PRIMARY KEY,
	nn_ISBN VARCHAR(255) not null unique,
	titulo VARCHAR(255),
	serie VARCHAR(255),
	descricao TEXT,
	data_publicacao DATE,
	idioma VARCHAR(255),
	nn_valor NUMERIC(10,2) not null
);
		
CREATE TABLE tb_edicao (
	pk_cod_edicao SERIAL PRIMARY KEY,
	fk_cod_livro INTEGER REFERENCES tb_livro (pk_cod_livro),
	data_publicacao DATE
);

CREATE TABLE tb_autores_livro (
	FK_autor INTEGER,
	FOREIGN KEY (fk_autor) REFERENCES tb_autor (pk_cod_autor),
	FK_livro INTEGER,
	FOREIGN KEY (fk_livro) REFERENCES tb_livro (pk_cod_livro)
);

CREATE TABLE tb_edicoes_livro (
	fk_edicao INTEGER,
	FOREIGN KEY (fk_edicao) REFERENCES tb_edicao (pk_cod_edicao),
	fk_livro INTEGER,
	FOREIGN KEY (fk_livro) REFERENCES tb_livro (pk_cod_livro)
);

CREATE TABLE tb_livros_colecao (
	fk_colecao INTEGER,
	FOREIGN KEY (fk_colecao) REFERENCES tb_colecao (pk_cod_colecao),
	fk_livro INTEGER,
	FOREIGN KEY (fk_livro) REFERENCES tb_livro (pk_cod_livro)
);

CREATE TABLE tb_categorias_livro (
	fk_categoria INTEGER,
	FOREIGN KEY (fk_categoria) REFERENCES tb_categoria (pk_cod_categoria),
	fk_livro INTEGER,
	FOREIGN KEY (fk_livro) REFERENCES tb_livro (pk_cod_livro)
);