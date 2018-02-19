/* 
   Copyright 2017 NESTOR FERNANDO CAÑAS GUTIERREZ

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


CREATE SCHEMA "rrhh";
CREATE SCHEMA "it";

CREATE TABLE rrhh.persona(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	id_cargo int NOT NULL,
	id_usb int NULL,
	id_maletas int NULL,
	id_equipo int NULL,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);


CREATE TABLE rrhh.usuario(
	id SERIAL PRIMARY KEY,
	id_persona int NOT NULL,
	nombre text NOT NULL,
	contraseña text NOT NULL,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);


CREATE TABLE rrhh.cargo(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	id_cargo int NOT NULL,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);

CREATE TABLE rrhh.area(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	descripcion text,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);

CREATE TABLE it.usb(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	id_marca int NOT NULL,
	id_modelo int NOT NULL,
	capacidad int NOT NULL,
	estado boolean DEFAULT true,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);

CREATE TABLE it.maletas(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);

CREATE TABLE it.marca(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);

CREATE TABLE it.modelo(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	id_marca int NOT NULL,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);

CREATE TABLE it.equipo(
	id SERIAL PRIMARY KEY,
	id_modelo int NOT NULL,
	id_estado int NOT NULL,
	nombre text NOT NULL,
	hdd text NOT NULL,
	ram text NOT NULL,
	nserial text NOT NULL,
	f_compra date,
	garantia text,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);

CREATE TABLE it.estado(
	id SERIAL PRIMARY KEY,
	nombre text NOT NULL,
	f_creacion timestamp DEFAULT now(),
	f_modificacion timestamp NOT NULL
);


ALTER TABLE rrhh.usuario ADD CONSTRAINT constraint_fk FOREIGN KEY (id_persona) REFERENCES rrhh.persona(id);
ALTER TABLE rrhh.persona ADD CONSTRAINT constraint_fk FOREIGN KEY (id_cargo) REFERENCES rrhh.cargo(id);
ALTER TABLE rrhh.persona ADD CONSTRAINT constraint_fk2 FOREIGN KEY (id_usb) REFERENCES it.usb(id);
ALTER TABLE rrhh.persona ADD CONSTRAINT constraint_fk3 FOREIGN KEY (id_maletas) REFERENCES it.maletas(id);
ALTER TABLE rrhh.persona ADD CONSTRAINT constraint_fk4 FOREIGN KEY (id_equipo) REFERENCES it.equipo(id);
ALTER TABLE it.usb ADD CONSTRAINT constraint_fk FOREIGN KEY (id_marca) REFERENCES it.marca(id);
ALTER TABLE it.usb ADD CONSTRAINT constraint_fk2 FOREIGN KEY (id_modelo) REFERENCES it.modelo(id);
ALTER TABLE it.modelo ADD CONSTRAINT constraint_fk FOREIGN KEY (id_marca) REFERENCES it.marca(id);
ALTER TABLE it.equipo ADD CONSTRAINT constraint_fk FOREIGN KEY (id_modelo) REFERENCES it.modelo(id);
ALTER TABLE it.equipo ADD CONSTRAINT constraint_fk2 FOREIGN KEY (id_estado) REFERENCES it.estado(id);
ALTER TABLE rrhh.cargo ADD CONSTRAINT constraint_fk1 FOREIGN KEY (id_cargo) REFERENCES rrhh.cargo(id);

/*
TEST VALUES

INSERT INTO rrhh.persona (nombre, f_modificacion) VALUES ('Pedro', now());
INSERT INTO rrhh.usuario (nombre, contraseña, f_modificacion) VALUES ('Pedro', md5('hola'), now());
*/
