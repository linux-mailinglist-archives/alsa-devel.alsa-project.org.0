Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CE85A8616
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 20:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E3D61693;
	Wed, 31 Aug 2022 20:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E3D61693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661971986;
	bh=QR2k1RfaicvIGx1cXfaFjrZqwmEtB1JsDQpFdvof5bc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+oZVLiwmGVGdMR0gy+aiwbrQZPnKVFixcEDtLyPmCD6U83775ypR1Gn9XiXjgZU7
	 Rp3muTfqmhgb1OHgfXhXKCyxX7lfpELx25NEPNrp0e2Yctp6xYhjgoYE35rC0fdNzw
	 xtmikqeNTF4rzBRn7/ooa01l1zPPB+DRqZHMkYP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7174BF80448;
	Wed, 31 Aug 2022 20:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 954B3F8042F; Wed, 31 Aug 2022 20:52:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B926AF8012A
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 20:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B926AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Q/Qct81j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=RNaldf3In8WKTXSgD2d1uVP7Sa1eKmzNdCfkgY7eMd4=; b=Q/Qct81j+lZIFYdXyl8L+jLdPx
 fTTsY3DXIBre2dBi+EgaFbHlVVf05QH/g6m5tQIIqc78HWT+Xoum8POCCbeum90qo2xn2CWVZaiiR
 vqzm8PZPU7aKH4Q0puM6I9jLJ00O+IOmQ5YThZ3ohjzZOIwjGrxIp2kGoqB5YhIXqJlEC12YoOMJT
 bd+uADtFYSUF6wvbWek5jwVXg/hG6rL5MUzt8L1J8B/C3Oi+6aDH1JgKV/8ODUnN0OYiBqfw43mg1
 YtJcu9JJ1Q5chTfzD+BT1b2qoOBOid28bKqL4gSHo5mMG7LNn1970rFdGzdwyA+IoFU9Pv+JIBcr7
 SGwmjLbA==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTSoM-007gYD-Qi; Wed, 31 Aug 2022 18:51:38 +0000
Message-ID: <269a80eb-e0c9-182f-9c28-fb12ad54c020@infradead.org>
Date: Wed, 31 Aug 2022 11:51:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] sound: soc/codecs: tlv320adc3xxx: needs GPIOLIB
Content-Language: en-US
To: linux-kernel@vger.kernel.org
References: <20220409052120.3780-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220409052120.3780-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ricard Wanderlof <ricardw@axis.com>, Mark Brown <broonie@kernel.org>
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

ping?

On 4/8/22 22:21, Randy Dunlap wrote:
> Fix build errors when CONFIG_GPIOLIB is not enabled:
> 
> ../sound/soc/codecs/tlv320adc3xxx.c: In function 'adc3xxx_i2c_probe':
> ../sound/soc/codecs/tlv320adc3xxx.c:1352:28: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'devm_gpio_free'? [-Werror=implicit-function-declaration]
>  1352 |         adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> ../sound/soc/codecs/tlv320adc3xxx.c:1352:57: error: 'GPIOD_OUT_LOW' undeclared (first use in this function); did you mean 'GPIOF_INIT_LOW'?
>  1352 |         adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   CC      lib/dynamic_debug.o
> ../sound/soc/codecs/tlv320adc3xxx.c:1400:9: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
>  1400 |         gpiod_set_value_cansleep(adc3xxx->rst_pin, 1);
> 
> Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Ricard Wanderlof <ricardw@axis.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> ---
>  sound/soc/codecs/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -1567,6 +1567,7 @@ config SND_SOC_TFA989X
>  config SND_SOC_TLV320ADC3XXX
>  	tristate "Texas Instruments TLV320ADC3001/3101 audio ADC"
>  	depends on I2C
> +	depends on GPIOLIB
>  	help
>  	 Enable support for Texas Instruments TLV320ADC3001 and TLV320ADC3101
>  	 ADCs.

-- 
~Randy
