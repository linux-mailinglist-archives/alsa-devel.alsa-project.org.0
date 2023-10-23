Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B17D2B7E
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 09:38:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196F0844;
	Mon, 23 Oct 2023 09:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196F0844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698046713;
	bh=BVXcvER3gZF7y+IzMnHXvHQ3bk1djiH+VHPIzDVb9jI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nr5ov5lc6WZ+QuJr2G4IvHrlA9hAoCEsNd5cCViAJakqh//832r5kNe+8OPKchUzU
	 D3wVYN/mXukuTqtOgAlnJMtbAYudU6U0U1LENieMFzN9W94wIf8oEKnkgUHzsCUydE
	 vO1PtF4hc1Wb2b+YJpS/XuJPkxT4I+iGWQOp38bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA19F80552; Mon, 23 Oct 2023 09:37:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 225F7F8032D;
	Mon, 23 Oct 2023 09:37:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42F2FF804F3; Mon, 23 Oct 2023 09:37:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDB48F8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 09:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB48F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IKZZSVxP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698046634; x=1729582634;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BVXcvER3gZF7y+IzMnHXvHQ3bk1djiH+VHPIzDVb9jI=;
  b=IKZZSVxPPi8hEE6cRV9tKS1kcEFvNEkBi3xBIg82oEWo2UfX/k8Wcc2i
   ya9tYiHOt0EqkHwiUi7xLj9yNIU7eEh5bI507WCMSCbrBcoaDxN6SxPaZ
   k7oT1cO99lTplSbpjDP7Y3zoBGt2uY5frj5MxGKAvp3IlREPdhJ9LzOV2
   J7ucOZNNPKmxGuX6Be7XnOVy5BIqOpEeCsHiHLYGNH5IK0ROrudLpKpAa
   7qCoRJaoEufPC0kFRXlKEH5oyYKxpiEBRoOzNWrCweK/UsCZ5DtFHIENH
   BG6xM81ELk+KEZ8QCfyVmD4JDKAMNYFz8FNxuMjAjQvesyGPkXgNKpm7T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="453256536"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200";
   d="scan'208";a="453256536"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 00:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="1005225982"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200";
   d="scan'208";a="1005225982"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 00:37:03 -0700
Message-ID: <b3be3317-218a-48fd-907a-287bdcbec66f@linux.intel.com>
Date: Mon, 23 Oct 2023 09:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] ASoC: amd: acp: refactor acp i2s clock generation
 code
Content-Language: en-US
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
 mastan.katragadda@amd.com, juan.martinez@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <20231021145110.478744-2-Syed.SabaKareem@amd.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231021145110.478744-2-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2SDUN5EEFMWMA73HXTOFJBGIVY7HA46B
X-Message-ID-Hash: 2SDUN5EEFMWMA73HXTOFJBGIVY7HA46B
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SDUN5EEFMWMA73HXTOFJBGIVY7HA46B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/21/2023 4:50 PM, Syed Saba Kareem wrote:
> Refactor acp i2s LRCLK,BCLK generation code and move to commnon file.
> 
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> ---
>   sound/soc/amd/acp/acp-i2s.c | 32 ++++++++++++++++++++++++++++++
>   sound/soc/amd/acp/amd.h     | 39 -------------------------------------
>   2 files changed, 32 insertions(+), 39 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
> index df350014966a..59d3a499771a 100644
> --- a/sound/soc/amd/acp/acp-i2s.c
> +++ b/sound/soc/amd/acp/acp-i2s.c
> @@ -20,10 +20,42 @@
>   #include <sound/soc.h>
>   #include <sound/soc-dai.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/bitfield.h>
>   
>   #include "amd.h"
>   
>   #define DRV_NAME "acp_i2s_playcap"
> +#define	I2S_MASTER_MODE_ENABLE		1
> +#define	I2S_MODE_ENABLE			0
> +#define	I2S_FORMAT_MODE			GENMASK(1, 1)
> +#define	LRCLK_DIV_FIELD			GENMASK(10, 2)
> +#define	BCLK_DIV_FIELD			GENMASK(23, 11)
> +
> +static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
> +{
> +	u32 i2s_clk_reg, val;
> +
> +	switch (dai_id) {
> +	case I2S_SP_INSTANCE:
> +		i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
> +		break;
> +	case I2S_BT_INSTANCE:
> +		i2s_clk_reg = ACP_I2STDM1_MSTRCLKGEN;
> +		break;
> +	case I2S_HS_INSTANCE:
> +		i2s_clk_reg = ACP_I2STDM2_MSTRCLKGEN;
> +		break;
> +	default:
> +		i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
> +		break;
> +	}
> +
> +	val  = I2S_MASTER_MODE_ENABLE;
> +	val |= I2S_MODE_ENABLE & BIT(1);

There is I2S_FORMAT_MODE define, you probably want to use it instead of 
BIT(1), so there is no "magic number" mask?

> +	val |= FIELD_PREP(LRCLK_DIV_FIELD, adata->lrclk_div);
> +	val |= FIELD_PREP(BCLK_DIV_FIELD, adata->bclk_div);
> +	writel(val, adata->acp_base + i2s_clk_reg);
> +}
>   
>   static int acp_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>   			   unsigned int fmt)
> diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
> index 487eefa5985f..87d1e1f7d6b6 100644
> --- a/sound/soc/amd/acp/amd.h
> +++ b/sound/soc/amd/acp/amd.h
> @@ -188,17 +188,6 @@ struct acp_dev_data {
>   	u32 xfer_rx_resolution[3];
>   };
>   
> -union acp_i2stdm_mstrclkgen {
> -	struct {
> -		u32 i2stdm_master_mode : 1;
> -		u32 i2stdm_format_mode : 1;
> -		u32 i2stdm_lrclk_div_val : 9;
> -		u32 i2stdm_bclk_div_val : 11;
> -		u32:10;
> -	} bitfields, bits;
> -	u32  u32_all;
> -};
> -
>   extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
>   extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
>   
> @@ -276,32 +265,4 @@ static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int
>   POINTER_RETURN_BYTES:
>   	return byte_count;
>   }
> -
> -static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
> -{
> -	union acp_i2stdm_mstrclkgen mclkgen;
> -	u32 master_reg;
> -
> -	switch (dai_id) {
> -	case I2S_SP_INSTANCE:
> -		master_reg = ACP_I2STDM0_MSTRCLKGEN;
> -		break;
> -	case I2S_BT_INSTANCE:
> -		master_reg = ACP_I2STDM1_MSTRCLKGEN;
> -		break;
> -	case I2S_HS_INSTANCE:
> -		master_reg = ACP_I2STDM2_MSTRCLKGEN;
> -		break;
> -	default:
> -		master_reg = ACP_I2STDM0_MSTRCLKGEN;
> -		break;
> -	}
> -
> -	mclkgen.bits.i2stdm_master_mode = 0x1;
> -	mclkgen.bits.i2stdm_format_mode = 0x00;
> -
> -	mclkgen.bits.i2stdm_bclk_div_val = adata->bclk_div;
> -	mclkgen.bits.i2stdm_lrclk_div_val = adata->lrclk_div;
> -	writel(mclkgen.u32_all, adata->acp_base + master_reg);
> -}
>   #endif

