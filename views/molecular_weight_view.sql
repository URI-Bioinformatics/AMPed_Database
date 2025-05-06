CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `amped_dbuser`@`localhost` 
    SQL SECURITY DEFINER
VIEW `molecular_weight_view` AS
    SELECT 
        `p`.`id` AS `id`,
        `p`.`amp_id` AS `amp_id`,
        (SUM((((LENGTH(`p`.`aa_sequence`) - LENGTH(REGEXP_REPLACE(`p`.`aa_sequence`,
                        `w`.`amino_acid_letter`,
                        ''))) / LENGTH(`w`.`amino_acid_letter`)) * `w`.`perl_weight`)) + 18.015) AS `mol_weight`
    FROM
        (`peptide_tbl` `p`
        JOIN `molecular_weight_table` `w` ON (LOCATE(`w`.`amino_acid_letter`, `p`.`aa_sequence`)))
    GROUP BY `p`.`id`
    ORDER BY `p`.`name`