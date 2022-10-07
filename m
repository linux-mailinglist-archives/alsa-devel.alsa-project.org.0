Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 033205F7584
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Oct 2022 10:51:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BD1167A;
	Fri,  7 Oct 2022 10:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BD1167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665132663;
	bh=CNNiQJ0jvcJk580eA851dG+WgC8+tA465upvwZmefVk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qIJmKrjSY/MQAtGdwBAExG31X+GAzBXd5HwKdD4+AUw9+Z1khark5qTMDGadeVmVc
	 7Rw9zYwRoiwsL5ZRXpy749MLPjOJQe0cPAGKBAXV8SRBvchfXeSzVnBSgDd9WbC34W
	 bUR6fm/c/3qJLVWW1p7MMMbZAAZcqUVDf/63p0fI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2361AF80496;
	Fri,  7 Oct 2022 10:50:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36180F800BF; Fri,  7 Oct 2022 10:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EDA6F800BF
 for <alsa-devel@alsa-project.org>; Fri,  7 Oct 2022 10:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EDA6F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="joHQjkGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665132605; x=1696668605;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CNNiQJ0jvcJk580eA851dG+WgC8+tA465upvwZmefVk=;
 b=joHQjkGKp15VJseMKF3ufQbgGPUTpybZjAhVniVXaI8yXRX+CtzqYp8f
 oWroH2JhXdfwIW7+DBHEOk9jYwMYdMOSh6LA0NjnN3iePHoegH46SAW06
 397T5wnrrtx3wOzlb+OztQ4E0YCCKA3PjZXAxIJLPCsvybxS1zIPHd/26
 2WbR5Ne/tnrPzf5EsnN1w9gHkntfxZ5af9BEwLh8TwbJuWyPmLJkYqOM8
 mtjoZFdaoZ5Ea5r3lxREzgfpyg+Px9wPxMTz0IcWJQ/UEtSashWnllemo
 r8srB00E02YUA48Nzux6fIcrdEJb2RyLqZijL071fM682MejTbyHqvxiD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="301285635"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="301285635"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 01:50:00 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="714204628"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="714204628"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.18])
 ([10.99.241.18])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 01:49:58 -0700
Message-ID: <6730eda1-7a7a-3660-ebe4-e9e42de421a3@linux.intel.com>
Date: Fri, 7 Oct 2022 10:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 2/4] ALSA: hda: Rework snd_hdac_stream_reset() to use
 macros
Content-Language: en-US
To: Jon Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.de>
References: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
 <20220818141517.109280-3-amadeuszx.slawinski@linux.intel.com>
 <657d2418-0c3e-296f-8f4a-dc10ced2dffe@nvidia.com>
 <87a66av4gk.wl-tiwai@suse.de>
 <86947512-33c8-4e22-5329-a41735c6b1ef@nvidia.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <86947512-33c8-4e22-5329-a41735c6b1ef@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Mohan Kumar D <mkumard@nvidia.com>
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

On 10/6/2022 10:45 AM, Jon Hunter wrote:
> 
> On 05/10/2022 13:29, Takashi Iwai wrote:
> 
> ...
> 
>>> HDA playback is failing on -next for various Tegra boards. Bisect is
>>> point to this commit and reverting it fixes the problem. I was a bit
>>> puzzled why this change is causing a problem, but looking closer there
>>> is a difference between the previous code that was calling
>>> snd_hdac_stream_readb() and the new code that is calling
>>> snd_hdac_stream_readb_poll(). The function snd_hdac_stream_readb()
>>> calls snd_hdac_aligned_mmio() is see if the device has an aligned MMIO
>>> which Tegra does and then would call snd_hdac_aligned_read(). However,
>>> now the code always call readb() and this is breaking Tegra.
>>>
>>> So it is either necessary to update snd_hdac_stream_readb_poll() to
>>> handle this or revert this change.
>>
>> Does the patch below work?
>>
>>
>> thanks,
>>
>> Takashi
>>
>> -- 8< --
>> --- a/include/sound/hdaudio.h
>> +++ b/include/sound/hdaudio.h
>> @@ -592,8 +592,8 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus 
>> *bus,
>>   #define snd_hdac_stream_readb(dev, reg) \
>>       snd_hdac_reg_readb((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
>>   #define snd_hdac_stream_readb_poll(dev, reg, val, cond, delay_us, 
>> timeout_us) \
>> -    readb_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
>> -               delay_us, timeout_us)
>> +    read_poll_timeout(snd_hdac_reg_readb, val, cond, delay_us, 
>> timeout_us,\
>> +              false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
>>   #define snd_hdac_stream_readl_poll(dev, reg, val, cond, delay_us, 
>> timeout_us) \
>>       readl_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
>>                  delay_us, timeout_us)
> 
> 
> So looking at this a bit more I see ...
> 
> [  199.422773] bad: scheduling from the idle thread!
> [  199.427610] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D  
> C         6.0.0-rc7-next-20220930-00007-gd6ae4ed0a78f-dirty #23
> [  199.438880] Hardware name: NVIDIA Jetson Nano Developer Kit (DT)
> [  199.444899] Call trace:
> [  199.447357]  dump_backtrace.part.7+0xe8/0xf8
> [  199.451680]  show_stack+0x14/0x38
> [  199.455024]  dump_stack_lvl+0x64/0x7c
> [  199.458715]  dump_stack+0x14/0x2c
> [  199.462067]  dequeue_task_idle+0x2c/0x58
> [  199.466038]  dequeue_task+0x38/0x98
> [  199.469565]  __schedule+0x4a4/0x6d8
> [  199.473104]  schedule+0x58/0xc0
> [  199.476292]  schedule_hrtimeout_range_clock+0x98/0x108
> [  199.481472]  schedule_hrtimeout_range+0x10/0x18
> [  199.486039]  usleep_range_state+0x7c/0xb0
> [  199.490084]  snd_hdac_stream_reset+0xe8/0x328 [snd_hda_core]
> [  199.495913]  snd_hdac_stream_sync+0xe4/0x190 [snd_hda_core]
> [  199.501627]  azx_pcm_trigger+0x1d8/0x250 [snd_hda_codec]
> [  199.507109]  snd_pcm_do_stop+0x54/0x70
> [  199.510904]  snd_pcm_action_single+0x44/0xa0
> [  199.515215]  snd_pcm_drain_done+0x20/0x28
> [  199.519267]  snd_pcm_update_state+0x114/0x128
> [  199.523670]  snd_pcm_update_hw_ptr0+0x22c/0x3a0
> [  199.528246]  snd_pcm_period_elapsed_under_stream_lock+0x44/0x88
> [  199.534216]  snd_pcm_period_elapsed+0x24/0x48
> [  199.538617]  stream_update+0x3c/0x50 [snd_hda_codec]
> [  199.543737]  snd_hdac_bus_handle_stream_irq+0xe8/0x150 [snd_hda_core]
> [  199.550320]  azx_interrupt+0xb4/0x1b0 [snd_hda_codec]
> [  199.555524]  __handle_irq_event_percpu+0x74/0x140
> [  199.560281]  handle_irq_event_percpu+0x14/0x48
> [  199.564772]  handle_irq_event+0x44/0x88
> [  199.568653]  handle_fasteoi_irq+0xa8/0x130
> [  199.572788]  generic_handle_domain_irq+0x28/0x40
> [  199.577452]  gic_handle_irq+0x9c/0xb8
> [  199.581168]  call_on_irq_stack+0x2c/0x40
> [  199.585129]  do_interrupt_handler+0x7c/0x80
> [  199.589355]  el1_interrupt+0x34/0x68
> [  199.592969]  el1h_64_irq_handler+0x14/0x20
> [  199.597107]  el1h_64_irq+0x64/0x68
> [  199.600540]  cpuidle_enter_state+0x130/0x2f8
> [  199.604853]  cpuidle_enter+0x38/0x50
> [  199.608463]  call_cpuidle+0x18/0x38
> [  199.611991]  do_idle+0x1f8/0x248
> [  199.615259]  cpu_startup_entry+0x20/0x28
> [  199.619224]  kernel_init+0x0/0x128
> [  199.622669]  arch_post_acpi_subsys_init+0x0/0x8
> [  199.627240]  start_kernel+0x630/0x668
> [  199.630933]  __primary_switched+0xb4/0xbc
> 
> 
> If I change your patch to be read_poll_timeout_atomic, then it works \o/
> 
> Can we make that update?
> 
> Jon
> 

Yes, it makes sense, as it uses udelay instead of usleep, same as 
original code.

I've send patch which updates the macros. It passed validation on our side.

Thanks for report!

Amadeusz
