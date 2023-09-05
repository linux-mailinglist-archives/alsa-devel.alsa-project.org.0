Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A212C791FDD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 03:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E94A7F1;
	Tue,  5 Sep 2023 03:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E94A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693876913;
	bh=FTmsSCHXCYfqeIBLmNn7whpR9v+nlv0f54RXkyNwBu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B844cBzYlj1gyHFiOFz9EgykQXLkD8RSmxDeHJOog7x6s+zC1tIcs5M0+ztUS9245
	 B7OMTKx1gbPiHpUwjYl/t2SpC9Zzj5aLNfz8mw1NqLTGo/mI5x4iOybhTOjWY2CPuI
	 FzvgyQ30XyWxPuX5hg81zSlJf66s5UUlDLBTUebM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA45BF80527; Tue,  5 Sep 2023 03:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2021F80431;
	Tue,  5 Sep 2023 03:20:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 679C0F8047D; Tue,  5 Sep 2023 03:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64FADF800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 03:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64FADF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=mPZgk+Dn;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BRxznrdF
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BBDB23200945;
	Mon,  4 Sep 2023 21:20:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 04 Sep 2023 21:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1693876833; x=
	1693963233; bh=02Q6GEVYd/OOFm1jiN44dR3+OQ5KZE4cKSVS47Oq3Fw=; b=m
	PZgk+Dns0pJca7ULzFWJy8OkRNTczfJWr1Kgzw0na1HxbZbKViXuL3bPEd8Gsnqy
	L0WR4DUH0WeZU0wSEUB+7BuRL5GL6eKj5CmFb9Lrsan0/7ZeNRTM79MkW+TEKyaz
	S9hx+LA7hhGhZk/DxKxS2MeH1Fb9DE+E5iJ76xl+Uv3gRbY+W93RpgBaixv112J4
	lYD5pLqFumhym2jdOXcXh5C8UlyfxJ12Gf91+/lWNpMargVTvwI1BWgHBYARRkYZ
	ab25UTgn6ctuTj+YEpcxu9CvLTT1Ut3C3OLFCe1RFynmD4dJqTZ6ylLNrMH3U1Gw
	zMKZgLjPEtrtoqDp3tWrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693876833; x=1693963233; bh=02Q6GEVYd/OOF
	m1jiN44dR3+OQ5KZE4cKSVS47Oq3Fw=; b=BRxznrdF1p32lK70GJFzF+a/x2iEz
	yzP3zHiXf6g9gSE2CoXRYlE4YyYJ7bSBmNuJtA5155aGJE5Yqb715Ea5ac6Rq1KU
	TfKCjrMOCjMh2Hj5gA3vkyb4N7mSP2R73r5q9922g+wE/u6GsUVUjj067idw1U9X
	bmZQ9mdzQkdpAkCjpgT4OpdcgsvwPrl7GpALIqSKW0TC5QL1jXBntOGFcKM3GHqI
	qrji5cgyKpHF121u6o5f2WqE/z/JsVxFD61FPP7EmSj2faahMavppHfjyXwSxGNy
	MQ5EX0hEXDFBrg88csOh6CGkGDkPgG/iGnYntFHMsFq37VcRui0ugSoyQ==
X-ME-Sender: <xms:YYL2ZP7Y5WJKarL8o5Sz_phdaJczSuFwhDc10Qytk90-OUYw9uDc0g>
    <xme:YYL2ZE607zIFe58pA56YcBg6wVLP2rsoKdHisvZmZ-FEdLn7f4pqqUrmFWYi1n7Wd
    KrVjYSi5wcYQaN_6MM>
X-ME-Received: 
 <xmr:YYL2ZGcxVt_lxmUQWQ7OzveSYDuXjOd-t7KFOv4tTIqOzK_vwSPXz6ourpECwb6sgUxKkfKp3e5iRHtxvRietrX3vdNpbGtyIoc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudegledggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepudefheffffeugfdugeehfefgvdeikefgffehudeu
    geehhedtvdetudfgvdevgeetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdptghrrg
    htvghsrdhiohdpughotghsrdhrshdpuggvsghirghnrdhorhhgpdguvggsihgrnhdrnhgv
    thenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqd
    htrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:YYL2ZAL_7KlEi7d0uCy39-gJP5mP5bSKTU-QThAaC_t8R2Bo9WLm6w>
    <xmx:YYL2ZDIkIFWe9o0uRYcKqj8szp2ES-k0yRN1yC5lvxxW4MtesyDA1Q>
    <xmx:YYL2ZJzxMlqD57YyjDv0Oy1sFztgOU7N1DbVxZPMeJXDRKQ185S4rA>
    <xmx:YYL2ZJgokE6jEAHo8flYgJT0JaNnEGdPJ_WqH1Tangi4e5DkGLVG0w>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Sep 2023 21:20:32 -0400 (EDT)
Date: Tue, 5 Sep 2023 10:20:28 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Rolf Anderegg <rolf.anderegg@weiss.ch>
Cc: alsa-devel@alsa-project.org, Michele Perrone <michele.perrone@weiss.ch>
Subject: Re: ALSA: dice: improve support for Weiss devices
Message-ID: <20230905012028.GA262570@workstation.local>
Mail-Followup-To: Rolf Anderegg <rolf.anderegg@weiss.ch>,
	alsa-devel@alsa-project.org,
	Michele Perrone <michele.perrone@weiss.ch>
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20230728131308.GA142765@workstation.local>
 <7a0cf3fd-9e31-45e1-7aa4-97cab27dafa7@weiss.ch>
 <20230731140655.GA367100@workstation.local>
 <81450de2-3bf5-cb96-114f-6d75314e5a03@weiss.ch>
 <20230808152511.GA729027@workstation.local>
 <a41c675d-c1bd-4e89-9519-63b2b088f16d@weiss.ch>
 <20230822135807.GA470519@workstation.local>
 <20230831132817.GB174574@workstation.local>
 <d102d417-c34d-b4f5-f037-e5460c01ea58@weiss.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d102d417-c34d-b4f5-f037-e5460c01ea58@weiss.ch>
Message-ID-Hash: SOYO2LZFM2JPJS6BIIUEXEC4TEXS2JWT
X-Message-ID-Hash: SOYO2LZFM2JPJS6BIIUEXEC4TEXS2JWT
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOYO2LZFM2JPJS6BIIUEXEC4TEXS2JWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rolf,

On Mon, Sep 04, 2023 at 06:00:24PM +0200, Rolf Anderegg wrote:
> Hi Takashi,
> 
> Glad that we could be of help.
> We checked this on the firmware side and yes, we can confirm that the
> Weiss MAN301 is the only device with AV/C protocol (using vendor dependent
> commands).
 
OK. It is good firmware design to make snd-dice-ctl-service simpler.

> We are deploying a small set of commands in order to probe and control
> the parameters on the MAN301:
> 
> WEISS_CMD_ID_DEV_CONST:
> 	probe the number of parameters
> 
> WEISS_CMD_ID_PARAM_OP:
> 	read/write to a parameter
> 
> WEISS_CMD_ID_PARAM_INFO:
> 	read parameter info (index, type, iface type, name)
> 
> WEISS_CMD_ID_ENUM_ITEM_INFO:
> 	read parameter enum type info
> 
> This allows us to populate and control snd-control instances that represent
> the device's featured parameters [1].
> 
> How would you like to proceed for `snd-firewire-ctl-services`?
> We can start by giving you the output of `amixer contents` for the MAN301,
> so you see all the controls and their possible values (see below).
 
Great. In my current plan for snd-dice-ctl-service, action items would
be enumerated in below:

1. Add support for all of models except for MA301 (need additional work to
   current MR to exclude MA301)
2. implement the vendor dependent command to `firewire-dice-protocols`
   crate[2] with dependency on `ta1394_avc_general` crate[3]
3. implement the control primitives to `firewire-dice-protocols` in the
   fasion of hard-code
4. Add support for MA301

The reason of hard-code against your implementation in dice-avc.c is
to express hardware specification in code. FireWire audio devices are 
nowadays not updated anymore, and I think the explicit control primitives
is helpful to remaining users.

[1] https://github.com/alsa-project/snd-firewire-ctl-services/pull/175
[2] https://crates.io/crates/firewire-dice-protocols
[3] https://docs.rs/ta1394-avc-general/latest/ta1394_avc_general/

> Let us know if there's any additional information we can provide.

If the control primitives have been changed (newly added or abandoned)
between several firmware versions, I would like you to inform it to me.

> Kind regards,
> Rolf Anderegg
> 
> 
> [1] https://github.com/weiss-engineering/snd-dice/blob/avc/dice-avc.c
 
Thanks for your delivery of useful information for Weiss models. It is
my pleasure to maintain Linux systems to use them for 6 more years.


Regards

Takashi Sakamoto

> --
> $ amixer contents
> numid=3,iface=CARD,name='Dual Wire Mode Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off
> numid=4,iface=CARD,name='Dual Wire Word Clock Half Rate Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off
> numid=1,iface=CARD,name='Sync source'
>   ; type=ENUMERATED,access=rw------,values=1,items=13
>   ; Item #0 'AES1'
>   ; Item #1 'AES2'
>   ; Item #2 'AES3'
>   ; Item #3 'AES4'
>   ; Item #4 'AES'
>   ; Item #5 'ADAT'
>   ; Item #6 'TDIF'
>   ; Item #7 'Wordclock'
>   ; Item #8 'ARX1'
>   ; Item #9 'ARX2'
>   ; Item #10 'ARX3'
>   ; Item #11 'ARX4'
>   ; Item #12 'Internal'
>   : values=2
> numid=10,iface=MIXER,name='DAC::Analog Output Level'
>   ; type=ENUMERATED,access=rw------,values=1,items=4
>   ; Item #0 '0 dB'
>   ; Item #1 '-10 dB'
>   ; Item #2 '-20 dB'
>   ; Item #3 '-30 dB'
>   : values=1
> numid=8,iface=MIXER,name='DAC::DAC Filter Type'
>   ; type=ENUMERATED,access=rw------,values=1,items=2
>   ; Item #0 'A'
>   ; Item #1 'B'
>   : values=0
> numid=9,iface=MIXER,name='DAC::DAC Output Playback Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
> numid=7,iface=MIXER,name='DAC::DAC Polarity Inversion Playback Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=off
> numid=2,iface=MIXER,name='Digital Input Capture Route'
>   ; type=ENUMERATED,access=rw------,values=1,items=3
>   ; Item #0 'AES/EBU (XLR)'
>   ; Item #1 'S/PDIF (RCA)'
>   ; Item #2 'S/PDIF (TOS)'
>   : values=2
> numid=6,iface=MIXER,name='RCA::RCA Output Playback Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
> numid=5,iface=MIXER,name='XLR::XLR Output Playback Switch'
>   ; type=BOOLEAN,access=rw------,values=1
>   : values=on
> 
> On 31.08.23 15:28, Takashi Sakamoto wrote:
> > Hi Michele,
> > 
> > Thanks for your contribution of configuration ROM for Weiss models[1].
> > I'm sorry for my little reaction but currently I'm working for Debian ITP
> > to linux-firewire-utils package[2][3].
> > 
> > As a quick glance, all of configuration ROMs except for Weiss MAN301
> > include single unit directory, while the exception includes two unit
> > directories; 1394TA AV/C protocol and TCAT protocol. It means that
> > the vendor-dependent AV/C command[4] is implemented in MAN301, but not
> > in the others. Then I would like to figure out whether it is correct or
> > not. If it is unique for MAN301, the implementation of control service
> > can be simpler to support the command just for MAN301.
> > 
> > [1] https://github.com/takaswie/am-config-roms/pull/5
> > [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1050551
> > [3] https://mentors.debian.net/package/linux-firewire-utils/
> > [4] https://github.com/weiss-engineering/snd-dice/blob/avc/dice-avc.c
> > 
> > 
> > Regards
> > 
> > Takashi Sakamoto
