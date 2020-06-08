Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5F1F219D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 23:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5571674;
	Mon,  8 Jun 2020 23:48:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5571674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591652935;
	bh=KrM0m2f5Lni+8loSeabUnfihI4TnhQaEslBMyfVKYbQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbjvtHX1u+nGLigbwCDvL8z3jK3F9wHVFOJ1MuXfnHGzVDddUOXrzDm/IcPWndEYP
	 mzhzdTjQn/+qndAeaX7Ki0FENt1c5Z5IGSlm/JW75YidgldH78a1U7fN6L2ahGqxty
	 z7nI247uLt+FY0cA8h/rSaoBV5lDIp9HGeOPRu14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C42D1F802DB;
	Mon,  8 Jun 2020 23:45:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5D10F802BD; Mon,  8 Jun 2020 23:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 185AAF8021E
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 23:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 185AAF8021E
IronPort-SDR: AOe9h3VMtnGJYO4xU2G0jbtnkelP+5wniw+KCok6JteNHimwp3zrMwDWLB60qxJLNVN0f7eGO1
 zwaTmudamsYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 14:45:13 -0700
IronPort-SDR: GtfnUP5CJrgkKvpsF8rBroM8XZjUcZuzt2kOQYRgnpwQeHPeKdjUnLpSVSCq7Q1WgunL8kXd7z
 EEQRCVYE2OJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,489,1583222400"; d="scan'208";a="446893878"
Received: from skarmaka-mobl2.amr.corp.intel.com (HELO [10.254.104.56])
 ([10.254.104.56])
 by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 14:45:13 -0700
Subject: Re: [PATCH 1/2] ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba
 Encore WT10-A tablet
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20200608204634.93407-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2773afcf-e75d-116f-6492-c69a5f497bab@linux.intel.com>
Date: Mon, 8 Jun 2020 16:33:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204634.93407-1-hdegoede@redhat.com>
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



On 6/8/20 3:46 PM, Hans de Goede wrote:
> The Toshiba Encore WT10-A tablet almost fully works with the default
> settings for Bay Trail CR devices. The only issue is that it uses a
> digital mic. connected the the DMIC1 input instead of an analog mic.
> 
> Add a quirk for this model using the default settings with the input-map
> replaced with BYT_RT5640_DMIC1_MAP.

For patch 1 and 2

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index fbfd53874b47..5c1a5e2aff6f 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -754,6 +754,18 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   					BYT_RT5640_JD_NOT_INV |
>   					BYT_RT5640_MCLK_EN),
>   	},
> +	{	/* Toshiba Encore WT10-A */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "TOSHIBA WT10-A-103"),
> +		},
> +		.driver_data = (void *)(BYT_RT5640_DMIC1_MAP |
> +					BYT_RT5640_JD_SRC_JD1_IN4P |
> +					BYT_RT5640_OVCD_TH_2000UA |
> +					BYT_RT5640_OVCD_SF_0P75 |
> +					BYT_RT5640_SSP0_AIF2 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>   	{	/* Catch-all for generic Insyde tablets, must be last */
>   		.matches = {
>   			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
> 
