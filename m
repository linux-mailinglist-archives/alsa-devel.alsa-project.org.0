Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED07FD554
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 12:17:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A064AEA;
	Wed, 29 Nov 2023 12:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A064AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701256619;
	bh=FODjSU5o+NvCbMX9/UECJmPQiKIz0YZYAaKwDCxY4o4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NPOA1wgpS7VwyEN078AeHV4YSvd9qP12zyMKRqdFHWNF26JYAWARxoS8PnVQX7vF0
	 VRDcvnqw93xThOyqVUOPJc4mVEnWbq1MBLdEvzvdJiUW8P79FjUoQ7ajaySaXCm5FV
	 iz0lCeJk8JZQDOgOl+2Um8uVkBn1+qtmd/4zOkd4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 465A1F80246; Wed, 29 Nov 2023 12:16:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D40F80571;
	Wed, 29 Nov 2023 12:16:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DAF8F8016E; Wed, 29 Nov 2023 12:14:20 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 98134F8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 12:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98134F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bP71Zj6v
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT7gDnD028524;
	Wed, 29 Nov 2023 05:14:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=MCgVbuGY+ysDPlisJmO2UTuP0qj4DzLEgkYKhO84hIo=; b=
	bP71Zj6veDe2IPPXPe5KgtiiAB97Tz8PkFKDDbKBDZgQmlMCD1iPJ5YVYHi/H1kX
	83+Z05LygGdqMr1sFuy6Peo0sOEVttLRVHE0NpgeMbmxgubSYXJXAETV09UsY+UC
	BSYewe78G53Kys/62rUN2DbZ55lBUhcDR9l/2vaXgcr++JJbEsGz/fg++bH4wvTH
	NiQ1S08Jamftq0r6OrNDay9aIpG1xuA6sMij4doGt9rL2maVWQrBDNQ/OO2IFnn9
	zzmVqmUgvrANqzrihH1n6cvSS8tItphRlhQ/hTVFX7nLIPRyMF5XCBSbiKBrkMtp
	mKJf8SLBtLtlw8KI7Qi5YA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3unvprrbr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 05:14:04 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 29 Nov
 2023 11:14:02 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Wed, 29 Nov 2023 11:14:02 +0000
Received: from [198.90.251.82] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6C13A15A5;
	Wed, 29 Nov 2023 11:14:02 +0000 (UTC)
Message-ID: <d2de7d4c-3984-4737-b879-a1fa829007ff@opensource.cirrus.com>
Date: Wed, 29 Nov 2023 11:14:01 +0000
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
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5e9b0b69-6108-4909-90e8-257c13c2d886@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -kZ0FcbGSUmJf01B-E5wJw_mQU0GA_Ji
X-Proofpoint-GUID: -kZ0FcbGSUmJf01B-E5wJw_mQU0GA_Ji
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZXVNEP6H5GKOKPSN6AGPMGFAWEMTINJN
X-Message-ID-Hash: ZXVNEP6H5GKOKPSN6AGPMGFAWEMTINJN
X-MailFrom: prvs=769727a7d0=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXVNEP6H5GKOKPSN6AGPMGFAWEMTINJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/11/2023 15:23, Pierre-Louis Bossart wrote:
> 
> 
> On 11/28/23 04:31, Richard Fitzgerald wrote:
>> On 27/11/2023 17:36, Pierre-Louis Bossart wrote:
>>>
>>>>> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
>>>>> +    {
>>>>> +        .adr = 0x00003301FA355601ull,
>>>>> +        .num_endpoints = 1,
>>>>> +        .endpoints = &spk_r_endpoint,
>>>>
>>>> Assigning CS35L56 to "left" or "right" endpoints might be confusing.
>>>> All CS35L56 in a system receive both left and right channels and by
>>>> default they output a mono-mix of left+right.
>>>>
>>>> The left/right of an amp is determined by the firmware file (.bin) that
>>>> is loaded and the current settings of the "Posture" ALSA control. So
>>>> this amp might be the left channel after a .bin is loaded.
>>>
>>> That's a problem if the kernel does not know which amplifier is on which
>>> side, no? How would one change the balance if this information is known
>>> only within a binary/opaque firmware?
>>>
>>
>> SDCA allows the posture (orientation) of amplifiers to be changed at
>> runtime. CS35L56 is designed as a SDCA device so it doesn't have any
>> hardwired position. SDCA doesn't define what the posture numbers mean,
>> they are an integer that is system-specific.
>>
>> Because SDCA doesn't define the meaning of postures, and an SDCA device
>> should work with a generic SDCA driver (which obviously wouldn't have
>> hardcoded knowledge of the system) the speaker positions and postures
>> are coded into the firmware
>>
>> It's difficult to say what is "default". For example, if you say that
>> the default for a tablet is left/right/top/bottom, assuming it is
>> used in portrait orientation, that would be wrong if the user always
>> uses it in landscape.
>>
>> Matching by what amp is on what bus doesn't work well here because two
>> systems could have the same arrangement of CS35L56 on each bus but use
>> them for different purposes. So they could both match the "2 on bus 0, 2
>> on bus 1" table entry, but could be left/right/top/bottom on one device
>> and left woofer/right woofer/left tweeter/right tweeter on another
>> device.
> 
> In the absence of any platform firmware information, I am not sure how
> we can deal with such systems. The match tables are already hard to
> support given that a number of OEMs get the _ADR wrong, the speaker
> position is the next-level...
> 
> Or did you just volunteer to maintain a DMI quirk table for Cirrus-based
> systems :-)
>

Short answer: "That's SDCA."

I don't think a quirk table is needed. It's just that we can't hardcode
"this speaker is left, that speaker is right". SDCA defers orientation
changes to the amp through the posture control.

If you have a daemon to handle rotation, everything will be fine and
left audio is on your left. Let's say you have a tablet and you hold it
in portrait with left and right correct. You then rotate it 180 degrees,
if the daemon updates the posture control, the amps will swap channels
so left audio is still on your left, and right is still on your right.

If Linux distros don't have any daemon that can handle rotation, then
rotating the tablet 180 degrees is going to give you left and right
audio on the wrong sides. But that's what you'd expect if nothing is
handling rotation, and you'd get the same problem if it was all done
by changing the routing in ALSA controls but there was nothing to
change that routing.

Getting back to my original comment about endpoints. It really doesn't
matter what the endpoint structs are called because all they do is
declare the aggregation. I was only suggesting to maybe avoid names
that imply a specific function. When I said "Confusing" that was
overstating things. A bit misleading perhaps.

> I also bet that at some point the wrong firmware will be loaded on the
> wrong amplifiers, that could be fun as well.
>

Hence using the SSDI + ALSA prefix to qualify the firmware files. We aim
to push out all the firmware to linux-firmware for products we know
about. So far it's worked ok for CS35L41 and CS35L51 - problems with
those have been with incorrect ACPI.

>> I assume that if the system supports rotation there should be something
>> in the UCM or other userland that manages this. At least, it seems like
>> it's a UCM problem to decide which speakers are doing what audio.
>> If Linux-based distros don't have something like that - well, that just
>> means Linux is behind Windows.
> 
> SDCA has lots of fancy concepts, posture is one. Last time I checked we
> don't have any reports of the hinge angle in Linux so the best we can do
> is landscape/portrait, and even that is questionable given that tablets
> or detachables have not reached any developers so far. CI automation is
> another fun issue, we'll need robotic arms to move the device around and
> intelligent alsa-bat-v2 to verify sound levels...
> 
> The notion of which speakers do what is something that will clearly take
> years to figure out. For now the main issue is to get all parts
> connected and basic "loud enough" sound working.
> 

It's still the case that shiny new things on x86 platforms will be
designed around Windows and made to work there. Then Linux has to catch
up with that.

>>>> It would be better to have generic names for the endpoint that don't
>>>> imply position, for example:
>>>>
>>>> group1_spk1_endpoint
>>>> group1_spk2_endpoint
>>>> group1_spk3_endpoint
>>>> group1_spk4_endpoint.
>>>
>>> The notion of endpoint is completely half-baked today and the settings
>>> used have no bearing on the behavior and user-experience. I am inches
>>> away from sending a patch that removes all of the endpoint definitions,
>>> we can re-add them if/when we can get the information from platform
>>> firmware.
>>>
>>>>> +        .name_prefix = "cs35l56-8"
>>>>
>>>> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
>>>> CS35L56-hda driver? This prefix is used to find the matching firmware
>>>> files and our naming convention for these has been cs35lxx-xxxx-ampn
>>>>
>>>> Is there anything that depends on the prefixes being "cs35l56-n" ?
>>>
>>> IIRC this name_prefix is just used for the codec_conf and hence for
>>> control names/UCM. At some point userspace/driver need to know if amp5
>>> is left or right.
>>>
>>> We can certainly align on conventions but the values set in this ACPI
>>> match table will not be used for firmware download - different scope.
>>>
>>
>> They are used for our firmware download. Each amp can have its own
>> unique firmware file. The ALSA prefix is used to identify which firmware
>> file to load to which amp.
> 
> The prefix will only be used when the card is created, specifically for
> control names.
> The firmware should be selected and downloaded when the device shows up
> on the bus.
> Card creation and device enumeration/initialization happen on different
> timelines, if the machine driver is "blacklisted" or unbound I am not
> sure what happens.
> 
> There is a dependency between machine driver probe and codec firmware
> download that I am not able to follow, can you please elaborate?
>

The codec driver has to choose which firmware to load from under
/lib/firmware. It does this using a combination of SSID (to identify the
target product), the ALSA prefix string (to identify which amp) and
in some systems a GPIO on the motherboard to select between different
models of speaker when they have multiple suppliers. This results in a
firmware name like:

cs35l56-<silicon rev>-dsp1-misc-<SSID>[-<SPEAKER MODEL>]-<ALSA PREFIX>

You can see this if you look in the linux-firmware repo under cirrus/
for cs35l41 firmware files (though the ALSA PREFIX section in those
cases is not "AMPn" because they are not SDCA parts with rotation,
they have a fixed left/right assignment.)

We have to be careful of the length of the prefix. The 44 characters of
an ALSA control name get eaten up very quickly when we start creating
fully-qualified names for controls published by the firmware. So "AMPn"
was nice because it was descriptive enough but only uses 5 characters
of the 44.

Having said that, I've calculated that we have enough characters (just)
to use a prefix of "cs35l56-n". If there's a reason why that is
necessary/desirable for SOF or SoundWire then we could do that. But we'd
intended to use "AMPn" prefixes.

We just need to decide whether to go with "AMPn". Or switch to using
"cs35l56-n" for the ALSA prefix (the therefore the qualifier at the end
of the firmware filename).
