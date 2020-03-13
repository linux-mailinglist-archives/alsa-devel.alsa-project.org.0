Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A72184DAF
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 18:33:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 778AC183B;
	Fri, 13 Mar 2020 18:32:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 778AC183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584120788;
	bh=R445uaEAuQbMAK3MuWnr7zpVPbK1OJD6XJJWY4hMNu8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o1gsgPT+WdzBRuNh2XgEE/ICVGjvonyrBJJtxuo+1XQJhYDJf+h+0xZC9bQPWOY9J
	 w7P91ko3juHVsEIq9JQUrJWm3IT0aFEQTP4pRLoPrVhlUXLQ08AfUGzrdDWM3FtgDH
	 VaRM3qFu0O3JZktH5fxo7xnEXOr8jAWaVlJ/Q9UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D863DF802BC;
	Fri, 13 Mar 2020 18:29:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85BC4F802BD; Fri, 13 Mar 2020 18:29:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3A7F802A8
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 18:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3A7F802A8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 10:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="237017256"
Received: from sblancoa-mobl.amr.corp.intel.com (HELO [10.251.232.239])
 ([10.251.232.239])
 by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2020 10:28:49 -0700
Subject: Re: [PATCH 1/8] soundwire: bus_type: add master_device/driver support
To: Vinod Koul <vkoul@kernel.org>
References: <20200303054136.GP4148@vkoul-mobl>
 <8a04eda6-cbcf-582f-c229-5d6e4557344b@linux.intel.com>
 <20200304095312.GT4148@vkoul-mobl>
 <05dbe43c-abf8-9d5a-d808-35bf4defe4ba@linux.intel.com>
 <20200305063646.GW4148@vkoul-mobl>
 <eb30ac49-788f-b856-6fcf-84ae580eb3c8@linux.intel.com>
 <20200306050115.GC4148@vkoul-mobl>
 <4fabb135-6fbb-106f-44fd-8155ea716c00@linux.intel.com>
 <20200311063645.GH4885@vkoul-mobl>
 <0fafb567-10e5-a1ea-4a6d-b3c53afb215e@linux.intel.com>
 <20200313115011.GD4885@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4cb16467-87d0-ef99-e471-9eafa9e669d2@linux.intel.com>
Date: Fri, 13 Mar 2020 11:54:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313115011.GD4885@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


>>>> the ASoC layer does require a driver with a 'name' for the components
>>>> registered with the master device. So if you don't have a driver for the
>>>> master device, the DAIs will be associated with the PCI device.
>>>>
>>>> But the ASoC core does make pm_runtime calls on its own,
>>>>
>>>> soc_pcm_open(struct snd_pcm_substream *substream)
>>>> {
>>>> ...
>>>> 	for_each_rtd_components(rtd, i, component)
>>>> 		pm_runtime_get_sync(component->dev);
>>>>
>>>> and if the device that's associated with the DAI is the PCI device, then
>>>> that will not result in the relevant master IP being activated, only the PCI
>>>> device refcount will be increased - meaning there is no hook that would tell
>>>> the PCI layer to turn on a specific link.
>>>>
>>>> What you are recommending would be an all-or-nothing solution with all links
>>>> on or all links off, which beats the purpose of having independent
>>>> link-level power management.
>>>
>>> Why can't you use dai .startup callback for this?
>>>
>>> The ASoC core will do pm_runtime calls that will ensure PCI device is
>>> up, DSP firmware downloaded and running.
>>>
>>> You can use .startup() to turn on your link and .shutdown to turn off
>>> the link.
>>
>> There are multiple dais per link, and multiple Slave per link, so we would
>> have to refcount and track active dais to understand when the link needs to
>> be turned on/off. It's a duplication of what the pm framework can do at the
>> device/link level, and will likely introduce race conditions.
>>
>> Not to mention that we'd need to introduce workqueues to turn the link off
>> with a delay, with pm_runtime_put_autosuspend() does for free.
> 
> Yes sure, that seems to be the cost unfortunately. While it might feel I
> am blocking but the real block here is the hw design which gives you a
> monolith whereas it should have been different devices. If you have a
> 'device' for sdw or a standalone controller we would not be debating
> this..

The hardware is what it is. The ACPI spec is what it is.

I am just pragmatic and making platforms work with that's available 
*today*, and I don't have time or interest in revisiting what might have 
been.

>> Linux is all about frameworks. For power management, we shall use the power
>> management framework, not reinvent it.
> 
> This reminds me, please talk to Mika and Rafael, they had similar
> problems with lpss etc and IIRC they were working on splices to solve
> this.. Its been some time (few years now) so maybe they have a
> solution..

We've been discussing this since October, I don't really have any 
appetite for looking into new concepts when the existing framework just 
does what we need.

It's really down to your objection to the use of 'struct driver'... For 
ASoC support we only need the .name and .pm_ops, so there's really no 
possible path forward otherwise.

Like I said, we have 3 options

a) stay with platform devices for now. You will need to have a 
conversation with Greg on this.

b) use a minimal sdw_master_device with a minimal 'struct driver' use.

c) use a more elaborate solution suggested in this patchset and yes that 
means the Qualcomm driver would need to change a bit.

Pick one or suggest something that is implementable. The first version 
of the patches was provided in October, the last RFC was provided on 
January 31, time's up. At the moment you are preventing ASoC integration 
from moving forward.

Thanks
-Pierre
