Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7069B7AD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:30:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CEB1669;
	Fri, 23 Aug 2019 22:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CEB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592247;
	bh=ahYOBGjGqEIXnOjW4BDt1Ht0lIc47oxq2ZQmDmT1/Fc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/3mi2EUcOAdVyHxu86QUoSJo0FERpcGNQKtqcrbLoI1hzISFiWCfGZIyTTyu3Lz5
	 F2U9TtHGvR5aMQbQBMwGY5QyUXdzmw51mMH8iaFGp89ZcujAwHzDy9Pw4tfdVhozlu
	 FNmWYw4Rn8UzuNZVdBUDsiYkogPuvua7loc4QkI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42908F805FF;
	Fri, 23 Aug 2019 22:28:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF264F805E1; Fri, 23 Aug 2019 22:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66998F80147
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66998F80147
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718151"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:27:57 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3173be35-0721-a36d-d328-b8e2ad3b5008@linux.intel.com>
Date: Fri, 23 Aug 2019 13:24:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-3-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 02/35] ASoC: Intel: Skylake: Add
 FIRMWARE_CONFIG IPC request
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



On 8/22/19 2:03 PM, Cezary Rojewski wrote:
> Implement interface for retrieving firmware configuration. Skylake
> driver will use this data instead of hardcoded values in updates to
> come.
> 
> Most params are currently unused. In time driver dependency on fw config
> will increase, and with it, more parsing will be unveiled.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/skylake/skl-sst-ipc.c | 122 ++++++++++++++++++++++++++
>   sound/soc/intel/skylake/skl-sst-ipc.h |  72 +++++++++++++++
>   sound/soc/intel/skylake/skl.h         |   1 +
>   3 files changed, 195 insertions(+)
> 
> diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
> index 667cdddc289f..e9e11ec4c97b 100644
> --- a/sound/soc/intel/skylake/skl-sst-ipc.c
> +++ b/sound/soc/intel/skylake/skl-sst-ipc.c
> @@ -11,6 +11,7 @@
>   #include "skl.h"
>   #include "skl-sst-dsp.h"
>   #include "skl-sst-ipc.h"
> +#include "skl-topology.h"
>   #include "sound/hdaudio_ext.h"
>   
>   
> @@ -1067,3 +1068,124 @@ int skl_ipc_set_d0ix(struct sst_generic_ipc *ipc, struct skl_ipc_d0ix_msg *msg)
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(skl_ipc_set_d0ix);
> +
> +int skl_ipc_fw_cfg_get(struct sst_generic_ipc *ipc, struct skl_fw_cfg *cfg)
> +{
> +	struct skl_ipc_large_config_msg msg = {0};
> +	struct skl_tlv *tlv;
> +	size_t bytes = 0, offset = 0;
> +	u8 *payload = NULL;
> +	int ret;
> +
> +	msg.module_id = 0;
> +	msg.instance_id = 0;
> +	msg.large_param_id = SKL_BASEFW_FIRMWARE_CONFIG;
> +
> +	ret = skl_ipc_get_large_config(ipc, &msg, (u32 **)&payload, &bytes);
> +	if (ret)
> +		goto exit;
> +
> +	while (offset < bytes) {
> +		tlv = (struct skl_tlv *)(payload + offset);
> +
> +		switch (tlv->type) {
> +		case SKL_FW_CFG_FW_VERSION:
> +			memcpy(&cfg->fw_version, tlv->value,
> +				sizeof(cfg->fw_version));
> +			break;
> +
> +		case SKL_FW_CFG_MEMORY_RECLAIMED:
> +			cfg->memory_reclaimed = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_SLOW_CLOCK_FREQ_HZ:
> +			cfg->slow_clock_freq_hz = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_FAST_CLOCK_FREQ_HZ:
> +			cfg->fast_clock_freq_hz = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_ALH_SUPPORT_LEVEL:
> +			cfg->alh_support = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_IPC_DL_MAILBOX_BYTES:
> +			cfg->ipc_dl_mailbox_bytes = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_IPC_UL_MAILBOX_BYTES:
> +			cfg->ipc_ul_mailbox_bytes = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_TRACE_LOG_BYTES:
> +			cfg->trace_log_bytes = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MAX_PPL_COUNT:
> +			cfg->max_ppl_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MAX_ASTATE_COUNT:
> +			cfg->max_astate_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MAX_MODULE_PIN_COUNT:
> +			cfg->max_module_pin_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MODULES_COUNT:
> +			cfg->modules_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MAX_MOD_INST_COUNT:
> +			cfg->max_mod_inst_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT:
> +			cfg->max_ll_tasks_per_pri_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_LL_PRI_COUNT:
> +			cfg->ll_pri_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MAX_DP_TASKS_COUNT:
> +			cfg->max_dp_tasks_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_MAX_LIBS_COUNT:
> +			cfg->max_libs_count = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_XTAL_FREQ_HZ:
> +			cfg->xtal_freq_hz = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_UAOL_SUPPORT:
> +			cfg->uaol_support = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_POWER_GATING_POLICY:
> +			cfg->power_gating_policy = *tlv->value;
> +			break;
> +
> +		case SKL_FW_CFG_DMA_BUFFER_CONFIG:
> +		case SKL_FW_CFG_SCHEDULER_CONFIG:
> +		case SKL_FW_CFG_CLOCKS_CONFIG:
> +			break;
> +
> +		default:
> +			dev_info(ipc->dev, "Unrecognized fw param: %d\n",
> +				tlv->type);
> +			break;

Isn't this an error?
If there are other possible values, why not list them and skip them, as 
done above?

> +		}
> +
> +		offset += sizeof(*tlv) + tlv->length;
> +	}
> +
> +exit:
> +	kfree(payload);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(skl_ipc_fw_cfg_get);

> +enum skl_alh_support_level {
> +	ALH_NO_SUPPORT = 0x00000,
> +	ALH_CAVS_1_8_CNL = 0x10000,
> +};

Support for ALH hasn't changed even past 1.8, and references to CNL are 
probably not needed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
