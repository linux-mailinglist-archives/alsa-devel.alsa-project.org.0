Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC4E2524B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 16:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21861677;
	Tue, 21 May 2019 16:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21861677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558449362;
	bh=DjSELo/zkvktiiRDFVFGkUV4bNZIZVgthm5PPXmnBfs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kNviVXamirjycHkH+HB5UkWZSuBdcX/gCcSmO6XLt/I8tAlClE3Iyz+wJMHOShdz2
	 fEEauMQUrItSKJabQwU7CZWbNn0CrkadubAKw0j4gqQc+3+cOrZh/QiANQA3WG3REv
	 JNz7d/jjeE+nvnjpM+iqFEoxp6SVE8ovOOHDuFac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCEF9F806E7;
	Tue, 21 May 2019 16:34:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FFD5F89670; Tue, 21 May 2019 16:33:21 +0200 (CEST)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6B07F806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 16:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B07F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 07:22:45 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 21 May 2019 07:22:45 -0700
Received: from vgonzale-mobl.amr.corp.intel.com (unknown [10.254.21.162])
 by linux.intel.com (Postfix) with ESMTP id EA84D5803A5;
 Tue, 21 May 2019 07:22:44 -0700 (PDT)
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87imu939x3.wl-kuninori.morimoto.gx@renesas.com>
 <0ba565ea-2f61-015d-f6e3-63124f94e78a@linux.intel.com>
 <87pnoeyo9f.wl-kuninori.morimoto.gx@renesas.com>
 <513fa7aa-60ca-dea2-1888-1d9df531f478@linux.intel.com>
 <87d0kctzwb.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5d16b18e-fd21-931a-ced6-f682afffc5b8@linux.intel.com>
Date: Tue, 21 May 2019 09:22:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87d0kctzwb.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-core: WARN() is not related
 to component->driver->probe
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

On 5/20/19 7:42 PM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
>>>>> 	if (component->driver->probe) {
>>>>> 		ret = component->driver->probe(component);
>>>>> 		...
>>>>> (A)		WARN(...)
>>>>> 	}
>>>>> (B)	WARN(...)
> (snip)
>>>> My take is that unless we can prove this is incorrect we leave it as is.
>>>
>>> I think this commit is correct, thanks.
>>> But, then, it sounds we need to check it even though without .prove ?
>>
>> Sorry, I am not getting your question.
>> I don't have a trace of which codecs need this check, and I don't know
>> either if this check needs to be done in other cases than the
>> .probe(). Given all this, why would we try to move this WARN statement
>> outside of the .probe case? It seems like asking for trouble.
> 
> Sorry for bother you.
> Actually, I'm planning to post soc-pcm.c / soc-core.c cleanup patch
> because, it is not readable/understandable/balanceable,
> thus, it is difficult to support multi CPU / multi Platform, etc, etc, etc...
> 
> Then, I can see below cade too many places.
> 
> 		if (component->driver->xxx)
> 			ret = component->driver->xxx()
> 
> this kind of code is very verbose for me.
> As one of this cleanup, I want to create very simple new_func like below.
> Then, this WARN() here is not good match for this purpose.
> In my understanding, this WARN() is effective
> even though it doesn't have .probe
> If so, code will be more simple.
> 
> 	int xxx_probe(component) {
> 		if (component->driver->probe)
> 			return component->driver->probe()
> 		return 0;
> 	}
> 
> 	...
> 	ret = xxx_probe(component);
> =>	WARN();
> 	...

I don't know how to help further. Doing this change will result in the 
warning being thrown in cases where it wasn't before. and since no one 
knows what this warning means in the first place, either we leave it or 
we remove it, changing its location would be very odd.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
