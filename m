Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 850459D65C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 21:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03B8516BB;
	Mon, 26 Aug 2019 21:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03B8516BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566847267;
	bh=4G8aUtop9z1GAxqPK6XpfVYC033niOGaLLQVatKCeQ4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2xltExBESZNrcRCM+L3070AFjO5CS3tQ+dQrj5uJmKGe0SEIj+z7Zp4ogMgdYdVR
	 y+2XZ/fydWfLpNitsG1Pbo+D4Pnnx+g/WpOGQwEhBXa9Y0wJl0VGbzcKzPMtlJ/kyY
	 2tbKRqo2zjjEs739UxLpsXYcXOr319H0H335YuMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC738F80377;
	Mon, 26 Aug 2019 21:19:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68C7EF80376; Mon, 26 Aug 2019 21:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B56D0F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 21:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B56D0F8014A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 12:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="331576463"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.26.150])
 ([10.252.26.150])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2019 12:18:46 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-28-cezary.rojewski@intel.com>
 <6369d711-8eb2-2664-412b-3de286bb3ca8@linux.intel.com>
 <29c6bb0d-c236-a6c7-9a59-efb7ec42e145@intel.com>
 <12a90456-b8a0-adc3-755a-cfee3124f177@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <c7bca384-9a2f-38e9-d097-69f3142b629d@intel.com>
Date: Mon, 26 Aug 2019 21:18:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12a90456-b8a0-adc3-755a-cfee3124f177@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 27/35] ASoC: Intel: Skylake: Define
 platform descriptors
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

On 2019-08-26 19:13, Pierre-Louis Bossart wrote:
> 
> 
> On 8/24/19 5:51 AM, Cezary Rojewski wrote:
>> On 2019-08-23 21:50, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 8/22/19 2:04 PM, Cezary Rojewski wrote:
>>>> Make use of sst_pdata and declare platform descriptors for all existing
>>>> cAVS platforms. Each carries information about base_fw filename,
>>>> platform specific operations and boards supported.
>>>
>>> if you use a constant base_fw name that cannot be made board-specific 
>>> for specific usages, you will restrict the ability to deal with 
>>> quirks and custom cases.
>>>
>>> real-life example: not so long ago there were two SST firmwares for 
>>> 'regular' solutions and ultra-low-latency ones, so by having a single 
>>> name for all APL-based platforms you will generate issues that don't 
>>> exist today, or you will force users to patch something in the core.
>>>
>>
>> I did not bring up ULL case for a reason. Guess Pandora box is to be 
>> opened.. so be it.
>>
>> ULL stands for Ultra Low Latency and it can be described by the 
>> following:
>> - exists only for APL based platforms (more like single platform/ 
>> model though)
>> - in consequence, binary isn't present on any other FW branch and any 
>> other platform apart from APL
>> - its existence is tied to hardware.. eh.. let's call it a "limitation"
>> - number of actual vendors is too Ultra Low..
>> - has limited functionality and validation
>> - is not the recommended FW for end users in any case
>> - binary is not going to be upstreamed
>> - reference board is not going to be upstreamed
>> - generic (so called main FW) and ULL share the board ACPI ID and thus 
>> require kernel .config to be modified -or- blacklist.conf with be updated
>> - shares topology filename with generic (main) FW so user still has to 
>> modify his /lib/firmware. Topology names are currently NHLT-based, 
>> built from NHLT header data and platform id which are BIOS/ ABL and 
>> platform specific respectively
>> (...)
> 
> I would describe your answer as 'whatabout-ism'. Yes there are plenty of 
> ways to screw-up, none of them is a justification for assuming that a 
> single filename will work for everyone.
> 
> There are also plenty of good reasons to use a different fw and topology 
> file name. Taking this capability away essentially corners users into 
> non-upstreamed custom versions.

There is no "different filename" for /skylake topology on upstream, only fw.

> 
>> TLDR:
>> There is total of 0 people sitting in front of their monitors who are 
>> consciously going to make use of ULL firmware.
>> Any user that is going to, will have to play with their kconfig, 
>> blacklist and replace existing topology file.
> 
> that's where you are making too many assumptions, if quirks and dynamic 
> detection capabilities are provided then it's possible to have a single 
> kernel build that will deal with multiple configurations.
> 
>> This is normally done by titanic build-bot which, among billion other 
>> things, ensures /lib/firmware looks like it should given the 
>> configuration.
>>
>> -
>>
>> So, one could have provided a nice choice-box within menuconfig to 
>> ensure only one board can be chosen.
>> When one does it, one realizes both generic and ULL firmwares are not 
>> actually tied to any specific board and with more boards (usecases) 
>> and more kconfigs code gets bloated.
>>
>> Moving further, guarding apl_desc with #if-else depending on some 
>> global generic-vs-ULL configuration which would adjust said 
>> descriptors with proper FW filename actually seems like a better 
>> solution..
>>
>> ..and then kBOOM comes in and actual design pattern!
>> Board should have been stated tplg_filename, not the fw_filename. Said 
>> topology file contains manifest which tells host what libraries to 
>> load. And thus, we clear the mist and see that one single field (which 
>> is currently missing in snd_soc_acpi_mach) and some clever topology 
>> manifest make it all happen: platform-board conflicts cease to exist.
> 
> I am not going to argue further. I've spent a lot of time making sure 
> the same kernel build can be used across multiple platforms, if you want 
> to stick to static custom configurations I am not interested in 
> debating. I just hope your team has enough support folks to deal with 
> all these configurations.
> 

Not arguing at all, just stating the facts.
Idea behind is rather straightforward and my guess it that either you 
missed the key part -or- my explanations were lackluster.
We do want kernel to support multiple configurations dynamically. Same 
goes for allowing for customizations, depending on board chosen. 
Although, we think topology alone is more than enough.

Existing mach::fw_filename and single tplg file based on data provided 
from NHLT (function: skl_nhlt_update_topology_bin skl-nhlt.c) already 
fails us. What is present on upstream is not sufficient and thus 
build-bots are doing more than they are supposed to.

Let uss checkout sof machine fields:
- sof_fw_filename
- sof_tplg_filename

and then again, the skl one(s):
- fw_filename

Is the difference clear now?
The key player here is topology file name. Once you tie board with 
topology you have more than enough customization to do whatever you 
want. As said, clever usage of topology may even allow you to skip 
fw_filename entirely. And this is the exact opposite of static 
configuration.

In my opinion, SOF needs sof_fw_filename neither.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
