create temporary function comma_delimited as 'com.sap.hive.udf.CommaDelimited';

INSERT OVERWRITE DIRECTORY '${output}' select comma_delimited(transaction_id, category1_name, category2_id, cost, price, article_id, name, xml) FROM pos_rows join sections on (pos_rows.transaction_id = sections.article_id) where transaction_id < 30000000 and transaction_id > 50000 ;