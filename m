Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F08131B1B6
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 18:58:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F4671681;
	Sun, 14 Feb 2021 18:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F4671681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613325508;
	bh=7Cf8RUoYndeDdbfSJHHDYMOEQPgmIey9vL5EL5S4JcE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWwK/7EfoT51CZQ+rdrzo7omUwnMjDkiLf2vUyNJYPOet24qJTkeWnmx4X772G1Z9
	 yM0niBytwFvFDIVnK26vd9TojPMxuu6EyxrdYFKeLAbz+WOu700FNlVJS/mBEr2c6F
	 bED7n08pxXOdLpzskQCMrBDNJ4+lTvFWqiBTvvas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC9DF800F0;
	Sun, 14 Feb 2021 18:56:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 518ADF80155; Sun, 14 Feb 2021 18:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98FC3F800C1
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 18:56:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98FC3F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LgHZ5qdL"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6029645b0000>; Sun, 14 Feb 2021 09:56:43 -0800
Received: from [10.25.100.251] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 14 Feb
 2021 17:56:39 +0000
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1612939421-19900-1-git-send-email-spujar@nvidia.com>
 <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <87im6y5fv8.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <93c9d656-8379-b463-e724-e48ce486c17d@nvidia.com>
Date: Sun, 14 Feb 2021 23:26:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87im6y5fv8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613325403; bh=5r+No4EM/ChCUa5jbPRUAONV8A4MOJSJyXrLuV1AsSI=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=LgHZ5qdLHsWmzU8DMrRQI6N8CM/TDMWra1cBp9axNMkO15oMKK9fdcirGuNbg6/C6
 WI6uZMclf0l1Fd9gvdZZ/nI/v5VxPq9jDrbe4k970Ze/l9qXAtpYx4KwmEP4oXYT+k
 qElLpuyLYZEV+DC8KNnbPTgdRRakSyq1htNqmtHxsTtlU/oChBrYBJTTb1fw8UxtUs
 U3KUDBs80FMqIigdNfQjZW97n+Fj3IvaZGuPZGMBeSs9kAlx2bB09tj9zonEXZfd7w
 oIvtZsIWhgigqPR2PSLLJ/dWPCnIPaJVUNDiCmCl7PRgROK14uzQ9QOKlmpnWrLksW
 dL2KABFKD4bhw==
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

Hi Morimoto-san,


On 2/12/2021 5:14 AM, Kuninori Morimoto wrote:
>> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
>> index bc0b62e..0754d70 100644
>> --- a/sound/soc/generic/simple-card-utils.c
>> +++ b/sound/soc/generic/simple-card-utils.c
>> @@ -173,16 +173,15 @@ int asoc_simple_parse_clk(struct device *dev,
>>         *  or device's module clock.
>>         */
>>        clk = devm_get_clk_from_child(dev, node, NULL);
>> -     if (!IS_ERR(clk)) {
>> -             simple_dai->sysclk = clk_get_rate(clk);
>> +     if (IS_ERR(clk))
>> +             clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
>>
>> +     if (!IS_ERR(clk)) {
>>                simple_dai->clk = clk;
>> -     } else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
>> +             simple_dai->sysclk = clk_get_rate(clk);
>> +     } else if (!of_property_read_u32(node, "system-clock-frequency",
>> +                                      &val)) {
>>                simple_dai->sysclk = val;
>> -     } else {
>> -             clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
>> -             if (!IS_ERR(clk))
>> -                     simple_dai->sysclk = clk_get_rate(clk);
>>        }
> The comment is indicating that that the clock parsing order,
> but this patch exchanges it.
> This comment also should be updated, I think.
>
>          /*
>           * Parse dai->sysclk come from "clocks = <&xxx>"
>           * (if system has common clock)
>           *  or "system-clock-frequency = <xxx>"
>           *  or device's module clock.
>           */

Yes, this can be rephrased now.

> asoc_simple_set_clk_rate() will be called if it has simple_dai->clk.
> CPU or Codec component clock rate will be exchanged by this patch, I think.
> I'm not sure the effect of this patch to existing boards.

If CPU or Codec node does not specifiy "mclk-fs" factor, 
asoc_simple_set_clk_rate() won't be called. So I don't think there would 
be any effect w.r.t clock rate. With this patch clocks would get 
enabled/disabled.

>
> And also, this patch has too many unneeded exchange,
> thus it was difficult to read for me.
> I think it can be simply like this ?
> It is understandable what it want to do.

I think the patch does exactly the same thing as what you are suggesting 
below. Am I missing anything?

>
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index 8c423afb9d2e..d441890de4dc 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -168,16 +168,14 @@ int asoc_simple_parse_clk(struct device *dev,
>           *  or device's module clock.
>           */
>          clk = devm_get_clk_from_child(dev, node, NULL);
> +       if (IS_ERR(clk))
> +               clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
> +
>          if (!IS_ERR(clk)) {
>                  simple_dai->sysclk = clk_get_rate(clk);
> -
>                  simple_dai->clk = clk;
>          } else if (!of_property_read_u32(node, "system-clock-frequency", &val)) {
>                  simple_dai->sysclk = val;
> -       } else {
> -               clk = devm_get_clk_from_child(dev, dlc->of_node, NULL);
> -               if (!IS_ERR(clk))
> -                       simple_dai->sysclk = clk_get_rate(clk);
>          }
>
>          if (of_property_read_bool(node, "system-clock-direction-out"))
