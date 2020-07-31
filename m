Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C407F2348ED
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 18:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DF0A1657;
	Fri, 31 Jul 2020 18:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DF0A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596211859;
	bh=TPBzSUWGe/wE9h2DyXAIY2V2yJLWKrtFGGU1ejjWm2c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzssEtWCbaPy1Bi1FN2JTAUoNjomol3mJkt8BBn8/js2scYHObyAGfBeNd1dCoehm
	 Nu87yce0rBs/f38jStvwY4Apl8e4mFl0VZJe8RD070MBQ1TlCNevaMr9m5it1Mct3G
	 nBSHG3z9UMvZ1SfllFwLTQO8fZcH6Oen385zYmk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6AAF8015C;
	Fri, 31 Jul 2020 18:09:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72CE2F8015C; Fri, 31 Jul 2020 18:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0615F8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 18:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0615F8015C
IronPort-SDR: ez1R8VKeQ6VQV567pAQcQhMFV+GLhpvdrbxJCOUNlpldC9bHJOguOIKkORg0SVKiGuDZRTuyZe
 lDyqmpdkq+qg==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="236672644"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="236672644"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 09:09:04 -0700
IronPort-SDR: SVGvEqm1pDhWsXkriCWf4ahaKdavrhbaByZ7Nf3XflHLzQ0p+U2EOrFFqN/9tI6A+fZvkrWXVq
 uRRmgd+4tyEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="491526893"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.27.145])
 ([10.213.27.145])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2020 09:09:01 -0700
Subject: Re: [PATCH 0/3] ASoC: core: Two step component registration
To: Lars-Peter Clausen <lars@metafoo.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200731144146.6678-1-cezary.rojewski@intel.com>
 <1828f3a2-f198-e6cd-ca6c-c66dc1ef82d1@linux.intel.com>
 <61faef6e-70e9-5574-5f3a-e333d0a71617@intel.com>
 <a6d3e9fb-4aa2-b75b-4535-037edb256112@metafoo.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a02ec298-6e45-cf5b-b3c0-fd9ee059ac25@intel.com>
Date: Fri, 31 Jul 2020 18:09:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a6d3e9fb-4aa2-b75b-4535-037edb256112@metafoo.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, olivier.moysan@st.com, alexandre.torgue@st.com,
 lgirdwood@gmail.com, arnaud.pouliquen@st.com, tiwai@suse.com,
 broonie@kernel.org, mcoquelin.stm32@gmail.com
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

On 2020-07-31 5:58 PM, Lars-Peter Clausen wrote:
> On 7/31/20 5:47 PM, Cezary Rojewski wrote:
>> On 2020-07-31 5:07 PM, Pierre-Louis Bossart wrote:
>>> On 7/31/20 9:41 AM, Cezary Rojewski wrote:
>>>> Provide a mechanism for true two-step component registration. This
>>>> mimics device registration flow where initialization is the first step
>>>> while addition goes as second in line. Drivers may choose to modify
>>>> component's fields before registering component to ASoC subsystem via
>>>> snd_soc_add_component.
>>>
>>> I must admit I don't see where this might be used for Intel 
>>> platforms, we've been happily using snd_soc_register_component() 
>>> without hitting limitations.
>>
>> Patchset targets entire ASoC framework, not Intel catalog. As 
>> _initialize and _add are already in place, having a two-step 
>> registration is cohesive with other "frameworks" e.g. device one.
>>
>> New to ASoC? Trying to learn soc-components? Guess what, 
>> creation/registration procedure is exactly the same as one you're used 
>> to already!
>>
>>> Also the only two uses of snd_soc_add_component() seem mainly driven 
>>> by memory allocation - and avoiding a devm_kzalloc in 
>>> snd_soc_register_component().
>>
>> In general, code quality and improvements to its flow should not 
>> require ton of usages. But hey, you got two already.
>>
>>> Out of curiosity, can you provide an example where this two-step 
>>> would be required or beneficial? Thanks!
>>
>> Overridding component->name which is currently always tied to 
>> fmt_single_name so you may choose a different name than the ->dev one.
> 
> For what it is worth, I think this is a sensible change for the outlined 
> reasons. It's something I've always had in the back of my mind, but 
> there was never enough of a need to actually do it.
> 
> One change I'd like to see is the addition of snd_soc_component_alloc(), 
> which combines the step of kzalloc() and snd_soc_component_init() as 
> these will be done pretty much always in lockstep. And it also matches 
> the APIs that other frameworks offer.
> 
> - Lars
> 

Nice, so it's not just me imagining things : D

In general granular registration is robust and scales well into the 
future. Components functionality will only grow in time so I bet 
usecases don't end on my example.

I'd suggest transition to _alloc/_init/other being separated from this 
patchset - let it serve as a middle step.

Czarek
