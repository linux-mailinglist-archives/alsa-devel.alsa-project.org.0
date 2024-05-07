Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 170828BE3D5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 15:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73123823;
	Tue,  7 May 2024 15:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73123823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715088380;
	bh=1YdTwfuNwxYNe8Mmuq702r1+TT9SLoVk7UjbXryhPHA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UgASWZw22oynCi27yiVPDf8/47thrFlJcs6NWvvBzfLQxMK3uaWjiQmn3O6ViM7cu
	 2IJUBPS4EdQ0ovqRvv8GZVvefqSQhZk64llvEzDszUV4rkCG8BUgAeX00yK4Vio56J
	 2Mjmx27jpGSvkuQFZGurHQIImqLZrusVfxg/LweU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E61DDF805A0; Tue,  7 May 2024 15:25:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0773CF8024C;
	Tue,  7 May 2024 15:25:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87020F8049C; Tue,  7 May 2024 15:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EF02F8024C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 15:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EF02F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Lb4KI3AA
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so21786195e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 07 May 2024 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715088333; x=1715693133;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlNzM09ry4x5F/SvfwoA6Cda7LNRXq8+feF1giEA3Z4=;
        b=Lb4KI3AAZAxqVHnQt7jZzMRve4MSn6Qn9GjQ/thsQgooAgtAaC5awcJnzzOZvrNLQ2
         WdY3UCQSzQwGcqDgd5bMLODtIxhvZ/ki2MI6CqrsJ236tlijRAW0PppaHzxIaqvo77La
         Lj1ABVkX4BXUegHeeg5/8t0arfIYZUYZLDMS5H6zmBzhGpWkRPKpZmEYWxklTweoN0WQ
         SVjnFFYJKdSCiP/4EUVefTiHNkQUp3uvw1fqGb3uewhxuKX0aH2uRQc1jFK/KbIArDaH
         1oObG4d1IO5+b48SCgTvNJWfK8YmW4ECVasXHImc9LY6efJEy4f0ekCR9e4XI+7UYeDt
         9gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715088333; x=1715693133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlNzM09ry4x5F/SvfwoA6Cda7LNRXq8+feF1giEA3Z4=;
        b=LX9VkRGbc9wRKZqA9uSxAo4NUpb/iGh0PPsLeZlw2DjVd93DnlUK6RABVDQaU66h8v
         d3SI7NbzjoKTH3DkEwzzt6j3AMdZuaEdRJrIbIrSjMyexde46yM763b5vPQT2oQyQX0W
         SdUYZrAZOX/fQOux1vc4iT3THIhcIblPAoGRJ8DG3K2+pPnlRl5ZcgH8MuDr7A4GZ1Tg
         ndsu+DIkVqKKPxyxbF+5bLU/BQrdmEzXefs/n3F6zMiaDhctnpLT/XDYCXFHKOugjqtd
         rL7TnrmdEhmw2RzYlrTE5bU9poLEYSbtrNtYHt82SVPTIhabZV6n2BvLqcmE24GNzmtf
         nHgw==
X-Gm-Message-State: AOJu0Yz9MSPp9TGfmZHJLDrEFPNd+7/z/sy4dUrR67nUqXk0Ja2bj2kF
	Sj4r/F38ubZU5OQZHhwvAqSJKN7IFSwMDDFsiSfkx1gJZJBNunqifVdpBuGQVrE=
X-Google-Smtp-Source: 
 AGHT+IFlwogjnVk5W12TDpiJhf3o1G5wSzPvFgFvrXCif+LH31aJHWpIuIozCpHtIE/PUCFHrT5uaw==
X-Received: by 2002:a05:600c:1d9c:b0:41b:dafe:ff78 with SMTP id
 p28-20020a05600c1d9c00b0041bdafeff78mr9340116wms.20.1715088333342;
        Tue, 07 May 2024 06:25:33 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 p9-20020a05600c1d8900b0041563096e15sm23691996wms.5.2024.05.07.06.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 06:25:32 -0700 (PDT)
Message-ID: <89cf75d8-1f85-43d8-9c33-377a04b36121@linaro.org>
Date: Tue, 7 May 2024 14:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: qcom: q6dsp: Implement proper channel mapping
 in Audioreach
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
 <20240507-asoc-x1e80100-4-channel-mapping-v1-0-b12c13e0a55d@linaro.org>
 <20240507-asoc-x1e80100-4-channel-mapping-v1-2-b12c13e0a55d@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
 <20240507-asoc-x1e80100-4-channel-mapping-v1-2-b12c13e0a55d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HL2XSK4OEXG5PQQAVWWZTAQZSRFT36AW
X-Message-ID-Hash: HL2XSK4OEXG5PQQAVWWZTAQZSRFT36AW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HL2XSK4OEXG5PQQAVWWZTAQZSRFT36AW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 07/05/2024 11:27, Krzysztof Kozlowski wrote:
> Instead of relying on default channel mapping in all Audioreach
> platforms, implement set_channel_map() callback to allow sound cards
> customize the mapping depending on needs.
> 
> The channel mapping is set on frontend DAIs coming from the topology,
> not DTS, thus need to add DAI ops in topology dai_load() callback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/qcom/qdsp6/audioreach.c |  2 +-
>   sound/soc/qcom/qdsp6/audioreach.h |  1 +
>   sound/soc/qcom/qdsp6/q6apm.c      | 28 +++++++++++++++++++++++++++-
>   sound/soc/qcom/qdsp6/q6apm.h      |  8 ++++++++
>   sound/soc/qcom/qdsp6/topology.c   | 12 ++++++++++++
>   5 files changed, 49 insertions(+), 2 deletions(-)
Please use the existing q6dma_set_channel_map() and set the channel map 
for the backend dai from machine driver, this should work.

setting channels on FE is not a scalable one.

Please take a look at some of the patches that I shared privately.

--srini
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index c655f0213723..8175678d8843 100644
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
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 2c82917b7162..cef9a9015dcc 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -767,6 +767,7 @@ struct audioreach_module_config {
>   /* Packet Allocation routines */
>   void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
>   				    token);
> +void audioreach_set_channel_mapping(u8 *ch_map, int num_channels);
>   void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
>   			       uint32_t token, uint32_t src_port,
>   			       uint32_t dest_port);
> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 2a2a5bd98110..c29a2dd36992 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -13,6 +13,7 @@
>   #include <linux/soc/qcom/apr.h>
>   #include <linux/wait.h>
>   #include <sound/soc.h>
> +#include <sound/soc-dai.h>
>   #include <sound/soc-dapm.h>
>   #include <sound/pcm.h>
>   #include "audioreach.h"
> @@ -29,6 +30,29 @@ struct apm_graph_mgmt_cmd {
>   
>   static struct q6apm *g_apm;
>   
> +static int q6apm_dai_set_channel_map(struct snd_soc_dai *dai,
> +				     unsigned int tx_num,
> +				     const unsigned int *tx_ch_mask,
> +				     unsigned int rx_num,
> +				     const unsigned int *rx_ch_mask)
> +{
> +	struct q6apm *apm = dev_get_drvdata(dai->dev);
> +	int i;
> +
> +	if (dai->id >= ARRAY_SIZE(apm->dai_config))
> +		return -EINVAL;
> +
> +	apm->dai_config[dai->id].num_channels = rx_num;
> +	for (i = 0; i < rx_num; i++)
> +		apm->dai_config[dai->id].channel_map[i] = rx_ch_mask[i];
> +
> +	return 0;
> +}
> +
> +const struct snd_soc_dai_ops q6apm_dai_ops = {
> +	.set_channel_map	= q6apm_dai_set_channel_map,
> +};
> +
>   int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
>   {
>   	gpr_device_t *gdev = apm->gdev;
> @@ -722,7 +746,7 @@ static int apm_probe(gpr_device_t *gdev)
>   {
>   	struct device *dev = &gdev->dev;
>   	struct q6apm *apm;
> -	int ret;
> +	int ret, i;
>   
>   	apm = devm_kzalloc(dev, sizeof(*apm), GFP_KERNEL);
>   	if (!apm)
> @@ -733,6 +757,8 @@ static int apm_probe(gpr_device_t *gdev)
>   	mutex_init(&apm->lock);
>   	apm->dev = dev;
>   	apm->gdev = gdev;
> +	for (i = 0; i < ARRAY_SIZE(apm->dai_config); i++)
> +		audioreach_set_channel_mapping(apm->dai_config[i].channel_map, 4);
>   	init_waitqueue_head(&apm->wait);
>   
>   	INIT_LIST_HEAD(&apm->widget_list);
> diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
> index c248c8d2b1ab..0e2e7b6cd6c1 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.h
> +++ b/sound/soc/qcom/qdsp6/q6apm.h
> @@ -47,6 +47,11 @@
>   #define APM_LAST_BUFFER_FLAG			BIT(30)
>   #define NO_TIMESTAMP				0xFF00
>   
> +struct q6apm_dai_config {
> +	unsigned int num_channels;
> +	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
> +};
> +
>   struct q6apm {
>   	struct device *dev;
>   	gpr_port_t *port;
> @@ -65,6 +70,7 @@ struct q6apm {
>   	struct idr sub_graphs_idr;
>   	struct idr containers_idr;
>   	struct idr modules_idr;
> +	struct q6apm_dai_config dai_config[4];
>   };
>   
>   struct audio_buffer {
> @@ -108,6 +114,8 @@ struct q6apm_graph {
>   	struct audioreach_graph_info *info;
>   };
>   
> +extern const struct snd_soc_dai_ops q6apm_dai_ops;
> +
>   /* Graph Operations */
>   struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
>   				     void *priv, int graph_id);
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 70572c83e101..9708d200568d 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1034,6 +1034,17 @@ static int audioreach_tplg_complete(struct snd_soc_component *component)
>   	return 0;
>   }
>   
> +static int audioreach_dai_load(struct snd_soc_component *cmp, int index,
> +			       struct snd_soc_dai_driver *dai_drv,
> +			       struct snd_soc_tplg_pcm *pcm,
> +			       struct snd_soc_dai *dai)
> +{
> +	if (pcm)
> +		dai_drv->ops = &q6apm_dai_ops;
> +
> +	return 0;
> +}
> +
>   /* DAI link - used for any driver specific init */
>   static int audioreach_link_load(struct snd_soc_component *component, int index,
>   				struct snd_soc_dai_link *link,
> @@ -1251,6 +1262,7 @@ static struct snd_soc_tplg_ops audioreach_tplg_ops  = {
>   	.widget_unload = audioreach_widget_unload,
>   
>   	.complete = audioreach_tplg_complete,
> +	.dai_load = audioreach_dai_load,
>   	.link_load = audioreach_link_load,
>   
>   	.dapm_route_load	= audioreach_route_load,
> 
