Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A200362145
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 15:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB3D1697;
	Fri, 16 Apr 2021 15:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB3D1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618580552;
	bh=tODC53mTEw5XVtj1DiWkNGGrev2hUNxtH9dZ9/hLV4U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UPbFDgcgCz6esRZssLq+wpeOhvE8rU+7KKl5ebM1GGr8ifpGEW5JGv/2LuKDE2Lsh
	 rVNobCVgLHkDN4QeGlJQdsNi2Y8uCXjfX4OwDTyY81A/PW4lg3Y0bmPHI/LqBpNT/P
	 Gs0R0ZXLlW09DgY5uGnTVYB+W/7RFq1J8QPxc/lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22B5BF80269;
	Fri, 16 Apr 2021 15:41:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D54E5F8025B; Fri, 16 Apr 2021 15:41:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC429F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 15:40:54 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CB656A0040;
 Fri, 16 Apr 2021 15:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CB656A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618580453; bh=ItVdfMpMCDuKBkW2RP0Gvi3k5y9Z7hJyIcoKzaaLJMA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=vvSLm2R3Wic8D+2wv7fvK2+O3gCAat1jQtFi5qjMrITaZuf3/paMlPnCc6UhsjIO3
 9tJAIR3Q5rOCPBjUCQYtg7CYxRCmvPJ21tON4sminEcjEglF7C4efWQIqJOJRel8ur
 f174Ukn5cfV3maUVMuY13FmIm2zz0TsZ0z7/Yg68=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 16 Apr 2021 15:40:41 +0200 (CEST)
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jack Yu <jack.yu@realtek.com>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
 <20210330170915.GH4976@sirena.org.uk>
 <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
 <3102f11c-d2bc-c53e-ac68-60628b990515@linux.intel.com>
 <5292be30-7e2d-c2f2-85ed-a1a609feb6c6@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4166fcbe-4e62-74f4-b4cc-241ddd07e9dc@perex.cz>
Date: Fri, 16 Apr 2021 15:40:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5292be30-7e2d-c2f2-85ed-a1a609feb6c6@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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

Dne 15. 04. 21 v 23:35 Pierre-Louis Bossart napsal(a):
> 
> 
> On 3/30/21 2:26 PM, Pierre-Louis Bossart wrote:
>>
>>
>>>>> Using new kcontrols "Capture Switch" and "Capture Volume" instead,
>>>>> remove kcontrols which no longer be used.
>>>>
>>>> Is this going to disrupt any UCM profiles?
>>>
>>> Yes (the rt715 prefix is from the SOF driver):
>>>
>>> # RT715 specific volume control settings
>>>
>>> BootSequence [
>>>     cset "name='rt715 DMIC3 Boost' 2"
>>>     cset "name='rt715 DMIC4 Boost' 2"
>>>     cset "name='rt715 ADC 24 Mux' 3"
>>>     cset "name='rt715 ADC 25 Mux' 4"
>>>     cset "name='rt715 ADC 27 Capture Switch' 1"
>>>     cset "name='rt715 ADC 07 Capture Switch' 1"
>>>     cset "name='rt715 ADC 07 Capture Volume' 58"
>>> ]
>>
>> To be clearer, we wanted to change the UCM files to only try to 
>> configure the 'old' controls when they are present. The 'new' controls 
>> are aligned between RT715 and RT715-sdca.
>>
>> There will be a minor inconvenience if an existing platform updates the 
>> kernel without updating UCM files, but it's the only solution we found 
>> in earlier discussions.
>>
>> Distributions are typically faster with alsa-ucmconf updates than kernel 
>> changes so that inconvenience is likely very limited (we support 4-5 
>> Dell CML/TGL platforms w/ SoundWire)
> 
> Was there any sustained objection to this change? Mark and Jaroslav?
> 
> I would really like to fix the UCM files so that the mute and volume are 
> handled at the codec driver level, and not at the SOF level as it's 
> currently the case.
> 
> The existing solution really makes no sense, it was 'inspired' (in the 
> copy-paste sense) by the PCH-DMIC handling for HDaudio platforms. In 
> that case, it made sense to use SOF-level mute/volume because such 
> controls don't exist in microphones.
> 
> With RT715 we need to use the controls in the codec driver, not the 
> firmware.

I'm basically ok to do any change which simplifies things. The user-space
downgrade is possible but less used.

The only my concern is that RT715 as an universal codec can handle the
multiple stereo streams (current controls mapping) or the multichannel stream
(new proposed controls mapping). The ASoC codec code should be universal, so
it's a question, how to model the controls and how to detect and set the
model. I think that we're missing a communication way between the DMA /
machine driver and the codec driver. Yes, we can add DMI checks to RT715, but
usually, the specific machines are already detected in the higher layer
(soundwire bus, pci bus). It would be really nice, if the SOF driver can do a
query: "If present, I need RT715 codec in the multichannel mode.".

So my opinion is that both mappings may exist and the correct one should be
selected at runtime. So I won't delete the old mapping, it may be usable. Mark?

BTW: I already implemented the control remap plugin to alsa-lib, so you can
split / merge controls with similar parameters as you like now. I need to do
more test with the UCM integration, but it's here.

https://github.com/alsa-project/alsa-lib/blob/master/src/control/control_remap.c#L1197

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
