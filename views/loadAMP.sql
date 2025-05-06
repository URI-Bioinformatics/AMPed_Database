CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `amped_dbuser`@`localhost` 
    SQL SECURITY DEFINER
VIEW `AMPed_prod`.`loadAMP` AS
    SELECT 
        `p`.`amp_id` AS `amp_id`,
        `p`.`name` AS `name`,
        `p`.`accession_no_info` AS `accession_no_info`,
        `p`.`mol_weight` AS `mol_weight`,
        `p`.`aa_sequence` AS `aa_sequence`,
        `p`.`notes` AS `notes`,
        `p`.`length_seq` AS `length_seq`,
        `p`.`Approval_Status` AS `Approval_Status`
    FROM
        `AMPed_prod`.`Peptide` `p`
    WHERE
        (`p`.`Approval_Status` = 'Approved')
    GROUP BY `p`.`amp_id`
    ORDER BY `p`.`name`