Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E74413D71
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 00:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBE1416AD;
	Wed, 22 Sep 2021 00:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBE1416AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632262791;
	bh=Rg0FeYiisykk82mzCVf639SXLPB/91qmKI+sOVdMauU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0sPFTRDuiq7+DkO3v5FAcwAMkz6k0LCGN/zYza9i5qDMJ2IqfszBpXXbVQIn89ux
	 sb5MK6iWdp6DrkX4zuBaH66n5MVel6DcP9HfjXNkfmrniIzinq2gfUXJ3BuBYz/t9v
	 ohmJZmyMPU7FmGWCwCj5BepBEhBVcCgFKA/Ertno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A725F8026A;
	Wed, 22 Sep 2021 00:18:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6556DF80268; Wed, 22 Sep 2021 00:18:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D612AF8011F
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 00:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D612AF8011F
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210711881"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="210711881"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 15:18:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="653075809"
Received: from rudymgal-mobl1.amr.corp.intel.com (HELO [10.212.82.111])
 ([10.212.82.111])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 15:18:17 -0700
Subject: Re: [PATCH] ALSA: hda: Reduce udelay() at SKL+ position reporting
To: Takashi Iwai <tiwai@suse.de>
References: <20210910141002.32749-1-tiwai@suse.de>
 <db973c6d-3fb3-6c1b-f4cd-3e77baf8bd31@linux.intel.com>
 <s5htuipjaak.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <203381d5-b3ce-c5ab-b96e-bd38d27cf813@linux.intel.com>
Date: Tue, 21 Sep 2021 17:18:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5htuipjaak.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Jens Axboe <axboe@kernel.dk>, alsa-devel@alsa-project.org
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

Sorry Takashi for the delay, I missed your reply.

>>> The position reporting on Intel Skylake and later chips via
>>> azx_get_pos_skl() contains a udelay(20) call for the capture streams.
>>> A call for this alone doesn't sound too harmful.  However, as the
>>> pointer PCM ops is one of the hottest path in the PCM operations --
>>> especially for the timer-scheduled operations like PulseAudio -- such
>>> a delay hogs CPU usage significantly in the total performance.
>>>
>>> The function there was taken from the original code in ASoC SST
>>> Skylake driver blindly.  The udelay() is a workaround for the case
>>> where the reported position is behind the period boundary at the
>>> timing triggered from interrupts; applications often expect that the
>>> full data is available for the whole period when returned (and also
>>> that's the definition of the ALSA PCM period).
>>
>> that initial work-around from the Intel SST driver does not seem to be
>> legit in the first place, when I checked with hardware folks recently no
>> one understands why there are delays and special cases for capture. The
>> only requirement wrt. DPIB is that the DDR update is valid across VC0
>> and VC1, while the DPIB registers are only valid with VC0. For SOF we
>> don't know of any VC1 use so will default to the DPIB vendor-specific
>> registers.
> 
> What are those VC0 and VC1 registers?  I can't find the definitions in
> the code, so I assume that none of ALSA/ASoC drivers use VC1.

These are PCI concepts/capabilities. VC stands for "Virtual Channel",
which are mapped to Traffic Class (TC). These registers are typically
set by the BIOS AFAIK. The point is that if VC1 is enabled only the DPIB
updates are valid, the vendor-specific will report information can be
misleading.

The recommendation from hardware folks is to use DPIB updates in DDR,
which are known to work across both VC0 and VC1.

For SOF, we do know VC1 is never used so we'll use the vendor-specific
registers.

>> See https://github.com/thesofproject/linux/pull/3143 for my WIP fixes
>> for SOF.
>>
>> I don't have the time to look at this specific patch today but wanted to
>> make sure you are aware of my on-going fixes.
>>
>> Note that the use of DPIB works best if you don't use the IOC interrupt.
>> when the interrupt is thrown, there is likely a delay for the DPIB
>> information to be refreshed.
> 
> Thanks for the information!  The delay could be the reason of the
> udelay(), and that's superfluous as mentioned in the commit.
> 
> So the remaining question seems to be which method is a better
> approach for the capture stream: DPIB or posbuf.  I kept the posbuf
> just for conservatism, but judging from your comment, we may use DPIB
> for both directions safely?

sorry you lost me. Isn't DPIB updates in DDR precisely what posbuf reports?

I think what you need to use is use azx_get_pos_posbuf(chip, azx_dev);
unconditionally, both for capture and playback, and remove the use of
the skylake specific stuff and the delay.

> In anyway, the additional mechanism to check the delayed position
> report in this patch can be kept no matter which way (DPIB or posbuf)
> is used.

Agree!

> 
> 
> Takashi
> 
>>
>>>
>>> OTOH, HD-audio (legacy) driver has already some workarounds for the
>>> delayed position reporting due to its relatively large FIFO, such as
>>> the BDL position adjustment and the delayed period-elapsed call in the
>>> work.  That said, the udelay() is almost superfluous for HD-audio
>>> driver unlike SST, and we can drop the udelay().
>>>
>>> Though, the current code doesn't guarantee the full period readiness
>>> as mentioned in the above, but rather it checks the wallclock and
>>> detects the unexpected jump.  That's one missing piece, and the drop
>>> of udelay() needs a bit more sanity checks for the delayed handling.
>>>
>>> This patch implements those: the drop of udelay() call in
>>> azx_get_pos_skl() and the more proper check of hwptr in
>>> azx_position_ok().  The latter change is applied only for the case
>>> where the stream is running in the normal mode without
>>> no_period_wakeup flag.  When no_period_wakeup is set, it essentially
>>> ignores the period handling and rather concentrates only on the
>>> current position; which implies that we don't need to care about the
>>> period boundary at all.
>>>
>>> Fixes: f87e7f25893d ("ALSA: hda - Improved position reporting on SKL+")
>>> Reported-by: Jens Axboe <axboe@kernel.dk>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>>  sound/pci/hda/hda_intel.c | 28 +++++++++++++++++++++++-----
>>>  1 file changed, 23 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>> index 3aa432d814a2..faeeeb923d5e 100644
>>> --- a/sound/pci/hda/hda_intel.c
>>> +++ b/sound/pci/hda/hda_intel.c
>>> @@ -637,13 +637,17 @@ static int azx_position_check(struct azx *chip, struct azx_dev *azx_dev)
>>>   * the update-IRQ timing.  The IRQ is issued before actually the
>>>   * data is processed.  So, we need to process it afterwords in a
>>>   * workqueue.
>>> + *
>>> + * Returns 1 if OK to proceed, 0 for delay handling, -1 for skipping update
>>>   */
>>>  static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
>>>  {
>>>  	struct snd_pcm_substream *substream = azx_dev->core.substream;
>>> +	struct snd_pcm_runtime *runtime = substream->runtime;
>>>  	int stream = substream->stream;
>>>  	u32 wallclk;
>>>  	unsigned int pos;
>>> +	snd_pcm_uframes_t hwptr, target;
>>>  
>>>  	wallclk = azx_readl(chip, WALLCLK) - azx_dev->core.start_wallclk;
>>>  	if (wallclk < (azx_dev->core.period_wallclk * 2) / 3)
>>> @@ -680,6 +684,24 @@ static int azx_position_ok(struct azx *chip, struct azx_dev *azx_dev)
>>>  		/* NG - it's below the first next period boundary */
>>>  		return chip->bdl_pos_adj ? 0 : -1;
>>>  	azx_dev->core.start_wallclk += wallclk;
>>> +
>>> +	if (azx_dev->core.no_period_wakeup)
>>> +		return 1; /* OK, no need to check period boundary */
>>> +
>>> +	if (runtime->hw_ptr_base != runtime->hw_ptr_interrupt)
>>> +		return 1; /* OK, already in hwptr updating process */
>>> +
>>> +	/* check whether the period gets really elapsed */
>>> +	pos = bytes_to_frames(runtime, pos);
>>> +	hwptr = runtime->hw_ptr_base + pos;
>>> +	if (hwptr < runtime->status->hw_ptr)
>>> +		hwptr += runtime->buffer_size;
>>> +	target = runtime->hw_ptr_interrupt + runtime->period_size;
>>> +	if (hwptr < target) {
>>> +		/* too early wakeup, process it later */
>>> +		return chip->bdl_pos_adj ? 0 : -1;
>>> +	}
>>> +
>>>  	return 1; /* OK, it's fine */
>>>  }
>>>  
>>> @@ -874,11 +896,7 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
>>>  	if (azx_dev->core.substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>>>  		return azx_skl_get_dpib_pos(chip, azx_dev);
>>>  
>>> -	/* For capture, we need to read posbuf, but it requires a delay
>>> -	 * for the possible boundary overlap; the read of DPIB fetches the
>>> -	 * actual posbuf
>>> -	 */
>>> -	udelay(20);
>>> +	/* read of DPIB fetches the actual posbuf */
>>>  	azx_skl_get_dpib_pos(chip, azx_dev);
>>>  	return azx_get_pos_posbuf(chip, azx_dev);
>>>  }
>>>
>>
