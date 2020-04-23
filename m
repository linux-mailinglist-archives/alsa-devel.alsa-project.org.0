Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42641B5AA5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 13:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6741E169A;
	Thu, 23 Apr 2020 13:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6741E169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587642126;
	bh=aH8nMyEXcwmUk4q9q32eE37lMkSzonAPVfjfVfsvfsA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J1aP6VyJRNrQSfRrnmryhVmPtuSfaeEqFE6ypPTo5+edtqeM0+4nZkO+ri+9xDHMK
	 xdmmMm0SU+dTHsL8ZVHDvexhmaH6gH4k35dllSCnrUg6jWgDvI4TGoHRaDX2pLwrne
	 7IKdnU1N8zxH30WeeYaCeWj8XQpI4rG0/fDmpkVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EF5F801ED;
	Thu, 23 Apr 2020 13:40:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A72DF801EC; Thu, 23 Apr 2020 13:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_84,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E73AF800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 13:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E73AF800F2
IronPort-SDR: JJYqUJGpEvFYT3x9b7L6zJM7sfIeCs1UUC419+NLxSavKti3eqoWB2e7e2oT9ZzmGIJeBqEydF
 N8uiASEC64Lw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 04:40:13 -0700
IronPort-SDR: Cj48xywAbMam1TqahufwyLNYPK3drQMRyar7exOjvQNwyzVM6INSxvAQx1vkJoAClrKIr5dTkC
 kMptHVGkY0pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="456877968"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.5.100])
 ([10.213.5.100])
 by fmsmga005.fm.intel.com with ESMTP; 23 Apr 2020 04:40:11 -0700
Subject: Re: [PATCH] ALSA: hda: Refactor Intel NHLT init
To: Takashi Iwai <tiwai@suse.de>
References: <20200423112136.25207-1-cezary.rojewski@intel.com>
 <s5hd07ywikl.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <b37cb05b-f4c2-e747-c3f0-1582ed3afadd@intel.com>
Date: Thu, 23 Apr 2020 13:40:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <s5hd07ywikl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On 2020-04-23 13:24, Takashi Iwai wrote:
> On Thu, 23 Apr 2020 13:21:36 +0200,
> Cezary Rojewski wrote:
>>
>> NHLT fetch based on _DSM prevents ACPI table override mechanism from
>> being utilized. Make use of acpi_get_table to enable it and get rid of
>> redundant code.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> This looks like a nice cleanup and I'll happily apply if anyone can
> test with the actual hardware -- currently mine has no DSP, so unable
> to check.
> 
> 
> thanks,
> 
> Takashi
> 

NHLT override method has been added for internal use half a year ago and 
is for some time the default method within our CI. This is tested on a 
wide spread of hardware, that is any Intel AVS archtecture, including 
production laptops.

Actual override works like any SSDT/ DSDT, e.g. usage can be found at:
https://github.com/thesofproject/acpi-scripts

and original:
https://wiki.up-community.org/Pinout_UP2#Installing_ACPI_overrides_to_enable_spi_in_userspace

Early this year I've pushed the initiative to finally shatter bounds of 
mystery surrounding NHLT in Linux and make it available to community. 
Erik and Robert helped me in ACPICA part, patch link:
https://patchwork.kernel.org/patch/11463235/

Spec can now be found at:
https://01.org/blogs/intel-smart-sound-technology-audio-dsp

This has been sanctioned by Intel Legal and acked by Marcin Obara, NHLT 
author so no worries about spec disappearing like it did in 2016.

Czarek
