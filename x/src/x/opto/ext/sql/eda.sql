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

CREATE TABLE Timing_Arcs(
  ID                  INTEGER PRIMARY KEY,
  From_Pin_Name       VARCHAR(255) NOT NULL,
  From_Pin_Cell_Name  VARCHAR(255) NOT NULL,
  To_Pin_Name         VARCHAR(255) NOT NULL,
  To_Pin_Cell_Name    VARCHAR(255) NOT NULL,
  timing_sense        VARCHAR(255) NOT NULL,
  FOREIGN KEY(From_Pin_Name, From_Pin_Cell_Name) REFERENCES CPin(NAME, Cell_Name),
  FOREIGN KEY(From_Pin_Name, From_Pin_Cell_Name) REFERENCES CPin(NAME, Cell_Name)
);

CREATE TABLE Timing_Arcs_LUT(
  ID         INTEGER PRIMARY KEY,
  Arc_ID     INTEGER NOT NULL,
  Table_Type VARCHAR(255) NOT NULL,
  FOREIGN KEY(Arc_ID) REFERENCES Timing_Arcs(ID)
);

CREATE TABLE Timing_Arcs_LUT_Value(
  LUT_ID     INTEGER NOT NULL,
  Index_1    FLOAT NOT NULL,
  Index_2    FLOAT NOT NULL,
  value      FLOAT NOT NULL,
  FOREIGN KEY(LUT_ID) REFERENCES Timing_Arcs_LUT(ID),
  PRIMARY KEY(LUT_ID, Index_1, Index_2)
);
