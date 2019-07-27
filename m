Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109677763
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 09:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B475B2094;
	Sat, 27 Jul 2019 09:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B475B2094
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564211136;
	bh=4dlY6mnDPA7h5P5jkPQ4VK8Pp/HDnC6nzf8qr39qSsE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EmJ4EVAlYV5pyjYgQeeePC3ZdBRqO4Q2zQhMmFgou91TwNS2znitx6uKQMMo2YKis
	 rqCJaeRP72JsUn35vc4fcIqqvwAefqThgSpuXOAhcOGad2eWUIGK3lloRfCsph5mTQ
	 jczhGYoDZ/FVmZTL5pq284XY/Qg+hBkvrspO5SSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05AE0F802BD;
	Sat, 27 Jul 2019 09:03:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFDCBF802BD; Sat, 27 Jul 2019 09:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E923EF802BD
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 09:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E923EF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qLa2jogw"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 29B4220D9E;
 Sat, 27 Jul 2019 03:03:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 27 Jul 2019 03:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=pAHaDyTslTPVnCK14M5h/Z8NmRrFWPqy6HxcKgiys
 ks=; b=qLa2jogwbc0uoeSvv2K6gBzVZOC5hrFklbE2ubWlUoIHPTAYJm5hi1KAi
 N6p8Uy3nfxjBKgBxRbG9cXJeeKAhO7rRj9QW9xSGMXleLUrsAWGWysiEhYnPQ2w/
 cHqUuUq3pJ53Zjt/BGdCSt///LJZVCPyq63WaIhkApNyIV17keDu9jXt3C9P64Kx
 JjRGjRYLeMSNsVVhcWq9iMiLXUlxXNxktq1C5I2pABkJVagcK45oMkd1qMarfQG8
 SzczeLKHm7AuDK9TCNa5bhni4Sj5eXfI5X8t2kzmb2ygnPCIjLaKdHD3YA1jbAsr
 zZnsvN+7uB41yTYUNZbR1WNA6jWIg==
X-ME-Sender: <xms:T_c7XdNYsqbSuM8xqYLgFafRl7KF_hnea3QnbccgxAj3lvQwmaZ_cw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeehgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
 ertddtreejnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
 ihdrfhhiqeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdplhhisggvrh
 grphgrhidrtghomhdpphgrthhrvghonhdrtghomhenucfkphepudeliedrvdeggedrudel
 uddrkedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenuc
 evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:UPc7Xe_EypJB6HU-zx5Xn1736rEAT6nQwb3Yuai8o7WaG-iIkezt-g>
 <xmx:UPc7XUgrP6uJCJ6q0lTYzH1McqqHPTJZCz5vnDp8vNR6aDZyO2KYkg>
 <xmx:UPc7XWEzmiY5fTALxezIUm5jaxFMxEM4olyPr7TZl1frQzRdl5dcEw>
 <xmx:Ufc7Xf4RjE1yDpxn83pvhmsIlRRcci0uf05jq4F1h5M8E1vIKAuQRQ>
Received: from laptop (unknown [196.244.191.82])
 by mail.messagingengine.com (Postfix) with ESMTPA id 61EDC380076;
 Sat, 27 Jul 2019 03:03:43 -0400 (EDT)
Message-ID: <d2be88083e0eff74d79f711d846d904e7c0772c3.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Paul Menzel <pmenzel+alsa-devel@molgen.mpg.de>
Date: Sat, 27 Jul 2019 10:03:39 +0300
In-Reply-To: <65ac36a7-fdce-77ce-c48e-86bff8699e9c@molgen.mpg.de>
References: <8a3566f3-9a75-eab4-b191-530d7be5afc9@molgen.mpg.de>
 <65ac36a7-fdce-77ce-c48e-86bff8699e9c@molgen.mpg.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: alsa-devel <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Plugged in headphones ignored
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 2019-07-26 at 14:57 +0200, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On 6/27/19 1:02 PM, Paul Menzel wrote:
> 
> > On a Dell OptiPlex 5040 with Linux 5.2-rc6 plugging in a
> > head phone into the front case connector, it is detected
> > just fine and Xfce shows a notification.
> > 
> > Then logging out, turning off the monitor connected over
> > DisplayPort at the end of the day, and turning the monitor
> > back on the next morning, logging in, the state is
> > forgotten. I need to unplug the head phone and plug it
> > back in.
> 
> This is still happening in Linux 5.3-rc1. Additionally, the
> problem also shows up, when starting the (powered-off)
> system with the headphones plugged in. No sound is played.
> After unplugging the headphones, the internal speaker
> outputs the sound. Plugging the headphones back in, sound
> comes over the headphones.
> 
> Here is the difference in of the states.
> 
> ```
> > diff -u alsa-info-1.txt alsa-info-2.txt 
> --- alsa-info-1.txt	2019-07-26 14:44:06.156811664 +0200
> +++ alsa-info-2.txt	2019-07-26 14:44:19.901891301 +0200
> @@ -3,7 +3,7 @@
>  !!ALSA Information Script v 0.4.64
>  !!################################
>  
> -!!Script ran on: Fri Jul 26 12:44:05 UTC 2019
> +!!Script ran on: Fri Jul 26 12:44:19 UTC 2019
>  
>  
>  !!Linux Distribution
> @@ -208,7 +208,7 @@
>    Control: name="Speaker Playback Volume", index=0, device=0
>      ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>    Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
> -  Amp-Out vals:  [0x57 0x57]
> +  Amp-Out vals:  [0x00 0x00]
>    Converter: stream=1, channel=0
>    PCM:
>      rates [0x60]: 44100 48000
> @@ -221,7 +221,7 @@
>      ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>    Device: name="ALC3234 Analog", type="Audio", device=0
>    Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
> -  Amp-Out vals:  [0x00 0x00]
> +  Amp-Out vals:  [0x57 0x57]
>    Converter: stream=1, channel=0
>    PCM:
>      rates [0x60]: 44100 48000
> @@ -326,7 +326,7 @@
>    Control: name="Speaker Playback Switch", index=0, device=0
>      ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>    Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
> -  Amp-Out vals:  [0x00 0x00]
> +  Amp-Out vals:  [0x80 0x80]
>    Pincap 0x00010014: OUT EAPD Detect
>    EAPD 0x2: EAPD
>    Pin Default 0x90170110: [Fixed] Speaker at Int N/A
> @@ -444,7 +444,7 @@
>    Control: name="Headphone Playback Switch", index=0, device=0
>      ControlAmp: chs=3, dir=Out, idx=0, ofs=0
>    Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
> -  Amp-Out vals:  [0x80 0x80]
> +  Amp-Out vals:  [0x00 0x00]
>    Pincap 0x0001001c: OUT HP EAPD Detect
>    EAPD 0x2: EAPD
>    Pin Default 0x0221101f: [Jack] HP Out at Ext Front
> @@ -587,8 +587,8 @@
>    Capabilities: pswitch
>    Playback channels: Front Left - Front Right
>    Mono:
> -  Front Left: Playback [off]
> -  Front Right: Playback [off]
> +  Front Left: Playback [on]
> +  Front Right: Playback [on]
>  Simple mixer control 'Headphone Mic',0
>    Capabilities: pvolume pswitch
>    Playback channels: Front Left - Front Right
> @@ -608,15 +608,15 @@
>    Playback channels: Front Left - Front Right
>    Limits: Playback 0 - 87
>    Mono:
> -  Front Left: Playback 0 [0%] [-65.25dB]
> -  Front Right: Playback 0 [0%] [-65.25dB]
> +  Front Left: Playback 87 [100%] [0.00dB]
> +  Front Right: Playback 87 [100%] [0.00dB]
>  Simple mixer control 'Speaker',0
>    Capabilities: pvolume pswitch
>    Playback channels: Front Left - Front Right
>    Limits: Playback 0 - 87
>    Mono:
> -  Front Left: Playback 87 [100%] [0.00dB] [on]
> -  Front Right: Playback 87 [100%] [0.00dB] [on]
> +  Front Left: Playback 0 [0%] [-65.25dB] [off]
> +  Front Right: Playback 0 [0%] [-65.25dB] [off]
>  Simple mixer control 'PCM',0
>    Capabilities: pvolume
>    Playback channels: Front Left - Front Right
> @@ -698,8 +698,8 @@
>  	control.1 {
>  		iface MIXER
>  		name 'Headphone+LO Playback Volume'
> -		value.0 0
> -		value.1 0
> +		value.0 87
> +		value.1 87
>  		comment {
>  			access 'read write'
>  			type INTEGER
> @@ -707,8 +707,8 @@
>  			range '0 - 87'
>  			dbmin -6525
>  			dbmax 0
> -			dbvalue.0 -6525
> -			dbvalue.1 -6525
> +			dbvalue.0 0
> +			dbvalue.1 0
>  		}
>  	}
>  	control.2 {
> @@ -725,8 +725,8 @@
>  	control.3 {
>  		iface MIXER
>  		name 'Headphone Playback Switch'
> -		value.0 false
> -		value.1 false
> +		value.0 true
> +		value.1 true
>  		comment {
>  			access 'read write'
>  			type BOOLEAN
> @@ -736,8 +736,8 @@
>  	control.4 {
>  		iface MIXER
>  		name 'Speaker Playback Volume'
> -		value.0 87
> -		value.1 87
> +		value.0 0
> +		value.1 0
>  		comment {
>  			access 'read write'
>  			type INTEGER
> @@ -745,15 +745,15 @@
>  			range '0 - 87'
>  			dbmin -6525
>  			dbmax 0
> -			dbvalue.0 0
> -			dbvalue.1 0
> +			dbvalue.0 -6525
> +			dbvalue.1 -6525
>  		}
>  	}
>  	control.5 {
>  		iface MIXER
>  		name 'Speaker Playback Switch'
> -		value.0 true
> -		value.1 true
> +		value.0 false
> +		value.1 false
>  		comment {
>  			access 'read write'
>  			type BOOLEAN
> ```
> 
> Is
> 
> ```
> -  Front Left: Playback [off]
> -  Front Right: Playback [off]
> +  Front Left: Playback [on]
> +  Front Right: Playback [on]
> ```
> 
> the cause?
> 
> > Please find the output alsa-config.sh for the non-working
> > (1) and replugged (2) situations attached.
> > 
> > Is that a Linux kernel problem, or a user space issue?

It looks more like a user space issue. If the kernel reports the
headphone status as unplugged when they're not, then that's a kernel
issue, but I didn't spot any jack status differences in the diff you
posted. You could report[1] a bug on PulseAudio (if you're using it),
and include a "pactl lsit" diff between working and not-working state.

[1] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/issues/new

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
