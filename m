Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5433E68E5FE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 03:18:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548B67F8;
	Wed,  8 Feb 2023 03:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548B67F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675822725;
	bh=o9nDh5D9lbB1P18GCHf28jRr1Vr/tryJ53hmiMh/dEo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lbs9q2mO5Wc2sWgdQwEQm9GUxXM+gHanFhNbfd79mICQfeELTNCwAZ2dh4Zos/1Qs
	 bKq0fMye+SqzSgQSaqPjke4bpV3EQB4Vy/Q7D1RgZTRpQnnIYlVZtaUe9UWhEaZQeI
	 YXqoTAQFCfiT+2/GmfP9t+AFLABlVWoT+NQffx88=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACCB9F8010B;
	Wed,  8 Feb 2023 03:17:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93AECF8012B; Wed,  8 Feb 2023 03:17:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.2 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr
 [80.12.242.21])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C30F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 03:17:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C30F800E2
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id PVLUp8FlEPPaiPVLUpiiRq; Tue, 07 Feb 2023 22:17:46 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 07 Feb 2023 22:17:46 +0100
X-ME-IP: 86.243.2.178
Message-ID: <fd3ccda3-f964-6904-6056-f93c43b85a0f@wanadoo.fr>
Date: Tue, 7 Feb 2023 22:17:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] ASoC: codecs: Add support for the Infineon PEB2466
 codec
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20230206144904.91078-1-herve.codina@bootlin.com>
 <20230206144904.91078-3-herve.codina@bootlin.com>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230206144904.91078-3-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22SHHAMR7SBJOEI6N54ZEJW3FUCNHYA3
X-Message-ID-Hash: 22SHHAMR7SBJOEI6N54ZEJW3FUCNHYA3
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22SHHAMR7SBJOEI6N54ZEJW3FUCNHYA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 06/02/2023 à 15:49, Herve Codina a écrit :
> The Infineon PEB2466 codec is a programmable DSP-based four channels
> codec with filters capabilities.
> It also provides signals as GPIOs.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>   sound/soc/codecs/Kconfig   |   12 +
>   sound/soc/codecs/Makefile  |    2 +
>   sound/soc/codecs/peb2466.c | 2071 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 2085 insertions(+)
>   create mode 100644 sound/soc/codecs/peb2466.c
> 

[...]

> +static int peb2466_spi_probe(struct spi_device *spi)
> +{
> +	struct peb2466 *peb2466;
> +	unsigned long mclk_rate;
> +	int ret;
> +	u8 xr5;
> +
> +	spi->bits_per_word = 8;
> +	ret = spi_setup(spi);
> +	if (ret < 0)
> +		return ret;
> +
> +	peb2466 = devm_kzalloc(&spi->dev, sizeof(*peb2466), GFP_KERNEL);
> +	if (!peb2466)
> +		return -ENOMEM;
> +
> +	peb2466->spi = spi;
> +
> +	peb2466->regmap = devm_regmap_init(&peb2466->spi->dev, NULL, peb2466,
> +					   &peb2466_regmap_config);
> +	if (IS_ERR(peb2466->regmap))
> +		return PTR_ERR(peb2466->regmap);
> +
> +	peb2466->reset_gpio = devm_gpiod_get_optional(&peb2466->spi->dev,
> +						      "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(peb2466->reset_gpio))
> +		return PTR_ERR(peb2466->reset_gpio);
> +
> +	peb2466->mclk = devm_clk_get(&peb2466->spi->dev, "mclk");

Hi,

Up to you to decide if it is a good idea or not, but using 
devm_clk_get_enabled() would save the 'mclk' field in peb2466 ...

> +	if (IS_ERR(peb2466->mclk))
> +		return PTR_ERR(peb2466->mclk);
> +	ret = clk_prepare_enable(peb2466->mclk);
> +	if (ret)
> +		return ret;

... these 3 lines ...

> +
> +	if (peb2466->reset_gpio) {
> +		gpiod_set_value_cansleep(peb2466->reset_gpio, 1);
> +		udelay(4);
> +		gpiod_set_value_cansleep(peb2466->reset_gpio, 0);
> +		udelay(4);
> +	}
> +
> +	spi_set_drvdata(spi, peb2466);

... this spi_set_drvdata() call ...

> +
> +	mclk_rate = clk_get_rate(peb2466->mclk);
> +	switch (mclk_rate) {
> +	case 1536000:
> +		xr5 = PEB2466_XR5_MCLK_1536;
> +		break;
> +	case 2048000:
> +		xr5 = PEB2466_XR5_MCLK_2048;
> +		break;
> +	case 4096000:
> +		xr5 = PEB2466_XR5_MCLK_4096;
> +		break;
> +	case 8192000:
> +		xr5 = PEB2466_XR5_MCLK_8192;
> +		break;
> +	default:
> +		dev_err(&peb2466->spi->dev, "Unsupported clock rate %lu\n",
> +			mclk_rate);
> +		ret = -EINVAL;
> +		goto failed;
> +	}
> +	ret = regmap_write(peb2466->regmap, PEB2466_XR5, xr5);
> +	if (ret) {
> +		dev_err(&peb2466->spi->dev, "Setting MCLK failed (%d)\n", ret);
> +		goto failed;
> +	}
> +
> +	ret = devm_snd_soc_register_component(&spi->dev, &peb2466_component_driver,
> +					      &peb2466_dai_driver, 1);
> +	if (ret)
> +		goto failed;
> +
> +	if (IS_ENABLED(CONFIG_GPIOLIB)) {
> +		ret = peb2466_gpio_init(peb2466);
> +		if (ret)
> +			goto failed;
> +	}
> +
> +	return 0;
> +
> +failed:
> +	clk_disable_unprepare(peb2466->mclk);
> +	return ret;

... this error handling path ...

> +}
> +
> +static void peb2466_spi_remove(struct spi_device *spi)
> +{
> +	struct peb2466 *peb2466 = spi_get_drvdata(spi);
> +
> +	clk_disable_unprepare(peb2466->mclk);
> +}

... and the remove function.

CJ


> +
> +static const struct of_device_id peb2466_of_match[] = {
> +	{ .compatible = "infineon,peb2466", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, peb2466_of_match);
> +
> +static const struct spi_device_id peb2466_id_table[] = {
> +	{ "peb2466", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(spi, peb2466_id_table);
> +
> +static struct spi_driver peb2466_spi_driver = {
> +	.driver  = {
> +		.name   = "peb2466",
> +		.of_match_table = peb2466_of_match,
> +	},
> +	.id_table = peb2466_id_table,
> +	.probe  = peb2466_spi_probe,
> +	.remove = peb2466_spi_remove,
> +};
> +
> +module_spi_driver(peb2466_spi_driver);
> +
> +MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
> +MODULE_DESCRIPTION("PEB2466 ALSA SoC driver");
> +MODULE_LICENSE("GPL");

