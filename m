Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FD26DA97
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:44:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1942F1660;
	Thu, 17 Sep 2020 13:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1942F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600343040;
	bh=GFCLYzI5wQIodY+j5noqTYjrCJJpIDwkuXOoofirdKk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XW8puqLhc5tQpSnLocM9jW77ywG7hNa8wSvGqesFY6LpCetqDkaJxHQ9ZXNr5Zxi5
	 TboEqJQfTrBLy2vEKmTp8WJANNjg5lnVgE1ijaCXUi7KMqRCkZC0TeqEiWhv1+VNwP
	 5Xrg9EvfHNTO+5BcFiBkMdZJcyc/2s454ZgcqsOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 420E3F801EC;
	Thu, 17 Sep 2020 13:42:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B21D6F80212; Thu, 17 Sep 2020 13:42:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E89F8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 13:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E89F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rSKLKEfX"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HBg4ce055141;
 Thu, 17 Sep 2020 06:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600342924;
 bh=y520wGsDhS1XSzX21A9XTTvZro3KlWBo64bgJuekHQI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=rSKLKEfXAZUPflKQYLcfuY+C68HX5iwdon/nbOZ7ev1xWm0v0wDE/YYr6/ujfb5rQ
 ccEWaP7l9hY79Ku59Wj86wJPna9MUeGJjR9tHsAaLiLr/8aPx+Wfs/ejcmlK2M346f
 Ip1+T63EKoA8nqBliYQ6WZd8p1of7cBRVkvsFTnc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HBg3pb042538
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 06:42:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 06:42:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 06:42:02 -0500
Received: from [10.250.32.129] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HBg20q127931;
 Thu, 17 Sep 2020 06:42:02 -0500
Subject: Re: [PATCH v3 2/2] ASoC: tlv320adcx140: Add support for configuring
 GPIO pin
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
References: <20200916075949.28479-1-camel.guo@axis.com>
 <20200916075949.28479-2-camel.guo@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b9b0a159-905b-6d18-6b7c-db63c2f61c0d@ti.com>
Date: Thu, 17 Sep 2020 06:42:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916075949.28479-2-camel.guo@axis.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Camel

On 9/16/20 2:59 AM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>
> Add support to configure the GPIO pin to the specific configuration.
> The GPIO pin can be configured as GPO, IRQ, SDOUT2, PDMCLK, MICBASE_EN,
> GPI, MCLK, SDIN, PDMDIN1, PDMDIN2, PDMDIN3 or PDMDIN4 and the output
> drive can be configured with various configuration.
>
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>   v3:
>    - Add ADCX140_NUM_GPIO_CFGS avoiding using magic number
>    - Remove unneeded check on ret in adcx140_configure_gpio
>
>   sound/soc/codecs/tlv320adcx140.c | 40 ++++++++++++++++++++++++++++++++
>   sound/soc/codecs/tlv320adcx140.h |  5 ++++
>   2 files changed, 45 insertions(+)
>
> diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
> index f33ee604ee78..fe6fc6df66cc 100644
> --- a/sound/soc/codecs/tlv320adcx140.c
> +++ b/sound/soc/codecs/tlv320adcx140.c
> @@ -837,6 +837,42 @@ static int adcx140_configure_gpo(struct adcx140_priv *adcx140)
>   
>   }
>   
> +static int adcx140_configure_gpio(struct adcx140_priv *adcx140)
> +{
> +	int gpio_count = 0;
> +	u32 gpio_outputs[ADCX140_NUM_GPIO_CFGS];
> +	u32 gpio_output_val = 0;
> +	int ret;
> +
> +	gpio_count = device_property_count_u32(adcx140->dev,
> +			"ti,gpio-config");
> +	if (gpio_count == 0)
> +		return 0;
> +
> +	if (gpio_count != ADCX140_NUM_GPIO_CFGS)
> +		return -EINVAL;
> +
> +	ret = device_property_read_u32_array(adcx140->dev, "ti,gpio-config",
> +			gpio_outputs, gpio_count);
> +	if (ret)
> +		return ret;
> +
> +	if (gpio_outputs[0] > ADCX140_GPIO_CFG_MAX) {
> +		dev_err(adcx140->dev, "GPIO config out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	if (gpio_outputs[1] > ADCX140_GPIO_DRV_MAX) {
> +		dev_err(adcx140->dev, "GPIO drive out of range\n");
> +		return -EINVAL;
> +	}
> +
> +	gpio_output_val = gpio_outputs[0] << ADCX140_GPIO_SHIFT
> +		| gpio_outputs[1];
> +
> +	return regmap_write(adcx140->regmap, ADCX140_GPIO_CFG0, gpio_output_val);
> +}
> +
>   static int adcx140_codec_probe(struct snd_soc_component *component)
>   {
>   	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
> @@ -934,6 +970,10 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
>   			return ret;
>   	}
>   
> +	ret = adcx140_configure_gpio(adcx140);
> +	if (ret)
> +		return ret;
> +
>   	ret = adcx140_configure_gpo(adcx140);
>   	if (ret)
>   		goto out;
> diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
> index eedbc1d7221f..9d04dec374d1 100644
> --- a/sound/soc/codecs/tlv320adcx140.h
> +++ b/sound/soc/codecs/tlv320adcx140.h
> @@ -145,4 +145,9 @@
>   #define ADCX140_GPO_CFG_MAX		4
>   #define ADCX140_GPO_DRV_MAX		5
>   
> +#define ADCX140_NUM_GPIO_CFGS		2
> +#define ADCX140_GPIO_SHIFT		4
> +#define ADCX140_GPIO_CFG_MAX		15
> +#define ADCX140_GPIO_DRV_MAX		5
> +
>   #endif /* _TLV320ADCX140_ */
Acked-by: Dan Murphy <dmurphy@ti.com>
