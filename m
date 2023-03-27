Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 960D06C9E92
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 10:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73945827;
	Mon, 27 Mar 2023 10:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73945827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679907024;
	bh=1bx6uouoYv9V0vgQCdR/U32VKdCCMGQZHYQgUVvzm9A=;
	h=References:From:To:Subject:Date:In-reply-to:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KhIlMaWexMNT5rMG/7fc+NB83toZYBuKdwybAmjMSt4uerkeO2S8YUm71SRPn1Nvy
	 gfKCQ4Pttatzk9DAgy8zTtPA0YocQEKionzzDKVaUzfsjadH4SYP1ktG2GXUhJZVSI
	 CMZh2yNMWhiFq9qfTtqbRJB4XuqXF4gEJhUeNGlo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA294F8024E;
	Mon, 27 Mar 2023 10:49:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93B2CF80272; Mon, 27 Mar 2023 10:49:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8043F80249
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 10:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8043F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5UJ/GXir
Received: by mail-wm1-x329.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso6785136wms.1
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679906960;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=UDSqP7fpfKlKQVx/rVKsTS5+4DHlxYXGctzY/lz+9Ho=;
        b=5UJ/GXirQ7wgMEFINuifffVu8CODx5qLiO9QZwxXCtKEKM+75oZAu25XvAjTf3Mukd
         lVDHLQTo0AOOQcN5NlWIUSvcKvN32YA5hJUWuvNjyFXAByF1uiR2VcvlikFKLYKEBmOn
         eDx+RS9fSjaPFpSvMY1eVdj5AlrPgGKU31/9RH/tg2j1jU4AbH43wXOmYH7I2SbnW74s
         7py0fyyDHwvalOsnobnGpmz4MyKAxZWgrhDqMGcGyEgoifsfAdrikkoSAaPvNKx7TImx
         qNZcc3t1JrP9dMg1sXC70lpblPv+C9p97e4IDNGsXPmZvdqFu1e0O8EuVXhAqEIk+Pst
         rXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679906960;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDSqP7fpfKlKQVx/rVKsTS5+4DHlxYXGctzY/lz+9Ho=;
        b=GNjdHYgjgWECWfRvsFR1WTBbWQhWccHEMRIIZVIzDqnPhDaxtLbnsMvhtrYMhmBue8
         ezJKYrEaKsFry+XRAiQAz0ETBPXu6t5dzS3j9uJmNAuFkvKTrJQchBFD/YeXhr20cgsG
         ZgCu2eivsk6gw68UT1/eg4zve/ATf/3tflV16uhGA0jSR3J0lrFwdr15TCPXUh9/b9TH
         XrEsY87Ua88fDMWA9n/hs8VcYDDhg/kXgngw6gwxosS+4sXyxqOSzJwDQDz+3muM7zmh
         K5pLHbcLV32pcF4S5Dl6gpEPOiSgS8FQ+ZJ5Oos0rWJiJvV2q18bOpHgYDOV39MvQ/J7
         EGqA==
X-Gm-Message-State: AAQBX9fPVhBqTGso50a4T2tuibE1Ni38NseEzQ3oJOkfTXz1j0zKi0Dd
	fSdGbhCYa9hTCIT0i6BS12nWjQ==
X-Google-Smtp-Source: 
 AKy350a1+/eDpxejUWxQfz4ZUV5XMrdV2fNL9j9I2+FCSXACd1jk3wa03RjMGPX4FF4onxWuoaOJcA==
X-Received: by 2002:a7b:c852:0:b0:3ef:64b4:b081 with SMTP id
 c18-20020a7bc852000000b003ef64b4b081mr4840082wml.39.1679906960535;
        Mon, 27 Mar 2023 01:49:20 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003ef5deb4188sm8001026wmn.17.2023.03.27.01.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:49:20 -0700 (PDT)
References: 
 <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ASoC: meson: Use the devm_clk_get_optional() helper
Date: Mon, 27 Mar 2023 10:45:44 +0200
In-reply-to: 
 <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
Message-ID: <1jy1nio9yo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: P4GRSPDMY6YIE2ZPLUF5GJRO3E42JPDJ
X-Message-ID-Hash: P4GRSPDMY6YIE2ZPLUF5GJRO3E42JPDJ
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4GRSPDMY6YIE2ZPLUF5GJRO3E42JPDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sun 26 Mar 2023 at 14:43, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Use devm_clk_get_optional() instead of hand writing it.
> This saves some loC and improves the semantic.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thx.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>


> ---
>  sound/soc/meson/axg-tdm-interface.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
> index 7624aafe9009..5e5e4c56d505 100644
> --- a/sound/soc/meson/axg-tdm-interface.c
> +++ b/sound/soc/meson/axg-tdm-interface.c
> @@ -496,7 +496,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct snd_soc_dai_driver *dai_drv;
>  	struct axg_tdm_iface *iface;
> -	int ret, i;
> +	int i;
>  
>  	iface = devm_kzalloc(dev, sizeof(*iface), GFP_KERNEL);
>  	if (!iface)
> @@ -533,14 +533,9 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
>  	 * At this point, ignore the error if mclk is missing. We'll
>  	 * throw an error if the cpu dai is master and mclk is missing
>  	 */
> -	iface->mclk = devm_clk_get(dev, "mclk");
> -	if (IS_ERR(iface->mclk)) {
> -		ret = PTR_ERR(iface->mclk);
> -		if (ret == -ENOENT)
> -			iface->mclk = NULL;
> -		else
> -			return dev_err_probe(dev, ret, "failed to get mclk\n");
> -	}
> +	iface->mclk = devm_clk_get_optional(dev, "mclk");
> +	if (IS_ERR(iface->mclk))
> +		return dev_err_probe(dev, PTR_ERR(iface->mclk), "failed to get mclk\n");
>  
>  	return devm_snd_soc_register_component(dev,
>  					&axg_tdm_iface_component_drv, dai_drv,

