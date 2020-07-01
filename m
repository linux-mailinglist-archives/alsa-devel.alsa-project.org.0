Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D80211133
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 18:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4559B1688;
	Wed,  1 Jul 2020 18:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4559B1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593622454;
	bh=9C5o8j/NP1d+64GsonbcLWzdXWd8UmAVCaWzkik1cx0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HK2+ASFhqqSdyCH6gJuJnJNfa5zmvc+XlaT2WZnOGn9PNZZefTKE4vmFM9JyRBoRy
	 LObWaSDC2SOcRClEz6WUKWRh/gGL8bQemjiZM7xCsNld6YUL7vqqfrVsMHt10p6Gbe
	 ApHDiir4rzMVb3+Jzzq7wVMBpGYr814yu1OseLqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F041F80217;
	Wed,  1 Jul 2020 18:52:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B16CF800EA; Wed,  1 Jul 2020 18:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 280E3F800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 18:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280E3F800EA
IronPort-SDR: jWF2Hh2xXS4f1MssrRGqiTf90dcGo8sOM/JstWlTX6GTMN67Evdhwpz3tqse6W5jk6Kmt0Mjka
 rUblLiMhqe/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="211695200"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="211695200"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 09:52:26 -0700
IronPort-SDR: yvrYmqKRmgb3daAF8TA4Yd1Pyh0ktR/XLawZUDQRuasQUP5ETGvw2mwW/Op5/gk3LlUuo1VtIg
 uL7Fxozk2f4w==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="455168903"
Received: from dsapozni-mobl1.amr.corp.intel.com (HELO [10.251.16.243])
 ([10.251.16.243])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 09:52:25 -0700
Subject: Re: [PATCH 8/9] soundwire: intel: add wake interrupt support
To: Vinod Koul <vkoul@kernel.org>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-9-yung-chuan.liao@linux.intel.com>
 <20200630165126.GT2599@vkoul-mobl>
 <a69aa5d0-613a-6ef6-9263-378b1e99770a@linux.intel.com>
 <20200701055654.GW2599@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <81a33798-0667-9a4f-9916-eb157ad5514d@linux.intel.com>
Date: Wed, 1 Jul 2020 10:25:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200701055654.GW2599@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 hui.wang@canonical.com, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 rander.wang@linux.intel.com, bard.liao@intel.com
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


>>>> +	 * wake up master and slave so that slave can notify master
>>>> +	 * the wakeen event and let codec driver check codec status
>>>> +	 */
>>>> +	list_for_each_entry(slave, &bus->slaves, node) {
>>>> +		/*
>>>> +		 * discard devices that are defined in ACPI tables but
>>>> +		 * not physically present and devices that cannot
>>>> +		 * generate wakes
>>>> +		 */
>>>> +		if (slave->dev_num_sticky && slave->prop.wake_capable)
>>>> +			pm_request_resume(&slave->dev);
>>>
>>> Hmmm, shouldn't slave do this? would it not make sense to notify the
>>> slave thru callback and then slave decides to resume or not..?
>>
>> In this mode, the bus is clock-stop mode, and events are detected with level
>> detector tied to PCI events. The master and slave devices are all in
>> pm_runtime suspended states. The codec cannot make any decisions on its own
>> since the bus is stopped, it needs to first resume, which assumes that the
>> master resumes first and the enumeration re-done before it can access any of
>> its registers.
>>
>> By looping through the list of devices that can generate events, you end-up
>> first forcing the master to resume, and then each slave resumes and can
>> check who generated the event and what happened while suspended. if the
>> codec didn't generate the event it will go back to suspended mode after the
>> usual timeout.
>>
>> We can add a callback but that callback would only be used for Intel
>> solutions, but internally it would only do a pm_request_resume() since the
>> codec cannot make any decisions before first resuming. In other words, it
>> would be an Intel-specific callback that is implemented using generic resume
>> operations. It's probably better to keep this in Intel-specific code, no?
> 
> I do not like the idea that a device would be woken up, that kind of
> defeats the whole idea behind the runtime pm. Waking up a device to
> check the events is a generic sdw concept, I don't see that as Intel
> specific one.

In this case, this in an Intel-specific mode that's beyond what MIPI 
defined. This is not the traditional in-band SoundWire wake defined in 
the SoundWire specification. The bus is completely down, the master IP 
is powered-off and all context lost. There is still the ability for a 
Slave device to throw a wake as defined by MIPI in clock-stop-mode1, but 
this is handled with a separate level detector and the wake detection is 
handled by the PCI subsystem. On a wake, the master IP needs to be 
powered-up, the entire bus needs to be restarted and the Slave devices 
re-enumerated.

We trigger that sequence with a loop that calls pm_request_resume() for 
all Slave devices that are present and exposed in their properties that 
they are wake-capable. As you rightly said in your comments, this will 
result a nice wake-up handled by the pm_runtime framework in the right 
sequence (DSP first, then SoundWire master then Slave devices).

You will see in follow-up patches that the master IP can be configured 
in different clock stop modes, depending on the needs (power/latency 
compromise typically). When the more traditional SoundWire wake is used, 
we do not use this sequence at all.

> I would like to see a generic callback for the devices and let devices
> do the resume part, that is standard operating principle when we deal
> with suspended devices. If the device thinks they need to resume, they
> will do the runtime resume, check the status and sleep if not
> applicable. Since we have set the parents correctly, any resume
> operation for slaves would wake master up as well...
> 
> I do not see a need for intel driver to resume slave devices here, or
> did I miss something?

Yes, the part "If the device thinks they need to resume" is not quite 
right. The Slave device cannot access its registers before fully 
resuming, which in this case means a re-enumeration, so cannot "think" 
or make a decision on its own. That's the reason why we force them to 
resume, since it's the first step they would need to do anyways, and 
then if they don't have anything to do they go back to idle after a 
timeout. I invite you to see the suspend/resume sequences in codec 
drivers where you will see regmap access moves to cache-only on suspend 
and full access restored on resume, along with a hardware sync.

I see your point and I really think we are talking about a similar 
sequence, but we simplified your idea since there's no possibility of 
making a decision before Slave devices resume.

The only optimization we did here is that we only resume Slave devices 
than can generate a wake, and filter out the 'ghost' devices that are 
described in ACPI tables but don't physically exist.

Does this help?


