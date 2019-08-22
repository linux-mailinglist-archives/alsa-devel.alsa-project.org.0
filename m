Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D5995EE
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 16:09:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D10E1695;
	Thu, 22 Aug 2019 16:08:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D10E1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566482972;
	bh=X+AMTkysIQQSSgcBtoHAmu+jPucGKlPTLXKt1vSXaRM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XSF5mBTgYw/um9JSyZVbwDySMmVjYToWOig8uXvfAo4lMDR05b/OI6w5dZQpGGjrK
	 Pk8yV2UzLZ58/0gWx/5iBX198oxJRJvLhbTA0vAmNkPTJDlfOEXjY6qfnVXRmgZsgJ
	 unMcWNUdQMeFDu1bshPOPY+116k91F3lTKIXsLSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28F82F800BF;
	Thu, 22 Aug 2019 16:07:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CE08F8036E; Thu, 22 Aug 2019 16:07:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EE77F80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE77F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 07:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="354297480"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 22 Aug 2019 07:07:37 -0700
Received: from tcwomach-mobl1.amr.corp.intel.com (unknown [10.255.34.51])
 by linux.intel.com (Postfix) with ESMTP id 916345803A5;
 Thu, 22 Aug 2019 07:07:36 -0700 (PDT)
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dbde72dc-9b41-f1a8-001a-5674f5af3b61@linux.intel.com>
Date: Thu, 22 Aug 2019 09:07:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822113616.22702-2-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: Haswell: Adjust machine
 device private context
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

On 8/22/19 6:36 AM, Cezary Rojewski wrote:
> Apart from Haswell machines, all other devices have their private data
> set to snd_soc_acpi_mach instance.
> 
> Changes for HSW/ BDW boards introduced with series:
> https://patchwork.kernel.org/cover/10782035/
> 
> added support for dai_link platform_name adjustments within card probe
> routines. These take for granted private_data points to
> snd_soc_acpi_mach whereas for Haswell, it's sst_pdata instead. Change
> private context of platform_device - representing machine board - to
> address this.

Cezary, see the comments of the initial series:

"Note that byt-max98080, byt-rt5640 were not modified since they are
deprecated. bytcht-nocodec and the Skylake/Kabylake machine drivers
changes were not changed since SOF does not support them. There may be
additional changes if and when Skylake/Kabylake are supported by SOF
(largely a firmware authentication issue, not technical difficulty)."

I intentionally did not touch the Haswell and Baytrail legacy since both 
drivers do not update the platform name, this is only done for cases 
where SOF is used.

So while I don't mind a change, it's got to come with tests for each 
variant, and if you do the changes for Haswell then you want to change 
Baytrail legacy machine drivers as well. And are we going to change the 
SKL/KBL machine drivers to allow for this platform name rewrite?

Also the information below is misleading: nothing is broken in the 
current solution and -stable kernels do not need to pick this patchset. 
This is a code alignment and the behavior is identical.

Or as an alternative we leave the code as is...

> Fixes: e87055d732e3 ("ASoC: Intel: haswell: platform name fixup support")
> Fixes: 7e40ddcf974a ("ASoC: Intel: bdw-rt5677: platform name fixup support")
> Fixes: 2d067b2807f9 ("ASoC: Intel: broadwell: platform name fixup support")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/common/sst-acpi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/sst-acpi.c b/sound/soc/intel/common/sst-acpi.c
> index 15f2b27e643f..c34f628c7987 100644
> --- a/sound/soc/intel/common/sst-acpi.c
> +++ b/sound/soc/intel/common/sst-acpi.c
> @@ -109,11 +109,12 @@ int sst_acpi_probe(struct platform_device *pdev)
>   	}
>   
>   	platform_set_drvdata(pdev, sst_acpi);
> +	mach->pdata = sst_pdata;
>   
>   	/* register machine driver */
>   	sst_acpi->pdev_mach =
>   		platform_device_register_data(dev, mach->drv_name, -1,
> -					      sst_pdata, sizeof(*sst_pdata));
> +					      mach, sizeof(*mach));
>   	if (IS_ERR(sst_acpi->pdev_mach))
>   		return PTR_ERR(sst_acpi->pdev_mach);
>   
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
