Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 567F17D41D2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 23:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAB7D846;
	Mon, 23 Oct 2023 23:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAB7D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698097268;
	bh=+wqdJZajTZMkLOf5fu6d9oLo9BTWPsaIVM7n6trPfEA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Peqa7oGlSKHdEYoRPADkdbgb1OE20rRS8CPkINo1Nma78dwoYTzZTe987pB9Nk8SU
	 rHoOK/wxS1/EpShLexBAbOmlfUJIfa98hnrkIXWT7vTqLKC3coZOi0NPZlYQr1Xb/Y
	 zP7f179DVWhKO8jstRm8e13nlCETQ9nMCzztHYp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CE69F80558; Mon, 23 Oct 2023 23:40:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4E0EF8032D;
	Mon, 23 Oct 2023 23:40:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4F53F804F3; Mon, 23 Oct 2023 23:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFAFDF80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 23:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFAFDF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WTS84Wci
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698097204; x=1729633204;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+wqdJZajTZMkLOf5fu6d9oLo9BTWPsaIVM7n6trPfEA=;
  b=WTS84WciMmvswGPS7B4A/pluGraXePQxTIMzmxOWfjvb9Gl145QhsL6u
   3UBQDTgUGWhHgdTRDRNgKpAmAbo8E0o3yCJOXBDakNksEFtvlE8zdxn95
   +bOjLHn6flpjD79jHIY9meYsqfc01QqopXggSwevXwoRwjlqiyUFgl1pC
   01QTxO5Ly9GouI4GaWOTvGkSgG4XA4o3T46bZ9AhPEY7VYOW5cuKOEswX
   /Y5x1ppSORWIDv2E0hzxlD605HoUpNM114roWLmvJO51+C3IoA1EFbN/D
   zu2dUYRUs1AiN4uKxSy/knZ3UVKjM15oA39a/j7r45f9M842QDubpZ3U0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="389781375"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200";
   d="scan'208";a="389781375"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 14:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="848894341"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200";
   d="scan'208";a="848894341"
Received: from gabbythx-mobl.amr.corp.intel.com (HELO [10.213.175.173])
 ([10.213.175.173])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 14:39:58 -0700
Message-ID: <6b580a95-807e-4a7c-a537-1fdda5c6a220@linux.intel.com>
Date: Mon, 23 Oct 2023 14:37:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Tab 3 Pro
 YT3-X90 quirk
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
References: <20231021211534.114991-1-hdegoede@redhat.com>
 <fb56b3fd-769c-4524-acf4-3324424c4b5a@linux.intel.com>
 <3a8ef188-ac22-44ca-d847-975841f7cd9c@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3a8ef188-ac22-44ca-d847-975841f7cd9c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FY5I64MQ5TGBQQJPNXGJCOSIE5KOILV2
X-Message-ID-Hash: FY5I64MQ5TGBQQJPNXGJCOSIE5KOILV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FY5I64MQ5TGBQQJPNXGJCOSIE5KOILV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/23/23 14:23, Hans de Goede wrote:
> Hi,
> 
> On 10/23/23 20:45, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/21/23 16:15, Hans de Goede wrote:
>>> The Lenovo Yoga Tab 3 Pro YT3-X90 x86 tablet, which ships with Android with
>>> a custom kernel as factory OS, does not list the used WM5102 codec inside
>>> its DSDT.
>>>
>>> Workaround this with a new snd_soc_acpi_intel_baytrail_machines[] entry
>>> which matches on the SST id instead of the codec id like nocodec does,
>>> combined with using a machine_quirk callback which returns NULL on
>>> other machines to skip the new entry on other machines.
>>
>> The work-around sounds fine, but out of curiosity what causes the codec
>> driver to probe if there's no ACPI HID?
>>
>> Really wondering how we avoid the -517 error code with the deferred
>> probe never completing because the codec driver never probed and
>> registered the needed components?
> 
> 
> These x86 android tablets ship with pretty broken DSDTs with
> A whole bunch of (usually i2c) devices missing like
> e.g. the touchscreen and the accelerometer.
> 
> For the factory Android install this is not an issue because
> it uses drivers which instantiate the i2c-clients itself using
> hardcoded i2c-bus, i2c-address and irqs.
> 
> To make this work under Linux I've written a special helper
> "driver" which loads only on these broken DSDT devices
> based on DMI modalias and then identifies the exact
> model (also by DMI) and instantiates the correct devices
> from this "driver" (really more of an old fashioned
> board file). This code also adds all the necessary
> properties, etc. to make standard drivers work, so all
> model specific knowledge missing from the DSDT is encoded
> in this special x86-android-tablets driver.
> 
> I've also submitted a patch for that driver to instantiate
> the codec SPI device using spi_device_id matching instead
> of acpi_device_id matching:
> 
> https://lore.kernel.org/platform-driver-x86/20231014205314.59333-5-hdegoede@redhat.com/
> 
> So this is the other side of the puzzle, I hope this
> helps explain how I actually got this working.

Ah yes, thanks Hans for the information. The amount of work-arounds for
a broken DSDT and enumeration is just mind-boggling.... Oh well.

For the series

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
