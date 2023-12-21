Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4448681BCDD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 18:18:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE252850;
	Thu, 21 Dec 2023 18:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE252850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703179132;
	bh=xvVupv0DvWA15dLMY7HS32t36cy8IzuFHk6EWLhdBgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=emZfwgdS+NqlWJ6v8XB+6gYyWsIB3OwRDDs8QmKW2/EnVUpcc0lEZeclJY42rgnXr
	 39J5WzlbNOZGU9mYpkopHFTgUKzcSpL3/VPJMeGoNDkoxYY4sf/OEup79tgdhEnmV8
	 3zI9o60D8+nH7cZ2vQNhUD8+zxoAOCXOUeYFG1Zs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6ED0F805C6; Thu, 21 Dec 2023 18:18:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E812AF805BA;
	Thu, 21 Dec 2023 18:18:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1518F80124; Thu, 21 Dec 2023 18:18:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29D5FF800F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 18:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D5FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XPmszTUT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703179072; x=1734715072;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xvVupv0DvWA15dLMY7HS32t36cy8IzuFHk6EWLhdBgI=;
  b=XPmszTUTPXywECqHNDHPfzV6DJujwOVGMHldSBtqh9gvj85KUsx+lSw7
   yBGSG3Vdk3Qk2m6eZqkfe+o0d3JwctY9SZzVRPPdjcHPefvSxHoY6T/ZH
   qcaYHiDixhRFUk2z+tGhLSPmLHrgiTbrLEzgeqb7RZSprBXNjMZHn/mdR
   fezhol4kB1VpYLSxFE3FDmjXvRPIHwLiQ4e8fmkjRPG7C1bsb5mN2Ndlw
   jN1KBRfD3VTAGulsE3FdW0/+xLLqUq2IGZXAEULfm5Mu4JCOg41J+EN0x
   Rsula1XSCAp3pRfrZIrpBGo7hlR3vUWlMgCtUF+NEX3FAIGe+xlR4u75w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="482190093"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600";
   d="scan'208";a="482190093"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="770011109"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600";
   d="scan'208";a="770011109"
Received: from wdangelo-mobl.ger.corp.intel.com (HELO [10.252.51.4])
 ([10.252.51.4])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:17:39 -0800
Message-ID: <98600d10-2130-463b-aa61-459bc1293bb8@linux.intel.com>
Date: Thu, 21 Dec 2023 18:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/16] soundwire: crc8: add constant table
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-10-pierre-louis.bossart@linux.intel.com>
 <ZYA0gKf3bZgY4X_s@matsya>
 <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
 <ZYROvUA7RrqQknlM@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYROvUA7RrqQknlM@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YD6JXYK7PTJJJ3L5B2QYDICLAPR3NJDK
X-Message-ID-Hash: YD6JXYK7PTJJJ3L5B2QYDICLAPR3NJDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YD6JXYK7PTJJJ3L5B2QYDICLAPR3NJDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/21/23 15:42, Vinod Koul wrote:
> On 18-12-23, 14:26, Pierre-Louis Bossart wrote:
>>
>>
>> On 12/18/23 06:01, Vinod Koul wrote:
>>> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>>>> Add the lookup table required by crc8(). All configuration values were
>>>> directly table from the MIPI SoundWire 1.x specification.
>>>>
>>>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>> ---
>>>>  drivers/soundwire/Makefile |   4 +-
>>>>  drivers/soundwire/crc8.c   | 277 +++++++++++++++++++++++++++++++++++++
>>>>  drivers/soundwire/crc8.h   |  11 ++
>>>>  3 files changed, 291 insertions(+), 1 deletion(-)
>>>>  create mode 100644 drivers/soundwire/crc8.c
>>>>  create mode 100644 drivers/soundwire/crc8.h
>>>>
>>>> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
>>>> index 657f5888a77b..170128dd9318 100644
>>>> --- a/drivers/soundwire/Makefile
>>>> +++ b/drivers/soundwire/Makefile
>>>> @@ -5,7 +5,9 @@
>>>>  
>>>>  #Bus Objs
>>>>  soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
>>>> -			sysfs_slave.o sysfs_slave_dpn.o
>>>> +			sysfs_slave.o sysfs_slave_dpn.o \
>>>> +			crc8.o
>>>> +
>>>>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>>>>  
>>>>  soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
>>>> diff --git a/drivers/soundwire/crc8.c b/drivers/soundwire/crc8.c
>>>> new file mode 100644
>>>> index 000000000000..b6b984d7f39a
>>>> --- /dev/null
>>>> +++ b/drivers/soundwire/crc8.c
>>>> @@ -0,0 +1,277 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>>>> +// Copyright(c) 2024 Intel Corporation.
>>>> +
>>>> +#include <linux/crc8.h>
>>>> +#include <linux/module.h>
>>>> +#include "crc8.h"
>>>> +
>>>> +/*
>>>> + * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
>>>> + * The value is (1)01001101 = 0x4D
>>>> + *
>>>> + * the table below was generated with
>>>> + *
>>>> + *	u8 crc8_lookup_table[CRC8_TABLE_SIZE];
>>>> + *	crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
>>>
>>> Good that you found this API, so next question would be why should we
>>> have this static table in kernel and not generate on probe if bpt is
>>> supported..? Many subsystems use these APIs to generate the tables..
>>
>> The table is going to be the same for all hosts, it's simpler if
>> everyone uses a constant table, no? We're talking about 256 bytes added
>> for the common bus parts, be it with dynamically allocated memory or a
>> static table.
>>
>> I don't mind reverting to a dynamically allocated table populated at
>> boot if that was the consensus.
> 
> Most of the kernel users I looked have dynamically allocated table
> populated at boot, also out of many users how many would support BTP.?
> Your older platforms, current qcom dont, so not point is adding for
> everyone...

All Intel hardware supports BTP/BRA, we just didn't have a compelling
reason to enable it so far. I've seen AMD stating that they also have
BTP/BRA. That's 2/3 of controllers.

I don't mind reverting to a devm_ allocated table, I am not sure I see
the benefits for 256 bytes of constant data.
