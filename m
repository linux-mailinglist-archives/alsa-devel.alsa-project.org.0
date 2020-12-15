Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453482DB26F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 18:22:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C16CB1809;
	Tue, 15 Dec 2020 18:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C16CB1809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608052968;
	bh=zcP20XvzAYIrJVQhyABHAz8uufR9eLoVvxyg5HEI8mw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6e3JT78Wx2zhkF4tz6V3xXVKg3TTBIMXJxkubV6eZH0P1V8Igczg8fj07ceI8yAc
	 qeF/sdwRmiEvm7GG3flrwOOHwgCbT5HarGrKHsDjhwR/kFktK+MUzCYzfraDnDqzOE
	 LcelNRHu9HWAn93ByxjIm2LJxtu1WbssJ8nj7zFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D214F804AC;
	Tue, 15 Dec 2020 18:21:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEF49F80278; Tue, 15 Dec 2020 18:21:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C52F80129;
 Tue, 15 Dec 2020 18:21:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C52F80129
IronPort-SDR: f8LmMcvzNAyhdLLY+juLoOA8E9mOKwUuPX2HUfKwcHrEMM2PeZ6No6zsKbfTLD2xPFbbvSoeUU
 eVw1eRuKgc5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="239015731"
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="239015731"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 09:21:21 -0800
IronPort-SDR: LLx5xR8or0KcqboAg1F02tn18JvyBaceXqYH4XdOGgx9n4+tpWBKCSnNU16GqGEaJcThjHHBUO
 tnTaflLqNtRw==
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="383687157"
Received: from yikrimon-mobl1.amr.corp.intel.com (HELO [10.213.173.225])
 ([10.213.173.225])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 09:21:20 -0800
Subject: Re: [Sound-open-firmware] SoF support for 8086:9d71?
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
 <J74DLQ.CON4PD1O51YN@canonical.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <47ec2533-584c-d7f3-4489-e3a043e658e1@linux.intel.com>
Date: Tue, 15 Dec 2020 11:21:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <J74DLQ.CON4PD1O51YN@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: SOUND <alsa-devel@alsa-project.org>, sound-open-firmware@alsa-project.org
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



On 12/14/20 9:54 PM, Kai-Heng Feng wrote:
> 
> 
> On Mon, Dec 14, 2020 at 13:33, Pierre-Louis Bossart 
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>> On more recent kernels legacy HDA stops working for device 8086:9d71:
>>> [   47.211381] snd_hda_intel 0000:00:1f.3: DSP detected with PCI 
>>> class/subclass/prog-if info 0x040100
>>> [   47.211383] snd_hda_intel 0000:00:1f.3: Digital mics found on 
>>> Skylake+ platform, using SST driver
>>>
>>> However, only legacy HDA supports it:
>>> 00:1f.3 Multimedia audio controller [0401]: Intel Corporation 
>>> Sunrise Point-LP HD Audio [8086:9d71] (rev 21)
>>> ..
>>>      Kernel modules: snd_hda_intel
>>>
>>> Ubuntu kernel doesn't select SND_SOC_INTEL_SKYLAKE, which builds 
>>> snd-soc-skl, because based on the Kconfig description SOF should 
>>> support it.
>>>
>>> I wonder if SND_SOC_INTEL_SKYLAKE should be select again?
>>
>> SOF does not support Skylake and Kabylake, and only the Up2 board for 
>> APL. I am not sure what you mean by 'recent' kernels since this 
>> dynamic selection has been in place for a year now?
> 
> Ubuntu kernel only changed this in 20.10 release.
> 
>>
>> At any rate, to make this work again:
>>
>> 1. You can select SND_SOC_INTEL_SKYLAKE or alternatively to be more 
>> accurate:
>>
>> SND_SOC_INTEL_SKL
>> SND_SOC_INTEL_APL
>> SND_SOC_INTEL_KBL
>>
>> There are known issues with Conexant codecs, typically on HP devices, 
>> only Realtek codecs are supported.
> 
> Right, so we can't really enable this for generic distros like Ubuntu.
> 
> Let me think of a more generic solution.

Re-thinking about this, I actually don't know how this problem occurred:
the tables are conditionally built so you would only select SST if you 
had the drivers compiled in.

see sound/hda/intel-dsp-config.c:

/* Kabylake-LP */
#if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
	{
		.flags = FLAG_SST,
		.device = 0x9d71,
		.dmi_table = (const struct dmi_system_id []) {
			{
				.ident = "Google Chromebooks",
				.matches = {
					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
				}
			},
			{}
		}
	},
	{
		.flags = FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
		.device = 0x9d71,
	},
#endif

Something's not adding up here.
