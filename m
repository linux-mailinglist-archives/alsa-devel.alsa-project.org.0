Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F009261105
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 13:57:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9E41743;
	Tue,  8 Sep 2020 13:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9E41743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599566252;
	bh=kko0HQ+eQammnzmZoFmkcmravp5VgtJhcOXDGeQ7gh8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JcXILs7HE4wSDkO6tTUbTaNcuKnNFvErIVRrh8/C9SQNebdTGLXCYX9Jp0ZaMPVeL
	 akknWy8KzlCNqvi/DPBSfdNhCjKIJR6Ex5brp5JB/xQ7jjMvzwJLw9N5ayxUGPaOHB
	 5U7lSD3Ia8DIXRN9++MGxBVNc6GnpTwB+i/rFQQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AE14F8026F;
	Tue,  8 Sep 2020 13:56:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69F2DF80272; Tue,  8 Sep 2020 13:55:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 688A1F8026F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 13:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688A1F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JN0XmYmY"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088BtjZr002439;
 Tue, 8 Sep 2020 06:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599566145;
 bh=8S2NCJwrsPCuX+GyPBMxHmMN2Snkw/AKa06O2GPbjc0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=JN0XmYmYYG+sh7kBGsZ4FEmWIKB3YGVEglGhg9FQvt5MJYCHlDHnInnbAK6Cm3Kwq
 NdOd7v39ZhWpwkZEieJuoFBwJ/MmKew7rJYgpXu0Vu7KRNTUUCkshGaV3L4lmDrMpG
 XQibWpzYEYT83NDjh2ci+7FZgciLc+49zW9B7iFw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088Btj0O103436
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Sep 2020 06:55:45 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 06:55:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 06:55:44 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088BtiiB092847;
 Tue, 8 Sep 2020 06:55:44 -0500
Subject: Re: [PATCH 1/2] ASoC: tlv320adcx140: Avoid accessing invalid
 gpio_reset
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>
References: <20200908083521.14105-1-camel.guo@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c1036c8f-9ddc-1e02-4668-1dd0d081b6cf@ti.com>
Date: Tue, 8 Sep 2020 06:55:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908083521.14105-1-camel.guo@axis.com>
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

On 9/8/20 3:35 AM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>
> When gpio_reset is not well defined in devicetree, the
> adcx140->gpio_reset is an error code instead of NULL. In this case,
> adcx140->gpio_reset should not be used by adcx140_reset. This commit
> sets it NULL to avoid accessing an invalid variable.
>
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>   sound/soc/codecs/tlv320adcx140.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
> index 7ae6ec374be3..597dd1062943 100644
> --- a/sound/soc/codecs/tlv320adcx140.c
> +++ b/sound/soc/codecs/tlv320adcx140.c
> @@ -984,8 +984,10 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
>   
>   	adcx140->gpio_reset = devm_gpiod_get_optional(adcx140->dev,
>   						      "reset", GPIOD_OUT_LOW);
> -	if (IS_ERR(adcx140->gpio_reset))
> +	if (IS_ERR(adcx140->gpio_reset) || adcx140->gpio_reset == NULL) {

This looks a bit off and seems like the NULL check was added just to 
print the message.

I would suggest removing the "or" check and just set the gpio_reset to 
NULL in an error case.

This avoids noise in the log especially if the gpio_reset is 
intentionally not populated in the DT

Dan

