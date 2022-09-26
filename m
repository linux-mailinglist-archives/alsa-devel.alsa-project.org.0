Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045725EBB83
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 09:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5296F85D;
	Tue, 27 Sep 2022 09:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5296F85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664263947;
	bh=Fx2Xd/KdloDYAiEf264aMZg7fpUsBCeOrOVXnLI1cP8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kzDIoM25xQnq/p+ocx7efcVaH0q9y7jTgGsjihEiiCL1hMVB7amh2oZfN8CwXwcy9
	 1YMiKdFHpWmduURxtJmunI+bmBjGezdcpdIhdElEj6tAUYDyISfpR/9S2x65J429YH
	 iT3lQxpRGv59gdRATENGSZGGLMBK8Xm/FDF4OMmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEB8F80496;
	Tue, 27 Sep 2022 09:31:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADF30F8025E; Tue, 27 Sep 2022 09:31:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BC32F8011C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 09:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC32F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FNUVnqG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664263882; x=1695799882;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Fx2Xd/KdloDYAiEf264aMZg7fpUsBCeOrOVXnLI1cP8=;
 b=FNUVnqG6dL6VPIAMf8fmS72r4Y3/m+zy8PH5b7mQUnt7vNdPux+aYtm8
 4f1Gl5JfpprHFNEQxDuTSzRSEldx+9HoYpFLJ1a+jhCg2C5/7LyQageRU
 qzPIxDX2PaTownRmXPYNxmsYrwwXLfwcEWXAur845HynATrx1+L2AjHBz
 iZLINs4LclljlJBDamGjoy+2vuEWUrjxCbZ9Yg15thPssSuSzQkUVdQyU
 kXkpN6KCI3ez9f0kA0uxz37BXuSdYZ/XcRmcLowisHj2ZgccOXhiik2Ez
 0IFAsNUhS0/6i9Vjrn6WQ275nS2hWzCwozQCn3bGeRsA9s/zQmWMedsC2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301225295"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="301225295"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:31:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="866469428"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; d="scan'208";a="866469428"
Received: from patils-mobl1.ger.corp.intel.com (HELO [10.252.36.213])
 ([10.252.36.213])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 00:31:15 -0700
Message-ID: <8100f26f-df84-346d-3e5c-cf9a378f8027@linux.intel.com>
Date: Mon, 26 Sep 2022 18:07:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] ASoC: soc-dai: export some symbols
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220920034545.2820888-1-jason.zhu@rock-chips.com>
 <20220920034545.2820888-2-jason.zhu@rock-chips.com>
 <Yym2aURe2+pA3ocn@sirena.org.uk>
 <dfeac54a-a264-835a-f155-90eb8f093314@rock-chips.com>
 <Yy2s2PA/C1ngeb//@sirena.org.uk>
 <155e10c4-7b08-f1ec-9f28-42a3d982740f@rock-chips.com>
 <1dc563bf-feda-e11a-c159-91ae0529a36b@linux.intel.com>
 <YzHGPuajS54y1SV6@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YzHGPuajS54y1SV6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Jason Zhu <jason.zhu@rock-chips.com>, sugar.zhang@rock-chips.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com
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



On 9/26/22 17:33, Mark Brown wrote:
> On Mon, Sep 26, 2022 at 09:52:34AM +0200, Pierre-Louis Bossart wrote:
>> On 9/26/22 03:34, Jason Zhu wrote:
>>> 在 2022/9/23 20:55, Mark Brown 写道:
> 
>>>>> The data can not be lost in this process. So we attach VAD & PDM
>>>>> in the same card, then close the card and wake up VAD & PDM again
>>>>> when the system is goto sleep. Like these code:
> 
>>>> This sounds like a very normal thing with a standard audio stream -
>>>> other devices have similar VAD stuff without needing to open code access
>>>> to the PCM operations?
> 
>>> At present, only VAD is handled in this way by Rockchip.
> 
> The point here is that other non-Rockchip devices do similar sounding
> things?
> 
>>>> Generally things just continue to stream the voice data through the same
>>>> VAD stream IIRC - switching just adds complexity here, you don't have to
>>>> deal with joining the VAD and regular streams up for one thing.
> 
>>> Yes, this looks complicated. But our chip's sram which is assigned to VAD
>>>
>>> maybe used by other devices when the system is alive.  So we have to copy
>>>
>>> sound data in sram firstly, then use the DDR(SDRAM) to record sound data.
> 
>> There are other devices that requires a copy of the history buffer from
>> one PCM device and a software stitching with the real-time data coming
>> from another PCM device. It's not ideal but not uncommon either, even
>> for upcoming SDCA devices, combining data from 2 PCM devices will be an
>> allowed option (with additional control information to help with the
>> stitching).
> 
> If this is something that's not uncommon that sounds like an even
> stronger reason for not just randomly exporting the symbols and open
> coding things in individual drivers outside of framework control.  What
> are these other use cases, or is it other instances of the same thing?
> 
> TBH this sounds like at least partly a userspace problem rather than a
> kernel one, as with other things that tie multiple audio streams
> together.

I would tend to agree, the stitching can be either handled in DSP
firmware or in user-space. In the first case the kernel would expose a
single PCM to userspace, and in the second there would be two separate
PCM devices. The kernel drivers would typically do nothing other than
deal with moving captured data if/when available.

I also don't get the notion of 'keeping some DAIs alive when closing the
card', maybe the idea is to redefine what 'D3' means or have an 'active
standby' power state that doesn't exist today. That would in contrast be
something the frameworks know about.
