Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A26745EFF
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 16:46:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 968071D7;
	Mon,  3 Jul 2023 16:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 968071D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688395602;
	bh=bApDwKCOm+XYqIYVIAE35RHSf1AqP6RPHHaPqmEQ1Yc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vHoWief+wk4FX7RlH9IJ90ugTSMSngmMCZCEprt8I8LudbElIHFJnN0ZsUEMTr9SF
	 d2WzyxZIKTMpsmHg8YoRNHcpW2dqhMeuxj5XCC+pImSTuHRZopydmCczPp7P2K5B1Y
	 E1Q65C/xZjMbxyCGM7F50Pv8INB8ip5n2S0EAgoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 752A4F80124; Mon,  3 Jul 2023 16:45:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A5B7F80124;
	Mon,  3 Jul 2023 16:45:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E50F80125; Mon,  3 Jul 2023 16:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A146F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 16:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A146F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O3IBUaxL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688395525; x=1719931525;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bApDwKCOm+XYqIYVIAE35RHSf1AqP6RPHHaPqmEQ1Yc=;
  b=O3IBUaxLQS6TG4Kf40hTGJG/EppRlIJXnsXd5OANfRbfG5+NugkoOiQg
   n/KyL6PMbtTGf3DGsUPoFtIAbjaByQLDjvLJKzutinNyXi6evxAzTCRz/
   FREkuZCQ5u1Z2XMCc2tHKwa/4FSNlm9mmNowSQSbR8sAn9+p1tlGfn9DF
   KzfUnZf2Ua7+0sRZ614uQODlQ/oLkbsvhjmb+rGH6lj2QiSiE8CB+HkAy
   VKlOP8NNs3GOZ5LHO1N+rkgPTCDsOZ2d/h8QV4YfaY5wbQPYyzEDXCFDz
   5REobrANhHfOeC/xj4L6lWAxyuJRn+6VedA0xJFawzelx8yyaC/0B7QKy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="361758433"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="361758433"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 07:45:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863110547"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="863110547"
Received: from agherasi-mobl.ger.corp.intel.com (HELO [10.251.218.180])
 ([10.251.218.180])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 07:45:11 -0700
Message-ID: <95586650-6a22-f760-5eb7-0e1e3a5c0346@linux.intel.com>
Date: Mon, 3 Jul 2023 16:45:03 +0200
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a8c7ac88-4546-2b57-6f26-5ae2a9e603e4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I7BW4SWA6ULYZHWXQ7Y4RIILAUUW47RG
X-Message-ID-Hash: I7BW4SWA6ULYZHWXQ7Y4RIILAUUW47RG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7BW4SWA6ULYZHWXQ7Y4RIILAUUW47RG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/3/23 16:46, Mukunda,Vijendar wrote:
> On 03/07/23 19:50, Pierre-Louis Bossart wrote:
>>
>> On 7/3/23 15:31, Mukunda,Vijendar wrote:
>>> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>>>> I can see that the interrupts are disabled in
>>>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>>>> is used... I don't think this commit message is correct.
>>>>>>>
>>>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>>>> otherwise that would break the jack detection.
>>>>>> You are right. The commit message is wrong and not clear.
>>>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>>>> system suspension.
>>>>>
>>>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>>>> in the .prepare stage.
>>>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>>>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>>>
>>>> Hi Vijendar,
>>>> Do you have any comments?
>>> On AMD platforms, we are supporting two power modes.
>>> 1) Bus reset mode
>>> 2) Clock Stop Mode
>>>
>>> In Bus reset mode, bus will re-enumerate the peripheral devices
>>> whereas in ClockStop Mode, applying ClockStop Mode0
>>> in both pm ops (runtime pm ops and system level pm ops).
>>>
>>> Currently, SDCA interrupts are disabled on peripheral side, when system level
>>> suspend is invoked.
>>> For ClockStop mode SDW manager is not receiving any jack alert when
>>> SoundWire manager device is in D3 state.
>> That was precisely the point of clock stop mode: a peripheral can
>> restart the system even when it's in lower-power mode.
>>
>> If there's no means to let a peripheral restart, the only benefit is
>> maybe to skip the enumeration time. That's not what the spec intended....
> As per our understanding, you are pointing to ClockStopMode1.
> ClockStopMode1 requires re-enumeration as peripherals move
> to unattached state.
> We have cross-checked ClockStopMode0 description in spec.
> It doesn't specify about peripheral device state as Unattached.
> We are referring here "ClockStopMode0" only.

No I was describing the difference between the 'Bus reset mode' and the
'clock stop mode' on the manager side.

There's also nothing in the spec preventing the manager from doing a
reset at any time, including after exiting the clock mode0 stop.


