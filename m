Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D87969D8DD
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 00:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DCF1166F;
	Tue, 27 Aug 2019 00:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DCF1166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566857580;
	bh=6hinWsJWxeXKqD9tHiaXXlVeCfqjXare5XJHMDsaog4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A9rrfTfppvNnvG+UdDdJHTGBUmg8CE7JZia/SAavGeclKCjcOa0AzWbwF+VlACVT1
	 J33L9L91EW9Nba0qB4oBd6ybsD0UoSzBO676pLXhjJvKMApX0CJP1EaOAYmLdVE0sP
	 eYyDnfrsBzXvUStQWNtw/DOyuRWNi3o8No3F1DAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0BFF80362;
	Tue, 27 Aug 2019 00:11:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50226F80376; Mon, 26 Aug 2019 23:59:38 +0200 (CEST)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D13F801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 23:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D13F801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 14:53:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="187724189"
Received: from tyajima-mobl.gar.corp.intel.com (HELO [10.251.21.153])
 ([10.251.21.153])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 14:53:19 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-28-cezary.rojewski@intel.com>
 <6369d711-8eb2-2664-412b-3de286bb3ca8@linux.intel.com>
 <29c6bb0d-c236-a6c7-9a59-efb7ec42e145@intel.com>
 <12a90456-b8a0-adc3-755a-cfee3124f177@linux.intel.com>
 <c7bca384-9a2f-38e9-d097-69f3142b629d@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6c9e25df-ea52-6e1b-dae9-d5d6f1b51750@linux.intel.com>
Date: Mon, 26 Aug 2019 16:53:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c7bca384-9a2f-38e9-d097-69f3142b629d@intel.com>
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



On 8/26/19 2:18 PM, Cezary Rojewski wrote:
> On 2019-08-26 19:13, Pierre-Louis Bossart wrote:
>>
>>
>> On 8/24/19 5:51 AM, Cezary Rojewski wrote:
>>> On 2019-08-23 21:50, Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>> On 8/22/19 2:04 PM, Cezary Rojewski wrote:
>>>>> Make use of sst_pdata and declare platform descriptors for all 
>>>>> existing
>>>>> cAVS platforms. Each carries information about base_fw filename,
>>>>> platform specific operations and boards supported.
>>>>
>>>> if you use a constant base_fw name that cannot be made 
>>>> board-specific for specific usages, you will restrict the ability to 
>>>> deal with quirks and custom cases.
>>>>
>>>> real-life example: not so long ago there were two SST firmwares for 
>>>> 'regular' solutions and ultra-low-latency ones, so by having a 
>>>> single name for all APL-based platforms you will generate issues 
>>>> that don't exist today, or you will force users to patch something 
>>>> in the core.
>>>>
>>>
>>> I did not bring up ULL case for a reason. Guess Pandora box is to be 
>>> opened.. so be it.
>>>
>>> ULL stands for Ultra Low Latency and it can be described by the 
>>> following:
>>> - exists only for APL based platforms (more like single platform/ 
>>> model though)
>>> - in consequence, binary isn't present on any other FW branch and any 
>>> other platform apart from APL
>>> - its existence is tied to hardware.. eh.. let's call it a "limitation"
>>> - number of actual vendors is too Ultra Low..
>>> - has limited functionality and validation
>>> - is not the recommended FW for end users in any case
>>> - binary is not going to be upstreamed
>>> - reference board is not going to be upstreamed
>>> - generic (so called main FW) and ULL share the board ACPI ID and 
>>> thus require kernel .config to be modified -or- blacklist.conf with 
>>> be updated
>>> - shares topology filename with generic (main) FW so user still has 
>>> to modify his /lib/firmware. Topology names are currently NHLT-based, 
>>> built from NHLT header data and platform id which are BIOS/ ABL and 
>>> platform specific respectively
>>> (...)
>>
>> I would describe your answer as 'whatabout-ism'. Yes there are plenty 
>> of ways to screw-up, none of them is a justification for assuming that 
>> a single filename will work for everyone.
>>
>> There are also plenty of good reasons to use a different fw and 
>> topology file name. Taking this capability away essentially corners 
>> users into non-upstreamed custom versions.
> 
> There is no "different filename" for /skylake topology on upstream, only 
> fw.

I don't know why we would restrict the discussion to what has been 
upstreamed. This is a fundamental capability that will impact 
non-upstreamed configurations as well.

> 
>>
>>> TLDR:
>>> There is total of 0 people sitting in front of their monitors who are 
>>> consciously going to make use of ULL firmware.
>>> Any user that is going to, will have to play with their kconfig, 
>>> blacklist and replace existing topology file.
>>
>> that's where you are making too many assumptions, if quirks and 
>> dynamic detection capabilities are provided then it's possible to have 
>> a single kernel build that will deal with multiple configurations.
>>
>>> This is normally done by titanic build-bot which, among billion other 
>>> things, ensures /lib/firmware looks like it should given the 
>>> configuration.
>>>
>>> -
>>>
>>> So, one could have provided a nice choice-box within menuconfig to 
>>> ensure only one board can be chosen.
>>> When one does it, one realizes both generic and ULL firmwares are not 
>>> actually tied to any specific board and with more boards (usecases) 
>>> and more kconfigs code gets bloated.
>>>
>>> Moving further, guarding apl_desc with #if-else depending on some 
>>> global generic-vs-ULL configuration which would adjust said 
>>> descriptors with proper FW filename actually seems like a better 
>>> solution..
>>>
>>> ..and then kBOOM comes in and actual design pattern!
>>> Board should have been stated tplg_filename, not the fw_filename. 
>>> Said topology file contains manifest which tells host what libraries 
>>> to load. And thus, we clear the mist and see that one single field 
>>> (which is currently missing in snd_soc_acpi_mach) and some clever 
>>> topology manifest make it all happen: platform-board conflicts cease 
>>> to exist.
>>
>> I am not going to argue further. I've spent a lot of time making sure 
>> the same kernel build can be used across multiple platforms, if you 
>> want to stick to static custom configurations I am not interested in 
>> debating. I just hope your team has enough support folks to deal with 
>> all these configurations.
>>
> 
> Not arguing at all, just stating the facts.
> Idea behind is rather straightforward and my guess it that either you 
> missed the key part -or- my explanations were lackluster.
> We do want kernel to support multiple configurations dynamically. Same 
> goes for allowing for customizations, depending on board chosen. 
> Although, we think topology alone is more than enough.

I am having a hard time on this one. Most quirks are ACPI or DMI based, 
and assuming that the topology magically tells you about the right 
information is a leap of faith that I am not ready to take.

The complexity of the tools and skillset needed to generate a functional 
topology are several orders of magnitude larger than changing a file 
name in a C structure. Even for SOF, the topology is the source of many 
errors, and it feels a lot safer to keep a quirk mechanism that anyone 
can understand rather than assuming that everyone can generate a new 
topology file. There are fewer than 10 people on this planet who 
understand the alsa topology layers in depth, and I don't count myself 
in that lot...

Also for new platforms it's quite common that the tools are delivered 
sometime after power-on steps, so in the initial steps people in the 
trenches make the system work with a topology that was used on a 
previous silicon generation. Tying hardware-related debug and 
topology-related debug is not recommended.

> Existing mach::fw_filename and single tplg file based on data provided 
> from NHLT (function: skl_nhlt_update_topology_bin skl-nhlt.c) already 
> fails us. What is present on upstream is not sufficient and thus 
> build-bots are doing more than they are supposed to.
> 
> Let uss checkout sof machine fields:
> - sof_fw_filename
> - sof_tplg_filename
> 
> and then again, the skl one(s):
> - fw_filename
> 
> Is the difference clear now?
> The key player here is topology file name. Once you tie board with 
> topology you have more than enough customization to do whatever you 
> want. As said, clever usage of topology may even allow you to skip 
> fw_filename entirely. And this is the exact opposite of static 
> configuration.

Except that the boot flow is to first try to boot the DSP with a 
firmware file, then work on topology-related configurations. You would 
be adding a new step that is not desirable in all cases, e.g when you 
care about boot time.

It's also not necessary simpler to base your solution on topology. We 
have tons of topology configurations that are exactly the same for 
different devices, so it's useful to avoid bundling the firmware name 
inside of the topology file.

> In my opinion, SOF needs sof_fw_filename neither.

we will definitely keep the ability to add board-specific quirks. It's 
very useful for e.g. derivatives and experimental cases, e.g. A/B 
testing with one firmware selected with one ACPI ID and another firmware 
selected with another ACPI ID, without mucking with the topology.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
