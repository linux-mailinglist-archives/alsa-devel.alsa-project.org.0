Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16322DB2A8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 18:33:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373FA1808;
	Tue, 15 Dec 2020 18:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373FA1808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608053604;
	bh=R1/2xo6QsDm2FnIf1bDfTzBsdIzQRV6j0+EiIJvQbZ8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A1t+jjrqlQGkOJEyaRo+iRCEJUSauirBFDM+gZ5DYECAd2s0eQMM0ZeTycMI4okae
	 Hai+kwoIWs0wKULeJqwWSBVLj0I94HuSZQ2FNVm1NYUaHUTpfq9MgFlpYtSYoDtQfA
	 9yNS+Ak2Lmm4gQyjdyZEjl0Uj9sUCDHt6qoC07S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B9B6F80129;
	Tue, 15 Dec 2020 18:31:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86474F80278; Tue, 15 Dec 2020 18:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5D23F80129
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 18:31:38 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8E926A0040;
 Tue, 15 Dec 2020 18:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8E926A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1608053496; bh=CKtLCeS1TBxlSpDyfui0BOKEjo3gxTXRoSHWj24DUG0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AfUvlAeuyimBV3EIl/+cSMW5G3GnnxdnIOpB31Yx2oxFSrm5I7oLWX728stFFGIsq
 jRU+G5FgSU8s/y4DTbXMn18mqc1Cws9Uaru3GbozL8a9YsUOvbSidja9gJTZV+n3/h
 cEd66HjbE8DbB8KG/2kXS4OO1IlC19CEAcsZs188=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 15 Dec 2020 18:31:24 +0100 (CET)
Subject: Re: [PATCH] ASoC: rt715: add main capture switch and main capture
 volume control
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com,
 Takashi Iwai <tiwai@suse.de>
References: <20201214064903.2746-1-jack.yu@realtek.com>
 <8eeddc8c-91cb-e62d-6114-547117d4d83e@perex.cz>
 <0096059b-de76-d9a3-2446-b4c3becabce8@linux.intel.com>
 <0b0afd81-0595-c661-ec1e-e81b7e8f8fec@perex.cz>
 <7d74544f-77f2-db01-db3d-d1d8a56d576d@linux.intel.com>
 <cb07f528-6c2f-1357-db54-e3d062ad6dd3@perex.cz>
 <bcdc2aba-ab7e-08bf-7e25-02e38c9d660d@linux.intel.com>
 <feb43fc8-39a3-9c50-1193-9115603c8fb8@perex.cz>
 <7bc9d35f-8bd6-4922-1900-8af729443377@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b25c849f-d1ed-f503-444f-3a49e0d03e7e@perex.cz>
Date: Tue, 15 Dec 2020 18:31:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7bc9d35f-8bd6-4922-1900-8af729443377@linux.intel.com>
Content-Type: text/plain; charset=utf-8
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

Dne 15. 12. 20 v 18:05 Pierre-Louis Bossart napsal(a):
> 
>>>> My suggestions are (pick one):
>>>>
>>>> 1) create one multichannel control and remove the stereo controls when the
>>>> hardware is detected (no functionality dup)
>>>
>>> we can't remove controls that existed before, this might break userspace
>>
>> It's not widely used, so it would be better to break things now than later.
> 
> rt715 has been used on CometLake-based devices for a while (1.5 years?).

But SDW is supported recently in the upstream Linux kernel. So there are no users.

>> But I see that others are a bit conservative.
>>
>>> with older UCM files that touch those ADC07 and ADC27. That's why we
>>
>> The upstream UCM files don't refer to those controls.
> 
> they do, unfortunately, see ucm2/codecs/rt715/init.conf
> 
> cset "name='rt715 ADC 27 Capture Switch' 1"
> cset "name='rt715 ADC 07 Capture Switch' 1"		
> cset "name='rt715 ADC 07 Capture Volume' 58"
> 
>>> added a new one, to be backwards compatible with a user updates their
>>> kernel.
>>
>> Even if you don't remove the duplicate controls, the right abstraction is more
>> appropriate in my eyes (better than vmaster extension). The double stereo -> 4
>> channel array mapping is not fully correct (vmaster, proposed patch).
> 
> The hardware exposes registers to deal with two inputs separately, they 
> are not duplicates. The point here is that we need a mapping to a 
> simpler view where those two inputs are merged logically.

Yes, but why to force stereo grouping when you need to control 4 independent
channels from the user space POV? I'm speaking about the forced 'stereo -> 4
channels volume / switch' mapping.

>>>> 3) wait until UCM can describe this hardware and set the DAC values manually
>>>> to a sensible value via sequences (the specific hardware levels can be set
>>>> using the conditions in UCM)
>>>
>>> Not an option, there are products that need to ship soon.
>>
>> It's the easiest method for now. It's just about to change the UCM files
>> without any other changes in the kernel / user space. It's heavily used for
>> SST drivers, isn't?
>>
>> The current UCM upstream modifies only SOF volume levels (PGA Master Capture).
> 
> that's not right, see above.
> 
> I may have misunderstood your point for 3). I assumed you'd need a 
> description coming from the kernel, as we did before for the components 
> (cfg-mics, etc). How would UCM know which of the controls to use without 
> any change to the kernel?

Ideally, yes - it will help to reduce the configuration and the driver already
knows more about the hardware. But we can do DMI matching in UCM for now, too.

Example of the sysfs substitution:

  ${sys:class/dmi/id/sys_vendor}
  ${sys:class/dmi/id/product_version}

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
