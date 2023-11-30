Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF55800D85
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 15:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1831C84A;
	Fri,  1 Dec 2023 15:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1831C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701441745;
	bh=EFy9Hh3Cv87FHbJLGd1xdosKaDBGtIirU5TJIkN5is0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jl/eyUiqPj63agHZfwp8Rmhl+WZyv4zLCPlMFonl4fIIpliJgFgxhZ9GGgX0L67E+
	 eyoynGrPoOX+2dcCnJi23lgzRU4UiRLmGRzrkQAYkiitxKU+vPBgU3HNIvmO+sQqj3
	 rKfPo5FeCNS8kQJAFdq0e1cfS5mk9R6DMM1dnrgg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FB62F80563; Fri,  1 Dec 2023 15:41:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E37F801D5;
	Fri,  1 Dec 2023 15:41:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF672F8016E; Fri,  1 Dec 2023 15:41:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DATE_IN_PAST_24_48,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1496F80114
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 15:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1496F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B60/zozD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701441696; x=1732977696;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EFy9Hh3Cv87FHbJLGd1xdosKaDBGtIirU5TJIkN5is0=;
  b=B60/zozD5p7ctka7o3YfCJoNp5qb/BW+zl4B2iai4IrO862IcjVN0CRw
   iQZmgirJpfEGRx3v4dLCZTkP0rdYXa6wNVnvSflW9eafp7+bm8DmIt2TQ
   g65yQuIaWbcC1uA+kxAfnIiBn4Db0p+ECHX0GjFGbfexfzydu3PDbHHNP
   Wv8XT2P9NimRUHUWFHon8uVgQeKzzINpaJ5mUoE717aFkqWannji/m5U/
   Sz0N/4dU/4W1QbzB7Gth6rnkQUZgWseWeHiIclUmhW0G5vv0FjHF6nNlW
   jHOM5DwqIBn7S6iD+4MApDZvb+yI3iDwkGMaLoLZp5h/t83TE8IBXJd0B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="424662190"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600";
   d="scan'208";a="424662190"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 06:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943106258"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600";
   d="scan'208";a="943106258"
Received: from shravans-mobl.amr.corp.intel.com (HELO [10.209.93.166])
 ([10.209.93.166])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 06:41:24 -0800
Message-ID: <162bf443-37ca-4848-99de-ffb877740f44@linux.intel.com>
Date: Thu, 30 Nov 2023 08:27:32 -0600
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
 <5e9b0b69-6108-4909-90e8-257c13c2d886@linux.intel.com>
 <d2de7d4c-3984-4737-b879-a1fa829007ff@opensource.cirrus.com>
 <7bae01ac-a0de-47d9-9bd3-6bdfc48e02c1@linux.intel.com>
 <1b77a7b5-5988-49b2-b356-0d24bb01909d@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1b77a7b5-5988-49b2-b356-0d24bb01909d@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LITJ7AMBRZERR3U3V5XSDF4GBYWI6EFU
X-Message-ID-Hash: LITJ7AMBRZERR3U3V5XSDF4GBYWI6EFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LITJ7AMBRZERR3U3V5XSDF4GBYWI6EFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/30/23 04:15, Richard Fitzgerald wrote:
> On 29/11/23 16:39, Pierre-Louis Bossart wrote:
>>
>>>>>>>> +        .name_prefix = "cs35l56-8"
>>>>>>>
>>>>>>> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
>>>>>>> CS35L56-hda driver? This prefix is used to find the matching
>>>>>>> firmware
>>>>>>> files and our naming convention for these has been cs35lxx-xxxx-ampn
>>>>>>>
>>>>>>> Is there anything that depends on the prefixes being "cs35l56-n" ?
>>>>>>
>>>>>> IIRC this name_prefix is just used for the codec_conf and hence for
>>>>>> control names/UCM. At some point userspace/driver need to know if
>>>>>> amp5
>>>>>> is left or right.
>>>>>>
>>>>>> We can certainly align on conventions but the values set in this ACPI
>>>>>> match table will not be used for firmware download - different scope.
>>>>>>
>>>>>
>>>>> They are used for our firmware download. Each amp can have its own
>>>>> unique firmware file. The ALSA prefix is used to identify which
>>>>> firmware
>>>>> file to load to which amp.
>>>>
>>>> The prefix will only be used when the card is created, specifically for
>>>> control names.
>>>> The firmware should be selected and downloaded when the device shows up
>>>> on the bus.
>>>> Card creation and device enumeration/initialization happen on different
>>>> timelines, if the machine driver is "blacklisted" or unbound I am not
>>>> sure what happens.
>>>>
>>>> There is a dependency between machine driver probe and codec firmware
>>>> download that I am not able to follow, can you please elaborate?
>>>>
>>>
>>> The codec driver has to choose which firmware to load from under
>>> /lib/firmware. It does this using a combination of SSID (to identify the
>>> target product), the ALSA prefix string (to identify which amp) and
>>> in some systems a GPIO on the motherboard to select between different
>>> models of speaker when they have multiple suppliers. This results in a
>>> firmware name like:
>>>
>>> cs35l56-<silicon rev>-dsp1-misc-<SSID>[-<SPEAKER MODEL>]-<ALSA PREFIX>
>>>
>>> You can see this if you look in the linux-firmware repo under cirrus/
>>> for cs35l41 firmware files (though the ALSA PREFIX section in those
>>> cases is not "AMPn" because they are not SDCA parts with rotation,
>>> they have a fixed left/right assignment.)
>>>
>>> We have to be careful of the length of the prefix. The 44 characters of
>>> an ALSA control name get eaten up very quickly when we start creating
>>> fully-qualified names for controls published by the firmware. So "AMPn"
>>> was nice because it was descriptive enough but only uses 5 characters
>>> of the 44.
>>>
>>> Having said that, I've calculated that we have enough characters (just)
>>> to use a prefix of "cs35l56-n". If there's a reason why that is
>>> necessary/desirable for SOF or SoundWire then we could do that. But we'd
>>> intended to use "AMPn" prefixes.
>>>
>>> We just need to decide whether to go with "AMPn". Or switch to using
>>> "cs35l56-n" for the ALSA prefix (the therefore the qualifier at the end
>>> of the firmware filename).
>>
>> Yes we have similar issues with control names in topology, the limit is
>> hit very quickly.
>>
>> I think you missed my point though that the ALSA prefix is only set when
>> the card is created, which can be sometime after the firmware needs to
>> be downloaded. I guess you could pick the firmware in the component
>> probe, which happens during the card creation, but that could be
>> sub-optimal. Given the download times you want the download to proceed
>> as early as possible.
> 
> We kick off a background task from our component_probe() to do the
> firmware download. We need the ALSA prefix, and also the wm_adsp library
> that actually handles the DSP is ASoC code so it needs a probed
> component. Doing it in a background work means it doesn't block probe().
> And the download to multiple amps can proceed in parallel - obviously
> that's constrained by bus bandwidth but we are seeing that they
> interleave.

ah ok, that makes sense. In practice the delta between codec enumeration
and component probe is probably negligible, and in a multi-amplifier
setup the download times are much larger.

So to circle back to the initial feedback, do you mind submitting a
patch with the exact naming you'd want for the prefix?
