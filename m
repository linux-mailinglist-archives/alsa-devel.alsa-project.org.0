Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C7704207
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 02:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66EF01EC;
	Tue, 16 May 2023 02:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66EF01EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684195394;
	bh=YkiK5DA4GEIf3izxIneUwrRADokT8J8XzUeePCGEfyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O+O2yH/ePMSfzKzLtBGWfyGezSng6pBQLcbPgJJmR+STYgyU5fV+zIVLQF2wL2o1B
	 17GIxH0ifhGwlq4AbQWwpzr96AdIkeoFM6xhW8pf+FjdhuVpypcX40TjlXAbEle8Op
	 h4xXrnGLu9mCXN6YqSW+MU5X0MeaVKO4R3feuqg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA97FF802E8; Tue, 16 May 2023 02:02:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A78A9F8025A;
	Tue, 16 May 2023 02:02:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18421F80272; Tue, 16 May 2023 02:02:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CEFFF8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 02:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CEFFF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com
 header.a=rsa-sha256 header.s=fm3 header.b=pSsyzB/R;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=H67i+e3J
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A0ADF5C0241;
	Mon, 15 May 2023 20:02:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 15 May 2023 20:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1684195333; x=1684281733; bh=rOB6pQz91knz2cK+HvjLbQdRvdY701wZ1CM
	KwNPCgdU=; b=pSsyzB/RStfFsUMERskDQlPhPMt5jhIMm+txZSfvntZjY5/BKRI
	N6vR1+M0ZWPAs/jCr+DKWmCKjKQhHO8fBiyt9Zyve+FMHDMLLLJWmPO6ZeL3y0oP
	cWFUaD8zgkxyOnNn0hOpteM47X7TFrpZULD+VJnSwc4F5EdSi1yMTTzOLySkYodX
	RO6yx7gWZwJkLu23IMBddYXdZXFwnWtNecn18ZeqGELoLXnmdqKeJttJEa2ApYMq
	d/PmQ63JhunmZmaHCoKbEjW7BKlUJLCsV/fSCLKbJwd0R4cnepj1201C9M6uCN4h
	8aMGxHaO0rdP6UYe72s+0hmnpd/N9hv8fuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684195333; x=1684281733; bh=rOB6pQz91knz2
	cK+HvjLbQdRvdY701wZ1CMKwNPCgdU=; b=H67i+e3JQutQQTQsv0QT6m0HYFd4v
	1yrZbqRelql95w18ufOj/eIO4bIZ3UmRh2I9GWtvw95zI7K/Gp6iNGNhrBaqtgGr
	E4IOeTdSH1V5okC6vv0zQGfYY8PARgUOmV8vc5b2qY8qkqK3Jiaw5cgnorhy3JJk
	OSra7CU6R6t5j3XvYrR3NX0OpsGBcU/OYVFChaNt17CPumWff/O+lDzCHaN4F0n9
	MtFiyWMZnxRF4nvrRYZ5qcGc2/7W76lkIxOfdEZTe5RnWv6DtrLLDq6SeBPtjBoB
	17j8asyIzYzN7GsAJIIkC/c2Ubc3dkx5YURgwZlvZM8dqLQD0LOOwc/QQ==
X-ME-Sender: <xms:BchiZCXwc5wfAcgo_Uxkq2sWk4aTyuYTordqGhpcDTM1ezzwhoGRzw>
    <xme:BchiZOmZMIexQFCA4DXuUSu10VTtzajx0H5iWjqlv6vlHTn8u5NzKbiUDDpTfRekE
    IlHlbpXvwae9Q>
X-ME-Received: 
 <xmr:BchiZGY2JSJ1qX31w_-pLspzamGMqEjCKvX9jSVFhZabN5WRuWwYWhz7Lib_-iEtN2hh3NA1VjuHqYR4LailXdNJAeVKI3G6tK4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeehkedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedv
    uddvuedugeegjeeivdffuefhheevudfhleektdefvddugedtvddtleffveeunecuffhomh
    grihhnpehmrghrmhgrrhgvkhdrnhgvthdphihouhhtuhgsvgdrtghomhdpghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:BchiZJU5o9dGYkzXetKXvtO2qasPPlkyehQfR2resMuXaauxSDT_2w>
    <xmx:BchiZMkm2_1V_CIRfqLhawc1canjfQ72LpgGbM4zM6LOnT7UP9vBxQ>
    <xmx:BchiZOe1WovbfWdrpJny9M9uXzu9o4qJFF65iEvYryOs2j0_L5WcmQ>
    <xmx:BchiZGhRt_Yb-5MyYlZ4NfXAEaVy3kdUDMT-5fFgHbn_GYyZ9I6iHA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 May 2023 20:02:10 -0400 (EDT)
Date: Tue, 16 May 2023 02:02:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Alex Xu <alex_y_xu@yahoo.ca>, Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)
Message-ID: <ZGLH/oATVzX8VvN9@mail-itl>
References: <ZGJSRmtZ5SBOLe5u@mail-itl>
 <87a5y5pdq1.wl-tiwai@suse.de>
 <ZGKhPxwfXJaxnjZt@mail-itl>
 <e84d7ffe-1a7f-be3c-4c29-c66ab0432bb3@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ls5jbMirgp3j6BF6"
Content-Disposition: inline
In-Reply-To: <e84d7ffe-1a7f-be3c-4c29-c66ab0432bb3@linux.intel.com>
Message-ID-Hash: MOMHTGCLYEMZWK6A35ZEC7ROS4375LUR
X-Message-ID-Hash: MOMHTGCLYEMZWK6A35ZEC7ROS4375LUR
X-MailFrom: marmarek@invisiblethingslab.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOMHTGCLYEMZWK6A35ZEC7ROS4375LUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Ls5jbMirgp3j6BF6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 May 2023 02:02:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Alex Xu <alex_y_xu@yahoo.ca>, Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)

On Mon, May 15, 2023 at 06:56:22PM -0500, Pierre-Louis Bossart wrote:
>=20
>=20
>=20
> >>> I have a rather interesting issue on HP EliteBook 1040, with Intel ADL
> >>> HDA. Sometimes (often) audio output is heavily distorted, but then
> >>> opening pavucontrol or just launching `parecord /dev/null` fixes the =
issue
> >>> instantly. But, when the mixer or recording is closed, then few secon=
ds
> >>> later issue comes back.
> >>>
> >>> You can hear this at https://cloud.marmarek.net/s/46prqZnwrqDkBdD
> >>> Initially recording was running, then about 10s stopped and you can
> >>> hear the issue few seconds later. Then I starter recording again, and
> >>> the issue is gone.
> >>> This is how it should sound: https://youtube.com/watch?v=3D4Tr0otuiQuU
> >>> I do not see any kernel messages when issue happens.
> >>>
> >>> The issue happens on Linux 6.1.26, 6.2.10, and 6.3.2. I haven't tested
> >>> other versions. It happens only when running under Xen (in PV dom0). =
The
> >>> very same Linux started directly works fine. Full dmesg of both native
> >>> and Xen boots is at https://gist.github.com/marmarek/548ee79282446344=
a172109bcd943930
> >>>
> >>> When running Linux 6.3.2 there, I noticed that just after boot first
> >>> playback is okay, but if I start and stop recording it breaks. And th=
en
> >>> after some time of idle it fixes itself again. I have not observed th=
is
> >>> behavior on 6.2.10 (it was broken initially too), but I could be also
> >>> doing some things differently.=20
> >>>
> >>> I have few other ADL-based systems (but not HP), and they do not show
> >>> this issue, only this HP laptop is affected. Example dmesg from anoth=
er
> >>> ADL-based system:
> >>> https://gist.github.com/marmarek/38c5ba3ec58f9300fbc1842ddc9fa4f5
>=20
> >>
> >> Could you try to switch to the legacy HD-audio driver (e.g. by passing
> >> snd_intel_dspcfg.dsp_driver=3D1 option) and check whether the issue
> >> persists or not?  This will narrow down whether it's SOF-specific
> >> problem or not, at least.
> >=20
> > This does help! With snd_intel_dspcfg.dsp_driver=3D1 the issue doesn't
> > happen anymore, the audio output just works the whole time. But, the
> > built-in microphone disappeared, only external (unplugged) is listed. I
> > guess that's kind-of expected.
>=20
> Can you check what happens with a headphone and the SOF driver?
>=20
> The SOF driver doesn't really know/care what is on the other side of the
> HDaudio bus, so it'd be good to rule-out an amplifier-specific
> configuration issue.

The same happens with headphones.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Ls5jbMirgp3j6BF6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmRix/8ACgkQ24/THMrX
1yyAawf9FAtKlgMOtldVyITn0JZOEDnY6o9etf3ucJjHkdHH1qStbAarbRmKulg0
WyL0sVOaV5L7NssXSstk8U5LQhe8MHWUSDymhM5Pm720xhQ+Ygxt0709R9BEbBqH
Sb7kPbTMfH1t4QYkQiU9B/Q9M6Gu5YfJwnpUa4VcqqjChRBUt4rA7Xh2RLhquL7z
je+5GuYbe1vSWio85bkFFEiyl9hruJjUIT1Xd86lae85GgFUcZapwMlpLQVogchP
UaRdfRfnYCW1wkFX6mUAZNuQUlmpou6pKXD4U8vrBzul/wTOm+aJDdZI7ervvfsi
xRF1Sd2VzBIGC0ANE/qbNB0VDw1gcA==
=1DjM
-----END PGP SIGNATURE-----

--Ls5jbMirgp3j6BF6--
