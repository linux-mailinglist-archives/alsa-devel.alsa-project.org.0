Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB5B189409
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 03:33:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECDAD1763;
	Wed, 18 Mar 2020 03:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECDAD1763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584498798;
	bh=R3W05iSZhB2/+kTMBtQSnGiepQ2mKKc6AS5bJPUecvo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oUgWJ6orlWJfo54Z/tRP+frpS8MMA4m8RGmeCFiM2m9orGWM+IlHkluQYfCeWIR0g
	 3qhqEXTfX9hGa4pHEFVSqB4DvL+vXd5IlLWLc6/JrRq/V1ra79jptKQt50ObZNo34a
	 gLYZuzx5bKG+qIpx8BUbNP6Ta1Ckz2zDbm8lQVp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8E16F800B7;
	Wed, 18 Mar 2020 03:31:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52CBFF80139; Wed, 18 Mar 2020 03:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39E31F800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 03:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39E31F800B7
IronPort-SDR: MfkzCD1au8UKhMNZ5mPW6N7p9pLW/EM+0xsy+aPpdkLwulHiShIcXnBFpCqJAyL/GqvKVPwfPa
 xxEq2jClBgRA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 19:31:24 -0700
IronPort-SDR: hKQjaT8uxorD0yHxBxwVkTCFxUageKwHqlRC8pQGe79u2ZwjMJb2xqWnEwa0UH5GQDUbMY4TQ1
 0Pi/hVA4yL4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; d="scan'208";a="324033846"
Received: from hwang33-mobl.ccr.corp.intel.com (HELO [10.254.210.239])
 ([10.254.210.239])
 by orsmga001.jf.intel.com with ESMTP; 17 Mar 2020 19:31:21 -0700
Subject: Re: [PATCH 1/2] ASoC: rt5682: fix the random recording noise of
 headset
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20200317073308.11572-1-shumingf@realtek.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <ac2e133b-b68c-025e-cb42-8e061abf9744@linux.intel.com>
Date: Wed, 18 Mar 2020 10:31:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317073308.11572-1-shumingf@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
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



On 3/17/20 3:33 PM, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The cycle time of FIFO clock should increase 2 times to avoid
> the random recording noise issue.
> This setting could apply to all known situations in i2s mode.

Thanks for fixing this Shuming.

Just try to understand what has happened.

Can you help share more details about it, e.g.
1. the recording noise happened on headset mic or dmic?
2. will this change impact the microphone sampling clock, or the BCLK 
that of the I2S bclk pin?
3. without this change, why the clk is wrong, some example?

Thanks,
~Keyon

> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>   sound/soc/codecs/rt5682.c | 2 ++
>   sound/soc/codecs/rt5682.h | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
> index 7ca02a5e52e9..023bc672274b 100644
> --- a/sound/soc/codecs/rt5682.c
> +++ b/sound/soc/codecs/rt5682.c
> @@ -3643,6 +3643,8 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
>   			RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
>   	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
>   			RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
> +	regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
> +			RT5682_FIFO_CLK_DIV_MASK, RT5682_FIFO_CLK_DIV_2);
>   
>   	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
>   				rt5682_jack_detect_handler);
> diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
> index 43de6e802309..0baeece84ec4 100644
> --- a/sound/soc/codecs/rt5682.h
> +++ b/sound/soc/codecs/rt5682.h
> @@ -657,6 +657,8 @@
>   #define RT5682_DMIC_1_EN_SFT			15
>   #define RT5682_DMIC_1_DIS			(0x0 << 15)
>   #define RT5682_DMIC_1_EN			(0x1 << 15)
> +#define RT5682_FIFO_CLK_DIV_MASK		(0x7 << 12)
> +#define RT5682_FIFO_CLK_DIV_2			(0x1 << 12)
>   #define RT5682_DMIC_1_DP_MASK			(0x3 << 4)
>   #define RT5682_DMIC_1_DP_SFT			4
>   #define RT5682_DMIC_1_DP_GPIO2			(0x0 << 4)
> 
