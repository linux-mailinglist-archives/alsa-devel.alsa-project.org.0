Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41617152FA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 03:29:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50385204;
	Tue, 30 May 2023 03:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50385204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685410144;
	bh=ukXT6Bh5smYL2Spb247twejireCaoX3i2aRiwoQSWIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=laxZ/HAkaCJuQTgd8ljfYJCa7n5nrYHWa4dfDNi0FTuQUG1AS3YiYPEXXqub5GxnH
	 mmnGXKOGmcOlE+1LC64OKey3kb4sR2yxN6U2fDjPu3jxnf8W/rmhOUh0c0Bu/H4ReU
	 gJg6Wdm6AYwe+R7pBGXdxdC5F/YEMkibkXFRFuy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90ACCF8016B; Tue, 30 May 2023 03:28:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 167B2F8026A;
	Tue, 30 May 2023 03:28:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 773E4F8042F; Tue, 30 May 2023 03:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 676B5F8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 03:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 676B5F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com
 header.a=rsa-sha256 header.s=fm1 header.b=WJcFuFSs;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=egwwFQ4m
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 3924B5C015E;
	Mon, 29 May 2023 21:27:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 29 May 2023 21:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1685410074; x=1685496474; bh=ee8T0nsTwYkPJtf/GidBBNELiQmMobIP6a/
	GDsC4shM=; b=WJcFuFSsU0BmVWMUesDmL99KaRPwqHyd5vvRJubyLekHhkXAIKP
	mmLqZTxtg7WPpMTHbFKZjVSr7kCYjyEO2wObdjSlFCR1vNGACcVoHimQL6E3r8jR
	+askNn1ya6nVjh0kCgCFgi4/Oi37G+Gy9SbbUOuoNUksg7T6VWNls7za/mJvOpK1
	yT6ew4A2HgTFw61YPHhUvSB1sn8wGmWzcUScr5oratTIvnSvCN0YfMyTaR32xakt
	uC8tsy9lNRK9jkxTpl8Cvo9BWjVcL4k/CKXNGe4ugqeQ2b9Yl8qu9LaimQezVPg9
	ku7Inluy859oDr0faAmfreSOkMlUfTcabgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685410074; x=1685496474; bh=ee8T0nsTwYkPJ
	tf/GidBBNELiQmMobIP6a/GDsC4shM=; b=egwwFQ4m+mg/OLfE4QBbtr3Su6Unt
	buqZb4Nx2wpN3jqAwmXZjyqbcg8R/waqeffAlyyTrityxp3PNZIaWoWfrnBXXpqr
	rqWfK5eWqu0jxFwFOmc8Ck8NmNBHZPxKq3sl6c+DUhf9e6c9bd9dOsnGNBR6s1BN
	cEHiK8arh0t/Q4YpmW4Xc9fl2SgVxa9M9kyOzsKzW5KxRxh0xIfawdaCErZ2ZYHn
	sTI3HIvCpQhOEEnRit+uCQUNuqyAZ7A08uBxLomKqxlCNm+vLQehn8VLI0b/PipH
	LDUqVwVchUvEfyR2CNII3hc2xXbTaErlITkjaLAs2wGOSvnqSNTRWGBcQ==
X-ME-Sender: <xms:GVF1ZJwOT1MIZtJ0dwjNsDnqUgGYaBX-cfgDbUpcY1Ajuo8KVxyfQA>
    <xme:GVF1ZJR8j4eoFXvHrIyMEiIT72s1uk_cpsqEjCsv6aaE_39_eGjhWEs4pGN67cYHv
    WXbvLyVnLMYGg>
X-ME-Received: 
 <xmr:GVF1ZDVb1clKNtyVrZGPGq0IxC2DyxCPf6ZCW0hR7PtP1zK839uc9it6TCla>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeekiedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedv
    uddvuedugeegjeeivdffuefhheevudfhleektdefvddugedtvddtleffveeunecuffhomh
    grihhnpehmrghrmhgrrhgvkhdrnhgvthdphihouhhtuhgsvgdrtghomhdpghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:GVF1ZLjfiO9TFX3KYwwhyNqfcCv1XNLa8rgvig__xTWcmEP50hU-qA>
    <xmx:GVF1ZLBVKgA1nW3ixFEONP5ssweE_uZV0aOljoEYNJzePWdh8YTIFA>
    <xmx:GVF1ZEI4KTrppsCJOCKHYTzcilLPcE9JpmKAXVgcTC1ENsxbKrS0kw>
    <xmx:GlF1ZCOkcx7cm-Dp1Dy7YGReAgOmVwDgOhP7c58fJY0_qu_QbVQ9mw>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 May 2023 21:27:51 -0400 (EDT)
Date: Tue, 30 May 2023 03:27:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Alex Xu <alex_y_xu@yahoo.ca>, Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)
Message-ID: <ZHVRFK0bKK3rm3FX@mail-itl>
References: <ZGJSRmtZ5SBOLe5u@mail-itl>
 <87a5y5pdq1.wl-tiwai@suse.de>
 <ZGKhPxwfXJaxnjZt@mail-itl>
 <e84d7ffe-1a7f-be3c-4c29-c66ab0432bb3@linux.intel.com>
 <ZGLH/oATVzX8VvN9@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pm5LpxYnk361F182"
Content-Disposition: inline
In-Reply-To: <ZGLH/oATVzX8VvN9@mail-itl>
Message-ID-Hash: RZTOCR2QZEQ3CBRRVC6MGFV4QAIP5LNC
X-Message-ID-Hash: RZTOCR2QZEQ3CBRRVC6MGFV4QAIP5LNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZTOCR2QZEQ3CBRRVC6MGFV4QAIP5LNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Pm5LpxYnk361F182
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 May 2023 03:27:48 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Alex Xu <alex_y_xu@yahoo.ca>, Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)

On Tue, May 16, 2023 at 02:02:06AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, May 15, 2023 at 06:56:22PM -0500, Pierre-Louis Bossart wrote:
> >=20
> >=20
> >=20
> > >>> I have a rather interesting issue on HP EliteBook 1040, with Intel =
ADL
> > >>> HDA. Sometimes (often) audio output is heavily distorted, but then
> > >>> opening pavucontrol or just launching `parecord /dev/null` fixes th=
e issue
> > >>> instantly. But, when the mixer or recording is closed, then few sec=
onds
> > >>> later issue comes back.
> > >>>
> > >>> You can hear this at https://cloud.marmarek.net/s/46prqZnwrqDkBdD
> > >>> Initially recording was running, then about 10s stopped and you can
> > >>> hear the issue few seconds later. Then I starter recording again, a=
nd
> > >>> the issue is gone.
> > >>> This is how it should sound: https://youtube.com/watch?v=3D4Tr0otui=
QuU
> > >>> I do not see any kernel messages when issue happens.
> > >>>
> > >>> The issue happens on Linux 6.1.26, 6.2.10, and 6.3.2. I haven't tes=
ted
> > >>> other versions. It happens only when running under Xen (in PV dom0)=
=2E The
> > >>> very same Linux started directly works fine. Full dmesg of both nat=
ive
> > >>> and Xen boots is at https://gist.github.com/marmarek/548ee792824463=
44a172109bcd943930
> > >>>
> > >>> When running Linux 6.3.2 there, I noticed that just after boot first
> > >>> playback is okay, but if I start and stop recording it breaks. And =
then
> > >>> after some time of idle it fixes itself again. I have not observed =
this
> > >>> behavior on 6.2.10 (it was broken initially too), but I could be al=
so
> > >>> doing some things differently.=20
> > >>>
> > >>> I have few other ADL-based systems (but not HP), and they do not sh=
ow
> > >>> this issue, only this HP laptop is affected. Example dmesg from ano=
ther
> > >>> ADL-based system:
> > >>> https://gist.github.com/marmarek/38c5ba3ec58f9300fbc1842ddc9fa4f5
> >=20
> > >>
> > >> Could you try to switch to the legacy HD-audio driver (e.g. by passi=
ng
> > >> snd_intel_dspcfg.dsp_driver=3D1 option) and check whether the issue
> > >> persists or not?  This will narrow down whether it's SOF-specific
> > >> problem or not, at least.
> > >=20
> > > This does help! With snd_intel_dspcfg.dsp_driver=3D1 the issue doesn't
> > > happen anymore, the audio output just works the whole time. But, the
> > > built-in microphone disappeared, only external (unplugged) is listed.=
 I
> > > guess that's kind-of expected.
> >=20
> > Can you check what happens with a headphone and the SOF driver?
> >=20
> > The SOF driver doesn't really know/care what is on the other side of the
> > HDaudio bus, so it'd be good to rule-out an amplifier-specific
> > configuration issue.
>=20
> The same happens with headphones.

Any ideas? In the meantime I tried updating alsa-sof-firmware to 2.2.5,
but it didn't help.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Pm5LpxYnk361F182
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmR1URUACgkQ24/THMrX
1yyW6Af+LBKFkltDCZ2jPZidq2vCzyvQM6M8sOIQLaHQhdky22E0/pQhE22k4R0q
5glutLsT4KmJUfnLGNd/GDD3csMEbEJoZDH1Gbcd7t1CeQpaRmpqPd4RFxYTL1Sc
ISLX+p8cJXUp1+61vnwWOQzoEJMHS7aVq9V6y8eXYkCL21IzzQPIHugfrQWwpSCF
P7ju8Va4rB4SJoKQegYhFxscP0AMXfLc9aZwLD4TrhCV85lyPnLhGUZlNY5ngszx
zPV+7a2Aze436+ACydVcsuty547rXAkIWB9wcje0YQFH2c1MGRzJX2GqYJtUOrlD
XHfeNxFIHh1no1o3qWzV/wcMRxW5lA==
=Q8vr
-----END PGP SIGNATURE-----

--Pm5LpxYnk361F182--
