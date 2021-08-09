Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BEB3E44F4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 13:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E21D31711;
	Mon,  9 Aug 2021 13:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E21D31711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628508777;
	bh=3LcmCmJv+ozAV3Y9dqL8Oex31kWa4jLmMJ4DqePlmis=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NxQEEF3Sxjq44dciO3M/lzkNJm1ZrWiEktWpNz7ZVf4ACwaQTx7Sa6CNWtlWF5YJc
	 5iHoDjG/QxWiMjcGS28M95uJDY9/fwZxCMlUbem5n96trZWJNDy85s2V8EkL5qJoU/
	 m1FJiZu48/Gbz9mge1Lem0Ngb2fuitgxr6q8Os9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 874D4F805A1;
	Mon,  9 Aug 2021 13:25:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AAEFF8053D; Mon,  9 Aug 2021 13:25:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DE96F804EB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE96F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uKjqMBtv"
Received: by mail-wm1-x32c.google.com with SMTP id k4so10338312wms.3
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 04:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZaL7qvSefaJpfWo//0Nk/9Vo0Y7I0wdmchem8OJW1Y8=;
 b=uKjqMBtvUkTyHfoFQWT+QRwCImSAn5q8P2/ZCOLWSPdR/9W5uANyEvLxrs3W5bjE/A
 XEWPDqPGx9AcEflR6E+Agj7XEANxawPMJcQb/PLLc3XAs6GSqVp+SUSCsGAZAN3ZDxaz
 RuWYZMhDNrO16J88OKkwOjy2aNYyjNW3IVcg+c/ycAWJ5Cz7MKDEfcYo1e3l0LHjW6Z5
 HuOiffLFzYSN162iGb/bSENDieblBz1geFm6hNXHVhr+8Y5p7fa1JDK79pGgixmdpkBC
 0Ed2btm4PiPmFBucoFpHqbGuoCfDnF5bEhW34c6ZE7GZx1p57awpIQ8cfr56eG5Fu0hY
 5DzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZaL7qvSefaJpfWo//0Nk/9Vo0Y7I0wdmchem8OJW1Y8=;
 b=Xh8KY9EVgPGY0dEZTmBdfbUF6A/DNrbu1m0qitom93WReXDFqAQqytm0EL0FhogY5b
 MRGgVJhRRcPDY0OybO5wIcfLYJXkVKZj1jQWKCXKcF7iRxgsmHYdDfWbP2KrLXcwMRoK
 hUQWhECBFkD05O8vAMmbdvEuuio85I9Yjj24IMNjqaBH/iW5iJaDdi9woOsubjGQ2L0W
 0MoD2/YFhH6YaiVK+wmFCBHQ47ifBgVIsCVNMSnf1qbArCLJ8Dk6aYwiDd8ktjj3/uVR
 OhjKGTNf7FoXaWTZ9qInlXKU2C9Gzc91hm0HEy+UPk3ZrPXroC1nie5WzL43WaJp5tnJ
 177A==
X-Gm-Message-State: AOAM531skS81QMvvo1zNcbYTmf7apm01L5TBRxQJ8V7MiwH/WTl8oGBw
 xyhsk+cci3+UXDgRAEP98BHFFA==
X-Google-Smtp-Source: ABdhPJytpjT+nVFZ30TadvtMsjuqn52k+bDYXre9/AWZ5NguDCqTobi+iJjvg630G1u1RPsSsSQWyQ==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr10426171wmq.76.1628508287472; 
 Mon, 09 Aug 2021 04:24:47 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b80sm7774900wmb.2.2021.08.09.04.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:24:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v4 15/20] ASoC: qdsp6: audioreach: add module configuration
 command helpers
Date: Mon,  9 Aug 2021 12:23:34 +0100
Message-Id: <20210809112339.8368-16-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Audioreach module configuration helpers, which will be used by
the q6apm-dai driver.

Also add Kconfig and Makefile changes as now all the code for audioreach
and q6apm are in at this point.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig            |   4 +
 sound/soc/qcom/qdsp6/Makefile     |   3 +
 sound/soc/qcom/qdsp6/audioreach.c | 584 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  26 ++
 sound/soc/qcom/qdsp6/q6apm.c      | 254 +++++++++++++
 5 files changed, 871 insertions(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cc7c1de2f1d9..5a693f83fd6c 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -84,6 +84,9 @@ config SND_SOC_QDSP6_ASM_DAI
 	select SND_SOC_COMPRESS
 	tristate
 
+config SND_SOC_QDSP6_APM
+	tristate
+
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
 	depends on QCOM_APR
@@ -97,6 +100,7 @@ config SND_SOC_QDSP6
 	select SND_SOC_QDSP6_ROUTING
 	select SND_SOC_QDSP6_ASM
 	select SND_SOC_QDSP6_ASM_DAI
+	select SND_SOC_QDSP6_APM
 	help
 	 To add support for MSM QDSP6 Soc Audio.
 	 This will enable sound soc platform specific
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index a4191d395557..1a0803d97eec 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-q6dsp-common-objs := q6dsp-common.o q6dsp-lpass-ports.o q6dsp-lpass-clocks.o
+snd-q6apm-objs := q6apm.o audioreach.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_COMMON) += snd-q6dsp-common.o
 obj-$(CONFIG_SND_SOC_QDSP6_CORE) += q6core.o
@@ -10,3 +11,5 @@ obj-$(CONFIG_SND_SOC_QDSP6_ADM) += q6adm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ROUTING) += q6routing.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM) += q6asm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
+
+obj-$(CONFIG_SND_SOC_QDSP6_APM) += snd-q6apm.o
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 6106ee46990e..e34a3094cdca 100644
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
@@ -584,3 +588,583 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 	return pkt;
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
+
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
+				   struct gpr_pkt *pkt, uint32_t rsp_opcode)
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
+					  struct audioreach_module *module,
+					  struct audioreach_module_config *cfg)
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
+				    struct audioreach_module *module,
+				    struct audioreach_module_config *cfg)
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
+
+	switch (cfg->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
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
+				     struct audioreach_module_config *mcfg)
+{
+	struct apm_pcm_module_media_fmt_cmd *cfg;
+	struct apm_module_param_data *param_data;
+	uint32_t num_channels = mcfg->num_channels;
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
+	cfg->media_cfg.bit_width = mcfg->bit_width;
+	cfg->media_cfg.endianness = PCM_LITTLE_ENDIAN;
+	cfg->media_cfg.interleaved = module->interleave_type;
+	cfg->media_cfg.num_channels = mcfg->num_channels;
+	cfg->media_cfg.q_factor = mcfg->bit_width - 1;
+	cfg->media_cfg.bits_per_sample = mcfg->bit_width;
+
+	if (num_channels == 1) {
+		cfg->media_cfg.channel_mapping[0] =  PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		cfg->media_cfg.channel_mapping[0] =  PCM_CHANNEL_L;
+		cfg->media_cfg.channel_mapping[1] =  PCM_CHANNEL_R;
+	} else {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+		rc = -EINVAL;
+		goto err;
+
+	}
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+err:
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
+				       struct audioreach_module *module,
+				       struct audioreach_module_config *mcfg)
+{
+	struct apm_module_param_data *param_data;
+	struct payload_media_fmt_pcm *cfg;
+	struct media_format *header;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+	uint32_t num_channels = mcfg->num_channels;
+
+	if (num_channels > 2) {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+		return -EINVAL;
+	}
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
+	} else {
+		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
+		rc = -EINVAL;
+		goto err;
+	}
+
+	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
+err:
+	kfree(pkt);
+
+	return rc;
+}
+
+int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module
+				 *module, int vol)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_vol_ctrl_master_gain *cfg;
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
+		struct audio_buffer *ab;
+
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
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d25ea8c48b41..68bf62764220 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -539,6 +539,14 @@ struct param_id_hw_ep_dma_data_align {
 	uint32_t dma_data_align;
 } __packed;
 
+#define PARAM_ID_VOL_CTRL_MASTER_GAIN	0x08001035
+#define VOL_CTRL_DEFAULT_GAIN		0x2000
+struct param_id_vol_ctrl_master_gain {
+	uint16_t master_gain;
+	uint16_t reserved;
+} __packed;
+
+
 /* Graph */
 struct audioreach_connection {
 	/* Connections */
@@ -653,6 +661,24 @@ void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
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
+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
+					   struct gpr_pkt *pkt,
+					   uint32_t rsp_opcode);
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
index 5de85f477179..acb9c7ad6fcd 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -300,6 +300,162 @@ int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid,
 	return 0;
 }
 
+int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
+				   struct audioreach_module_config *cfg)
+{
+	struct audioreach_module *module;
+
+	if (cfg->direction == SNDRV_PCM_STREAM_CAPTURE)
+		module = q6apm_find_module_by_mid(graph,
+						  MODULE_ID_RD_SHARED_MEM_EP);
+	else
+		module = q6apm_find_module_by_mid(graph,
+						  MODULE_ID_WR_SHARED_MEM_EP);
+
+	if (!module)
+		return -ENODEV;
+
+
+	audioreach_set_media_format(graph, module, cfg);
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
+	if (!data->mem_map_handle)
+		return 0;
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
+				 struct audioreach_module_config *cfg)
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
@@ -313,6 +469,104 @@ int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
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
+				      graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
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

