Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60478782CE7
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 17:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDF7836;
	Mon, 21 Aug 2023 17:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDF7836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692630368;
	bh=qupK0g8s/ocrmFYgoer4MTNLeM3JnjHnnJ5OROhB9PM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SSAIM6DBsNZBnsTDy/yZX6gO6uRzPNjkdPQYW6Z+UQd1/4EDqGNJmkPTKO/aasGyr
	 tBxxFArb/+qtQK3iTW4LC2hNZi3GEFSdZmFuDdci3QVstBUfIMtcUK3L5mfUnlfMTQ
	 Y399QEuq6NCNTvk4oEy4egtAj5p9M6ZJhzUUCJ2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C43BF80536; Mon, 21 Aug 2023 17:05:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3BF9F80199;
	Mon, 21 Aug 2023 17:05:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1F54F8025E; Mon, 21 Aug 2023 17:05:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 236B8F8016C
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 17:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 236B8F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XUlMQ872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692630311; x=1724166311;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qupK0g8s/ocrmFYgoer4MTNLeM3JnjHnnJ5OROhB9PM=;
  b=XUlMQ872gTU8X9j7lZvM1MgnnjKLk/1zit9AJdqhhuQgFCt+qSrk+84J
   2NZl3nICMPDBJ2Eg7fnAHBf5hL4vS/SUKDerXP3k1HcDCkFgYxSB4nfy1
   SUbVZIUif3EuCCCjLSE0YIskQnTlMt0nwDVhyG+bFkJHoIXoa1NBpKXkB
   IAEWyNaTkAgWmhsxO/2lTd9nXE8EKQ7IDWkhwv57p66yLDdr3fyxVPEFk
   VDTYCjxRzlkFjCWGdS/KY5lHLqolcp/ce+J8r/BmVWdsMm4nVejiPXS46
   TnE+aba6Dx611gq6PP+K+X3HUCEyLsCPFIIHJXN/dFgpO/GHFoIMfV+2V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="353185340"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="353185340"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 08:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="825953719"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200";
   d="scan'208";a="825953719"
Received: from bogatsen-mobl1.gar.corp.intel.com (HELO [10.213.186.228])
 ([10.213.186.228])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 08:04:54 -0700
Message-ID: <0b6aa842-ca82-f269-acfc-11624a0e787f@linux.intel.com>
Date: Mon, 21 Aug 2023 10:04:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, robh+dt@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, mengdong.lin@intel.com, baojun.xu@ti.com,
 thomas.gfeller@q-drop.com, peeyush@ti.com, navada@ti.com,
 broonie@kernel.org, gentuser@gmail.com
References: <20230818085558.1431-1-shenghao-ding@ti.com>
 <9f910785-e856-1539-e3e4-c9817af5fe67@linux.intel.com>
 <87il9a9hu2.wl-tiwai@suse.de>
 <146f393a-665b-110b-b55b-d3452c3123e8@linux.intel.com>
 <871qfw78a1.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <871qfw78a1.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UFOTDYCCM2PNGFAIBF7DMWXR73IFU2I4
X-Message-ID-Hash: UFOTDYCCM2PNGFAIBF7DMWXR73IFU2I4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFOTDYCCM2PNGFAIBF7DMWXR73IFU2I4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/21/23 09:57, Takashi Iwai wrote:
> On Mon, 21 Aug 2023 16:43:31 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>>>> +static void tas2781_hda_playback_hook(struct device *dev, int action)
>>>>> +{
>>>>> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
>>>>> +
>>>>> +	dev_dbg(tas_priv->dev, "%s: action = %d\n", __func__, action);
>>>>> +	switch (action) {
>>>>> +	case HDA_GEN_PCM_ACT_OPEN:
>>>>> +		pm_runtime_get_sync(dev);
>>>>
>>>> test if this actually works?
>>>
>>> To be fair, most of driver codes don't check it, including the
>>> HD-audio core.  (Actually, over 900 of 1300 calls have no check in the
>>> whole tree.)
>>>
>>> It implies that forcing the check in each place is moot; rather the
>>> helper needs to be coded not to fail, IMO.
>>
>> Maybe that's true for HDaudio, for the SoundWire parts we absolutely
>> need to detect if the resume worked. There are more steps involved, the
>> clock-stop mode entry/exit, context restoration, re-enumeration, etc.
>>
>> I think it'd be a mistake to sit on our hands and assume the world is
>> perfect. We have to track cases where the codec isn't properly resumed
>> and prevent it from accessing resources that are just unavailable.
> 
> Yeah, I don't mean that it's wrong or bad to have the check.  The
> check should be there.
> 
> But, I feel that it's time to rather switch to the proper call.
> Basically pm_runtime_resume_and_get() is the better alternative
> (except for its long naming), and we may think of converting the
> whole.

Oh, I broke so many drivers by trying a well-indented conversion to
pm_runtime_resume_and_get().
The flow is different wrt -EACCESs and we ended-up with multiple errors.
In hindsight I wish we had left the legacy code alone.

>>>>> +static int tas2781_system_suspend(struct device *dev)
>>>>> +{
>>>>> +	struct tasdevice_priv *tas_priv = dev_get_drvdata(dev);
>>>>> +	int ret;
>>>>> +
>>>>> +	dev_dbg(tas_priv->dev, "System Suspend\n");
>>>>> +
>>>>> +	ret = pm_runtime_force_suspend(dev);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>
>>>> that's usually the other way around, for system suspend you either want
>>>> the device to be pm_runtime active, or if it's already suspended do nothing.
>>>>
>>>> This is very odd to me.
>>>
>>> This is a normal procedure, as stated in pm_runtime_force_suspend()
>>> definition:
>>>
>>> /**
>>>  * pm_runtime_force_suspend - Force a device into suspend state if needed.
>>> ....
>>>  * Typically this function may be invoked from a system suspend callback to make
>>>  * sure the device is put into low power state and it should only be used during
>>>  * system-wide PM transitions to sleep states.  It assumes that the analogous
>>>  * pm_runtime_force_resume() will be used to resume the device.
>>
>> It's possible that it's fine for HDaudio, it wouldn't work in all cases
>> for SoundWire where we have to make sure all pm_runtime suspended
>> devices are brought back to D0 and then the regular system suspend
>> happens. That's mainly because pm_runtime suspend relies on clock stop
>> and system suspend does not.
>>
>> In other words, this isn't a generic solution at all.
> 
> Well, I suppose rather that soundwire is an exception :)
> 
> For majority of devices, the system suspend/resume is nothing but
> pm_runtime_force_*() calls.  e.g. take a look at
> DEFINE_RUNTIME_DEV_PM_OPS() in linux/pm_runtime.h.

I guess you are right. SoundWire has indeed these quirky modes and
differences between SOC vendors that will force us to be extra careful
in what the codec driver implements.
