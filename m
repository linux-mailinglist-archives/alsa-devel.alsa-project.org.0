Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3067027BA4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 13:22:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A268166E;
	Thu, 23 May 2019 13:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A268166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558610519;
	bh=FhYsFB+XDbKaxD+AAnAO2kjdspQfyjBm2oWFMq3kXIo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ph7t1zP+kuuNT1/RRMY6Or4GO/RBRL/bT9s5h5YgRLBKetyOI1KcyG+OrNf2EfhHE
	 wFQpaui0Y4QH3CiSLR1YfkLmzaJLCzH6Xh9WUPJi8j3XSkSkJhbA+bDKBfag4HZ8oM
	 KKH49cGVG2XDJSSos/gP1Smpn3PSRywOycMjTp9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DADF89707;
	Thu, 23 May 2019 13:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5F84F89674; Thu, 23 May 2019 13:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 733DCF80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 13:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 733DCF80C0F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 04:20:06 -0700
X-ExtLoop1: 1
Received: from jlrosema-mobl.amr.corp.intel.com (HELO [10.252.131.22])
 ([10.252.131.22])
 by orsmga002.jf.intel.com with ESMTP; 23 May 2019 04:20:05 -0700
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <46dc0767-bb21-2b98-90f2-34dd4bcad7c0@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bdad5973-93e2-ea2b-85e9-c68635b6a5ba@linux.intel.com>
Date: Thu, 23 May 2019 06:20:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <46dc0767-bb21-2b98-90f2-34dd4bcad7c0@infradead.org>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sound/soc/intel/boards: limit some
 drivers to X86 since headers are only in arch/x86/
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



On 5/22/19 10:58 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Several drivers in sound/soc/intel/boards/ #include header files
> that only exist in arch/x86/include/asm.  This causes build errors,
> so make these drivers depend on X86.
> 
> Fixes these build errors (on ia64):
> 
> ../sound/soc/intel/boards/bxt_da7219_max98357a.c:19:10: fatal error: asm/cpu_device_id.h: No such file or directory
>   #include <asm/cpu_device_id.h>
> ../sound/soc/intel/boards/bytcr_rt5640.c:31:10: fatal error: asm/cpu_device_id.h: No such file or directory
>   #include <asm/cpu_device_id.h>
> ../sound/soc/intel/boards/bytcr_rt5651.c:33:10: fatal error: asm/cpu_device_id.h: No such file or directory
>   #include <asm/cpu_device_id.h>
> ../sound/soc/intel/boards/cht_bsw_rt5645.c:29:10: fatal error: asm/cpu_device_id.h: No such file or directory
>   #include <asm/cpu_device_id.h>
> ../sound/soc/intel/boards/bytcht_es8316.c:33:10: fatal error: asm/cpu_device_id.h: No such file or directory
>   #include <asm/cpu_device_id.h>
> ../sound/soc/intel/boards/bytcht_da7213.c:26:10: fatal error: asm/platform_sst_audio.h: No such file or directory
>   #include <asm/platform_sst_audio.h>
> 
> And more drivers determined by:
>> grep "include.*asm.cpu_device_id.h" *.c
> bxt_da7219_max98357a.c:#include <asm/cpu_device_id.h>
> bytcht_es8316.c:#include <asm/cpu_device_id.h>
> bytcr_rt5640.c:#include <asm/cpu_device_id.h>
> bytcr_rt5651.c:#include <asm/cpu_device_id.h>
> cht_bsw_rt5645.c:#include <asm/cpu_device_id.h>
> sof_rt5682.c:#include <asm/cpu_device_id.h>
>    and
>> grep "include.*asm.platform_sst_audio.h" *.c
> bytcht_da7213.c:#include <asm/platform_sst_audio.h>
> bytcht_es8316.c:#include <asm/platform_sst_audio.h>
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> Cc: Jie Yang <yang.jie@linux.intel.com>
> Cc: alsa-devel@alsa-project.org
> ---
>   sound/soc/intel/boards/Kconfig |    6 ++++++
>   1 file changed, 6 insertions(+)
> 
> --- lnx-52-rc1.orig/sound/soc/intel/boards/Kconfig
> +++ lnx-52-rc1/sound/soc/intel/boards/Kconfig
> @@ -87,6 +87,7 @@ config SND_SOC_INTEL_BYTCR_RT5640_MACH
>   	tristate "Baytrail and Baytrail-CR with RT5640 codec"
>   	depends on I2C && ACPI
>   	depends on X86_INTEL_LPSS || COMPILE_TEST
> +	depends on X86

How does this improve the results?

config X86_INTEL_LPSS
	bool "Intel Low Power Subsystem Support"
	depends on X86 && ACPI && PCI

So the X86 dependency is already there. Does this happen with 
COMPILE_TEST set? If yes, maybe that's the part that needs to be 
changed? The addition of COMPILE_TEST here is quite recent and might 
need to be reverted.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
