Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DE880143
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 16:57:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91F152BA8;
	Tue, 19 Mar 2024 16:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91F152BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710863827;
	bh=kTIWQgBaqX7BCGZ6l0YNbzF24DBdzNGDd7qEdfi2zjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XLdek36SdQI8SeWQvCCFdvRel2JplZYnlu5LCGrqy24EsUZYEuTSnGDrVMFxAcJwl
	 IXRkNNgNev9rjX8yKLp7dvI27+bUFbP+6XJjrdleUrmofGK1PhNAyJ5gt5Qq09fbPQ
	 0GSDyk4S1pWKf8Wv/04LebEmMCknN9ErODVYejRY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B102BF804E7; Tue, 19 Mar 2024 16:56:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7207F8059F;
	Tue, 19 Mar 2024 16:56:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8EA7F804E7; Tue, 19 Mar 2024 16:56:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7D53F80093
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 16:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7D53F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IqqkWo+Q
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-515830dc79cso731416e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Mar 2024 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710863778; x=1711468578;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t4IC/jDYnczASn/Z+j5D8kmO/fWJVOdRI8Restnbwbk=;
        b=IqqkWo+QAyrDhpmzLNA5oTa+5AzzfDLx5/Vu6h73VIMBTT5W0Bg59smRoyWH324P6r
         AfrUKC4yGQF7q1LEuIYVA9oTWhpICllCDjlB3d7HhOZji6qSimXw9Fm4tqgBB8ee5k+J
         zjJgnPaF9Qcj7FvvdyLfU+XJ4U5pcNewyDKRmEFdNdZhcZwRfwSz1xd/Lg0lB/Dntr0O
         OgslskxeiBRYcLiE2CFnhgMO/iBxx9wMWR1ssFj9ZDJd28EeQjDsQEsXDqd/Wj6/U1U1
         MySSNwvzMHjl2TOsR4hJXyh8JIT6Q3X4pCLRG2ertt2RGi4o7J0Flf2gr30iQsb+FGaO
         /6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863778; x=1711468578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t4IC/jDYnczASn/Z+j5D8kmO/fWJVOdRI8Restnbwbk=;
        b=XiTbJ2ekGHKf7njNdP+8K7TdLuhPS29dhe/r4JBgBsXkh/shWN2Bd1a/bd8kCVdK9I
         pE7+fWMfy5xcl8qGYm+a62CxO1hp7jRQo29tcqLnlVlu4VreV+E1whZ1H1lb/i+1qBgw
         61DYLhvkeAWu8KHOUYJ4mRXRdvfrSXV70Q73lhjpMFY5HI/GBU8YhagpXMLK1a42O9l2
         EaFO5NLA8gb0T4+3t4lT3xvVdWegYXdnNi61I5lETkdEomKQGB/btLDBkqAwCP6FjnGi
         dC62PtF0G2XHTwIqtcq1xXjEj0wy4zJ9/gLzWuZnAYXVTIXF2OjZcKLwSW1N5rt9G7rW
         3ZOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBwkAqIN/0Zj6vql1VcLVDrXlZ1FYl6VIgFhm2eZYSXhW+poxn/dmEzJCumxRm/Aovmaqi4v6kMHQyM1zwiEh42FgGiG7Nyi15p+4=
X-Gm-Message-State: AOJu0YxfLMuXAttXdhEq77NPSGHyLC8FtALApuAEtY5ERujragW7CYpr
	XQqhkHnvylE+S4rEpyM99dtPPznccFZXLjjNY2t6lXk5nKhqPpr1
X-Google-Smtp-Source: 
 AGHT+IHPjsVkIChJGewZZKSNJVAbvELDs1703BC5ZulAjkk2eenekYwRB/mjugs3Enk3gw3PaJ7LfA==
X-Received: by 2002:a19:ca05:0:b0:513:b30c:53c7 with SMTP id
 a5-20020a19ca05000000b00513b30c53c7mr9644413lfg.10.1710863778027;
        Tue, 19 Mar 2024 08:56:18 -0700 (PDT)
Received: from ?IPV6:2001:999:708:5b57:30d6:2195:bb7b:bb94?
 ([2001:999:708:5b57:30d6:2195:bb7b:bb94])
        by smtp.gmail.com with ESMTPSA id
 u13-20020ac25bcd000000b005131434454bsm1959551lfn.228.2024.03.19.08.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 08:56:17 -0700 (PDT)
Message-ID: <9d123584-1feb-404b-890f-2da694cf56d5@gmail.com>
Date: Tue, 19 Mar 2024 17:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] ASoC: ti: davinci-i2s: Add TDM support
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-8-bastien.curutchet@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240315112745.63230-8-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MK5BKPEUKNLOWZWHMCCDRAYUMWPPP56M
X-Message-ID-Hash: MK5BKPEUKNLOWZWHMCCDRAYUMWPPP56M
X-MailFrom: peter.ujfalusi@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MK5BKPEUKNLOWZWHMCCDRAYUMWPPP56M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15/03/2024 13:27, Bastien Curutchet wrote:
> TDM is not supported by the McBSP driver. The McBSP datasheet does not
> name explicitly TDM as a supported format but it is possible to configure
> the McBSP to do TDM if all slots are used by McBSP.
> 
> Add TDM support. It uses single-phase frame. Slot width is used to
> compute the McBSP's word length.
> 
> Implement the set_tdm_slot() hook of snd_soc_dai_ops struct. It only
> supports TDM if all slots are used by McBSP.
> 
> The snd_soc_dai_driver's capture.channels_max is updated from 2 to 128.
> 128 is the maximum frame length when using single-phase frame.
> playback.channels_max has not been updated as I could not test TDM on
> playbacks with my hardware.
> 
> This was tested on platform designed off of DAVINCI/OMAP_L138 with BP_FC
> format so this is only supported format for TDM yet. A check is done in
> davinci_i2s_set_dai_fmt() to prevent TDM to be used with other formats
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  sound/soc/ti/davinci-i2s.c | 81 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 77 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index f4514d4dff07..4adaed010700 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -160,6 +160,9 @@ struct davinci_mcbsp_dev {
>  	unsigned int fmt;
>  	int clk_div;
>  	bool i2s_accurate_sck;
> +
> +	int tdm_slots;
> +	int slot_width;
>  };
>  
>  static inline void davinci_mcbsp_write_reg(struct davinci_mcbsp_dev *dev,
> @@ -213,6 +216,57 @@ static void davinci_mcbsp_stop(struct davinci_mcbsp_dev *dev, int playback)
>  	toggle_clock(dev, playback);
>  }
>  
> +static int davinci_i2s_tdm_word_length(int tdm_slot_width)
> +{
> +	switch (tdm_slot_width) {
> +	case 8:
> +		return DAVINCI_MCBSP_WORD_8;
> +	case 12:
> +		return DAVINCI_MCBSP_WORD_12;
> +	case 16:
> +		return DAVINCI_MCBSP_WORD_16;
> +	case 20:
> +		return DAVINCI_MCBSP_WORD_20;
> +	case 24:
> +		return DAVINCI_MCBSP_WORD_24;
> +	case 32:
> +		return DAVINCI_MCBSP_WORD_32;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int davinci_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
> +				    unsigned int tx_mask,
> +				    unsigned int rx_mask,
> +				    int slots, int slot_width)
> +{
> +	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
> +
> +	dev_dbg(dev->dev, "%s - slots %d, slot_width %d\n", __func__, slots, slot_width);

The __func__ can be ommited, it is better to leave it for dynamic
debugging by adding "dyndbg=+pmf" module parameter if needed.

> +
> +	if (slots > 128 || !slots) {
> +		dev_err(dev->dev, "Invalid number of slots\n");
> +		return -EINVAL;
> +	}
> +
> +	if (rx_mask != (1 << slots) - 1) {
> +		dev_err(dev->dev, "Invalid RX mask (0x%08x) : all slots must be used by McBSP\n",
> +			rx_mask);
> +		return -EINVAL;

This is only a restriction for RX?

> +	}
> +
> +	if (davinci_i2s_tdm_word_length(slot_width) < 0) {
> +		dev_err(dev->dev, "%s: Unsupported slot_width %d\n", __func__, slot_width);
> +		return -EINVAL;
> +	}
> +
> +	dev->tdm_slots = slots;
> +	dev->slot_width = slot_width;
> +
> +	return 0;
> +}
> +
>  #define DEFAULT_BITPERSAMPLE	16
>  
>  static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
> @@ -228,6 +282,13 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  		DAVINCI_MCBSP_SRGR_FWID(DEFAULT_BITPERSAMPLE - 1);
>  
>  	dev->fmt = fmt;
> +
> +	if ((dev->tdm_slots || dev->slot_width) &&
> +	    ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_BP_FC)) {
> +		dev_err(dev->dev, "TDM is only supported for BP_FC format\n");
> +		return -EINVAL;

I think this is not a valid statement, Fsync can be generated internally
or coming from external source in TDM mode also.

> +	}
> +
>  	/* set master/slave audio interface */
>  	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
>  	case SND_SOC_DAIFMT_BP_FP:
> @@ -383,7 +444,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  
>  	master = dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
>  	fmt = params_format(params);
> -	mcbsp_word_length = asp_word_length[fmt];
> +	if (dev->slot_width)
> +		mcbsp_word_length = davinci_i2s_tdm_word_length(dev->slot_width);
> +	else
> +		mcbsp_word_length = asp_word_length[fmt];
> +
> +	if (mcbsp_word_length < 0)
> +		return mcbsp_word_length;
>  
>  	switch (master) {
>  	case SND_SOC_DAIFMT_BP_FP:
> @@ -483,8 +550,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  	switch (master) {
>  	case SND_SOC_DAIFMT_BP_FP:
>  	case SND_SOC_DAIFMT_BP_FC:
> -		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(0);
> -		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(0);
> +		if (dev->tdm_slots > 0) {
> +			rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(dev->tdm_slots - 1);
> +			xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(dev->tdm_slots - 1);
> +		} else {
> +			rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(0);
> +			xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(0);
> +		}
>  		break;
>  	case SND_SOC_DAIFMT_BC_FC:
>  	case SND_SOC_DAIFMT_BC_FP:
> @@ -609,6 +681,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
>  	.hw_params	= davinci_i2s_hw_params,
>  	.set_fmt	= davinci_i2s_set_dai_fmt,
>  	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
> +	.set_tdm_slot   = davinci_i2s_set_tdm_slot,
>  
>  };
>  
> @@ -621,7 +694,7 @@ static struct snd_soc_dai_driver davinci_i2s_dai = {
>  	},
>  	.capture = {
>  		.channels_min = 2,
> -		.channels_max = 2,
> +		.channels_max = 128,
>  		.rates = DAVINCI_I2S_RATES,
>  		.formats = DAVINCI_I2S_FORMATS,
>  	},

-- 
Péter
