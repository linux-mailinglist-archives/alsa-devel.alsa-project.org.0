Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E26BB903
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:05:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F551528;
	Wed, 15 Mar 2023 17:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F551528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678896320;
	bh=hGiALCroGvr3Rlg/GOdCG/u4y05QscD7aJJposaxX6k=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VNyIFgZSR2pjQb0mUnF4MlMoJEg+gZV0r8z2URpY5Kh/atDipmlVdJaEhy3henhLm
	 JLXJXJZkI/UYfOVFznOYHrvVgxyFa0Xu310Oo7290UmSlYxD+eN82JP2EQJvbKLllk
	 yDKLzhyw1AS68r8kLoL1wb6poYh2zK7WlfpnE+dg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A82BF8016C;
	Wed, 15 Mar 2023 17:04:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 661A1F8032D; Wed, 15 Mar 2023 17:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D86BF80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D86BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V+XG+Dx4
Received: by mail-ed1-x530.google.com with SMTP id x13so30161601edd.1
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn0w3t08AxgUFgbBz/0VL9DhPFjtB6IrsFayVvSEfCE=;
        b=V+XG+Dx4c7L4AZOeVkQ3DF4PJxyEUaJ4JI0/QFNxpYfbfAjn1G0NG9DvlZbgPiyPSK
         TKFfrYt8VwDIX97KwNoJD7uZlt24RIlFyR7x2PE9SQxBzcZcHOYqP7Bpxn+kGe++3/eu
         ki9APm7B+IHY9l3CGl3TJUmDjCjtumiD+agkJ5PbxUM4EezMx7PS9mYbdWMuegdTD14X
         bHW4ITfV6GOnvn1hJk+SeoQS+ORF4QJze3LcPgWQYbqRLcp5nA0kj/NPrFJVo0m8j+HB
         IRbQRBPJB5htw1xhSm+5l8uU3lNwiiPlL7ILHSxoTs4Bogzp3WxL9Vj4ZxuCo4Qe9NfA
         ToKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pn0w3t08AxgUFgbBz/0VL9DhPFjtB6IrsFayVvSEfCE=;
        b=xEbjNv6y8ooZMOpwnZC+PELmRHSLygwSrmceVq9+o0jhGPSQnJ5ftp2Lqv17TptTX+
         i6oRiFc5aWIAF5HDO8tdm800XlqnWTCq5/PyulhbnYhgV8/dQ1LQeWZlsqtoM/wglwrm
         mbAOzpS/RRNTxXo/vWMfRxkluNv42S6FYIFY9XbclW/+c6ev9XqZwsM9wd+Mv6lUoM6U
         yX0Udsi5HSkWCz4tpXEDvg135wR7bAU0EmgnE9ar//XSCOZ12waObXSn8I0B080i9RqV
         nuZHqNG3O5VJp6fNEF0ZooMap87tHidPcHa7N+pAdFqEAM7eqHUAPnlTiVB8j5udyh4h
         qsrA==
X-Gm-Message-State: AO0yUKXTb3P6H6eHcmxQt4vdR50Mz4UHSQdnxhtNqjlxbBjzJPWy4dpr
	wiLJ4ffJ/tEEE033ux+1Jbc=
X-Google-Smtp-Source: 
 AK7set8bqQSQclpYXN1O4ZXhg6LspXdmsJjgsY7sBOpVihYNP7lQUf0mcRKvw872oUIGEXBbaM/qYw==
X-Received: by 2002:a17:906:518:b0:88f:8a5:b4cd with SMTP id
 j24-20020a170906051800b0088f08a5b4cdmr7808720eja.1.1678896261531;
        Wed, 15 Mar 2023 09:04:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id
 qq11-20020a17090720cb00b008c6c47f59c1sm2726532ejb.48.2023.03.15.09.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:04:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Li Chen <lchen@ambarella.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: 
 Re: [PATCH 140/173] ASoC: sunxi: sun4i-codec: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:04:18 +0100
Message-ID: <5349071.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20230315150745.67084-141-u.kleine-koenig@pengutronix.de>
References: 
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-141-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: 3OZOG3NPIO4ZJZ344WO5RBMI4UUKB7WI
X-Message-ID-Hash: 3OZOG3NPIO4ZJZ344WO5RBMI4UUKB7WI
X-MailFrom: jernej.skrabec@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3OZOG3NPIO4ZJZ344WO5RBMI4UUKB7WI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne sreda, 15. marec 2023 ob 16:07:12 CET je Uwe Kleine-K=F6nig napisal(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun4i-codec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 835dc3404367..55328850aef5 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1821,7 +1821,7 @@ static int sun4i_codec_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_codec_remove(struct platform_device *pdev)
> +static void sun4i_codec_remove(struct platform_device *pdev)
>  {
>  	struct snd_soc_card *card =3D platform_get_drvdata(pdev);
>  	struct sun4i_codec *scodec =3D snd_soc_card_get_drvdata(card);
> @@ -1830,8 +1830,6 @@ static int sun4i_codec_remove(struct platform_device
> *pdev) if (scodec->rst)
>  		reset_control_assert(scodec->rst);
>  	clk_disable_unprepare(scodec->clk_apb);
> -
> -	return 0;
>  }
>=20
>  static struct platform_driver sun4i_codec_driver =3D {
> @@ -1840,7 +1838,7 @@ static struct platform_driver sun4i_codec_driver =
=3D {
>  		.of_match_table =3D sun4i_codec_of_match,
>  	},
>  	.probe =3D sun4i_codec_probe,
> -	.remove =3D sun4i_codec_remove,
> +	.remove_new =3D sun4i_codec_remove,
>  };
>  module_platform_driver(sun4i_codec_driver);




