Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8308F70671F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A51F41F6;
	Wed, 17 May 2023 13:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A51F41F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684324166;
	bh=pdURUQBQCGZwUYqLO8wHO9znW+z0Fce579FBz8y/290=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bK3LaR6haJVxYN8nhpZsZKdfbDNA9K+FaRajMP/aIGQiunZIdfiLKd8xHsWS6tQWQ
	 X7OkYja9Ox5V4pYW4Hi0fkMCguAhnk1sSLND/T9Gpcd+vEgp9d5ZrJTRakMctQE8l6
	 joOTFpIq66PzU0AtQ/mKKrqiqF5EgLPQgFUw4dRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B0B5F8016D; Wed, 17 May 2023 13:48:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95B14F8025A;
	Wed, 17 May 2023 13:48:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84DEFF80272; Wed, 17 May 2023 13:48:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B91CF8024E
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B91CF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=n5EEQbPv
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 36796660574E;
	Wed, 17 May 2023 12:48:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684324083;
	bh=pdURUQBQCGZwUYqLO8wHO9znW+z0Fce579FBz8y/290=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n5EEQbPvjfAzCHlxP0Yv0FWn8la8yKekCCiB7eUFzyS5QfzfhMeV8qiQsdFMJ9ORU
	 R94ccrA5DvKOsA5U1vkVnwc62L7Rjy2TkRKo8KKqiGqNNe/XeV19/VBM8oPhqk/EZJ
	 6FdOSm8P4sQbofdXZ+NFIpnHlWJehch51ubTROSluORGI8pOIWI8SGgm+ENd4JnzMo
	 AfzfmNhk5rPs5Tf6tRUvUEC+hMTmND+BTH/G+cAL9iujQ+ap+w+M4EW2xNC7xpoIvT
	 7UWj4ZBGLHJp7Gbke8YgVnRg2TzSK8up/K4rXu0J7DH7lOD04z6zZEWFhVIXjPwrpT
	 6Og2dQOJgMVOA==
Message-ID: <daac5c71-e6d3-04b0-f628-c53a4e12640d@collabora.com>
Date: Wed, 17 May 2023 13:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/5] ASoC: mediatek: common: soundcard driver add dai_fmt
 support
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230517111534.32630-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V2BPX3JD7VMOXGV6ME3INEAVDURLBMOY
X-Message-ID-Hash: V2BPX3JD7VMOXGV6ME3INEAVDURLBMOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2BPX3JD7VMOXGV6ME3INEAVDURLBMOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 17/05/23 13:15, Trevor Wu ha scritto:
> There are two changes included in the patch.
> 
> First, add set_dailink_daifmt() function, so dai_fmt can be updated by
> the configuration in dai-link sub node.
> 
> Second, remove codec phandle from required property in dai-link sub node.
> For example, user possibly needs to update dai-format for all etdm
> co-clock dai-links, but codec doesn't need to be specified in capture
> dai-link for a speaker amp.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   .../mediatek/common/mtk-soundcard-driver.c    | 49 ++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> index 738093451ccb..5e291092046b 100644
> --- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
> +++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
> @@ -22,7 +22,7 @@ static int set_card_codec_info(struct snd_soc_card *card,
>   
>   	codec_node = of_get_child_by_name(sub_node, "codec");
>   	if (!codec_node)
> -		return -EINVAL;
> +		return 0;
>   
>   	/* set card codec info */
>   	ret = snd_soc_of_get_dai_link_codecs(dev, codec_node, dai_link);
> @@ -36,6 +36,47 @@ static int set_card_codec_info(struct snd_soc_card *card,
>   	return 0;
>   }
>   
> +static int set_dailink_daifmt(struct snd_soc_card *card,
> +			      struct device_node *sub_node,
> +			      struct snd_soc_dai_link *dai_link)
> +{
> +	unsigned int daifmt;
> +	const char *str;
> +	int ret;
> +	struct {
> +		char *name;
> +		unsigned int val;
> +	} of_clk_table[] = {
> +		{ "cpu",	SND_SOC_DAIFMT_CBC_CFC },
> +		{ "codec",	SND_SOC_DAIFMT_CBP_CFP },
> +	};
> +

This is an optional property and this function should not do anything if that
property is not found, so....

	/*
	 * Check "mediatek,clk-provider" to select the clock provider
	 * in SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK area, if specified.
	 */
	if (!of_property_read_string(sub_node, "mediatek,clk-provider", &str))
		return 0;

...this allows you to reduce indentation as well.

> +	daifmt = snd_soc_daifmt_parse_format(sub_node, NULL);
> +	if (daifmt) {
> +		dai_link->dai_fmt &= SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
> +		dai_link->dai_fmt |= daifmt;
> +	}
> +
> +	/*
> +	 * check "mediatek,clk-provider = xxx"
> +	 * SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK area
> +	 */
> +	ret = of_property_read_string(sub_node, "mediatek,clk-provider", &str);
> +	if (ret == 0) {
> +		int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(of_clk_table); i++) {
> +			if (strcmp(str, of_clk_table[i].name) == 0) {
> +				dai_link->dai_fmt &= ~SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
> +				dai_link->dai_fmt |= of_clk_table[i].val;
> +				break;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   int parse_dai_link_info(struct snd_soc_card *card)
>   {
>   	struct device *dev = card->dev;
> @@ -67,6 +108,12 @@ int parse_dai_link_info(struct snd_soc_card *card)
>   			of_node_put(sub_node);
>   			return ret;
>   		}
> +
> +		ret = set_dailink_daifmt(card, sub_node, dai_link);
> +		if (ret < 0) {

if (ret) {
  ...
}

> +			of_node_put(sub_node);
> +			return ret;
> +		}

Regards,
Angelo

