Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5D016035B
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2020 11:08:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 247401671;
	Sun, 16 Feb 2020 11:07:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 247401671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581847688;
	bh=Vq8fQoTVkWO+HzAPKIuR/yimC4o274qCmusQ2gt6qGc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1+iVyGnMpX6+5YAJmjOsvt0DO3Pq7qZoEfjiqy0QlZc/QcHrLOf/zBsrF/9p3jsG
	 a5cPG9pQjuCdmwhf9W1Brt7yPBq9BjS/fOVkQM4Lk+mwJh4jEqJ6lWDkWAuMkBPSjG
	 XEALFs0e9ao4KShSmCM+Pzz5dwvddZt+uYexGWzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40D68F80096;
	Sun, 16 Feb 2020 11:06:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46FC3F80145; Sun, 16 Feb 2020 11:06:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NEUTRAL,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F265BF80096
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 11:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F265BF80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dq8fnmJF"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1EBF82104A;
 Sun, 16 Feb 2020 05:06:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 05:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=VVf7p0Vg05fKuQLR+tPfS1R/JeQ9JjuySuNesX62r
 V8=; b=dq8fnmJFWlXZqw3izWilOl1oPANisln3aPOmT+KGFBrraG8T0dwYIEfWA
 vbtDYMsmUOxp1P/gotA5DFIAaR7ybgK2l4Q6K9J6gRybS34gjp/+SsfcRHbVnA4j
 NHFvMKZg8O3d8DNT5bKXu8QCgzpQhLNigANYvm8rlbDhAJFf0g72jl128QlE00eE
 pXpwYNMiwWr6XjEjvRzunZ66OPyQx7nwqiuIkoKc+FpcPEgOSgAmEbD6LsJHaQ4/
 6sv5LljJ2TbFLixklyOYzd8BmAV32gjjGmGMfs1nqn5F+LG58pKtCc8+gQ6yzEWQ
 C2J5i7XGGy9koieogMIIpVufgUmVw==
X-ME-Sender: <xms:GxRJXm6EL03D_MXBRtTwXE5JC1IZGUns1dk1PdKn20z67hB_if_DrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeeggdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
 mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinhepphgrth
 hrvghonhdrtghomhdplhhisggvrhgrphgrhidrtghomhenucfkphepudeliedrvdeggedr
 udeluddrledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:GxRJXmwc533mrrCMjhexRvmlOq-dVkZUBtIuvdaLjsTipYi48FW1-g>
 <xmx:GxRJXg-AaDtKcV-KZ1SRoui89-zNrGbvIgBMpd4QWNWqsnwo9Weyxw>
 <xmx:GxRJXrriE_-P-MTk2Y3IEoEzKuwQGSdeJ0g0dPZ72wesAQAA0iZexQ>
 <xmx:HBRJXlJBUh__xT7Dhbnbafi4EWy3nD5LIxb3W4mM9vBvEzyRP0fBDg>
Received: from laptop (unknown [196.244.191.90])
 by mail.messagingengine.com (Postfix) with ESMTPA id 939E03060C28;
 Sun, 16 Feb 2020 05:06:18 -0500 (EST)
Message-ID: <99522cac281eb998981ef2552c7e06846171b25f.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: General PulseAudio Discussion
 <pulseaudio-discuss@lists.freedesktop.org>,  Jaroslav Kysela
 <perex@perex.cz>, alsa-devel <alsa-devel@alsa-project.org>
Date: Sun, 16 Feb 2020 12:06:14 +0200
In-Reply-To: <ae7b6d8a745ef718d8a6f3f2d7e4aeabe4f7d2b6.camel@iki.fi>
References: <50ae39498982ba2fc3fc8df1b9f0eac15a2b98c8.camel@iki.fi>
 <cb58008e-e9cc-8390-cfc8-c5c93d31c862@perex.cz>
 <ae7b6d8a745ef718d8a6f3f2d7e4aeabe4f7d2b6.camel@iki.fi>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [alsa-devel] [pulseaudio-discuss] Question about the various
 mixer options in UCM
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

On Sun, 2020-02-16 at 11:42 +0200, Tanu Kaskinen wrote:
> + pulseaudio-discuss@lists.freedesktop.org
> 
> On Sat, 2020-02-15 at 17:25 +0100, Jaroslav Kysela wrote:
> > Dne 15. 02. 20 v 7:29 Tanu Kaskinen napsal(a):
> > > What's the difference between PlaybackVolume, PlaybackMixerElem and
> > > PlaybackMasterElem? Other than the obvious difference that
> > > PlaybackVolume is used only to configure the volume control, whereas
> > > PlaybackMixerElem and PlaybackMasterElem are used also to configure the
> > > mute control.
> > 
> > At first, I don't really know if someone uses PlaybackVolume/PlaybackSwitch. 
> > It was defined for the direct control interface (not the mixer interface). I 
> > do not think that we should support this.
> 
> PlaybackVolume/Switch is currently defined for PandaBoard,
> PandaBoardES, SDP4430 and sof-hda-dsp. Do you mean those definitions
> should be removed and replaced with PlaybackMixerElem? It seems that
> PlaybackVolume and PlaybackSwitch don't always match the same simple
> mixer element (e.g. PandaBoard), so I'm not sure if it's possible to
> use PlaybackMixerElem with those platforms.
> 
> As you know, PulseAudio added support for PlaybackVolume recently.
> Should we remove the support? I'm not against that, if
> PlaybackMixerElem is the canonical way to control volume.
> 
> AFAIK CRAS is a major user of UCM, are there others? I think the CRAS
> developers' opinion would be very useful here.
> 
> > I defined new PlaybackMixerElem to select the simple mixer element which 
> > controls both volume and switch (mute) in the ALSA API. The master volume 
> > might be also in the chain (thus PlaybackMasterElem) was introduced.
> > 
> > It seems that it might be not enough and I play with an idea to build custom 
> > mixer description to handle the special cases (like several speakers with the 
> > different volume controls connected to the single stereo stream etc.).
> > 
> > To keep things simple, I would probably hide all functionality to 
> > PlaybackMixer/PlaybackMixerElem and CaptureMixer/CaptureMixerElem . The 
> > special mixer name will create the abstract mixer for the applications and 
> > only one simple mixer element control will set the appropriate volume for
> > the stream (like pulseaudio actually does for the legacy ALSA support - volume 
> > synthetizer). So UCM will describe the mixer for alsa-lib and application will 
> > use only abstract interface to set / get the volume and mute state.
> 
> Hiding everything behind an abstract mixer element sounds VERY good,
> but how to handle a situation where the application uses two devices at
> the same time and the devices share a volume control? For example, a
> phone playing a ringtone to both headphones and speakers. If the
> headphone output has its own abstract mixer element and the speaker
> output has its own abstract mixer element, the application may imagine
> that it can change the volumes independently, but if the outputs share
> a master volume control that is used by both abstract volume elements,
> the volumes aren't really independent, and the resulting volumes may
> not be what the application intended.
> 
> > Actually, I am also trying to resolve the description of the speaker 
> > configuration. It may not be only enough to give the PCM device, because we 
> > don't know, if user connected the stereo or surround speakers to the sound 
> > card output for example. I play with an idea to add device variants to UCM, 
> > but the question is, how we can map this to pulseaudio profile/port schematics.
> > 
> > My quick idea is to export those variants via the verbs, so the exported verb 
> > names might look like:
> > 
> > HiFi:Speaker-Stereo
> > HiFi:Speaker-5.1
> > 
> > Where 'HiFi' is the verb name, 'Speaker' is the device name and 'Stereo' is 
> > the variant name.
> > 
> > If we need to define multiple variants, all may be exported like:
> > 
> > HiFi:Speaker-5.1,Mic-4.0
> > 
> > Also, we can enhance this and store the configuration to a file, thus 'HiFi' 
> > can refer to 'HiFi@Speaker-5.1,Mic-4.0' by default.
> 
> Verb + list-of-device-variants sounds like a good way to map UCM
> devices to pulseaudio profiles (and if there's just one verb, which I
> expect to be the common case, don't show it in the profile name). I
> don't know how the variants should be configured in UCM, but I know
> that device variants should be able to declare conflicts with other
> devices (or device variants). For example, 5.1 speaker output may make
> recording impossible, while stereo speaker output can be used toghether
> with a mic. If this information is not provided by UCM, pulseaudio will
> have to probe all variant combinations (like it currently does with the
> legacy mixer system).

Sorry, now I realized that the Verb + list-of-device-variants scheme
doesn't really work after all as the profile scheme. Or maybe it does,
but it's significantly different from what we do currently. Switching
between Headphones and Speaker-Stereo often doesn't require reopening
the PCM device, so there's no need for separate Headphones and Speaker-
Stereo profiles. I guess we could still create separate profiles, it
just means that the profile list will get much longer.

We could add a separate optimization step to the profile creation
process. That is, first create all possible device-variant combinations
as the initial profile list, and then inspect which profiles can be
merged. Naming the merged profiles becomes a problem, but I imagine
it's solvable with static rules (e.g. merging Speakers-Stereo and
Headphones becomes Analog-Stereo), and if necessary the merging can be 
improved gradually over time.

From profile creation perspective the ideal scheme would be not based
on UCM devices but on PCM devices and their configuration variants, but
I imagine naming would be an even bigger problem with this scheme (how
to map PCM device names to sensible user friendly names?).

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
