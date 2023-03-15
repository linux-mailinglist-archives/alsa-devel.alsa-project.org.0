Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D96BB90E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:06:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A168D154A;
	Wed, 15 Mar 2023 17:06:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A168D154A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678896414;
	bh=CQhAb/TXQLM8hj/BLJWeMOVKvtG1+RYMzcw2PHCeKdM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kPt4Nwi+uoacIRqYbG//09GgHFvqCUZ34QzrXzkEsY4BDr3HlZUbE+mLTY+s/ca/P
	 YpAIBh+nZV8XGfcCvu8JOmKwkvCqPnbL/wSgbFN/UP3yos1T91CYgxsAhrujY8mJG2
	 eBzgNInF6z28zj4FNOkIJRNSvtWbnU9flGQvdi48=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FF22F80527;
	Wed, 15 Mar 2023 17:05:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D26AF80529; Wed, 15 Mar 2023 17:05:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC407F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC407F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Py9CPpKM
Received: by mail-ed1-x52d.google.com with SMTP id r11so25867029edd.5
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 09:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myjMOOaJx/Yyy4X1X4K5C1WLJmP+rbBydBL5hzDI24I=;
        b=Py9CPpKMCCbnztwqW3NSxXw3CBM+Stxv1hc87DRMM6fy7O5/1CPhw2+eQncKjw6fVp
         tM1am1nqJCvoYP6iPyx2lGZEh3lcq7MHqnvMUOUTbWJaesmjCYW02fOsFWrgY2BcFKIX
         TRTZfV/2sL4WLZztWZHQxW1OtDSgkvELiLBeRugs1UKp9r5JhPGNvyORfT7nARDA3Z/1
         9UqqHhG2vUhrqULX4sXASbyPPrDHwcYbHH/5lHBDwsIs6MHkmCFxpcz1NUOMNSe8LX7X
         XaEFrimDa/2tAAvyF93DehWX9SfbYJ5lFH4wsNC16FS+4oxvh44ajd/sTHDmn108Y+Ki
         Xg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myjMOOaJx/Yyy4X1X4K5C1WLJmP+rbBydBL5hzDI24I=;
        b=lEa+igaXreVhc2dLtvtUfxQlxhlhb6w5Xa/CBmrSE2vXQDjXd1p6a4timWxa7Wcgcr
         5EgyWpXQ6vs+Ht3fUGQc/QFiX67frPEjVyE7sVxIZEJeF8xJQQHV6G/qDOJ6QjwWIZCy
         mV/ovKGNK1pxabKxMgjcm2tWoPkZAdATC4Rw5Z81wMYJqW4/unpraYNdmovk8fCrwJRX
         cAA1SDCfDn7jKB8pzfjkWxZWKfm/HVoN66sx5YKSEG0F7qsiV75uhFBUtPAXGbd4Y3Lv
         mduiCLhmdwScqaOnqLFUJSI89dEidIi4YRHCHRL9YZFez5BBdCJVTK1KF4oJBBMfuyi4
         EZpA==
X-Gm-Message-State: AO0yUKXXv7T0VkN8JYlRwTMPn56oBvZoSt5x0921QfcuA2yFbm4IGpxx
	8rMpsTHah+RnQwpfEBt617o=
X-Google-Smtp-Source: 
 AK7set9DU+m9BN6GX71+StLcOLYTPk/4jOJqYqVt5X6yccV+p4wkWAkWqBWC164NI+nirv6R2J+sgA==
X-Received: by 2002:aa7:d49a:0:b0:4ea:b218:f7d3 with SMTP id
 b26-20020aa7d49a000000b004eab218f7d3mr3524450edr.10.1678896341758;
        Wed, 15 Mar 2023 09:05:41 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id
 j29-20020a508a9d000000b004fe9253e923sm2188748edj.83.2023.03.15.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:05:41 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: 
 Re: [PATCH 144/173] ASoC: sunxi: sun8i-codec: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:05:39 +0100
Message-ID: <1771389.TLkxdtWsSY@jernej-laptop>
In-Reply-To: <20230315150745.67084-145-u.kleine-koenig@pengutronix.de>
References: 
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-145-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: ALG2UPM2TU2I5I2MSGE5VW4BASX6BXQT
X-Message-ID-Hash: ALG2UPM2TU2I5I2MSGE5VW4BASX6BXQT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALG2UPM2TU2I5I2MSGE5VW4BASX6BXQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne sreda, 15. marec 2023 ob 16:07:16 CET je Uwe Kleine-K=F6nig napisal(a):
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
>  sound/soc/sunxi/sun8i-codec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 9844978d91e6..4c0d0d7d3e58 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -1349,13 +1349,11 @@ static int sun8i_codec_probe(struct platform_devi=
ce
> *pdev) return ret;
>  }
>=20
> -static int sun8i_codec_remove(struct platform_device *pdev)
> +static void sun8i_codec_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		sun8i_codec_runtime_suspend(&pdev->dev);
> -
> -	return 0;
>  }
>=20
>  static const struct sun8i_codec_quirks sun8i_a33_quirks =3D {
> @@ -1385,7 +1383,7 @@ static struct platform_driver sun8i_codec_driver =
=3D {
>  		.pm =3D &sun8i_codec_pm_ops,
>  	},
>  	.probe =3D sun8i_codec_probe,
> -	.remove =3D sun8i_codec_remove,
> +	.remove_new =3D sun8i_codec_remove,
>  };
>  module_platform_driver(sun8i_codec_driver);




