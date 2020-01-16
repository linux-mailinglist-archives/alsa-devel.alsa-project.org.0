Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D313EB2C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371A917F0;
	Thu, 16 Jan 2020 18:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371A917F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579196925;
	bh=iea3bNSyuS50GMc7EUBQtru+cZ4Q5qJjMWbUt9LGFE8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CC1BUZNGhVflGgNvnKAx0CWVti5Jf9mPbe5wUQSMhCVnxx1qzv6Re9YdcRH/dJCUu
	 /ZVXAwwvuHbB7t7jOqwvASQgScU7EMHKaFHV9C+o/o8eNwwWKFx2HXoHVpbognv5Tw
	 ck9pzlxJvmMMNyCa9Mg/1ewXLkqEkOLHqpdcZ9aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22ABCF802FE;
	Thu, 16 Jan 2020 18:40:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36A32F802FE; Thu, 16 Jan 2020 18:40:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CB17F802F7
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB17F802F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 09:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; d="scan'208";a="274092350"
Received: from frederic-mobl1.amr.corp.intel.com (HELO [10.251.150.187])
 ([10.251.150.187])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Jan 2020 09:40:26 -0800
To: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>,
 "Jie, Yang" <yang.jie@intel.com>, Takashi Iwai <tiwai@suse.de>,
 Keyon Jie <yang.jie@linux.intel.com>
References: <20200116045318.5498-1-yang.jie@linux.intel.com>
 <s5hd0bjq3cu.wl-tiwai@suse.de>
 <97bbe88d1a6b63fe8e9b02bf0c5ce4a80553c48d.camel@linux.intel.com>
 <s5hsgkf7l2e.wl-tiwai@suse.de>
 <3c0a0067043d614cd4491b28acf6d49640746b15.camel@linux.intel.com>
 <s5hh80v7h82.wl-tiwai@suse.de>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EDB4@SHSMSX105.ccr.corp.intel.com>
 <E7B1D079BA13FB44A978CC8F69C7D6A96F98EE27@SHSMSX105.ccr.corp.intel.com>
 <c70934a1-b838-5029-6573-bf76a34c4cb9@linux.intel.com>
 <93ac843a-bad5-550e-f427-e2a94bd3e8ef@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b6b55180-b846-96e7-4521-7d3b03881d06@linux.intel.com>
Date: Thu, 16 Jan 2020 11:40:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <93ac843a-bad5-550e-f427-e2a94bd3e8ef@linux.intel.com>
Content-Language: en-US
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
 constrained by preallocated bytes issue
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>>> So, do you suggest not doing preallocation(or calling it with 0 
>>>> size) for all
>>>> driver with TYPE_SG? I am fine if this is the recommended method, I 
>>>> can try
>>>> this on SOF I2S platform to see if it can work as we required for 
>>>> very large
>>>> buffer size.
>>
>> Keyon, for the rest of us to follow this patch, would you mind 
>> clarifying what drives the need for a 'very large buffer size', and 
>> what order of magnitude this very large size would be.
>>
>> FWIW, we've measured consistently on different Windows/Linux 
>> platforms, maybe 10 years ago, that once you reach a buffer of 1s (384 
>> kB) the benefits from increasing that buffer size further are marginal 
>> in terms of power consumption, and generate all kinds of issues with 
>> volume updates and deferred routing changes.
>>
> We need bigger buffer on host side to compensate the wake up time from 
> d0ix to d0 which takes ~2 seconds on my setup. So, wiith smaller buffer 
> sizes like < 2 seconds we overwrite data since FW keeps copping while 
> host doesn't read until its up and running again.

Right, that's a valid case, but that's 256 kB, not 'very large' or 
likely to ever trigger an OOM case.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
