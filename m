Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13957746BD5
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 10:28:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3944A20C;
	Tue,  4 Jul 2023 10:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3944A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688459316;
	bh=T3Yo61X2wTFrxKpsXgqhPC33ITeyORHdblqni4Ri13s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tiq/fqR/qJ0kQkfZyEXFPw1AB8fP2PxZTdmDXbyacQ99dW6JWtnlpVZvw0XaIOxjz
	 wCpi60xXZXOUJfnalPPbvOLfGs/BWwNd5guzQdQA65Zp+TSX2Mvl0snDmA6o5WUxTo
	 sPNFo0v20yICTzwp557DieGoYNZkK4t9MpqwVy24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73C06F80124; Tue,  4 Jul 2023 10:27:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB1CF80124;
	Tue,  4 Jul 2023 10:27:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FEB4F80125; Tue,  4 Jul 2023 10:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A25B7F80093
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 10:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25B7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JxjfAVhb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688459254; x=1719995254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T3Yo61X2wTFrxKpsXgqhPC33ITeyORHdblqni4Ri13s=;
  b=JxjfAVhbqvdVVCA5AreVClX3rwWWD8CPIPpXL19flPwK4GIdVJojOtN5
   ohQE0nm/fqnaaXpM2eYr827NsbV3oAJQjFHBwBNMeXHBmD+xrFXbfGB95
   WJTTsjyxecYwqPjyGsVMIWq4895APJrHcM3c9/+1H2htMlSCPQCxjtJ2l
   i2WC6CsejmoPwcjjlXFfKywZubu5Ov1GvcV4zL6rbxh5biiK+9UYZCLck
   65QPHKltRmRH198apQef0zYvQkP9ulJF8h8jqgmMkX7lSXFaSKGDInsPn
   N2VCbI7QCqznxRFqQAvUQAqnEiSUjv8FdoEpwEF6+92mo1OvTTacfYZiF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="449440505"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="449440505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 01:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788785617"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="788785617"
Received: from mkalif-mobl.ger.corp.intel.com (HELO [10.251.219.26])
 ([10.251.219.26])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 01:27:23 -0700
Message-ID: <55d3da8d-a4d6-3bde-0635-0ae7fb3f32ca@linux.intel.com>
Date: Tue, 4 Jul 2023 10:27:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
 <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
 <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
 <489e8631-b773-1916-40a7-3fd73af54c19@amd.com>
 <80c35e78-b82b-5d8a-bce7-fa8bb61e16cd@linux.intel.com>
 <a8c7ac88-4546-2b57-6f26-5ae2a9e603e4@amd.com>
 <95586650-6a22-f760-5eb7-0e1e3a5c0346@linux.intel.com>
 <7c8b7cc9-125e-e97e-2a42-046a025d4e94@amd.com>
 <7e6faede-af5c-c251-d6eb-cc3590b36337@linux.intel.com>
 <abb4376e-15d3-6211-5024-03caf29c7a3f@amd.com>
 <ff732d09-b620-cdfd-d055-da116b99223c@linux.intel.com>
 <c932e7c8-74f8-71f1-e35f-98e1a852bd71@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c932e7c8-74f8-71f1-e35f-98e1a852bd71@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GGYBR6C7ZTUHBLUZYJFV6LCPTXDLSJKO
X-Message-ID-Hash: GGYBR6C7ZTUHBLUZYJFV6LCPTXDLSJKO
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGYBR6C7ZTUHBLUZYJFV6LCPTXDLSJKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/4/23 09:37, Mukunda,Vijendar wrote:
> On 04/07/23 12:41, Pierre-Louis Bossart wrote:
>>
>> On 7/4/23 08:36, Mukunda,Vijendar wrote:
>>> On 03/07/23 22:48, Pierre-Louis Bossart wrote:
>>>> On 7/3/23 17:18, Mukunda,Vijendar wrote:
>>>>> On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>>>>>> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>>>>>>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>>>>>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>>>>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>>>>>>
>>>>>>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>>>>>>> otherwise that would break the jack detection.
>>>>>>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>>>>>>> system suspension.
>>>>>>>>>>>
>>>>>>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>>>>>>> in the .prepare stage.
>>>>>>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>>>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>>>>>>
>>>>>>>>>> Hi Vijendar,
>>>>>>>>>> Do you have any comments?
>>>>>>>>> On AMD platforms, we are supporting two power modes.
>>>>>>>>> 1) Bus reset mode
>>>>>>>>> 2) Clock Stop Mode
>>>>>>>>>
>>>>>>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>>>>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>>>>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>>>>>>
>>>>>>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>>>>>>> suspend is invoked.
>>>>>>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>>>>>>> SoundWire manager device is in D3 state.
>>>>>>>> That was precisely the point of clock stop mode: a peripheral can
>>>>>>>> restart the system even when it's in lower-power mode.
>>>>>>>>
>>>>>>>> If there's no means to let a peripheral restart, the only benefit is
>>>>>>>> maybe to skip the enumeration time. That's not what the spec intended....
>>>>>>> As per our understanding, you are pointing to ClockStopMode1.
>>>>>>> ClockStopMode1 requires re-enumeration as peripherals move
>>>>>>> to unattached state.
>>>>>>> We have cross-checked ClockStopMode0 description in spec.
>>>>>>> It doesn't specify about peripheral device state as Unattached.
>>>>>>> We are referring here "ClockStopMode0" only.
>>>>>> No I was describing the difference between the 'Bus reset mode' and the
>>>>>> 'clock stop mode' on the manager side.
>>>>>>
>>>>>> There's also nothing in the spec preventing the manager from doing a
>>>>>> reset at any time, including after exiting the clock mode0 stop.
>>>>>>
>>>>>>
>>>>> Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
>>>>> and re-enumeration is required.
>>>>> If continuous parity errors/bus clash conditions are reported over the link,
>>>>> Sdw Manager bus reset sequence should be invoked. This is a different scenario.
>>>>> Both the scenarios are asynchronous.
>>>>>  
>>>>> Going with Spec definition for ClockStopMode0, as it's Imp defined for
>>>>> SoundWire Manager, want to stick to Clockstop when D3 call is invoked
>>>>> and restore the clock when D0 call is invoked for our platforms.
>>>> The problem is that 'D3' can be used for two separate scenarios
>>>> - S0/D3: that's pm_runtime suspend
>>>> - Sx/D4: that's system suspend
>>>> It's very unclear what the benefit of clock stop mode would be for the
>>>> latter case.
>>>>
>>> We are pointing system level suspend scenario only.
>>>
>>> We have already SoundWire Power off mode - ClockStop Mode will be
>>> applied followed by bus reset and SoundWire manager will be disabled.
>>> On parent side, ACP soft reset will be applied and ACP parent driver can
>>> wake for PME events for Soundwire manager.
>>>
>>> Sx/D4 case, want to avoid re-enumeration when multiple peripherals are connected.
>>> For Clock Stop + Bus reset (keeping Sdw manager enabled), we can define a new power mode
>>> on SoundWire manager side.
>>>
>>> Having said that, below are power modes we want to support on our side.
>>>
>>> 1) Idle Mode - Don't stop the clock for SoundWire manager and Soundwire manager is not
>>> disabled during suspend callbacks.
>>> 2) ClockStop Mode - Only apply ClockStopMode0 on Soundwire manager side and restore
>>> the clock when resume sequence is invoked (even in case of system level suspend also)
>>> 3) ClockStop Mode + Bus reset - Apply ClockStopMode0 when Sound wire manager entering
>>> runtime suspend state. In system level resume case, apply clock stop exit and bus reset which
>>> will re-enumerate all peripheral devices over the links.
>>> 4) Power off mode: apply Clock Stop + SoundWire manager IP power off sequence.
>>> Parent device(ACP) will be powered off. ACP can wake up for in band wake-up events.
>>>
>>> We expect if someone wants to go with only ClockStop mode, peripheral side also required
>>> support should be enabled.
>> I am not following any of this. You wrote both
>>
>> "
>> For ClockStop mode SDW manager is not receiving any jack alert when
>> SoundWire manager device is in D3 state.
>> "
>>
>> and
>>
>> "
>> Parent device(ACP) will be powered off. ACP can wake up for in band
>> wake-up events.
>> "
>>
>> I can't figure out how you deal with wake-ups and when exactly you
>> expect jack detection to be functional.
> Both power modes (case 2 & case 4) are different.
> The current patch series is targeted to address JD events during system level
> suspend/resume scenario, when ClockStop Power mode is selected.i.e case 2
> as mentioned above. We're not expecting bus reset during system level resume in
> this power mode.
> As SDCA interrrupts are not enabled on peripheral side during system level resume,
> No JD events are reported.
> 
> Test scenario will be let system level supend gets invoked. During suspend, plug/un-plug jack.
> During system level resume, JD status should be reported correctly.

This is completely different to the definition of 'clock stop mode'.
What you want is to make sure the status is reported correctly when the
system resume, not to resume the system using the clock stop exit
mechanism at the initiative of the peripheral.

I think we are using 'clock stop' with different meanings. Stopping the
clock in the traditional electrical engineering sense is different to
the MIPI-defined clock stop, where manager and peripheral agrees on when
the clock will stop and how to restart.
