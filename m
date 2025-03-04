Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7A3A4D6B1
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Mar 2025 09:39:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4337F6030B;
	Tue,  4 Mar 2025 09:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4337F6030B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741077577;
	bh=8mTOMTSTxn7S0QVYCkjT60zT4ZZFC2O1Qh/0+qIkk4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U6ht5VA1Er+uvqMsrkLzUWggb6AYljdgat2/IhCG6H22qJ6AElVJkdHR/F4Imn2z1
	 o1SbP4wumAXijzyDxhoquW5IbvlEpUFvu7REudOfRDlX+n2blZLvaMZ/NPELqMg1Ob
	 0FIe0cKmQtJYaoB1mHE4wznbRnYJHanbMKGcNYwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 036A7F805C5; Tue,  4 Mar 2025 09:39:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E774F805B4;
	Tue,  4 Mar 2025 09:39:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F380BF8051F; Tue,  4 Mar 2025 09:38:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6F7AF80424
	for <alsa-devel@alsa-project.org>; Tue,  4 Mar 2025 09:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F7AF80424
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m/CLmyI7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 80A00A45330;
	Tue,  4 Mar 2025 08:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324C6C4CEE5;
	Tue,  4 Mar 2025 08:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741077526;
	bh=8mTOMTSTxn7S0QVYCkjT60zT4ZZFC2O1Qh/0+qIkk4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/CLmyI7MtH/SYJ+Xgd5vgmrHEhNPYY8qbAfHvMHmwdfMwGqEJU3deiPLzT0Ipskb
	 xqDrk1pY/9pmIZcWMCvRfprxVyvtQmeYyaap/9cPvXVzSx0WyiktKw48+9R61bm7yz
	 95HY/y4v4PvTPdACWXL4kiEu1RO/nNSjiJLDyFA4aXgzGIOxzOMHZfIthQ4O2ilBhS
	 l8JafLkxJLggSuFVzPGtYB9kJoy4gaTnA4Bvu1WLnjSVPfnv6mypmavQMQsJW0LTau
	 JiPz4Kh/Peb9UnDpkQNWuc3jDqs7IZ5WNmMVkiB9fNw62V6w+rdH8fS7d+a7s5/ij0
	 8d+O3DByXVd1Q==
Date: Tue, 4 Mar 2025 09:38:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
	devicetree@vger.kernel.org, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com,
	robh@kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: codecs: add support for ES8389
Message-ID: <20250304-spirited-mamba-of-peace-3c3bef@krzk-bin>
References: <20250304062737.51701-1-zhangyi@everest-semi.com>
 <20250304062737.51701-2-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304062737.51701-2-zhangyi@everest-semi.com>
Message-ID-Hash: UUPASHLBPSPF7GDQYMFP6HMXO5NK4BSH
X-Message-ID-Hash: UUPASHLBPSPF7GDQYMFP6HMXO5NK4BSH
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UUPASHLBPSPF7GDQYMFP6HMXO5NK4BSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 04, 2025 at 02:27:36PM +0800, Zhang Yi wrote:
> +static int es8389_probe(struct snd_soc_component *codec)
> +{
> +	int ret = 0;
> +	struct es8389_private *es8389 = snd_soc_component_get_drvdata(codec);
> +
> +	ret = device_property_read_u8(codec->dev, "everest,mclk-src", &es8389->mclk_src);
> +	if (ret != 0) {
> +		dev_dbg(codec->dev, "mclk-src return %d", ret);
> +		es8389->mclk_src = ES8389_MCLK_SOURCE;
> +	}
> +
> +	ret = device_property_read_u8(codec->dev, "everest,adc-slot", &es8389->adc_slot);
> +	if (ret != 0) {
> +		dev_dbg(codec->dev, "adc-slot return %d", ret);
> +		es8389->adc_slot = 0x00;
> +	}
> +
> +	ret = device_property_read_u8(codec->dev, "everest,dac-slot", &es8389->dac_slot);
> +	if (ret != 0) {
> +		dev_dbg(codec->dev, "dac-slot return %d", ret);
> +		es8389->dac_slot = 0x00;
> +	}
> +
> +	es8389->dmic = device_property_read_bool(codec->dev,
> +			"everest,dmic-enabled");
> +	dev_dbg(codec->dev, "dmic-enabled %x", es8389->dmic);
> +
> +	if (!es8389->adc_slot) {
> +		es8389->mclk = devm_clk_get(codec->dev, "mclk");
> +		if (IS_ERR(es8389->mclk)) {
> +			dev_err(codec->dev, "%s,unable to get mclk\n", __func__);

Syntax is return dev_err_probe. Also, drop __func__.

> +			return PTR_ERR(es8389->mclk);
> +		}

...


> +static struct snd_soc_component_driver soc_codec_dev_es8389 = {
> +	.probe = es8389_probe,
> +	.remove = es8389_remove,
> +	.suspend = es8389_suspend,
> +	.resume = es8389_resume,
> +	.set_bias_level = es8389_set_bias_level,
> +
> +	.controls = es8389_snd_controls,
> +	.num_controls = ARRAY_SIZE(es8389_snd_controls),
> +	.dapm_widgets = es8389_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(es8389_dapm_widgets),
> +	.dapm_routes = es8389_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(es8389_dapm_routes),
> +	.idle_bias_on = 1,
> +	.use_pmdown_time = 1,
> +};
> +
> +static struct regmap_config es8389_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +
> +	.max_register = ES8389_MAX_REGISTER,
> +
> +	.volatile_reg = es8389_volatile_register,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +#ifdef CONFIG_OF
> +static struct of_device_id es8389_if_dt_ids[] = {
> +	{ .compatible = "everest,es8389", },

Bindings are before the user (see DT submitting patches).

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, es8389_if_dt_ids);
> +#endif
> +
> +static void es8389_i2c_shutdown(struct i2c_client *i2c)
> +{
> +	struct snd_soc_component *component;
> +	struct es8389_private *es8389;
> +
> +	es8389 = i2c_get_clientdata(i2c);
> +	component = es8389->component;
> +	dev_dbg(component->dev, "Enter into %s\n", __func__);

Please drop simple probe enter/exit debugs. Tracing is for that in
general.

> +
> +	regmap_write(es8389->regmap, ES8389_MASTER_MODE, 0x28);
> +	regmap_write(es8389->regmap, ES8389_HPSW, 0x00);
> +	regmap_write(es8389->regmap, ES8389_VMID, 0x00);
> +	regmap_write(es8389->regmap, ES8389_RESET, 0x00);
> +	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0xCC);
> +	usleep_range(500000, 550000);//500MS
> +	regmap_write(es8389->regmap, ES8389_CSM_JUMP, 0x00);
> +	regmap_write(es8389->regmap, ES8389_ANA_CTL1, 0x08);
> +	regmap_write(es8389->regmap, ES8389_ISO_CTL, 0xC1);
> +	regmap_write(es8389->regmap, ES8389_PULL_DOWN, 0x00);
> +}
> +
> +static int es8389_i2c_probe(struct i2c_client *i2c_client)
> +{
> +	struct es8389_private *es8389;
> +	int ret = -1;
> +
> +	es8389 = devm_kzalloc(&i2c_client->dev,
> +			sizeof(*es8389), GFP_KERNEL);

You wrapping is odd: unnecessary and not matching coding style.

Run checkpatch.pl --strict

> +	if (es8389 == NULL)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c_client, es8389);
> +	es8389->regmap = devm_regmap_init_i2c(i2c_client, &es8389_regmap);
> +	if (IS_ERR(es8389->regmap))
> +		return dev_err_probe(&i2c_client->dev, PTR_ERR(es8389->regmap),
> +			"regmap_init() failed\n");
> +
> +	ret =  devm_snd_soc_register_component(&i2c_client->dev,
> +			&soc_codec_dev_es8389,
> +			&es8389_dai,
> +			1);
> +	if (ret < 0) {
> +		kfree(es8389);

You have a bug here - double free. You can easily trigger this and see
the result with KASAN.

> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct i2c_device_id es8389_i2c_id[] = {
> +	{"es8389"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, es8389_i2c_id);
> +
> +static struct i2c_driver es8389_i2c_driver = {
> +	.driver = {
> +		.name	= "es8389",
> +		.owner	= THIS_MODULE,

So you sent us an old code, probably based on downstream, duplicating
issues we already fixed in upstream.

That's really suboptimal choice.

First, you have the issues here which we already fixed. Second, you ask
us to review and find the same problems we already pointed out and
fixed.

Instead, please take the newest reviewed driver and use it as base.


> +		.of_match_table = of_match_ptr(es8389_if_dt_ids),
> +	},
> +	.shutdown = es8389_i2c_shutdown,
> +	.probe = es8389_i2c_probe,
> +	.id_table = es8389_i2c_id,
> +};
> +module_i2c_driver(es8389_i2c_driver);
> +
> +MODULE_DESCRIPTION("ASoC es8389 driver");
> +MODULE_AUTHOR("Michael Zhang <zhangyi@everest-semi.com>");
> +MODULE_LICENSE("GPL");
> +
> +

No need for blank lines at the end.


Best regards,
Krzysztof

