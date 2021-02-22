Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C5321D5D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 17:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC5B167B;
	Mon, 22 Feb 2021 17:47:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC5B167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614012478;
	bh=GHQNiT1Mf7IhucmF8WC7JRH4T89ikKaX+u+RPOrUkx0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fslT2nzMBmLypLNQAl5TuowxGzXIGmcrSuu+ehxPFDVvCw05iR6yEt4eOw1P7qdgL
	 iLvMmkxzCURbbwuLZQOCtL6rHIpWGjN08U0Chno2XGvstGp8QAqV5O+kfGlWTNw/x2
	 OMjVV/xRCdZUQCrpor0RCGJS/1BthO7PrgEfN9Ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2439CF802E7;
	Mon, 22 Feb 2021 17:45:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 967DFF802DF; Mon, 22 Feb 2021 17:45:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03866F80129
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03866F80129
IronPort-SDR: 8IQokt0HK5sHFofi14hSEdZGd+W+OMfPpaFe5jecEj3ow8tvhrNEnASopeMo6ImT50CC5ngVnP
 YyjInsrQtHBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="184619518"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="184619518"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:45:16 -0800
IronPort-SDR: l4Vi90F2YQf6ff5eH/DguYBSMAB5foOuzPgs5TPdjQvPt5J5TQI7XNq5fjb81lgU6L7BKgy0sS
 wFwo+3wSCMFg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="364072232"
Received: from cjmerril-mobl1.amr.corp.intel.com (HELO [10.212.252.139])
 ([10.212.252.139])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:45:15 -0800
Subject: Re: [PATCH v2] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
To: Jaroslav Kysela <perex@perex.cz>, shumingf@realtek.com,
 broonie@kernel.org, lgirdwood@gmail.com
References: <20210218091208.28734-1-shumingf@realtek.com>
 <350ee43a-af99-bb8e-60d3-2a0dc561cb45@perex.cz>
 <84ce7570-b5c7-d89d-7d65-a391c3b65f93@linux.intel.com>
 <37e136a7-01de-412a-6527-e3b6b6038de1@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e03dc0b5-80cf-1881-2be8-9d6fc2eafc4e@linux.intel.com>
Date: Mon, 22 Feb 2021 09:48:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <37e136a7-01de-412a-6527-e3b6b6038de1@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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



On 2/20/21 11:55 AM, Jaroslav Kysela wrote:
> Dne 18. 02. 21 v 15:49 Pierre-Louis Bossart napsal(a):
>>
>>
>> On 2/18/21 3:44 AM, Jaroslav Kysela wrote:
>>> Dne 18. 02. 21 v 10:12 shumingf@realtek.com napsal(a):
>>>
>>>> +	SND_SOC_DAPM_SWITCH("DAC L", SND_SOC_NOPM, 0, 0, &rt1316_sto_dac_l),
>>>> +	SND_SOC_DAPM_SWITCH("DAC R", SND_SOC_NOPM, 0, 0, &rt1316_sto_dac_r),
>>>
>>> Truly, I don't understand the reason to have a separate L/R switch when we can
>>> map this functionality to one stereo (multichannel) control.
>>>
>>> It's an issue for all ASoC drivers. We should consider to be more strict for
>>> the new ones.
>>
>> At the same time we have to recognize that the L/R notion only makes
>> sense at the input to the amplifier. The amplifier may recombine
>> channels to deal with orientation/posture or simply select a specific
>> input, and drive different speakers (e.g. tweeter/woofer). Dac L and R
>> are often an abuse of language when the system have multi-way speakers.
>> Exhibit A for this is the TigerLake device with 2 RT1316 and 4 speakers.
>> L/R don't make sense to describe amplifier outputs and speaker position.
> 
> My point is a bit different. If the channels are supposed to be used together
> (which usually mean a kind of the stereo operation in this case), it does not
> make much sense to split this control to separate single channels. It's just a
> waste of resources.

In this case the control affects analog resources and speaker outputs, 
so in this case I will assume that it's perfectly ok to have a single 
speaker. Put differently, assuming that the two channels will always be 
used is not quite right.

> The current patch code:
> 
> one channel control "DAC L"
> one channel control "DAC R"
> 
> The one control:
> 
> two channels control "DAC"
> 
>  From the user space POV, the only difference is the value write operation
> (both channels are set using one ioctl).

SDCA mandates that all devices are able to consume stereo data, even if 
there is a single speaker connected. It's useful IMHO if you provide 
controls so that one of the two DACs is switched off.





> 
>> There's also a difficult balance to be found between exposing all the
>> capabilities of the device, and making integration and userspace
>> simpler. I2C/IS2 and SoundWire devices tend to expose more controls than
>> HDaudio ones, and that was driven by a desire to optimize as much as
>> possible. Some devices are designed with limited number of controls,
>> others provide hooks to tweak everything in the system by exposing
>> literally have thousands of controls. I don't think we should pick and
>> choose which controls we want to expose, that's the codec vendor's job
>> IMHO (or the device class definition when standard and applicable)
> 
> The problem with ASoC tree is that many of those controls are not supposed to
> be configured/used by the end user, but in UCM or other higher level layer
> configuration, because they're a part of the hw/driver setup.
> 
> I think that we should classify those controls so the standard user space
> tools can hide them, but it's another problem.
> 
> 					Jaroslav
> 
