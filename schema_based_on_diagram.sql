CREATE TABLE patients{
  id SERIAL PRIMARY KEY ,
  name VARCHAR(100),
  date_of_birth DATE
}

CREATE TABLE invoices{
  id SERIAL PRIMARY KEY ,
  total_amount REAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) REFERENCES
  medical_histories(id)
}

CREATE TABLE invoice_items{
  id SERIAL PRIMARY KEY ,
  unit_price REAL,
  quintity INT,
  total_price REAL,
  inovice_id INT,
  treatment_id INT,
  FOREIGN KEY(inovice_id) REFERENCES
  invoices(id),
  FOREIGN KEY(treatment_id) REFERENCES
  treatments(id)
}

CREATE TABLE treatments{
  id SERIAL PRIMARY KEY ,
  type VARCHAR(100),
  name VARCHAR(100)
}

CREATE TABLE medical_histories{
  id SERIAL PRIMARY KEY ,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR(100)
  FOREIGN KEY (patient_id) REFERENCES
  patients(id)
}

-- Many to many join table for Medical_histories and treatments

CREATE TABLE medical_treatments{
  medical_histories_id INT,
  treatments_id INT,
  PRIMARY KEY (medical_histories_id,treatment_id),
  FOREIGN KEY (treatments_id) REFERENCES
  treatments(id),
  FOREIGN KEY (medical_histories_id) REFERENCES
  medical_histories(id)
    
}

CREATE INDEX idx_medical_histories ON medical_treatments(medical_histories_id DESC);
CREATE INDEX idx_treatment_id ON medical_treatments(treatment_id ASC);