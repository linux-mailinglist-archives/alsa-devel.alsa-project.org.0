Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A69A6E789
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 16:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A90E16C0;
	Fri, 19 Jul 2019 16:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A90E16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563547647;
	bh=YxHQOmeMUvZlGeJmqdtPhSlijHxqye0KIx7RoTmuF8I=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdDMrT8DO+l4t9ZdZJfxofZnTD1cphc418LvUEs4KirmRqsZjBHcPNpx97CxcCVqV
	 O7RcQUkC/uTcxo8SA1qfkbrRZJapacoVZ4EZVpXTd4YbtVdKV3vRdrQVfIt1ntyy1/
	 A0UY6NkFrkRnfAgGnO1dE3xcge2NsUwAz9F9TYyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C89ACF80272;
	Fri, 19 Jul 2019 16:45:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 147B4F80368; Fri, 19 Jul 2019 16:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76E40F80363
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 16:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76E40F80363
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pu8d6Ai3"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6JEjZMx109275;
 Fri, 19 Jul 2019 09:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1563547535;
 bh=tDZNg34+wNmaDzjxSevNvI2FvXpPTiXIaa6fxCG2OM4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=pu8d6Ai3lsbklKBfpFTKJE3Hea8gXt5HsKTj9GbCxN8l3Mi1EBCSITfqc+AFrkAf1
 wcgf0FcCDONo1dQ7zDAXiT6uorUqLplZBYGyO5M89u1wKnFunYCzO5eOAKqsH0T5zj
 62Q0K5wFA7LimdPjyR6U145C5n2L+dNiMrh5ONC0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6JEjZaK066534
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 19 Jul 2019 09:45:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 19
 Jul 2019 09:45:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 19 Jul 2019 09:45:35 -0500
Received: from [10.250.86.29] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6JEjYM3082525;
 Fri, 19 Jul 2019 09:45:34 -0500
To: Lucas Stach <l.stach@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
References: <20190719143637.2018-1-l.stach@pengutronix.de>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <4018df8f-3d34-a62f-8e83-14dd0dece94d@ti.com>
Date: Fri, 19 Jul 2019 10:45:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719143637.2018-1-l.stach@pengutronix.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: Re: [alsa-devel] [PATCH] ASoC: tlv320aic31xx: suppress error
 message for EPROBE_DEFER
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 7/19/19 10:36 AM, Lucas Stach wrote:
> Both the supplies and reset GPIO might need a probe deferral for the
> resource to be available. Don't print a error message in that case, as
> it is a normal operating condition.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  sound/soc/codecs/tlv320aic31xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
> index 9b37e98da0db..26a4f6cd3288 100644
> --- a/sound/soc/codecs/tlv320aic31xx.c
> +++ b/sound/soc/codecs/tlv320aic31xx.c
> @@ -1553,7 +1553,8 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
>  	aic31xx->gpio_reset = devm_gpiod_get_optional(aic31xx->dev, "reset",
>  						      GPIOD_OUT_LOW);
>  	if (IS_ERR(aic31xx->gpio_reset)) {
> -		dev_err(aic31xx->dev, "not able to acquire gpio\n");
> +		if (PTR_ERR(aic31xx->gpio_reset) != -EPROBE_DEFER)
> +			dev_err(aic31xx->dev, "not able to acquire gpio\n");
>  		return PTR_ERR(aic31xx->gpio_reset);
>  	}
>  
> @@ -1564,7 +1565,9 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
>  				      ARRAY_SIZE(aic31xx->supplies),
>  				      aic31xx->supplies);
>  	if (ret) {
> -		dev_err(aic31xx->dev, "Failed to request supplies: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(aic31xx->dev,
> +				"Failed to request supplies: %d\n", ret);


I can't be the only one who thinks this looks much less readable than
just breaking the 80 char line by a little..

All these one-off handlers for probe defer are cluttering the code base,
was there some issue with just yielding for a time in these _get()
functions until the device finally probes?

Anyway that's unrelated to this, for this patch:

Acked-by: Andrew F. Davis <afd@ti.com>


>  		return ret;
>  	}
>  
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
