Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAF041ABF5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 11:32:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3BF16A9;
	Tue, 28 Sep 2021 11:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3BF16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632821578;
	bh=qj+DLbI4+AAKys8rqxaoRlzyaFmuZfBesYRPtGvS3ZQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OSdNNNw+ChObq+J4ripR4rzmDSwmymLqEMjcegvtfvTgYPRhNIpn/GSmqlMfMB5x/
	 yv4vj9xXpt6CIqh8s+dABDLWnXiqnoZYuyI/0BdlIzyJvDX71POwRtq4ynu3aQ+ZFT
	 gLhjgXbmRJcqK4p7/J0R/JcO90H/AIpAeA6H5GYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD08BF80105;
	Tue, 28 Sep 2021 11:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E651CF804AD; Tue, 28 Sep 2021 11:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A437F80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 11:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A437F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ifesNPLC"
Received: by mail-wr1-x42c.google.com with SMTP id g16so56860695wrb.3
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i1b5GK3S6Cy17pdW184aJcDhxHw/MUMkcwtoLp4djwQ=;
 b=ifesNPLCfq7E8NnEnIqeFYMymnvqeQsChFDK69uTlU+yC1JmHHl32Q29WWzHxD6KFD
 FR5p4JuO0/1RwaE1GU8qBJ9RwVqeySUYRYWPtIQhsz9eA9IarPyRo54wifXBTCHdjyk4
 Z1zBLA0Aj0rIt9N8TRIl75TJpygq3Ab0msl/f5I6ASbKaptmieRsG+Y/Va65Zh1Y86hn
 QLIIublU5vii3SKOXt+gQK5445Fvil/U10v6Y0DTmwsEvnPlS9z5U0qOuktUluS9qUe5
 FWfaNvgQJVdSMXqA/FbeOyFVDeURcIuCcUDYMjCtmmSfA3IZgySbCfDtgTu/wnf7T98G
 hjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i1b5GK3S6Cy17pdW184aJcDhxHw/MUMkcwtoLp4djwQ=;
 b=TDj+rKyR9jqew7dKswqpei/CO6cw+HJ9/CM+aj7Gdf+i0CJPNy1BR5hNDPZGiwRbzW
 cuZke6e6MSpcDWEHFFHbi8Rxb4N74K1hDPtQzBq58iH1WBHZWHLn+ga7YIoYFg/wCagj
 IP0fXR0/UUz3oIGdKGhHq49IdEMjOmbXZ5OPM56V7hVqeAR/KIPeYe03jitZEgDaxbPI
 YvEWVRuxXVhK3kYwRKq5AM/GkzOATAVXcv8CjgxIn7YwhPCjxeOviLF01D6WwOYJ6W7Z
 SIoQJGFF5PIq1bKFoMWF0/re0cvh+utcJEZ8pt1o6Ijt9dl9JnXpwpxH/5Vvwl+DOFLh
 EbUA==
X-Gm-Message-State: AOAM532Ucgj+/A2BRueU/RkJP93YCkqf+IgMDl0blGwdQSRBBODyB4Cu
 oh2wQw5S0fyimHOlvK60gfccqQ==
X-Google-Smtp-Source: ABdhPJznh+LcevV0YqWd+oDdKpGGNtycFlgDF0bk1nRZltqjseJAws7467lDcmyMYeMz+RhlH+89HA==
X-Received: by 2002:adf:e94d:: with SMTP id m13mr5384716wrn.28.1632821489011; 
 Tue, 28 Sep 2021 02:31:29 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y7sm16635351wrs.95.2021.09.28.02.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 02:31:28 -0700 (PDT)
Subject: Re: [PATCH v8 14/22] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, bjorn.andersson@linaro.org,
 broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-15-srinivas.kandagatla@linaro.org>
 <d1f69cbc-37f6-dc47-258c-f53450dd558c@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <452d176b-98dc-43ca-7d1a-c233b6a683da@linaro.org>
Date: Tue, 28 Sep 2021 10:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d1f69cbc-37f6-dc47-258c-f53450dd558c@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Thanks Amadeusz for reviewing,

On 28/09/2021 09:00, Amadeusz Sławiński wrote:
> On 9/27/2021 3:55 PM, Srinivas Kandagatla wrote:
>> Add basic helper functions for AudioReach.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/qcom/qdsp6/audioreach.c | 265 ++++++++++++
>>   sound/soc/qcom/qdsp6/audioreach.h | 668 ++++++++++++++++++++++++++++++
>>   2 files changed, 933 insertions(+)
>>   create mode 100644 sound/soc/qcom/qdsp6/audioreach.c
>>   create mode 100644 sound/soc/qcom/qdsp6/audioreach.h
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c 
>> b/sound/soc/qcom/qdsp6/audioreach.c
>> new file mode 100644
>> index 000000000000..34ec4c0d0175
>> --- /dev/null
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -0,0 +1,265 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2020, Linaro Limited
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/apr.h>
>> +#include <dt-bindings/soc/qcom,gpr.h>
>> +#include "audioreach.h"
>> +
>> +/* SubGraph Config */
>> +struct apm_sub_graph_data {
>> +    struct apm_sub_graph_cfg sub_graph_cfg;
>> +    struct apm_prop_data perf_data;
>> +    struct apm_sg_prop_id_perf_mode perf;
>> +    struct apm_prop_data dir_data;
>> +    struct apm_sg_prop_id_direction dir;
>> +    struct apm_prop_data sid_data;
>> +    struct apm_sg_prop_id_scenario_id sid;
>> +
>> +} __packed;
>> +
>> +#define APM_SUB_GRAPH_CFG_NPROP    3
>> +
>> +struct apm_sub_graph_params  {
>> +    struct apm_module_param_data param_data;
>> +    uint32_t num_sub_graphs;
>> +    struct apm_sub_graph_data sg_cfg[];
>> +} __packed;
>> +
>> +#define APM_SUB_GRAPH_PSIZE(n) ALIGN(sizeof(struct 
>> apm_sub_graph_params) + \
>> +                n * sizeof(struct apm_sub_graph_data), 8)
> 
> This looks, like you could use struct_size helper, something like:
> #define APM_SUB_GRAPH_PSIZE(n) ALIGN(struct_size(apm_sub_graph_params, 
> apm_sub_graph_data, n), 8)
> 

struct_size() macro first argument is structure pointer, so above will 
not work as it is.

I agree that we could use struct_size() in some cases, but in this 
particular case we will endup with more local pointer variables that are 
just declared to keep struct_size() macro happy.

IMO, Which will not make code any better than what it is now.

I will revist these and see if it makes sense to use it in other places.

>> +/* container config */
>> +struct apm_container_obj  {
>> +    struct apm_container_cfg container_cfg;
>> +    /* Capability ID list */
>> +    struct apm_prop_data cap_data;
>> +    uint32_t num_capability_id;
>> +    uint32_t capability_id;
>> +
>> +    /* Container graph Position */
>> +    struct apm_prop_data pos_data;
>> +    struct apm_cont_prop_id_graph_pos pos;
>> +
>> +    /* Container Stack size */
>> +    struct apm_prop_data stack_data;
>> +    struct apm_cont_prop_id_stack_size stack;
>> +
>> +    /* Container proc domain id */
>> +    struct apm_prop_data domain_data;
>> +    struct apm_cont_prop_id_domain domain;
>> +} __packed;
>> +
>> +struct apm_container_params  {
>> +    struct apm_module_param_data param_data;
>> +    uint32_t num_containers;
>> +    struct apm_container_obj cont_obj[];
>> +} __packed;
>> +
>> +#define APM_CONTAINER_PSIZE(n) ALIGN(sizeof(struct 
>> apm_container_params) + \
>> +                n * sizeof(struct apm_container_obj), 8)
>> +
> 
> Same here, use struct_size, and same applies for other defines in this 
> file, I won't add comment to all of them ;)
> 
>> +/* Module List config */
>> +struct apm_mod_list_obj {
>> +    /* Modules list cfg */
>> +    uint32_t sub_graph_id;
>> +    uint32_t container_id;
>> +    uint32_t num_modules;
>> +    struct apm_module_obj mod_cfg[];
>> +} __packed;
>> +
>> +struct apm_module_list_params {
>> +    struct apm_module_param_data param_data;
>> +    uint32_t num_modules_list;
>> +    /* Module list config array */
>> +    struct apm_mod_list_obj mod_list_obj[];
>> +} __packed;
>> +
> 
> (...)
> 
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h 
>> b/sound/soc/qcom/qdsp6/audioreach.h
>> new file mode 100644
>> index 000000000000..556443155416
>> --- /dev/null
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -0,0 +1,668 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __AUDIOREACH_H__
>> +#define __AUDIOREACH_H__
>> +#include <linux/types.h>
>> +#include <linux/soc/qcom/apr.h>
>> +#include <sound/soc.h>
>> +
>> +/* Module IDs */
>> +#define MODULE_ID_WR_SHARED_MEM_EP    0x07001000
>> +#define MODULE_ID_RD_SHARED_MEM_EP    0x07001001
>> +#define MODULE_ID_GAIN            0x07001002
>> +#define MODULE_ID_PCM_CNV        0x07001003
>> +#define MODULE_ID_PCM_ENC        0x07001004
>> +#define MODULE_ID_PCM_DEC        0x07001005
>> +#define MODULE_ID_CODEC_DMA_SINK    0x07001023
>> +#define MODULE_ID_CODEC_DMA_SOURCE    0x07001024
>> +#define MODULE_ID_I2S_SINK        0x0700100A
>> +#define MODULE_ID_I2S_SOURCE        0x0700100b
> 
> Small 'b' in hex value, use 'B' for consistency

I agree, will try find such instances and fix them before I send out 
next version.

> 
>> +#define MODULE_ID_DATA_LOGGING        0x0700101A
>> +
>> +#define APM_CMD_GET_SPF_STATE        0x01001021
>> +#define APM_CMD_RSP_GET_SPF_STATE    0x02001007
>> +
>> +#define APM_MODULE_INSTANCE_ID        0x00000001
>> +#define PRM_MODULE_INSTANCE_ID        0x00000002
>> +#define AMDB_MODULE_INSTANCE_ID        0x00000003
>> +#define VCPM_MODULE_INSTANCE_ID        0x00000004
>> +#define AR_MODULE_INSTANCE_ID_START    0x00006000
>> +#define AR_MODULE_INSTANCE_ID_END    0x00007000
>> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_START    0x00007000
>> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_END    0x00008000
>> +#define AR_CONT_INSTANCE_ID_START    0x00005000
>> +#define AR_CONT_INSTANCE_ID_END        0x00006000
>> +#define AR_SG_INSTANCE_ID_START        0x00004000
>> +
>> +#define APM_CMD_GRAPH_OPEN            0x01001000
>> +#define APM_CMD_GRAPH_PREPARE            0x01001001
>> +#define APM_CMD_GRAPH_START            0x01001002
>> +#define APM_CMD_GRAPH_STOP            0x01001003
>> +#define APM_CMD_GRAPH_CLOSE            0x01001004
>> +#define APM_CMD_GRAPH_FLUSH            0x01001005
>> +#define APM_CMD_SET_CFG                0x01001006
>> +#define APM_CMD_GET_CFG                0x01001007
>> +#define APM_CMD_SHARED_MEM_MAP_REGIONS        0x0100100c
> 
> Small 'c' here, use 'C'
> 
>> +#define APM_CMD_SHARED_MEM_UNMAP_REGIONS    0x0100100d
> 
> and 'D' insted of 'd' here.
> 
>> +#define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS    0x02001001
>> +#define APM_CMD_RSP_GET_CFG            0x02001000
>> +#define APM_CMD_CLOSE_ALL            0x01001013
>> +#define APM_CMD_REGISTER_SHARED_CFG        0x0100100A
>> +
>> +#define APM_MEMORY_MAP_SHMEM8_4K_POOL        3
>> +
>> +struct apm_cmd_shared_mem_map_regions {
>> +    uint16_t mem_pool_id;
>> +    uint16_t num_regions;
>> +    uint32_t property_flag;
>> +} __packed;
>> +
>> +struct apm_shared_map_region_payload {
>> +    uint32_t shm_addr_lsw;
>> +    uint32_t shm_addr_msw;
>> +    uint32_t mem_size_bytes;
>> +} __packed;
>> +
>> +struct apm_cmd_shared_mem_unmap_regions {
>> +    uint32_t mem_map_handle;
>> +} __packed;
>> +
>> +struct apm_cmd_rsp_shared_mem_map_regions {
>> +    uint32_t mem_map_handle;
>> +} __packed;
>> +
> 
> (...)
> 
> 
>> +#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER        0x04001003
>> +
>> +struct data_cmd_rd_sh_mem_ep_data_buffer {
>> +    uint32_t buf_addr_lsw;
>> +    uint32_t buf_addr_msw;
>> +    uint32_t mem_map_handle;
>> +    uint32_t buf_size;
>> +};
>> +
>> +#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER        0x05001002
>> +
>> +struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done {
>> +    uint32_t status;
>> +    uint32_t buf_addr_lsw;
>> +    uint32_t buf_addr_msw;
>> +    uint32_t mem_map_handle;
>> +    uint32_t data_size;
>> +    uint32_t offset;
>> +    uint32_t timestamp_lsw;
>> +    uint32_t timestamp_msw;
>> +    uint32_t flags;
>> +    uint32_t num_frames;
>> +};
> 
> Rest of structs is marked with __packed and it seems like it describes 
> communication protocol, so it seems like you missed it here.
> 
These are mostly u32 it did work without packed, but I agree with you on 
missing __packed. Will fix such instances.

--srini

>> +
>> +#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2        0x0400100B
>> +
>> +struct data_cmd_rd_sh_mem_ep_data_buffer_v2 {
>> +    uint32_t buf_addr_lsw;
>> +    uint32_t buf_addr_msw;
>> +    uint32_t mem_map_handle;
>> +    uint32_t buf_size;
>> +    uint32_t md_buf_addr_lsw;
>> +    uint32_t md_buf_addr_msw;
>> +    uint32_t md_mem_map_handle;
>> +    uint32_t md_buf_size;
>> +};
> 
> Same comment as above.
> 
>> +
>> +#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2    0x05001005
>> +
>> +struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 {
>> +    uint32_t status;
>> +    uint32_t buf_addr_lsw;
>> +    uint32_t buf_addr_msw;
>> +    uint32_t mem_map_handle;
>> +    uint32_t data_size;
>> +    uint32_t offset;
>> +    uint32_t timestamp_lsw;
>> +    uint32_t timestamp_msw;
>> +    uint32_t flags;
>> +    uint32_t num_frames;
>> +    uint32_t md_status;
>> +    uint32_t md_buf_addr_lsw;
>> +    uint32_t md_buf_addr_msw;
>> +    uint32_t md_mem_map_handle;
>> +    uint32_t md_size;
>> +} __packed;
>> +
>> +#define PARAM_ID_RD_SH_MEM_CFG                0x08001007
>> +
>> +struct param_id_rd_sh_mem_cfg {
>> +    uint32_t num_frames_per_buffer;
>> +    uint32_t metadata_control_flags;
>> +
>> +} __packed;
>> +
> 
> (...)
