Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392987FB7E4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 11:32:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45ABE844;
	Tue, 28 Nov 2023 11:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45ABE844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701167571;
	bh=lzH7JblcT97WXrK+WP3roEt/gSv9xFBKUy8/VhcsZ64=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kkSjeewWvuHPVgdh7AzkhBHN7bwR/PQP9QjgDwgG4W82GYb8oXrQdsH2WpWA6slJE
	 CRJLVo5DJkh2nvF/RZAmYELiu0QjO5lgcdtHN6sVxIk80iZK/TAqgPYRIgOnd79+/O
	 XEyCdnzEVXlXqXGbqDwgU2Nw0RPuG7B8LgNL9Ij0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE57CF80246; Tue, 28 Nov 2023 11:32:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D12F80571;
	Tue, 28 Nov 2023 11:32:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C308F8016E; Tue, 28 Nov 2023 11:32:04 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F3C6F80104
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 11:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F3C6F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QLXx9TE1
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AS90PCo006640;
	Tue, 28 Nov 2023 04:31:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=36CgQB8ErG6aoRcTRzGYOfM9gBrVbtEU35AOckbzzl4=; b=
	QLXx9TE1f7oF4yhtPgkeU7NxUynN1kQov+//m/3clcw1tYbCwZk0cloGXKKTcZb7
	5/CLaEI++t/0ChdAkeb4GVTONX6yaRNRUE2hZHepnHmSbLeJPN30THtjlHpo0OP5
	zh1YrbqeoAbCOB+s3XuiRcJgG3EvqamQipf79l79/YTWTj4exsNzygh42oWvuOz6
	ZvH3bDdQjQwUHi5NG3WGnZ0CTVYdZFG5wRBx5TSWlrljTO5/V7rYizNfS5kdYJHQ
	FKza2ek+6ilqMPzaJ7FgASrD5QnCm0C1qCJjYrSYUJokhy43WIy3Ic5kKPJ5tagz
	lcplO6dxmcq4gBRDP1HhQQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uke7pk4sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 04:31:49 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 28 Nov
 2023 10:31:48 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Tue, 28 Nov 2023 10:31:48 +0000
Received: from [198.90.251.82] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DD13BB12;
	Tue, 28 Nov 2023 10:31:47 +0000 (UTC)
Message-ID: <6038c9fa-8cb1-46e1-b856-d759a3f990b3@opensource.cirrus.com>
Date: Tue, 28 Nov 2023 10:31:47 +0000
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
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <cb768f03-9d46-432e-ad67-8ff1ef075385@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 93EtMgZlMipsk-XfH_LvtGGiuG-ggt4L
X-Proofpoint-ORIG-GUID: 93EtMgZlMipsk-XfH_LvtGGiuG-ggt4L
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VVVR3G5AVRJNQYXLWVO6Q3YEI3IOGFNA
X-Message-ID-Hash: VVVR3G5AVRJNQYXLWVO6Q3YEI3IOGFNA
X-MailFrom: prvs=7696d8ff8e=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVVR3G5AVRJNQYXLWVO6Q3YEI3IOGFNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/11/2023 17:36, Pierre-Louis Bossart wrote:
> 
>>> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
>>> +    {
>>> +        .adr = 0x00003301FA355601ull,
>>> +        .num_endpoints = 1,
>>> +        .endpoints = &spk_r_endpoint,
>>
>> Assigning CS35L56 to "left" or "right" endpoints might be confusing.
>> All CS35L56 in a system receive both left and right channels and by
>> default they output a mono-mix of left+right.
>>
>> The left/right of an amp is determined by the firmware file (.bin) that
>> is loaded and the current settings of the "Posture" ALSA control. So
>> this amp might be the left channel after a .bin is loaded.
> 
> That's a problem if the kernel does not know which amplifier is on which
> side, no? How would one change the balance if this information is known
> only within a binary/opaque firmware?
> 

SDCA allows the posture (orientation) of amplifiers to be changed at
runtime. CS35L56 is designed as a SDCA device so it doesn't have any
hardwired position. SDCA doesn't define what the posture numbers mean,
they are an integer that is system-specific.

Because SDCA doesn't define the meaning of postures, and an SDCA device
should work with a generic SDCA driver (which obviously wouldn't have
hardcoded knowledge of the system) the speaker positions and postures
are coded into the firmware

It's difficult to say what is "default". For example, if you say that
the default for a tablet is left/right/top/bottom, assuming it is
used in portrait orientation, that would be wrong if the user always
uses it in landscape.

Matching by what amp is on what bus doesn't work well here because two
systems could have the same arrangement of CS35L56 on each bus but use
them for different purposes. So they could both match the "2 on bus 0, 2
on bus 1" table entry, but could be left/right/top/bottom on one device
and left woofer/right woofer/left tweeter/right tweeter on another
device.

I assume that if the system supports rotation there should be something
in the UCM or other userland that manages this. At least, it seems like
it's a UCM problem to decide which speakers are doing what audio.
If Linux-based distros don't have something like that - well, that just
means Linux is behind Windows.

>> It would be better to have generic names for the endpoint that don't
>> imply position, for example:
>>
>> group1_spk1_endpoint
>> group1_spk2_endpoint
>> group1_spk3_endpoint
>> group1_spk4_endpoint.
> 
> The notion of endpoint is completely half-baked today and the settings
> used have no bearing on the behavior and user-experience. I am inches
> away from sending a patch that removes all of the endpoint definitions,
> we can re-add them if/when we can get the information from platform
> firmware.
> 
>>> +        .name_prefix = "cs35l56-8"
>>
>> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
>> CS35L56-hda driver? This prefix is used to find the matching firmware
>> files and our naming convention for these has been cs35lxx-xxxx-ampn
>>
>> Is there anything that depends on the prefixes being "cs35l56-n" ?
> 
> IIRC this name_prefix is just used for the codec_conf and hence for
> control names/UCM. At some point userspace/driver need to know if amp5
> is left or right.
> 
> We can certainly align on conventions but the values set in this ACPI
> match table will not be used for firmware download - different scope.
> 

They are used for our firmware download. Each amp can have its own
unique firmware file. The ALSA prefix is used to identify which firmware
file to load to which amp.

>>> +    },
>>> +    {
>>> +        .adr = 0x00003201FA355601ull,
>>> +        .num_endpoints = 1,
>>> +        .endpoints = &spk_3_endpoint,
>>> +        .name_prefix = "cs35l56-7"
>>> +    }
>>> +};
>>> +
>>> +static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
>>> +    {
>>> +        .adr = 0x00013701FA355601ull,
>>> +        .num_endpoints = 1,
>>> +        .endpoints = &spk_l_endpoint,
>>> +        .name_prefix = "cs35l56-1"
>>> +    },
>>> +    {
>>> +        .adr = 0x00013601FA355601ull,
>>> +        .num_endpoints = 1,
>>> +        .endpoints = &spk_2_endpoint,
>>> +        .name_prefix = "cs35l56-2"
>>> +    }
>>> +};
>>> +
>>> +static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
>>> +    {
>>> +        .mask = BIT(3),
>>> +        .num_adr = ARRAY_SIZE(cs42l43_3_adr),
>>> +        .adr_d = cs42l43_3_adr,
>>> +    },
>>> +    {
>>> +        .mask = BIT(0),
>>> +        .num_adr = ARRAY_SIZE(cs35l56_0_adr),
>>> +        .adr_d = cs35l56_0_adr,
>>> +    },
>>> +    {
>>> +        .mask = BIT(1),
>>> +        .num_adr = ARRAY_SIZE(cs35l56_1_adr),
>>> +        .adr_d = cs35l56_1_adr,
>>> +    },
>>> +    {}
>>> +};
>>> +
