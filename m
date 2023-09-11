Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07379A800
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 14:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E333E1E0;
	Mon, 11 Sep 2023 14:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E333E1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694436421;
	bh=06znG3wxT+dpKtHPaFyKXSQQ5p7Y5V9tFqVfD9qlTkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MeHpaPveLJpzuiwEgHYAcDi6V6lV56ho556eRnJwN6i0+/QhAZr4Y4y64eYehuyPY
	 h0W6grI0ai6MHmmWtkDys8b3KN2bjuDCZrVbbdbDg5geFZsgRUpJf+bS7Yx1SC0so8
	 WFmkXr1fRla93/y7/LDLJ0X9hdFq8/Vp3KD8YE8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F24AF80551; Mon, 11 Sep 2023 14:46:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A615F8007C;
	Mon, 11 Sep 2023 14:46:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE5FEF80425; Mon, 11 Sep 2023 14:46:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B608F801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 14:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B608F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=lnV0RY3Q
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bf57366ccdso37382665ad.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 05:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694436363; x=1695041163;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5XvPZZqdirBPZjjGmlvzSk97lGyej6mdL4djNdnVCI=;
        b=lnV0RY3Q1Tm7kOeVXVqZMKto6werSYTCvGFWcJehD3eUVkE90u6wIml9K0ztL+cT/m
         GPyB3j+ZWziPpO7EOVMI33JFcTObo6C5JOxcpHfPAQodLCwWpaxDUc4MypNnKV/808xB
         Pm9rtTXfMOcBlQfcutxYF7/NziKEpdHRRbS6h6Ez1P1O172cnW+Z++VbSALd0AJzNWDF
         I/SQ5PaiZtrOwqLpuB4eMuq0WBP4JOmati6reyZ58kScMq1N4W7Jw2JmsGnGwgITyrZU
         SQqaHRm8MvL2dQIbMOniebq8Ky6kcydgRbBaEfkidVOoqmMKnyw9BdjrgH53CiuXIy0e
         uP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694436363; x=1695041163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5XvPZZqdirBPZjjGmlvzSk97lGyej6mdL4djNdnVCI=;
        b=aOfys/aoa+9U4sLZCagJCFauC8l3+VuJZ0PMqGEF5QYvBHcpIplglWYer4eShcjz8q
         8cVhvjo2WVNKMJdWYc4DRZaw1csuR9qZbMmPeEcRVPVnnEjOYvMH38NVpjzUNpWHr4uf
         /mH45PMIkL235ViILoWRM0YO1eVSC2jBbAVb6Acs0Pscdgt/NNaJe4aDOwyIQobEnyyJ
         xHP+5xIgNnKYMLqrbKMlEMwGTQVa2zjzO8se5GykJIJ3CmsSkFm0CXAEIl0qmR2P7/+v
         JvNAPQNgqgKe83LoZzfGvk+8ylZSRAexAZNgJRh2L6YkL5ZXmNTua8CQx3L9vK32FrlC
         pn1w==
X-Gm-Message-State: AOJu0Yy3ex/OoMpGJ4/TmhcBWpzsrHq+sx7CjUsGdKx3DlaFZnAI/QHB
	bABIeUeGPvI5laHr0lMBzBDB4+3qdMQ=
X-Google-Smtp-Source: 
 AGHT+IEoeaHrIceDWUgY90v7qFPznKsBTy2K/RKtRP79UVqR7O46yrZDjc+n2e5+BFUy3Q71/RjMjg==
X-Received: by 2002:a17:90a:5794:b0:26b:513a:30b0 with SMTP id
 g20-20020a17090a579400b0026b513a30b0mr13923816pji.10.1694436362813;
        Mon, 11 Sep 2023 05:46:02 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id
 d24-20020a17090ac25800b0026b30377c14sm5581863pjx.6.2023.09.11.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 05:46:02 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 0E96680DD549; Mon, 11 Sep 2023 19:45:58 +0700 (WIB)
Date: Mon, 11 Sep 2023 19:45:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Myunguk Kim <mwkim@gaonchips.com>, alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dwc: fix typo in comment
Message-ID: <ZP8MBll6ZsOlZyaj@debian.me>
References: <20230911064646.168181-1-mwkim@gaonchips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S+WQLwUYDDDtOHMY"
Content-Disposition: inline
In-Reply-To: <20230911064646.168181-1-mwkim@gaonchips.com>
Message-ID-Hash: YBCM3P6RYL24X7ED4UYUQUKN4XDPRAYY
X-Message-ID-Hash: YBCM3P6RYL24X7ED4UYUQUKN4XDPRAYY
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBCM3P6RYL24X7ED4UYUQUKN4XDPRAYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--S+WQLwUYDDDtOHMY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 03:46:46PM +0900, Myunguk Kim wrote:
> This fixes typo in comment

On what? Can you describe the typofix in more detail?

>=20
> Signed-off-by: Myunguk Kim <mwkim@gaonchips.com>
> ---
>  sound/soc/dwc/dwc-i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
> index 71ff894035a4..45e55e550924 100644
> --- a/sound/soc/dwc/dwc-i2s.c
> +++ b/sound/soc/dwc/dwc-i2s.c
> @@ -138,7 +138,7 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev=
_id)
>  			irq_valid =3D true;
>  		}
> =20
> -		/* Error Handling: TX */
> +		/* Error Handling: RX */
>  		if (isr[i] & ISR_RXFO)=20
> { 			dev_err_ratelimited(dev->dev, "RX overrun (ch_id=3D%d)\n", i);
>  			irq_valid =3D true;

Oh, you mean the code following the comment checks for RXFO overrun.

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--S+WQLwUYDDDtOHMY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZP8MAgAKCRD2uYlJVVFO
o3MyAQDA9qZKWM+Xqnw1ZKiEx8pkr5GrsaLJ5HV6zN64vPqvOQD9F3v5H5vFLGqO
0v230ZWsjXAWDA2rPXXP68hDNudhXA0=
=aoyc
-----END PGP SIGNATURE-----

--S+WQLwUYDDDtOHMY--
