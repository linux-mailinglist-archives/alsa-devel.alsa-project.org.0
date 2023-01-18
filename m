Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6E671E20
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 14:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE334265B;
	Wed, 18 Jan 2023 14:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE334265B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674049215;
	bh=9XYJBHKq4LlgEmfq3ocSfg4oZS+yzpsSfaET3bbVq4w=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yz8Sclt9a9TRvvW1RqxdFHP0ljYaGhdWCoqXAHYq6D2liit8IDCwBXBzeyVenBtQj
	 IkCUt9o8Jo3fQqKZphL5fE3S5IEuMrgFzNseTUVRAWgprWCnODTYYNXKZoZs9l5+At
	 8ytP8oYuqF3KdsWYYMmCAKc0jXrHSrUT6/QOXHH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FEAEF8055A;
	Wed, 18 Jan 2023 14:39:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7EC7F80551; Wed, 18 Jan 2023 14:39:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B6DFF80551
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B6DFF80551
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M5BWe4/G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674049152; x=1705585152;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9XYJBHKq4LlgEmfq3ocSfg4oZS+yzpsSfaET3bbVq4w=;
 b=M5BWe4/Gc6rAC0S2t3z/Xx5bLL66uYDykDLOv/A4Eal9p+aJT+opYDlH
 csOazW763mnc3UYubhYQ3OPvaHXzCnw5hwgwe6dZOJeWCEtEYyzJJWVbE
 SjVA6RZ66x227Ud2weZ1afH40BlCT17n7IDTRVXt2vrUJCY6+NrfSfX4g
 OL9lEVuYFnSpHKjHcWspyeeFzxEsqKwNUuHW6HiQYxR2VUnzGNNADPXVO
 K8xzBXYbZ1vGK1oCxAPctRVdbDy3RBBbyi8SBENIOJ+g0ZHdMXcgrN+Nn
 EdmJYDKvcjOUlhWw0TReRNhV2hyrA4/ALXapoTRKkSymNt3qNPIfn9kLB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312861373"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="312861373"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:39:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="652941817"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="652941817"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 05:39:06 -0800
Message-ID: <e08f5a83-5a7e-9095-92f2-d78601c7a0bd@linux.intel.com>
Date: Wed, 18 Jan 2023 14:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 2/4] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230118125226.333214-1-astrid.rost@axis.com>
 <20230118125226.333214-3-astrid.rost@axis.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230118125226.333214-3-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/18/2023 1:52 PM, Astrid Rost wrote:
> Add a generic way to create jack inputs for auxiliary jack detection
> drivers (e.g. via i2c, spi), which are not part of any real codec.
> The simple-card can be used as combining card driver to add the jacks,
> no new one is required.
> 
> Create a jack (for input-events) for jack devices in the auxiliary
> device list (aux_devs). A device which has the functions set_jack and
> get_jack_supported_type counts as jack device.
> 
> Add a devicetree entry, in case not all input types are required.
>   simple-card,aux-jack-types:
> Array of snd_jack_type to create jack-input-event for jack devices in
> aux-devs. If the setting is 0, the supported type of the device is used.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>   include/sound/simple_card_utils.h     |  3 ++
>   sound/soc/generic/simple-card-utils.c | 63 +++++++++++++++++++++++++++
>   sound/soc/generic/simple-card.c       |  4 ++
>   3 files changed, 70 insertions(+)
> 
> diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
> index 38590f1ae9ee..a3f3f3aa9e6e 100644
> --- a/include/sound/simple_card_utils.h
> +++ b/include/sound/simple_card_utils.h
> @@ -69,6 +69,7 @@ struct asoc_simple_priv {
>   	} *dai_props;
>   	struct asoc_simple_jack hp_jack;
>   	struct asoc_simple_jack mic_jack;
> +	struct snd_soc_jack *aux_jacks;
>   	struct snd_soc_dai_link *dai_link;
>   	struct asoc_simple_dai *dais;
>   	struct snd_soc_dai_link_component *dlcs;
> @@ -187,6 +188,8 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
>   int asoc_simple_init_jack(struct snd_soc_card *card,
>   			       struct asoc_simple_jack *sjack,
>   			       int is_hp, char *prefix, char *pin);
> +int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv,
> +				char *prefix);
>   int asoc_simple_init_priv(struct asoc_simple_priv *priv,
>   			       struct link_info *li);
>   int asoc_simple_remove(struct platform_device *pdev);
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index e35becce9635..668123549fbf 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -786,6 +786,69 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
>   }
>   EXPORT_SYMBOL_GPL(asoc_simple_init_jack);
>   
> +int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
> +{
> +	struct snd_soc_card *card = simple_priv_to_card(priv);
> +	struct device *dev = card->dev;
> +	struct snd_soc_component *component;
> +	char prop[128];
> +	int found_jack_index = 0;
> +	int num = 0;
> +	int ret;
> +
> +	if (priv->aux_jacks)
> +		return 0;
> +
> +	snprintf(prop, sizeof(prop), "%saux-jack-types", prefix);
> +	num = of_property_count_u32_elems(dev->of_node, prop);
> +	if (num < 1)
> +		return 0;
> +
> +	priv->aux_jacks = devm_kcalloc(card->dev, num,
> +				       sizeof(struct snd_soc_jack), GFP_KERNEL);
> +	if (!priv->aux_jacks)
> +		return -ENOMEM;
> +
> +	for_each_card_auxs(card, component) {
> +		if (found_jack_index >= num)
> +			break;
> +
> +		if (component->driver->set_jack &&
> +		    component->driver->get_jack_supported_type) {

This check is really weird, you are checking if callbacks exist at all, 
which should be unnecessary as it duplicates the work oh 
snd_soc_component_ functions. I would just try to call 
snd_soc_component_get_jack_supported_type() directly and if it returns 
-ENOTSUPP, just go to next iteration.
I guess your main problem is snd_soc_component_set_jack(), but you can 
just call it with NULL jack to check if it returns -ENOTSUPP, but I 
guess the overall asumption would be that if someone implements 
.get_jack_supported_type, they also implemented .set_jack, so maybe it 
is just unnecessary?

> +			char id[128];
> +			int type = 0;
> +			struct snd_soc_jack *jack =
> +				&(priv->aux_jacks[found_jack_index]);
> +			int type_supp_mask =
> +				snd_soc_component_get_jack_supported_type(
> +					component);
> +
> +			ret = of_property_read_u32_index(
> +				dev->of_node, prop, found_jack_index++, &type);
> +			if (ret)
> +				continue;
> +
> +			if (type)
> +				type &= type_supp_mask; /* use only supported types */
> +			else
> +				type = type_supp_mask; /* use all supported types */
> +
> +			if (!type)
> +				continue;
> +
> +			/* create jack */
> +			snprintf(id, sizeof(id), "%s-jack", component->name);
> +			ret = snd_soc_card_jack_new(card, id, type, jack);
> +			if (ret)
> +				continue;
> +
> +			(void)snd_soc_component_set_jack(component, jack, NULL);
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asoc_simple_init_aux_jacks);
> +
>   int asoc_simple_init_priv(struct asoc_simple_priv *priv,
>   			  struct link_info *li)
>   {
> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index feb55b66239b..e98932c16754 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
> @@ -623,6 +623,10 @@ static int simple_soc_probe(struct snd_soc_card *card)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = asoc_simple_init_aux_jacks(priv, PREFIX);
> +	if (ret < 0)
> +		return ret;
> +
>   	return 0;
>   }
>   

