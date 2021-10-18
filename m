Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951C4315EC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 12:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26AA818E1;
	Mon, 18 Oct 2021 12:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26AA818E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634552553;
	bh=iqLf7wMwjsV/lB2mb+b8lzbjNiSZE5hgCkn3tPYFxmw=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuovNvfNCAHVVb49UGLmLSaQnYYjHFp4iUHa07+Qz/XdF9O5qJHK9OWNVdrZJ8OcA
	 WVL0nggrM+pI9hjMKaIyN3YsNPTJ8nCOb9FlFlVeSU4T+9kVFVVfcDR8PQ6APGUJDS
	 emSxeLE/dEPA/ErAcvjPodYdowwqsRVnJEOllLx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F207F80159;
	Mon, 18 Oct 2021 12:21:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 534DFF80224; Mon, 18 Oct 2021 12:21:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DCDEF80159
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 12:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DCDEF80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="OghATFW5"
Received: by mail-wm1-x334.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so9831730wms.0
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=7GC/r7oF7FaZ4vYYtjlckZsfjl97Nd102niiiNEyke0=;
 b=OghATFW5VHSslzpfS5gkkA3/wlUiyyp1eis6npEz+q00Ysaim+UMA3aq/59CpBm3sw
 xsgz5lLt1yZ90HXx0+Zb99O7Dj6PQlMsZYE7CuH0bJAL8QmybrshSuijhh9Vnzl9izgC
 xioP+eojPe9F21OJuHl8mpZfK19IRHt0psbKuq8q38MZOGSfEnwIp0/d0duLLLhWFrjC
 XlhQZwF1kEsxPUuFiEtQIa6aLHq0fc8mnMtBBwFPqL6Bh0YUrIiPT2VeL9tgAVz8Aqg6
 nE/phqoMR4WvNkv+U7wd4GP3cEApRXz3D4JcS5QYxcy+pSqUXvBEI20CCcuSkwMo/9ed
 GYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=7GC/r7oF7FaZ4vYYtjlckZsfjl97Nd102niiiNEyke0=;
 b=zaStKCru7/D2zzOsE3soBFuiI+kSrMmBnxdstWCuJxVfjz8cmsNGJLXmftKRqd1s3E
 ulXugfRhA4ST6ItMRZfpDAe3YlUQo/6/boK3ZTFUNnbFwUtdePqOYR4/zkJPxi79wHCm
 S0DUgWfsITkCmD3Z75db+zqrLJ5V7d24MVZOYCoCl84R8C7KU2PyvFrlYYQKAvdXFJRc
 c9MohSjjarToUFhgIvuGRqlvq3SEnHNRqYr2K4t0TLwWMnp9NDajHSbhhbxEDtsA6gYe
 9IdRddTvFYrDx8yOcarA2R7baAtR19qfKxZwwtmDdQTVw9iWBKGuHwMIKMc4o7rR71ta
 egaA==
X-Gm-Message-State: AOAM531umymH53/daVoXzlXLaLVm49VArkPYc8KUIJd/WjkJar3xzgPV
 Notpqle2otlDhj0kknzNIoaG/g==
X-Google-Smtp-Source: ABdhPJxggso4popQo8nuVeqxw6FVBixaoIjtOeSS511+JxQ97xNYgGJ/yoNLOwTLoxJL3J3keWTBZg==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr42793789wmh.137.1634552468356; 
 Mon, 18 Oct 2021 03:21:08 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m15sm12311398wmq.0.2021.10.18.03.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:21:08 -0700 (PDT)
References: <20211017160028.23318-1-christianshewitt@gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: meson: implement driver_name for snd_soc_card in
 meson-card-utils
Date: Mon, 18 Oct 2021 12:20:03 +0200
In-reply-to: <20211017160028.23318-1-christianshewitt@gmail.com>
Message-ID: <1j1r4ivdkc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Matthias Reichl <hias@horus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Sun 17 Oct 2021 at 16:00, Christian Hewitt <christianshewitt@gmail.com> wrote:

> Implement driver_name to provide an alternative to card_name for userspace
> configuration of Amlogic audio cards.
>
> Suggested-by: Matthias Reichl <hias@horus.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> The meson AIU/AXG drivers currently require alsa confs based on the board
> model name which is unique to each board. This is very flexible for audio
> use-cases, but not very maintainable for distros with a single use-case
> that need to support a large number of different Amlogic boards. Using a
> driver name to match the card conf instead of card/model name reduces the
> number of confs needed in the LibreELEC (Kodi) distro from 41 to 2.
>
>  sound/soc/meson/meson-card-utils.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 415cc0046e4b..29b0174f4b5c 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -302,6 +302,7 @@ int meson_card_probe(struct platform_device *pdev)
>  
>  	priv->card.owner = THIS_MODULE;
>  	priv->card.dev = dev;
> +	priv->card.driver_name = dev->driver->name;
>  	priv->match_data = data;

I was preparing something similar to help with alsa-ucm so

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>  
>  	ret = snd_soc_of_parse_card_name(&priv->card, "model");

