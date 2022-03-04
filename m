Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CB4CD927
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:32:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26FCE1EE5;
	Fri,  4 Mar 2022 17:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26FCE1EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646411556;
	bh=eHOa2J8lpeV/3LQ/u/6FfJsF4Ov+jD8J17+Bd4e1as8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OczMb+S1FoIWCl1eujzBfAD5Bdl4t7rvk3ZkkNt5G5LHvA0+ni3SR+QQKOLMdrvLu
	 TJ7b7JhmRZ23vsADsS+a4bbL0mcEOKDWIAcQiCf6JY4CF3JfVyfT7z1ddyAZgTAZ4M
	 5tJUeLAw2iYP4swhLlvEFgj6laUcpCwklM3BL11k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C4D3F800F2;
	Fri,  4 Mar 2022 17:31:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3EF5F800F0; Fri,  4 Mar 2022 17:31:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8DB3F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8DB3F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mEW+pQ5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646411484; x=1677947484;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eHOa2J8lpeV/3LQ/u/6FfJsF4Ov+jD8J17+Bd4e1as8=;
 b=mEW+pQ5+mrN3UrYe99rA3odRIyXrUb8qEnxuTu1yVzDliEvxEf0KhLEp
 5X2tm3xBJqYA0IikMcieVX3+FE7yUj3XPukY5Ra0E6KuY3w1sqjBHy7d/
 6qsI9pGSf9Yjuygfy2c91M2ftBhj2icf/9xiRajnZS/rRyQuHcrAFEwQ4
 s/otcylpT9vtnvUSyVjxAGOiE85QpclMova2nv+D1ccMPTAcg0zuA7z2z
 h+5C/KdvJj/aSie6g9BBQ3mRQBc5IQx+tzIUfRjpkN/TlXt6L0SiVUyR2
 5bU1WCYokaGBmO2AlHPABv+IuIXGs5Z9q1wEYXsrRiVR869fUXmkyqNTK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340439980"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="340439980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:31:19 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="686917012"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:31:14 -0800
Message-ID: <2bc36351e4c14bd4b3d55f26eec2cda1b77e7728.camel@linux.intel.com>
Subject: Re: [PATCH v3 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:31:13 -0800
In-Reply-To: <20220304145755.2844173-11-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-11-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
> Each module may expose a range of runtime parameters. For basefw,
> implement handlers for: FIRMWARE_CONFIG, HARDWARE_CONFIG and
> MODULES_INFO. These are used by driver to dynamically allocate
> resources
> in respect to platform details, reducing number of hardcodes and code
> duplications that would otherwise be needed to be defined within the
> driver code.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/messages.c | 215
> +++++++++++++++++++++++++++++++++
>  sound/soc/intel/avs/messages.h | 179 +++++++++++++++++++++++++++
>  2 files changed, 394 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/messages.c
> b/sound/soc/intel/avs/messages.c
> index f7d00e541323..7a2a7206df4b 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -463,3 +463,218 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool
> enable_pg, bool streaming)
>  
>  	return ret;
>  }
> +
> +int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg
> *cfg)
> +{
> +	struct avs_tlv *tlv;
> +	size_t payload_size;
> +	size_t offset = 0;
> +	u8 *payload;
> +	int ret;
> +
> +	ret = avs_ipc_get_large_config(adev, AVS_BASEFW_MOD_ID,
> AVS_BASEFW_INST_ID,
> +				       AVS_BASEFW_FIRMWARE_CONFIG,
> NULL, 0,
> +				       &payload, &payload_size);
> +	if (ret)
> +		return ret;
> +
> +	while (offset < payload_size) {
> +		tlv = (struct avs_tlv *)(payload + offset);
> +
> +		switch (tlv->type) {
> +		case AVS_FW_CFG_FW_VERSION:
> +			memcpy(&cfg->fw_version, tlv->value,
> +				sizeof(cfg->fw_version));
> +			break;
> +
> +		case AVS_FW_CFG_MEMORY_RECLAIMED:
> +			cfg->memory_reclaimed = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_SLOW_CLOCK_FREQ_HZ:
> +			cfg->slow_clock_freq_hz = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_FAST_CLOCK_FREQ_HZ:
> +			cfg->fast_clock_freq_hz = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_ALH_SUPPORT_LEVEL:
> +			cfg->alh_support = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_IPC_DL_MAILBOX_BYTES:
> +			cfg->ipc_dl_mailbox_bytes = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_IPC_UL_MAILBOX_BYTES:
> +			cfg->ipc_ul_mailbox_bytes = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_TRACE_LOG_BYTES:
> +			cfg->trace_log_bytes = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MAX_PPL_COUNT:
> +			cfg->max_ppl_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MAX_ASTATE_COUNT:
> +			cfg->max_astate_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MAX_MODULE_PIN_COUNT:
> +			cfg->max_module_pin_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MODULES_COUNT:
> +			cfg->modules_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MAX_MOD_INST_COUNT:
> +			cfg->max_mod_inst_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT:
> +			cfg->max_ll_tasks_per_pri_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_LL_PRI_COUNT:
> +			cfg->ll_pri_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MAX_DP_TASKS_COUNT:
> +			cfg->max_dp_tasks_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_MAX_LIBS_COUNT:
> +			cfg->max_libs_count = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_XTAL_FREQ_HZ:
> +			cfg->xtal_freq_hz = *tlv->value;
> +			break;
> +
> +		case AVS_FW_CFG_POWER_GATING_POLICY:
> +			cfg->power_gating_policy = *tlv->value;
> +			break;
> +
> +		/* Known but not useful to us. */
> +		case AVS_FW_CFG_DMA_BUFFER_CONFIG:
> +		case AVS_FW_CFG_SCHEDULER_CONFIG:
> +		case AVS_FW_CFG_CLOCKS_CONFIG:
> +			break;
> +
> +		default:
> +			dev_info(adev->dev, "Unrecognized fw param:
> %d\n",
> +				 tlv->type);
> +			break;
> +		}
> +
> +		offset += sizeof(*tlv) + tlv->length;
> +	}
> +
> +	kfree(payload);
I think it would be easier to understand this kfree if payload was also
allocated in this function in stead of inside the get_large_config().
Thanks,
Ranjani


