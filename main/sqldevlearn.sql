-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.area
(
    id integer NOT NULL,
    nome text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.comentario
(
    id integer NOT NULL,
    autor text NOT NULL,
    avaliacao integer NOT NULL,
    conteudo text NOT NULL,
    "moduloId" integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.curso
(
    id integer NOT NULL,
    idioma text NOT NULL,
    autor text NOT NULL,
    conteudo text NOT NULL,
    url text NOT NULL,
    titulo text NOT NULL,
    horas integer NOT NULL,
    avaliacao integer NOT NULL,
    areaid integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.desafio
(
    id integer NOT NULL,
    titulo text NOT NULL,
    questao text NOT NULL,
    "moduloId" integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.modulo
(
    id integer NOT NULL,
    horas integer NOT NULL,
    nome text NOT NULL,
    topico text NOT NULL,
    "cursoId" integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.perfil
(
    id integer NOT NULL,
    foto text NOT NULL,
    descricao text NOT NULL,
    interesse integer NOT NULL,
    cursos_salvos text NOT NULL,
    usuarioid integer NOT NULL,
    cursoid integer NOT NULL,
    nickname text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.usuario
(
    id integer NOT NULL,
    email text NOT NULL,
    senha text NOT NULL,
    nome text NOT NULL,
    sobrenome text NOT NULL,
    is_admin boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.video
(
    id integer NOT NULL,
    titulo text NOT NULL,
    url text NOT NULL,
    duracao integer NOT NULL,
    descricao text NOT NULL,
    "moduloId" integer NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.comentario
    ADD FOREIGN KEY ("moduloId")
    REFERENCES public.modulo (id)
    NOT VALID;


ALTER TABLE public.curso
    ADD FOREIGN KEY (areaid)
    REFERENCES public.area (id)
    NOT VALID;


ALTER TABLE public.desafio
    ADD FOREIGN KEY ("moduloId")
    REFERENCES public.modulo (id)
    NOT VALID;


ALTER TABLE public.modulo
    ADD FOREIGN KEY ("cursoId")
    REFERENCES public.curso (id)
    NOT VALID;


ALTER TABLE public.perfil
    ADD FOREIGN KEY (cursoid)
    REFERENCES public.curso (id)
    NOT VALID;


ALTER TABLE public.perfil
    ADD FOREIGN KEY (usuarioid)
    REFERENCES public.usuario (id)
    NOT VALID;


ALTER TABLE public.video
    ADD FOREIGN KEY ("moduloId")
    REFERENCES public.modulo (id)
    NOT VALID;

END;