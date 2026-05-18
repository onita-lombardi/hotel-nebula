USE hotel_nebula;

-- hospedes
INSERT INTO hospedes(nome, email, cpf, telefone, data_nascimento)
VALUES ('Maria Joaquina', 'mariaj@email.com', '11111111111', '1140028922', '2000-01-01'),
	   ('João Pedro', 'joaop@email.com', '22222222222', '1140028923', '1990-07-13'),
       ('Filomena Filo', 'filomenaf@email.com', '33333333333', '1140028924', '1980-02-21');

-- quartos
INSERT INTO quartos(numero, andar, tipo, capacidade, preco_diaria, status_quarto)
VALUES ('101', '1', 'Standard', 2, 250.00, 'Disponivel'),
	   ('205', '2', 'Luxo', 4, 450.00, 'Ocupado'),
	   ('310', '3', 'Suite Master', 6, 850.00, 'Disponivel');

-- servicos
INSERT INTO servicos(servico_nome, valor)
VALUES ('Lavanderia', 50.00),
	   ('Room Service', 80.00),
	   ('Cafe da Manha Premium', 40.00);

-- funcionarios
INSERT INTO funcionarios(nome, cargo, cpf, telefone, email, data_nascimento, salario, data_admissao, status_funcionario)
VALUES ('Frederico Santos', 'Recepcionista', '111.222.333-44', '(11)96666-1111', 'frederico.santos@hotel.com' , '1992-04-10', 2500.00, '2022-01-15', 'Ativo'),
	   ('Geraldo Costa', 'Camareira', '555.666.777-88', '(11)95555-2222', 'geraldo.costa@hotel.com', '1988-11-08', 2200.00, '2021-06-20', 'Ativo'),
	   ('Fernanda Lima', 'Gerente', '999.888.777-66', '(11)94444-3333', 'fernanda.lima@hotel.com', '1980-02-18', 6500.00, '2020-03-05', 'Ativo');

-- reservas
INSERT INTO reservas(id_hospede, id_quarto, data_checkin, data_checkout, valor_orcamento, status_reserva)
VALUES (1, 1, '2026-06-01', '2026-06-05', 1000.00, 'Confirmada'),
	   (2, 2, '2026-06-10', '2026-06-15', 2250.00, 'Finalizada'),
	   (3, 3, '2026-07-01', '2026-07-07', 5950.00, 'Pendente');

-- hospedagens
INSERT INTO hospedagens(id_reserva, checkin_real, checkout_real)
VALUES (1, '2026-06-01 14:00:00', '2026-06-05 12:00:00'),
	   (2, '2026-06-10 15:30:00', '2026-06-15 11:00:00'),
	   (3, '2026-07-01 13:00:00', NULL);

-- pagamentos
INSERT INTO pagamentos(id_hospedagem, valor, metodo, data_pagamento)
VALUES (1, 1000.00, 'Cartao de Credito', '2026-06-01'),
	   (2, 2250.00, 'PIX', '2026-06-10'),
	   (3, 3000.00, 'Boleto', '2026-07-01');

-- feedbacks
INSERT INTO feedbacks(id_hospedagem, quant_estrelas, comentario)
VALUES (1, 5, 'Excelente atendimento e quarto muito confortavel.'),
	   (2, 4, 'Boa experiencia, mas o check-in demorou um pouco.'),
	   (3, 3, 'Hospedagem razoavel.');

-- servicos_realizados
INSERT INTO servicos_realizados(id_hospedagem, id_servico, id_funcionario, data_realizado, valor)
VALUES (1, 1, 2, '2026-06-02', 50.00),
	   (1, 2, 1, '2026-06-03', 80.00),
	   (2, 3, 2, '2026-06-11', 40.00);