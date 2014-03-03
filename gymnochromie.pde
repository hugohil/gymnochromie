import oscP5.*;
import netP5.*;

OscP5 oscLoc;
NetAddress remoteLoc;
String ts = year()+"-"+nf(month(),2)+"-"+nf(day(),2)+"-"+nf(hour(),2)+"-"+nf(minute(),2)+"-"+nf(second(),2);

float attq, freq, ampl, grav;
float rot, rotFactor; boolean rotMore;
FloatList freqs = new FloatList();
ArrayList<Note> notes = new ArrayList<Note>();
boolean thisIsTheEnd = false;

float timeline, rnote, rprop;
color[] colors = new color[36];

void setup(){
	size(displayWidth,displayHeight);
	background(255);
	smooth(8);
	noStroke();
	
	oscLoc = new OscP5(this,"127.0.0.1", 5050);
	remoteLoc = new NetAddress("127.0.0.1", 5050);
	
	timeline = 0;
	rot = PI/4;
	rotFactor = 0.01;
	rotMore = false;
	rnote = 60;
}
int folder = 0;
void draw(){
	fill(200,180);
	rect(0,0,width,height);
	float theta = 0;
	float off = TWO_PI/notes.size();
	rprop = notes.size()*(rnote/10);
	if(attq == 1) rotMore = true;

	pushMatrix();
		translate(width/2, height/2);
		rotate(rot*0.1);
		for (int i = 0; i < notes.size(); i++){
			Note n = notes.get(i);
			n.update();
			n.display(theta);
			theta += off;
		}
	popMatrix();

	rot += rotFactor;
	if(rotMore) rotFactor += 0.005;
	if(rotFactor > 0.1) rotMore = false;
	if(!rotMore) rotFactor -= 0.005;
	if(rotFactor < 0.01) rotFactor = 0.01;

	// if(frameCount%1800 == 0) folder ++; // si 1 seul folder, au bout de ~900 img le folder est trop lourd et ça bug
	// if(frameCount%2 == 0) saveFrame("./output-"+folder+"/#####.tif");
	if(thisIsTheEnd) end();
}

class Note {
	float f;
	float r, op;
	float ampnote = 0;
	float brush = 0;
	boolean gotocenter = false;
	color c;

	Note(float _f, color _c){
		f = _f;
		r = rprop;
		op = 255;
		c = _c;
	}

	void update(){
		if(f == freq && ampl > 70) {
			if(timeline/60 > 12) gotocenter = true;
			ampnote = -ampl/3;
			op = 0;
		}
		if(ampnote < 0) ampnote ++;
		if(r < rprop && !gotocenter && !thisIsTheEnd) r += 5;
		if(op < 255 && !thisIsTheEnd) op += 15;
		if(gotocenter) go();
	}

	void go() {
		brush = -(grav*.008);
		r -= 4;
		if(r < rprop/2) gotocenter = false;
	}

	void display(float t){
		fill(c, op);
		ellipse(cos(t)*r, sin(t)*r, rnote+ampnote+brush, rnote+ampnote+brush);
	}

}

float a, finalcountdown = 0;
void end() {
	a = map(finalcountdown,0,120,0,255);
	fill(200,a);
	rect(0,0,width,height);
	finalcountdown ++;
}
