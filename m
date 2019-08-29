Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDE0A20D2
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 18:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E079D16A9;
	Thu, 29 Aug 2019 18:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E079D16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567095864;
	bh=S1cyS2mZWR2t9YbPYPZK+r0m8BSo8i05mO89mhZxMVI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KrRWfFLDtOD8y47sT7lEaiT/LrstillCs03xqHJHisGhUN5gdvS0rAHgKXJfZmQuy
	 wJYUlcFAL3UrJFzij3WoJrCN++PjYTG7HoZkLU27xsD8ee5wHaIT5nbwT+evzGufcs
	 Ttibz7noerz8VaKBkCBw1pKrhBCnmODIlDQ8IFlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08365F80148;
	Thu, 29 Aug 2019 18:22:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6755EF80148; Thu, 29 Aug 2019 18:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6418FF80096
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 18:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6418FF80096
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 09:22:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,444,1559545200"; d="scan'208";a="205787728"
Received: from mbmcwil3-mobl.amr.corp.intel.com (HELO [10.252.203.249])
 ([10.252.203.249])
 by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2019 09:22:29 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190828034012.sBvm81sYK%akpm@linux-foundation.org>
 <274054ef-8611-2661-9e67-4aabae5a7728@infradead.org>
 <5ac8a7a7-a9b4-89a5-e0a6-7c97ec1fabc6@linux.intel.com>
 <98ada795-4700-7fcc-6d14-fcc1ab25d509@infradead.org>
 <f0a62b08-cba9-d944-5792-8eac0ea39df1@linux.intel.com>
 <19edfb9a-f7b3-7a89-db5a-33289559aeef@linux.intel.com>
 <s5hzhjs102i.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c7c8fcde-40c7-8025-9fa7-e7e0daa8770c@linux.intel.com>
Date: Thu, 29 Aug 2019 11:22:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hzhjs102i.wl-tiwai@suse.de>
Content-Language: en-US
Cc: sfr@canb.auug.org.au,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 mm-commits@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, mhocko@suse.cz, linux-mm@kvack.org,
 broonie@kernel.org, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org
Subject: Re: [alsa-devel] mmotm 2019-08-27-20-39 uploaded
 (sound/hda/intel-nhlt.c)
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



On 8/29/19 10:08 AM, Takashi Iwai wrote:
> On Thu, 29 Aug 2019 00:45:05 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>>>> I just checked with Mark Brown's for-next tree
>>>>> 8aceffa09b4b9867153bfe0ff6f40517240cee12
>>>>> and things are fine in i386 mode, see below.
>>>>>
>>>>> next-20190828 also works fine for me in i386 mode.
>>>>>
>>>>> if you can point me to a tree and configuration that don't work
>>>>> I'll look into this, I'd need more info to progress.
>>>>
>>>> Please try the attached randconfig file.
>>>>
>>>> Thanks for looking.
>>>
>>> Ack, I see some errors as well with this config. Likely a missing
>>> dependency somewhere, working on this now.
>>
>> My bad, I added a fallback with static inline functions in the .h file
>> when ACPI is not defined, but the .c file was still compiled.
>>
>> The diff below makes next-20190828 compile with Randy's config.
> 
> IMO, we need to fix the site that enables this config.  i.e.
> the "select SND_INTEL_NHLT" must be always conditional, e.g.
> 	select SND_INTEL_NHLT if ACPI

that would be nicer indeed, currently we don't have a consistent solution:
sound/pci/hda/Kconfig:  select SND_INTEL_NHLT if ACPI
sound/soc/intel/Kconfig:        select SND_INTEL_NHLT
sound/soc/sof/intel/Kconfig:    select SND_INTEL_NHLT

I can't recall why things are different, will send a patch to align.


> 
>> It looks like the alsa-devel server is down btw?
> 
> Now it seems starting again.
> 
> 
> thanks,
> 
> Takashi
> 
>> diff --git a/sound/hda/Makefile b/sound/hda/Makefile
>> index 8560f6ef1b19..b3af071ce06b 100644
>> --- a/sound/hda/Makefile
>> +++ b/sound/hda/Makefile
>> @@ -14,5 +14,7 @@ obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
>>   #extended hda
>>   obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
>>
>> +ifdef CONFIG_ACPI
>>   snd-intel-nhlt-objs := intel-nhlt.o
>>   obj-$(CONFIG_SND_INTEL_NHLT) += snd-intel-nhlt.o
>> +endif
>>
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
