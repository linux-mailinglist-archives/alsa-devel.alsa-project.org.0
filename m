Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5291131B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 22:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD5D850;
	Thu, 20 Jun 2024 22:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD5D850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718915249;
	bh=sFCHX618nzTm6sLAYJPe7BYHyHyu7xj0KoZYjZgfiFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KTF1yjfNkPgF85b8DvYcP2VitbOi/OvW+cDQJi4VVOApJaXHqeUoE/x4gEl75QdK9
	 VHuHON+OxmtGxBQNhopV0QXM9AIkds2RzJpXvZSs7YyygB/EITyJOyOH53RccltM+W
	 FZ+GCzaNOJeA0OtENOARX7NGm8/DTUDuaqinW+vM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A224F8023A; Thu, 20 Jun 2024 22:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AD2CF8023A;
	Thu, 20 Jun 2024 22:26:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32834F8023A; Thu, 20 Jun 2024 22:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93631F800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 22:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93631F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=myQG9+4j
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52b7ffd9f6eso1475869e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 13:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718915206; x=1719520006;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8kmsXX8+t7q4fze1b5xWV2DOaP1fCecJ7UVyeVkxV4=;
        b=myQG9+4jZ9aeY3tgPMAGGgSUtKLK+X05OlvetbYxMI9to5jVEIp5iYbN4PW2T53diH
         bt6Y4Xo5hPUm4qbh5C6TvEKvcz83mo4ehcu+yz2u8iz0Do0OZvix8P9xX3kdkWyhtB6T
         ujvDwePLzd2LDQICRkvDbxWidrmfr5ZduIyWcRflvanQwNgx4DrZnCjzXcgAF67/SpUw
         kubEogXvylUjzdyhQNY7R25NToabZ5GlTPBgAPrTT5dtP9XdAfSD00+HvlOEhRaP/qsk
         lmf1KkDbc9vEv87aVgJmL7rxaU+59b7RZUfNOuyIQZCSjwptb2FtY7XCanKBMPy1LZw7
         Q+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915206; x=1719520006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8kmsXX8+t7q4fze1b5xWV2DOaP1fCecJ7UVyeVkxV4=;
        b=ge7uNXDNgpFPzi4KaUgZojA4MFoQdxNOa1dtAsKlNEtbovgfXYoOPkxhr3ferwZ5NX
         0B4xiLjsAsM5oUn9yAOp/LcIXAJ7m2YZRGgeEPgpdjol6hPiQDear7PYmIUb5GStex3t
         GekONOAnm0LhCKNsFHTdVdNJZc7oYOESsp3frsOfz9lFUPwMGswV1jkkIEwBhfcagYiu
         GbBY91NTop0hS+nz2LfIkDPYBw3uk93AaI38BC/jXRXdjBBVfGeTUUXGebcXGrSzze69
         VIb8IkRVpgh9Qshx/ny5Dfc4irAFcvG0GeVlaq22+MCPa4AE+9huGwf9owdcbgRiFcZo
         DdMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUONdzmWCqOeja0OERsN0ypMt5LGskMN4i0bRVDrMc6ewnRB8SDiHPxwm/ASBhUR+IxmkkyOceBcHP4LNLONU5lL0N6CqviVdeB7LU=
X-Gm-Message-State: AOJu0Yw1QUI/+L8FHTymCcrDAEM4FaEQk0SEvNkX4paJPhhIhO3ZYmQ0
	h5MOJ03j6WBjnImRnxO22mAfY4KVsy2ps8GipoMN699UShmUdtmkhWwg36LPaVE=
X-Google-Smtp-Source: 
 AGHT+IHzDL4LA0M5hK+v+OwKwF0rXAEquerAfuzkP8LWy81w8k3FKZLYPQ1yOmy3eJQg3LBJXI1g6g==
X-Received: by 2002:a05:6512:318e:b0:52c:cc40:a732 with SMTP id
 2adb3069b0e04-52ccc40a864mr4612649e87.43.1718915205915;
        Thu, 20 Jun 2024 13:26:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282edc1sm2142712e87.115.2024.06.20.13.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:26:45 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:26:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Message-ID: <45iy6ksg25iqfnfezzsutmh7ihgbdy5wukul5bek2rmzm7jbbl@65rk4o6ednor>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
 <20240619-lpass-wsa-vi-v2-1-7aff3f97a490@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-lpass-wsa-vi-v2-1-7aff3f97a490@linaro.org>
Message-ID-Hash: RENA2E2SP5G7OUNC24HRZIEX5FO37TH2
X-Message-ID-Hash: RENA2E2SP5G7OUNC24HRZIEX5FO37TH2
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RENA2E2SP5G7OUNC24HRZIEX5FO37TH2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 19, 2024 at 02:42:00PM GMT, Srinivas Kandagatla wrote:
> Currently the VI feedback rate is set to fixed 8K, fix this by getting
> the correct rate from params_rate.

What kind of issues are observed without this patch? What is the actual
issue that is getting fixed?

> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 39 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 6ce309980cd1..ec9f0b5d6778 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -66,6 +66,10 @@
>  #define CDC_WSA_TX_SPKR_PROT_CLK_DISABLE	0
>  #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK	GENMASK(3, 0)
>  #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K	0
> +#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K	1
> +#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K	2
> +#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K	3
> +#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K	4
>  #define CDC_WSA_TX0_SPKR_PROT_PATH_CFG0		(0x0248)
>  #define CDC_WSA_TX1_SPKR_PROT_PATH_CTL		(0x0264)
>  #define CDC_WSA_TX1_SPKR_PROT_PATH_CFG0		(0x0268)
> @@ -347,6 +351,7 @@ struct wsa_macro {
>  	int ear_spkr_gain;
>  	int spkr_gain_offset;
>  	int spkr_mode;
> +	u32 pcm_rate_vi;
>  	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
>  	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
>  	struct regmap *regmap;
> @@ -974,6 +979,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
>  			       struct snd_soc_dai *dai)
>  {
>  	struct snd_soc_component *component = dai->component;
> +	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>  	int ret;
>  
>  	switch (substream->stream) {
> @@ -985,6 +991,11 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
>  				__func__, params_rate(params));
>  			return ret;
>  		}
> +		break;
> +	case SNDRV_PCM_STREAM_CAPTURE:
> +		if (dai->id == WSA_MACRO_AIF_VI)
> +			wsa->pcm_rate_vi = params_rate(params);
> +
>  		break;
>  	default:
>  		break;
> @@ -1159,6 +1170,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>  	u32 tx_reg0, tx_reg1;
> +	u32 rate_val;
> +
> +	switch (wsa->pcm_rate_vi) {
> +	case 8000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
> +		break;
> +	case 16000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
> +		break;
> +	case 24000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
> +		break;
> +	case 32000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
> +		break;
> +	case 48000:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
> +		break;
> +	default:
> +		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
> +		break;
> +	}
>  
>  	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
>  		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
> @@ -1170,7 +1203,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  
>  	switch (event) {
>  	case SND_SOC_DAPM_POST_PMU:
> -			/* Enable V&I sensing */
> +		/* Enable V&I sensing */
>  		snd_soc_component_update_bits(component, tx_reg0,
>  					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
>  					      CDC_WSA_TX_SPKR_PROT_RESET);
> @@ -1179,10 +1212,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
>  					      CDC_WSA_TX_SPKR_PROT_RESET);
>  		snd_soc_component_update_bits(component, tx_reg0,
>  					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
> -					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
> +					      rate_val);
>  		snd_soc_component_update_bits(component, tx_reg1,
>  					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
> -					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
> +					      rate_val);
>  		snd_soc_component_update_bits(component, tx_reg0,
>  					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
>  					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
