Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14B36FC4EA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 13:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623F0110A;
	Tue,  9 May 2023 13:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623F0110A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683631446;
	bh=p3igK2F0Obvq0sQvCxSIWvuf6hrjBZ2YClhXsMhtxBU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C8CmVoP3VR5oHaKjjHS1qAW3ksfPrmBEaMzJzQOuVBu5+Vjclxf7BQPBqaShm4pXw
	 Annv1yKGnMkisxX+g7WR9uuCG84u7YOBi82iE7nmTo9tfLrXqnRIN7PROfzMi5O/2P
	 AZ4LYaDfVn6yxxXDiqhOm4i71+VsnSQiZfJr/mW4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA09F80549;
	Tue,  9 May 2023 13:22:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B946F8032D; Tue,  9 May 2023 13:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A5D8F8032D
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 13:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A5D8F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tIx4GmIH
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f417ea5252so22559985e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 04:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683631328; x=1686223328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al++n0DVfg3VdylUq3oOFq4+Oko5w2ns601WYiCwn8E=;
        b=tIx4GmIHPAHHGRTvBQMxKMGkFfNbae8iWcw32mkYCUP40T8TV2YknHNbEPZM/tx0q0
         Q8t4FZXHNjhTOCX65JaSqlQbdAlhB5vhcp6/tqrK5U367hb+fbnJNiR7gO7tqMRVCiQl
         Mu9Wu3bdRA0PLbf2nIMuxMLQX6mXW0J48R8m5EKn2+D2hNeC9Zph8OPKeCuvuOm2CxvY
         KzK3/2KfiZMn9j7rS72BF0+yNVyg4UMSvUolgxbf8jJXy9tm0OVlP2/rYoYGlw63/sIq
         srLe8crGYdwBTppX2yX3io+ba4FgGI/O9lpXWoKkUa4ogayyPxQVPYscvGVPUylseTSE
         +0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683631328; x=1686223328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=al++n0DVfg3VdylUq3oOFq4+Oko5w2ns601WYiCwn8E=;
        b=UuCMG2Gj5AzZjGfuEIFZ1p2+KQl+0SSR5OEOn3z/+wdtffSXGs5guuX9WJNV0vAXXb
         WHwHVi2lTIWQ2ljrYMhW3Vpze6OcMmmHnHrdVdxlrtg/jNbmnWWHFW22oo7Tz5QZX9mc
         Wf4qHG+dejQteCbmYh2l5KfAnxj4V3V6voa+g4ta6SDFo6ebXyEVcPm5Yo6Qj9pZH1gY
         wRpeTIp2w4kGRx14WFnleuVSwwQVQdHiXYGBuUkPmB1tShyXA0Ds7RAmnYEOaCG6Cohp
         GnkIUqnw/x542Ue+AlJnSIeEGbavq+ZJYjXQsmpaFUlIjLKRMFqh8gvrRyQxAIMBEJQF
         3PKw==
X-Gm-Message-State: AC+VfDzolOu//kjqulS7CMr9P3pfg62xF+CaH6f+852GBgqrsqGnLf6j
	IYvXpPCGx36qvAzv4a5qI+ibNA==
X-Google-Smtp-Source: 
 ACHHUZ4UVI7qziagntEO81orsO+cBpTUPBOgjtCI3vWHWbePwq1iQnLHJM+kRkeq6BdUdC3Le7DaGQ==
X-Received: by 2002:a1c:f313:0:b0:3f3:468c:a780 with SMTP id
 q19-20020a1cf313000000b003f3468ca780mr9354601wmq.4.1683631327924;
        Tue, 09 May 2023 04:22:07 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c294200b003f17eded97bsm19531072wmd.19.2023.05.09.04.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:22:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/4] ASoC: qcom: audioreach: add support for DISPLAY PORT SINK
 module
Date: Tue,  9 May 2023 12:22:00 +0100
Message-Id: <20230509112202.21471-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
References: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PHAVZ3XE4R625MSKPGGYETKW4ZZSFBQD
X-Message-ID-Hash: PHAVZ3XE4R625MSKPGGYETKW4ZZSFBQD
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PHAVZ3XE4R625MSKPGGYETKW4ZZSFBQD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for DISPLAY PORT SINK module and associated configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 75 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 12 +++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 1e0c918eb576..8d9410dcbd45 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -196,6 +196,12 @@ struct apm_codec_dma_module_intf_cfg {
 
 #define APM_CDMA_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_codec_dma_module_intf_cfg), 8)
 
+struct apm_display_port_module_intf_cfg {
+	struct apm_module_param_data param_data;
+	struct param_id_display_port_intf_cfg cfg;
+} __packed;
+#define APM_DP_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_display_port_module_intf_cfg), 8)
+
 static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
 				    uint32_t src_port, uint32_t dest_port, bool has_cmd_hdr)
 {
@@ -582,6 +588,72 @@ int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pk
 }
 EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);
 
+static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
+						    struct audioreach_module *module,
+						    struct audioreach_module_config *cfg)
+{
+	struct apm_display_port_module_intf_cfg *intf_cfg;
+	struct apm_module_frame_size_factor_cfg *fs_cfg;
+	struct apm_module_param_data *param_data;
+	struct apm_module_hw_ep_mf_cfg *hw_cfg;
+	int ic_sz, ep_sz, fs_sz, dl_sz;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	ic_sz = APM_DP_INTF_CFG_PSIZE;
+	ep_sz = APM_HW_EP_CFG_PSIZE;
+	fs_sz = APM_FS_CFG_PSIZE;
+	dl_sz = 0;
+
+	payload_size = ic_sz + ep_sz + fs_sz + dl_sz;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	hw_cfg = p;
+	param_data = &hw_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
+	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	hw_cfg->mf.sample_rate = cfg->sample_rate;
+	hw_cfg->mf.bit_width = cfg->bit_width;
+	hw_cfg->mf.num_channels = cfg->num_channels;
+	hw_cfg->mf.data_format = module->data_format;
+	p += ep_sz;
+
+	fs_cfg = p;
+	param_data = &fs_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_FRAME_SIZE_FACTOR;
+	param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
+	fs_cfg->frame_size_factor = 1;
+	p += fs_sz;
+
+	intf_cfg = p;
+	param_data = &intf_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_DISPLAY_PORT_INTF_CFG;
+	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	intf_cfg->cfg.channel_allocation = cfg->channel_allocation;
+	intf_cfg->cfg.mst_idx = 0;
+	intf_cfg->cfg.dptx_idx = cfg->dp_idx;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 /* LPASS Codec DMA port Module Media Format Setup */
 static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 						 struct audioreach_module *module,
@@ -1122,6 +1194,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_PCM_CNV:
 		rc = audioreach_pcm_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_DISPLAY_PORT_SINK:
+		rc = audioreach_display_port_set_media_format(graph, module, cfg);
+		break;
 	case MODULE_ID_I2S_SOURCE:
 	case MODULE_ID_I2S_SINK:
 		rc = audioreach_i2s_set_media_format(graph, module, cfg);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 1d1d47d47d40..3ebb81cd7cb0 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -22,6 +22,7 @@ struct q6apm_graph;
 #define MODULE_ID_I2S_SINK		0x0700100A
 #define MODULE_ID_I2S_SOURCE		0x0700100B
 #define MODULE_ID_DATA_LOGGING		0x0700101A
+#define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -444,6 +445,15 @@ struct param_id_i2s_intf_cfg {
 #define PORT_ID_I2S_OUPUT		1
 #define I2S_STACK_SIZE			2048
 
+#define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
+
+struct param_id_display_port_intf_cfg {
+	uint32_t channel_allocation;
+	/* Multi-Steam Transport index */
+	uint32_t mst_idx;
+	uint32_t dptx_idx;
+} __packed;
+
 #define PARAM_ID_HW_EP_MF_CFG			0x08001017
 struct param_id_hw_ep_mf {
 	uint32_t sample_rate;
@@ -702,6 +712,8 @@ struct audioreach_module_config {
 	u16	data_format;
 	u16	num_channels;
 	u16	active_channels_mask;
+	u16	dp_idx;
+	u32	channel_allocation;
 	u32	sd_line_mask;
 	int	fmt;
 	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
-- 
2.21.0

