Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEBB70066
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 15:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86AD217E7;
	Mon, 22 Jul 2019 15:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86AD217E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800452;
	bh=t4fTT9pPuklWrGqINYmU+HFy93LbanYKEoxPjgwUafM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XeRAIreGz2m6YPGLHMRlLae7BuZIG5Kw16/72PvRKMMCLJRyazerzgTneruh5v+D5
	 FLLvi+9l+dQJesjwdxlIaieodvWwJnW0RJOCSQFvJUXcj4wGBJu2f9Q10erBESGUkb
	 5SA2kD7GBpxAGRhFV85LltbDQMizrrxoOI59ppdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC017F80482;
	Mon, 22 Jul 2019 14:58:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7B40F800E8; Mon, 22 Jul 2019 14:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4799F803D6
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4799F803D6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 05:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="252897013"
Received: from sthiaga1-mobl1.amr.corp.intel.com (HELO [10.254.191.222])
 ([10.254.191.222])
 by orsmga001.jf.intel.com with ESMTP; 22 Jul 2019 05:58:44 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190719203752.11151-1-pierre-louis.bossart@linux.intel.com>
 <20190719203752.11151-3-pierre-louis.bossart@linux.intel.com>
 <daaa01dc-d963-f215-90b1-132fde8e489a@intel.com>
 <s5h7e8aa1qs.wl-tiwai@suse.de>
 <97359d3a-a3a0-696a-3d3f-64bd608eea5f@linux.intel.com>
 <s5hsgqy8dc2.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a82b57ba-b606-3e2c-476e-95ecea66e030@linux.intel.com>
Date: Mon, 22 Jul 2019 07:58:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hsgqy8dc2.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 Daniel Drake <drake@endlessm.com>, Hui Wang <hui.wang@canonical.com>,
 broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/5] ALSA: hda: move parts of NHLT code
 to new module
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



On 7/22/19 7:26 AM, Takashi Iwai wrote:
> On Mon, 22 Jul 2019 14:14:28 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>> On 7/22/19 3:54 AM, Takashi Iwai wrote:
>>> On Sat, 20 Jul 2019 23:06:46 +0200,
>>> Cezary Rojewski wrote:
>>>>
>>>>> --- a/sound/hda/Kconfig
>>>>> +++ b/sound/hda/Kconfig
>>>>> @@ -29,3 +29,6 @@ config SND_HDA_PREALLOC_SIZE
>>>>>       	  Note that the pre-allocation size can be changed dynamically
>>>>>     	  via a proc file (/proc/asound/card*/pcm*/sub*/prealloc), too.
>>>>> +
>>>>> +config SND_INTEL_NHLT
>>>>> +	tristate
>>>>
>>>> If above is true, "depends on ACPI" would be expected.
>>>
>>> This won't fix things in practice as the Kconfig reverse selection
>>> ignores the dependencies of the selected item.  It'd be as a help for
>>> readers, though.
>>
>> There is a fallback if ACPI is not defined, so the code would always
>> compile. Configurations which select SND_INTEL_NHLT already depend on
>> ACPI.
> 
> IIUC, the question above came from the point:
> 
>   #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
>   ....
>   #else
>   ....
>   #endif
> 
> and here Cezary suggested to drop IS_ENABLED(CONFIG_ACPI) *iff* the
> dependency can be assured in Kconfig side.  But for that assurance,
> putting "depends on ACPI" in config SND_INTEL_NHLT block won't
> suffice; that was my followup.
> 
> So, as of the current code, we can drop IS_ENABLED(CONFIG_ACPI) from
> the ifdef above, yes.  But the dependency is no rock solid at this
> point, so either some comments or keeping the extra ifdef like the
> above would be needed, IMO.

this extra ifdef is a bit overkill, I added it to make sure that the 
fallbacks are used in nonsensical configurations w/ randconfig. In 
practice, all Intel drivers already depend on ACPI and for the legacy we 
already have:

select SND_INTEL_NHLT if ACPI

Not sure if we need to do anything more.

> 
> 
> thanks,
> 
> Takashi
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
