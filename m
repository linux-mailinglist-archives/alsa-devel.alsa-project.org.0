Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1740038B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:38:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ACBA18C3;
	Fri,  3 Sep 2021 18:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ACBA18C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687135;
	bh=qR7iUnfnSXcyM97vDG9BGGSWZd7E1zVjRQKE2D79LDc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSM0kuyXRlMopanbawYsbZwsmcPBTVTbb/OXnD8vtBbplc5le8vvGHPfi6lLK8HuW
	 9wHXMIDL8B3483epqCfBj1J0rpWOMJ6Z34XpCj7vq01wy1AlkIPAt8DlgM1JwnJm6D
	 sJJWZ1yTjY4XUPW8kqDz5Bi9+2+QC4pJ3/vJke5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2656FF80423;
	Fri,  3 Sep 2021 18:38:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09621F80256; Fri,  3 Sep 2021 18:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46AE5F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46AE5F80088
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="206687189"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="206687189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="462453448"
Received: from seangorm-mobl.amr.corp.intel.com (HELO [10.251.136.111])
 ([10.251.136.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:43 -0700
Subject: Re: [PATCH v5 14/21] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-15-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ddb4f36b-8a43-d1e9-0429-78d8eefc9474@linux.intel.com>
Date: Fri, 3 Sep 2021 09:23:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903112032.25834-15-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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




> +struct apm_sub_graph_params  {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_sub_graphs;
> +	struct apm_sub_graph_data sg_cfg[0];

I thought the use of zero-length arrays [0] was deprecated in favor of
flexible arrays []?

> +} __packed;
> +
> +#define APM_SUB_GRAPH_PSIZE(n) ALIGN(sizeof(struct apm_sub_graph_params) + \
> +				n * sizeof(struct apm_sub_graph_data), 8)
> +/* container config */
> +struct apm_container_obj  {
> +	struct apm_container_cfg container_cfg;
> +	/* Capability ID list */
> +	struct apm_prop_data cap_data;
> +	uint32_t num_capablity_id;

typo is still there.

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
> +	struct apm_container_obj cont_obj[0];

[]

> +} __packed;
> +
> +#define APM_CONTAINER_PSIZE(n) ALIGN(sizeof(struct apm_container_params) + \
> +				n * sizeof(struct apm_container_obj), 8)
> +
> +/* Module List config */
> +struct apm_mod_list_obj {
> +	/* Modules list cfg */
> +	uint32_t sub_graph_id;
> +	uint32_t container_id;
> +	uint32_t num_modules;
> +	struct apm_module_obj mod_cfg[0];

[]

> +} __packed;
> +
> +struct apm_module_list_params {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_modules_list;
> +	/* Module list config array */
> +	struct apm_mod_list_obj mod_list_obj[0];

[]

> +
> +} __packed;
> +
> +#define APM_MOD_LIST_OBJ_PSIZE(m) (sizeof(struct apm_mod_list_obj) + \
> +				    m * sizeof(struct apm_module_obj))
> +
> +/* n modules list m mod per list */
> +#define APM_MOD_LIST_PSIZE(n, m) ALIGN(sizeof(struct apm_module_list_params) + \
> +				n * (sizeof(struct apm_mod_list_obj) + \
> +				m * sizeof(struct apm_module_obj)), 8)
> +
> +/* Module Properties */
> +struct apm_mod_prop_obj {
> +	u32 instance_id;
> +	u32 num_props;
> +	struct apm_prop_data prop_data_1;
> +	struct apm_module_prop_id_port_info prop_id_port;
> +} __packed;
> +
> +struct apm_prop_list_params {
> +	struct apm_module_param_data param_data;
> +	u32 num_modules_prop_cfg;
> +	struct apm_mod_prop_obj mod_prop_obj[0];

[]

> +
> +} __packed;
> +
> +#define APM_MOD_PROP_PSIZE(n) ALIGN(sizeof(struct apm_prop_list_params) + \
> +			       n * sizeof(struct apm_mod_prop_obj), 8)
> +
> +/* Module Connections */
> +struct apm_mod_conn_list_params {
> +	struct apm_module_param_data param_data;
> +	u32 num_connections;
> +	struct apm_module_conn_obj conn_obj[0];

[]

> +
> +} __packed;

[...]

> +//Shared memory module

/* Shared memory module */ ?

> +#define DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER	0x04001000
> +#define WR_SH_MEM_EP_TIMESTAMP_VALID_FLAG	BIT(31)
> +#define WR_SH_MEM_EP_LAST_BUFFER_FLAG		BIT(30)
> +#define WR_SH_MEM_EP_TS_CONTINUE_FLAG		BIT(29)
> +#define WR_SH_MEM_EP_EOF_FLAG			BIT(4)
> +struct apm_data_cmd_wr_sh_mem_ep_data_buffer {
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t buf_size;
> +	uint32_t timestamp_lsw;
> +	uint32_t timestamp_msw;
> +	uint32_t flags;
> +} __packed;
> +
> +#define DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2	0x0400100A

newline after define?

> +struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 {
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t buf_size;
> +	uint32_t timestamp_lsw;
> +	uint32_t timestamp_msw;
> +	uint32_t flags;
> +	uint32_t md_addr_lsw;
> +	uint32_t md_addr_msw;
> +	uint32_t md_map_handle;
> +	uint32_t md_buf_size;
> +} __packed;
> +
> +#define DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE	0x05001000

newline?

> +struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done {
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t status;
> +
> +} __packed;
> +
> +#define DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2	0x05001004

newline?

> +struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 {
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t status;
> +	uint32_t md_buf_addr_lsw;
> +	uint32_t md_buf_addr_msw;
> +	uint32_t md_mem_map_handle;
> +	uint32_t md_status;
> +} __packed;
> +
> +#define PARAM_ID_MEDIA_FORMAT	0x0800100C
> +#define DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT		0x04001001

newline?

> +struct apm_media_format {
> +	uint32_t data_format;
> +	uint32_t fmt_id;
> +	uint32_t payload_size;
> +} __packed;
> +
> +#define DATA_CMD_WR_SH_MEM_EP_EOS			0x04001002
> +#define WR_SH_MEM_EP_EOS_POLICY_LAST	1
> +#define WR_SH_MEM_EP_EOS_POLICY_EACH	2
> +
> +struct data_cmd_wr_sh_mem_ep_eos {
> +	uint32_t policy;
> +
> +} __packed;
> +
> +#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER		0x04001003

newline?

> +struct data_cmd_rd_sh_mem_ep_data_buffer {
> +	uint32_t buf_addr_lsw;
> +	uint32_t buf_addr_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t buf_size;
> +};
> +
> +#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER		0x05001002

newline?

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
> +
> +#define DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2		0x0400100B

newline ?

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
> +
> +#define DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2		0x05001005

newline?

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
> +#define PARAM_ID_RD_SH_MEM_CFG			0x08001007

newline?

> +struct param_id_rd_sh_mem_cfg {
> +	uint32_t num_frames_per_buffer;
> +	uint32_t metadata_control_flags;
> +
> +} __packed;

newline?

> +#define DATA_CMD_WR_SH_MEM_EP_EOS_RENDERED		0x05001001

newline?

> +struct data_cmd_wr_sh_mem_ep_eos_rendered {
> +	uint32_t module_instance_id;
> +	uint32_t render_status;
> +} __packed;
> +
> +#define MODULE_ID_WR_SHARED_MEM_EP			0x07001000
> +
> +struct apm_cmd_header {
> +	uint32_t payload_address_lsw;
> +	uint32_t payload_address_msw;
> +	uint32_t mem_map_handle;
> +	uint32_t payload_size;
> +} __packed;
> +
> +#define APM_CMD_HDR_SIZE sizeof(struct apm_cmd_header)
> +
> +struct apm_module_param_data  {
> +	uint32_t module_instance_id;
> +	uint32_t param_id;
> +	uint32_t param_size;
> +	uint32_t error_code;
> +} __packed;
> +
> +#define APM_MODULE_PARAM_DATA_SIZE	sizeof(struct apm_module_param_data)

newline?

> +struct apm_module_param_shared_data  {
> +	uint32_t param_id;
> +	uint32_t param_size;
> +} __packed;
> +
> +struct apm_prop_data {
> +	uint32_t prop_id;
> +	uint32_t prop_size;
> +} __packed;
> +
> +/* Sub-Graph Properties */
> +#define APM_PARAM_ID_SUB_GRAPH_CONFIG	0x08001001
> +
> +struct apm_param_id_sub_graph_cfg {
> +	uint32_t num_sub_graphs;
> +} __packed;
> +
> +struct apm_sub_graph_cfg {
> +	uint32_t sub_graph_id;
> +	uint32_t num_sub_graph_prop;
> +} __packed;
> +
> +#define APM_SUB_GRAPH_PROP_ID_PERF_MODE		0x0800100E
> +
> +struct apm_sg_prop_id_perf_mode {
> +	uint32_t perf_mode;
> +} __packed;
> +
> +#define APM_SG_PROP_ID_PERF_MODE_SIZE	4
> +
> +#define APM_SUB_GRAPH_PROP_ID_DIRECTION	0x0800100F
> +
> +struct apm_sg_prop_id_direction {
> +	uint32_t direction;
> +} __packed;
> +
> +#define APM_SG_PROP_ID_DIR_SIZE		4
> +
> +#define APM_SUB_GRAPH_PROP_ID_SCENARIO_ID	0x08001010
> +#define APM_SUB_GRAPH_SID_AUDIO_PLAYBACK	0x1
> +#define APM_SUB_GRAPH_SID_AUDIO_RECORD		0x2
> +#define APM_SUB_GRAPH_SID_AUDIO_VOICE_CALL	0x3
> +
> +struct apm_sg_prop_id_scenario_id {
> +	uint32_t scenario_id;
> +} __packed;
> +
> +#define APM_SG_PROP_ID_SID_SIZE	4
> +//container api
> +#define APM_PARAM_ID_CONTAINER_CONFIG	0x08001000

newline and /* */

> +struct apm_param_id_container_cfg {
> +	uint32_t num_containers;
> +} __packed;
> +
> +struct apm_container_cfg {
> +	uint32_t container_id;
> +	uint32_t num_prop;
> +} __packed;
> +
> +struct apm_cont_capablity  {
> +	uint32_t capability_id;
> +} __packed;
> +
> +#define APM_CONTAINER_PROP_ID_CAPABILITY_LIST	0x08001011
> +#define APM_CONTAINER_PROP_ID_CAPABILITY_SIZE	8
> +
> +#define APM_PROP_ID_INVALID			0x0
> +#define APM_CONTAINER_CAP_ID_PP			0x1
> +#define APM_CONTAINER_CAP_ID_PP			0x1
> +
> +struct apm_cont_prop_id_cap_list  {
> +	uint32_t num_capablity_id;
> +} __packed;
> +
> +#define APM_CONTAINER_PROP_ID_GRAPH_POS		0x08001012
> +
> +struct apm_cont_prop_id_graph_pos  {
> +	uint32_t graph_pos;
> +} __packed;
> +
> +#define APM_CONTAINER_PROP_ID_STACK_SIZE	0x08001013

newline?

> +struct apm_cont_prop_id_stack_size  {
> +	uint32_t stack_size;
> +} __packed;
> +> +#define APM_CONTAINER_PROP_ID_PROC_DOMAIN	0x08001014

newline?

> +struct apm_cont_prop_id_domain  {
> +	uint32_t proc_domain;
> +} __packed;
> +
> +#define CONFIG_I2S_WS_SRC_EXTERNAL                          0x0
> +#define CONFIG_I2S_WS_SRC_INTERNAL                          0x1
> +
> +#define PARAM_ID_I2S_INTF_CFG	0x08001019
> +struct param_id_i2s_intf_cfg {
> +	uint32_t lpaif_type;
> +	uint32_t intf_idx;
> +	uint16_t sd_line_idx;
> +	uint16_t ws_src;
> +} __packed;
> +
> +#define I2S_INTF_TYPE_PRIMARY		0
> +#define I2S_INTF_TYPE_SECOINDARY	1
> +#define I2S_INTF_TYPE_TERTINARY		2
> +#define I2S_INTF_TYPE_QUATERNARY	3
> +#define I2S_INTF_TYPE_QUINARY		4
> +#define I2S_SD0				1
> +#define I2S_SD1				2
> +#define I2S_SD2				3
> +#define I2S_SD3				4
> +
> +#define PORT_ID_I2S_INPUT		2
> +#define PORT_ID_I2S_OUPUT		1
> +#define I2S_STACK_SIZE			2048
> +
> +#define PARAM_ID_HW_EP_MF_CFG		0x08001017
> +struct param_id_hw_ep_mf {
> +	uint32_t sample_rate;
> +	uint16_t bit_width;
> +	uint16_t num_channels;
> +	uint32_t data_format;
> +} __packed;
> +
> +#define PARAM_ID_HW_EP_FRAME_SIZE_FACTOR		0x08001018
> +
> +struct param_id_fram_size_factor {
> +	uint32_t frame_size_factor;
> +} __packed;
> +
> +#define APM_CONTAINER_PROP_ID_PARENT_CONTAINER_ID	0x080010CB

newline?

> +struct apm_cont_prop_id_parent_container  {
> +	uint32_t parent_container_id;
> +} __packed;
> +
> +#define APM_CONTAINER_PROP_ID_HEAP_ID			0x08001174
> +#define APM_CONT_HEAP_DEFAULT				0x1
> +#define APM_CONT_HEAP_LOW_POWER				0x2

newline?

> +struct apm_cont_prop_id_headp_id  {
> +	uint32_t heap_id;
> +} __packed;
> +
> +struct apm_modules_list {
> +	uint32_t sub_graph_id;
> +	uint32_t container_id;
> +	uint32_t num_modules;
> +} __packed;
> +
> +struct apm_module_obj {
> +	uint32_t module_id;
> +	uint32_t instance_id;
> +} __packed;
> +
> +#define APM_MODULE_PROP_ID_PORT_INFO		0x08001015
> +#define APM_MODULE_PROP_ID_PORT_INFO_SZ		8

newline?

> +struct apm_module_prop_id_port_info {
> +	uint32_t max_ip_port;
> +	uint32_t max_op_port;
> +} __packed;
> +
> +#define DATA_LOGGING_MAX_INPUT_PORTS		0x1
> +#define DATA_LOGGING_MAX_OUTPUT_PORTS		0x1
> +#define DATA_LOGGING_STACK_SIZE			2048
> +#define PARAM_ID_DATA_LOGGING_CONFIG		0x08001031

newline?

> +struct data_logging_config {
> +	uint32_t log_code;
> +	uint32_t log_tap_point_id;
> +	uint32_t mode;
> +} __packed;
> +
> +#define PARAM_ID_MFC_OUTPUT_MEDIA_FORMAT	0x08001024

newline?

> +struct param_id_mfc_media_format {
> +	uint32_t sample_rate;
> +	uint16_t bit_width;
> +	uint16_t num_channels;
> +	uint16_t channel_mapping[];
> +} __packed;
> +
> +struct media_format {
> +	uint32_t data_format;
> +	uint32_t fmt_id;
> +	uint32_t payload_size;
> +} __packed;
> +
> +struct payload_media_fmt_pcm {
> +	uint32_t sample_rate;
> +	uint16_t bit_width;
> +	uint16_t alignment;
> +	uint16_t bits_per_sample;
> +	uint16_t q_factor;
> +	uint16_t endianness;
> +	uint16_t num_channels;
> +	uint8_t channel_mapping[];
> +} __packed;
> +
> +#define PARAM_ID_CODEC_DMA_INTF_CFG		0x08001063

newline?

> +struct param_id_codec_dma_intf_cfg {
> +	/* 1 - RXTX
> +	 * 2 - WSA
> +	 * 3 - VA
> +	 * 4 - AXI
> +	 */
> +	uint32_t lpaif_type;
> +	/*
> +	 *  RX0 | TX0 = 1
> +	 *  RX1 | TX1 = 2
> +	 *  RX2 | TX2 = 3... so on
> +	 */
> +	uint32_t intf_index;
> +	uint32_t active_channels_mask;
> +} __packed;
> +
> +struct audio_hw_clk_cfg {
> +	uint32_t clock_id;
> +	uint32_t clock_freq;
> +	uint32_t clock_attri;
> +	uint32_t clock_root;
> +} __packed;
> +
> +#define PARAM_ID_HW_EP_POWER_MODE_CFG	0x8001176
> +#define POWER_MODE_0	0 /* default */
> +#define POWER_MODE_1	1 /* XO Shutdown allowed */
> +#define POWER_MODE_2	2 /* XO Shutdown not allowed */

newline?

Likely prefix needed as well, 'POWER_MODE' is not exactly
unique/conflict free.

> +struct param_id_hw_ep_power_mode_cfg {
> +	uint32_t power_mode;
> +} __packed;
> +
> +#define PARAM_ID_HW_EP_DMA_DATA_ALIGN	0x08001233
> +#define DMA_DATA_ALIGN_MSB	0
> +#define DMA_DATA_ALIGN_LSB	1
> +
> +#define PCM_MAX_NUM_CHANNEL  8

newline and prefix?

> +struct param_id_hw_ep_dma_data_align {
> +	uint32_t dma_data_align;
> +} __packed;
> +
> +/* Graph */
> +struct audioreach_connection {
> +	/* Connections */
> +	uint32_t src_mod_inst_id;
> +	uint32_t src_mod_op_port_id;
> +	uint32_t dst_mod_inst_id;
> +	uint32_t dst_mod_ip_port_id;
> +	struct list_head node;
> +};
> +
> +struct audioreach_graph_info {
> +	int id;
> +	uint32_t num_sub_graphs;
> +	struct list_head sg_list;
> +	struct list_head connection_list;
> +	spinlock_t sg_list_lock;
> +};
> +
> +struct audioreach_sub_graph {
> +	uint32_t sub_graph_id;
> +	uint32_t perf_mode;
> +	uint32_t direction;
> +	uint32_t scenario_id;
> +	struct list_head node;
> +
> +	struct audioreach_graph_info *info;
> +	uint32_t num_containers;
> +	struct list_head container_list;
> +};
> +
> +struct audioreach_container {
> +	uint32_t container_id;
> +	uint32_t capability_id;
> +	uint32_t graph_pos;
> +	uint32_t stack_size;
> +	uint32_t proc_domain;
> +	struct list_head node;
> +
> +	uint32_t num_modules;
> +	struct list_head modules_list;
> +	struct audioreach_sub_graph *sub_graph;
> +};
> +
> +struct audioreach_module {
> +	uint32_t module_id;
> +	uint32_t instance_id;
> +
> +	uint32_t max_ip_port;
> +	uint32_t max_op_port;
> +
> +	uint32_t in_port;
> +	uint32_t out_port;
> +
> +	/* Connections */
> +	uint32_t src_mod_inst_id;
> +	uint32_t src_mod_op_port_id;
> +	uint32_t dst_mod_inst_id;
> +	uint32_t dst_mod_ip_port_id;
> +
> +	/* Format specifics */
> +	uint32_t ch_fmt;
> +	uint32_t rate;
> +	uint32_t bit_depth;
> +
> +	/* I2S module */
> +	uint32_t hw_interface_idx;
> +	uint32_t sd_line_idx;
> +	uint32_t ws_src;
> +	uint32_t frame_size_factor;
> +	uint32_t data_format;
> +	uint32_t hw_interface_type;
> +
> +	/* PCM module specific */
> +	uint32_t interleave_type;
> +
> +	/* GAIN/Vol Control Module */
> +	uint16_t gain;

newline for consistency?
> +	/* Logging */
> +	uint32_t log_code;
> +	uint32_t log_tap_point_id;
> +	uint32_t mode;

probably not related to logging, comment missing?

> +	struct list_head node;
> +	struct audioreach_container *container;
> +	struct snd_soc_dapm_widget *widget;
> +};
> +
> +/* Packet Allocation routines */
> +void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
> +				    token);
> +void *audioreach_alloc_cmd_pkt(int payload_size, uint32_t opcode,
> +			       uint32_t token, uint32_t src_port,
> +			       uint32_t dest_port);
> +void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
> +				uint32_t src_port);
> +void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
> +			   uint32_t token, uint32_t src_port,
> +			   uint32_t dest_port);
> +#endif /* __AUDIOREACH_H__ */
> 
