Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42872AAA5
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 11:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3166A3E;
	Sat, 10 Jun 2023 11:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3166A3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686389134;
	bh=700AFRkHXIfkQotsIBaBwIWqgAwJSGxArmYLMRC3JGg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NUa8LL0HiVEqln6Ud4Q+AYTENHoiCpx57jmSB5X/zPACeoksDA1EtRng/MVytW3e9
	 I8RtBzYjRod3mVcEsdCNH8NljwWGzMs9TU1zlYDt+dY8ZPrQGlejZ5WlrjwVwPXtPt
	 0btwHAkxr9Ns2LOEIS0Z3P5UK6kQvYEprqbHRws0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC681F80155; Sat, 10 Jun 2023 11:24:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF5AF8016C;
	Sat, 10 Jun 2023 11:24:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F9BF80199; Sat, 10 Jun 2023 11:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10EBDF800ED
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 11:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10EBDF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D4dP8H2U
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-974638ed5c5so545646266b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 10 Jun 2023 02:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686389071; x=1688981071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XojwCKgKhnjiO7z1EOBqqb2iPuWe/crlH+uXgXBXB7A=;
        b=D4dP8H2UTLxaQ6rpMaJJbgbnz794U2JDheN7mjLjVMohYf7LI27mHijVKeHZKvi1m3
         c8FZP05OEPe4/uqoeFGdA6WE4mOna/HT/qi9LMq/LfO1Y/v2QWGkM+4AvUggZdZ8yjlQ
         RgN8iphJ9IU/MZYT+z5meDUICzMrD3Y6/4HjuyJXQtjklemyl/4N1qCN2AoVc2E1Vb2m
         Uyyn78vUsMP9ozBOzaLw+Qc74+NmHzWY9Ugchu94eucmVwaobaojT1Iznwy253sKE0HJ
         Vk2bs6KS39V++1171UK1Sg3WDAJq//dVcn6/8sIio7dRLECWNtPZtftj/Z1hy5oAhOBj
         vQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686389071; x=1688981071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XojwCKgKhnjiO7z1EOBqqb2iPuWe/crlH+uXgXBXB7A=;
        b=PXexKGfDVifPg0Vy2IjJo4Yu5DGv4sT6DWBIOVNeyKi0y1P10058O2UfzKHjSSy3QL
         9LbzRppUEsdKqiYjtoJXxwacZXkuc3u+Kauujdd6n1Uy2G5t8EcddZR27tegNNh1tFmc
         zn1q8igZwrxfGyFWVzUGn+5IO7MP+pHtk2LcwwZKRCTwvgqpNXgjf8jpFKVQY2JsMVHZ
         IyBVxg+Z/KnpCszq0GFv8wTzYJZpvMz4Q+nBI+9xv9Vu2AQkiDkRxDwIANjFX1byMMMS
         ARqwzOcay/yOYzE0IAKNdU+AA+tPcEXUPE/nd0KkSnA/su3VJrcH5NKOQ/7WKw3li88+
         EFtw==
X-Gm-Message-State: AC+VfDx27cop95R6LFhR8XIZ7IYvpt9bCd/1PodEduhBhh67LYWdpc6B
	fJ8K7TecSiGCNUScU0RdT04uBQ==
X-Google-Smtp-Source: 
 ACHHUZ4pBisGDKji6uOa3f0FnU4ZFqCgOV6oMmZC83f3QnL93SbSqlXkXMHN3OZ82e1apqn4uyjMxQ==
X-Received: by 2002:a17:907:7f0b:b0:976:f2e:ad6a with SMTP id
 qf11-20020a1709077f0b00b009760f2ead6amr4462360ejc.28.1686389071126;
        Sat, 10 Jun 2023 02:24:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 fy25-20020a170906b7d900b0096b55be592asm2319503ejb.92.2023.06.10.02.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 02:24:30 -0700 (PDT)
Message-ID: <87d90ade-644c-a45d-ce50-bdeded755b04@linaro.org>
Date: Sat, 10 Jun 2023 11:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V2 2/2] ASoC: max98388: add amplifier driver
Content-Language: en-US
To: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 rf@opensource.cirrus.com, ryans.lee@analog.com, wangweidong.a@awinic.com,
 shumingf@realtek.com, herve.codina@bootlin.com,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com,
 ajye_huang@compal.corp-partner.google.com, kiseok.jo@irondevice.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: venkataprasad.potturu@amd.com, kernel test robot <lkp@intel.com>
References: <20230609234417.1139839-1-ryan.lee.analog@gmail.com>
 <20230609234417.1139839-2-ryan.lee.analog@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609234417.1139839-2-ryan.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T233HO2NLLKWZ6P7PHM622IB7QHPXJQ3
X-Message-ID-Hash: T233HO2NLLKWZ6P7PHM622IB7QHPXJQ3
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T233HO2NLLKWZ6P7PHM622IB7QHPXJQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/06/2023 01:44, “Ryan wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> Added Analog Devices MAX98388 amplifier driver.
> MAX98388 provides a PCM interface for audio data and a standard I2C
> interface for control data communication.
> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>
> Reported-by: kernel test robot <lkp@intel.com>

There is nothing to report here.

> Closes: 
> https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/2023
> 06082054.jIU9oENf-lkp@intel.com/__;!!A3Ni8CS0y2Y!46sHiAsmIiXxZ_QXIobho
> mY8F1f7F2yMYd_65NNFwRlcgut33--RdFjVAbg6jKf7Vs8GaYZ7oA$

Nothing to close and also broken link. Fix your mailer.

> ---
> Changes from v1:
>   Fixed build warnings.
> 
>  sound/soc/codecs/Kconfig    |   10 +
>  sound/soc/codecs/Makefile   |    2 +
>  sound/soc/codecs/max98388.c | 1042 +++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/max98388.h |  234 ++++++++
>  4 files changed, 1288 insertions(+)
>  create mode 100644 sound/soc/codecs/max98388.c
>  create mode 100644 sound/soc/codecs/max98388.h

...

> +
> +static void max98388_read_deveice_property(struct device *dev,
> +					   struct max98388_priv *max98388)
> +{
> +	int value;
> +
> +	if (!device_property_read_u32(dev, "adi,vmon-slot-no", &value))
> +		max98388->v_slot = value & 0xF;
> +	else
> +		max98388->v_slot = 0;
> +
> +	if (!device_property_read_u32(dev, "adi,imon-slot-no", &value))
> +		max98388->i_slot = value & 0xF;
> +	else
> +		max98388->i_slot = 1;
> +
> +	if (device_property_read_bool(dev, "adi,interleave-mode"))
> +		max98388->interleave_mode = true;
> +	else
> +		max98388->interleave_mode = false;
> +
> +	if (dev->of_node) {
> +		max98388->reset_gpio = of_get_named_gpio(dev->of_node,
> +							 "reset-gpio", 0);

Nope, use devm

> +		if (!gpio_is_valid(max98388->reset_gpio)) {
> +			dev_err(dev, "Looking up %s property in node %s failed %d\n",
> +				"reset-gpio", dev->of_node->full_name,
> +				max98388->reset_gpio);
> +		} else {
> +			dev_dbg(dev, "reset-gpio=%d",
> +				max98388->reset_gpio);
> +		}
> +	} else {
> +		/* this makes reset_gpio as invalid */
> +		max98388->reset_gpio = -1;

Why? To request it again? It does not make sense.

> +	}
> +}
> +
> +static int max98388_i2c_probe(struct i2c_client *i2c)
> +{
> +	int ret = 0;
> +	int reg = 0;
> +
> +	struct max98388_priv *max98388 = NULL;
> +
> +	max98388 = devm_kzalloc(&i2c->dev, sizeof(*max98388), GFP_KERNEL);
> +

Drop blank line.

> +	if (!max98388) {
> +		ret = -ENOMEM;

return -ENOMEM;

> +		return ret;
> +	}
> +	i2c_set_clientdata(i2c, max98388);
> +
> +	/* regmap initialization */
> +	max98388->regmap = devm_regmap_init_i2c(i2c, &max98388_regmap);
> +	if (IS_ERR(max98388->regmap)) {
> +		ret = PTR_ERR(max98388->regmap);
> +		dev_err(&i2c->dev,
> +			"Failed to allocate regmap: %d\n", ret);
> +		return ret;

return dev_err_probe

> +	}
> +
> +	/* voltage/current slot & gpio configuration */
> +	max98388_read_deveice_property(&i2c->dev, max98388);
> +
> +	/* Power on device */
> +	if (gpio_is_valid(max98388->reset_gpio)) {

What's this? You request it twice? No.


> +		ret = devm_gpio_request(&i2c->dev, max98388->reset_gpio,
> +					"MAX98388_RESET");
> +		if (ret) {
> +			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
> +				__func__, max98388->reset_gpio);

return dev_err_probe

> +			return -EINVAL;
> +		}
> +		gpio_direction_output(max98388->reset_gpio, 0);
> +		msleep(50);
> +		gpio_direction_output(max98388->reset_gpio, 1);

1 means keep in reset, so why do you keep deviec reset afterwards? Was
it tested? You probably messed up values used for GPIOs as you stated in
example that it is active low.

> +		msleep(20);
> +	}
> +
> +	/* Read Revision ID */
> +	ret = regmap_read(max98388->regmap,
> +			  MAX98388_R22FF_REV_ID, &reg);
> +	if (ret < 0) {
> +		dev_err(&i2c->dev,
> +			"Failed to read: 0x%02X\n", MAX98388_R22FF_REV_ID);
> +		return ret;

return dev_err_probe

> +	}
> +	dev_info(&i2c->dev, "MAX98388 revisionID: 0x%02X\n", reg);
> +
> +	/* codec registration */
> +	ret = devm_snd_soc_register_component(&i2c->dev,
> +					      &soc_codec_dev_max98388,
> +					      max98388_dai,
> +					      ARRAY_SIZE(max98388_dai));
> +	if (ret < 0)
> +		dev_err(&i2c->dev, "Failed to register codec: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static const struct i2c_device_id max98388_i2c_id[] = {
> +	{ "max98388", 0},
> +	{ },
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, max98388_i2c_id);
> +
> +#if defined(CONFIG_OF)

Drop

> +static const struct of_device_id max98388_of_match[] = {
> +	{ .compatible = "adi,max98388", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max98388_of_match);
> +#endif
> +
> +#ifdef CONFIG_ACPI

Drop

> +static const struct acpi_device_id max98388_acpi_match[] = {
> +	{ "ADS8388", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, max98388_acpi_match);
> +#endif
> +
> +static struct i2c_driver max98388_i2c_driver = {
> +	.driver = {
> +		.name = "max98388",
> +		.of_match_table = of_match_ptr(max98388_of_match),
> +		.acpi_match_table = ACPI_PTR(max98388_acpi_match),

Just drop all wrappers. They are useless and only limit your driver (OF
can be used on some ACPI platforms).


Best regards,
Krzysztof

