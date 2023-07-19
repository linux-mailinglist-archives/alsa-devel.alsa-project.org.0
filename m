Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8304758FE5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 10:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4255112;
	Wed, 19 Jul 2023 10:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4255112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689754154;
	bh=2PrnpjzALn/zzpa53AeYvdnhIjcEgggoRW7pq0/1Rkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gx6tgrw93r8vcd1Ndl2+EvJRaH4FU5eBvZbmB9whJ2PWtG4DBGR78MKY7tg1TbUxe
	 7QJO0Pc+A9AKAUOhVCkOuTM+b7MLILzQWvLgdsP2Wx3f8mYNxO7XkdH6+C195dGgrv
	 Msc3Rsqq3qv3OsTSUtkbwmJSqNdp2I0LkyVq6nGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B13ACF80520; Wed, 19 Jul 2023 10:08:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACDBF8032D;
	Wed, 19 Jul 2023 10:08:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0B7F8047D; Wed, 19 Jul 2023 10:08:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B7B7F8007E
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 10:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7B7F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LeZx9uTJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AP+RDI29
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 644E1219A5;
	Wed, 19 Jul 2023 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689754085;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IB/B0VxfpWsD/SY4kNzWY9fDJ8L/pNb+Cy08sowV2JQ=;
	b=LeZx9uTJtggPEtCWXBObTt8O6HQbXhDoRyi0wQYrnIPEY8m3o4kP8Xm9Ju8Ldch6lsAxHl
	CwGrWbDKRkDMg45BbzIOTA3unxezDC+Uza+AqAXbELvYxSufto6fZOEjHWN1JXqK55QSpZ
	e//T8D73ZmJtOSbyPzajmgjjpone/vA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689754085;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IB/B0VxfpWsD/SY4kNzWY9fDJ8L/pNb+Cy08sowV2JQ=;
	b=AP+RDI291yIWU9wFSqryFXTQ8HWcwSVopygMYoZ30TXFw+S/dMu0kKn//Der4JHL7AbuMZ
	eyIAVF85W17OA2BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4229213460;
	Wed, 19 Jul 2023 08:08:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JKFAD+WZt2Q2cgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 19 Jul 2023 08:08:05 +0000
Date: Wed, 19 Jul 2023 10:08:04 +0200
Message-ID: <87r0p4l3x7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ico Bukvic <ico@vt.edu>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: Fwd: Odd issue with ALSA connecting directly to HDMI audio output
In-Reply-To: 
 <CAJrgGbbe5rmCS0UK7_Qc=+PR1LCBSU-oRRX2zB_Ljsq2J15oFw@mail.gmail.com>
References: 
 <CAJrgGbZfPYHhf+p1TJO_LQe=pxkxDtAMPsY6sXOh1xVxq0b69w@mail.gmail.com>
	<CAJrgGbbg-WQ1iAqsG9fe559FvOQUz-hmxj08wcP1oDPTXUyeqQ@mail.gmail.com>
	<ZLbH+qC2j9FQ5pTE@geday>
	<ZLddxy5Bxgudk9vi@geday>
	<CAJrgGbbe5rmCS0UK7_Qc=+PR1LCBSU-oRRX2zB_Ljsq2J15oFw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KWTL3HQ7QLDQQYQBER433FB73KDUE5TB
X-Message-ID-Hash: KWTL3HQ7QLDQQYQBER433FB73KDUE5TB
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWTL3HQ7QLDQQYQBER433FB73KDUE5TB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 07:58:17 +0200,
Ico Bukvic wrote:
> 
> Thank you for a follow-up. How would one set such a flag in alsa? Using
> alsactl or by editing a config file? The app in question seeks to open the
> audio hardware directly to minimize latency. Any examples are appreciated.

Could you show how exactly you did test?

The fact that PA works implies that the device is basically working
when running with a proper setup (e.g. with hdmi:* PCM, etc.)


Takashi

> 
> Best,
> 
> Ico
> 
> -- 
> Ivica Ico Bukvic, D.M.A.
> Director, Creativity + Innovation
> Director, Human-Centered Design iPhD
> Institute for Creativity, Arts, and Technology
> 
> Virginia Tech
> Creative Technologies in Music
> School of Performing Arts – 0141
> Blacksburg, VA 24061
> (540) 231-6139
> ico@vt.edu
> 
> ci.icat.vt.edu
> l2ork.icat.vt.edu
> ico.bukvic.net
> 
> 
> 
> On Tue, Jul 18, 2023 at 11:51 PM Geraldo Nascimento <
> geraldogabriel@gmail.com> wrote:
> 
> > On Tue, Jul 18, 2023 at 02:12:31PM -0300, Geraldo Nascimento wrote:
> > > On Tue, Jul 18, 2023 at 12:22:35PM -0400, Ico Bukvic wrote:
> > > > Hi all,
> > >
> > > Hi Ico and friends,
> > >
> > > >
> > > > I have a consumer-level setup audio question. My research project uses
> > a
> > > > Raspberry Pi in conjunction with a small portable monitor that has
> > built-in
> > > > loudspeakers that are to be used via HDMI connection. The goal here is
> > > > portability and minimal cost.
> > > >
> > > > Curiously, when trying to connect to monitor's loudspeakers (via HDMI)
> > > > using ALSA, no matter what settings I pick, at worst I cannot get
> > > > audio out, and at best, get a buzzy sound whose waveform is in the
> > attached
> > > > image. The sound is clearly periodic and impulse-like. It happens
> > every 59
> > > > samples. Changing sample rate increases pitch, suggesting 59 samples
> > remain
> > > > constant regardless of the sampling rate. When playing the actual
> > audio,
> > > > you can hear it in the background, but this buzz is easily
> > overpowering it.
> > > >
> > >
> > > Ico, just a wild guess but are you sure you are not capturing the raw
> > SPDIF
> > > signal going through HDMI instead of Linear PCM audio signal?
> >
> > Here's a comment from the VC4 HDMI driver:
> >
> >  * HDMI audio is implemented entirely within the HDMI IP block.  A
> >  * register in the HDMI encoder takes SPDIF frames from the DMA engine
> >  * and transfers them over an internal MAI (multi-channel audio
> >  * interconnect) bus to the encoder side for insertion into the video
> >  * blank regions.
> >
> > And there's this perhaps closely related old issue with the vendor
> > kernel and Android:
> > https://github.com/raspberrypi/linux/issues/4654
> >
> > >
> > > > Changing sample rate or bit depth, or buffering, makes no difference.
> > > > Selecting 8 channels for output (one of HDMI's standards, as far as I
> > can
> > > > tell), sometimes manages to output a tiny chunk of a good audio
> > sample, and
> > > > then goes silent.
> > > >
> > > > Now, even more curiously, when using the portaudio backend and
> > connecting
> > > > to the default pulseaudio sink, works just fine. What could be causing
> > this
> > > > discrepancy?
> > >
> > > Perhaps PortAudio is forcing the Linear PCM bits on the underlying ALSA
> > > backend somehow, see for example:
> > > https://fossies.org/linux/alsa-lib/src/conf/pcm/iec958.conf
> > > But this is just wild speculation, it may or may not be the case with
> > > your report. It's best if you ask Takashi Iwai and Jaroslav Kysela
> > > directly through the list with Cc: in case nobody else has any more
> > > ideas of what could be the root cause of your report.
> >
> > You're probably sending PCM data to HDMI, which expects SPDIF frames
> > instead, and PortAudio + PulseAudio seems to be aware of this. That's my
> > theory at least. Setting the necessary bits and necessary IEC958 format
> > on your ALSA playback may resolve your issue.
> >
> > >
> > > Good luck,
> > > Geraldo Nascimento
> > >
> > > >
> > > > Best,
> > > >
> > > > Ico
> > > >
> > > > --
> > > > Ivica Ico Bukvic, D.M.A.
> > > > Director, Creativity + Innovation
> > > > Director, Human-Centered Design iPhD
> > > > Institute for Creativity, Arts, and Technology
> > > >
> > > > Virginia Tech
> > > > Creative Technologies in Music
> > > > School of Performing Arts – 0141
> > > > Blacksburg, VA 24061
> > > > (540) 231-6139
> > > > ico@vt.edu
> > > >
> > > > ci.icat.vt.edu
> > > > l2ork.icat.vt.edu
> > > > ico.bukvic.net
> > >
> > >
> >
