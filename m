Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BE745E65
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 16:21:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B45AE11C;
	Mon,  3 Jul 2023 16:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B45AE11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688394103;
	bh=FtVaa9WkRiE1IBKe6YWAitaMyXZ3w8A5ZiI0qzFOYv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Aw3/wnPz5JV4dpVJWA0zTx5eml7wuEos/9LX6NyKoLJLQOXaaLLi9+7XA6CffHlYo
	 PKK6d+5DzEY/Wx94XLHmy9dzwfoXII0eNzOymhzkv4Ydl5Ay/kM3y/lDEjRXNa7Q1s
	 AX8OUHAeqq8f8DCeGVzlNAV0aG12KWTiyH01xGeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 236BCF80100; Mon,  3 Jul 2023 16:20:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF01CF80104;
	Mon,  3 Jul 2023 16:20:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A29EF80124; Mon,  3 Jul 2023 16:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BA39F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 16:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA39F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C8y3zZR/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688394046; x=1719930046;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FtVaa9WkRiE1IBKe6YWAitaMyXZ3w8A5ZiI0qzFOYv4=;
  b=C8y3zZR/82oUbMFr3TOzfHZgW9C2OYH2Ap0GCPSk0BjvHw6iYTKoNju2
   BxWSpTMQvFMBAgYPgH34ZnfzyuuRDucW371/Pts3ciXb73cCyDEvdXBpt
   SSoTuPlcW4xkKxF0eufXz1z7kS3K4EmLnWxXt7KUNwKpllgdcL0WBpDr7
   pfSUXBdKjbJ26JKHeDF+uwA1L9j59N7YqEXqoy3wMymO6tOkHc46yf0Tl
   byZr3uPMmd80feX4dYG0HBSyOk8a5wBfvC3R7FK0Nwgt2YU/snANoT6eC
   7BP3jHU+3pJmOTHPL/s0uCO5DVXIeXFXDH9BMVFNytpkDasn+ZjNh3voc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="362931006"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="362931006"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 07:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788541053"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200";
   d="scan'208";a="788541053"
Received: from agherasi-mobl.ger.corp.intel.com (HELO [10.251.218.180])
 ([10.251.218.180])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 07:20:37 -0700
Message-ID: <80c35e78-b82b-5d8a-bce7-fa8bb61e16cd@linux.intel.com>
Date: Mon, 3 Jul 2023 16:20:34 +0200
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <489e8631-b773-1916-40a7-3fd73af54c19@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7QVL4P4JVGZBQSQM7BMQJ63U4UNBDWOR
X-Message-ID-Hash: 7QVL4P4JVGZBQSQM7BMQJ63U4UNBDWOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QVL4P4JVGZBQSQM7BMQJ63U4UNBDWOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/3/23 15:31, Mukunda,Vijendar wrote:
> On 03/07/23 18:30, Shuming [范書銘] wrote:
>>>>>> During ClockStop Mode0, peripheral interrupts are disabled.
>>>>> I can see that the interrupts are disabled in
>>>>> rt5682_dev_system_suspend(), which is NOT a mode where the clock stop
>>>>> is used... I don't think this commit message is correct.
>>>>>
>>>>> The IMPL_DEF interrupt which is used for jack detection is not
>>>>> disabled at all during any clock stop mode, and it shouldn't
>>>>> otherwise that would break the jack detection.
>>>> You are right. The commit message is wrong and not clear.
>>>> The situation is that the manager driver uses the clock stop mode0 to do
>>> system suspension.
>>>
>>> No it does not. The clock stop is ONLY used for pm_runtime, never for system
>>> suspend. We cannot go to system suspend with the link in clock-stop mode,
>>> that will create lots of issues, that's why we perform a full pm_runtime resume
>>> in the .prepare stage.
>> OK, I got your point. Thanks. However, this issue reported by AMD. 
>> The AMD platform validated system level pm and runtime pm ops with the different modes.
>>
>> Hi Vijendar,
>> Do you have any comments?
> On AMD platforms, we are supporting two power modes.
> 1) Bus reset mode
> 2) Clock Stop Mode
> 
> In Bus reset mode, bus will re-enumerate the peripheral devices
> whereas in ClockStop Mode, applying ClockStop Mode0
> in both pm ops (runtime pm ops and system level pm ops).
> 
> Currently, SDCA interrupts are disabled on peripheral side, when system level
> suspend is invoked.
> For ClockStop mode SDW manager is not receiving any jack alert when
> SoundWire manager device is in D3 state.

That was precisely the point of clock stop mode: a peripheral can
restart the system even when it's in lower-power mode.

If there's no means to let a peripheral restart, the only benefit is
maybe to skip the enumeration time. That's not what the spec intended....

> Our expectation is when ClockStop Mode is selected, Only ClockStopMode0
> should be applied for system level suspend as well.
> We are not expecting bus reset.
> 
> We have validated these changes on our platform with Clock stop mode.
> It's working fine.
> 
>>>> The SdW device will not be re-attached when the system resume.
>>> it will re-attach, and in addition it will lose context because the manager
>>> performs a complete reset of the bus.
>>>
>>> So what's needed is to enable the interrupt, no matter what happened in the
>>> suspend transition.
>>>
>>>
>>> ------Please consider the environment before printing this e-mail.
> 
