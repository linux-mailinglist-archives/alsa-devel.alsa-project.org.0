Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 046076BB8E8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:01:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CDE61574;
	Wed, 15 Mar 2023 17:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CDE61574
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678896112;
	bh=/QziS8QWk7tvyA244HZwgivaO04ac//xHBpcr9vsb1g=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EOb2JjoPlKIE8o6CRZ+8Kq+9ii+CTWEb913I70HAhbzAog+yRXNt4RufEGxvCNafT
	 qGNxyRgE5wYpPzs8Gw5yE93ncWgQky5bu/AOdVvR1quNe4bc313TgDQjPmDhDz9Q1e
	 S8x/zt46YcSs58rFbJZfxlEGsrPV+nSDpw7+Xz7Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3AC6F8016C;
	Wed, 15 Mar 2023 17:01:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADC2EF8032D; Wed, 15 Mar 2023 17:00:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA87AF80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA87AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hSbewgL+
Received: by mail-wm1-x335.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so1382047wmb.5
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678896051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOOiowO4I0qT+YSivly3gWfp0aGWe0FO+V1Ii1L2DRI=;
        b=hSbewgL+LcYq/IeCIN5E3CjlRluYSO8YjBLyNWHVRHLUNKkBnZtt3LYy/YR9taFATl
         ZQEiphz79hWc/Fw/o3D0fCjRCwBXsxvMHMKsR8DfOusKm6hjylbA4oosTiekNFVEXHzB
         CY6URGvjpWs0UTfnrgOyX2LNltXN9uRn1xoiwGnI6Dt5olV7NhFMpnGcNCCiLJXKWiOw
         hjPWFV9rMOzv2ABipzSlCwRNhTpVhZc3mvjZTyacrCA1gD650BxTh5ylJvQxjOXA2npG
         LrPlNR8tYG9vahe9SD5fB7sj5dW7+JH30hr9zVEp3RAeEjs0JLvJ+scQGV3JobzJmIOk
         DlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOOiowO4I0qT+YSivly3gWfp0aGWe0FO+V1Ii1L2DRI=;
        b=isX9G+c8Z8rU10hkENhQGQ8IR1SW+Q1JdE8+m2pdmu6RCjbnMzqDB8OBYDvBTLlLI7
         xbFDKukBJDIUI5Krxjrt8Yl2xOA8twkox7mQbu+HN3R8ELUVXVpH3jnVAD/uGuX9BF4e
         IxjQ3tv1TTZ4fPujvnLIj4pNDuq7BAITXELwqUDJGXJvMsT0UjXCWog+sY88eFH4ZMeR
         7ERR6h2XDtObtpMjZ6t5kAQi5J6DDO3kJ2X+P8/t9aGv+EGOfWP52t8CLRttw1jQPWz5
         jSI8MRwOGBj/F6mvxz1PSmSl14QE60+4t6KMZxWQbuPImy3hOzsA/kuEJu/dNkm9TEl5
         2Vnw==
X-Gm-Message-State: AO0yUKXA2md6YC4dJQAcxeVV2+GIBvQfCG7eSW3wFe44s4Eulz1Vh41f
	ZZFax6/JtIYTzmEPGvc5Mao=
X-Google-Smtp-Source: 
 AK7set8w3LxA2bu94VH0xr00h9EYIDFMKc9rEj1ry3wNKkEOg6/OKJUc9xvFT7SJHjy8Ti+2artC+w==
X-Received: by 2002:a05:600c:1e0b:b0:3ea:d610:f059 with SMTP id
 ay11-20020a05600c1e0b00b003ead610f059mr20098605wmb.4.1678896050736;
        Wed, 15 Mar 2023 09:00:50 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003eaf666cbe0sm2274836wml.27.2023.03.15.09.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:00:50 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: 
 Re: [PATCH 120/173] ASoC: rockchip: rockchip_i2s_tdm: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 17:00:49 +0100
Message-ID: <3717794.rJMogTuNcH@archbook>
In-Reply-To: <20230315150745.67084-121-u.kleine-koenig@pengutronix.de>
References: 
 <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-121-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Message-ID-Hash: FDERYRWB5F4CYF47RM5UELTS3AL6OVK6
X-Message-ID-Hash: FDERYRWB5F4CYF47RM5UELTS3AL6OVK6
X-MailFrom: frattaroli.nicolas@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDERYRWB5F4CYF47RM5UELTS3AL6OVK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mittwoch, 15. M=E4rz 2023 16:06:52 CET Uwe Kleine-K=F6nig wrote:
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

Hello,

this looks fine, but the commit prefix should either be
"ASoC: rockchip: i2s_tdm:" or "ASoC: rockchip: i2s-tdm" to align
with previous commits. We've already broken convention once before,
hence the two names, and I'd rather not have this convention broken
again.

Kind regards,
Nicolas Frattaroli

> ---
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/r=
ockchip_i2s_tdm.c
> index 166257c6ae14..c2e9fd5ab05e 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -1722,14 +1722,12 @@ static int rockchip_i2s_tdm_probe(struct platform=
_device *pdev)
>  	return ret;
>  }
> =20
> -static int rockchip_i2s_tdm_remove(struct platform_device *pdev)
> +static void rockchip_i2s_tdm_remove(struct platform_device *pdev)
>  {
>  	if (!pm_runtime_status_suspended(&pdev->dev))
>  		i2s_tdm_runtime_suspend(&pdev->dev);
> =20
>  	pm_runtime_disable(&pdev->dev);
> -
> -	return 0;
>  }
> =20
>  static int __maybe_unused rockchip_i2s_tdm_suspend(struct device *dev)
> @@ -1764,7 +1762,7 @@ static const struct dev_pm_ops rockchip_i2s_tdm_pm_=
ops =3D {
> =20
>  static struct platform_driver rockchip_i2s_tdm_driver =3D {
>  	.probe =3D rockchip_i2s_tdm_probe,
> -	.remove =3D rockchip_i2s_tdm_remove,
> +	.remove_new =3D rockchip_i2s_tdm_remove,
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.of_match_table =3D of_match_ptr(rockchip_i2s_tdm_match),
>=20




