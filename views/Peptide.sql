CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `amped_dbuser`@`localhost` 
    SQL SECURITY DEFINER
VIEW `AMPed_prod`.`Peptide` AS
    SELECT 
        `p`.`id` AS `id`,
        `p`.`amp_id` AS `amp_id`,
        `anv`.`accession_no_info` AS `accession_no_info`,
        `p`.`name` AS `name`,
        `mwv`.`mol_weight` AS `mol_weight`,
        `p`.`aa_sequence` AS `aa_sequence`,
        `p`.`notes` AS `notes`,
        LENGTH(`p`.`aa_sequence`) AS `length_seq`,
        `ib`.`Approval_Status` AS `Approval_Status`
    FROM
        (((`AMPed_prod`.`peptide_tbl` `p`
        LEFT JOIN `AMPed_prod`.`Inserted_By` `ib` ON ((`p`.`amp_id` = `ib`.`AMP_ID`)))
        LEFT JOIN `AMPed_prod`.`accession_no_view` `anv` ON ((`p`.`id` = `anv`.`id`)))
        LEFT JOIN `AMPed_prod`.`molecular_weight_view` `mwv` ON ((`p`.`id` = `mwv`.`id`)))
    GROUP BY `p`.`id`
    ORDER BY `p`.`name`