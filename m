Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2567512500E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 19:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD02685D;
	Wed, 18 Dec 2019 19:03:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD02685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576692240;
	bh=wrU01rGMRfJG3PpJqFb+II6wVIloZvYpTX/Pz5BSdDs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KjQvGuZEMwOlgsZ89qa+7XOsiVvwVfLqqlqn/h7HtUpCwm2m1g/V9v/UdnzISA+NR
	 la+d48IuGi2LJWa9TgfRVFi+N/XzUQODLncoPPh8qGsoppfaBFHBO6EwI/86P4buah
	 Rl1FJFtTsE4/+K+GqcfggYkveuzXTfSbsCdsc95w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 232E7F8015A;
	Wed, 18 Dec 2019 19:02:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E51CBF8015A; Wed, 18 Dec 2019 19:02:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 444F9F8015A
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 19:02:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 444F9F8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 10:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="415912266"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243])
 ([10.251.3.243])
 by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 10:02:06 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20191126141423.21523-1-pierre-louis.bossart@linux.intel.com>
 <s5h4kyqzpge.wl-tiwai@suse.de>
 <0131b134-46dc-991f-230b-fe843f43f078@linux.intel.com>
 <s5hd0cm16vf.wl-tiwai@suse.de>
 <f442ed39-1a86-28fb-b42c-b0e5273cd79a@linux.intel.com>
 <s5hbls57g43.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a90e86ce-b468-28b2-f0a8-30f66429d921@linux.intel.com>
Date: Wed, 18 Dec 2019 10:42:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <s5hbls57g43.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: add PCI ID for
	CometLake-S
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



On 12/18/19 10:28 AM, Takashi Iwai wrote:
> On Wed, 18 Dec 2019 16:21:22 +0100,
> Pierre-Louis Bossart wrote:
>>
>>>>> Also, can we reduce even the ifdef around sof_dev_desc definitions by
>>>>> __maybe_unused atttribute?
>>>>
>>>> Sorry, I am not following your suggestion. I would really like to keep
>>>> the ifdefs for now, and while it can be seen as overkill to have
>>>> descriptors that are identical in some cases the past experience shows
>>>> it's useful when we have to add quirks for specific 'hardware
>>>> recommended programming sequences'.
>>>
>>> What I suggested was simple, just dropping ifdef by something like
>>>
>>> diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
>>> index bbeffd932de7..297632a54f1b 100644
>>> --- a/sound/soc/sof/sof-pci-dev.c
>>> +++ b/sound/soc/sof/sof-pci-dev.c
>>> @@ -36,8 +36,7 @@ MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
>>>      #define SOF_PCI_DISABLE_PM_RUNTIME BIT(0)
>>>    -#if IS_ENABLED(CONFIG_SND_SOC_SOF_APOLLOLAKE)
>>> -static const struct sof_dev_desc bxt_desc = {
>>> +static const struct sof_dev_desc __maybe_unused bxt_desc = {
>>>    	.machines		= snd_soc_acpi_intel_bxt_machines,
>>>    	.resindex_lpe_base	= 0,
>>>    	.resindex_pcicfg_base	= -1,
>>> @@ -52,10 +51,8 @@ static const struct sof_dev_desc bxt_desc = {
>>>    	.ops = &sof_apl_ops,
>>>    	.arch_ops = &sof_xtensa_arch_ops
>>>    };
>>> -#endif
>>>    -#if IS_ENABLED(CONFIG_SND_SOC_SOF_GEMINILAKE)
>>> -static const struct sof_dev_desc glk_desc = {
>>> +static const struct sof_dev_desc __maybe_unused glk_desc = {
>>>    	.machines		= snd_soc_acpi_intel_glk_machines,
>>>    	.resindex_lpe_base	= 0,
>>>    	.resindex_pcicfg_base	= -1,
>>> @@ -70,10 +67,8 @@ static const struct sof_dev_desc glk_desc = {
>>>    	.ops = &sof_apl_ops,
>>>    	.arch_ops = &sof_xtensa_arch_ops
>>>    };
>>> -#endif
>>> .....
>>>    
>>>
>>> Then the issue I pointed above can be solved as well.
>>
>> The ifdefs are still needed in the PCI IDs tables
> 
> Yes, but it halves the messes :)

I wish it was true :-)

In reality having buildbots play with kconfig options does help identify 
issues at the code level, just like the namespace use helped identify 
the .arch_ops just above did not belong here.
I find it's a constant battle to avoid accumulated crud in the wrong 
places when dealing with multiple platforms, and when looking at patches 
it's very hard (at least for me) to realize where the code gets added 
and the implications.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
