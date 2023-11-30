Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8957FECA5
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 11:18:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE10EDEE;
	Thu, 30 Nov 2023 11:18:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE10EDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701339509;
	bh=5jsacmvBALOHWz7y2PUaRkFCKOb9LzR5Y0B/O+PFFjc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a1J7SBYMKkAjZD5OAaua/OqXoTNY1KfX94tavFR44U39+wPIsWTWBi28bKsfjrFHy
	 C18JupfIWKhEnR/dM2vfntc3ivALw2U4lECALAGgKgL2W80aJWT7POh4rAg2+dgsuh
	 j1kzBiwR6tCcmgZCpG7gMpa7CxK8eoTbz+BG0yWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55474F80236; Thu, 30 Nov 2023 11:17:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E23E4F80571;
	Thu, 30 Nov 2023 11:17:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15471F8016E; Thu, 30 Nov 2023 11:15:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCADFF8007E
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 11:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCADFF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=WXhrjwU2
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AU7sZxA020532;
	Thu, 30 Nov 2023 04:15:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=2hNTdVUxrzaDkinYp1MChiVUXBhmXLoPIn8BcKRzI24=; b=
	WXhrjwU2RJAAV4/wRGmnqXcSWZWberNWAz5BDSFQOxbrw3dlhUH/wJr45cxWBDwo
	jCwn41SlwcUbaC2jvACMYApwkeeoOww/BcnwD1rfcncP/YTzxt495peA4I1i1dJx
	YKFj8RimzlsypAdF5/dIVsnbOAX5sNALxr2bR8Jo7jgFH/wzXHAl7JYR7iBKDOBu
	3+2hyn1XLTA6icONSFlEDdIeo1Aqy2eTOV05+UXlANLEUqtpGsGw4nkbmJcJFT/7
	52OTPAAgYU/JDr7+LWUckZYCirTJlmDuCVOSXlgCBpzX1kQ20K7SOHNrEuMAI7Ny
	3GbRqlQl3UJAZYksh/+kIg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3unvprswcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 04:15:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 30 Nov
 2023 10:15:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Thu, 30 Nov 2023 10:15:17 +0000
Received: from [198.61.65.94] (EDIN4L06LR3.ad.cirrus.com [198.61.65.94])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D479FB12;
	Thu, 30 Nov 2023 10:15:16 +0000 (UTC)
Message-ID: <1b77a7b5-5988-49b2-b356-0d24bb01909d@opensource.cirrus.com>
Date: Thu, 30 Nov 2023 10:15:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs56l56 support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <kai.vehmanen@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
        <cezary.rojewski@intel.com>, <yung-chuan.liao@linux.intel.com>,
        <ckeepax@opensource.cirrus.com>, <yong.zhi@intel.com>,
        <chao.song@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
 <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
 <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
 <cb768f03-9d46-432e-ad67-8ff1ef075385@linux.intel.com>
 <6038c9fa-8cb1-46e1-b856-d759a3f990b3@opensource.cirrus.com>
 <5e9b0b69-6108-4909-90e8-257c13c2d886@linux.intel.com>
 <d2de7d4c-3984-4737-b879-a1fa829007ff@opensource.cirrus.com>
 <7bae01ac-a0de-47d9-9bd3-6bdfc48e02c1@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <7bae01ac-a0de-47d9-9bd3-6bdfc48e02c1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -5zaWQktmOl-Okc99SaANp49wD2Qo3XP
X-Proofpoint-GUID: -5zaWQktmOl-Okc99SaANp49wD2Qo3XP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: B26CMYWGHYQR7227CTEV3CTEDAGCKMTA
X-Message-ID-Hash: B26CMYWGHYQR7227CTEV3CTEDAGCKMTA
X-MailFrom: prvs=7698fbff26=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B26CMYWGHYQR7227CTEV3CTEDAGCKMTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/11/23 16:39, Pierre-Louis Bossart wrote:
> 
>>>>>>> +        .name_prefix = "cs35l56-8"
>>>>>>
>>>>>> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
>>>>>> CS35L56-hda driver? This prefix is used to find the matching firmware
>>>>>> files and our naming convention for these has been cs35lxx-xxxx-ampn
>>>>>>
>>>>>> Is there anything that depends on the prefixes being "cs35l56-n" ?
>>>>>
>>>>> IIRC this name_prefix is just used for the codec_conf and hence for
>>>>> control names/UCM. At some point userspace/driver need to know if amp5
>>>>> is left or right.
>>>>>
>>>>> We can certainly align on conventions but the values set in this ACPI
>>>>> match table will not be used for firmware download - different scope.
>>>>>
>>>>
>>>> They are used for our firmware download. Each amp can have its own
>>>> unique firmware file. The ALSA prefix is used to identify which firmware
>>>> file to load to which amp.
>>>
>>> The prefix will only be used when the card is created, specifically for
>>> control names.
>>> The firmware should be selected and downloaded when the device shows up
>>> on the bus.
>>> Card creation and device enumeration/initialization happen on different
>>> timelines, if the machine driver is "blacklisted" or unbound I am not
>>> sure what happens.
>>>
>>> There is a dependency between machine driver probe and codec firmware
>>> download that I am not able to follow, can you please elaborate?
>>>
>>
>> The codec driver has to choose which firmware to load from under
>> /lib/firmware. It does this using a combination of SSID (to identify the
>> target product), the ALSA prefix string (to identify which amp) and
>> in some systems a GPIO on the motherboard to select between different
>> models of speaker when they have multiple suppliers. This results in a
>> firmware name like:
>>
>> cs35l56-<silicon rev>-dsp1-misc-<SSID>[-<SPEAKER MODEL>]-<ALSA PREFIX>
>>
>> You can see this if you look in the linux-firmware repo under cirrus/
>> for cs35l41 firmware files (though the ALSA PREFIX section in those
>> cases is not "AMPn" because they are not SDCA parts with rotation,
>> they have a fixed left/right assignment.)
>>
>> We have to be careful of the length of the prefix. The 44 characters of
>> an ALSA control name get eaten up very quickly when we start creating
>> fully-qualified names for controls published by the firmware. So "AMPn"
>> was nice because it was descriptive enough but only uses 5 characters
>> of the 44.
>>
>> Having said that, I've calculated that we have enough characters (just)
>> to use a prefix of "cs35l56-n". If there's a reason why that is
>> necessary/desirable for SOF or SoundWire then we could do that. But we'd
>> intended to use "AMPn" prefixes.
>>
>> We just need to decide whether to go with "AMPn". Or switch to using
>> "cs35l56-n" for the ALSA prefix (the therefore the qualifier at the end
>> of the firmware filename).
> 
> Yes we have similar issues with control names in topology, the limit is
> hit very quickly.
> 
> I think you missed my point though that the ALSA prefix is only set when
> the card is created, which can be sometime after the firmware needs to
> be downloaded. I guess you could pick the firmware in the component
> probe, which happens during the card creation, but that could be
> sub-optimal. Given the download times you want the download to proceed
> as early as possible.

We kick off a background task from our component_probe() to do the
firmware download. We need the ALSA prefix, and also the wm_adsp library
that actually handles the DSP is ASoC code so it needs a probed
component. Doing it in a background work means it doesn't block probe().
And the download to multiple amps can proceed in parallel - obviously
that's constrained by bus bandwidth but we are seeing that they
interleave.
