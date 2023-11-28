Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E77FC0AE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:54:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B07DAE10;
	Tue, 28 Nov 2023 18:54:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B07DAE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701194089;
	bh=7EyciSBoMRp/uy5JEafkZ9mCsmBqjMjPCjZFngsv27E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aGjRqgxhPm0dLTCf6qndbff/P1x7pZ750uuX6cCVkwMAasuy+Qf3p34mwu/mxeUHz
	 nAufOLdaCfQ5nxwz9z36Y1S/OBoYUWiukWE0s5B/yAIs39Fo5ExASgNJVgM3v/GCtf
	 E2OPmZ+OpfwkPWASN/4PN5X5rCzYdoE5w3nlY8o8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F86AF805BE; Tue, 28 Nov 2023 18:54:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64FBDF805BE;
	Tue, 28 Nov 2023 18:54:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A3A5F8055B; Tue, 28 Nov 2023 18:54:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D85AF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D85AF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LW1vMRzt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701194040; x=1732730040;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7EyciSBoMRp/uy5JEafkZ9mCsmBqjMjPCjZFngsv27E=;
  b=LW1vMRztvv5CJT54HNc1TtQgoa4EtFCBK1qFX4b9Sfnn1Go/zKP8A14q
   ATRrN+ZtiSyi+nSDsAnHOy/8yVf4jGbf9xwmKTuUUHe7FLAnk3bsieeCx
   S7G0V7oXZEN0edxNPyqnPljlzLuJTv3GGr0PXfQ/5FvGmjwAUfIIdIfE8
   898TQFXVDVIx2/8xlomjFGu48tb+sMUI2eLEcuTylzCxBxXTP/B4Mgj7i
   Km5lv5BS0uUbDZV/vdxzJOJGaTOqSvmUfshnrZPsQzZbZopP+m8ztHsp/
   IO9sJ02y/n28f29xc7augUFUSo9ewlZPuYlKFTYch95tDvbi2yqXfXCOA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424127079"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="424127079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:53:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="834715299"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600";
   d="scan'208";a="834715299"
Received: from skumarso-mobl33.amr.corp.intel.com (HELO [10.255.231.208])
 ([10.255.231.208])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:53:54 -0800
Message-ID: <5e9b0b69-6108-4909-90e8-257c13c2d886@linux.intel.com>
Date: Tue, 28 Nov 2023 09:23:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs56l56 support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 cezary.rojewski@intel.com, yung-chuan.liao@linux.intel.com,
 ckeepax@opensource.cirrus.com, yong.zhi@intel.com, chao.song@linux.intel.com
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
 <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
 <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
 <cb768f03-9d46-432e-ad67-8ff1ef075385@linux.intel.com>
 <6038c9fa-8cb1-46e1-b856-d759a3f990b3@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6038c9fa-8cb1-46e1-b856-d759a3f990b3@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YTHJA5HW7ROUYZUP3BS6SFKH6S63SA66
X-Message-ID-Hash: YTHJA5HW7ROUYZUP3BS6SFKH6S63SA66
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YTHJA5HW7ROUYZUP3BS6SFKH6S63SA66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/28/23 04:31, Richard Fitzgerald wrote:
> On 27/11/2023 17:36, Pierre-Louis Bossart wrote:
>>
>>>> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
>>>> +    {
>>>> +        .adr = 0x00003301FA355601ull,
>>>> +        .num_endpoints = 1,
>>>> +        .endpoints = &spk_r_endpoint,
>>>
>>> Assigning CS35L56 to "left" or "right" endpoints might be confusing.
>>> All CS35L56 in a system receive both left and right channels and by
>>> default they output a mono-mix of left+right.
>>>
>>> The left/right of an amp is determined by the firmware file (.bin) that
>>> is loaded and the current settings of the "Posture" ALSA control. So
>>> this amp might be the left channel after a .bin is loaded.
>>
>> That's a problem if the kernel does not know which amplifier is on which
>> side, no? How would one change the balance if this information is known
>> only within a binary/opaque firmware?
>>
> 
> SDCA allows the posture (orientation) of amplifiers to be changed at
> runtime. CS35L56 is designed as a SDCA device so it doesn't have any
> hardwired position. SDCA doesn't define what the posture numbers mean,
> they are an integer that is system-specific.
> 
> Because SDCA doesn't define the meaning of postures, and an SDCA device
> should work with a generic SDCA driver (which obviously wouldn't have
> hardcoded knowledge of the system) the speaker positions and postures
> are coded into the firmware
> 
> It's difficult to say what is "default". For example, if you say that
> the default for a tablet is left/right/top/bottom, assuming it is
> used in portrait orientation, that would be wrong if the user always
> uses it in landscape.
> 
> Matching by what amp is on what bus doesn't work well here because two
> systems could have the same arrangement of CS35L56 on each bus but use
> them for different purposes. So they could both match the "2 on bus 0, 2
> on bus 1" table entry, but could be left/right/top/bottom on one device
> and left woofer/right woofer/left tweeter/right tweeter on another
> device.

In the absence of any platform firmware information, I am not sure how
we can deal with such systems. The match tables are already hard to
support given that a number of OEMs get the _ADR wrong, the speaker
position is the next-level...

Or did you just volunteer to maintain a DMI quirk table for Cirrus-based
systems :-)

I also bet that at some point the wrong firmware will be loaded on the
wrong amplifiers, that could be fun as well.

> I assume that if the system supports rotation there should be something
> in the UCM or other userland that manages this. At least, it seems like
> it's a UCM problem to decide which speakers are doing what audio.
> If Linux-based distros don't have something like that - well, that just
> means Linux is behind Windows.

SDCA has lots of fancy concepts, posture is one. Last time I checked we
don't have any reports of the hinge angle in Linux so the best we can do
is landscape/portrait, and even that is questionable given that tablets
or detachables have not reached any developers so far. CI automation is
another fun issue, we'll need robotic arms to move the device around and
intelligent alsa-bat-v2 to verify sound levels...

The notion of which speakers do what is something that will clearly take
years to figure out. For now the main issue is to get all parts
connected and basic "loud enough" sound working.

>>> It would be better to have generic names for the endpoint that don't
>>> imply position, for example:
>>>
>>> group1_spk1_endpoint
>>> group1_spk2_endpoint
>>> group1_spk3_endpoint
>>> group1_spk4_endpoint.
>>
>> The notion of endpoint is completely half-baked today and the settings
>> used have no bearing on the behavior and user-experience. I am inches
>> away from sending a patch that removes all of the endpoint definitions,
>> we can re-add them if/when we can get the information from platform
>> firmware.
>>
>>>> +        .name_prefix = "cs35l56-8"
>>>
>>> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
>>> CS35L56-hda driver? This prefix is used to find the matching firmware
>>> files and our naming convention for these has been cs35lxx-xxxx-ampn
>>>
>>> Is there anything that depends on the prefixes being "cs35l56-n" ?
>>
>> IIRC this name_prefix is just used for the codec_conf and hence for
>> control names/UCM. At some point userspace/driver need to know if amp5
>> is left or right.
>>
>> We can certainly align on conventions but the values set in this ACPI
>> match table will not be used for firmware download - different scope.
>>
> 
> They are used for our firmware download. Each amp can have its own
> unique firmware file. The ALSA prefix is used to identify which firmware
> file to load to which amp.

The prefix will only be used when the card is created, specifically for
control names.
The firmware should be selected and downloaded when the device shows up
on the bus.
Card creation and device enumeration/initialization happen on different
timelines, if the machine driver is "blacklisted" or unbound I am not
sure what happens.

There is a dependency between machine driver probe and codec firmware
download that I am not able to follow, can you please elaborate?

