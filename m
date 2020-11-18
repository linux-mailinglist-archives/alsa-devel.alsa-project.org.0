Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF1C2B867D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 22:21:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8933F171B;
	Wed, 18 Nov 2020 22:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8933F171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605734512;
	bh=VHuhEiXAoYqtIRaijSFqCKlP8k1KzSTKRmJ4mQHtAxM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRtFQYOsXMOMGjbS9x3urH51jVvGs+Ybl+n6t+3zfS/dqWnWAsoAUEmCgMZ3nY8jT
	 K4mj5lO5ljPt32qdqn7BUIz7Vzt9vPinpB6PUb0TsfL4fDgTASKHYR5unLT+Y2bybf
	 qz8oIiwfjTdWUPBYyzXXqAhSgTMVkngXVYepjq1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F673F8010A;
	Wed, 18 Nov 2020 22:20:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43991F8016C; Wed, 18 Nov 2020 22:20:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1709F800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 22:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1709F800EE
IronPort-SDR: ABHhRdCktwSG0A56/gWQL9oOUqF5XyiYXrKO4ota6LLOMTbEOoeyyDPAmrHLdAKYqrSxWrnV5c
 UBw955gHyXWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="167678577"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="167678577"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 13:20:03 -0800
IronPort-SDR: SAEopTNQ8P6z09kDMjRXKx9GgMvMm94VQUR3Uj8nHh0uCi+xCGviKIQPE2AUrdoucJl9FV0S3T
 54xRPnA56jjw==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="534490692"
Received: from sowmyave-mobl.amr.corp.intel.com (HELO [10.212.131.189])
 ([10.212.131.189])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 13:20:02 -0800
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 Detachable
 quirks
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20201118121515.11441-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fba824db-ade3-49ef-5516-5dd2d5a9226f@linux.intel.com>
Date: Wed, 18 Nov 2020 11:21:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118121515.11441-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 11/18/20 6:15 AM, Hans de Goede wrote:
> The HP Pavilion x2 Detachable line comes in many variants:
> 
> 1. Bay Trail SoC + AXP288 PMIC, Micro-USB charging (10-k010nz, ...)
>     DMI_SYS_VENDOR: "Hewlett-Packard"
>     DMI_PRODUCT_NAME: "HP Pavilion x2 Detachable PC 10"
>     DMI_BOARD_NAME: "8021"
> 
> 2. Bay Trail SoC + AXP288 PMIC, Type-C charging (10-n000nd, 10-n010nl, ...)
>     DMI_SYS_VENDOR: "Hewlett-Packard"
>     DMI_PRODUCT_NAME: "HP Pavilion x2 Detachable"
>     DMI_BOARD_NAME: "815D"
> 
> 3. Cherry Trail SoC + AXP288 PMIC, Type-C charging (10-n101ng, ...)
>     DMI_SYS_VENDOR: "HP"
>     DMI_PRODUCT_NAME: "HP Pavilion x2 Detachable"
>     DMI_BOARD_NAME: "813E"
> 
> 4. Cherry Trail SoC + TI PMIC, Type-C charging (10-p002nd, 10-p018wm, ...)
>     DMI_SYS_VENDOR: "HP"
>     DMI_PRODUCT_NAME: "HP x2 Detachable 10-p0XX"
>     DMI_BOARD_NAME: "827C"
> 
> 5. Cherry Trail SoC + TI PMIC, Type-C charging (x2-210-g2, ...)
>     DMI_SYS_VENDOR: "HP"
>     DMI_PRODUCT_NAME: "HP x2 210 G2"
>     DMI_BOARD_NAME: "82F4"
> 
> Variant 1 needs the exact same quirk as variant 2, so relax the DMI check
> for the existing quirk a bit so that it matches both variant 1 and 2
> (note the other variants will still not match).
> 
> Variant 2 already has an existing quirk (which now also matches variant 1)
> 
> Variant 3 uses a cx2072x codec, so is not applicable here.
> 
> Variant 4 almost works with the defaults, but it also needs a quirk to
> fix jack-detection, add a new quirk for this.
> 
> Variant 5 does use a RT5640 codec (based on old dmesg output), but was
> otherwise not tested, keep using the defaults for this variant.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1896924
> Fixes: ec8e8418ff7d ("ASoC: Intel: bytcr_rt5640: Add quirks for various devices")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Thank you Hans! I honestly don't know how you managed to keep track of 
so many hardware variants.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 9dadf6561444..f790514a147d 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -520,10 +520,10 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
>   					BYT_RT5640_MCLK_EN),
>   	},
> -	{	/* HP Pavilion x2 10-n000nd */
> +	{	/* HP Pavilion x2 10-k0XX, 10-n0XX */
>   		.matches = {
> -			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> -			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP Pavilion x2 Detachable"),
> +			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion x2 Detachable"),
>   		},
>   		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
>   					BYT_RT5640_JD_SRC_JD2_IN4N |
> @@ -532,6 +532,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   					BYT_RT5640_SSP0_AIF1 |
>   					BYT_RT5640_MCLK_EN),
>   	},
> +	{	/* HP Pavilion x2 10-p0XX */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP x2 Detachable 10-p0XX"),
> +		},
> +		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
> +					BYT_RT5640_JD_SRC_JD1_IN4P |
> +					BYT_RT5640_OVCD_TH_1500UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>   	{	/* HP Stream 7 */
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> 
