Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899F7CF334
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 10:50:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976789F6;
	Thu, 19 Oct 2023 10:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976789F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697705418;
	bh=pJY2RrBl5HLa1epp69dnJbCNH+l6+T/i2vO65sSp5Pw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eu6ZXIwtPWzys2Wq2VSSrgd/EfFF87fBd1EYhtgTX3DbCOlE7c4V9yGMzWednchMt
	 edaFFrESPJzvw0xgFOrHWG0evT7PYTZjKk46Tf8p8jVNh0pdopMdIN1MQQGrjGesyZ
	 qJPoUvnAmcta/cCdSDsH1Kw42L0L4AogNHqcMUX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8809F80552; Thu, 19 Oct 2023 10:48:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62229F80552;
	Thu, 19 Oct 2023 10:48:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10E48F8055B; Thu, 19 Oct 2023 10:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90079F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 10:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90079F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=hbDae1DC
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E2B7B6607323;
	Thu, 19 Oct 2023 09:48:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697705310;
	bh=pJY2RrBl5HLa1epp69dnJbCNH+l6+T/i2vO65sSp5Pw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbDae1DC8huSAsFEOB+wlMw6CdiLB4yv9Sl6q2n3K2P06RiYY7Q8fnqoLfcbv3sB1
	 HYu6m/TjMjHKrD27qeKBwo2yHqAvmcWg69/uOww0GK5VrQ2y5t78giSn6nNOynY6sE
	 soLknpa6UnGsk2nNfvPbtXjWNRwzdDeqmpPS3AS96BtwXcl2PjhgBlc5W1XMHU7g0h
	 FBlUs1RoWEWoM3WPwR3rgX6rKceSkT5148giRe0zkoN8WKKbfWD6DhCs3vC6dCjCIv
	 o68/OAkxUGlj6wVP/m6WMtvp8PBtpSlsZtIiglmwaLAz/8TUrU0G+rQF8VdSLFS3TT
	 a6O7wFnZRZkjA==
Message-ID: <54ec6435-e69b-444a-a31a-c878a4b3564a@collabora.com>
Date: Thu, 19 Oct 2023 10:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650
 support
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, trevor.wu@mediatek.com,
 jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: 
 <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231019021133.23855-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: 
 <20231019021133.23855-3-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 43ABHMQ6R2M2BQE4HX77GZQTB2BX774E
X-Message-ID-Hash: 43ABHMQ6R2M2BQE4HX77GZQTB2BX774E
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43ABHMQ6R2M2BQE4HX77GZQTB2BX774E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 19/10/23 04:11, xiazhengqiao ha scritto:
> To use RT5650 as the codec and the amp, add a new
> sound card named mt8186_rt5650.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> ---
>   sound/soc/mediatek/Kconfig                    |  1 +
>   .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 45 ++++++++++++++++++-
>   2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 43c8fea00439..b93d455744ab 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -210,6 +210,7 @@ config SND_SOC_MT8186_MT6366_RT1019_RT5682S
>   	select SND_SOC_MAX98357A
>   	select SND_SOC_RT1015P
>   	select SND_SOC_RT5682S
> +	select SND_SOC_RT5645
>   	select SND_SOC_BT_SCO
>   	select SND_SOC_DMIC
>   	select SND_SOC_HDMI_CODEC
> diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> index 4684bfd89ecd..8c534c338f0e 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> @@ -170,6 +170,7 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
>   	struct snd_soc_component *cmpnt_codec =
>   		snd_soc_rtd_to_codec(rtd, 0)->component;
>   	int ret;
> +	int type;
>   
>   	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
>   	if (ret) {
> @@ -193,7 +194,8 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
>   	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
>   	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
>   
> -	return snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
> +	type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3;
> +	return snd_soc_component_set_jack(cmpnt_codec, jack, (void *)&type);
>   }
>   
>   static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
> @@ -1058,6 +1060,28 @@ mt8186_mt6366_rt1019_rt5682s_routes[] = {
>   	{"DSP_DL2_VIRT", NULL, SOF_DMA_DL2},
>   };
>   
> +static const struct snd_soc_dapm_route
> +mt8186_mt6366_rt5650_routes[] = {

This fits in one line, please fix.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

