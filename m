Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C9076D826
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 21:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24FE31E7;
	Wed,  2 Aug 2023 21:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24FE31E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691005692;
	bh=66lG0SqtnyJz2JopAW20/4I786zrBTqlC+6J0Q4DBR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f1oJPpxssd0WyFpJUlbjjc40e00Jneh7Qp1H1GgYuqWb7eDhJvJ9nCpWCfB2Pr/SQ
	 d8RE57SRFdkBxExy4dPd0V+dnnoyifS3i89jmDnJevlCrt5nrnX1Ua4md48fFp7stX
	 ocl4PZ2oLUErUcc2p5fTvEli2P3PSFXXClqntFGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7091CF80425; Wed,  2 Aug 2023 21:47:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0412AF801D5;
	Wed,  2 Aug 2023 21:47:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64B5CF8025A; Wed,  2 Aug 2023 21:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32786F80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 21:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32786F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=aSo8EX9Z
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe1d462762so2489025e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 12:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691005624; x=1691610424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U33KRjG3dZCYYraXo31SNRqhNyAyO61DEuioGS6fF24=;
        b=aSo8EX9ZKihDhZ5hJC2oj9iqlgVn+eDMjpzsTKjQ19JQl68xOt2okYIqD1j/Ycjvlm
         zfQIDWsd9nDJQiczUaIv0K5EtxoJtbEOK3gFBzRgDDRwuyYkGuhUbszsEVAK6HnaWMRf
         doQzIRU+bOOlWQ8hKUqBQKMlqHLedglRotorNCbT9XpQOMHbCwbl4U4W9hjCLStO17JY
         ZTVK3wSn7aAdNbtv7lNkdbapxQbPGaISzsMZtMKeEd3+tM4tjngkfs7pdjzkSbxPDMMu
         O3mKUGGa3mcaw8gOtyssDiKltHOtUp4FXaq79Ia8TvLL6LbkOD8fGY8PgW4MEBJQX27H
         QZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691005624; x=1691610424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U33KRjG3dZCYYraXo31SNRqhNyAyO61DEuioGS6fF24=;
        b=KtwQXCjKK++023l68xa4OeOkRKXLU/7p01wTBR965o/8WP/E0DXTpJ3Aza/Oqk1bgX
         s10JjOWnXI0LU5gLvga+DM2lrSSRNmFDvfIY2f0PcatIPbW7dkb2brVce8K21w+2VLxQ
         7F3rFfWfvP2GMl6Psg47tJEheiWu6cTBxkB/nR5bA4HTesV5LtADR5/0jy1RABJ34zNo
         QWQHU9jTtZmskewSSp6e6qn3srP+toNjPQrG9og3jdZES8WFz16tPNZqBEWZ1C/zxEOr
         mFFhV+2hjMQTzbRZrDwnooonUv9ipty2cJkbKD3HJ5qpWmwssth32E+Wcvj6XDpUHJoN
         wtJg==
X-Gm-Message-State: ABy/qLZdj99k+SIlob5tHUJ5avANGjWJJnKhEGNyfNUcH4A2ikyp8lCZ
	fDcbl8I1PKWTC4AiLwdjDE4=
X-Google-Smtp-Source: 
 APBJJlF6Q8r6Kh57yAm+0VVXDG24V3CJAHa9B9N+yNbdKrU9xUr6cvf9kKvh+UAKhmbJ/9pRXGY+LQ==
X-Received: by 2002:a05:600c:ac6:b0:3fe:201a:4b7b with SMTP id
 c6-20020a05600c0ac600b003fe201a4b7bmr5914071wmr.27.1691005623805;
        Wed, 02 Aug 2023 12:47:03 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net.
 [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003fe2b6d64c8sm2408613wmi.21.2023.08.02.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 12:47:03 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Uwe <u.kleine-koenig@pengutronix.de>, Ban Tao <fengzheng923@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 18/38] ASoC: sunxi: merge DAI call back functions into ops
Date: Wed, 02 Aug 2023 21:47:01 +0200
Message-ID: <12255907.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <87jzuetg9u.wl-kuninori.morimoto.gx@renesas.com>
References: 
 <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
 <87jzuetg9u.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: SO2B7D2HJYGFYGN4OWR7YFJIO7OVQMQD
X-Message-ID-Hash: SO2B7D2HJYGFYGN4OWR7YFJIO7OVQMQD
X-MailFrom: jernej.skrabec@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SO2B7D2HJYGFYGN4OWR7YFJIO7OVQMQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne sreda, 02. avgust 2023 ob 02:54:53 CEST je Kuninori Morimoto napisal(a):
> ALSA SoC merges DAI call backs into .ops.
> This patch merge thesse into one.

"these"

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c |  6 +++++-
>  sound/soc/sunxi/sun4i-i2s.c   | 18 +++++++++---------
>  sound/soc/sunxi/sun4i-spdif.c |  2 +-
>  sound/soc/sunxi/sun50i-dmic.c |  2 +-
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 55328850aef5..f0a5fd901101 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1252,9 +1252,12 @@ static int sun4i_codec_dai_probe(struct snd_soc_dai
> *dai) return 0;
>  }
> 
> +static const struct snd_soc_dai_ops dummy_dai_ops = {
> +	.probe	= sun4i_codec_dai_probe,
> +};
> +
>  static struct snd_soc_dai_driver dummy_cpu_dai = {
>  	.name	= "sun4i-codec-cpu-dai",
> -	.probe	= sun4i_codec_dai_probe,
>  	.playback = {
>  		.stream_name	= "Playback",
>  		.channels_min	= 1,
> @@ -1271,6 +1274,7 @@ static struct snd_soc_dai_driver dummy_cpu_dai = {
>  		.formats 	= SUN4I_CODEC_FORMATS,
>  		.sig_bits	= 24,
>  	 },
> +	.ops = &dummy_dai_ops,
>  };
> 
>  static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 669d712bbe9f..5124b6c9ceb4 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1081,14 +1081,6 @@ static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai
> *dai, return 0;
>  }
> 
> -static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
> -	.hw_params	= sun4i_i2s_hw_params,
> -	.set_fmt	= sun4i_i2s_set_fmt,
> -	.set_sysclk	= sun4i_i2s_set_sysclk,
> -	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
> -	.trigger	= sun4i_i2s_trigger,
> -};
> -
>  static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
>  {
>  	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> @@ -1100,12 +1092,20 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai
> *dai) return 0;
>  }
> 
> +static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
> +	.probe		= sun4i_i2s_dai_probe,

spaces should be used instead of a tab.

> +	.hw_params	= sun4i_i2s_hw_params,
> +	.set_fmt	= sun4i_i2s_set_fmt,
> +	.set_sysclk	= sun4i_i2s_set_sysclk,
> +	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
> +	.trigger	= sun4i_i2s_trigger,
> +};
> +
>  #define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
>  			 SNDRV_PCM_FMTBIT_S20_LE | \
>  			 SNDRV_PCM_FMTBIT_S24_LE)
> 
>  static struct snd_soc_dai_driver sun4i_i2s_dai = {
> -	.probe = sun4i_i2s_dai_probe,
>  	.capture = {
>  		.stream_name = "Capture",
>  		.channels_min = 1,
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index ff18d4113aac..28bf6f4dca46 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -508,6 +508,7 @@ static int sun4i_spdif_soc_dai_probe(struct snd_soc_dai
> *dai) }
> 
>  static const struct snd_soc_dai_ops sun4i_spdif_dai_ops = {
> +	.probe		= sun4i_spdif_soc_dai_probe,

Ditto.


Other than that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  	.startup	= sun4i_spdif_startup,
>  	.trigger	= sun4i_spdif_trigger,
>  	.hw_params	= sun4i_spdif_hw_params,
> @@ -533,7 +534,6 @@ static struct snd_soc_dai_driver sun4i_spdif_dai = {
>  		.rates = SUN4I_RATES,
>  		.formats = SUN4I_FORMATS,
>  	},
> -	.probe = sun4i_spdif_soc_dai_probe,
>  	.ops = &sun4i_spdif_dai_ops,
>  	.name = "spdif",
>  };
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c10439b9e0a2..2599683a582d 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -236,6 +236,7 @@ static int sun50i_dmic_soc_dai_probe(struct snd_soc_dai
> *dai) }
> 
>  static const struct snd_soc_dai_ops sun50i_dmic_dai_ops = {
> +	.probe		= sun50i_dmic_soc_dai_probe,
>  	.startup        = sun50i_dmic_startup,
>  	.trigger        = sun50i_dmic_trigger,
>  	.hw_params      = sun50i_dmic_hw_params,
> @@ -260,7 +261,6 @@ static struct snd_soc_dai_driver sun50i_dmic_dai = {
>  		.formats = SUN50I_DMIC_FORMATS,
>  		.sig_bits = 21,
>  	},
> -	.probe = sun50i_dmic_soc_dai_probe,
>  	.ops = &sun50i_dmic_dai_ops,
>  	.name = "dmic",
>  };




