Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B425359A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 18:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C48C01787;
	Wed, 26 Aug 2020 18:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C48C01787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598461154;
	bh=9kdNjT7jl3PhSasDz0S747fIIh7tdEWFdkunN4hNTOc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rtm5I7NJqpbLfdZ6Nxkp8JOdgrE6HInFrrpBSNyetILCL4Wpwu1Vzxhm00FK9TTdm
	 IZSsMYhNyuXXVRe1+B6rMlHbkX4lNVaAaPSZfcvG6+2WTNrZvUtt6VL4G/V6E+9SIo
	 e3HabnBkvm/g1rPTzZbdteGOojIdqPrlQM+FQoJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E106EF801EC;
	Wed, 26 Aug 2020 18:57:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78A83F801D9; Wed, 26 Aug 2020 18:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37854F800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 18:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37854F800EB
IronPort-SDR: kVNw6Q+gidZwDDT7HgolJ02fXAKsctMf/s8n0l00NvivKFxvVt0U8B/qfkx1PRXrOQbWdAkqfS
 TrAlLl44VsEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="157371658"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="157371658"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 09:57:20 -0700
IronPort-SDR: riyJ8XK6HQxCF87dKaM13QFC5KCh0hRvWCGpTHaRFjfTuS59kns1kMJnj+aqsEJhc364A9fs85
 ff4SjXLYIdqw==
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="336884223"
Received: from kberke-mobl1.amr.corp.intel.com (HELO [10.209.43.169])
 ([10.209.43.169])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 09:57:16 -0700
Subject: Re: [PATCH 4/4] regmap: sdw: add support for SoundWire 1.2 MBQ
To: Vinod Koul <vkoul@kernel.org>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-5-pierre-louis.bossart@linux.intel.com>
 <20200826090542.GZ2639@vkoul-mobl>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c5119781-bee0-f11b-eb73-cd2da6ab09f5@linux.intel.com>
Date: Wed, 26 Aug 2020 11:57:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200826090542.GZ2639@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


>> +#include <linux/device.h>
>> +#include <linux/errno.h>
>> +#include <linux/mod_devicetable.h>
> 
> Curious why do you need this header?

I'll return the question back to you, since you added this header for 
regmap-sdw.c:

7c22ce6e21840 (Vinod Koul           2018-01-08 15:50:59 +0530  6) 
#include <linux/mod_devicetable.h>

so I assumed it was needed here as well.

>> +MODULE_DESCRIPTION("Regmap SoundWire Module");
> 
> This is same of sdw module, pls make this one a bit different.

yes, fixed.
