Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E59B7AC
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF0B1668;
	Fri, 23 Aug 2019 22:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF0B1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592201;
	bh=pl2BqLBQ5NxZKtbbmuMYMwrQ1Q8VdOXPywncx31l82A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kiHWV+D78aCiHSJtdUB1vsxJaVetxUz8MFWvO5CCDuSiBrPt/sf0gz16AcSYzVM4W
	 zSxV25NqC9d3Tlk/mAHzMCUJhOGTy+EHsDoYwk6ExScYnZLuzguOYfLbFxFHrN3txB
	 QA3FmPcgAib/2Whd9HYD5/X0YHWKpUZ2s5dOMhDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 623C9F805F8;
	Fri, 23 Aug 2019 22:28:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98D09F805E0; Fri, 23 Aug 2019 22:28:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 792BDF802FB
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792BDF802FB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718154"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:27:58 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-4-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dd4c705a-1d75-b71c-8cd9-eec020b57c52@linux.intel.com>
Date: Fri, 23 Aug 2019 13:32:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-4-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 03/35] ASoC: Intel: Skylake: Add
 HARDWARE_CONFIG IPC request
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


> +	while (offset < bytes) {
> +		tlv = (struct skl_tlv *)(payload + offset);
> +
> +		switch (tlv->type) {
> +		case SKL_HW_CFG_CAVS_VER:
> +			cfg->cavs_version = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_DSP_CORES:
> +			cfg->dsp_cores = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_MEM_PAGE_BYTES:
> +			cfg->mem_page_bytes = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_TOTAL_PHYS_MEM_PAGES:
> +			cfg->total_phys_mem_pages = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_I2S_CAPS:
> +			cfg->i2s_caps.version = tlv->value[0];
> +			size = tlv->value[1];
> +			cfg->i2s_caps.ctrl_count = size;
> +			if (!size)
> +				break;
> +
> +			size *= sizeof(*cfg->i2s_caps.ctrl_base_addr);
> +			cfg->i2s_caps.ctrl_base_addr =
> +				kmemdup(&tlv->value[2], size, GFP_KERNEL);

shouldn't the size be that of the source buffer instead of the destination?

> +			if (!cfg->i2s_caps.ctrl_base_addr) {
> +				ret = -ENOMEM;
> +				goto exit;
> +			}
> +			break;
> +
> +		case SKL_HW_CFG_GATEWAY_COUNT:
> +			cfg->gateway_count = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_HP_EBB_COUNT:
> +			cfg->hp_ebb_count = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_LP_EBB_COUNT:
> +			cfg->lp_ebb_count = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_EBB_SIZE_BYTES:
> +			cfg->ebb_size_bytes = *tlv->value;
> +			break;
> +
> +		case SKL_HW_CFG_GPDMA_CAPS:
> +		case SKL_HW_CFG_UAOL_CAPS:
> +			break;
> +
> +		default:
> +			dev_info(ipc->dev, "Unrecognized hw param: %d\n",
> +				tlv->type);
> +			break;

same feedback, it's usually better to list all values and skip them, and 
fail big if you see something unexpected.

> +		}
> +
> +		offset += sizeof(*tlv) + tlv->length;
> +	}
> +
> +exit:
> +	kfree(payload);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(skl_ipc_hw_cfg_get);
> diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
> index ebc5852e15d0..eefa52f7f97a 100644
> --- a/sound/soc/intel/skylake/skl-sst-ipc.h
> +++ b/sound/soc/intel/skylake/skl-sst-ipc.h
> @@ -77,6 +77,7 @@ enum skl_basefw_runtime_param {
>   	SKL_BASEFW_ASTATE_TABLE = 4,
>   	SKL_BASEFW_DMA_CONTROL = 5,
>   	SKL_BASEFW_FIRMWARE_CONFIG = 7,
> +	SKL_BASEFW_HARDWARE_CONFIG = 8,
>   };
>   
>   enum skl_fw_cfg_params {
> @@ -141,6 +142,50 @@ struct skl_fw_cfg {
>   	u32 power_gating_policy;
>   };
>   
> +enum skl_hw_cfg_params {
> +	SKL_HW_CFG_CAVS_VER,
> +	SKL_HW_CFG_DSP_CORES,
> +	SKL_HW_CFG_MEM_PAGE_BYTES,
> +	SKL_HW_CFG_TOTAL_PHYS_MEM_PAGES,
> +	SKL_HW_CFG_I2S_CAPS,
> +	SKL_HW_CFG_GPDMA_CAPS,
> +	SKL_HW_CFG_GATEWAY_COUNT,
> +	SKL_HW_CFG_HP_EBB_COUNT,
> +	SKL_HW_CFG_LP_EBB_COUNT,
> +	SKL_HW_CFG_EBB_SIZE_BYTES,
> +	SKL_HW_CFG_UAOL_CAPS
> +};
> +
> +enum skl_cavs_version {
> +	SKL_CAVS_VER_1_5 = 0x10005,
> +	SKL_CAVS_VER_1_8 = 0x10008,
> +};
> +
> +enum skl_i2s_version {
> +	SKL_I2S_VER_15_SKYLAKE   = 0x00000,
> +	SKL_I2S_VER_15_BROXTON   = 0x10000,
> +	SKL_I2S_VER_15_BROXTON_P = 0x20000,
> +	SKL_I2S_VER_18_KBL_CNL   = 0x30000,
> +};

The encoding is odd.
Do these values mean anything (e.g. tied to firmware definitions?)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
