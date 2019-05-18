Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D612246A
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 20:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4473D168B;
	Sat, 18 May 2019 20:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4473D168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558203179;
	bh=l2LrR2QXwuGnYD09xc5owJ/XXb+TKsOb6LZU3Yv2dgo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTDkjng1BnMFsj5TaaYuBzCIxu/TDcJMzG9BcAR7bSuEylB26GFATsqL6l7zOgE7q
	 xncODJ7ijXYwGk9tqnbQXxKlDLb6zk0zU3WWapn/oJWCVjelwn8pqbfJoa5U1T5DKy
	 r30dT8whXBK9nZG9JmdLPEvJ5mvqd3q/WXs8BWlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B56C6F896B7;
	Sat, 18 May 2019 20:11:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CF5EF896B7; Sat, 18 May 2019 20:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36DD1F806E7
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 20:11:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36DD1F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 11:11:06 -0700
X-ExtLoop1: 1
Received: from unknown (HELO [10.251.159.210]) ([10.251.159.210])
 by orsmga001.jf.intel.com with ESMTP; 18 May 2019 11:11:05 -0700
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Vinod Koul <vkoul@kernel.org>
References: <87h89t39t6.wl-kuninori.morimoto.gx@renesas.com>
 <c1fb57af-0710-98ca-9cc2-05e14dd221ac@linux.intel.com>
 <7b48709fa2fa360d4425f07261e218b429383b9f.camel@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8f6194bb-74f8-04bd-4cf6-7a16d3a7299c@linux.intel.com>
Date: Sat, 18 May 2019 13:11:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7b48709fa2fa360d4425f07261e218b429383b9f.camel@linux.intel.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-pcm: fixup try_module_get()
 calling timing
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



On 5/18/19 12:54 PM, Ranjani Sridharan wrote:
> On Fri, 2019-05-17 at 08:22 -0500, Pierre-Louis Bossart wrote:
>>
>> On 5/17/19 1:08 AM, Kuninori Morimoto wrote:
>>>
>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> soc_pcm_components_open() try to call try_module_get()
>>> based on component->driver->module_get_upon_open.
>>> But, it should be always called, not relatead to .open callback.
>>> It should be called at (A) istead of (B)
>>>
>>> => (A)
>>> 	if (!component->driver->ops ||
>>> 	    !component->driver->ops->open)
>>> 		continue;
>>> => (B)
>>> 	if (component->driver->module_get_upon_open &&
>>> 	    !try_module_get(component->dev->driver->owner)) {
>>> 		...
>>> 	}
>>>
>>> 	ret = component->driver->ops->open(substream);
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>> Mark, Pierre-Louis, Vinod, Liam
>>>
>>> I think this patch is correct, but I'm not sure.
>>> I'm happy if someone can confirm it.
>>
>> The try_module_get()/module_put() mechanism is based on the
>> assumption
>> that the .open and .close callbacks are both mandatory.
> Hi Pierre,
> But is this enforced? We could end up doing a try_module_get() without
> checking if there is a close callback in which case we'd never do the
> module_put(), isnt it?


My initial feedback was that changing the open case only wouldn't work.

We need to enforce that both the open/close callbacks are required and 
leave the code as is, or we apply both of Morimoto-san's patches (which 
unfortunately have the same subject to cover the two cases) and both 
open and close are optional - though I am having a hard time figuring 
out case where we we'd use one and the other.

> 
> Thanks,
> Ranjani
>>
>> open flow:
>> 		if (!component->driver->ops ||
>> 		    !component->driver->ops->open)
>> 			continue;
>>
>> 		if (component->driver->module_get_upon_open &&
>> 		    !try_module_get(component->dev->driver->owner)) {
>> 			ret = -ENODEV;
>> 			goto module_err;
>> 		}
>>
>> 		ret = component->driver->ops->open(substream);
>>
>> close flow:
>> 		if (!component->driver->ops ||
>> 		    !component->driver->ops->close)
>> 			continue;
>>
>> 		component->driver->ops->close(substream);
>>
>> 		if (component->driver->module_get_upon_open)
>> 			module_put(component->dev->driver->owner);
>>
>> it'd be odd to allow the refcount to be increased when there is no
>> .open, since if there is no .close either then the refcount never
>> decreases.
>>
>>>
>>>
>>>    sound/soc/soc-pcm.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>>> index 7737e00..7b4cda6 100644
>>> --- a/sound/soc/soc-pcm.c
>>> +++ b/sound/soc/soc-pcm.c
>>> @@ -440,10 +440,6 @@ static int soc_pcm_components_open(struct
>>> snd_pcm_substream *substream,
>>>    		component = rtdcom->component;
>>>    		*last = component;
>>>    
>>> -		if (!component->driver->ops ||
>>> -		    !component->driver->ops->open)
>>> -			continue;
>>> -
>>>    		if (component->driver->module_get_upon_open &&
>>>    		    !try_module_get(component->dev->driver->owner)) {
>>>    			dev_err(component->dev,
>>> @@ -452,6 +448,10 @@ static int soc_pcm_components_open(struct
>>> snd_pcm_substream *substream,
>>>    			return -ENODEV;
>>>    		}
>>>    
>>> +		if (!component->driver->ops ||
>>> +		    !component->driver->ops->open)
>>> +			continue;
>>> +
>>>    		ret = component->driver->ops->open(substream);
>>>    		if (ret < 0) {
>>>    			dev_err(component->dev,
>>>
>>
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
