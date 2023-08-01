Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4C76B029
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 829B6210;
	Tue,  1 Aug 2023 12:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 829B6210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690884051;
	bh=BE2UGdfDuc1UYsX0P8iEpGRvK4B1GgFgLHv2HklDWDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rPLrPklfsD+uUjOtqkMi06INER0MfRGX6drLXvQl91MhihLOkwVdfXbC9soSM0WEN
	 uTo0ZRT1jyZK+qIb2ZnckZw743ZOYhwHGkPVT8/BRZt60AfsiU0tqW35UQCfam8dbT
	 BO73qRbD/Dbs5XOKyJge+QEp/LPU5OZPjGf/0TDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19CA3F8016D; Tue,  1 Aug 2023 11:59:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A92A0F8016D;
	Tue,  1 Aug 2023 11:59:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5F4FF801D5; Tue,  1 Aug 2023 11:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C415F80149
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 11:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C415F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com
 header.a=rsa-sha256 header.s=fm3 header.b=Dl8nlZxz;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MFxOJg3g
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id DC26B5C005F;
	Tue,  1 Aug 2023 05:59:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 01 Aug 2023 05:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1690883962; x=1690970362; bh=/9Q7q1S7NXIydbuQucq+wXetGfV5PemHOkp
	A+5zc6H0=; b=Dl8nlZxzLgwfj7r7VLktYFqvHw7HbSZmEpsHNFP6fVWYe7Wzy62
	jhIEnWH/x2Y18aPlqmL2UnLI0b5mnxRy2bXVGKvJnHzlOW6TtV36zLprgMto20gR
	CZ1Ow/iCRT3uPLdurzoAFoE9OkxFb8PZyLESQY4YFqDWS29AfTxWegmKJmdRrLA6
	lT9Cz+da9uwdxIaaerObXLCnoXW0/6GjV+J259pf+YceDBUI/g3ObmLuRKH0BaCa
	SZhJZ29enPPbCGg+US1bv9zEkmUxK0ayJCuMLZHRdQFRTGQof2u6RW52iRpREz0D
	xatiDP/Kt8Yh+RH6In0gEyRxMIit9S2lkXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690883962; x=1690970362; bh=/9Q7q1S7NXIyd
	buQucq+wXetGfV5PemHOkpA+5zc6H0=; b=MFxOJg3gKyxM47IB8Qx7Qb1jM0+Ae
	AQG3BR6wRCpE/XQM12g2Ck+xmX8AYR7BroYw5zPYo6Wkl41mbMTwcMbNVfamug/m
	Q9MhrJUr+yFj7Vql9tTkGu4nDakQx2KMqnUUGJxrtAHpTwZPyQzmTGSeHmAk9qdh
	zKT7OwxPprdywtZQXowzptVuRL1TZ+woTwC93C3T0fcJ7hUmzFwPZ4il+9NYx+ii
	j0/+yiQa+4/njD61iUZSo2sxYXd+N5FzYfHiT9fQTp3B4tw8yAmNvGFetbTZSHYH
	1BGb2JDg24R/beZrumo1AqcoyqMNbPg9ghktlX2AYP4VzthQBLo4gg24g==
X-ME-Sender: <xms:edfIZEjv4C4dpJ1maLqJHbBlSITOXU-kPxlxLQ7idfyptP1vqA6Y-g>
    <xme:edfIZNCtFluGryR_qY3O6yb6-mIaG1fyOoLg8eWfwHXUNcoGsl1j73wHGJd8mMBcO
    r6vCH0-1__DSQ>
X-ME-Received: 
 <xmr:edfIZME58bspakUjHC1OQizIxb91mtcCKznWyXt-kJQlsqA2TAdndq7YI-qz0CWdx--uC8hKt019j6WD_C_UPXt9KQDJCmm6J_0>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrjeeigddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegffdv
    vdekffeftefhkeffffdukeeuffetvdetuedtteevfedugfdujeellefgjeenucffohhmrg
    hinhepmhgrrhhmrghrvghkrdhnvghtpdihohhuthhusggvrdgtohhmpdhgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:edfIZFRpaKC3G0Kq9IDi1plEjh3tvsQ7ljZp9NM3IZ7NN9Lj_GLjzw>
    <xmx:edfIZBwVykhk_MAcEaVYPkGw76nQ5zLfytEwmSRo0tOZ5u9vDIAzwA>
    <xmx:edfIZD7BuMvQMaBnhG8i49WB8nmUxyYPCzJCT4FufAiFawvrIoirjg>
    <xmx:etfIZJ_QdFgq5VPlh-N7jtyNXNyAHXdaFCqFlckZZMny8s9b6zSfAw>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Aug 2023 05:59:20 -0400 (EDT)
Date: Tue, 1 Aug 2023 11:59:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Alex Xu <alex_y_xu@yahoo.ca>, Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)
Message-ID: <ZMjXdfiyhJYhKhEU@mail-itl>
References: <ZGJSRmtZ5SBOLe5u@mail-itl>
 <87a5y5pdq1.wl-tiwai@suse.de>
 <ZGKhPxwfXJaxnjZt@mail-itl>
 <e84d7ffe-1a7f-be3c-4c29-c66ab0432bb3@linux.intel.com>
 <ZGLH/oATVzX8VvN9@mail-itl>
 <ZHVRFK0bKK3rm3FX@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t9+DDWyqijJ1AU5b"
Content-Disposition: inline
In-Reply-To: <ZHVRFK0bKK3rm3FX@mail-itl>
Message-ID-Hash: PBBQRIV63QRCCZEZ35LWGUZ42DWW4GDQ
X-Message-ID-Hash: PBBQRIV63QRCCZEZ35LWGUZ42DWW4GDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBBQRIV63QRCCZEZ35LWGUZ42DWW4GDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--t9+DDWyqijJ1AU5b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 1 Aug 2023 11:59:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Alex Xu <alex_y_xu@yahoo.ca>, Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)

On Tue, May 30, 2023 at 03:27:48AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, May 16, 2023 at 02:02:06AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, May 15, 2023 at 06:56:22PM -0500, Pierre-Louis Bossart wrote:
> > >=20
> > >=20
> > >=20
> > > >>> I have a rather interesting issue on HP EliteBook 1040, with Inte=
l ADL
> > > >>> HDA. Sometimes (often) audio output is heavily distorted, but then
> > > >>> opening pavucontrol or just launching `parecord /dev/null` fixes =
the issue
> > > >>> instantly. But, when the mixer or recording is closed, then few s=
econds
> > > >>> later issue comes back.
> > > >>>
> > > >>> You can hear this at https://cloud.marmarek.net/s/46prqZnwrqDkBdD
> > > >>> Initially recording was running, then about 10s stopped and you c=
an
> > > >>> hear the issue few seconds later. Then I starter recording again,=
 and
> > > >>> the issue is gone.
> > > >>> This is how it should sound: https://youtube.com/watch?v=3D4Tr0ot=
uiQuU
> > > >>> I do not see any kernel messages when issue happens.
> > > >>>
> > > >>> The issue happens on Linux 6.1.26, 6.2.10, and 6.3.2. I haven't t=
ested
> > > >>> other versions. It happens only when running under Xen (in PV dom=
0). The
> > > >>> very same Linux started directly works fine. Full dmesg of both n=
ative
> > > >>> and Xen boots is at https://gist.github.com/marmarek/548ee7928244=
6344a172109bcd943930
> > > >>>
> > > >>> When running Linux 6.3.2 there, I noticed that just after boot fi=
rst
> > > >>> playback is okay, but if I start and stop recording it breaks. An=
d then
> > > >>> after some time of idle it fixes itself again. I have not observe=
d this
> > > >>> behavior on 6.2.10 (it was broken initially too), but I could be =
also
> > > >>> doing some things differently.=20
> > > >>>
> > > >>> I have few other ADL-based systems (but not HP), and they do not =
show
> > > >>> this issue, only this HP laptop is affected. Example dmesg from a=
nother
> > > >>> ADL-based system:
> > > >>> https://gist.github.com/marmarek/38c5ba3ec58f9300fbc1842ddc9fa4f5
> > >=20
> > > >>
> > > >> Could you try to switch to the legacy HD-audio driver (e.g. by pas=
sing
> > > >> snd_intel_dspcfg.dsp_driver=3D1 option) and check whether the issue
> > > >> persists or not?  This will narrow down whether it's SOF-specific
> > > >> problem or not, at least.
> > > >=20
> > > > This does help! With snd_intel_dspcfg.dsp_driver=3D1 the issue does=
n't
> > > > happen anymore, the audio output just works the whole time. But, the
> > > > built-in microphone disappeared, only external (unplugged) is liste=
d. I
> > > > guess that's kind-of expected.
> > >=20
> > > Can you check what happens with a headphone and the SOF driver?
> > >=20
> > > The SOF driver doesn't really know/care what is on the other side of =
the
> > > HDaudio bus, so it'd be good to rule-out an amplifier-specific
> > > configuration issue.
> >=20
> > The same happens with headphones.
>=20
> Any ideas? In the meantime I tried updating alsa-sof-firmware to 2.2.5,
> but it didn't help.

This is still a problem under 6.4.7. Please help...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--t9+DDWyqijJ1AU5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmTI13UACgkQ24/THMrX
1yybEwgAkZ5Sf7ol8ocriExQpfrE11d9JscY1twDWk0IqCTdK/cP03p1axnzyxQx
Dnmu8I5PUcUR4A0jI4h8sACnfFrYn5CphZ4NE/CQu+yLZ7kGvS2lE45wxAmwOqar
2cJ1IYIx2EN5I04sisTmWD0haS2QABp9vl+qSyqtFltD5qLt6Jo6Ek8RZIvuAXNm
j3suyhOxnDWwXe/OCPdhWWyupLYBo65rR/qpUAWdgu4tEmsUmT6yrH5hVATpDFUh
5rSKoFbEiBhvKVDPGkuhwzzu3en8rCoT7RHbShxLTTFMW1tF9SLLv7tDxJf+J6KG
QeJ8hATJZbpIA8SgO/qspvqKl7/2GA==
=l8ty
-----END PGP SIGNATURE-----

--t9+DDWyqijJ1AU5b--
