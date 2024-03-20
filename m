Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DF880C80
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 08:58:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 720732BB7;
	Wed, 20 Mar 2024 08:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 720732BB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710921511;
	bh=AFmSzOYZfXnDCu5xcoFkJMz/TyvfgVRPOL+fpmnDAbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uc+4m+vyXObh61rOYnqhyQ5IJgCL1OZHVp9/ERyYMZvWEZoItwOnxKFd6J55uNNna
	 qRfrGXWaR69AN9K/snZQNI4eBYM9Mz+LAYaH/Shedr3PGN3tHqjyd4G1bWKYLI2Gjx
	 YtDZAOy8TmCRiZYkKBj83EalJbMo9P7Doeaj8VX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE10DF80564; Wed, 20 Mar 2024 08:57:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E08B9F80579;
	Wed, 20 Mar 2024 08:57:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C9A1F804E7; Wed, 20 Mar 2024 08:57:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5B34F8025F
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 08:57:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5B34F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dgTt7cIn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710921426; x=1742457426;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AFmSzOYZfXnDCu5xcoFkJMz/TyvfgVRPOL+fpmnDAbc=;
  b=dgTt7cInrd7OzhMYcwMnFFuNtTiZZwAkLpYAUMyGHWbf2op/kK3DLCqM
   Dt/u5GxYuuTzVO2dzFFNb+HB6YeAXr4j3YqTK6Jc5su0oHO7lJm8p5nJl
   yq8k2valw/Yf3pCC4dhigNmAQeWX119nj2GoYeK+iDDWrTVuMWfi/xSnH
   UaJ0a/oE1NF8S7jyn0MhdpAOvA4BlCNdJzTyj/FZOK0LOXzKCsrqZ1avw
   O8U+4pI5KpLfyzKejUwMu2VanYa1ireDZ2eMWQX1ftP7zkj+k3KkuExz6
   8a7GcWyzh5rOrZJiJX3zffGT5Y7W4UAgvlQOKPEZ0lDkoi+RCXaMtQDRw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5691339"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000";
   d="scan'208";a="5691339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 00:57:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000";
   d="scan'208";a="14080687"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 00:56:59 -0700
Message-ID: <ae2147b3-6225-45f4-9dd7-02ef3bc88904@linux.intel.com>
Date: Wed, 20 Mar 2024 08:56:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: ES8326: Reducing power consumption
To: Zhang Yi <zhangyi@everest-semi.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
Cc: tiwai@suse.com, yangxiaohua@everest-semi.com, zhuning@everest-semi.com
References: <20240320075409.3539-1-zhangyi@everest-semi.com>
 <20240320075409.3539-2-zhangyi@everest-semi.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240320075409.3539-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TU4644Y5GBBIQFM37TX3AUNWLRHMXSG2
X-Message-ID-Hash: TU4644Y5GBBIQFM37TX3AUNWLRHMXSG2
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TU4644Y5GBBIQFM37TX3AUNWLRHMXSG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/20/2024 8:54 AM, Zhang Yi wrote:
> For lower power consumption during hibernation, the configuration of
> es8326_suspend and es8326_remove will be adjusted.
> Adding es8326_i2c_shutdown and es8326_i2c_remove to cover different
> situations
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>   sound/soc/codecs/es8326.c | 34 +++++++++++++++++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
> index 15289dadafea..5c89323035a2 100755
> --- a/sound/soc/codecs/es8326.c
> +++ b/sound/soc/codecs/es8326.c
> @@ -1072,12 +1072,13 @@ static int es8326_suspend(struct snd_soc_component *component)
>   	es8326->calibrated = false;
>   	regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_OFF);
>   	regcache_cache_only(es8326->regmap, true);
> -	regcache_mark_dirty(es8326->regmap);
>   
>   	/* reset register value to default */
>   	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
>   	usleep_range(1000, 3000);
>   	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
> +	
> +	regcache_mark_dirty(es8326->regmap);
>   	return 0;
>   }
>   
> @@ -1163,8 +1164,13 @@ static int es8326_set_jack(struct snd_soc_component *component,
>   
>   static void es8326_remove(struct snd_soc_component *component)
>   {
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +
>   	es8326_disable_jack_detect(component);
>   	es8326_set_bias_level(component, SND_SOC_BIAS_OFF);
> +	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> +	usleep_range(1000, 3000);
> +	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
>   }
>   
>   static const struct snd_soc_component_driver soc_component_dev_es8326 = {
> @@ -1236,6 +1242,30 @@ static int es8326_i2c_probe(struct i2c_client *i2c)
>   					&es8326_dai, 1);
>   }
>   
> +
> +static void es8326_i2c_shutdown(struct i2c_client *i2c)
> +{
> +	struct snd_soc_component *component;
> +	struct es8326_priv *es8326;
> +
> +	dev_dbg(component->dev, "Enter into %s\n", __func__);

Above line works on unset pointer, you need to set component before 
dereferencing it.

> +	es8326 = i2c_get_clientdata(i2c);
> +	component = es8326->component;
> +	cancel_delayed_work_sync(&es8326->jack_detect_work);
> +	cancel_delayed_work_sync(&es8326->button_press_work);
> +
> +	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
> +	usleep_range(1000, 3000);
> +	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
> +
> +	return;
> +}
> +
> +static void es8326_i2c_remove(struct i2c_client *i2c)
> +{
> +	es8326_i2c_shutdown(i2c);
> +}
> +
>   static const struct i2c_device_id es8326_i2c_id[] = {
>   	{"es8326", 0 },
>   	{}
> @@ -1265,6 +1295,8 @@ static struct i2c_driver es8326_i2c_driver = {
>   		.of_match_table = of_match_ptr(es8326_of_match),
>   	},
>   	.probe = es8326_i2c_probe,
> +	.shutdown = es8326_i2c_shutdown,
> +	.remove = es8326_i2c_remove,
>   	.id_table = es8326_i2c_id,
>   };
>   module_i2c_driver(es8326_i2c_driver);

