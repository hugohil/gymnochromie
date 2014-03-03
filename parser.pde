void oscEvent(OscMessage pack) {
	String strmessage;
	OscArgument message = pack.get(0);
	strmessage = message.toString();
	String[] datas = split(strmessage, "/");

	attq = int(datas[1]);
	freq = float(datas[2]);
	ampl = float(datas[3]);
	grav = float(datas[4]);

	if(!freqs.hasValue(freq) && freq != 0.0){
		int i = freqs.size();

		// float r = map(i, 0,36, 17,150);
		// float g = map(i, 0,36, 22,20);
		// float b = map(i, 0,36, 44,5);
		float r = map(freq, 45,81, 17,150);
		float g = map(freq, 45,81, 22,20);
		float b = map(freq, 45,81, 44,5);

		colors[i] = color(r,g,b);
		freqs.append(freq);
		// freqs.sort();
		notes.add(new Note(freq, colors[i]));
	}

	timeline ++;
	if(pack.checkAddrPattern("/end")){
	  	// saveFrame("./final/"+ts+"-####.png");
		// exit();
		thisIsTheEnd = true;
	}
}