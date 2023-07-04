Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1589746CFF
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 11:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EB087F1;
	Tue,  4 Jul 2023 11:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EB087F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688462173;
	bh=v5qOfe15kXyESFUWmuczGDO4DvsOxk4tlJm2tSHeq+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OcQjtA4F6HmFhM6PAy13PFI8VWf0Q0/806K3NjqLgkOm6mXojuzjkvVHQXb5h3bSb
	 WU6jir+lNxsG8M9QiiLVzMaXtOdumCnj+LUwbfwlmlRSIl4tfhLuKJdl3ATDL+o06h
	 A1aQ7YRzhWV0QaJ48m29cr1zwGpVCwh31J98YWks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57082F8053B; Tue,  4 Jul 2023 11:15:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A24F80124;
	Tue,  4 Jul 2023 11:15:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DD23F80125; Tue,  4 Jul 2023 11:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5221CF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 11:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5221CF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LrSCPNIu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688462100; x=1719998100;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v5qOfe15kXyESFUWmuczGDO4DvsOxk4tlJm2tSHeq+o=;
  b=LrSCPNIucKQ8pYv2Yv/JpqvF+GUJY06qS4k76IgJj4ZRHeISDpvu7cZh
   Tlx7sG1O8PbNSJ8kUIIixp2oj+/fonlMfO57B89mC2pYs8cIB9ECb8usw
   CIPxczGY54Oh3OuOt2m8ul6+qWzaws7zGt5URv9qySWBRaEpMcSDubPmj
   GCgJNCkttUFymRC6sR4LfSn33eVYp3JBV6XyGxPWgyspZHc9lhftTAuxv
   0aC8na/jPeygiiH3nzkSmYCzFAeACQIZ/MpyTO3gX8IffktxjlgpzZBps
   iAPWNPGc8ZkCpG3e4OrYElJgZd007+xwVkEREaQZ401+8j/SuVsIxW6K+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="365649166"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="365649166"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712831514"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200";
   d="scan'208";a="712831514"
Received: from mkalif-mobl.ger.corp.intel.com (HELO [10.251.219.26])
 ([10.251.219.26])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 02:14:50 -0700
Message-ID: <cd5fc4ef-801a-1c18-c228-60ed87086021@linux.intel.com>
Date: Tue, 4 Jul 2023 11:14:47 +0200
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
 <55d3da8d-a4d6-3bde-0635-0ae7fb3f32ca@linux.intel.com>
 <c5add7b8-0170-a223-5216-2e9cf2869f04@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c5add7b8-0170-a223-5216-2e9cf2869f04@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B75DI5APPNJF5EWQMXX77QR3ATTLQFND
X-Message-ID-Hash: B75DI5APPNJF5EWQMXX77QR3ATTLQFND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B75DI5APPNJF5EWQMXX77QR3ATTLQFND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/4/23 11:03, Mukunda,Vijendar wrote:
> On 04/07/23 13:57, Pierre-Louis Bossart wrote:
>>
>> On 7/4/23 09:37, Mukunda,Vijendar wrote:
>>> On 04/07/23 12:41, Pierre-Louis Bossart wrote:
>>>> On 7/4/23 08:36, Mukunda,Vijendar wrote:
>>>>> On 03/07/23 22:48, Pierre-Louis Bossart wrote:
>>>>>> On 7/3/23 17:18, Mukunda,Vijendar wrote:
>>>>>>> On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>>>>>>>> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>>>>>>>>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>>>>>>>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>>>>>>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>>>>>>>>> otherwise that would break the jack detection.
>>>>>>>>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>>>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>>>>>>>>> system suspension.
>>>>>>>>>>>>>
>>>>>>>>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>>>>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>>>>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>>>>>>>>> in the .prepare stage.
>>>>>>>>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>>>>>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>>>>>>>>
>>>>>>>>>>>> Hi Vijendar,
>>>>>>>>>>>> Do you have any comments?
>>>>>>>>>>> On AMD platforms, we are supporting two power modes.
>>>>>>>>>>> 1) Bus reset mode
>>>>>>>>>>> 2) Clock Stop Mode
>>>>>>>>>>>
>>>>>>>>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>>>>>>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>>>>>>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>>>>>>>>
>>>>>>>>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>>>>>>>>> suspend is invoked.
>>>>>>>>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>>>>>>>>> SoundWire manager device is in D3 state.
>>>>>>>>>> That was precisely the point of clock stop mode: a peripheral can
>>>>>>>>>> restart the system even when it's in lower-power mode.
>>>>>>>>>>
>>>>>>>>>> If there's no means to let a peripheral restart, the only benefit is
>>>>>>>>>> maybe to skip the enumeration time. That's not what the spec intended....
>>>>>>>>> As per our understanding, you are pointing to ClockStopMode1.
>>>>>>>>> ClockStopMode1 requires re-enumeration as peripherals move
>>>>>>>>> to unattached state.
>>>>>>>>> We have cross-checked ClockStopMode0 description in spec.
>>>>>>>>> It doesn't specify about peripheral device state as Unattached.
>>>>>>>>> We are referring here "ClockStopMode0" only.
>>>>>>>> No I was describing the difference between the 'Bus reset mode' and the
>>>>>>>> 'clock stop mode' on the manager side.
>>>>>>>>
>>>>>>>> There's also nothing in the spec preventing the manager from doing a
>>>>>>>> reset at any time, including after exiting the clock mode0 stop.
>>>>>>>>
>>>>>>>>
>>>>>>> Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
>>>>>>> and re-enumeration is required.
>>>>>>> If continuous parity errors/bus clash conditions are reported over the link,
>>>>>>> Sdw Manager bus reset sequence should be invoked. This is a different scenario.
>>>>>>> Both the scenarios are asynchronous.
>>>>>>>  
>>>>>>> Going with Spec definition for ClockStopMode0, as it's Imp defined for
>>>>>>> SoundWire Manager, want to stick to Clockstop when D3 call is invoked
>>>>>>> and restore the clock when D0 call is invoked for our platforms.
>>>>>> The problem is that 'D3' can be used for two separate scenarios
>>>>>> - S0/D3: that's pm_runtime suspend
>>>>>> - Sx/D4: that's system suspend
>>>>>> It's very unclear what the benefit of clock stop mode would be for the
>>>>>> latter case.
>>>>>>
>>>>> We are pointing system level suspend scenario only.
>>>>>
>>>>> We have already SoundWire Power off mode - ClockStop Mode will be
>>>>> applied followed by bus reset and SoundWire manager will be disabled.
>>>>> On parent side, ACP soft reset will be applied and ACP parent driver can
>>>>> wake for PME events for Soundwire manager.
>>>>>
>>>>> Sx/D4 case, want to avoid re-enumeration when multiple peripherals are connected.
>>>>> For Clock Stop + Bus reset (keeping Sdw manager enabled), we can define a new power mode
>>>>> on SoundWire manager side.
>>>>>
>>>>> Having said that, below are power modes we want to support on our side.
>>>>>
>>>>> 1) Idle Mode - Don't stop the clock for SoundWire manager and Soundwire manager is not
>>>>> disabled during suspend callbacks.
>>>>> 2) ClockStop Mode - Only apply ClockStopMode0 on Soundwire manager side and restore
>>>>> the clock when resume sequence is invoked (even in case of system level suspend also)
>>>>> 3) ClockStop Mode + Bus reset - Apply ClockStopMode0 when Sound wire manager entering
>>>>> runtime suspend state. In system level resume case, apply clock stop exit and bus reset which
>>>>> will re-enumerate all peripheral devices over the links.
>>>>> 4) Power off mode: apply Clock Stop + SoundWire manager IP power off sequence.
>>>>> Parent device(ACP) will be powered off. ACP can wake up for in band wake-up events.
>>>>>
>>>>> We expect if someone wants to go with only ClockStop mode, peripheral side also required
>>>>> support should be enabled.
>>>> I am not following any of this. You wrote both
>>>>
>>>> "
>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>> SoundWire manager device is in D3 state.
>>>> "
>>>>
>>>> and
>>>>
>>>> "
>>>> Parent device(ACP) will be powered off. ACP can wake up for in band
>>>> wake-up events.
>>>> "
>>>>
>>>> I can't figure out how you deal with wake-ups and when exactly you
>>>> expect jack detection to be functional.
>>> Both power modes (case 2 & case 4) are different.
>>> The current patch series is targeted to address JD events during system level
>>> suspend/resume scenario, when ClockStop Power mode is selected.i.e case 2
>>> as mentioned above. We're not expecting bus reset during system level resume in
>>> this power mode.
>>> As SDCA interrrupts are not enabled on peripheral side during system level resume,
>>> No JD events are reported.
>>>
>>> Test scenario will be let system level supend gets invoked. During suspend, plug/un-plug jack.
>>> During system level resume, JD status should be reported correctly.
>> This is completely different to the definition of 'clock stop mode'.
>> What you want is to make sure the status is reported correctly when the
>> system resume, not to resume the system using the clock stop exit
>> mechanism at the initiative of the peripheral.
> No.  What we want to convey here is in system level resume for SoundWire manager,
> clock stop exit sequence will be invoked.
> After clock stop exit sequence completed, we expect JD alert should be reported if there is any
> JD event during Sx/D4 state.
> As SDCA interrupts are disabled previously when system level suspend
> is invoked on peripheral side, even after finishing clock stop exit sequence, we are
> no longer observing Jack alerts as SDCA interrupts are disabled.

The existing code in the codec driver disables the IMPL_DEF or SDCA
interrupt in the system suspend routines, no matter what happens on the
manager side.

see e.g. rt711_dev_system_suspend

This patch really has nothing to do with clock stop mode0 proper.

I think what happens is that if there is a new attachment, the
sdw_initialize_slave() helper will re-enable the IMPL_DEF or SDCA
interrupt, and that does not happen if there is no attachment and
re-enumeration.

I will be looking forward to the v2, but as I indicated earlier it might
be a better idea to fix this difference in programming flows in the
clock stop exit code rather in some specific codec drivers.

