Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA76BB909
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A371552;
	Wed, 15 Mar 2023 17:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A371552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678896372;
	bh=86IeAvpsTT3xJy/sz6LqwjgqlIjj1bKneY0DeRcEJvM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nfGC900W8ZyuP5QGo1HQTXmtBgNovbZxTCo3cTkMrQtHuVWI9YYDSrHPPEppv7OFX
	 g6tB0Wd9rRewniOUXh5rZAm7668Rbx9b68GNWXknLEXaURG/qw5ZUeibGtbmkqo3ek
	 JP4uZGBgStF0/azaatNj1RA9IwjszfKn4AMFsDyE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84E96F80482;
	Wed, 15 Mar 2023 17:05:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56BBDF80527; Wed, 15 Mar 2023 17:05:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 562BCF80482
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 562BCF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GYgwADQD
Received: by mail-ed1-x52f.google.com with SMTP id w9so6721251edc.3
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrfavOiI9RHFnuLIIn9fSoym+hJaH0KWDtFZHQ7FhFE=;
        b=GYgwADQDRBv/KWKhXsXUcAUFhDAgznha4R9pZMM9lDygOvRsskp2sjqb5eGtcIsRjb
         +BQBH+S7c2+bFJrgEcsJ33lmxXF+xaHV+Zf6R1acx0kd4THA11wrWaDE2PS71ADw1nhn
         Zx65qJONgMbEaCHuppuPpK/f19Y0eRvpyxKFsy2BYQpLOWC1Mysn+5xwS+qj0OBSMovR
         Uao5l7U1tmHILuzCEi0wR413TLsrQz3cmOUWwtDxd4w6T4wD/oEOOPpUwbCuBoECppEq
         vBHqkwqTycHcEvSf+HIIuFtDOtNKeTswqPcdwrlIsB2rmFNZOi/+cUOYLoGfJBl78Au4
         pr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrfavOiI9RHFnuLIIn9fSoym+hJaH0KWDtFZHQ7FhFE=;
        b=XLlwFwi9if5HofIt7lOOazq1P/2SDcTiNoe/XUb2Jr6AcCM9RUUKR06oSVKZkR9ifd
         2zexoE365nNl2B/kGusug1a7A/Y4t2Iq8Z+GHoGAWhsOQYMncHOAxFR3mRFHTh+hKYyh
         SbESbyvVZUMEDmrg2udA7YpyqgL5zO3QDjrS14G42/t23euVvsUDQn72FaQ7waqJTdUD
         qLMqblfR6XLO56pC3GzXKTHmRPTpBWPHfhvCHE7hqmB2KjL4u7XRo+tlqxdRFY3VlrDL
         8sv8PIyzb/PLsbcug6CBLdjvlX4C4/ybsJEhCSURaoNbNl30+rFE5ZTbDxK8vtugGOnd
         Wh9Q==
X-Gm-Message-State: AO0yUKWWnORzCWZXecT66F2QbFGFAJ51U/piDy+J4NJQjiOjiA/4gxeA
	Xvm4pwvk962V3PfQxqcNaOs=
X-Google-Smtp-Source: 
 AK7set+myhS2q8BMTQLFMetCV+tCvu86Y0EnLMDAIQz6lrKoBkjoRsSEoQr/z5hKWoUoEpc8DQ+YAQ==
X-Received: by 2002:a17:906:d211:b0:926:9c33:ea4 with SMTP id
 w17-20020a170906d21100b009269c330ea4mr7175408ejz.27.1678896305325;
        Wed, 15 Mar 2023 09:05:05 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a17090619cb00b008b30e2a450csm2714894ejd.144.2023.03.15.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:05:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: 
 Re: [PATCH 142/173] ASoC: sunxi: sun4i-spdif: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:05:03 +0100
Message-ID: <2745562.BEx9A2HvPv@jernej-laptop>
In-Reply-To: <20230315150745.67084-143-u.kleine-koenig@pengutronix.de>
References: 
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-143-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: DQIJEVTI3ZX45QME3FVGE5FI4HAT4ROC
X-Message-ID-Hash: DQIJEVTI3ZX45QME3FVGE5FI4HAT4ROC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQIJEVTI3ZX45QME3FVGE5FI4HAT4ROC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne sreda, 15. marec 2023 ob 16:07:14 CET je Uwe Kleine-K=F6nig napisal(a):
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
>  sound/soc/sunxi/sun4i-spdif.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index bcceebca915a..ff18d4113aac 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -703,13 +703,11 @@ static int sun4i_spdif_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_spdif_remove(struct platform_device *pdev)
> +static void sun4i_spdif_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		sun4i_spdif_runtime_suspend(&pdev->dev);
> -
> -	return 0;
>  }
>=20
>  static const struct dev_pm_ops sun4i_spdif_pm =3D {
> @@ -724,7 +722,7 @@ static struct platform_driver sun4i_spdif_driver =3D {
>  		.pm	=3D &sun4i_spdif_pm,
>  	},
>  	.probe		=3D sun4i_spdif_probe,
> -	.remove		=3D sun4i_spdif_remove,
> +	.remove_new	=3D sun4i_spdif_remove,
>  };
>=20
>  module_platform_driver(sun4i_spdif_driver);




