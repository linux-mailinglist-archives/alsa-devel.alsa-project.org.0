Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD1796E1F
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 02:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FAF7F1;
	Thu,  7 Sep 2023 02:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FAF7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694047342;
	bh=E4KKap7KjolEsemgFlmmLIsWG/mJZzjaj9GOum9UcB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h8gQEsbh3053maTcNNDZa+8S3EBb9mZhkgBch14EvLAA1x8EBnDJ4CK0XFOBQJBfl
	 viImgPCgxqABowv36YjVcHTfQ/CYv7lvF22Ugq8iQwHYS3586rD94ZZYJw7jXvmHbZ
	 yuhN89Ws86j/q9sgaCrtsaRLfyMZMedGz7YP0peU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D3FAF80494; Thu,  7 Sep 2023 02:41:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5695F8047D;
	Thu,  7 Sep 2023 02:41:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E23AFF80494; Thu,  7 Sep 2023 02:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B1B6F80431
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 02:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B1B6F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jkD9J8Ea
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3ab244e7113so284543b6e.3
        for <alsa-devel@alsa-project.org>;
 Wed, 06 Sep 2023 17:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694047275; x=1694652075;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9gui8u4OOc3TOjdVaRcFaPR8y2wsF5YiQ4542hZu9v0=;
        b=jkD9J8Ea2vDJj0XOUpvW/+xvPHUqN0FoZQ7jv+tYicfKzG+Xo+P0kNKXYKymDt1EMS
         DQjDLjrPlBFN+O7cCATG9XQsekdCCKQusJ9fr1uwDSs9UViNfJKqAaDfj9bgPyVpqHKW
         sSLwO1m2tuwP0TiGOtToptdNOTKQsHK/HVW30gaEn/7AWwVNS53mZMQAaud2uC9QWH1r
         4wiiVcWzwLThVqeQFOayTKR7NT7pd+OQBVpLU7VLrUOcdm9uwgYXnUJG1GnwQuIrGYyo
         6cDsiezhEkS3l7C/AerRYtdM6pHYgKblNNnqcnfFGElw3i89gx0w8X6gFKEAyuQgUXAU
         dDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694047275; x=1694652075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gui8u4OOc3TOjdVaRcFaPR8y2wsF5YiQ4542hZu9v0=;
        b=ahIWS17dfeuauUxz+DY6NSVK6aseR/VhY4g4S8cc5J0jkRwImPFHBuGOHZyr6+9OB9
         uWVffkuOu6Z4My7PuhsdE2Md0jdw1tggbpv49iacvJbnjqQExFcuJhq99WRZ34EYEN26
         ROAwAMmcfeaxKkxk9Yli1neQ3/T8uzG8pVDV5QoIz76KwqV/2R6MbZxfKagwWlgWkm8x
         ld+KAU41vg4rCZ2teFvUtW0hVRPuRChRxKI+Yf56xDcDuqd3rcTzsV+MOehuUSPj8Afp
         LvDTk1eVh4UGhepwL0dO7Y+OQzgPAhn81zMVQQNakGe50/i2vDjQZxjUIIBm6t6ck3Be
         Dh9A==
X-Gm-Message-State: AOJu0YzaKnw3VvTfg2E0bYCk7hq7Q4kpSbcThX14r46VshZTAmCjD7LJ
	lpjJC4xbCIBbkzbOj741qf9pTfzGDhAgCfvJEfhsr1hY
X-Google-Smtp-Source: 
 AGHT+IGM6nHYPpEfTcNYMZnmvw2j0DKLzAXvBY88wDkKX6uLcU+yABNF/mLwGK2iM85G5QjuriGr1w==
X-Received: by 2002:a54:4607:0:b0:3a4:3072:e597 with SMTP id
 p7-20020a544607000000b003a43072e597mr15809319oip.54.1694047274858;
        Wed, 06 Sep 2023 17:41:14 -0700 (PDT)
Received: from winterfell.papolivre.org (winterfell.papolivre.org.
 [2600:3c00:e000:341::1])
        by smtp.gmail.com with ESMTPSA id
 bl39-20020a05680830a700b003a792121f47sm7463566oib.45.2023.09.06.17.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 17:41:13 -0700 (PDT)
Received: from localhost (unknown
 [IPv6:2804:14d:7224:8468:34c9:cf8b:3384:7414])
	by winterfell.papolivre.org (Postfix) with ESMTPSA id 54F541C3AB0;
	Wed,  6 Sep 2023 21:41:12 -0300 (-03)
Date: Wed, 6 Sep 2023 21:41:05 -0300
From: Antonio Terceiro <antonio.terceiro@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: snd-cmipci oops during probe on arm64 (current mainline,
 pre-6.6-rc1)
Message-ID: <ZPkcIayHbYJopT6n@linaro.org>
References: <ZPelHaX/Lt++kkOm@linaro.org>
 <877cp3esse.wl-tiwai@suse.de>
 <4f335dd2-8043-c60e-cf84-c2b01c4fee12@arm.com>
 <ZPjGuCdmPgqznc5t@linaro.org>
 <43632d9d-722c-b14f-336a-eac402ef9362@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="89dZcb8j/67jPzQ0"
Content-Disposition: inline
In-Reply-To: <43632d9d-722c-b14f-336a-eac402ef9362@arm.com>
Message-ID-Hash: RA7FVDU3XOWA27FS4UO4JTWMGELPPWZU
X-Message-ID-Hash: RA7FVDU3XOWA27FS4UO4JTWMGELPPWZU
X-MailFrom: antonio.terceiro@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RA7FVDU3XOWA27FS4UO4JTWMGELPPWZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--89dZcb8j/67jPzQ0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 08:52:40PM +0100, Robin Murphy wrote:
> On 2023-09-06 19:36, Antonio Terceiro wrote:
> > I'm pretty sure I saw reports of people using PCI GPUs on this machine,
> > but I would need to confirm.
>=20
> GPUs and any other PCIe devices will be fine, since they will use memory
> BARs - I/O space is pretty much deprecated in PCIe, and as mentioned some
> systems don't even support it at all. I found a datasheet for CMI8738, and
> they seem to be right at the other end of the scale as legacy PCI chips w=
ith
> *only* an I/O BAR (and so I guess your card includes a PCIe-PCI bridge as
> well), so are definitely going to be hitting paths that are less
> well-exercised on arm64 in general.

OK, that makes sense. So If I'm able to find a card that is genuinely
PCIe=B9, then it should work?

=B9 this one has a connector that looks like a PCIe x1, but it's not
  really PCIe as the chipset was designed for legacy PCI?

> > What info would I need to gather from the machine in order to figure
> > this out?
>=20
> The first thing I'd try is rebuilding the kernel with CONFIG_INDIRECT_PIO
> disabled and see what difference that makes. I'm not too familiar with th=
at
> area of the code, so the finer details of how to debug broken I/O space
> beyond that would be more of a linux-pci question.

Tried that, didn't help.

--89dZcb8j/67jPzQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEst7mYDbECCn80PEM/A2xu81GC94FAmT5HBsACgkQ/A2xu81G
C94oLQ//cHO0I77mzhQzQ6aLJ+BhBiOK4X/p43WCNIpIidWSjRlwuU6SbryWIxfX
e95mFUOg85ikPQr7tsNiOZ+UFUfFlOrUQABk6opO3/eF/su9FrAWL3CXgwM/8iy/
4Nf+Ksh9HWrMMGoHIjJm+Ge4Mj5avdX3e65uD3lIYMKEfrGekfDUs/HTlY3U8yG9
EetU/O6JQKLShwmbLLeO940H0+BQaxikQkOZAx5HZiL5m6I1ZDjjj0B/w+mHbodt
gwOl+XxBzAzW1OuFAzm99OjN0NSWXnay/fWrgkJxrLKR/PrvLsjchPLsZ3dkKV+j
Y3OvxFsuy/qVVEY1LXdKd56vzHAmnnv2p5NZ/7nlepv9lqifFmokwpcEfXb5+sJO
6IxdPqvgfESrmfrEUbqq4WrrK1nKcpI8Dit9Ms6IpX0rJUJDPbNRFS1h2ghvhOH9
F6nPcLE9w3AL2cG1ksKHUoOPtDHv1kHFhxO2cOpY3rLvCRSBDuSPawt6jndaTXHb
ZpefrV2sBzHX24Qgg6iLB/6uMHxqTFbo+N9XCdZ+Byi+wIZ81hKsNFHb85fBJxjo
gSujiA3I2TSr7ZZWnGQxucreZqUm4G0JbUEPBQDgwfsNtUjpNf6PfhYDJnd0tQg3
iEhaU48CDtfCJDAJNcokz/Msn8Mwvp4zUBRHDwiKg/nYlDZyfLE=
=2YPK
-----END PGP SIGNATURE-----

--89dZcb8j/67jPzQ0--
