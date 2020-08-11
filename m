Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3747C241B25
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:46:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C25DC1616;
	Tue, 11 Aug 2020 14:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C25DC1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597150016;
	bh=urhKcXumUqAwSkrRZ4F4QsgnW7ienqM0oaw7VSF+L88=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s+ebSJNiCveWe3GQoffWXhziUwEWOtdngD9KrgF7eWcDYqARJbxRs4SxLFji6xcX/
	 oRKfpP1dLCF+Y4DytoRJnD3/sxaqvjKB4XCEDVS3SLsB1ahpyrT8IM7FPspBSGiI4V
	 gcbGQBOlPeupqDPlAOd/7WkX5wNSARdGW12J9mpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B79BF80171;
	Tue, 11 Aug 2020 14:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 173DEF80162; Tue, 11 Aug 2020 14:45:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C94BF8014C
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C94BF8014C
IronPort-SDR: zDRBxF3eW7VAcaRqXN3u7752YtQNcPM46Q6B9stRcqwHhT0SVSNK62R/RWeTvbnD2x75DtmvxO
 K4ruyYX5g6MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="151392082"
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="151392082"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 05:45:46 -0700
IronPort-SDR: duePVcA3tulheztpC5zJUgkHWlVj3jQMCWtHBRVUShUF+VFCxkxgmaynm6bv286EKFUMTawucq
 /k1vdJZPsBZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,461,1589266800"; d="scan'208";a="317713478"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.31.191])
 ([10.213.31.191])
 by fmsmga004.fm.intel.com with ESMTP; 11 Aug 2020 05:45:42 -0700
Subject: Re: [PATCH v2 01/13] ASoC: Intel: Add catpt device
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20200811100034.6875-1-cezary.rojewski@intel.com>
 <20200811100034.6875-2-cezary.rojewski@intel.com>
 <76ca9300-f995-f5c3-48c4-6cc22f7a80c3@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <8fff8fb0-1b78-493e-0fdd-f9f0f15a6b5b@intel.com>
Date: Tue, 11 Aug 2020 14:45:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <76ca9300-f995-f5c3-48c4-6cc22f7a80c3@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: andriy.shevchenko@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 tiwai@suse.com, krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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

On 2020-08-11 2:17 PM, Amadeusz Sławiński wrote:
> 
> 
> On 8/11/2020 12:00 PM, Cezary Rojewski wrote:
>> Declare base structures, registers and device routines for the catpt
>> solution. Catpt deprecates and is a direct replacement for
>> sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
> 
> ...
> 
>> diff --git a/sound/soc/intel/catpt/registers.h 
>> b/sound/soc/intel/catpt/registers.h
>> new file mode 100644
>> index 000000000000..62c968a4721a
>> --- /dev/null
>> +++ b/sound/soc/intel/catpt/registers.h
>> @@ -0,0 +1,191 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
> 
> If we are making sure that SPDX headers are correct, from what I 
> remember SPDX identifier should be a separate comment line, even if 
> followed by comment. Checkpatch doesn't seem to care and I can't find 
> anything explicitly saying that's a rule in 
> Documentation/process/license-rules.rst (apart from one line "C Header" 
> example, which is one line comment). Can someone else chime in? Also all 
> other header that are included in patchset seem to follow this scheme...
> 

Sorry for the repeated mistake. Mark already did mention it. Fixed 
core.h, traces.h and messages.h but the register.h was omitted during 
the update.

Ack.
