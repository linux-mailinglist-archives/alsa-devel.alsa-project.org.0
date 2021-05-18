Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03693387F4C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 20:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A67177B;
	Tue, 18 May 2021 20:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A67177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621361494;
	bh=L69wc1rspxh3YpqEFrgzpnlIZzm45E1H7LWHzFLWJJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P+qIA9qYVGgDlLVE36NQWSugrnt0NMy+GZzgnCIOy0Z2tYCaKcxGg6ym9MtDqE+bY
	 iqUt5NzRJ+Jcl52dWgxYd2Ei0qaZM5tASTd3V1zF++81lrdyHAmZCoLLV9ypfXF8Go
	 VnQ09+tkbcYrEZPq4s9x2iNdjltR+mNRLdAuXheE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A3C5F80229;
	Tue, 18 May 2021 20:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF257F80217; Tue, 18 May 2021 20:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD0BBF8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 20:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD0BBF8014C
Received: by mail-ot1-f52.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso9398549otb.13
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 11:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FkuvQrSQFUpcINK14j2wFhP0462nBtLGLd1FHV4P3x0=;
 b=dc5ujzNqIzCXcZ6coaaV/dv/TyTpu+Zj4g6QRywZ8bR3ppo+/oykVJnqMnrcM5qCSa
 HhBDwyXwlt8A5HDziMtVf63jK96KbzyKezZHOjxqJcu5xOlfXMT4Q16YUZz31xQdHLGk
 xdzethLbvlIGU28fDNYWdf3EhIZRcXoN3BCHjdnRBeCBysdu44EGZSA4MNtKpTCS/7lz
 2aIRKZoHvGdNvjUXQ0tbjvroKfdmAZsx0gOxMMYVFWwuja+6w/VNG4xIY3YcRICl1dU0
 uFnnh8FEltHwbkXlyfZzqJEvAN+uTeZw9S8TyluDLR6Ub/bO3NphtrALWiad5jRcORii
 YDow==
X-Gm-Message-State: AOAM531SZzqaRl8RFNNhieJWe+W+hjVDNUF05pLyWOY1h3K1neVpLW6y
 Qs3j/16tG/8EsHbh73+UJA==
X-Google-Smtp-Source: ABdhPJy83vorwZ946H+siNqyaTQi794cgapVkhtLojUJKGMSukubOgZuoLBbq9vciBwGECDWOkjSaQ==
X-Received: by 2002:a9d:4a85:: with SMTP id i5mr5360010otf.102.1621361391485; 
 Tue, 18 May 2021 11:09:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 77sm2940360otc.54.2021.05.18.11.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:09:50 -0700 (PDT)
Received: (nullmailer pid 961183 invoked by uid 1000);
 Tue, 18 May 2021 18:09:49 -0000
Date: Tue, 18 May 2021 13:09:49 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: tegra: Unify ASoC machine drivers
Message-ID: <20210518180949.GA949047@robh.at.kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518001356.19227-3-digetx@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Rowand <frowand.list@gmail.com>
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

On Tue, May 18, 2021 at 03:13:56AM +0300, Dmitry Osipenko wrote:
> Squash all machine drivers into a single-universal one. This reduces
> code duplication, eases addition of a new drivers and upgrades older
> code to a modern Linux kernel APIs.

Nice, I never understood why each codec needed it's own machine driver 
(and typically in turn compatible string).

>
> Suggested-by: Jonathan Hunter <jonathanh@nvidia.com>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

[...]

> diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
> index e4863fa37b0c..fdf74bfd728e 100644
> --- a/sound/soc/tegra/tegra_wm8903.c
> +++ b/sound/soc/tegra/tegra_wm8903.c
> @@ -14,192 +14,80 @@
>   *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
>   */
>  
> +#include <linux/gpio/consumer.h>
> +#include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/slab.h>
> -#include <linux/gpio.h>
> -#include <linux/of_gpio.h>
>  
>  #include <sound/core.h>
>  #include <sound/jack.h>
> -#include <sound/pcm.h>
> -#include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  
>  #include "../codecs/wm8903.h"
>  
> -#include "tegra_asoc_utils.h"
> +#include "tegra_asoc_machine.h"
>  
> -#define DRV_NAME "tegra-snd-wm8903"
> +static struct snd_soc_jack_pin tegra_wm8903_mic_jack_pins[] = {
> +	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
> +};
>  
> -struct tegra_wm8903 {
> -	int gpio_spkr_en;
> -	int gpio_hp_det;
> -	int gpio_hp_mute;
> -	int gpio_int_mic_en;
> -	int gpio_ext_mic_en;
> -	struct tegra_asoc_utils_data util_data;
> +static const char * const tegra_active_low_hp_compats[] = {
> +	"ad,tegra-audio-plutux",
> +	"ad,tegra-audio-wm8903-medcom-wide",
> +	"ad,tegra-audio-wm8903-tec",
> +	"nvidia,tegra-audio-wm8903-cardhu",
> +	"nvidia,tegra-audio-wm8903-harmony",
> +	"nvidia,tegra-audio-wm8903-picasso",
> +	"nvidia,tegra-audio-wm8903-seaboard",
> +	"nvidia,tegra-audio-wm8903-ventana",
> +	NULL,

I think this list should be added to the main match table below with 
data having a flag for active low HP. Then you only match once, don't 
need the exported function and the next difference is much easier to 
add.

>  };
>  
> -static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
> -					struct snd_pcm_hw_params *params)
> +static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
>  {
> -	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> -	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
> +	struct device_node *np = rtd->card->dev->of_node;
>  	struct snd_soc_card *card = rtd->card;
> -	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
> -	int srate, mclk;
>  	int err;
>  
> -	srate = params_rate(params);
> -	switch (srate) {
> -	case 64000:
> -	case 88200:
> -	case 96000:
> -		mclk = 128 * srate;
> -		break;
> -	default:
> -		mclk = 256 * srate;
> -		break;
> -	}
> -	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
> -	while (mclk < 6000000)
> -		mclk *= 2;
> +	/*
> +	 * Older version of machine driver was ignoring GPIO polarity,
> +	 * forcing it to active-low.  This means that all older device-trees
> +	 * which set the polarity to active-high are wrong and we need to fix
> +	 * up them.
> +	 */
> +	if (of_device_compatible_match(np, tegra_active_low_hp_compats)) {
> +		bool active_low = gpiod_is_active_low(machine->gpiod_hp_det);

[...]

> +static const struct tegra_asoc_data tegra_wm8903_data = {
> +	.mclk_rate = tegra_asoc_machine_mclk_rate,
> +	.card = &snd_soc_tegra_wm8903,
> +	.add_common_dapm_widgets = true,
> +	.add_common_controls = true,
> +	.add_common_soc_ops = true,
> +	.add_mic_jack = true,
> +	.add_hp_jack = true,
> +};
>  
>  static const struct of_device_id tegra_wm8903_of_match[] = {
> -	{ .compatible = "nvidia,tegra-audio-wm8903", },
> +	{ .compatible = "nvidia,tegra-audio-wm8903", .data = &tegra_wm8903_data },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
>  
>  static struct platform_driver tegra_wm8903_driver = {
>  	.driver = {
> -		.name = DRV_NAME,
> -		.pm = &snd_soc_pm_ops,
> +		.name = "tegra-wm8903",
>  		.of_match_table = tegra_wm8903_of_match,
> +		.pm = &snd_soc_pm_ops,
>  	},
> -	.probe = tegra_wm8903_driver_probe,
> +	.probe = tegra_asoc_machine_probe,
>  };
>  module_platform_driver(tegra_wm8903_driver);
>  
>  MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
>  MODULE_DESCRIPTION("Tegra+WM8903 machine ASoC driver");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:" DRV_NAME);
> -MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
