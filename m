Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D07EA014
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 16:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 178DF820;
	Mon, 13 Nov 2023 16:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 178DF820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699889711;
	bh=eNASutfC7cQpeZeLKAUR5FqbVi0jfYPJRuf6qYpm55I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NnzuCmQyBN7bNl1CK1zSVyQgiRfb/acoOxBhdwslCB3at/KHKQlRsPl7OFs/RmJRS
	 M7MNOqGN04xbN7SENYl+cnqGCpX5fNYtxCF2S9Ro30Qo+26oARd4ONYf7NGSIrVj8C
	 TKWTmEuKnflpgwOghpXygSEFgbdjHpG3F1zqa9eA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69014F8055A; Mon, 13 Nov 2023 16:34:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB009F8016E;
	Mon, 13 Nov 2023 16:34:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAE8AF8022B; Mon, 13 Nov 2023 16:34:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F09DF80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 16:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F09DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aEjO6n+c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699889642; x=1731425642;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eNASutfC7cQpeZeLKAUR5FqbVi0jfYPJRuf6qYpm55I=;
  b=aEjO6n+cyiXvmfWeTEXiU2mtD6YuqquFLYurXUSDzgs0gnD0vHz8Wo0C
   C3Ywy+8RhG56w00snv6xvh32qRkLAnlus32VYFGbLzcDJohafv5I6eaqy
   hIqfmeQSNLgIDLNqEUHDygLNldHxYjGFBJrx74gvyba5S6cmGEYKdDMR/
   AcoD5krYsZKBaiV87uWTA8RRs5n27dVgAvH2C6cynW/zL4j4xRCVUqPlz
   p+sKuTgnA/AcozTVtfZ7WjNi2CeOSRhFYealzZjSLkS84hE9aeCkspL4q
   ZmbkwuIPsDF9QI3YYuzMsL4OfkCVzExmyIxX3Yi58DLvcZMREgw7FV0KK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375480752"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200";
   d="scan'208";a="375480752"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:33:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011570183"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200";
   d="scan'208";a="1011570183"
Received: from renliang-mobl.amr.corp.intel.com (HELO [10.251.10.75])
 ([10.251.10.75])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:33:53 -0800
Message-ID: <5d08a0a9-cb3a-4e8f-ba9b-1e2437502b04@linux.intel.com>
Date: Mon, 13 Nov 2023 08:40:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND,v3] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Content-Language: en-US
To: Mac Chiang <mac.chiang@intel.com>, alsa-devel@alsa-project.org
Cc: cezary.rojewski@intel.com, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20231113115907.18539-1-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231113115907.18539-1-mac.chiang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HG7DLREKSBJQOU7GAIFENMLEQKG2JIWN
X-Message-ID-Hash: HG7DLREKSBJQOU7GAIFENMLEQKG2JIWN
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HG7DLREKSBJQOU7GAIFENMLEQKG2JIWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 11/13/23 05:59, Mac Chiang wrote:
> RT5650 is I2S codec integrated with HP and SPK.
> The HW board connects SoC I2S to RT5650 codec as below:
> 
> I2S0: ALC5650 aif1 for Speaker
> I2S2: ALC5650 aif2 for Headphone
> 
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> ---
> Hi Pierre, I resend the patch for your review and cc maintainers. Thanks.
> Pick up for Chrome MTL projects support.

The code was submitted as
https://github.com/thesofproject/linux/pull/4661, approved and merged in
the topic/sof-dev branch. By submitting the same code multiple times
using two different paths, you are just adding more confusion and noise
for what should be a straightforward process on a minor change.

Moving forward, please pick one of:
a) submit to alsa-devel
b) submit to the SOF GitHub and let SOF maintainers upstream.

Thank you.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Changes v3:
>   - missing Reviewed-by, add it.
> ---
> 
>  sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
>  sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 12 ++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 06ad15af46de..9723479f43da 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -1147,6 +1147,15 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_RT5682_SSP_AMP(0) |
>  					SOF_RT5682_NUM_HDMIDEV(3)),
>  	},
> +	{
> +		.name = "mtl_rt5650",
> +		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> +					SOF_RT5682_SSP_CODEC(2) |
> +					SOF_RT5682_SSP_AMP(0) |
> +					SOF_RT5682_NUM_HDMIDEV(3) |
> +					SOF_BT_OFFLOAD_SSP(1) |
> +					SOF_SSP_BT_OFFLOAD_PRESENT),
> +	},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, board_ids);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> index 301b8142d554..af4224bff718 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> @@ -40,6 +40,11 @@ static const struct snd_soc_acpi_codecs mtl_lt6911_hdmi = {
>  	.codecs = {"INTC10B0"}
>  };
>  
> +static const struct snd_soc_acpi_codecs mtl_rt5650_amp = {
> +	.num_codecs = 1,
> +	.codecs = {"10EC5650"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
>  	{
>  		.comp_ids = &mtl_rt5682_rt5682s_hp,
> @@ -77,6 +82,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
>  					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
>  					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
>  	},
> +	{
> +		.id = "10EC5650",
> +		.drv_name = "mtl_rt5650",
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &mtl_rt5650_amp,
> +		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
> +	},
>  	/* place amp-only boards in the end of table */
>  	{
>  		.id = "INTC10B0",
