Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE6439D7B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6861616DE;
	Mon, 25 Oct 2021 19:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6861616DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635182610;
	bh=3xE3NKPZhLLTNsmjeimZUCJdTH2/1cInxYRINHXJzxs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hLFrOu6iyJnGIItWKapQ87sJ7k6QIQ/uADDXoxhH9A8e5r8p+83sx3nsX766N+ZA+
	 jA5JiUwGlIOVdVR1CxPOy+BypTbVClrRW//TEltwkhRfwLLv8bP+hziLtpNNudk0lW
	 VVGrKjWY/cq1HX84DZrrn5VVYe8mUHVoi7AHwDhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DDDBF8055B;
	Mon, 25 Oct 2021 19:18:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E10EF80542; Mon, 25 Oct 2021 19:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 303B9F804EC
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 19:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 303B9F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="U/x7ctCd"
Received: by mail-wr1-x434.google.com with SMTP id z14so12976953wrg.6
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lFdwgKfjRHyo51r5BjLTa6C7ic6byNCtEqpD8xuIDiU=;
 b=U/x7ctCdnw7o6p4sXshoGxh58wzM6z9QAwFAz64n1F4rmdC8kB2ymNohtDOhGfY1YD
 TEb+91tP1HQ7DUqUF0+rTe7KSGmTVc5yqm5w2A2BE26BAY3+0BcFULrnUTeOtdLvTQS5
 ufrQqmmXCJ/K9j+ZI9NmlDTzYb6uo2JIJZ6q3kDg63cFUljoFRrHC9fh0mNH5KwN4gtQ
 6No1EviTt30Gx9CGY2conS+QVc1py5gBWzEQ4jAs7O7EgfOvtaxqwcnHE054Zin0EsiC
 6zBmWFQ4KjCdpXDUvUqP8kVXEawKgqRyKSFO21LQ5WB0BKCONpBuWzJsgxj+pprxm7go
 WfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lFdwgKfjRHyo51r5BjLTa6C7ic6byNCtEqpD8xuIDiU=;
 b=VM6I4TEp9wWyfuxJS1McGQzUwY//lScq90sf0LQJM1KNLaOGnT9hjU76QFL58CL/9X
 iZB7uKbH3F9vd1OEbzoOhQcLfPYN+YJOB13iQoHfQvnCNVsdUSDwIZdt3VUOwj5GuLub
 y1qSYbu9A4fASr/QYXjBXn0E7PktYVytL9NXjB0C+Er5zcbA9DdkAYVOlRjnQMAr1EHh
 AMEiuJEonUIdkVQoYmQ/RfmTa4yoDCnlSqmZBDF/HvTVhzLkh4UI1SSM2uzosc/7SHuG
 CN+t5h4zALTI9jC50PXFPlucWqnhjOVYpIZbJhTAoRfpPHm0RPQnfckrIRDDB6kic3KP
 7dZQ==
X-Gm-Message-State: AOAM530Hg8Rpwyf301nd5sKM4GD5Trax6NS8TrUqbS2QIgstwtE68upW
 M9LnofbmbXsVBDuykxCehNFuKg==
X-Google-Smtp-Source: ABdhPJyLskoZqZGwZ9PulqddlfQq1gUSvW0DI2XkfOob0dzw+0I9WxCT3OcbTQgFyuviA1/BboCdbA==
X-Received: by 2002:adf:a1cc:: with SMTP id v12mr25228805wrv.48.1635182242692; 
 Mon, 25 Oct 2021 10:17:22 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r11sm5181012wrt.42.2021.10.25.10.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:17:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v10 11/17] ASoC: qdsp6: audioreach: add module configuration
 command helpers
Date: Mon, 25 Oct 2021 18:16:43 +0100
Message-Id: <20211025171649.17730-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
References: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Audioreach module configuration helpers, which will be used by
the q6apm-dai driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 570 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  29 ++
 sound/soc/qcom/qdsp6/q6apm.c      | 226 ++++++++++++
 3 files changed, 825 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 63a0e6c9ac14..98c0efa1d0fe 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -4,6 +4,10 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include "q6apm.h"
 #include "audioreach.h"
@@ -558,3 +562,569 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct list_head *sg_list, i
 	return pkt;
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
+
+int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
+			     struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
+			     gpr_port_t *port, wait_queue_head_t *cmd_wait,
+			     struct gpr_pkt *pkt, uint32_t rsp_opcode)
+{
+
+	struct gpr_hdr *hdr = &pkt->hdr;
+	int rc;
+
+	mutex_lock(cmd_lock);
+	result->opcode = 0;
+	result->status = 0;
+
+	if (port)
+		rc = gpr_send_port_pkt(port, pkt);
+	else if (gdev)
+		rc = gpr_send_pkt(gdev, pkt);
+	else
+		rc = -EINVAL;
+
+	if (rc < 0)
+		goto err;
+
+	if (rsp_opcode)
+		rc = wait_event_timeout(*cmd_wait, (result->opcode == hdr->opcode) ||
+					(result->opcode == rsp_opcode),	5 * HZ);
+	else
+		rc = wait_event_timeout(*cmd_wait, (result->opcode == hdr->opcode), 5 * HZ);
+
+	if (!rc) {
+		dev_err(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
+		rc = -ETIMEDOUT;
+	} else if (result->status > 0) {
+		dev_err(dev, "DSP returned error[%x] %x\n", hdr->opcode, result->status);
+		rc = -EINVAL;
+	} else {
+		/* DSP successfully finished the command */
+		rc = 0;
+	}
+
+err:
+	mutex_unlock(cmd_lock);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_send_cmd_sync);
+
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+				   uint32_t rsp_opcode)
+{
+
+	return audioreach_send_cmd_sync(graph->dev, NULL,  &graph->result, &graph->lock,
+					graph->port, &graph->cmd_wait, pkt, rsp_opcode);
+}
+EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);
+
+/* LPASS Codec DMA port Module Media Format Setup */
+static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
+						 struct audioreach_module *module,
+						 struct audioreach_module_config *cfg)
+{
+	struct apm_codec_dma_module_intf_cfg *intf_cfg;
+	struct apm_module_frame_size_factor_cfg *fs_cfg;
+	struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
+	struct apm_module_param_data *param_data;
+	struct apm_module_hw_ep_mf_cfg *hw_cfg;
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
+	param_data->param_id = PARAM_ID_CODEC_DMA_INTF_CFG;
+	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
+
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
+	intf_cfg->cfg.intf_index = module->hw_interface_idx;
+	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
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
+					   struct audioreach_module *module,
+					   struct audioreach_module_config *cfg)
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
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
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
+
+	switch (cfg->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
+		break;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		/* CPU is slave */
+		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_EXTERNAL;
+		break;
+	default:
+		break;
+	}
+
+	p += ic_sz;
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
+					       struct audioreach_module *module)
+{
+	struct apm_module_param_data *param_data;
+	struct data_logging_config *cfg;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
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
+	cfg->mode = module->log_mode;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
+					   struct audioreach_module *module,
+					   struct audioreach_module_config *mcfg)
+{
+	struct payload_pcm_output_format_cfg *media_cfg;
+	uint32_t num_channels = mcfg->num_channels;
+	struct apm_pcm_module_media_fmt_cmd *cfg;
+	struct apm_module_param_data *param_data;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+
+	if (num_channels > 2) {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+		return -EINVAL;
+	}
+
+	payload_size = APM_PCM_MODULE_FMT_CMD_PSIZE(num_channels);
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	cfg = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = &cfg->param_data;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_PCM_OUTPUT_FORMAT_CFG;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	cfg->header.data_format = DATA_FORMAT_FIXED_POINT;
+	cfg->header.fmt_id = MEDIA_FMT_ID_PCM;
+	cfg->header.payload_size = APM_PCM_OUT_FMT_CFG_PSIZE(media_cfg, num_channels);
+
+	media_cfg = &cfg->media_cfg;
+	media_cfg->alignment = PCM_LSB_ALIGNED;
+	media_cfg->bit_width = mcfg->bit_width;
+	media_cfg->endianness = PCM_LITTLE_ENDIAN;
+	media_cfg->interleaved = module->interleave_type;
+	media_cfg->num_channels = mcfg->num_channels;
+	media_cfg->q_factor = mcfg->bit_width - 1;
+	media_cfg->bits_per_sample = mcfg->bit_width;
+
+	if (num_channels == 1) {
+		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		media_cfg->channel_mapping[0] = PCM_CHANNEL_L;
+		media_cfg->channel_mapping[1] = PCM_CHANNEL_R;
+
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
+					     struct audioreach_module *module,
+					     struct audioreach_module_config *mcfg)
+{
+	uint32_t num_channels = mcfg->num_channels;
+	struct apm_module_param_data *param_data;
+	struct payload_media_fmt_pcm *cfg;
+	struct media_format *header;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	if (num_channels > 2) {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+		return -EINVAL;
+	}
+
+	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
+
+	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
+				     graph->port->id, module->instance_id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
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
+	cfg->sample_rate = mcfg->sample_rate;
+	cfg->bit_width = mcfg->bit_width;
+	cfg->alignment = PCM_LSB_ALIGNED;
+	cfg->bits_per_sample = mcfg->bit_width;
+	cfg->q_factor = mcfg->bit_width - 1;
+	cfg->endianness = PCM_LITTLE_ENDIAN;
+	cfg->num_channels = mcfg->num_channels;
+
+	if (mcfg->num_channels == 1) {
+		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+		cfg->channel_mapping[1] =  PCM_CHANNEL_R;
+	}
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module *module, int vol)
+{
+	struct param_id_vol_ctrl_master_gain *cfg;
+	struct apm_module_param_data *param_data;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_VOL_CTRL_MASTER_GAIN;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	cfg = p;
+	cfg->master_gain =  vol;
+	rc = q6apm_send_cmd_sync(apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_gain_set_vol_ctrl);
+
+static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_module *module)
+{
+	struct apm_module_param_data *param_data;
+	struct apm_gain_module_cfg *cfg;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+
+	payload_size = APM_GAIN_CFG_PSIZE;
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	cfg = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
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
+int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
+				struct audioreach_module_config *cfg)
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
+		rc = audioreach_pcm_set_media_format(graph, module, cfg);
+		break;
+	case MODULE_ID_I2S_SOURCE:
+	case MODULE_ID_I2S_SINK:
+		rc = audioreach_i2s_set_media_format(graph, module, cfg);
+		break;
+	case MODULE_ID_WR_SHARED_MEM_EP:
+		rc = audioreach_shmem_set_media_format(graph, module, cfg);
+		break;
+	case MODULE_ID_GAIN:
+		rc = audioreach_gain_set(graph, module);
+		break;
+	case MODULE_ID_CODEC_DMA_SINK:
+	case MODULE_ID_CODEC_DMA_SOURCE:
+		rc = audioreach_codec_dma_set_media_format(graph, module, cfg);
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
+
+	mutex_lock(&graph->lock);
+	port = &graph->rx_data;
+	port->num_periods = 0;
+	kfree(port->buf);
+	port->buf = NULL;
+
+	port = &graph->tx_data;
+	port->num_periods = 0;
+	kfree(port->buf);
+	port->buf = NULL;
+	mutex_unlock(&graph->lock);
+}
+EXPORT_SYMBOL_GPL(audioreach_graph_free_buf);
+
+int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, size_t period_sz,
+				  unsigned int periods, bool is_contiguous)
+{
+	struct apm_shared_map_region_payload *mregions;
+	struct apm_cmd_shared_mem_map_regions *cmd;
+	uint32_t num_regions, buf_sz, payload_size;
+	struct audioreach_graph_data *data;
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
+	pkt = audioreach_alloc_apm_pkt(payload_size, APM_CMD_SHARED_MEM_MAP_REGIONS, dir,
+				     graph->port->id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE;
+	cmd = p;
+	cmd->mem_pool_id = APM_MEMORY_MAP_SHMEM8_4K_POOL;
+	cmd->num_regions = num_regions;
+
+	cmd->property_flag = 0x0;
+
+	mregions = p + sizeof(*cmd);
+
+	mutex_lock(&graph->lock);
+
+	for (i = 0; i < num_regions; i++) {
+		struct audio_buffer *ab;
+
+		ab = &data->buf[i];
+		mregions->shm_addr_lsw = lower_32_bits(ab->phys);
+		mregions->shm_addr_msw = upper_32_bits(ab->phys);
+		mregions->mem_size_bytes = buf_sz;
+		++mregions;
+	}
+	mutex_unlock(&graph->lock);
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
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
+
+	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	pkt = audioreach_alloc_cmd_pkt(sizeof(*eos), DATA_CMD_WR_SH_MEM_EP_EOS, 0,
+				       graph->port->id, iid);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	eos = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	eos->policy = WR_SH_MEM_EP_EOS_POLICY_LAST;
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_shared_memory_send_eos);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index b6ce1a510e91..4f693a2660b5 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -568,6 +568,15 @@ struct param_id_hw_ep_dma_data_align {
 	uint32_t dma_data_align;
 } __packed;
 
+#define PARAM_ID_VOL_CTRL_MASTER_GAIN	0x08001035
+#define VOL_CTRL_DEFAULT_GAIN		0x2000
+
+struct param_id_vol_ctrl_master_gain {
+	uint16_t master_gain;
+	uint16_t reserved;
+} __packed;
+
+
 /* Graph */
 struct audioreach_connection {
 	/* Connections */
@@ -684,6 +693,26 @@ void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
 void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 				 struct list_head *sg_list,
 				  int graph_id);
+/* Topology specific */
+int audioreach_tplg_init(struct snd_soc_component *component);
+
+/* Module specific */
+void audioreach_graph_free_buf(struct q6apm_graph *graph);
+int audioreach_map_memory_regions(struct q6apm_graph *graph,
+				  unsigned int dir, size_t period_sz,
+				  unsigned int periods,
+				  bool is_contiguous);
+int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
+			     struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
+			     struct gpr_pkt *pkt, uint32_t rsp_opcode);
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
+				   uint32_t rsp_opcode);
+int audioreach_set_media_format(struct q6apm_graph *graph,
+				struct audioreach_module *module,
+				struct audioreach_module_config *cfg);
+int audioreach_shared_memory_send_eos(struct q6apm_graph *graph);
+int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
+				 struct audioreach_module *module, int vol);
 struct audioreach_module *audioreach_get_container_last_module(
 				struct audioreach_container *container);
 struct audioreach_module *audioreach_get_container_first_module(
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 8bd125277437..13598ef5bacb 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -258,6 +258,150 @@ int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid, u32 dst_sgid, bool
 	return 0;
 }
 
+int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
+				   struct audioreach_module_config *cfg)
+{
+	struct audioreach_module *module;
+
+	if (cfg->direction == SNDRV_PCM_STREAM_CAPTURE)
+		module = q6apm_find_module_by_mid(graph, MODULE_ID_RD_SHARED_MEM_EP);
+	else
+		module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
+
+	if (!module)
+		return -ENODEV;
+
+	audioreach_set_media_format(graph, module, cfg);
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_media_format_shmem);
+
+int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
+			     size_t period_sz, unsigned int periods)
+{
+	struct audioreach_graph_data *data;
+	struct audio_buffer *buf;
+	int cnt;
+	int rc;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	mutex_lock(&graph->lock);
+
+	if (data->buf) {
+		mutex_unlock(&graph->lock);
+		return 0;
+	}
+
+	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL);
+	if (!buf) {
+		mutex_unlock(&graph->lock);
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
+	mutex_unlock(&graph->lock);
+
+	rc = audioreach_map_memory_regions(graph, dir, period_sz, periods, 1);
+	if (rc < 0) {
+		dev_err(graph->dev, "Memory_map_regions failed\n");
+		audioreach_graph_free_buf(graph);
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6apm_map_memory_regions);
+
+int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
+{
+	struct apm_cmd_shared_mem_unmap_regions *cmd;
+	struct audioreach_graph_data *data;
+	struct gpr_pkt *pkt;
+	int rc;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		data = &graph->rx_data;
+	else
+		data = &graph->tx_data;
+
+	if (!data->mem_map_handle)
+		return 0;
+
+	pkt = audioreach_alloc_apm_pkt(sizeof(*cmd), APM_CMD_SHARED_MEM_UNMAP_REGIONS, dir,
+				     graph->port->id);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	cmd = (void *)pkt + GPR_HDR_SIZE;
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
+int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_module_config *cfg)
+{
+	struct audioreach_graph_info *info = graph->info;
+	struct audioreach_sub_graph *sgs;
+	struct audioreach_container *container;
+	struct audioreach_module *module;
+
+	list_for_each_entry(sgs, &info->sg_list, node) {
+		list_for_each_entry(container, &sgs->container_list, node) {
+			list_for_each_entry(module, &container->modules_list, node) {
+				if ((module->module_id == MODULE_ID_WR_SHARED_MEM_EP) ||
+					(module->module_id == MODULE_ID_RD_SHARED_MEM_EP))
+					continue;
+
+				audioreach_set_media_format(graph, module, cfg);
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
@@ -271,6 +415,88 @@ int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
 }
 EXPORT_SYMBOL_GPL(q6apm_graph_get_rx_shmem_module_iid);
 
+int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
+		      uint32_t lsw_ts, uint32_t wflags)
+{
+	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
+	struct audio_buffer *ab;
+	struct gpr_pkt *pkt;
+	int rc, iid;
+
+	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	pkt = audioreach_alloc_pkt(sizeof(*write_buffer), DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
+				   graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
+				   graph->port->id, iid);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	write_buffer = (void *)pkt + GPR_HDR_SIZE;
+
+	mutex_lock(&graph->lock);
+	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
+
+	write_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
+	write_buffer->buf_addr_msw = upper_32_bits(ab->phys);
+	write_buffer->buf_size = len;
+	write_buffer->timestamp_lsw = lsw_ts;
+	write_buffer->timestamp_msw = msw_ts;
+	write_buffer->mem_map_handle = graph->rx_data.mem_map_handle;
+	write_buffer->flags = wflags;
+
+	graph->rx_data.dsp_buf++;
+
+	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
+		graph->rx_data.dsp_buf = 0;
+
+	mutex_unlock(&graph->lock);
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
+	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
+	struct audioreach_graph_data *port;
+	struct audio_buffer *ab;
+	struct gpr_pkt *pkt;
+	int rc, iid;
+
+	iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+	pkt = audioreach_alloc_pkt(sizeof(*read_buffer), DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
+				   graph->tx_data.dsp_buf, graph->port->id, iid);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	read_buffer = (void *)pkt + GPR_HDR_SIZE;
+
+	mutex_lock(&graph->lock);
+	port = &graph->tx_data;
+	ab = &port->buf[port->dsp_buf];
+
+	read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
+	read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
+	read_buffer->mem_map_handle = port->mem_map_handle;
+	read_buffer->buf_size = ab->size;
+
+	port->dsp_buf++;
+
+	if (port->dsp_buf >= port->num_periods)
+		port->dsp_buf = 0;
+
+	mutex_unlock(&graph->lock);
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
 	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
-- 
2.21.0

