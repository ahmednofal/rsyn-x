CREATE TABLE Block(
  NAME        VARCHAR(255) NOT NULL,
  PRIMARY KEY(NAME)
);

CREATE TABLE BPin(
  NAME        VARCHAR(255) NOT NULL,
  x           INT,
  y           INT,
  dir         VARCHAR(255) NOT NULL,
  Block_Name  VARCHAR(255) NOT NULL,
  PRIMARY KEY(NAME),
  FOREIGN KEY(Block_Name) REFERENCES Block(NAME)
);

CREATE TABLE Inst(
  NAME        VARCHAR(255) NOT NULL,
  x           INT,
  y           INT,
  Cell_Name   VARCHAR(255) NOT NULL,
  PRIMARY KEY(NAME),
  FOREIGN KEY(Cell_Name) REFERENCES Cell(NAME)
);

CREATE TABLE Cell(
  NAME        VARCHAR(255) NOT NULL,
  type        VARCHAR(255),
  height      INT NOT NULL,
  width       INT NOT NULL,
  PRIMARY KEY(NAME)
);

CREATE TABLE CPin(
  NAME        VARCHAR(255) NOT NULL,
  dir         VARCHAR(255) NOT NULL,
  y           INT,
  x           INT,
  cap         INT,
  Cell_Name   VARCHAR(255) NOT NULL,
  PRIMARY KEY(NAME, Cell_Name),
  FOREIGN KEY(Cell_Name) REFERENCES Cell(NAME)
);

CREATE TABLE Net(
  NAME        VARCHAR(255) NOT NULL,
  length      INT,
  PRIMARY KEY(NAME)
);

CREATE TABLE Net_BPin(
  Net_Name    VARCHAR(255) NOT NULL,
  BPin_Name   VARCHAR(255) NOT NULL,
  FOREIGN KEY(Net_Name) REFERENCES Net(NAME),
  FOREIGN KEY(BPin_Name) REFERENCES BPin(NAME),
  PRIMARY KEY(Net_Name, BPin_Name)
);


CREATE TABLE Net_CPin_Inst(
  Net_Name    VARCHAR(255) NOT NULL,
  CPin_Name   VARCHAR(255) NOT NULL,
  CPin_CName  VARCHAR(255) NOT NULL,
  Inst_Name   VARCHAR(255) NOT NULL,
  FOREIGN KEY(Net_Name) REFERENCES Net(NAME),
  FOREIGN KEY(CPin_Name, CPin_CName) REFERENCES CPin(NAME, Cell_Name),
  FOREIGN KEY(Inst_Name) REFERENCES Inst(NAME),
  PRIMARY KEY(Net_Name, CPin_Name, CPin_CName, Inst_Name)
);

