Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9C1B610A
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 18:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19ADA167D;
	Thu, 23 Apr 2020 18:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19ADA167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587659659;
	bh=cJ9sRTleosi8OVbDnMxeczyRJdVcP94ZoybYpp0BsxY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jXRuRQr+K1pUw6aSM4SS78Qw8zV0DUQDIxtnHrM3u+TUVGzn2UHY93hQCOLhWkD7S
	 Fhk884w3UC7EvoyoIXW6cGqSoOuVbyzmD1GY/LnGlpXPXHU4Pi7tE2GTw/CYA7G4WO
	 yVoCQ0kNWHHsESzX9PrAf5o0UqaD4WFLAOO8EMn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8616DF80299;
	Thu, 23 Apr 2020 18:30:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54A23F802A0; Thu, 23 Apr 2020 18:30:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB4D4F80228
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 18:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB4D4F80228
IronPort-SDR: s21UdoUYFbF8l1Mdn5YVC1CQvzfPA/t92kNpYpjdChR5VIgPtcYHIV7hOyT3xe9yBL7Ly+tJcL
 PyuMLYfmCbOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 09:30:10 -0700
IronPort-SDR: N14StEzhABvVdcgKcBUb+vMAD258MuLFlwVU1h3gsPH0Y/ioeY6lU7PYs/IYKmv9FZ62EeYQMe
 lfxEcOzPsDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="256040318"
Received: from lsatpatx-mobl.gar.corp.intel.com (HELO [10.251.150.156])
 ([10.251.150.156])
 by orsmga003.jf.intel.com with ESMTP; 23 Apr 2020 09:30:10 -0700
Subject: Re: [PATCH] ALSA: hda: Refactor Intel NHLT init
To: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20200423112136.25207-1-cezary.rojewski@intel.com>
 <s5hd07ywikl.wl-tiwai@suse.de>
 <b37cb05b-f4c2-e747-c3f0-1582ed3afadd@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8e3d7780-d776-d964-d8a8-4618b7ae045a@linux.intel.com>
Date: Thu, 23 Apr 2020 11:29:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b37cb05b-f4c2-e747-c3f0-1582ed3afadd@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com
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



On 4/23/20 6:40 AM, Cezary Rojewski wrote:
> On 2020-04-23 13:24, Takashi Iwai wrote:
>> On Thu, 23 Apr 2020 13:21:36 +0200,
>> Cezary Rojewski wrote:
>>>
>>> NHLT fetch based on _DSM prevents ACPI table override mechanism from
>>> being utilized. Make use of acpi_get_table to enable it and get rid of
>>> redundant code.
>>>
>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>
>> This looks like a nice cleanup and I'll happily apply if anyone can
>> test with the actual hardware -- currently mine has no DSP, so unable
>> to check.
>>
>>
>> thanks,
>>
>> Takashi
>>
> 
> NHLT override method has been added for internal use half a year ago and 
> is for some time the default method within our CI. This is tested on a 
> wide spread of hardware, that is any Intel AVS archtecture, including 
> production laptops.

We are checking independently with SOF CI [1], the NHLT is used to 
detect microphone counts so we'll see if there's a regression.

That said, for my education Cezary an you clarify what you typically 
override? the settings are usually tied to specific hardware configs.
Also the NHLT may point to a topology file name but with your recent 
changes an alternate file can be used, so it's not clear to me how 
non-Intel folks might use the override and for what?

While I am at it, we recently had a bug report where a user provided the 
NHLT, and I had no idea how to go about parsing it to check its 
contents. Are there any tools to dump the contents in human-readable 
representation?

[1] https://github.com/thesofproject/linux/pull/2046
