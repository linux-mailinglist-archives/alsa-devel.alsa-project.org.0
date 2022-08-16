Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07202595731
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 11:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98F0074C;
	Tue, 16 Aug 2022 11:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98F0074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660643799;
	bh=Qs5JcP0DyxdDr2M+TfNbeXHgZMZJ7UyRrbaQPUfUtUw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iPnsdgHd6HExMM3fagXPlzDsX3a7qrHGA7j8TUo2X6h7erE/xXUc21D0el/8tRMSb
	 +w34biJKS4s5mH01E3oiFVBG/0L991ogizyVvbIYYEQPdIrNRfUBo70nznbwEQYP//
	 4kAslflUNS0INr1SCUlS9+onzJwR9Bo9FvOqk5SA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11A9EF80424;
	Tue, 16 Aug 2022 11:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 824FAF8032D; Tue, 16 Aug 2022 11:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A3AEF80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A3AEF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k9i7RThu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660643737; x=1692179737;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qs5JcP0DyxdDr2M+TfNbeXHgZMZJ7UyRrbaQPUfUtUw=;
 b=k9i7RThu52bQXek4IzIiiYLHqpiYWauBfEljES2ON186uoN6DShK5AzS
 r3OkjkdT3/mRAWIO0fRqUNQBnHeEiqb7ukvWRF9obfr/o3oBaScXX0T/X
 grzqYwtvcKOlS7XkZyBHPBwEsbPa/aaN7eGOsXu9pq/XzQy40/j+KxFWC
 P+6Nc25G4tOKmd3uRSl7YOGqTIMzxXUKzYdDV89TdYqMsFNM4N74Ck/Bq
 cVpDveOOHI4PiVdAxl6MRu1hQ2fF8jKCDdcxYNYMtLHEsDYAMO4j2z9IZ
 kDmmCsksjkReIM7WFNo5w6APEgCM2sGPVQYPocoQtCuTi6Y9W0VlcgAo3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="272569533"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="272569533"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 02:55:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="610208209"
Received: from kroegerb-mobl1.ger.corp.intel.com (HELO [10.252.51.43])
 ([10.252.51.43])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 02:55:24 -0700
Message-ID: <f6baa98e-af46-7ca8-397a-2e762cd444c6@linux.intel.com>
Date: Tue, 16 Aug 2022 11:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: Intel: sof_rt5682: Add support for
 jsl_rt5682_rt1019
Content-Language: en-US
To: Sean Hong <sean.hong@quanta.corp-partner.google.com>, perex@perex.cz,
 tiwai@suse.com, brent.lu@intel.com
References: <20220816075424.1245593-1-sean.hong@quanta.corp-partner.google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220816075424.1245593-1-sean.hong@quanta.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, alsa-devel@alsa-project.org,
 peter.ujfalusi@linux.intel.com
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



On 8/16/22 09:54, Sean Hong wrote:
> This patch adds the driver data for rt5682 support jsl_rt5682_rt1019.
> 
> Signed-off-by: Sean Hong <sean.hong@quanta.corp-partner.google.com>
> ---
>  sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
>  sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 045965312..3a840f3a9 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -1100,6 +1100,15 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_RT5682_SSP_AMP(1) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> +	{
> +		.name = "jsl_rt5682_rt1019",
> +		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_MCLK_24MHZ |

I see it's the same setting for all JSL devices but I am having doubts
on this MCLK.  Is this 24MHz value correct for JSL? It's derived from
ICL so in theory the MCLK should be a multiple of 19.2MHz if the root
frequency was the oscillator.

Is this intentional?

> +					SOF_RT5682_SSP_CODEC(0) |
> +					SOF_SPEAKER_AMP_PRESENT |
> +					SOF_RT1019_SPEAKER_AMP_PRESENT |
> +					SOF_RT5682_SSP_AMP(1)),
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> index b95c4b2cd..e374bf163 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> @@ -29,6 +29,11 @@ static const struct snd_soc_acpi_codecs rt1015p_spk = {
>  	.codecs = {"RTL1015"}
>  };
>  
> +static struct snd_soc_acpi_codecs rt1019p_spk = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL1019"}
> +};
> +
>  static const struct snd_soc_acpi_codecs mx98360a_spk = {
>  	.num_codecs = 1,
>  	.codecs = {"MX98360A"}
> @@ -78,6 +83,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
>  		.quirk_data = &mx98360a_spk,
>  		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
>  	},
> +	{
> +		.comp_ids = &rt5682_rt5682s_hp,
> +		.drv_name = "jsl_rt5682_rt1019",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &rt1019p_spk,
> +		.sof_tplg_filename = "sof-jsl-rt5682-rt1019.tplg",
> +	},
>  	{
>  		.id = "10134242",
>  		.drv_name = "jsl_cs4242_mx98360a",
