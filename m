Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98938C0D5E
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 11:18:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22BD4DF9;
	Thu,  9 May 2024 11:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22BD4DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715246284;
	bh=MTiRf6y9CwK5s4EGi1w9HicVt5K4p9IXFySP3nBcgY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K7hqHM+NoGTgHO53SJD4FRLbdwh9oSV+77dWtEcNCtsaLH9gfQUYTdcgEEG7l15SG
	 G347vR4kU7sYoO5dK+0b+AVRXo2odHh/NcM/p2fnGZMtpRSUQcfCtLnaawEynN0hUX
	 0ANz02A3SCFlIMLbfsLFjpLj161BbJu3MXtO5fAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6253F8058C; Thu,  9 May 2024 11:17:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7CA0F80571;
	Thu,  9 May 2024 11:17:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 545F8F8049C; Thu,  9 May 2024 11:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4C44F800E2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 11:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C44F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e/V/DI4X
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41fc5645bb1so5096045e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 May 2024 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715246243; x=1715851043;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bO70t2wwFBE6k9WTC5h87uZcklzatJMH5IRVgedzqQ=;
        b=e/V/DI4XWIZ05h1aq9A/mmE2uc32xr8E0murrdDeSBMRuuNYQOvSqtAYSzaqivCX4b
         07vPO1heC+zf1e3csvQwxpOoD3yogvTx+3OPnt1cMNcwB1KJLk4rNaICD0kI+lzWM22u
         gdEx+5FpIqbNskfU2qCc4bLSWfkUTH/Rs888hZKxtVeXTh9BCkoXFKUvb1ls7xIhoQej
         2VcCamHNZwmXiwdLiDTGbpg4SMSkCcPrgHB3kd0vCO1GldwVVj6vFcDNXMCVWOAj1Brs
         nwaRQ8e3EmJHIhzMTaz1Q9c6EsbPMrLTf9N8WBjVLNbw/4l4XWhM7+/slOfNj6PxkpHa
         ez9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715246243; x=1715851043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5bO70t2wwFBE6k9WTC5h87uZcklzatJMH5IRVgedzqQ=;
        b=IT7kHNIa9gaF2Qpe/Inm7ICelYQMGJ90tui+ueThqLSbTI+js++TO98GDa+Z0HcVcx
         lvqUzrRnbJjmk8nuK/Nap/BKyz76e9n5KAl7vO2uqQrQsA7PweoBYgwfe8hO2HIWIZ/j
         en22nO1jgg9Hnbs7wPd8W/NWXD8XreSslRaHgk5dbVTPOi6tSndEaWGzA108XGfelcJw
         YSQNsU3qT7C/eqQ49Bvq8e/Bt8PC5pnqDlI9iG1ay78xMNNW22WxCwAjFUEqAbVkTsZ7
         xIjibcnRweW1vAaZ8Crs5toV2FzP4+Q0s7adhAK86jngP0yxeR+0PUxey816TMcbmGOH
         TQMg==
X-Gm-Message-State: AOJu0Yxt1hZB2ZWjfR7GHeV7xMemRue74/3I6uC91cKoBQrte5G4D/RK
	zLLBspcLJAIeCx2YGsz2SCftoOMSSeq48LMnzq5arq02MoS665C8VDXNoA4UUMQ=
X-Google-Smtp-Source: 
 AGHT+IGCauFH2yLFsnMMUE8CDtmkKT6iBzwdkH3n4+XpqeBKPgbCvrAfI3+5i8uo1Z4Oxn8hR675dg==
X-Received: by 2002:a05:600c:1c12:b0:41b:f359:2b53 with SMTP id
 5b1f17b1804b1-41f723a2496mr43405305e9.37.1715246242638;
        Thu, 09 May 2024 02:17:22 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-41f87c24f8fsm53550235e9.15.2024.05.09.02.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 02:17:22 -0700 (PDT)
Message-ID: <d3c78e43-44a9-4ef2-8e64-00f39b32172c@linaro.org>
Date: Thu, 9 May 2024 10:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] ASoC: qcom: qdsp6: Set channel mapping instead of
 fixed defaults
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-0-6f874552d7b2@linaro.org>
 <20240509-asoc-x1e80100-4-channel-mapping-v3-3-6f874552d7b2@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-3-6f874552d7b2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CYV2XA6QQ3YE57KXO4WHPNUR6MZ7WJ3T
X-Message-ID-Hash: CYV2XA6QQ3YE57KXO4WHPNUR6MZ7WJ3T
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYV2XA6QQ3YE57KXO4WHPNUR6MZ7WJ3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Krzysztof for the patch.


On 09/05/2024 07:51, Krzysztof Kozlowski wrote:
> When constructing packets to DSP, the Audioreach code uses 'struct
> audioreach_module_config' to configure parameters like number of
> channels, bitrate, sample rate etc, but uses defaults for the channel
> mapping.
> 
> Rework this code to copy the channel mapping from 'struct
> audioreach_module_config', instead of using the default.  This requires
> all callers to fill that structure: add missing initialization of
> channel mapping.
Adding this new function call is logically fine but its going to 
introducing some sequencing issues.

set_channel_map might be overwritten by this if not done correctly.

One such instance is in this patch..

> 
> Entire patch makes code more logical and easier to follow:
> 1. q6apm-dai and q6apm-lpass-dais code which allocates 'struct
>     audioreach_module_config' initializes it fully, so fills both
>     the number of channels and the channel mapping.
> 2. Audioreach code, which uses 'struct audioreach_module_config' when
>     constructing packets, copies entire contents of passed config, not
>     only pieces of it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Extend commit msg, rationale.
> 2. Rework to new approach, but most of the code stays.
> 3. Export audioreach_set_channel_mapping() (needed by Q6APM DAIS and
>     LPASS DAIS)
> 4. Correct channel mapping also in audioreach_mfc_set_media_format(),
>     because MFC DAI is now part of backend.
> 5. Do not adjust dynamic DAIs (drop audioreach_dai_load()).
> ---
>   sound/soc/qcom/qdsp6/audioreach.c       | 30 +++++++-----------------------
>   sound/soc/qcom/qdsp6/audioreach.h       |  1 +
>   sound/soc/qcom/qdsp6/q6apm-dai.c        |  2 ++
>   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  5 ++++-
>   4 files changed, 14 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index 5291deac0a0b..750b8ba64211 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -267,7 +267,7 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
>   }
>   EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
>   
> -static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
> +void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
>   {
>   	if (num_channels == 1) {
>   		ch_map[0] =  PCM_CHANNEL_FL;
> @@ -281,6 +281,7 @@ static void audioreach_set_channel_mapping(u8 *ch_map, int num_channels)
>   		ch_map[3] =  PCM_CHANNEL_RS;
>   	}
>   }
> +EXPORT_SYMBOL_GPL(audioreach_set_channel_mapping);
>   
>   static void apm_populate_container_config(struct apm_container_obj *cfg,
>   					  struct audioreach_container *cont)
> @@ -819,7 +820,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>   	uint32_t num_channels = cfg->num_channels;
>   	int payload_size;
>   	struct gpr_pkt *pkt;
> -	int rc;
> +	int rc, i;
>   	void *p;
>   
>   	payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
> @@ -842,18 +843,8 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>   	media_format->sample_rate = cfg->sample_rate;
>   	media_format->bit_width = cfg->bit_width;
>   	media_format->num_channels = cfg->num_channels;
> -
> -	if (num_channels == 1) {
> -		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
> -	} else if (num_channels == 2) {
> -		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
> -		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
> -	} else if (num_channels == 4) {
> -		media_format->channel_mapping[0] = PCM_CHANNEL_FL;
> -		media_format->channel_mapping[1] = PCM_CHANNEL_FR;
> -		media_format->channel_mapping[2] = PCM_CHANNEL_LS;
> -		media_format->channel_mapping[3] = PCM_CHANNEL_RS;
> -	}
> +	for (i = 0; i < num_channels; i++)
> +		media_format->channel_mapping[i] = cfg->channel_map[i];
>   
>   	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
>   
> @@ -883,9 +874,6 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
>   		mp3_cfg->q_factor = mcfg->bit_width - 1;
>   		mp3_cfg->endianness = PCM_LITTLE_ENDIAN;
>   		mp3_cfg->num_channels = mcfg->num_channels;
> -
> -		audioreach_set_channel_mapping(mp3_cfg->channel_mapping,
> -					       mcfg->num_channels);
>   		break;
>   	case SND_AUDIOCODEC_AAC:
>   		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
> @@ -1104,9 +1092,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>   	media_cfg->num_channels = mcfg->num_channels;
>   	media_cfg->q_factor = mcfg->bit_width - 1;
>   	media_cfg->bits_per_sample = mcfg->bit_width;
> -
> -	audioreach_set_channel_mapping(media_cfg->channel_mapping,
> -				       num_channels);
> +	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
>   
>   	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
>   
> @@ -1163,9 +1149,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>   		cfg->q_factor = mcfg->bit_width - 1;
>   		cfg->endianness = PCM_LITTLE_ENDIAN;
>   		cfg->num_channels = mcfg->num_channels;
> -
> -		audioreach_set_channel_mapping(cfg->channel_mapping,
> -					       num_channels);
> +		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
>   	} else {
>   		rc = audioreach_set_compr_media_format(header, p, mcfg);
>   		if (rc) {
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index eb9306280988..208b74e50445 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -766,6 +766,7 @@ struct audioreach_module_config {
>   /* Packet Allocation routines */
>   void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
>   				    token);
> +void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
>   void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>   			       uint32_t token, uint32_t src_port,
>   			       uint32_t dest_port);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 00bbd291be5c..8ab55869e8a2 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -243,6 +243,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>   	cfg.num_channels = runtime->channels;
>   	cfg.bit_width = prtd->bits_per_sample;
>   	cfg.fmt = SND_AUDIOCODEC_PCM;
> +	audioreach_set_channel_mapping(cfg.channel_map, runtime->channels);
>   

Prepare can be called multiple times.. so we have channels overwritten here.

--srini
>   	if (prtd->state) {
>   		/* clear the previous setup if any  */
> @@ -669,6 +670,7 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>   		cfg.num_channels = 2;
>   		cfg.bit_width = prtd->bits_per_sample;
>   		cfg.fmt = codec->id;
> +		audioreach_set_channel_mapping(cfg.channel_map, cfg.num_channels);
>   		memcpy(&cfg.codec, codec, sizeof(*codec));
>   
>   		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index a4ad1d0e6abd..8340e4fb78f4 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -106,6 +106,7 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
>   	cfg->num_channels = channels;
> +	audioreach_set_channel_mapping(cfg->channel_map, channels);
>   
>   	switch (dai->id) {
>   	case DISPLAY_PORT_RX_0:
> @@ -130,10 +131,12 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
>   {
>   	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>   	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
> +	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
>   
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
> -	cfg->num_channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
> +	cfg->num_channels = channels;
> +	audioreach_set_channel_mapping(cfg->channel_map, channels);
>   
>   	return 0;
>   }
> 
