Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18D6BB90D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68CB5156B;
	Wed, 15 Mar 2023 17:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68CB5156B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678896394;
	bh=D53RBrkXnIF9BhgYUQjg3p17ZJ3AJtJot9AvZCK4lXM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tYPS0OR4U8kRb85TBbCjoBAxa5tBLRqN8h/mS8raDicMQ162jxqTp1r1FKryV7fNn
	 0Cad/C67i8xpGQOY5fv0dvOReRns4BGEe0egzr7GYvXHD/6X/8WNzpLEUtE4V6LlMW
	 PL8DiQ6HBINOd1D8idpWHN6odb7vsIQSFVnhUcXI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C60CF804FE;
	Wed, 15 Mar 2023 17:05:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C9A1F80527; Wed, 15 Mar 2023 17:05:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7527F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7527F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OLQvLwhq
Received: by mail-ed1-x535.google.com with SMTP id eg48so18286941edb.13
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYGX99pO1QhMCjaMfA2tt6x0aDGPLDNKPraVBhA8mfY=;
        b=OLQvLwhqfZHoCdUd/CB/heb6Rkub5zLWqQ38FphV9KG8d+V2dnKGE7Bxfw22JsCW/E
         gVMJose6qpqyl3T3eZb0IpEVaKi2c+Ci3EM560ZAyfil/YUE41QJBT8+m96IUCfripPt
         Ofctldl7TlC9G6UqCH8PolRbTmhmYStv5U+j5fCHM2uBzS4Q04ACs/vyGP7hnezZiSJv
         TL72vXaeZXEDWMdcaLJW+t/4PTcQ0NQsDVtvemmGH0GQ9JKMoGq65FNZ/T92/ibbBCI7
         hRRHXCEBFirLBfq8zxBlCannFFvVZVbqO89r0rfcixvjNo++uaHeFcaFz4osjuwZRhgw
         Wbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYGX99pO1QhMCjaMfA2tt6x0aDGPLDNKPraVBhA8mfY=;
        b=rf56ORk08GraT4qd7t+Z8MCzbB/P4S0zCj66JYhMRc28JzGJTo4ABgFHRyW5OaEROX
         tVOfN3pXTqWuPKy0UBV0vfKFR6yLfjanTqVbIvv0nHpeObHOrl1eWFOK1jtkXwFdMkdh
         VMboUcQ0rAZHJaAq+STG3wVccnkokHRfPi1w3LzxgejD9eANuDV8JpvRf2nyMjlU5FDC
         LpRrIY08JsGi/jIJDwn4aqyHWljwMXGIBqtFWqAGTQVEBAsxdHqv1BBibHaLK0u58Exz
         rTMoJd36hlSB6Uu48hX/IVQsLX/GsLOuTlSwFwfYudJ7s72C0pOi8b9xFKkQGcHZSBKS
         lotw==
X-Gm-Message-State: AO0yUKXc2DC+B4PiyGDL/Uwp5Po7fTWU2RRmLTMEW896ovD34nVWTjWR
	9i7PS2s9gU3VP3wjOaa4SO4=
X-Google-Smtp-Source: 
 AK7set/5iYiiCkiPNXJhp+k6XG0KokT/w7XIYCxSgGW7s6z/i1G3KHv3tbWMDV5m8dnbU+bgoCcLsw==
X-Received: by 2002:a17:906:4c4d:b0:888:db6b:5fa9 with SMTP id
 d13-20020a1709064c4d00b00888db6b5fa9mr8133172ejw.67.1678896325683;
        Wed, 15 Mar 2023 09:05:25 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id
 dt5-20020a170906b78500b008e82cb55195sm2704185ejb.203.2023.03.15.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:05:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: 
 Re: [PATCH 143/173] ASoC: sunxi: sun50i-dmic: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:05:23 +0100
Message-ID: <4127320.1IzOArtZ34@jernej-laptop>
In-Reply-To: <20230315150745.67084-144-u.kleine-koenig@pengutronix.de>
References: 
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-144-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: P5VWP44GPGSAUPVUNWAJ3BDK4B76FSCY
X-Message-ID-Hash: P5VWP44GPGSAUPVUNWAJ3BDK4B76FSCY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P5VWP44GPGSAUPVUNWAJ3BDK4B76FSCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne sreda, 15. marec 2023 ob 16:07:15 CET je Uwe Kleine-K=F6nig napisal(a):
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
>  sound/soc/sunxi/sun50i-dmic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index 069c993acb31..c10439b9e0a2 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -373,13 +373,11 @@ static int sun50i_dmic_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun50i_dmic_remove(struct platform_device *pdev)
> +static void sun50i_dmic_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		sun50i_dmic_runtime_suspend(&pdev->dev);
> -
> -	return 0;
>  }
>=20
>  static const struct dev_pm_ops sun50i_dmic_pm =3D {
> @@ -394,7 +392,7 @@ static struct platform_driver sun50i_dmic_driver =3D {
>  		.pm     =3D &sun50i_dmic_pm,
>  	},
>  	.probe          =3D sun50i_dmic_probe,
> -	.remove         =3D sun50i_dmic_remove,
> +	.remove_new     =3D sun50i_dmic_remove,
>  };
>=20
>  module_platform_driver(sun50i_dmic_driver);




