# Compiler settings
JAVAFLAGS=-g

# Pattern for compiling Java code
%.class: %.java
	javac ${JAVAFLAGS} $*.java

all: pie.jar

pie.jar: Pie.class PieSlicer.class PieView.class
	jar cfe pie.jar PieSlicer *.class

PieSlicer.class: PieSlicer.java PieView.class Pie.class
	
Pie.class: Pie.java
	
PieView.class: PieView.java Pie.class

clean:
	rm *.jar *.class
