Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C26BB908
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:06:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421C81543;
	Wed, 15 Mar 2023 17:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421C81543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678896370;
	bh=phKPh1POKUm9W0Tr1YFUoHUQSAsjYhn74ZDAibT594s=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EmKe14wNHcSecBlrp5siKSfiYlapw47/t/v+z0GfdZ0pQ9jd69WbwNXuaLGoO+DeM
	 RlMp35l890J5qkO60DPry94h6G0PF+m7uEUjjjj2I4TsveXzjpyWgQPpuTdMZVpPAI
	 PG5f7s61TtqHOALCUq8cGU+ni2yIh/XMGO6twiwM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDE4DF8032D;
	Wed, 15 Mar 2023 17:04:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B78DF804B1; Wed, 15 Mar 2023 17:04:45 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D87BF8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D87BF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=azeJduTb
Received: by mail-ed1-x530.google.com with SMTP id h8so33717442ede.8
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTxHDgaVdAlRa2VNlay45Oqnyvz/HhDbjYf8cb4/2Tk=;
        b=azeJduTbNEMY6CR9BFCqeeLgBLexitLByxnpnV13tmgavA7XljemiuRLuaIrb2J2X+
         aVS6uT6F5i6q9yg0tLIp3fPqCab/6eksH76OTBxdlDIo9uS4GWPUntxi1U4F1f4eBzx/
         G6uSdBpQMBZ82s46c/mOZItV+HP1Box//P9ivizUhQgyeOsrst4nBAABEaa7riNWf6De
         pYNeVuIqX14OWaaW75erkaNMwx3MoRdLxY5z8eXws2ykS0kRtVPUSlzS5upy7NlT/muS
         XrP6BQeONHuCWpzvbijbCUtTjdZGJJyE27VGIxwYyw/JE4tAQKMtZh6BqRattktMQ8oa
         io1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTxHDgaVdAlRa2VNlay45Oqnyvz/HhDbjYf8cb4/2Tk=;
        b=R1zWaALWA4iHaGc3U++kmgTdbw7So7zNcOODCMi0AyCRVBBAO4DWn6yBe0vqVm6ho9
         OiuUmVSkLweMi0wfdplF40iGvxF28o2/ds+/nNzZonGPSNVXsgMvpeljDLuUPM9mxKa9
         zrGWe665bCNCDBfzdDBvwzU3XK37bYZCT8SnL1Qcv4GX1/XXH0Zg4tzEUi4EDLDKKEj+
         p2xUirV8O49z2uXIT5x84kYLif4uaFJBP2aFi2po9kR73U9B6Cdinu0NA1ht6hb2uxkZ
         EzMEDAV2iGBhBCdLLfKA4tytxpxByFTqi5u64i2UB07aQw1Ss9ohgADhbVHXK2Zu2rI4
         Plmg==
X-Gm-Message-State: AO0yUKXxZrUnreOSTW9v1t5U7TkNapRb6wjhzwxqOePObn4XbJvvBGzR
	2zFCUp9Kz/7tnJL//x6ZfEY=
X-Google-Smtp-Source: 
 AK7set9exElF6sSx9RJmJhi/SicijsfPgz32u15q4hOmHY8b4Mo6bccbZ6ceF0L7H/PW+5M7ydAmxQ==
X-Received: by 2002:a05:6402:1b07:b0:4af:6e95:861b with SMTP id
 by7-20020a0564021b0700b004af6e95861bmr3215998edb.2.1678896281005;
        Wed, 15 Mar 2023 09:04:41 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id
 l9-20020a50d6c9000000b004fc649481basm2672529edj.58.2023.03.15.09.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:04:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: 
 Re: [PATCH 141/173] ASoC: sunxi: sun4i-i2s: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 17:04:38 +0100
Message-ID: <2100888.OBFZWjSADL@jernej-laptop>
In-Reply-To: <20230315150745.67084-142-u.kleine-koenig@pengutronix.de>
References: 
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-142-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: MQXG3UBLIW577VJ5IG3ZGVUPSP4LEJGI
X-Message-ID-Hash: MQXG3UBLIW577VJ5IG3ZGVUPSP4LEJGI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQXG3UBLIW577VJ5IG3ZGVUPSP4LEJGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne sreda, 15. marec 2023 ob 16:07:13 CET je Uwe Kleine-K=F6nig napisal(a):
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
>  sound/soc/sunxi/sun4i-i2s.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 6028871825ba..669d712bbe9f 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1606,7 +1606,7 @@ static int sun4i_i2s_probe(struct platform_device
> *pdev) return ret;
>  }
>=20
> -static int sun4i_i2s_remove(struct platform_device *pdev)
> +static void sun4i_i2s_remove(struct platform_device *pdev)
>  {
>  	struct sun4i_i2s *i2s =3D dev_get_drvdata(&pdev->dev);
>=20
> @@ -1616,8 +1616,6 @@ static int sun4i_i2s_remove(struct platform_device
> *pdev)
>=20
>  	if (!IS_ERR(i2s->rst))
>  		reset_control_assert(i2s->rst);
> -
> -	return 0;
>  }
>=20
>  static const struct of_device_id sun4i_i2s_match[] =3D {
> @@ -1660,7 +1658,7 @@ static const struct dev_pm_ops sun4i_i2s_pm_ops =3D=
 {
>=20
>  static struct platform_driver sun4i_i2s_driver =3D {
>  	.probe	=3D sun4i_i2s_probe,
> -	.remove	=3D sun4i_i2s_remove,
> +	.remove_new =3D sun4i_i2s_remove,
>  	.driver	=3D {
>  		.name		=3D "sun4i-i2s",
>  		.of_match_table	=3D sun4i_i2s_match,




