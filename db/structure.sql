CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "redeem_pages" ("id" varchar NOT NULL PRIMARY KEY, "title" varchar, "status" integer, "administrative_link" varchar, "redemption_link" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "redeems" ("id" varchar NOT NULL PRIMARY KEY, "status" integer, "redeem_page_id" varchar, "redeemer_name" varchar, "redeemer_email" varchar, "redeemer_document_number" varchar, "redeemer_zipcode" varchar, "redeemer_street" varchar, "redeemer_number" varchar, "redeemer_complement" varchar, "redeemer_neighborhood" varchar, "redeemer_city" varchar, "redeemer_state" varchar, "redeemer_country" varchar, "redeemer_phone" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_e7f4552695"
FOREIGN KEY ("redeem_page_id")
  REFERENCES "redeem_pages" ("id")
);
CREATE INDEX "index_redeems_on_redeem_page_id" ON "redeems" ("redeem_page_id");
CREATE TABLE IF NOT EXISTS "questions" ("id" varchar NOT NULL PRIMARY KEY, "redeem_page_id" varchar, "answer_type" integer, "question" varchar, "options" json DEFAULT '[]', "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_f0e8b24c1e"
FOREIGN KEY ("redeem_page_id")
  REFERENCES "redeem_pages" ("id")
);
CREATE INDEX "index_questions_on_redeem_page_id" ON "questions" ("redeem_page_id");
CREATE TABLE IF NOT EXISTS "answers" ("id" varchar NOT NULL PRIMARY KEY, "question_id" varchar, "redeem_id" varchar, "answer" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_3d5ed4418f"
FOREIGN KEY ("question_id")
  REFERENCES "questions" ("id")
, CONSTRAINT "fk_rails_caf97b6c76"
FOREIGN KEY ("redeem_id")
  REFERENCES "redeems" ("id")
);
CREATE INDEX "index_answers_on_question_id" ON "answers" ("question_id");
CREATE INDEX "index_answers_on_redeem_id" ON "answers" ("redeem_id");
CREATE TABLE IF NOT EXISTS "items" ("id" varchar NOT NULL PRIMARY KEY, "customer_product_id" varchar, "redeem_page_id" varchar, "quantity" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_35d6a6daf7"
FOREIGN KEY ("redeem_page_id")
  REFERENCES "redeem_pages" ("id")
);
CREATE INDEX "index_items_on_redeem_page_id" ON "items" ("redeem_page_id");
CREATE TABLE IF NOT EXISTS "sizes" ("id" varchar NOT NULL PRIMARY KEY, "item_id" varchar, "name" varchar, "inventory_amount" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_681009f999"
FOREIGN KEY ("item_id")
  REFERENCES "items" ("id")
);
CREATE INDEX "index_sizes_on_item_id" ON "sizes" ("item_id");
INSERT INTO "schema_migrations" (version) VALUES
('20241218210733'),
('20241218210634'),
('20241218204938'),
('20241218204747'),
('20241218204113'),
('20241218203759');

