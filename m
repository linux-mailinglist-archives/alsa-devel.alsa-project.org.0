Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9232939E08E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:33:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AF6A16A1;
	Mon,  7 Jun 2021 17:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AF6A16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623079999;
	bh=s2kv9qp4VGAlego2ZnWZhZM7XgocwejXfYQr45RuGt4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EO6Vh2IeuinlsKjSqwM1j1sf5Oy3fTP05GL8UwcjAIjtfnYhJ0OvJlh3gt8S0oFCi
	 ppJzYxOh1hmQkE24Ba0yKN0KbC+HF12JJT7ODR4N6F47uyI2Q4Vf3mXucDMMFl3W0C
	 uZ9/2piBGyZr9BAVaS5+yZV1wX1S6zdN/brKs+fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57372F804D8;
	Mon,  7 Jun 2021 17:30:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87409F804CC; Mon,  7 Jun 2021 17:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4DDAF80276
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4DDAF80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GVksAbM1"
Received: by mail-wm1-x32b.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so13039670wmk.1
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yi3BA8AEtRquN4AxA68Y8dqvYXCW3HraCXyu5FP/3nA=;
 b=GVksAbM1Zam1EHykNP2pOkRk+SiAyjayEQchPML3+QXC4eTKCKYXzK21TJj4NBRI0q
 0+CLXZslvV009W3+8RdvuHutLVK5Hw9gfF3Kvt52e+S/B+6xtYm8+W86d/P+PqOLEN9J
 WuCEi0H/u9lMd2WUoSD1NYHfHQ1O38VbMr1yVfsZiZsZMMUakrgI0QqNlVt1OxnBkmAD
 ENxgGk82fqLydpHgjO5DJlI1GcxW2hk+7owBRrpOMhQC9mzyD7FX0NNgGuj9gwJgb23J
 PmgC5NgRY2ElUkm7LOldaBD26G46ZIxTu1W+DIVCq5AHYamPvH1oLdW3/b7KwXYsAFmh
 AR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yi3BA8AEtRquN4AxA68Y8dqvYXCW3HraCXyu5FP/3nA=;
 b=MM0Ir6rYmS8ALcATgDhMYL0hSVB/1ZeHqEHDgvDCCpc0hxg5l7+ECFUDqXMJhXAqMX
 azaBb2YnLynCIY+Ebc2gOWwqOnnXPvAfu2c/kJmugz++zius3vFaI6N2J2/aA2nTniN0
 cVRDrKWqmXyunsijBVWI6N0J+Y8PLv4LXK4aZcoaQAKEQnFqRUWsV5aynpW6FpXQwSjz
 F1GlCdPSMv28/vz/XTMZVhWvkP5hjQefj5200NVQI7M6wLUDPAWGU3aZ/QGLjd5+jq6G
 dPMd8OojQWNqlYm6HhhpHhDh9H9qYW/1XUcgDbMFhjZe4zpL1bR4CSoj6vrLh5lVo+uG
 Z2dQ==
X-Gm-Message-State: AOAM530QBOx99e/LiVWJTwK7qKFPBIMIHWpvmK2Yix98mbelJkMNLIaa
 eoT8RPK3nUsc2e+JTzeE61DaFA==
X-Google-Smtp-Source: ABdhPJw+OImsArKzFt3p37KLoh6Ov7zQDy17Gc+doO886EFvimQeJMDWe7bscRLPJ2FIUDD7tbl4Vw==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr17394675wmi.132.1623079747621; 
 Mon, 07 Jun 2021 08:29:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:29:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 06/13] ASoC: qcom: audioreach: add module configuration
 command helpers
Date: Mon,  7 Jun 2021 16:28:29 +0100
Message-Id: <20210607152836.17154-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Audioreach module configuration helpers, which will be used by the q6apm-dai driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/audioreach/audioreach.c | 551 +++++++++++++++++++++++++
 sound/soc/qcom/audioreach/audioreach.h |  16 +
 sound/soc/qcom/audioreach/q6apm.c      | 265 ++++++++++++
 3 files changed, 832 insertions(+)

diff --git a/sound/soc/qcom/audioreach/audioreach.c b/sound/soc/qcom/audioreach/audioreach.c
index 7291adb37d49..eecea02f93bd 100644
--- a/sound/soc/qcom/audioreach/audioreach.c
+++ b/sound/soc/qcom/audioreach/audioreach.c
@@ -529,3 +529,554 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	return pkt;
 }
 
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
+					   struct gpr_pkt *pkt,
+					   uint32_t rsp_opcode)
+{
+
+	struct device *dev = graph->dev;
+	struct gpr_hdr *hdr = &pkt->hdr;
+	int rc;
+
+	mutex_lock(&graph->cmd_lock);
+	graph->result.opcode = 0;
+	graph->result.status = 0;
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+	if (rc < 0)
+		goto err;
+
+	if (rsp_opcode)
+		rc = wait_event_timeout(graph->cmd_wait,
+					(graph->result.opcode == hdr->opcode) ||
+					(graph->result.opcode == rsp_opcode),
+					5 * HZ);
+	else
+		rc = wait_event_timeout(graph->cmd_wait,
+					(graph->result.opcode == hdr->opcode),
+					5 * HZ);
+
+	if (!rc) {
+		dev_err(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
+		rc = -ETIMEDOUT;
+	} else if (graph->result.status > 0) {
+		dev_err(dev, "DSP returned error[%x] %x\n", hdr->opcode,
+			graph->result.status);
+		rc = -EINVAL;
+	} else {
+		dev_err(dev, "DSP returned [%x]\n", graph->result.status);
+		rc = 0;
+	}
+
+err:
+	mutex_unlock(&graph->cmd_lock);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);
+
+static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
+				     struct audioreach_module *module,
+				     int direction, uint32_t rate,
+				     uint32_t num_channels,
+				     u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				     uint16_t bits_per_sample)
+{
+	struct apm_module_param_data *param_data;
+	struct apm_codec_dma_module_intf_cfg *intf_cfg;
+	struct apm_module_hw_ep_mf_cfg *hw_cfg;
+	struct apm_module_frame_size_factor_cfg *fs_cfg;
+	struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
+	int ic_sz, ep_sz, fs_sz, pm_sz, dl_sz;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	ic_sz = APM_CDMA_INTF_CFG_PSIZE;
+	ep_sz = APM_HW_EP_CFG_PSIZE;
+	fs_sz = APM_FS_CFG_PSIZE;
+	pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
+	dl_sz = 0;
+
+	payload_size = ic_sz + ep_sz + fs_sz + pm_sz + dl_sz;
+
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	hw_cfg = p;
+	param_data = &hw_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
+	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	hw_cfg->mf.sample_rate = rate;
+	hw_cfg->mf.bit_width = bits_per_sample;
+	hw_cfg->mf.num_channels = num_channels;
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
+	param_data->param_id = PARAM_ID_CODEC_DMA_INTF_CFG;
+	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
+	intf_cfg->cfg.intf_index = module->hw_interface_idx;
+	intf_cfg->cfg.active_channels_mask = (1 << num_channels) - 1;
+	p += ic_sz;
+
+	pm_cfg = p;
+	param_data = &pm_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_POWER_MODE_CFG;
+	param_data->param_size = pm_sz - APM_MODULE_PARAM_DATA_SIZE;
+	pm_cfg->power_mode.power_mode = 0;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
+				     struct audioreach_module *module,
+				     int direction, uint32_t rate,
+				     uint32_t num_channels,
+				     u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				     uint16_t bits_per_sample)
+{
+	struct apm_module_frame_size_factor_cfg *fs_cfg;
+	struct apm_module_param_data *param_data;
+	struct apm_i2s_module_intf_cfg *intf_cfg;
+	struct apm_module_hw_ep_mf_cfg *hw_cfg;
+	int ic_sz, ep_sz, fs_sz;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	ic_sz = APM_I2S_INTF_CFG_PSIZE;
+	ep_sz = APM_HW_EP_CFG_PSIZE;
+	fs_sz = APM_FS_CFG_PSIZE;
+
+	payload_size = ic_sz + ep_sz + fs_sz;
+
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+	intf_cfg = p;
+
+	param_data = &intf_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
+	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
+	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
+	intf_cfg->cfg.ws_src = module->ws_src;
+
+	p += ic_sz;
+	hw_cfg = p;
+	param_data = &hw_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
+	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	hw_cfg->mf.sample_rate = rate;
+	hw_cfg->mf.bit_width = bits_per_sample;
+	hw_cfg->mf.num_channels = num_channels;
+	hw_cfg->mf.data_format = module->data_format;
+
+	p += ep_sz;
+	fs_cfg = p;
+	param_data = &fs_cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_HW_EP_FRAME_SIZE_FACTOR;
+	param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
+	fs_cfg->frame_size_factor = 1;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
+					 struct audioreach_module *module)
+{
+	struct apm_module_param_data *param_data;
+	struct data_logging_config *cfg;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_DATA_LOGGING_CONFIG;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	cfg = p;
+	cfg->log_code = module->log_code;
+	cfg->log_tap_point_id = module->log_tap_point_id;
+	cfg->mode = module->mode;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
+				     struct audioreach_module *module,
+				     int direction, uint32_t rate,
+				     uint32_t num_channels,
+				     u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				     uint16_t bits_per_sample)
+{
+	struct apm_pcm_module_media_fmt_cmd *cfg;
+	struct apm_module_param_data *param_data;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
+
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+	cfg = p;
+
+	param_data = &cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_PCM_OUTPUT_FORMAT_CFG;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	cfg->header.data_format = DATA_FORMAT_FIXED_POINT;
+	cfg->header.fmt_id = MEDIA_FMT_ID_PCM;
+	cfg->header.payload_size = APM_PCM_OUT_FMT_CFG_PSIZE(num_channels);
+
+	cfg->media_cfg.alignment = PCM_LSB_ALIGNED;
+	cfg->media_cfg.bit_width = bits_per_sample;
+	cfg->media_cfg.endianness = PCM_LITTLE_ENDIAN;
+	cfg->media_cfg.interleaved = module->interleave_type;
+	cfg->media_cfg.num_channels = num_channels;
+	cfg->media_cfg.q_factor = bits_per_sample - 1;
+	cfg->media_cfg.bits_per_sample = bits_per_sample;
+
+	if (num_channels == 1) {
+		cfg->media_cfg.channel_mapping[0] =  PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		cfg->media_cfg.channel_mapping[0] =  PCM_CHANNEL_L;
+		cfg->media_cfg.channel_mapping[1] =  PCM_CHANNEL_R;
+	} else {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+	}
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
+				       struct audioreach_module *module,
+				       int direction, uint32_t rate,
+				       uint32_t num_channels,
+				       u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				       uint16_t bits_per_sample)
+{
+	struct apm_module_param_data *param_data;
+	struct payload_media_fmt_pcm *cfg;
+	struct media_format *header;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	if (num_channels < 0 || num_channels > 2)
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+
+	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
+
+	p = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
+				     graph->port->id, module->instance_id);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_MEDIA_FORMAT;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+
+	header = p;
+	header->data_format = DATA_FORMAT_FIXED_POINT;
+	header->fmt_id = MEDIA_FMT_ID_PCM;
+	header->payload_size = payload_size - sizeof(*header);
+
+	p = p + sizeof(*header);
+	cfg = p;
+	cfg->sample_rate = rate;
+	cfg->bit_width = bits_per_sample;
+	cfg->alignment = PCM_LSB_ALIGNED;
+	cfg->bits_per_sample = bits_per_sample;
+	cfg->q_factor = bits_per_sample - 1;
+	cfg->endianness = PCM_LITTLE_ENDIAN;
+	cfg->num_channels = num_channels;
+
+	if (num_channels == 1) {
+		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+		cfg->channel_mapping[1] =  PCM_CHANNEL_R;
+	} else {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+	}
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_gain_set(struct q6apm_graph *graph,
+			 struct audioreach_module *module)
+{
+	struct apm_module_param_data *param_data;
+	struct apm_gain_module_cfg *cfg;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	payload_size = APM_GAIN_CFG_PSIZE;
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+	cfg = p;
+
+	param_data = &cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = APM_PARAM_ID_GAIN;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	cfg->gain_cfg.gain = module->gain;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+int audioreach_set_media_format(struct q6apm_graph *graph,
+				struct audioreach_module *module,
+				int direction, uint32_t rate,
+				uint32_t channels,
+				u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				uint16_t bits_per_sample)
+{
+	int rc;
+
+	switch (module->module_id) {
+	case MODULE_ID_DATA_LOGGING:
+		rc = audioreach_logging_set_media_format(graph, module);
+		break;
+	case MODULE_ID_PCM_DEC:
+	case MODULE_ID_PCM_ENC:
+	case MODULE_ID_PCM_CNV:
+		rc = audioreach_pcm_set_media_format(graph, module,
+						      direction, rate,
+						      channels, channel_map,
+						      bits_per_sample);
+		break;
+	case MODULE_ID_I2S_SINK:
+		rc = audioreach_i2s_set_media_format(graph, module,
+						      direction, rate,
+						      channels, channel_map,
+						      bits_per_sample);
+		break;
+	case MODULE_ID_WR_SHARED_MEM_EP:
+		rc = audioreach_shmem_set_media_format(graph, module,
+						      direction, rate,
+						      channels, channel_map,
+						      bits_per_sample);
+		break;
+	case MODULE_ID_GAIN:
+		rc = audioreach_gain_set(graph, module);
+		break;
+	case MODULE_ID_CODEC_DMA_SINK:
+	case MODULE_ID_CODEC_DMA_SOURCE:
+		rc = audioreach_codec_dma_set_media_format(graph, module,
+						      direction, rate,
+						      channels, channel_map,
+						      bits_per_sample);
+		break;
+	default:
+		rc = 0;
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_set_media_format);
+
+void audioreach_graph_free_buf(struct q6apm_graph *graph)
+{
+	struct audioreach_graph_data *port;
+	unsigned long flags;
+
+	spin_lock_irqsave(&graph->lock, flags);
+	port = &graph->rx_data;
+	port->num_periods = 0;
+	kfree(port->buf);
+	port->buf = NULL;
+
+	port = &graph->tx_data;
+	port->num_periods = 0;
+	kfree(port->buf);
+	port->buf = NULL;
+	spin_unlock_irqrestore(&graph->lock, flags);
+}
+EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
+
+int audioreach_map_memory_regions(struct q6apm_graph *graph,
+				  unsigned int dir, size_t period_sz,
+				  unsigned int periods,
+				  bool is_contiguous)
+{
+	struct apm_shared_map_region_payload *mregions;
+	struct apm_cmd_shared_mem_map_regions *cmd;
+	uint32_t num_regions, buf_sz, payload_size;
+	struct audioreach_graph_data *data;
+	struct audio_buffer *ab;
+	unsigned long flags;
+	struct gpr_pkt *pkt;
+	void *p;
+	int rc, i;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	if (is_contiguous) {
+		num_regions = 1;
+		buf_sz = period_sz * periods;
+	} else {
+		buf_sz = period_sz;
+		num_regions = periods;
+	}
+
+	/* DSP expects size should be aligned to 4K */
+	buf_sz = ALIGN(buf_sz, 4096);
+
+	payload_size = sizeof(*cmd) + (sizeof(*mregions) * num_regions);
+
+	p = audioreach_alloc_apm_pkt(payload_size,
+				      APM_CMD_SHARED_MEM_MAP_REGIONS, dir,
+				      graph->port->id);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE;
+	cmd = p;
+	cmd->mem_pool_id = APM_MEMORY_MAP_SHMEM8_4K_POOL;
+	cmd->num_regions = num_regions;
+
+	cmd->property_flag = 0x0;
+
+	mregions = p + sizeof(*cmd);
+
+	spin_lock_irqsave(&graph->lock, flags);
+
+	for (i = 0; i < num_regions; i++) {
+		ab = &data->buf[i];
+		mregions->shm_addr_lsw = lower_32_bits(ab->phys);
+		mregions->shm_addr_msw = upper_32_bits(ab->phys);
+		mregions->mem_size_bytes = buf_sz;
+		++mregions;
+	}
+	spin_unlock_irqrestore(&graph->lock, flags);
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt,
+				     APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
+
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_map_memory_regions);
+
+int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
+{
+	struct data_cmd_wr_sh_mem_ep_eos *eos;
+	struct gpr_pkt *pkt;
+	int rc = 0, iid;
+	void *p;
+
+	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	p = audioreach_alloc_cmd_pkt(sizeof(*eos),
+				      DATA_CMD_WR_SH_MEM_EP_EOS,
+				      0,
+				      graph->port->id, iid);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	eos = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	eos->policy = WR_SH_MEM_EP_EOS_POLICY_LAST;
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_shared_memory_send_eos);
diff --git a/sound/soc/qcom/audioreach/audioreach.h b/sound/soc/qcom/audioreach/audioreach.h
index e5736fdda66b..07423369cc84 100644
--- a/sound/soc/qcom/audioreach/audioreach.h
+++ b/sound/soc/qcom/audioreach/audioreach.h
@@ -627,4 +627,20 @@ void *audioreach_alloc_pkt(int pkt_size, uint32_t opcode, uint32_t token,
 void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 				 struct list_head *sg_list,
 				  int graph_id);
+/* Module specific */
+void audioreach_graph_free_buf(struct q6apm_graph *graph);
+int audioreach_map_memory_regions(struct q6apm_graph *graph,
+				  unsigned int dir, size_t period_sz,
+				  unsigned int periods,
+				  bool is_contiguous);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
+					   struct gpr_pkt *pkt,
+					   uint32_t rsp_opcode);
+int audioreach_set_media_format(struct q6apm_graph *graph,
+				struct audioreach_module *module,
+				int direction, uint32_t rate,
+				uint32_t channels,
+				u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				uint16_t bits_per_sample);
+int audioreach_shared_memory_send_eos(struct q6apm_graph *graph);
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/audioreach/q6apm.c b/sound/soc/qcom/audioreach/q6apm.c
index d0deb69114b0..6a98c114ea7a 100644
--- a/sound/soc/qcom/audioreach/q6apm.c
+++ b/sound/soc/qcom/audioreach/q6apm.c
@@ -309,6 +309,172 @@ int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid,
 	return 0;
 }
 
+int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
+				 int direction, uint32_t rate,
+				 uint32_t channels,
+				 u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				 uint16_t bits_per_sample)
+{
+	struct audioreach_module *module;
+
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		module = q6apm_find_module_by_mid(graph,
+						  MODULE_ID_RD_SHARED_MEM_EP);
+	else
+		module = q6apm_find_module_by_mid(graph,
+						  MODULE_ID_WR_SHARED_MEM_EP);
+
+	if (!module)
+		return -ENODEV;
+
+	audioreach_set_media_format(graph, module, direction, rate,
+				     channels, channel_map,
+				     bits_per_sample);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
+
+int q6apm_map_memory_regions(struct q6apm_graph *graph,
+			     unsigned int dir, phys_addr_t phys,
+			     size_t period_sz, unsigned int periods)
+{
+	struct audioreach_graph_data *data;
+	struct audio_buffer *buf;
+	unsigned long flags;
+	int cnt;
+	int rc;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	spin_lock_irqsave(&graph->lock, flags);
+
+	if (data->buf) {
+		dev_err(graph->dev, "Buffer already allocated\n");
+		spin_unlock_irqrestore(&graph->lock, flags);
+		return 0;
+	}
+
+	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_ATOMIC);
+	if (!buf) {
+		spin_unlock_irqrestore(&graph->lock, flags);
+		return -ENOMEM;
+	}
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	data->buf = buf;
+
+	buf[0].phys = phys;
+	buf[0].size = period_sz;
+
+	for (cnt = 1; cnt < periods; cnt++) {
+		if (period_sz > 0) {
+			buf[cnt].phys = buf[0].phys + (cnt * period_sz);
+			buf[cnt].size = period_sz;
+		}
+	}
+	data->num_periods = periods;
+
+	spin_unlock_irqrestore(&graph->lock, flags);
+
+	rc = audioreach_map_memory_regions(graph, dir, period_sz,
+					      periods, 1);
+	if (rc < 0) {
+		dev_err(graph->dev, "Memory_map_regions failed\n");
+		audioreach_graph_free_buf(graph);
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6apm_map_memory_regions);
+
+int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
+			       unsigned int dir)
+{
+	struct audioreach_graph_data *data;
+	struct apm_cmd_shared_mem_unmap_regions *cmd = NULL;
+	struct gpr_pkt *pkt;
+	void *p;
+	int rc;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	if (!data->mem_map_handle) {
+		return 0;
+	}
+
+	p = audioreach_alloc_apm_pkt(sizeof(*cmd),
+				      APM_CMD_SHARED_MEM_UNMAP_REGIONS, dir,
+				      graph->port->id);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	cmd = p + GPR_HDR_SIZE;
+	cmd->mem_map_handle = data->mem_map_handle;
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
+	kfree(pkt);
+
+	audioreach_graph_free_buf(graph);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6apm_unmap_memory_regions);
+
+int q6apm_graph_media_format_pcm(struct q6apm_graph *graph,
+				 int direction, uint32_t rate,
+				 uint32_t channels,
+				 u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				 uint16_t bits_per_sample)
+{
+	struct audioreach_graph_info *info = graph->info;
+	struct audioreach_sub_graph *sgs;
+	struct audioreach_container *container;
+	struct audioreach_module *module;
+
+	list_for_each_entry(sgs, &info->sg_list, node) {
+		list_for_each_entry(container, &sgs->container_list, node) {
+			list_for_each_entry(module, &container->modules_list, node) {
+				if ((MODULE_ID_WR_SHARED_MEM_EP == module->module_id) ||
+					(MODULE_ID_WR_SHARED_MEM_EP == module->module_id))
+					continue;
+
+				audioreach_set_media_format(graph, module, direction, rate,
+							     channels, channel_map,
+							     bits_per_sample);
+			}
+		}
+	}
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_media_format_pcm);
+
+static int q6apm_graph_get_tx_shmem_module_iid(struct q6apm_graph *graph)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, MODULE_ID_RD_SHARED_MEM_EP);
+	if (!module)
+		return -ENODEV;
+
+	return module->instance_id;
+
+}
+
 int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
 {
 	struct audioreach_module *module;
@@ -322,6 +488,105 @@ int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_get_rx_shmem_module_iid);
 
+int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
+		      uint32_t lsw_ts, uint32_t wflags)
+{
+	struct gpr_pkt *pkt;
+	void *p;
+	int rc, payload_size, iid;
+	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write;
+	struct audio_buffer *ab;
+	unsigned long flags;
+
+	payload_size = sizeof(*write);
+
+	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	p = audioreach_alloc_pkt(payload_size,
+				      DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
+				      graph->rx_data.dsp_buf,
+				      graph->port->id, iid);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE;
+	write = p;
+
+	spin_lock_irqsave(&graph->lock, flags);
+	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
+
+	write->buf_addr_lsw = lower_32_bits(ab->phys);
+	write->buf_addr_msw = upper_32_bits(ab->phys);
+	write->buf_size = len;
+	write->timestamp_lsw = lsw_ts;
+	write->timestamp_msw = msw_ts;
+	write->mem_map_handle = graph->rx_data.mem_map_handle;
+
+	//FIXME use other flags
+	if (wflags == NO_TIMESTAMP)
+		write->flags = 0;
+	else
+		write->flags = 0x80000000;
+
+	graph->rx_data.dsp_buf++;
+
+	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
+		graph->rx_data.dsp_buf = 0;
+
+	spin_unlock_irqrestore(&graph->lock, flags);
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6apm_write_async);
+
+int q6apm_read(struct q6apm_graph *graph)
+{
+	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read;
+	struct audioreach_graph_data *port;
+	struct audio_buffer *ab;
+	struct gpr_pkt *pkt;
+	unsigned long flags;
+	int rc = 0, iid;
+	void *p;
+
+	iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+	p = audioreach_alloc_pkt(sizeof(*read),
+				      DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
+				      graph->tx_data.dsp_buf,
+				      graph->port->id, iid);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	read = p + GPR_HDR_SIZE;
+
+	spin_lock_irqsave(&graph->lock, flags);
+	port = &graph->tx_data;
+	ab = &port->buf[port->dsp_buf];
+
+	read->buf_addr_lsw = lower_32_bits(ab->phys);
+	read->buf_addr_msw = upper_32_bits(ab->phys);
+	read->mem_map_handle = port->mem_map_handle;
+	read->buf_size = ab->size;
+
+	port->dsp_buf++;
+
+	if (port->dsp_buf >= port->num_periods)
+		port->dsp_buf = 0;
+
+	spin_unlock_irqrestore(&graph->lock, flags);
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6apm_read);
+
 static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
 {
 	struct q6apm_graph *graph = priv;
-- 
2.21.0

