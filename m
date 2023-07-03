Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E066774614E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 19:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DEDB210;
	Mon,  3 Jul 2023 19:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DEDB210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688404765;
	bh=eF75tb7ROt4h+x8bKjlBrw+3XRmpNdiu+jwBZeASNYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tYnHbcSa92YSRazwqObR22rVDIDBg16vgMdh0ES6HxB1LkVIL5zPfGaEkWTF+Eww0
	 nFwPk5cqkwkwVZJramgZlKzYYiKRSqZHAcd4aRUg7nxL+woavYEFg9qXwGcwJ1vab6
	 pYmm73Dbuhe/V3lzUXT+TETiS28O72JVRePXhRQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 737B2F80132; Mon,  3 Jul 2023 19:18:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75314F80124;
	Mon,  3 Jul 2023 19:18:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F3E1F80125; Mon,  3 Jul 2023 19:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBEA8F80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 19:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBEA8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kj9MJN0j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688404697; x=1719940697;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eF75tb7ROt4h+x8bKjlBrw+3XRmpNdiu+jwBZeASNYc=;
  b=kj9MJN0js8yNrL6ckBHSNpolNrlPdquTRDCHpTb+Gx377/wCxBhY1rVO
   J+SV+Dwbyd5OaINc97MNmtgQdLDRmkL8pk+YexjHv6ZFzZq7vUJ6n+qsK
   AWApVNMdoTpoZKOFv34esQvOlTddUfXN+CFBiwWRPXBRvHuMrKFsO+41D
   k85lZFgHrTWdUsLkfUpCwo9g9WSfLRxrJ1zw1aaE6oHD2NMuvwp1n0yop
   kXWBoiVkOhOk3jn/FFl2pylLEDTyZURv4uJQ6XsZQR/0O7YVtgDvUgXHK
   UBcZk7jgPe9FNeyUgbgVRSxQ/+pmxlRx68pAKSGKKJgLus68BptzZ1lsp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360412185"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="360412185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 10:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748182927"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="748182927"
Received: from agherasi-mobl.ger.corp.intel.com (HELO [10.251.218.180])
 ([10.251.218.180])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 10:18:05 -0700
Message-ID: <7e6faede-af5c-c251-d6eb-cc3590b36337@linux.intel.com>
Date: Mon, 3 Jul 2023 19:18:01 +0200
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
 Bard Liao <yung-chuan.liao@linux.intel.com>
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <7c8b7cc9-125e-e97e-2a42-046a025d4e94@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22JAFEJSHQDLNZILWCBHDIQNQI6YXWBP
X-Message-ID-Hash: 22JAFEJSHQDLNZILWCBHDIQNQI6YXWBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22JAFEJSHQDLNZILWCBHDIQNQI6YXWBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/3/23 17:18, Mukunda,Vijendar wrote:
> On 03/07/23 20:15, Pierre-Louis Bossart wrote:
>>
>> On 7/3/23 16:46, Mukunda,Vijendar wrote:
>>> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>>>> I can see that the interrupts are disabled in
>>>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>>>
>>>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>>>> otherwise that would break the jack detection.
>>>>>>>> You are right. The commit message is wrong and not clear.
>>>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>>>> system suspension.
>>>>>>>
>>>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>>>> in the .prepare stage.
>>>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>>>
>>>>>> Hi Vijendar,
>>>>>> Do you have any comments?
>>>>> On AMD platforms, we are supporting two power modes.
>>>>> 1) Bus reset mode
>>>>> 2) Clock Stop Mode
>>>>>
>>>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>>>> in both pm ops (runtime pm ops and system level pm ops).
>>>>>
>>>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>>>> suspend is invoked.
>>>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>>>> SoundWire manager device is in D3 state.
>>>> That was precisely the point of clock stop mode: a peripheral can
>>>> restart the system even when it's in lower-power mode.
>>>>
>>>> If there's no means to let a peripheral restart, the only benefit is
>>>> maybe to skip the enumeration time. That's not what the spec intended....
>>> As per our understanding, you are pointing to ClockStopMode1.
>>> ClockStopMode1 requires re-enumeration as peripherals move
>>> to unattached state.
>>> We have cross-checked ClockStopMode0 description in spec.
>>> It doesn't specify about peripheral device state as Unattached.
>>> We are referring here "ClockStopMode0" only.
>> No I was describing the difference between the 'Bus reset mode' and the
>> 'clock stop mode' on the manager side.
>>
>> There's also nothing in the spec preventing the manager from doing a
>> reset at any time, including after exiting the clock mode0 stop.
>>
>>
> Partly I agree.  As per our understanding, If any of the peripherals lost's sync,
> and re-enumeration is required.
> If continuous parity errors/bus clash conditions are reported over the link,
> Sdw Manager bus reset sequence should be invoked. This is a different scenario.
> Both the scenarios are asynchronous.
>  
> Going with Spec definition for ClockStopMode0, as it's Imp defined for
> SoundWire Manager, want to stick to Clockstop when D3 call is invoked
> and restore the clock when D0 call is invoked for our platforms.

The problem is that 'D3' can be used for two separate scenarios
- S0/D3: that's pm_runtime suspend
- Sx/D4: that's system suspend
It's very unclear what the benefit of clock stop mode would be for the
latter case.

