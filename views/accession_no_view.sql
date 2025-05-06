CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `amped_dbuser`@`localhost` 
    SQL SECURITY DEFINER
VIEW `AMPed_prod`.`accession_no_view` AS
    SELECT 
        `p`.`id` AS `id`,
        `p`.`amp_id` AS `amp_id`,
        GROUP_CONCAT(CONCAT_WS('|',
                    `an`.`accession_no`,
                    `an`.`database_id`,
                    `ansd`.`search_url`,
                    `ansd`.`search_title_in_php`)
            SEPARATOR '|||') AS `accession_no_info`
    FROM
        ((`AMPed_prod`.`peptide_tbl` `p`
        LEFT JOIN `AMPed_prod`.`accession_no` `an` ON ((`p`.`id` = `an`.`amped_record_id`)))
        LEFT JOIN `AMPed_prod`.`accession_no_source_database` `ansd` ON ((`an`.`database_id` = `ansd`.`id`)))
    GROUP BY `p`.`id`
    ORDER BY `p`.`name`