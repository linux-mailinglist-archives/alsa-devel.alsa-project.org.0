Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B089855D1
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 10:46:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E3DE86F;
	Wed, 25 Sep 2024 10:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E3DE86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727254016;
	bh=xKL4aaFY4RmnNb3f+W1zkmXNIxHXpZYbk2lZXvhOuPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UnMGVQBAGvWH8bvX2FctSqEYiIqvPYLb1nqe1Q0ltjyPzmwIvxrUP5B4Abd4Xc9Z7
	 GxRxx0ZlQAwuQxGfBHO+PUKMTlWwyauSRjLFzSDpGIzgNdVxbG0AqhwGSvGAWsDgd1
	 QAewOy+T0oLMQjI6xC8otjVaU2G+uD6wJ105pOFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0760F8049C; Wed, 25 Sep 2024 10:46:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73FA2F8049C;
	Wed, 25 Sep 2024 10:46:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B33B6F802DB; Wed, 25 Sep 2024 10:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74CC0F80074
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 10:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74CC0F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bLD449KE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727253978; x=1758789978;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xKL4aaFY4RmnNb3f+W1zkmXNIxHXpZYbk2lZXvhOuPs=;
  b=bLD449KEJGESReTvSlZV0M1bWU7q0iWkqjQSdg2I5Eeywm0quqJ/pMX7
   hq3tXa/vT3Ni1isA5Xm3gsOFwemcEp8ggq++eOaLzU6hoKRXVrLB4cTya
   FOstsPBCrpHpmw7hNRoB/3jYsbiJtSAI+AJCNO9a52DlAildR7M4NhtMX
   IES4y4titr9X8q4ASDky/ArtoaAKcagFyHGMDG9MCe+cqTio1cy95ZwC0
   3y689oTTg10x3lc6KzjFWx4bKtKr3F1jUAjA+epaW+d78Kx6+DuWqFfI9
   reh36Tv4k27EpqWV5nKpRdVjfS2unCjlKOWRxzURT0fE0SDWflYjmsC90
   Q==;
X-CSE-ConnectionGUID: ZhhKaXmRTka9tNApCIhB+Q==
X-CSE-MsgGUID: PBIftfxjTWGiKDW7jyIz1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30079167"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600";
   d="scan'208";a="30079167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 01:46:15 -0700
X-CSE-ConnectionGUID: 2JP7K0g9RHWi3KLwhIZrOA==
X-CSE-MsgGUID: BQZ2JySuSzWRKK8r8IpEwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600";
   d="scan'208";a="71787690"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30])
 ([10.245.246.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 01:46:11 -0700
Message-ID: <814913ab-903a-4395-bfb9-5fcbb9d3a5f2@linux.intel.com>
Date: Wed, 25 Sep 2024 10:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: intel: sof_sdw: Add check devm_kasprintf() returned
 value
To: Charles Han <hanchunchao@inspur.com>, yung-chuan.liao@linux.intel.com,
 ckeepax@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org, liam.r.girdwood@linux.intel.com,
 peter.ujfalusi@linux.intel.com, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240925080030.11262-1-hanchunchao@inspur.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925080030.11262-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IEWR5CDTGWSQJKEN4NLB7MBGTMPYYYQ5
X-Message-ID-Hash: IEWR5CDTGWSQJKEN4NLB7MBGTMPYYYQ5
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEWR5CDTGWSQJKEN4NLB7MBGTMPYYYQ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/25/24 10:00, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure but this
> returned value is not checked.
> 
> Fixes: b359760d95ee ("ASoC: intel: sof_sdw: Add simple DAI link creation helper")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  sound/soc/intel/boards/sof_sdw.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> index d258728d64cf..26917f6f15cf 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -919,6 +919,9 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
>  		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
>  		char *codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
>  						  ssp_info->acpi_id, j++);
> +		if (!name || !cpu_dai_name || !codec_name)
> +			return -ENOMEM;
> +

all 3 changes are correct, thanks for the patch. The only nit-pick is
that I would have moved the devm_ allocation + test lower to be
consistent with the coding style which avoids mixing code and declarations.

>  		int playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
>  		int capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
>  
> @@ -985,6 +988,9 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
>  	for (i = 0; i < hdmi_num; i++) {
>  		char *name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
>  		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
> +		if (!name || !cpu_dai_name)
> +			return -ENOMEM;
> +
>  		char *codec_name, *codec_dai_name;
>  
>  		if (intel_ctx->hdmi.idisp_codec) {
> @@ -996,6 +1002,9 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
>  			codec_dai_name = "snd-soc-dummy-dai";
>  		}
>  
> +		if (!codec_dai_name)
> +			return -ENOMEM;
> +
>  		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
>  						    1, 0, // HDMI only supports playback
>  						    cpu_dai_name, platform_component->name,
> @@ -1019,6 +1028,9 @@ static int create_bt_dailinks(struct snd_soc_card *card,
>  			SOF_BT_OFFLOAD_SSP_SHIFT;
>  	char *name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
>  	char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
> +	if (!name || !cpu_dai_name)
> +		return -ENOMEM;
> +
>  	int ret;
>  
>  	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,

