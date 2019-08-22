Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23200998AA
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 18:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D8086F;
	Thu, 22 Aug 2019 17:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D8086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566489623;
	bh=PI1EcbrEv6uCopGTLcJzaRYKfjB+/ulj4IoPP0pOSwo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGEYNDqp/oEknfVTBxHTmvSbGo+LnJ45Wq19nmsmOpn52R7p6LYr1JcvZz3pFD0DZ
	 pHbnhW2aony+ZWQpH6lLz7basL2TduUyV99LgoNcuRXya8jl8V3J6LIwqKQMta2ygk
	 JENMV35V4zZ13fHK8E+hNV52xgJzVTRY28vHFYI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D655CF8036D;
	Thu, 22 Aug 2019 17:58:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFCB6F8036E; Thu, 22 Aug 2019 17:58:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9D49F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 17:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D49F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 08:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="330432987"
Received: from rsetyawa-mobl1.amr.corp.intel.com (HELO [10.251.3.78])
 ([10.251.3.78])
 by orsmga004.jf.intel.com with ESMTP; 22 Aug 2019 08:58:29 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822113616.22702-1-cezary.rojewski@intel.com>
 <20190822113616.22702-2-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <76464d4e-a129-99b8-05ab-eff755cc5a1e@linux.intel.com>
Date: Thu, 22 Aug 2019 10:58:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
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
> 
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

I now agree that the code I added is incorrect and probably accesses 
memory offsets that aren't right. I have absolutely no idea why I added 
this comment that 'legacy does not pass parameters' when it most 
definitively does. Good catch on your side.

That said, doesn't the proposed fix introduce another issue?

In the machine drivers, you still get pdata directly, so aren't you 
missing an indirection to get back to pdata from mach?

static int bdw_rt5677_rtd_init(struct snd_soc_pcm_runtime *rtd)
{
	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
	struct sst_pdata *pdata = dev_get_platdata(component->dev);
	struct sst_hsw *broadwell = pdata->dsp;

<<< so here you took the wrong pointer, no?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
