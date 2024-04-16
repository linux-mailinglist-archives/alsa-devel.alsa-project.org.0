Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64E8A6D74
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 16:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4009214E7;
	Tue, 16 Apr 2024 16:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4009214E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713276622;
	bh=xl5IPlI4/tfZkMhTro5AZJ5MrQh47xHxKI0qjQASmg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZP8dVNHKrZ1jbpbaG99cuHM3CvFvSTEcyDFr8fCP6r5nCKgR7nsc6gUMs1zQk6DGu
	 VobLBQrQMswho8M894PWKS9x6WqUbPDTFzcrmujCa2a3Os9xM5VTEEvfULE78ILNqO
	 M2L6SBLRR7qQfDHe+qhfP6ds2yL8jjnXrhWB3lfc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDAA7F8057E; Tue, 16 Apr 2024 16:09:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E153F8057B;
	Tue, 16 Apr 2024 16:09:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70C3EF8025A; Tue, 16 Apr 2024 16:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C7E7F8003A
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 16:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C7E7F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YvIb3yKJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713276574; x=1744812574;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xl5IPlI4/tfZkMhTro5AZJ5MrQh47xHxKI0qjQASmg4=;
  b=YvIb3yKJ65xBRqMTt2PvNXqeX/2LzkN5WYLsW/s/PK7O92CIx6ePRRZp
   wiXiEyiN/GHS+yomyOj7xPeaWweQbIGznBsO2TPAktk3IAA4OtYpcIH+y
   MAzOBBDixHCi6jyHB21+33BRN2bUTvCBq6AF23AR6xbN3nCJmuV4yujKb
   uDJQ4GTXm1O3Hw8mo0QpkrBR9vHpB9c2ZzF3S5zGbtaxZQ1t1QrEkR5px
   jdwCEd//SVJsQ1E/nB8F72c4dZltXEH/F7TI+aIqv6oXJO54hy5gffvFS
   CRO7SowRt+e0YFU2f5jB2eZZi6fnJ3ZunOtWyc868R4RgeNtIc/hssz2S
   g==;
X-CSE-ConnectionGUID: BEBYC2qWQcG8C2x/wkeJMA==
X-CSE-MsgGUID: hgGDY3KnRVec71XyGYT88Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9268340"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000";
   d="scan'208";a="9268340"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:09:26 -0700
X-CSE-ConnectionGUID: D37ivQksQBauF6ebrBBz0w==
X-CSE-MsgGUID: 8CvRz0DHSZOhm7rXWB9uyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000";
   d="scan'208";a="22333136"
Received: from sekosto-mobl.amr.corp.intel.com (HELO [10.213.183.148])
 ([10.213.183.148])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 07:09:25 -0700
Message-ID: <35d9f59e-3cc1-41a7-bb1d-f482c004d323@linux.intel.com>
Date: Tue, 16 Apr 2024 08:51:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYyIDIvMl0gQVNvQzogY2RuczogQWRk?=
 =?UTF-8?Q?_drivers_of_Cadence_Multi-Channel_I2S_Controller?=
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
 <20240320090239.168743-3-xingyu.wu@starfivetech.com>
 <1d0399d2-684f-490e-8711-f636e987a0b8@linux.intel.com>
 <NTZPR01MB0956BFADB4B3DA507D938F669F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <ef510647-c409-4da6-9cd4-ff4e54cbee74@linux.intel.com>
 <NTZPR01MB09567BE742A91B8C9E02EF4F9F08A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <NTZPR01MB09567BE742A91B8C9E02EF4F9F08A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PCEB47XBI3ZASLWHPMXG7XV2RLRXV4HW
X-Message-ID-Hash: PCEB47XBI3ZASLWHPMXG7XV2RLRXV4HW
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCEB47XBI3ZASLWHPMXG7XV2RLRXV4HW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/16/24 02:23, Xingyu Wu wrote:
> On 02/04/2024 21:57, Pierre-Louis Bossart wrote:
>>
>>
>>>>
>>>>> +#define PERIODS_MIN		2
>>>>> +
>>>>> +static unsigned int cdns_i2s_pcm_tx(struct cdns_i2s_dev *dev,
>>>>> +				    struct snd_pcm_runtime *runtime,
>>>>> +				    unsigned int tx_ptr, bool *period_elapsed,
>>>>> +				    snd_pcm_format_t format)
>>>>> +{
>>>>> +	unsigned int period_pos = tx_ptr % runtime->period_size;
>>>>
>>>> not following what the modulo is for, usually it's modulo the buffer size?
>>>
>>> This is to see if the new data is divisible by period_size and to
>>> determine whether it is enough for a period_size in the later loop.
>>
>> That didn't answer to my question, the position is usually between
>> 0..buffer_size.1.
> 
> Yes, this position will be used later in the cdns_i2s_pcm_pointer().
> But this cdns_i2s_pcm_tx() is called by I2S hardware interrupt which
> would be frequently called several times each period. The period_pos
> is used to determine whether there is enough a period_size to call
> snd_pcm_period_elapsed().
> 
>>
>> Doing increments on a modulo value then comparisons as done below seems
>> rather questionable.
>>
>>>>> +
>>>>> +		iowrite32(data[0], dev->base + CDNS_FIFO_MEM);
>>>>> +		iowrite32(data[1], dev->base + CDNS_FIFO_MEM);
>>>>> +		period_pos++;
>>>>> +		if (++tx_ptr >= runtime->buffer_size)
>>>>> +			tx_ptr = 0;
>>>>> +	}
>>>>> +
>>>>> +	*period_elapsed = period_pos >= runtime->period_size;
>>>>> +	return tx_ptr;
>>>>> +}
>>
>>>>> +	pm_runtime_enable(&pdev->dev);
>>>>> +	if (pm_runtime_enabled(&pdev->dev))
>>>>> +		cdns_i2s_runtime_suspend(&pdev->dev);
>>>>
>>>> that sequence looks suspicious.... Why would you suspend immediately
>>>> during the probe? You're probably missing all the autosuspend stuff?
>>>
>>> Since I have enabled clocks before, and the device is in the suspend
>>> state after pm_runtime_enable(), I need to disable clocks in
>>> cdns_i2s_runtime_suspend() to match the suspend state.
>>
>> That is very odd on two counts
>> a) if you haven't enabled the clocks, why do you need to disbale them?
>> b) if you do a pm_runtime_enable(), then the branch if
>> (pm_runtime_enabled) is always true.
>>
> 
> a) It must enable clocks first to read and write registers when I2S probe.
> Then it is done to probe, the clocks are still enabled and the state of pm
> is suspend. So it need to be disabled to match the state and will resume
> and be enabled by ALSA.

I think you are missing a pm_runtime_set_active() to reconcile the pm
state with the hardware state. The premise of pm_runtime is that on
probe your device is active and later on it will suspend. Having
pm_runtime_enabled with a suspended device without the framework
involved to trigger the transition to suspend is asking for trouble.

> b) Because CONFIG_PM would be disabled and pm_runtime_enabled()
> return false , then it is no need to disable clock and I2S still can work.

Again you are trying to make things more complicated than they need to
be. Don't try to actively manage and query states, let the framework do
it for you.

Try to probe and bring the device to an active state. Then use
pm_runtime_mark_last_busy(), use pm_runtime_enable and let autosuspend
do the work for you. If pm_runtime is not enabled the suspend will not
happen.

Also keep in mind that pm_runtime_enabled() will return false if the
user mucks with the power state in sysfs, it's not only a case of
CONFIG_PM being selected or not.
> 
>>
>>>
>>>>
>>>>> +
>>>>> +	dev_dbg(&pdev->dev, "I2S supports %d stereo channels with %s.\n",
>>>>> +		i2s->max_channels, ((i2s->irq < 0) ? "dma" : "interrupt"));
>>>>> +
>>>>> +	return 0;
>>>>> +
>>>>> +err:
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static int cdns_i2s_remove(struct platform_device *pdev) {
>>>>> +	pm_runtime_disable(&pdev->dev);
>>>>> +	if (!pm_runtime_status_suspended(&pdev->dev))
>>>>> +		cdns_i2s_runtime_suspend(&pdev->dev);
>>>>
>>>> ... and this one too. Once you've disabled pm_runtime, checking the
>>>> status is irrelevant...
>>>
>>> I think the clocks need to be always enabled after probe if disable
>>> pm_runtime, and should be disabled when remove. This will do that.
>>
>> if you are disabling pm_runtime, then the pm_runtime state becames invalid.
>> When pm_runtime_disable() is added in remove operations, it's mainly to
>> prevent the device from suspending.
> 
> Should I use the pm_runtime_enabled() before the pm_runtime_disable()?

It doesn't matter, the problem is the second part where you try to check
the status of pm_runtime *after* disabling it.


