Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B5CAC1DC
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 07:08:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 421F4601F1;
	Mon,  8 Dec 2025 07:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 421F4601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765174104;
	bh=BBHCM7UdnMGlXe5fMxZRh+NVNz0ZoKGyMBiui7+zKYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xg+aFZBY2D8sI3goLsU/VRr7kl9EYagcc23Hr/2f+t4ouUtEfeyd/ttsoqxZTazed
	 cZzg93MVg7K/HoyNh5jh1q9hd99tCH8Y1Ixb4bRW/P2dKaGXSb/bVr3xDQExR39+F2
	 L+o5jaPohNzJ3+hxqCdRnBBsnOW3aRp1XW+nG2tM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18165F805D3; Mon,  8 Dec 2025 07:07:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97AE1F80525;
	Mon,  8 Dec 2025 07:07:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F9DF800ED; Mon,  8 Dec 2025 07:05:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FFC7F800ED
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 07:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FFC7F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QNf+2RTM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ED4D6600AC;
	Mon,  8 Dec 2025 06:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96438C4CEF1;
	Mon,  8 Dec 2025 06:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765173929;
	bh=BBHCM7UdnMGlXe5fMxZRh+NVNz0ZoKGyMBiui7+zKYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QNf+2RTMhdW+KuaJOmwBqKMO/o/xVRdIr7O1GTLfj/2bTIl2s/E+tiJ4oT7OOVan0
	 pbSXnQ6n1jCZC/AZ9gk49LAt6Vhfbro8FN/u3S/rHpM7GgZp20timg/qZluBOOr5H0
	 UH22s8PNHMzSx6N4vvdjktqOlfB3DcW6Prr7zKc5qltCc5crXO7+elioXRs0pZHFPT
	 HiwaX/gaMEf4+8NYTVQpjkeLcqPuTf5OsoknrMS+eVFZ2WGyWH8s2HIIKx1XOYZ0PQ
	 rFwkb95Frft0HpqTwLMrGCnzPMgkn53wGT/Gi2EIfBfkC6hrzHfGelPtL9boTE8tRk
	 FvioKkJOMOg8A==
Message-ID: <6c0639e2-dc59-4e0f-be42-224a98b37f75@kernel.org>
Date: Mon, 8 Dec 2025 07:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
To: Oder Chiou <oder_chiou@realtek.com>, cezary.rojewski@intel.com,
 broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: perex@perex.cz, linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, flove@realtek.com, shumingf@realtek.com,
 jack.yu@realtek.com, derek.fang@realtek.com
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251201105926.1714341-2-oder_chiou@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PC6R5757RZUT3DLIOMJZURWVWKDYQTD6
X-Message-ID-Hash: PC6R5757RZUT3DLIOMJZURWVWKDYQTD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PC6R5757RZUT3DLIOMJZURWVWKDYQTD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/12/2025 11:59, Oder Chiou wrote:
> +
> +static int rt5575_i2c_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct i2c_client *client = context;
> +	struct rt5575_priv *rt5575 = i2c_get_clientdata(client);
> +
> +	regmap_read(rt5575->dsp_regmap, reg | RT5575_DSP_MAPPING, val);
> +
> +	return 0;
> +}
> +
> +static int rt5575_i2c_write(void *context, unsigned int reg, unsigned int val)
> +{
> +	struct i2c_client *client = context;
> +	struct rt5575_priv *rt5575 = i2c_get_clientdata(client);
> +
> +	regmap_write(rt5575->dsp_regmap, reg | RT5575_DSP_MAPPING, val);
> +
> +	return 0;
> +}
> +
> +static const struct regmap_config rt5575_regmap = {
> +	.reg_bits = 16,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0xfffc,
> +	.readable_reg = rt5575_readable_register,
> +	.reg_read = rt5575_i2c_read,
> +	.reg_write = rt5575_i2c_write,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};

OF device ID table goes around here - together with I2C.
> +
> +static const struct i2c_device_id rt5575_i2c_id[] = {
> +	{ "rt5575" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, rt5575_i2c_id);
> +
> +static int rt5575_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct rt5575_priv *rt5575;
> +	struct device *dev = &i2c->dev;
> +	int ret, val;
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)

No ifdefs in driver code.

> +	if (!rt5575_spi && of_device_is_compatible(dev->of_node, rt5575_of_match[1].compatible))

No, use driver match data if ever, but this is just wrong. You said it
depends on SPI flash, not SPI interface.

> +		return -EPROBE_DEFER;
> +#endif
> +
> +	rt5575 = devm_kzalloc(dev, sizeof(struct rt5575_priv),
> +				GFP_KERNEL);
> +	if (rt5575 == NULL)

This is not Linux coding style. Open existing drivers. It's everywhere
written (!foo)

> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, rt5575);
> +
> +	rt5575->i2c = i2c;
> +
> +	rt5575->dsp_regmap = devm_regmap_init_i2c(i2c, &rt5575_dsp_regmap);
> +	if (IS_ERR(rt5575->dsp_regmap)) {
> +		ret = PTR_ERR(rt5575->dsp_regmap);
> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);
> +		return ret;
> +	}
> +
> +	rt5575->regmap = devm_regmap_init(dev, NULL, i2c, &rt5575_regmap);
> +	if (IS_ERR(rt5575->regmap)) {
> +		ret = PTR_ERR(rt5575->regmap);
> +		dev_err(dev, "Failed to allocate register map: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap_read(rt5575->regmap, RT5575_ID, &val);
> +	if (val != RT5575_DEVICE_ID) {
> +		dev_err(dev, "Device with ID register %08x is not rt5575\n", val);
> +		return -ENODEV;
> +	}
> +
> +	regmap_read(rt5575->regmap, RT5575_ID_1, &val);
> +	if (!val) {
> +		dev_err(dev, "This is not formal version\n");
> +		return -ENODEV;
> +	}
> +
> +	return devm_snd_soc_register_component(dev, &rt5575_soc_component_dev, rt5575_dai,
> +		ARRAY_SIZE(rt5575_dai));
> +}
> +
> +static struct i2c_driver rt5575_i2c_driver = {
> +	.driver = {
> +		.name = "rt5575",
> +		.owner = THIS_MODULE,

Please drop it.

Please run standard kernel tools for static analysis, like coccinelle,
smatch and sparse, and fix reported warnings. Also please check for
warnings when building with W=1 for gcc and clang. Most of these
commands (checks or W=1 build) can build specific targets, like some
directory, to narrow the scope to only your code. The code here looks
like it needs a fix. Feel free to get in touch if the warning is not clear.

> +		.of_match_table = of_match_ptr(rt5575_of_match),

You have warning here. Drop of_match_ptr.

> +	},
> +	.probe = rt5575_i2c_probe,
> +	.id_table = rt5575_i2c_id,
> +};
> +module_i2c_driver(rt5575_i2c_driver)
Best regards,
Krzysztof
