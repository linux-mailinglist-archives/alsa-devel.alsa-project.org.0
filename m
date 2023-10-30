Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAA57DC194
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 22:06:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BEA993A;
	Mon, 30 Oct 2023 22:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BEA993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698699978;
	bh=LKLP6UEl/pkjGe0QKZIWac46a5g0E8T9ZC0+kHW1Z4g=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tuG8kh+JdOun/gF8cE5hY2rwjb8KO0gS/jdP/bn3EvwdbHxfqbk1rMcthN0NLrQ85
	 Grn3aDuwAX5NnhzDcWKV8mN90WV5/qScXc9Xpc+9mPPVc8/dEYpJZ5CX8jGvWOIizY
	 yKltLYomwvcLi2WW61PZE40bQ6l+BFGlnuH4Vpnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8053F80425; Mon, 30 Oct 2023 22:05:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80607F80166;
	Mon, 30 Oct 2023 22:05:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03ECFF8016D; Mon, 30 Oct 2023 22:05:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D06CF8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 22:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D06CF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bBc77gUB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698699917; x=1730235917;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=LKLP6UEl/pkjGe0QKZIWac46a5g0E8T9ZC0+kHW1Z4g=;
  b=bBc77gUBGR+EnCUa5OtzYwQlcwp/vzNTZh2eKZ+H5YOftZEXV9h6uphB
   vUkUSqWRceRqeq2VkguJwHshVRMRXNJf/vyMygIT4iRf1pLr2OM7Rdy1F
   8DtAZ4JiduFI4df9xdpBR/DUD2Q/7MxFPxfRc4f+wVN2kcPP0IfGFsZ00
   6nak27/UpGTb0dt1ExTgrxHfW8k5K/QC1eUAAIZ4EUa0zXoV+8phcVdSn
   rasB9peCiVp7BnIsq75gWe4vSZcxvcmPklzHiYKdfSXmWqI4kjaRR0QXU
   z7w7hjRBW8qDK5OWrsJUuJRQgWKgXF4cN4unO+M2EMG4lAdyYoX9/3CZH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="9691832"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200";
   d="scan'208";a="9691832"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 14:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="795365560"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200";
   d="scan'208";a="795365560"
Received: from wezedi-mobl1.amr.corp.intel.com (HELO [10.212.223.192])
 ([10.212.223.192])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 14:05:10 -0700
Message-ID: <85890ed8-0ab3-4b14-879b-be9f0c760db8@linux.intel.com>
Date: Mon, 30 Oct 2023 16:05:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Baojun Xu <baojun.xu@ti.com>, lgirdwood@gmail.com, perex@perex.cz,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kevin-lu@ti.com,
 shenghao-ding@ti.com, peeyush@ti.com, navada@ti.com, tiwai@suse.de
References: <20231028092409.96813-1-baojun.xu@ti.com>
 <7f4465c1-5e8e-4c5f-bbff-d2c930326986@linux.intel.com>
 <9d922584-288a-4b73-83ef-477d1bc58521@sirena.org.uk>
 <9b94488e-206d-419b-92ed-e70aab11907b@linux.intel.com>
In-Reply-To: <9b94488e-206d-419b-92ed-e70aab11907b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BABJHYJ627EXTQLSND6JPIYC5UET6YDF
X-Message-ID-Hash: BABJHYJ627EXTQLSND6JPIYC5UET6YDF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BABJHYJ627EXTQLSND6JPIYC5UET6YDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/30/23 12:40, Pierre-Louis Bossart wrote:
> 
> 
> On 10/30/23 12:20, Mark Brown wrote:
>> On Mon, Oct 30, 2023 at 11:05:39AM -0500, Pierre-Louis Bossart wrote:
>>
>>>> +static bool tas2783_readable_register(struct device *dev, unsigned int reg)
>>>> +{
>>>> +	switch (reg) {
>>>> +	case 0x000 ... 0x080:	/* Data port 0. */
>>
>>> No, this is wrong. All the data port 'standard' registers are "owned" by
>>> the SoundWire core and handled during the port prepare/configure/bank
>>> switch routines. Do not use them for regmap.
>>
>>> In other words, you *shall* only define vendor-specific registers in
>>> this codec driver.
>>
>> This seems to come up a moderate amount and is an understandable thing
>> to do - could you (or someone else who knows SoundWire) perhaps send a
>> patch for the regmap SoundWire integration which does some validation
>> here during registration and at least prints a warning?
> 
> Good suggestion, we could indeed check that the registers are NOT in the
> range [0,0xBF] for all ports - only the range [0xC0..FF] is allowed for
> implementation-defined values. I'll try to cook something up.

After checking, the following ranges are invalid for codec drivers:

for address < 0x1000
LSB = 0x00 - 0xBF standard or reserved

0x1800 – 0x1FFF reserved
0x48000000 - 0xFFFFFFFF reserved

is the recommendation to check the regmap_config and its 'yes_ranges'?

Presumably if the range_min or range_max is within the invalid values
above then the configuration can be tagged as problematic in the dmesg
log or rejected with an error code?
