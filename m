Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BF896F4B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 14:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8DA2CE1;
	Wed,  3 Apr 2024 14:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8DA2CE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712148672;
	bh=rhp7e6puQyVUMErtQ1wrKsDuOwsFw8HjdJrVLLq+GRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tNjmKL8nIQcLGD5z3cyiEnoR8A9b67yu6ta+WBZ9/nSnAl4++gaei3nj0DaNTBjIv
	 SwocOhQVe7QaOSkA1RvAfP/+xi+9u6vKKDtSHDIfO9NjmMVfadFBETYeGsadgmO3tE
	 hcpaqY6ULCxnqhp7F58R+nT+BRu7e55cDJ9sEZAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4091CF805AC; Wed,  3 Apr 2024 14:50:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A56DBF8059F;
	Wed,  3 Apr 2024 14:50:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22F3DF80568; Wed,  3 Apr 2024 14:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEFC6F80130
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 14:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEFC6F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FqcspjCJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148628; x=1743684628;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rhp7e6puQyVUMErtQ1wrKsDuOwsFw8HjdJrVLLq+GRo=;
  b=FqcspjCJEVCYo7tTSfB4IXjyKrOa+nxRjyQU7UJ91/SZaiataqUFylBc
   4aRdDi3RSiRRx/SCjxvyBTRzJGAH7Sn2iSHl/OOBizAG9PtPRqUnQnX97
   P6KBuDcodr8v2W3u5M/yR4AUyGr75SPusEfs5vJKradiViOaEHCLzS+Z8
   GtyKrGfsQaGT9pfYb8bgDH3MMpzmkPKqCf+ijfM9S96UN3uVNSpxklzu5
   BW4ypSuHv4u26l0/dI0/gE2u4v/m57gT4uRU7SFI+nZ+ihrNMMvQ8xF9E
   6ZcpTGejYzL9bTAO6AO0zsgWC6fB0S4RafiF727cvxUG2ew2b0aL+INBy
   w==;
X-CSE-ConnectionGUID: yu4HAE+lQHqvmr2TezSGWQ==
X-CSE-MsgGUID: KqajrX5gQ9y6QRs7bjZPow==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539273"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7539273"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:22 -0700
X-CSE-ConnectionGUID: 1/2JH2STQ7WDV9dzV2GDbw==
X-CSE-MsgGUID: R5MUllpuTCKa7NQ8b3XutA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18343201"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18])
 ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:21 -0700
Message-ID: <ef510647-c409-4da6-9cd4-ff4e54cbee74@linux.intel.com>
Date: Tue, 2 Apr 2024 08:57:14 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <NTZPR01MB0956BFADB4B3DA507D938F669F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GRCO6DQJ3PF3JBMD6ZR3KRBXOFDCXKNE
X-Message-ID-Hash: GRCO6DQJ3PF3JBMD6ZR3KRBXOFDCXKNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRCO6DQJ3PF3JBMD6ZR3KRBXOFDCXKNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>
>>> +#define PERIODS_MIN		2
>>> +
>>> +static unsigned int cdns_i2s_pcm_tx(struct cdns_i2s_dev *dev,
>>> +				    struct snd_pcm_runtime *runtime,
>>> +				    unsigned int tx_ptr, bool *period_elapsed,
>>> +				    snd_pcm_format_t format)
>>> +{
>>> +	unsigned int period_pos = tx_ptr % runtime->period_size;
>>
>> not following what the modulo is for, usually it's modulo the buffer size?
> 
> This is to see if the new data is divisible by period_size and to determine whether
> it is enough for a period_size in the later loop.

That didn't answer to my question, the position is usually between
0..buffer_size.1.

Doing increments on a modulo value then comparisons as done below seems
rather questionable.
	
>>> +
>>> +		iowrite32(data[0], dev->base + CDNS_FIFO_MEM);
>>> +		iowrite32(data[1], dev->base + CDNS_FIFO_MEM);
>>> +		period_pos++;
>>> +		if (++tx_ptr >= runtime->buffer_size)
>>> +			tx_ptr = 0;
>>> +	}
>>> +
>>> +	*period_elapsed = period_pos >= runtime->period_size;
>>> +	return tx_ptr;
>>> +}

>>> +	pm_runtime_enable(&pdev->dev);
>>> +	if (pm_runtime_enabled(&pdev->dev))
>>> +		cdns_i2s_runtime_suspend(&pdev->dev);
>>
>> that sequence looks suspicious.... Why would you suspend immediately during the
>> probe? You're probably missing all the autosuspend stuff?
> 
> Since I have enabled clocks before, and the device is in the suspend state after
> pm_runtime_enable(), I need to disable clocks in cdns_i2s_runtime_suspend()
> to match the suspend state.

That is very odd on two counts
a) if you haven't enabled the clocks, why do you need to disbale them?
b) if you do a pm_runtime_enable(), then the branch if
(pm_runtime_enabled) is always true.


> 
>>
>>> +
>>> +	dev_dbg(&pdev->dev, "I2S supports %d stereo channels with %s.\n",
>>> +		i2s->max_channels, ((i2s->irq < 0) ? "dma" : "interrupt"));
>>> +
>>> +	return 0;
>>> +
>>> +err:
>>> +	return ret;
>>> +}
>>> +
>>> +static int cdns_i2s_remove(struct platform_device *pdev) {
>>> +	pm_runtime_disable(&pdev->dev);
>>> +	if (!pm_runtime_status_suspended(&pdev->dev))
>>> +		cdns_i2s_runtime_suspend(&pdev->dev);
>>
>> ... and this one too. Once you've disabled pm_runtime, checking the status is
>> irrelevant...
> 
> I think the clocks need to be always enabled after probe if disable pm_runtime,
> and should be disabled when remove. This will do that.

if you are disabling pm_runtime, then the pm_runtime state becames invalid.
When pm_runtime_disable() is added in remove operations, it's mainly to
prevent the device from suspending.

