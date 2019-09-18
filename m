Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC45AB5F62
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 10:45:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FFA1680;
	Wed, 18 Sep 2019 10:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FFA1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568796303;
	bh=MFwL4riX/M1buNMeb2bD3QDOelUY4OmVyWHVASVKMOM=;
	h=From:References:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QII5qLOytW68eaVAEefTbQO0rScjjkbzSxWpLPDF7q5uuZd8pfql8PTd2D4FJZHx/
	 uzwBlrqwJIYJlIiUTOc0iThlqsgmJfsm4oA2X97ZG6Zn5azoPzCw3aLvJ5DJe69dfM
	 ST0uhH1Z3DSzjwnKq4761H+WmSQWToQau4Y2egg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF299F8053A;
	Wed, 18 Sep 2019 10:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAF1AF80534; Wed, 18 Sep 2019 10:43:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D283F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 10:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D283F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="S2FCcJGd"
Received: by mail-wr1-x442.google.com with SMTP id b9so5994737wrs.0
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:references:user-agent:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Es/bmU3c9XGaRtzCiMLIVrPNjr9MNI0eTxg3xMnbUYc=;
 b=S2FCcJGdZtO1gO4SQHnOHraw90NxGk+ySbB9OIxE1vfxheAusATdTaw/syxuwdGWQI
 92sF2Nr9TgHxs7w9AuZJMkw35AR0EvurNbRLvbFBj0IhXv8+CtvAmZEn4/1JRD/sQl+7
 tNMt7J5QEAw5awSGxUcQ8/C/fS2112pJR0ilZf81yL8vBnGNaugVKY9xmUmAErDUp2Sh
 VlGTEU7rvD1DW5sD4FehEg9RXAfUKfdQ8YV5iBOpMAeohp1oWwhAsgleYcPMPeSmZEgO
 sl+eIrDHwIH3Ei22m0zaGRvVaJHEvtf5PLgIY9dlvf0pyHhxZ0Kxb/8q3jOurf9y3lOh
 +X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:references:user-agent:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Es/bmU3c9XGaRtzCiMLIVrPNjr9MNI0eTxg3xMnbUYc=;
 b=gjM2H+BqwQOe1z5lAEpP7K6D6fuwlWA2Boo/tbiU0mJT8yyLsgKLNUzs3gLdtATrmZ
 Lcv6zdbfK/STN8guMCixYF3d+3AFOE4C/uO8eA1z4YI6PDCNP3KNCZia2vZtDNaeGazj
 kGtljgQUJr7nSAeAizJQhsEVybyVBuFL3ZmLjUbhzDt+LieIAjUK3zYs5vhDHEMJFSFE
 /jT4brjQVyLwWOcj+VzkqVzuf4j5UG+MfNwACAgAc1rvFenizNH1183EnsUK7Q+zhYwz
 Ou1wT1XyRamj+MOgYCwp0PQoo/wN1P1f7rMzxRxTgwHfX7pGfp+pTvNTKDqkWUFRMdGX
 UyLQ==
X-Gm-Message-State: APjAAAU5nbYOhY+05Fy9hcXm0L7X33D8N4PpYBVjeURhuFmwbsAsbUVq
 q/Zl8u9Rt4u0U3sr+QIC7Wh1WQ==
X-Google-Smtp-Source: APXvYqz3Kpju44v9NdaCUS71dFKfNZ3q3V7oya0OqrnOC9uxnDdFSkv5zrOWWA/QCE/CJM9pIPUidg==
X-Received: by 2002:a5d:52c8:: with SMTP id r8mr2192409wrv.256.1568796231510; 
 Wed, 18 Sep 2019 01:43:51 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q10sm9774982wrd.39.2019.09.18.01.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 01:43:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
X-Google-Original-From: Jerome Brunet <jbrunet@starbuckisacylon.baylibre.com>
References: <20190918082500.209281-1-cychiang@chromium.org>
 <20190918082500.209281-3-cychiang@chromium.org>
User-agent: mu4e 1.3.1; emacs 26.2
To: Cheng-Yi Chiang <cychiang@chromium.org>
In-reply-to: <20190918082500.209281-3-cychiang@chromium.org>
Date: Wed, 18 Sep 2019 10:43:49 +0200
Message-ID: <1j7e663sfu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, tzungbi@chromium.org, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v6 2/4] drm: dw-hdmi-i2s: Use fixed id for
	codec device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Wed 18 Sep 2019 at 10:24, Cheng-Yi Chiang <cychiang@chromium.org> wrote:

> The problem of using auto ID is that the device name will be like
> hdmi-audio-codec.<id number>.auto.
>
> The number might be changed when there are other platform devices being
> created before hdmi-audio-codec device.
> Use a fixed name so machine driver can set codec name on the DAI link.
>
> Using the fixed name should be fine because there will only be one
> hdmi-audio-codec device.

While this is true all platforms we know of (I suppose), It might not be
the case later on. I wonder if making such assumption is really
desirable in a code which is used by quite a few different platforms.

Instead of trying to predict what the device name will be, can't you just
query it in your machine driver ? Using a device tree phandle maybe ?

It is quite usual to set the dai links this way, "simple-card" is a good
example of this.

>
> Fix the codec name in rockchip rk3288_hdmi_analog machine driver.
>
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
>  sound/soc/rockchip/rk3288_hdmi_analog.c             | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index d7e65c869415..86bd482b9f94 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -193,7 +193,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
>  
>  	memset(&pdevinfo, 0, sizeof(pdevinfo));
>  	pdevinfo.parent		= pdev->dev.parent;
> -	pdevinfo.id		= PLATFORM_DEVID_AUTO;
> +	pdevinfo.id		= PLATFORM_DEVID_NONE;
>  	pdevinfo.name		= HDMI_CODEC_DRV_NAME;
>  	pdevinfo.data		= &pdata;
>  	pdevinfo.size_data	= sizeof(pdata);
> diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
> index 767700c34ee2..8286025a8747 100644
> --- a/sound/soc/rockchip/rk3288_hdmi_analog.c
> +++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
> @@ -15,6 +15,7 @@
>  #include <linux/gpio.h>
>  #include <linux/of_gpio.h>
>  #include <sound/core.h>
> +#include <sound/hdmi-codec.h>
>  #include <sound/jack.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -142,7 +143,7 @@ static const struct snd_soc_ops rk_ops = {
>  SND_SOC_DAILINK_DEFS(audio,
>  	DAILINK_COMP_ARRAY(COMP_EMPTY()),
>  	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, NULL),
> -			   COMP_CODEC("hdmi-audio-codec.2.auto", "i2s-hifi")),
> +			   COMP_CODEC(HDMI_CODEC_DRV_NAME, "i2s-hifi")),
>  	DAILINK_COMP_ARRAY(COMP_EMPTY()));
>  
>  static struct snd_soc_dai_link rk_dailink = {

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
