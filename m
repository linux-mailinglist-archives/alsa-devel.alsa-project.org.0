Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E850A189804
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 10:38:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9434216FD;
	Wed, 18 Mar 2020 10:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9434216FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584524280;
	bh=fRG+jGEt+sH088/KGK+xRAyusCfhNU0d3/fqbUy+Cnc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mh5dkIVz+AAhlmwVWdsDVtEp4h+qaX+y7ixWVQO5EdhA2qPy7Rk5IfBxTEy5y39dg
	 BeXawfHin52nEv54diF5E0JjGbIWTCCUWFshbkltOP/SRKw++RxRrZ9itvLS9fuOmc
	 B+QX3HfIZDj+p3liNeDoOi0Qd3c4SKNhkoSrSfLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B080EF8028E;
	Wed, 18 Mar 2020 10:36:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12F51F8028D; Wed, 18 Mar 2020 10:36:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DEAR_SOMETHING, SPF_HELO_NONE, 
 SPF_NONE, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9E00F80212
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 10:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9E00F80212
IronPort-SDR: WklYk5XbWSCE5vEm7fFpBDdMi8l4TPZgFnMCiVQBco23Pc74iJikc5JSNtn48iESVPISdV4Hg4
 KB7tdcTp2egg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 02:36:12 -0700
IronPort-SDR: ChNEYfGz/CwAy4qyVd/Dglll80ybrQ4FKxX6qO1Jap3fQIR8UW64NhTtdsAKYVn1aylX8M+K0+
 hN+o+nW0QIjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="324111977"
Received: from hwang33-mobl.ccr.corp.intel.com (HELO [10.254.210.239])
 ([10.254.210.239])
 by orsmga001.jf.intel.com with ESMTP; 18 Mar 2020 02:36:09 -0700
Subject: Re: [PATCH 1/2] ASoC: rt5682: fix the random recording noise of
 headset
To: Albert Chen <albertchen@realtek.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqY?=
 =?UTF-8?Q?=5d?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20200317073308.11572-1-shumingf@realtek.com>
 <ac2e133b-b68c-025e-cb42-8e061abf9744@linux.intel.com>
 <ca4f69fee72243c9a1b0ac55247cbdb7@realtek.com>
 <2dc0887c-b86f-0f76-2107-bd7978e7a204@linux.intel.com>
 <8ffd32c6b52b4684bdcdd45f095f38b2@realtek.com>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <fb0fe5f8-8dc4-1ef6-0e64-0bd790bc3eb8@linux.intel.com>
Date: Wed, 18 Mar 2020 17:36:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8ffd32c6b52b4684bdcdd45f095f38b2@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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



On 3/18/20 2:07 PM, Albert Chen wrote:
> 
> 
> -----Original Message-----
> From: Keyon Jie <yang.jie@linux.intel.com>
> Sent: Wednesday, March 18, 2020 11:31 AM
> To: Albert Chen <albertchen@realtek.com>; Shuming [范書銘] <shumingf@realtek.com>; broonie@kernel.org; lgirdwood@gmail.com
> Cc: Oder Chiou <oder_chiou@realtek.com>; Jack Yu <jack.yu@realtek.com>; alsa-devel@alsa-project.org; lars@metafoo.de; Derek [方德義] <derek.fang@realtek.com>; sathya.prakash.m.r@intel.com; Flove(HsinFu) <flove@realtek.com>
> Subject: Re: [PATCH 1/2] ASoC: rt5682: fix the random recording noise of headset
> 
> 
> On 3/18/20 11:06 AM, Albert Chen wrote:
>> Dear Sir,
>>
>> Inline.
>>
>> Thanks,
>> Albert
>>
>> -----Original Message-----
>> From: Keyon Jie <yang.jie@linux.intel.com>
>> Sent: Wednesday, March 18, 2020 10:32 AM
>> To: Shuming [范書銘] <shumingf@realtek.com>; broonie@kernel.org;
>> lgirdwood@gmail.com
>> Cc: Oder Chiou <oder_chiou@realtek.com>; Jack Yu
>> <jack.yu@realtek.com>; alsa-devel@alsa-project.org; lars@metafoo.de;
>> Albert Chen <albertchen@realtek.com>; Derek [方德義]
>> <derek.fang@realtek.com>; sathya.prakash.m.r@intel.com; Flove(HsinFu)
>> <flove@realtek.com>
>> Subject: Re: [PATCH 1/2] ASoC: rt5682: fix the random recording noise
>> of headset
>>
>> On 3/17/20 3:33 PM, shumingf@realtek.com wrote:
>>> From: Shuming Fan <shumingf@realtek.com>
>>>
>>> The cycle time of FIFO clock should increase 2 times to avoid the
>>> random recording noise issue.
>>> This setting could apply to all known situations in i2s mode.
>>
>> Thanks for fixing this Shuming.
>>
>> Just try to understand what has happened.
>>
>> Can you help share more details about it, e.g.
>> 1. the recording noise happened on headset mic or dmic?
>> <Albert> Headset Mic
>> 2. will this change impact the microphone sampling clock, or the BCLK that of the I2S bclk pin?
>> <Albert> No.
>> 3. without this change, why the clk is wrong, some example?
>> <Albert> Only adjust FIFO buffer setting.
> 
> Where is the FIFO buffer you mentioned located? Is it included in the path "headset mic ADC--(loopback)-->ADC headphone"?
> <Albert> I2S interface.
> 
> The issue was reported to Intel also, that's why I am querying this here.
> 
>  From previous feedback, Shuming shared that the loopback path mentioned above don't have this random noise issue.
> 
> <Albert>These are have total two recording random noise issues, one is the PCB trace design and another is Codec setting, Our previous reported is PCB trace cause noise.

Okay, thanks for explaining. Looks good to me now. :)

Thanks,
~Keyon

> 
> Thanks,
> ~Keyon
> 
>>
>> Thanks,
>> ~Keyon
>>
>>>
>>> Signed-off-by: Shuming Fan <shumingf@realtek.com>
>>> ---
>>>     sound/soc/codecs/rt5682.c | 2 ++
>>>     sound/soc/codecs/rt5682.h | 2 ++
>>>     2 files changed, 4 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
>>> index 7ca02a5e52e9..023bc672274b 100644
>>> --- a/sound/soc/codecs/rt5682.c
>>> +++ b/sound/soc/codecs/rt5682.c
>>> @@ -3643,6 +3643,8 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
>>>     			RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
>>>     	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
>>>     			RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
>>> +	regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
>>> +			RT5682_FIFO_CLK_DIV_MASK, RT5682_FIFO_CLK_DIV_2);
>>>     
>>>     	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
>>>     				rt5682_jack_detect_handler);
>>> diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
>>> index 43de6e802309..0baeece84ec4 100644
>>> --- a/sound/soc/codecs/rt5682.h
>>> +++ b/sound/soc/codecs/rt5682.h
>>> @@ -657,6 +657,8 @@
>>>     #define RT5682_DMIC_1_EN_SFT			15
>>>     #define RT5682_DMIC_1_DIS			(0x0 << 15)
>>>     #define RT5682_DMIC_1_EN			(0x1 << 15)
>>> +#define RT5682_FIFO_CLK_DIV_MASK		(0x7 << 12)
>>> +#define RT5682_FIFO_CLK_DIV_2			(0x1 << 12)
>>>     #define RT5682_DMIC_1_DP_MASK			(0x3 << 4)
>>>     #define RT5682_DMIC_1_DP_SFT			4
>>>     #define RT5682_DMIC_1_DP_GPIO2			(0x0 << 4)
>>>
>>
>> ------Please consider the environment before printing this e-mail.
>>
