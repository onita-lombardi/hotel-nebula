USE hotel_nebula;

-- Parte 3: Radar de Comando
-- 1- Quais quartos estão disponíveis em determinado período?
SELECT numero, andar, tipo, preco_diaria
FROM quartos
WHERE id_quarto NOT IN (
    SELECT id_quarto
    FROM reservas
    WHERE '2026-06-10' < data_checkout
	AND '2026-06-15' > data_checkin);

-- 2- Quais hóspedes mais realizaram reservas?
SELECT h.nome, COUNT(r.id_hospede) AS numero_reservas
FROM hospedes h
INNER JOIN reservas r
ON h.id_hospede = r.id_hospede
GROUP BY r.id_hospede
ORDER BY numero_reservas DESC, h.nome ASC;

-- 3- Qual foi o faturamento por mês?
SELECT YEAR(data_pagamento) AS ano, MONTH(data_pagamento) AS num_mes, MONTHNAME(data_pagamento) AS mes, SUM(valor) AS faturamento
FROM pagamentos
GROUP BY mes, num_mes, ano
ORDER BY ano DESC, num_mes ASC;

-- 4- Quais serviços extras são mais consumidos?
SELECT s.servico_nome, COUNT(sr.id_servico) AS quantidade
FROM servicos s
INNER JOIN servicos_realizados sr
ON s.id_servico = sr.id_servico
GROUP BY sr.id_servico
ORDER BY quantidade DESC, s.servico_nome ASC;

-- 5- Quais quartos receberam melhores avaliações?
SELECT q.numero, q.andar, q.tipo, AVG(f.quant_estrelas) AS media_avaliacoes
FROM feedbacks f
INNER JOIN hospedagens h
ON f.id_hospedagem = h.id_hospedagem
INNER JOIN reservas r
ON h.id_reserva = r.id_reserva
INNER JOIN quartos q
ON r.id_quarto = q.id_quarto
GROUP BY r.id_quarto
ORDER BY media_avaliacoes DESC;

-- 6- Quais reservas foram canceladas?
SELECT COUNT(*) AS quant_reservas_canceladas
FROM reservas
WHERE status_reserva = 'Cancelada';

-- 7- Quantas hospedagens cada profissional atendeu?
SELECT f.nome, COUNT(DISTINCT sr.id_hospedagem) AS quant_hospedagens_atendidas
FROM funcionarios f
INNER JOIN servicos_realizados sr
ON f.id_funcionario = sr.id_funcionario
GROUP BY sr.id_funcionario
ORDER BY quant_hospedagens_atendidas DESC, nome ASC;
