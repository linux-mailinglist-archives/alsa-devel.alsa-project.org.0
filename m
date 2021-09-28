Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B760841AA3F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:02:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4892216A5;
	Tue, 28 Sep 2021 10:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4892216A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632816159;
	bh=v4iVU6hFAwDjG8t4+dIu4EQc+Ydy9ENklo/LHbd0iAA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pd7miARF7Om7PvW2jkHW+Y0RxRLwIkXXSqaO1NlYfAppU/7oUuUCtu3TuPwuHWfTI
	 jN7jAsI6iGh+6gEnS5KCTy3+L6fc+n8I1RPfKNeX8zBjZQpKsv1rMg2ZB+hwOZ9l3H
	 e5fPt1TjA59rW55lVUm2rrq8Akj12b+wqYd6rDY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A90E3F80105;
	Tue, 28 Sep 2021 10:01:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EBDBF804AD; Tue, 28 Sep 2021 10:01:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABBF7F80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 10:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABBF7F80161
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="288303949"
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="288303949"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:01:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="561949036"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.65])
 ([10.237.12.65])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:01:07 -0700
Subject: Re: [PATCH v8 14/22] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-15-srinivas.kandagatla@linaro.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <d1f69cbc-37f6-dc47-258c-f53450dd558c@linux.intel.com>
Date: Tue, 28 Sep 2021 10:00:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927135559.738-15-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

On 9/27/2021 3:55 PM, Srinivas Kandagatla wrote:
> Add basic helper functions for AudioReach.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/qcom/qdsp6/audioreach.c | 265 ++++++++++++
>   sound/soc/qcom/qdsp6/audioreach.h | 668 ++++++++++++++++++++++++++++++
>   2 files changed, 933 insertions(+)
>   create mode 100644 sound/soc/qcom/qdsp6/audioreach.c
>   create mode 100644 sound/soc/qcom/qdsp6/audioreach.h
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> new file mode 100644
> index 000000000000..34ec4c0d0175
> --- /dev/null
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -0,0 +1,265 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020, Linaro Limited
> +
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/apr.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
> +#include "audioreach.h"
> +
> +/* SubGraph Config */
> +struct apm_sub_graph_data {
> +	struct apm_sub_graph_cfg sub_graph_cfg;
> +	struct apm_prop_data perf_data;
> +	struct apm_sg_prop_id_perf_mode perf;
> +	struct apm_prop_data dir_data;
> +	struct apm_sg_prop_id_direction dir;
> +	struct apm_prop_data sid_data;
> +	struct apm_sg_prop_id_scenario_id sid;
> +
> +} __packed;
> +
> +#define APM_SUB_GRAPH_CFG_NPROP	3
> +
> +struct apm_sub_graph_params  {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_sub_graphs;
> +	struct apm_sub_graph_data sg_cfg[];
> +} __packed;
> +
> +#define APM_SUB_GRAPH_PSIZE(n) ALIGN(sizeof(struct apm_sub_graph_params) + \
> +				n * sizeof(struct apm_sub_graph_data), 8)

This looks, like you could use struct_size helper, something like:
#define APM_SUB_GRAPH_PSIZE(n) ALIGN(struct_size(apm_sub_graph_params, 
apm_sub_graph_data, n), 8)

> +/* container config */
> +struct apm_container_obj  {
> +	struct apm_container_cfg container_cfg;
> +	/* Capability ID list */
> +	struct apm_prop_data cap_data;
> +	uint32_t num_capability_id;
> +	uint32_t capability_id;
> +
> +	/* Container graph Position */
> +	struct apm_prop_data pos_data;
> +	struct apm_cont_prop_id_graph_pos pos;
> +
> +	/* Container Stack size */
> +	struct apm_prop_data stack_data;
> +	struct apm_cont_prop_id_stack_size stack;
> +
> +	/* Container proc domain id */
> +	struct apm_prop_data domain_data;
> +	struct apm_cont_prop_id_domain domain;
> +} __packed;
> +
> +struct apm_container_params  {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_containers;
> +	struct apm_container_obj cont_obj[];
> +} __packed;
> +
> +#define APM_CONTAINER_PSIZE(n) ALIGN(sizeof(struct apm_container_params) + \
> +				n * sizeof(struct apm_container_obj), 8)
> +

Same here, use struct_size, and same applies for other defines in this 
file, I won't add comment to all of them ;)

> +/* Module List config */
> +struct apm_mod_list_obj {
> +	/* Modules list cfg */
> +	uint32_t sub_graph_id;
> +	uint32_t container_id;
> +	uint32_t num_modules;
> +	struct apm_module_obj mod_cfg[];
> +} __packed;
> +
> +struct apm_module_list_params {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_modules_list;
> +	/* Module list config array */
> +	struct apm_mod_list_obj mod_list_obj[];
> +} __packed;
> +

(...)

> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> new file mode 100644
> index 000000000000..556443155416
> --- /dev/null
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -0,0 +1,668 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __AUDIOREACH_H__
> +#define __AUDIOREACH_H__
> +#include <linux/types.h>
> +#include <linux/soc/qcom/apr.h>
> +#include <sound/soc.h>
> +
> +/* Module IDs */
> +#define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
> +#define MODULE_ID_RD_SHARED_MEM_EP	0x07001001
> +#define MODULE_ID_GAIN			0x07001002
> +#define MODULE_ID_PCM_CNV		0x07001003
> +#define MODULE_ID_PCM_ENC		0x07001004
> +#define MODULE_ID_PCM_DEC		0x07001005
> +#define MODULE_ID_CODEC_DMA_SINK	0x07001023
> +#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
> +#define MODULE_ID_I2S_SINK		0x0700100A
> +#define MODULE_ID_I2S_SOURCE		0x0700100b

Small 'b' in hex value, use 'B' for consistency

> +#define MODULE_ID_DATA_LOGGING		0x0700101A
> +
> +#define APM_CMD_GET_SPF_STATE		0x01001021
> +#define APM_CMD_RSP_GET_SPF_STATE	0x02001007
> +
> +#define APM_MODULE_INSTANCE_ID		0x00000001
> +#define PRM_MODULE_INSTANCE_ID		0x00000002
> +#define AMDB_MODULE_INSTANCE_ID		0x00000003
> +#define VCPM_MODULE_INSTANCE_ID		0x00000004
> +#define AR_MODULE_INSTANCE_ID_START	0x00006000
> +#define AR_MODULE_INSTANCE_ID_END	0x00007000
> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_START	0x00007000
> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_END	0x00008000
> +#define AR_CONT_INSTANCE_ID_START	0x00005000
> +#define AR_CONT_INSTANCE_ID_END		0x00006000
> +#define AR_SG_INSTANCE_ID_START		0x00004000
> +
> +#define APM_CMD_GRAPH_OPEN			0x01001000
> +#define APM_CMD_GRAPH_PREPARE			0x01001001
> +#define APM_CMD_GRAPH_START			0x01001002
> +#define APM_CMD_GRAPH_STOP			0x01001003
> +#define APM_CMD_GRAPH_CLOSE			0x01001004
> +#define APM_CMD_GRAPH_FLUSH			0x01001005
> +#define APM_CMD_SET_CFG				0x01001006
> +#define APM_CMD_GET_CFG				0x01001007
> +#define APM_CMD_SHARED_MEM_MAP_REGIONS		0x0100100c

Small 'c' here, use 'C'

> +#define APM_CMD_SHARED_MEM_UNMAP_REGIONS	0x0100100d

and 'D' insted of 'd' here.

> +#define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS	0x02001001
> +#define APM_CMD_RSP_GET_CFG			0x02001000
> +#define APM_CMD_CLOSE_ALL			0x01001013
> +#define APM_CMD_REGISTER_SHARED_CFG		0x0100100A
> +
> +#define APM_MEMORY_MAP_SHMEM8_4K_POOL		3
> +
> +struct apm_cmd_shared_mem_map_regions {
> +	uint16_t mem_pool_id;
> +	uint16_t num_regions;
> +	uint32_t property_flag;
> +} __packed;
> +
> +struct apm_shared_map_region_payload {
> +	uint32_t shm_addr_lsw;
> +	uint32_t shm_addr_msw;
> +	uint32_t mem_size_bytes;
> +} __packed;
> +
> +struct apm_cmd_shared_mem_unmap_regions {
> +	uint32_t mem_map_handle;
> +} __packed;
> +
> +struct apm_cmd_rsp_shared_mem_map_regions {
> +	uint32_t mem_map_handle;
> +} __packed;
> +

(...)


> +#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER		0x04001003
> +
> +struct data_cmd_rd_sh_mem_ep_data_buffer {
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t buf_size;
> +};
> +
> +#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER		0x05001002
> +
> +struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done {
> +	uint32_t status;
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t data_size;
> +	uint32_t offset;
> +	uint32_t timestamp_lsw;
> +	uint32_t timestamp_msw;
> +	uint32_t flags;
> +	uint32_t num_frames;
> +};

Rest of structs is marked with __packed and it seems like it describes 
communication protocol, so it seems like you missed it here.

> +
> +#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2		0x0400100B
> +
> +struct data_cmd_rd_sh_mem_ep_data_buffer_v2 {
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t buf_size;
> +	uint32_t md_buf_addr_lsw;
> +	uint32_t md_buf_addr_msw;
> +	uint32_t md_mem_map_handle;
> +	uint32_t md_buf_size;
> +};

Same comment as above.

> +
> +#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2	0x05001005
> +
> +struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 {
> +	uint32_t status;
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t data_size;
> +	uint32_t offset;
> +	uint32_t timestamp_lsw;
> +	uint32_t timestamp_msw;
> +	uint32_t flags;
> +	uint32_t num_frames;
> +	uint32_t md_status;
> +	uint32_t md_buf_addr_lsw;
> +	uint32_t md_buf_addr_msw;
> +	uint32_t md_mem_map_handle;
> +	uint32_t md_size;
> +} __packed;
> +
> +#define PARAM_ID_RD_SH_MEM_CFG				0x08001007
> +
> +struct param_id_rd_sh_mem_cfg {
> +	uint32_t num_frames_per_buffer;
> +	uint32_t metadata_control_flags;
> +
> +} __packed;
> +

(...)
