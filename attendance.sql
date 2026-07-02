SELECT
    atr.orgunitid,
    ou.code AS coursecode,
    ou.name AS coursename,
    atr.name AS registername,
    atss.name AS sessionname,
    atss.sortorder AS sessionsortoder,
    atsc.symbolname,
    atsc.symbolvalue,
    atsc.percentage,
    u.firstname,
    u.lastname,
    u.username
FROM [your_schema_id].attendanceregisters_11_4_6 AS atr
LEFT JOIN [your_schema_id].attendancesessions_11_4_6 AS atss
    ON atr.attendanceregisterid = atss.attendanceregisterid
LEFT JOIN [your_schema_id].attendanceusersessions_11_4_6 AS aus
    ON atss.attendancesessionid = aus.attendancesessionid
INNER JOIN [your_schema_id].attendanceschemes_11_4_6 AS atsc
    ON aus.schemesymbolid = atsc.schemesymbolid
    AND atr.schemeid = atsc.schemeid
INNER JOIN [your_schema_id].organizationalunits_11_4_6 AS ou
    ON atr.orgunitid = ou.orgunitid
INNER JOIN [your_schema_id].users_11_4_6 as u
    ON aus.userid = u.userid
WHERE aus.isdeleted = FALSE
ORDER BY atr.orgunitid, atr.name, atss.sortorder, u.lastname
