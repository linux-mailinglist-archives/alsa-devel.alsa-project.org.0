Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBFD2DB22F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 18:07:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1E8917FC;
	Tue, 15 Dec 2020 18:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1E8917FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608052060;
	bh=iNlAT6r7j7JPwCLTwoTsGRvKbbJm4HhhJIl5RoNtq1k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTT3+n4DfdM6sPyCI+AsjpVV94oG0sWyzbCNy2ja42ts2lyvYVlWp17NP4e0T/6Nh
	 UypPSSYORIWF4KwmbTpEiazgWVo7gOve3qFZDIwMiuOLdQrENV0FjNbSplyz/k6nk6
	 gx4p/i0J2SvVCePpk3v8zMJ6NU5dxRmc2B3ZSqck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F25BF8014B;
	Tue, 15 Dec 2020 18:06:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 481A7F8014B; Tue, 15 Dec 2020 18:06:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_65,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17CD4F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 18:05:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17CD4F8014B
IronPort-SDR: coa5Hbx67Pt2U4Tr2M6i2ksVus0ms/8PeEOv3XQtyzMLKRODP006hsZT3dALTzKe8ScVsNbd0t
 lWSgibx5q3Hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="239012261"
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="239012261"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 09:05:48 -0800
IronPort-SDR: X7ciw/tjwRCy5BBXGika7+sq6qERzabB50sb9FxWPUNddbYDbQ+uPm9G76xZWZlOyvXWaIUvGA
 wdyCRFfK8tuA==
X-IronPort-AV: E=Sophos;i="5.78,422,1599548400"; d="scan'208";a="383682265"
Received: from yikrimon-mobl1.amr.corp.intel.com (HELO [10.213.173.225])
 ([10.213.173.225])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 09:05:47 -0800
Subject: Re: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
To: Jaroslav Kysela <perex@perex.cz>, jack.yu@realtek.com,
 broonie@kernel.org, lgirdwood@gmail.com, Takashi Iwai <tiwai@suse.de>
References: <20201214064903.2746-1-jack.yu@realtek.com>
 <8eeddc8c-91cb-e62d-6114-547117d4d83e@perex.cz>
 <0096059b-de76-d9a3-2446-b4c3becabce8@linux.intel.com>
 <0b0afd81-0595-c661-ec1e-e81b7e8f8fec@perex.cz>
 <7d74544f-77f2-db01-db3d-d1d8a56d576d@linux.intel.com>
 <cb07f528-6c2f-1357-db54-e3d062ad6dd3@perex.cz>
 <bcdc2aba-ab7e-08bf-7e25-02e38c9d660d@linux.intel.com>
 <feb43fc8-39a3-9c50-1193-9115603c8fb8@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7bc9d35f-8bd6-4922-1900-8af729443377@linux.intel.com>
Date: Tue, 15 Dec 2020 11:05:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <feb43fc8-39a3-9c50-1193-9115603c8fb8@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 derek.fang@realtek.com, bard.liao@intel.com, shumingf@realtek.com,
 flove@realtek.com
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


>>> My suggestions are (pick one):
>>>
>>> 1) create one multichannel control and remove the stereo controls when the
>>> hardware is detected (no functionality dup)
>>
>> we can't remove controls that existed before, this might break userspace
> 
> It's not widely used, so it would be better to break things now than later.

rt715 has been used on CometLake-based devices for a while (1.5 years?).

> But I see that others are a bit conservative.
> 
>> with older UCM files that touch those ADC07 and ADC27. That's why we
> 
> The upstream UCM files don't refer to those controls.

they do, unfortunately, see ucm2/codecs/rt715/init.conf

cset "name='rt715 ADC 27 Capture Switch' 1"
cset "name='rt715 ADC 07 Capture Switch' 1"		
cset "name='rt715 ADC 07 Capture Volume' 58"

>> added a new one, to be backwards compatible with a user updates their
>> kernel.
> 
> Even if you don't remove the duplicate controls, the right abstraction is more
> appropriate in my eyes (better than vmaster extension). The double stereo -> 4
> channel array mapping is not fully correct (vmaster, proposed patch).

The hardware exposes registers to deal with two inputs separately, they 
are not duplicates. The point here is that we need a mapping to a 
simpler view where those two inputs are merged logically.

>>> 2) create proper vmaster control like for HDA playback
>>
>> That might be the better option. What was suggested in this patch is
>> essentially to introduce a layer that drives the actual controls, but it
>> was done 'manually' and may not follow the proper rules.
>>
>> That said I know absolutely nothing about 'vmaster controls', pointers
>> to a typical example would be greatly appreciated.
> 
> sound/core/vmaster.c ; The ASoC core will probably require another layer to
> support this?

I'll look into it.

>>> 3) wait until UCM can describe this hardware and set the DAC values manually
>>> to a sensible value via sequences (the specific hardware levels can be set
>>> using the conditions in UCM)
>>
>> Not an option, there are products that need to ship soon.
> 
> It's the easiest method for now. It's just about to change the UCM files
> without any other changes in the kernel / user space. It's heavily used for
> SST drivers, isn't?
> 
> The current UCM upstream modifies only SOF volume levels (PGA Master Capture).

that's not right, see above.

I may have misunderstood your point for 3). I assumed you'd need a 
description coming from the kernel, as we did before for the components 
(cfg-mics, etc). How would UCM know which of the controls to use without 
any change to the kernel?
