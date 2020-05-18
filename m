Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404D81D7EBC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF6F16A5;
	Mon, 18 May 2020 18:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF6F16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820067;
	bh=3uswkptaJ9f1GsZmaEQSmifHoruEyTDd51+UTrimOQA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C78mkxKsqeAoq0ngxfjutkbajfY+i6B6SLdds9KP/4PqJA3NQL3fDSvp5L5OohaaG
	 Ccmfz5scu2HUDgW6yVydJ9BgrVzilOlniep/sIfHzYiGQgwsF2MI0fMTKRXMNk1its
	 rN/+bDpncaQY/JCe4UuWdGhBs3j5k2obcsq976tE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F5BF80291;
	Mon, 18 May 2020 18:39:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A849BF8028F; Mon, 18 May 2020 18:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E40ADF8027D
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E40ADF8027D
IronPort-SDR: T7gx+UGrkv5oz3IROya4a3vuPtzbASEslQmUHAaqrjGDMmkPye2eTMUcxy1EB1OjuzKI4Zy76x
 TPndBa83/hJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 09:38:55 -0700
IronPort-SDR: Uca8JzZQYfZr5EHQKa/ie0sQrsASRuLsbacp1WCg4pyOZFxyHLjg7vAyZkYkZjzcIFFHxw03Jo
 k2cs2fXZPHBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="465641609"
Received: from iremsen-mobl1.amr.corp.intel.com (HELO [10.254.66.150])
 ([10.254.66.150])
 by fmsmga005.fm.intel.com with ESMTP; 18 May 2020 09:38:54 -0700
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore
 WT8-A tablet
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20200518072416.5348-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ab73e509-deaa-d5ea-46ed-b54713eca474@linux.intel.com>
Date: Mon, 18 May 2020 09:52:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518072416.5348-1-hdegoede@redhat.com>
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



On 5/18/20 2:24 AM, Hans de Goede wrote:
> The Toshiba Encore WT8-A tablet almost fully works with the default
> settings for non-CR Bay Trail devices. The only problem is that its
> jack-detect switch is not inverted (it is active high instead of
> the normal active low).
> 
> Add a quirk for this model using the default settings +
> BYT_RT5640_JD_NOT_INV.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 08f4ae964b02..fbfd53874b47 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -742,6 +742,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   					BYT_RT5640_SSP0_AIF1 |
>   					BYT_RT5640_MCLK_EN),
>   	},
> +	{	/* Toshiba Encore WT8-A */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "TOSHIBA WT8-A"),
> +		},
> +		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
> +					BYT_RT5640_JD_SRC_JD2_IN4N |
> +					BYT_RT5640_OVCD_TH_2000UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
> +					BYT_RT5640_JD_NOT_INV |
> +					BYT_RT5640_MCLK_EN),
> +	},
>   	{	/* Catch-all for generic Insyde tablets, must be last */
>   		.matches = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
> 
