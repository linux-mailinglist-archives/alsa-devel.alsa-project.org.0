Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689C746A56
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 09:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BBA314E;
	Tue,  4 Jul 2023 09:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BBA314E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688454793;
	bh=pGHj6JNfG3lraJfxLrP89ERh5diuRirQIUTv+XQrymk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jOuRLycfFRJdxlmVP3GhuPf3uKBmVSUv6IiGp29W3+s8Q/WGxNxa3NLFqWqLWGot2
	 9/r/ASJXNHgaKKI2VPgnNlTagnD47IxOOA9kMqcU0o/YRE6R9QSt41c4rTXMePtVwa
	 9K49AAK9dHOj2U3ri/Rmla7sy+jhhmiThn3W7IOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0531F8053B; Tue,  4 Jul 2023 09:12:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA1BF80124;
	Tue,  4 Jul 2023 09:12:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73041F80125; Tue,  4 Jul 2023 09:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2FFAF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 09:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FFAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VCIoEQkJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688454733; x=1719990733;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pGHj6JNfG3lraJfxLrP89ERh5diuRirQIUTv+XQrymk=;
  b=VCIoEQkJ1sOBOg1Lv/SglQ+tB7jOo2VT/EHwDKzleDsJU+0PIXG8y7eT
   ImNtrPxxqnJlRqNYLRnKpxxBDzlLFEeT9XLXLs6NlnW8bev/6cHtE6H8Z
   DL6L0ocBvFgs8zmhoEa0004Xn/KrUgTLonsj/EqrAGEf6Lr08JhSEWV95
   SlU4Q1vku68M9p9A0eSG2HDgqqJ5jNNu5PXl8fyElrJfx+lZHPfEx36MV
   1gSkLmb07165Apci6TqGSO4WySWRI9j6SFZCT0bUGgS+Y5W10DYlwLNve
   ggckX+czW44qsgl4b7NXl2cvp9ZPIS00oSSzv4L4O9EHDmHbInVmWj2yN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="393798083"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200";
   d="scan'208";a="393798083"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 00:11:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863314689"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200";
   d="scan'208";a="863314689"
Received: from mkalif-mobl.ger.corp.intel.com (HELO [10.251.219.26])
 ([10.251.219.26])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 00:11:52 -0700
Message-ID: <ff732d09-b620-cdfd-d055-da116b99223c@linux.intel.com>
Date: Tue, 4 Jul 2023 09:11:49 +0200
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <abb4376e-15d3-6211-5024-03caf29c7a3f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H2XP372YPX577ZQDYP4NQPZARCJN2RDW
X-Message-ID-Hash: H2XP372YPX577ZQDYP4NQPZARCJN2RDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2XP372YPX577ZQDYP4NQPZARCJN2RDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/4/23 08:36, Mukunda,Vijendar wrote:
> On 03/07/23 22:48, Pierre-Louis Bossart wrote:
>>
>> On 7/3/23 17:18, Mukunda,Vijendar wrote:
>>> On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>>>> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>>>>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>>>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>>>>
>>>>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>>>>> otherwise that would break the jack detection.
>>>>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>>>>> system suspension.
>>>>>>>>>
>>>>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>>>>> in the .prepare stage.
>>>>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>>>>
>>>>>>>> Hi Vijendar,
>>>>>>>> Do you have any comments?
>>>>>>> On AMD platforms, we are supporting two power modes.
>>>>>>> 1) Bus reset mode
>>>>>>> 2) Clock Stop Mode
>>>>>>>
>>>>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>>>>
>>>>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>>>>> suspend is invoked.
>>>>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>>>>> SoundWire manager device is in D3 state.
>>>>>> That was precisely the point of clock stop mode: a peripheral can
>>>>>> restart the system even when it's in lower-power mode.
>>>>>>
>>>>>> If there's no means to let a peripheral restart, the only benefit is
>>>>>> maybe to skip the enumeration time. That's not what the spec intended....
>>>>> As per our understanding, you are pointing to ClockStopMode1.
>>>>> ClockStopMode1 requires re-enumeration as peripherals move
>>>>> to unattached state.
>>>>> We have cross-checked ClockStopMode0 description in spec.
>>>>> It doesn't specify about peripheral device state as Unattached.
>>>>> We are referring here "ClockStopMode0" only.
>>>> No I was describing the difference between the 'Bus reset mode' and the
>>>> 'clock stop mode' on the manager side.
>>>>
>>>> There's also nothing in the spec preventing the manager from doing a
>>>> reset at any time, including after exiting the clock mode0 stop.
>>>>
>>>>
>>> Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
>>> and re-enumeration is required.
>>> If continuous parity errors/bus clash conditions are reported over the link,
>>> Sdw Manager bus reset sequence should be invoked. This is a different scenario.
>>> Both the scenarios are asynchronous.
>>>  
>>> Going with Spec definition for ClockStopMode0, as it's Imp defined for
>>> SoundWire Manager, want to stick to Clockstop when D3 call is invoked
>>> and restore the clock when D0 call is invoked for our platforms.
>> The problem is that 'D3' can be used for two separate scenarios
>> - S0/D3: that's pm_runtime suspend
>> - Sx/D4: that's system suspend
>> It's very unclear what the benefit of clock stop mode would be for the
>> latter case.
>>
> We are pointing system level suspend scenario only.
> 
> We have already SoundWire Power off mode - ClockStop Mode will be
> applied followed by bus reset and SoundWire manager will be disabled.
> On parent side, ACP soft reset will be applied and ACP parent driver can
> wake for PME events for Soundwire manager.
> 
> Sx/D4 case, want to avoid re-enumeration when multiple peripherals are connected.
> For Clock Stop + Bus reset (keeping Sdw manager enabled), we can define a new power mode
> on SoundWire manager side.
> 
> Having said that, below are power modes we want to support on our side.
> 
> 1) Idle Mode - Don't stop the clock for SoundWire manager and Soundwire manager is not
> disabled during suspend callbacks.
> 2) ClockStop Mode - Only apply ClockStopMode0 on Soundwire manager side and restore
> the clock when resume sequence is invoked (even in case of system level suspend also)
> 3) ClockStop Mode + Bus reset - Apply ClockStopMode0 when Sound wire manager entering
> runtime suspend state. In system level resume case, apply clock stop exit and bus reset which
> will re-enumerate all peripheral devices over the links.
> 4) Power off mode: apply Clock Stop + SoundWire manager IP power off sequence.
> Parent device(ACP) will be powered off. ACP can wake up for in band wake-up events.
> 
> We expect if someone wants to go with only ClockStop mode, peripheral side also required
> support should be enabled.

I am not following any of this. You wrote both

"
For ClockStop mode SDW manager is not receiving any jack alert when
SoundWire manager device is in D3 state.
"

and

"
Parent device(ACP) will be powered off. ACP can wake up for in band
wake-up events.
"

I can't figure out how you deal with wake-ups and when exactly you
expect jack detection to be functional.
