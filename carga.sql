-- Gerar autores

CREATE OR REPLACE FUNCTION gerar_autores(
IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    nomes TEXT[] := ARRAY[
        'João', 'Maria', 'Pedro', 'Ana', 'Luiza', 'Carlos', 'Juliana', 'Rafael', 'Fernanda', 'Gustavo'
    ];
    sobrenomes TEXT[] := ARRAY[
        'Silva', 'Santos', 'Oliveira', 'Pereira', 'Ferreira', 'Almeida', 'Rodrigues', 'Costa', 'Gomes', 'Martins'
    ];
    nome_completo VARCHAR;
    i INTEGER := 1;

BEGIN
    WHILE i <= quantidade LOOP
        -- Gerar nome aleatório
        nome_completo := nomes[floor(1 + random() * array_length(nomes, 1))] || ' ' || sobrenomes[floor(1 + random() * array_length(sobrenomes, 1))];
   
        IF nome_completo IS NOT NULL THEN
            -- Inserir o registro na tabela
            INSERT INTO tb_autor (telefone, nn_nome, email, data_nascimento) VALUES (123456789, nome_completo, 'example@email.com', '02-09-2004');
            i := i + 1; -- Incrementar o contador apenas se o registro for inserido
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_autores(10000);

--SELECT COUNT(*) FROM tb_autor;

--INSERT INTO tb_autor (telefone, nn_nome, email, data_nascimento) VALUES (123456789, 'MAGNA', 'email@magnasistemas.com.br', '02-09-2004');

--DO $$
--DECLARE
--    start_time TIMESTAMP := current_timestamp;
--BEGIN
--    WHILE current_timestamp - start_time < INTERVAL '14 minutes' LOOP
--        PERFORM gerar_autores();
--        PERFORM pg_sleep(3); -- Sleep for 1 minute
--    END LOOP;
--END $$;

-- Gerando editoras

CREATE OR REPLACE FUNCTION gerar_editoras(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    nomes TEXT[] := ARRAY[
        'Coca', 'Pepsi', 'Micro', 'Electric', 'Fast', 'Cool', 'Industria', 'Colibri', 'Lenovo', 'Alelo'
    ];
    sobrenomes TEXT[] := ARRAY[
        'Books', 'Information', 'Text', 'History', 'Tales', 'Livros', 'Animados', 'Verde', 'America', 'Brazil'
    ];
    nome_completo VARCHAR;
    i INTEGER := 1;

BEGIN
    WHILE i <= quantidade LOOP
        -- Gerar nome aleatório
        nome_completo := nomes[floor(1 + random() * array_length(nomes, 1))] || ' ' || sobrenomes[floor(1 + random() * array_length(sobrenomes, 1))];
   
        IF nome_completo IS NOT NULL THEN
            -- Inserir o registro na tabela
            INSERT INTO tb_editora (telefone, nn_nome, email) VALUES (123456789, nome_completo, 'example@email.com');
            i := i + 1; -- Incrementar o contador apenas se o registro for inserido
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_editoras(10000);

-- Gerar livros

CREATE OR REPLACE FUNCTION gerar_livros(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    primeiroNome TEXT[] := ARRAY[
        'Aprenda', 'Curiosidade sobre', 'Tudo sobre', 'Everything wrong with', 'Use a cabeça', 'História de', 'Mitos sobre', 'Facts about'
    ];
    segundoNome TEXT[] := ARRAY[
        'JavaScript', 'Java', 'IoT', 'Minecraft', 'Game Engines', 'C++', 'VIM', 'Linux', 'Sistemas Operacionais', 'Jogos'
    ];
    linguagens TEXT[] := ARRAY[
         'Português', 'Inglês', 'Espanhol'
    ];
    nomeObra VARCHAR;
    i INTEGER := 1;
    isbnTexto VARCHAR;
    editora INTEGER;
   	idiomaTexto VARCHAR;
    descricaoTexto VARCHAR;
   
BEGIN
    WHILE i <= quantidade LOOP
        -- Gerar nome aleatório
        nomeObra := primeiroNome[floor(1 + random() * array_length(primeiroNome, 1))] || ' ' || segundoNome[floor(1 + random() * array_length(segundoNome, 1))];
   
       	isbnTexto := floor(random() * (9-0+1) + 0) || '-' || floor(random() * (999-100+1) + 100) || '-' || floor(random() * (99999-10000+1) + 10000) || '-' ||  floor(random() * (9-0+1) + 0);
       
        idiomaTexto := linguagens[floor(1 + random() * array_length(linguagens, 1))];
        
        descricaoTexto := 'Livro didático sobre algum assunto';
        editora := floor(random() * (10000-1+1) + 1);
       
        IF nomeObra IS NOT NULL THEN
            -- Inserir o registro na tabela
            INSERT INTO tb_livro (nn_isbn, fk_cod_editora, titulo, descricao, data_publicacao, idioma, nn_valor) VALUES (isbnTexto,  editora, nomeObra, descricaoTexto, '02-09-2004', idiomaTexto, 50.50);
            i := i + 1; -- Incrementar o contador apenas se o registro for inserido
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_livros(10000);

-- Gerar Coleções

CREATE OR REPLACE FUNCTION gerar_colecao(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    primeiroNome TEXT[] := ARRAY[
        'Coleção de ', 'Collection of', 'All works of', 'Complete Series', 'Série Completa de'
    ];
    segundoNome TEXT[] := ARRAY[
        'JavaScript', 'Java', 'IoT', 'Minecraft', 'Game Engines', 'C++', 'VIM', 'Linux', 'Sistemas Operacionais', 'Jogos', 'Programação'
    ];
    linguagens TEXT[] := ARRAY[
         'Português', 'Inglês', 'Espanhol'
    ];
    nomeObra VARCHAR;
    i INTEGER := 1;
    isbnTexto VARCHAR;
   	idiomaTexto VARCHAR;
    descricaoTexto VARCHAR;
   
BEGIN
    WHILE i <= quantidade LOOP
        -- Gerar nome aleatório
        nomeObra := primeiroNome[floor(1 + random() * array_length(primeiroNome, 1))] || ' ' || segundoNome[floor(1 + random() * array_length(segundoNome, 1))];
   
       	isbnTexto := floor(random() * (9-0+1) + 0) || '-' || floor(random() * (999-100+1) + 100) || '-' || floor(random() * (99999-10000+1) + 10000) || '-' ||  floor(random() * (9-0+1) + 0);
       
        idiomaTexto := linguagens[floor(1 + random() * array_length(linguagens, 1))];
        
        descricaoTexto := 'Livro didático sobre algum assunto';
       
        IF nomeObra IS NOT NULL THEN
            -- Inserir o registro na tabela
            INSERT INTO tb_colecao (nn_isbn, titulo, serie, descricao, data_publicacao, idioma, nn_valor) VALUES (isbnTexto, nomeObra, nomeObra, descricaoTexto, '02-09-2004', idiomaTexto, 200.50);
            i := i + 1; -- Incrementar o contador apenas se o registro for inserido
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_colecao(10000);

-- Gerar Livros Coleções

CREATE OR REPLACE FUNCTION gerar_livro_colecoes(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    colecao INTEGER;
    livro INTEGER;
   	i INTEGER := 1;
BEGIN
    WHILE i <= quantidade LOOP

        livro := floor(random() * (10000-1+1) + 1);
        colecao := floor(random() * (10000-1+1) + 1);
       
        -- Inserir o registro na tabela
        INSERT INTO tb_livros_colecao(fk_colecao, fk_livro) VALUES (colecao,livro);
        i := i + 1; -- Incrementar o contador apenas se o registro for inserido
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_livro_colecoes(10000);

-- Gerar Autores Livro
CREATE OR REPLACE FUNCTION gerar_autores_livro(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    autor INTEGER;
    livro INTEGER;
   	i INTEGER := 1;
BEGIN
    WHILE i <= quantidade LOOP

        livro := floor(random() * (10000-1+1) + 1);
        autor := floor(random() * (10000-1+1) + 1);
       
        -- Inserir o registro na tabela
        INSERT INTO tb_autores_livro(fk_autor, fk_livro) VALUES (autor,livro);
        i := i + 1; -- Incrementar o contador apenas se o registro for inserido
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_autores_livro(10000);

-- Gerar Edições
CREATE OR REPLACE FUNCTION gerar_edicao(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    livro INTEGER;
   	i INTEGER := 1;
BEGIN
    WHILE i <= quantidade LOOP

        livro := floor(random() * (10000-1+1) + 1);
 
        -- Inserir o registro na tabela
        INSERT INTO tb_edicao(fk_cod_livro, data_publicacao) VALUES (livro,'02-09-2004');
        i := i + 1; -- Incrementar o contador apenas se o registro for inserido
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_edicao(10000);

-- Gerar Edições Livro
CREATE OR REPLACE FUNCTION gerar_edicoes_livro(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    edicao INTEGER;
    livro INTEGER;
   	i INTEGER := 1;
BEGIN
    WHILE i <= quantidade LOOP

        livro := floor(random() * (10000-1+1) + 1);
        edicao := floor(random() * (10000-1+1) + 1);
       
        -- Inserir o registro na tabela
        INSERT INTO tb_edicoes_livro(fk_edicao, fk_livro) VALUES (edicao, livro);
        i := i + 1; -- Incrementar o contador apenas se o registro for inserido
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_edicoes_livro(10000);

-- Gerar Categoria

CREATE OR REPLACE FUNCTION gerar_categoria(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    categorias GENRES[] := ARRAY[
        'Horror', 'Adventure', 'Comedy', 'Investigation', 'Mistery', 'Sci-Fy'
    ];
   	i INTEGER := 1;
BEGIN
    WHILE i <= quantidade LOOP
        -- Inserir o registro na tabela
        INSERT INTO tb_categoria(nn_genero) VALUES (categorias[floor(1 + random() * array_length(categorias, 1))]);
        i := i + 1; -- Incrementar o contador apenas se o registro for inserido
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_categoria(10000);

-- Gerar Edições Livro
CREATE OR REPLACE FUNCTION gerar_edicoes_livro(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    edicao INTEGER;
    livro INTEGER;
   	i INTEGER := 1;
BEGIN
    WHILE i <= quantidade LOOP

        livro := floor(random() * (10000-1+1) + 1);
        edicao := floor(random() * (10000-1+1) + 1);
       
        -- Inserir o registro na tabela
        INSERT INTO tb_edicoes_livro(fk_edicao, fk_livro) VALUES (edicao, livro);
        i := i + 1; -- Incrementar o contador apenas se o registro for inserido
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_edicoes_livro(10000);

-- Gerar Categoria Livros
CREATE OR REPLACE FUNCTION gerar_categoria_livros(
    IN quantidade INTEGER
)
RETURNS VOID AS $$
declare
    categoria INTEGER;
    livro INTEGER;
   	i INTEGER := 1;
BEGIN
    WHILE i <= quantidade LOOP

        livro := floor(random() * (10000-1+1) + 1);
        categoria := floor(random() * (10000-1+1) + 1);
       
        -- Inserir o registro na tabela
        INSERT INTO tb_categorias_livro (fk_categoria, fk_livro) VALUES (categoria, livro);
        i := i + 1; -- Incrementar o contador apenas se o registro for inserido
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT gerar_categoria_livros(10000);