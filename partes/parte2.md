[Voltar README](../README.md)

# Parte 2: Montagem do Núcleo

Implementação física do banco relacional.

## Documentação da estrutura

### Visão Geral

O banco de dados hotel_nebula foi desenvolvido no MySQL.

---

### Estrutura das tabelas

---

#### hospedes

Armazena os dados dos hóspedes cadastrados no sistema.

Campos:
- id_hospede
- nome
- email
- cpf
- telefone
- data_nascimento

---

#### quartos

Armazena as informações dos quartos do hotel.

Campos:
- id_quarto
- numero
- andar
- tipo
- capacidade
- preco_diaria
- status_quarto

---

#### reservas

Registra as reservas realizadas pelos hóspedes.

Relacionamentos:
- é feita por um hóspede
- reserva um quarto

Campos:
- id_reserva
- id_hospede
- id_quarto
- data_checkin
- data_checkout
- valor_orcamento
- status_reserva

---

#### hospedagens

Representa a estadia real do hóspede após a reserva.

Relacionamento:
- é gerada por uma reserva

Campos:
- id_hospedagem
- id_reserva
- checkin_real
- checkout_real

---

#### pagamentos

Armazena os pagamentos realizados referentes às hospedagens.

Relacionamento:
- pertence a uma hospedagem

Campos:
- id_pagamento
- id_hospedagem
- valor
- metodo
- data_pagamento

---

#### servicos

Contém os serviços extras oferecidos pelo hotel.

Campos:
- id_servico
- servico_nome
- valor

---

#### funcionarios

Armazena os dados dos funcionários do hotel.

Campos:
- id_funcionario
- nome
- cargo
- cpf
- telefone
- email
- data_nascimento
- salario
- data_admissao
- status_funcionario

---

#### feedbacks

Registra avaliações realizadas pelos hóspedes após a hospedagem.

Relacionamento:
- Avalia uma hospedagem

Campos:
- id_feedback
- id_hospedagem
- quant_estrelas
- comentario

---

#### servicos_realizados

Tabela associativa responsável por registrar os serviços realizados durante uma hospedagem.

Relacionamentos:
- pertence a um hospedagens
- referencia um serviços
- é realizado por um funcionários

Campos:
- id_servico_realizado
- id_hospedagem
- id_servico
- id_funcionario
- data_realizado
- valor

---

#### Relacionamentos principais
- Um hóspede pode realizar várias reservas.
- Cada reserva pertence a um único hóspede.
- Um quarto pode receber várias reservas ao longo do tempo.
- Cada hospedagem é gerada a partir de uma reserva.
- Uma hospedagem pode possuir vários pagamentos.
- Uma hospedagem pode possuir vários serviços realizados.
- Cada serviço realizado é executado por um funcionário.
- Uma hospedagem pode receber um feedback.
