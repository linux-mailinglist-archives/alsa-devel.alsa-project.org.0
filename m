Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052CA8714
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 19:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 784C91694;
	Wed,  4 Sep 2019 19:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 784C91694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567619427;
	bh=I9oB9MdkIn8n+S/YVN08qkezP2UcJBGUxQKds7rl+bU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bdsu18mjnDiL1kQBlrsgd2BVXfoebaM93SIvwRe+wpzDuWCyI5T1KJVbU2c/VkX2j
	 /Ng+gYeJDuuv9VKtlpDpekxv1pSQGNarkI9+fCGWZky/pOGOFwwGMl4Wmw8scbgJMq
	 hFyRMBVivP/9cXzfQ4UnkNFNBKnwgKOXkymD8eDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63EE2F803D6;
	Wed,  4 Sep 2019 19:49:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4028F803D6; Wed,  4 Sep 2019 19:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2D88F80394
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 19:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2D88F80394
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 10:49:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,467,1559545200"; d="scan'208";a="194814550"
Received: from enagase-mobl1.amr.corp.intel.com (HELO [10.251.133.230])
 ([10.251.133.230])
 by orsmga002.jf.intel.com with ESMTP; 04 Sep 2019 10:49:24 -0700
To: Vinod Koul <vkoul@kernel.org>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
 <20190821201720.17768-5-pierre-louis.bossart@linux.intel.com>
 <20190822071835.GA30262@ubuntu>
 <f73796d6-fcfa-97c8-69ae-0a183edbbd97@linux.intel.com>
 <20190904073549.GL2672@vkoul-mobl>
 <4de9613c-2da4-8d39-6f99-3039811673b8@linux.intel.com>
 <20190904165522.GC2672@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b37f7be2-27b4-4ba5-e07a-8993d8c171f2@linux.intel.com>
Date: Wed, 4 Sep 2019 12:49:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904165522.GC2672@vkoul-mobl>
Content-Language: en-US
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 4/5] ASoC: SOF: Intel: hda: add
 SoundWire stream config/free callbacks
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



On 9/4/19 11:55 AM, Vinod Koul wrote:
> On 04-09-19, 08:31, Pierre-Louis Bossart wrote:
>> On 9/4/19 2:35 AM, Vinod Koul wrote:
>>> On 22-08-19, 08:53, Pierre-Louis Bossart wrote:
>>>> Thanks for the review Guennadi
>>>>
>>>>>> +static int sdw_config_stream(void *arg, void *s, void *dai,
>>>>>> +			     void *params, int link_id, int alh_stream_id)
>>>>>
>>>>> I realise, that these function prototypes aren't being introduced by these
>>>>> patches, but just wondering whether such overly generic prototype is really
>>>>> a good idea here, whether some of those "void *" pointers could be given
>>>>> real types. The first one could be "struct device *" etc.
>>>>
>>>> In this case the 'arg' parameter is actually a private 'struct snd_sof_dev',
>>>> as shown below [1]. We probably want to keep this relatively opaque, this is
>>>> a context that doesn't need to be exposed to the SoundWire code.
>>>
>>> This does look bit ugly.
>>>
>>>> The dai and params are indeed cases where we could use stronger types, they
>>>> are snd_soc_dai and hw_params respectively. I don't recall why the existing
>>>> code is this way, Vinod and Sanyog may have the history of this.
>>>
>>> Yes we wanted to decouple the sdw and audio bits that is the reason why
>>> none of the audio types are used here, but I think it should be revisited
>>> and perhaps made as:
>>>
>>> sdw_config_stream(struct device *sdw, struct sdw_callback_ctx *ctx)
>>>
>>> where the callback context contains all the other args. That would make
>>> it look lot neater too and of course use real structs if possible
>>
>> the suggested sdw_callbback_ctx is really intel-specific at the moment, e.g.
>> the notion of link_id and alh_stream_id are due to the hardware, it's not
>> generic at all. And in the latest code we also pass the dai->id.
> 
> s/sdw_callback_ctx/intel_sdw_callback_ctx
> 
> Yes this code is intel specific and this would be intel specific too

ok, I'll fold all the fields in a structure then. That's a nice cleanup, 
thanks Guennadi and Vinod for the reviews.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
