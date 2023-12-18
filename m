Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3F68170A6
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 14:40:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F9BCE72;
	Mon, 18 Dec 2023 14:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F9BCE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702906832;
	bh=prKE6A162P9Ju2Tm3VxotcuOr7byQMz2lavfEXsh3+8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VTARYryrApJvbaW1Aug0meGyHqtAd59AHIWcdOIhyWYAPnjRHL1lZGFIsVBnvQRc4
	 skzI4g59LtmOPbjKQUZHA8F9OkXc/SmfpNvb3jEbQW2dO3OvRhoCEMoBw7gUCpMlqi
	 5CaRfgCfR5jtjqcK7Z6L5ddhnOlohmpWy4cl8dgE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF521F805F8; Mon, 18 Dec 2023 14:39:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A7F8F80606;
	Mon, 18 Dec 2023 14:39:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C78C6F8055B; Mon, 18 Dec 2023 14:39:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E8A7F8059F
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 14:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E8A7F8059F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=adZC6tUZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906764; x=1734442764;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=prKE6A162P9Ju2Tm3VxotcuOr7byQMz2lavfEXsh3+8=;
  b=adZC6tUZyfn7/Vbb0No95G/pWc5vyVOn7sPMe7nf/Yn7mXgtn4gDWdNx
   E7aPVd46Q9nLcmpxDLnmFDEuxVq+73mA9+dWX1mvoajfSAjws2rrGwh3U
   PAbyUDSjfft6nzGQOf+Pc+ZWK25qHKSXA8J7BcOX2LPHvxysIhe17yTl5
   bekFOXts0PMlHfQoPHeetE/2vpr6vGGCJ5X/S1TssAdQ2Dq5PoTQBS01Q
   sXIYK/TR1B6QWd+LZmfkPZK+v7lw6DRiuECTVn0uphPbqzS5bHG2Zd0vJ
   ZLG5AX4A60Lhc/E/Mf4WqVZ+fRysibRB3/5QTMoOqE2huZmSJRPUpqUCw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868698"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="8868698"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753675"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600";
   d="scan'208";a="1022753675"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197])
 ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 05:39:16 -0800
Message-ID: <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
Date: Mon, 18 Dec 2023 14:26:15 +0100
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYA0gKf3bZgY4X_s@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7GLUJS4USDWDMSB4QN4AFTHYJXJB4IKE
X-Message-ID-Hash: 7GLUJS4USDWDMSB4QN4AFTHYJXJB4IKE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GLUJS4USDWDMSB4QN4AFTHYJXJB4IKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/18/23 06:01, Vinod Koul wrote:
> On 07-12-23, 16:29, Pierre-Louis Bossart wrote:
>> Add the lookup table required by crc8(). All configuration values were
>> directly table from the MIPI SoundWire 1.x specification.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>>  drivers/soundwire/Makefile |   4 +-
>>  drivers/soundwire/crc8.c   | 277 +++++++++++++++++++++++++++++++++++++
>>  drivers/soundwire/crc8.h   |  11 ++
>>  3 files changed, 291 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/soundwire/crc8.c
>>  create mode 100644 drivers/soundwire/crc8.h
>>
>> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
>> index 657f5888a77b..170128dd9318 100644
>> --- a/drivers/soundwire/Makefile
>> +++ b/drivers/soundwire/Makefile
>> @@ -5,7 +5,9 @@
>>  
>>  #Bus Objs
>>  soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
>> -			sysfs_slave.o sysfs_slave_dpn.o
>> +			sysfs_slave.o sysfs_slave_dpn.o \
>> +			crc8.o
>> +
>>  obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
>>  
>>  soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
>> diff --git a/drivers/soundwire/crc8.c b/drivers/soundwire/crc8.c
>> new file mode 100644
>> index 000000000000..b6b984d7f39a
>> --- /dev/null
>> +++ b/drivers/soundwire/crc8.c
>> @@ -0,0 +1,277 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +// Copyright(c) 2024 Intel Corporation.
>> +
>> +#include <linux/crc8.h>
>> +#include <linux/module.h>
>> +#include "crc8.h"
>> +
>> +/*
>> + * the MIPI SoundWire CRC8 polynomial is X^8 + X^6 + X^3 + X^2 + 1, MSB first
>> + * The value is (1)01001101 = 0x4D
>> + *
>> + * the table below was generated with
>> + *
>> + *	u8 crc8_lookup_table[CRC8_TABLE_SIZE];
>> + *	crc8_populate_msb(crc8_lookup_table, SDW_CRC8_POLY);
> 
> Good that you found this API, so next question would be why should we
> have this static table in kernel and not generate on probe if bpt is
> supported..? Many subsystems use these APIs to generate the tables..

The table is going to be the same for all hosts, it's simpler if
everyone uses a constant table, no? We're talking about 256 bytes added
for the common bus parts, be it with dynamically allocated memory or a
static table.

I don't mind reverting to a dynamically allocated table populated at
boot if that was the consensus.
