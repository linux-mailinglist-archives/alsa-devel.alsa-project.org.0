Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF66E1A1
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 09:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6632B1693;
	Fri, 19 Jul 2019 09:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6632B1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563520869;
	bh=cN/prZNYFyL1gyLFy/0rQ/xCvTAjKrGKP9wwRooKNh0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJtLphFP/KOH6Zrl4NF7a91oS0vK9dYDOrtmHx8OaXMs1K4+WfkdN3g8pBtYA0yiN
	 8f5E2HJDeHsYW614TVwe2AwBur0dF6Ws4N9yvojnMnbTyD3dviYUkmDaZYrN9/nmIQ
	 oJZM6hOnaOlInwgZT79ohnIYM56SS5tQZeAZ8wzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC4BEF80228;
	Fri, 19 Jul 2019 09:19:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 771DBF80272; Fri, 19 Jul 2019 09:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7149AF800C4
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 09:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7149AF800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jul 2019 00:19:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="343617583"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.81.172])
 ([10.251.81.172])
 by orsmga005.jf.intel.com with ESMTP; 19 Jul 2019 00:19:12 -0700
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
 <20190718090240.18432-3-oleksandr.suvorov@toradex.com>
 <9c9ee47c-48bd-7109-9870-8f73be1f1cfa@intel.com>
 <a86e4d6b-ed2c-d2f2-2974-6f00dc6ef68a@intel.com>
 <CAGgjyvGboMPx5wKJ_1DaeYZazSHmQUGwDZHoCBt5vhpVq3Q_bA@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3c153dcc-e656-2959-6281-15cc895660e0@intel.com>
Date: Fri, 19 Jul 2019 09:19:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAGgjyvGboMPx5wKJ_1DaeYZazSHmQUGwDZHoCBt5vhpVq3Q_bA@mail.gmail.com>
Content-Language: en-US
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v5 2/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-07-19 09:09, Oleksandr Suvorov wrote:
> On Thu, 18 Jul 2019 at 21:49, Cezary Rojewski <cezary.rojewski@intel.com> wrote:
>>
>> On 2019-07-18 20:42, Cezary Rojewski wrote:
>>> On 2019-07-18 11:02, Oleksandr Suvorov wrote:
>>>> +enum {
>>>> +    HP_POWER_EVENT,
>>>> +    DAC_POWER_EVENT,
>>>> +    ADC_POWER_EVENT,
>>>> +    LAST_POWER_EVENT
>>>> +};
>>>> +
>>>> +static u16 mute_mask[] = {
>>>> +    SGTL5000_HP_MUTE,
>>>> +    SGTL5000_OUTPUTS_MUTE,
>>>> +    SGTL5000_OUTPUTS_MUTE
>>>> +};
>>>
>>> If mute_mask[] is only used within common handler, you may consider
>>> declaring const array within said handler instead (did not check that
>>> myself).
>>> Otherwise, simple comment for the second _OUTPUTS_MUTE should suffice -
>>> its not self explanatory why you doubled that mask.
> 
> Ok, I'll add a comment to explain doubled mask.
> 
>>>
>>>> +
>>>>    /* sgtl5000 private structure in codec */
>>>>    struct sgtl5000_priv {
>>>>        int sysclk;    /* sysclk rate */
>>>> @@ -137,8 +157,109 @@ struct sgtl5000_priv {
>>>>        u8 micbias_voltage;
>>>>        u8 lrclk_strength;
>>>>        u8 sclk_strength;
>>>> +    u16 mute_state[LAST_POWER_EVENT];
>>>>    };
>>>
>>> When I spoke of LAST enum constant, I did not really had this specific
>>> usage in mind.
>>>
>>>   From design perspective, _LAST_ does not exist and should never be
>>> referred to as "the next option" i.e.: new enum constant.
> 
> By its nature, LAST_POWER_EVENT is actually a size of the array, but I
> couldn't come up with a better name.
> 
>>> That is way preferred usage is:
>>> u16 mute_state[ADC_POWER_EVENT+1;
>>> -or-
>>> u16 mute_state[LAST_POWER_EVENT+1];
>>>
>>> Maybe I'm just being radical here :)
> 
> Maybe :)  I don't like first variant (ADC_POWER_EVENT+1): somewhen in
> future, someone can add a new event to this enum and we've got a
> possible situation with "out of array indexing".
> 
>>>
>>> Czarek
>>
>> Forgive me for double posting. Comment above is targeted towards:
>>
>>   >> +enum {
>>   >> +    HP_POWER_EVENT,
>>   >> +    DAC_POWER_EVENT,
>>   >> +    ADC_POWER_EVENT,
>>   >> +    LAST_POWER_EVENT
>>   >> +};
>>
>> as LAST_POWER_EVENT is not assigned explicitly to ADC_POWER_EVENT and
>> thus generates implicit "new option" of value 3.
> 
> So will you be happy with the following variant?
> ...
>      ADC_POWER_EVENT,
>      LAST_POWER_EVENT =  ADC_POWER_EVENT,
> ...
>     u16 mute_state[LAST_POWER_EVENT+1];
> ...
> 

It's not about being happy - I'm a happy man in general ;p

As stated already, declaring _LAST_ as the "new option" is misleading 
and not advised.
And yeah, [_LAST_ + 1] is usually the one you should go with.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
