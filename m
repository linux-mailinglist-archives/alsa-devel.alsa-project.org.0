Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F3996D2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 16:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EBB316AE;
	Thu, 22 Aug 2019 16:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EBB316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566484596;
	bh=ZlmlfNSLC2A/xfEs0lZV6+hCnriMtDvQD3lP5QeXPgM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eb6MQlKvX5xgD2rkRKpwi9bfmVMm66Ktno7yOvqWQLJOCpQ6asw5yqMcqWrZ6liGb
	 Ec8D3okZA6j4PrjIKezOAZXkUJDheT7Gbat8X73QCvPu06mlfAW4c0BrJMDjSaX/FC
	 ARbcYvRnSbF2djJa66OEQSaAf7RI3Ik6AmJBuV2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51476F803D5;
	Thu, 22 Aug 2019 16:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65940F8036E; Thu, 22 Aug 2019 16:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24616F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24616F800BF
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 615BD2BC513CB4D2D3BC;
 Thu, 22 Aug 2019 22:34:43 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 22 Aug 2019 22:34:38 +0800
To: Maxime Ripard <mripard@kernel.org>
References: <20190822065252.74028-1-yuehaibing@huawei.com>
 <20190822141826.is6nizjpdgvhd7ra@flea>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <5b15becf-b79b-ae5d-91e2-6521ded50946@huawei.com>
Date: Thu, 22 Aug 2019 22:34:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190822141826.is6nizjpdgvhd7ra@flea>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: sun4i-i2s: Use PTR_ERR_OR_ZERO
 in sun4i_i2s_init_regmap_fields()
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

On 2019/8/22 22:18, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Aug 22, 2019 at 06:52:52AM +0000, YueHaibing wrote:
>> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  sound/soc/sunxi/sun4i-i2s.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
>> index 9e691baee1e8..2071c54265f3 100644
>> --- a/sound/soc/sunxi/sun4i-i2s.c
>> +++ b/sound/soc/sunxi/sun4i-i2s.c
>> @@ -1095,10 +1095,7 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
>>  	i2s->field_fmt_sr =
>>  			devm_regmap_field_alloc(dev, i2s->regmap,
>>  						i2s->variant->field_fmt_sr);
>> -	if (IS_ERR(i2s->field_fmt_sr))
>> -		return PTR_ERR(i2s->field_fmt_sr);
>> -
>> -	return 0;
>> +	return PTR_ERR_OR_ZERO(i2s->field_fmt_sr);
> 
> I'm not really convinced that this more readable or more maintainable
> though. Is there a reason for this other than we can do it?

No special reason, just suggested by scripts/coccinelle/api/ptr_ret.cocci

> 
> Maxie
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
