Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D0D5F56AD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Oct 2022 16:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99287204;
	Wed,  5 Oct 2022 16:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99287204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664981310;
	bh=dNQBsbtOaMCABt+PbDrwoClydLLiJCNOgq0glzVcLcs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGU99FFFDQuIX6HK5qtRgseurx60c3sORTvR9nU4xqjLiiElgeIAib2JeopCXY7iy
	 J81OmwjSMXpvStzSOHN7aw1uGdwwToMYA2CRst7yUoOBNRdBwU02ZkPl7DhLM0q0uK
	 p0mSqNw70fee2a8+kke6a1xd+JZQXymwf8JnytUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C91F80212;
	Wed,  5 Oct 2022 16:47:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACCADF801F7; Wed,  5 Oct 2022 16:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6856EF800F8
 for <alsa-devel@alsa-project.org>; Wed,  5 Oct 2022 16:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6856EF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="l4dDkU5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664981251; x=1696517251;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dNQBsbtOaMCABt+PbDrwoClydLLiJCNOgq0glzVcLcs=;
 b=l4dDkU5/r/ttaFKjlTyUbJORHwSF/Bt2Tj4RIsAEuLITCbvwcLdWTk/B
 h7Csd/TB/CZD1T1L5iqsGs5BUQ/n6ctU1v3iZhyJAcHI4yzP1VRrY3vz5
 92tI+Y4LhztWQaEu3N2zIpEvy+HCaQ5PSnQFB0NDJn1Q0S0IdvUjftBzO
 0V0d9nesHkg88FubzL2mnh+96wfon3SQfqqgLCeakNV3ehns33xN+mXUn
 bvQ472BzX9kWjavDrStUaIa/jXQWW2giJ7BrFM6tlT7JF+B6uWI+m3fWT
 obcGN8mjToABz7vBX8F8CJkwhvHhhvQS6R1m2NjSE0LvvZ/zVlX6rdDFH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="304746059"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="304746059"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 07:47:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="766747457"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; d="scan'208";a="766747457"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.167])
 ([10.99.241.167])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 07:47:23 -0700
Message-ID: <cd3918c8-64c2-fc8f-c184-3fec3ae01e3c@linux.intel.com>
Date: Wed, 5 Oct 2022 16:47:20 +0200
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
 <9677f39a-5297-bb1c-d4e3-62484ec1cf25@nvidia.com>
 <87lepugy85.wl-tiwai@suse.de>
 <d2772c7b-bea9-e3bd-3b6b-c657566649d8@nvidia.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <d2772c7b-bea9-e3bd-3b6b-c657566649d8@nvidia.com>
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

On 10/5/2022 4:26 PM, Jon Hunter wrote:
> 
> 
> On 05/10/2022 15:07, Takashi Iwai wrote:
>> On Wed, 05 Oct 2022 15:52:01 +0200,
>> Jon Hunter wrote:
>>>
>>>
>>> On 05/10/2022 13:29, Takashi Iwai wrote:
>>>
>>> ...
>>>
>>>>> HDA playback is failing on -next for various Tegra boards. Bisect is
>>>>> point to this commit and reverting it fixes the problem. I was a bit
>>>>> puzzled why this change is causing a problem, but looking closer there
>>>>> is a difference between the previous code that was calling
>>>>> snd_hdac_stream_readb() and the new code that is calling
>>>>> snd_hdac_stream_readb_poll(). The function snd_hdac_stream_readb()
>>>>> calls snd_hdac_aligned_mmio() is see if the device has an aligned MMIO
>>>>> which Tegra does and then would call snd_hdac_aligned_read(). However,
>>>>> now the code always call readb() and this is breaking Tegra.
>>>>>
>>>>> So it is either necessary to update snd_hdac_stream_readb_poll() to
>>>>> handle this or revert this change.
>>>>
>>>> Does the patch below work?
>>>>
>>>>
>>>> thanks,
>>>>
>>>> Takashi
>>>>
>>>> -- 8< --
>>>> --- a/include/sound/hdaudio.h
>>>> +++ b/include/sound/hdaudio.h
>>>> @@ -592,8 +592,8 @@ int snd_hdac_get_stream_stripe_ctl(struct 
>>>> hdac_bus *bus,
>>>>    #define snd_hdac_stream_readb(dev, reg) \
>>>>        snd_hdac_reg_readb((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
>>>>    #define snd_hdac_stream_readb_poll(dev, reg, val, cond, delay_us, 
>>>> timeout_us) \
>>>> -    readb_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
>>>> -               delay_us, timeout_us)
>>>> +    read_poll_timeout(snd_hdac_reg_readb, val, cond, delay_us, 
>>>> timeout_us,\
>>>> +              false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
>>>>    #define snd_hdac_stream_readl_poll(dev, reg, val, cond, delay_us, 
>>>> timeout_us) \
>>>>        readl_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, 
>>>> cond, \
>>>>                   delay_us, timeout_us)
>>>
>>>
>>> Amazingly it does not work. I would have thought that would, but it
>>> does not. I am a bit puzzled by that?
>>
>> Interesting, it must be a subtle difference.
>> What about passing true?  It seems that the original code has the
>> udelay(3) before the loop.
> 
> 
> I wondered the same and tried that, but still not working.
> 
> Jon
> 

Well in worse case we can revert the patch in question, but I would like 
to get it working...

Maybe also try to raise timeout to 1000, as what original code called 
timeout, was actually number of retries? So 300 * udelay(3) which is 
more or less 900us, so we can round it up for test?

I mean, something like:

--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -176,7 +176,7 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
         snd_hdac_stream_updateb(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);

         /* wait for hardware to report that the stream entered reset */
-       snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, (val & 
SD_CTL_STREAM_RESET), 3, 300);
+       snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, (val & 
SD_CTL_STREAM_RESET), 3, 1000);

         if (azx_dev->bus->dma_stop_delay && dma_run_state)
                 udelay(azx_dev->bus->dma_stop_delay);
@@ -184,7 +184,7 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
         snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);

         /* wait for hardware to report that the stream is out of reset */
-       snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, !(val & 
SD_CTL_STREAM_RESET), 3, 300);
+       snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, !(val & 
SD_CTL_STREAM_RESET), 3, 1000);

         /* reset first position - may not be synced with hw at this time */
         if (azx_dev->posbuf)


in addition to Takashi suggestion?

