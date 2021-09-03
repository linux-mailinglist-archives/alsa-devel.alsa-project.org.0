Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1B73FFF35
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 200FB180F;
	Fri,  3 Sep 2021 13:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 200FB180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668591;
	bh=rkqiFF2/Ix0E6sjicNiGGTAJWGui3ONoCGbcpiMhErE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSGt24l0jxIAx6bcl1900WuCUAlBi5qibF1mp6Ut/hIe1Dc9olLGwlQy3FEBLy3gW
	 O59MW6FYTl3VUOIUPpyv4BTncVzuDWHIWGXcD+bN8h66JU0kciM2FbwMUD+3Q2OHvF
	 3dwcINd8A8Aob6z1A4VwMungC/1pMETlvO5DmJk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1401F805C4;
	Fri,  3 Sep 2021 13:22:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAA40F80570; Fri,  3 Sep 2021 13:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0C37F80537
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C37F80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ByEPnlGT"
Received: by mail-wr1-x42b.google.com with SMTP id b10so7785165wru.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z18reG1tTUAD4pF1aJi8xjrNoovgrSPnvk5k8gw1ExA=;
 b=ByEPnlGTgerC8XWDHVVa0+rHrOXFr71bQCOfu71LeN6K7xtQynHyjWOeE2gxl5Z3ot
 mATu3lO45VonVdTnkPkzg8Crrg0KAsc1PDUpLhF4bDUzeZuqnauPAGmDGWrSIc1S21rb
 9H8qctTJVlbpDKY4RzmrtL35dOl1bimoNjIknHS7ZcIuGxompIKbu0jDY9HPIsvDtK8f
 HeBfs8A9jxa9GsvoscAV2X7tAZBTRB4gMdbMgrdQtXXjFT0nJTo+zPudBFlcmHo8iiey
 0tbHZzgSgcGfg83AqxmPmr5ZCdY+MDmTjf5kCNynNmXdysk8UO95uMJGhalZ4uuwW2ke
 dRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z18reG1tTUAD4pF1aJi8xjrNoovgrSPnvk5k8gw1ExA=;
 b=UjG29dfwA77DRf9BSyTo/pzEqYTX7qOVy6l42RLq1YCjslVz97JbWdGu7jlBfgS9CC
 znvK84DunQPR5SPf3KW8lr2HqqWs5WNrZEmEDssIOlQ+rhL/hx9WuS1loGYvuvAEsPTv
 bG5lNKILyovGHc0oDE+o096s660a1U6WI54Q09QqAPDDXD/G+SRWpIARPkdpjQ+gexY5
 I8vwujNG1kcMBcQZZSiAZx5xPrmtotK0YPw5U5LwoXqbq+U1GPxzqib+V8tTb0KbI+jJ
 UUptEhBFVJagZTgA7WFm4AYcvwDQ/1gr3iwu7jsC2aDtqonNvL/qX9xJc6E+6laZQuVK
 FsUw==
X-Gm-Message-State: AOAM533AgIR95KuSHHTfXOsjz50Wf77189S968a7fnclpq6yzFGSBK3L
 NA1dxsztp0+H+xXWAO5bM4njtQ==
X-Google-Smtp-Source: ABdhPJydw7XwiXDmeVV98JL9u5L8gufsYyagBCvygMjvaQGk/8o4C0aclzRJDgCY4XiLH695m9aIYQ==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr3490089wrv.402.1630668118512; 
 Fri, 03 Sep 2021 04:21:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 20/21] ASoC: qdsp6: audioreach: add q6prm support
Date: Fri,  3 Sep 2021 12:20:31 +0100
Message-Id: <20210903112032.25834-21-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
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

Add support to q6prm (Proxy Resource Manager) module used for clock resources

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig        |   4 +
 sound/soc/qcom/qdsp6/Makefile |   1 +
 sound/soc/qcom/qdsp6/q6prm.c  | 256 ++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6prm.h  |  78 +++++++++++
 4 files changed, 339 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 51b5a173e8ed..f4ccfe48f8f7 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -96,6 +96,9 @@ config SND_SOC_QDSP6_APM
 	select SND_SOC_QDSP6_APM_LPASS_DAI
 	tristate
 
+config SND_SOC_QDSP6_PRM
+	tristate
+
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
 	depends on QCOM_APR
@@ -111,6 +114,7 @@ config SND_SOC_QDSP6
 	select SND_SOC_QDSP6_ASM_DAI
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_QDSP6_APM
+	select SND_SOC_QDSP6_PRM
 	help
 	 To add support for MSM QDSP6 Soc Audio.
 	 This will enable sound soc platform specific
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index bdcbfdfa9bd0..c932f8e24b32 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM) += snd-q6apm.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += q6apm-dai.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_LPASS_DAI) += q6apm-lpass-dais.o
+obj-$(CONFIG_SND_SOC_QDSP6_PRM) += q6prm.o
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
new file mode 100644
index 000000000000..3ad959311205
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021, Linaro Limited
+
+#include <linux/slab.h>
+#include <linux/wait.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/delay.h>
+#include <linux/of_platform.h>
+#include <linux/jiffies.h>
+#include <linux/soc/qcom/apr.h>
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include "q6prm.h"
+#include "audioreach.h"
+
+struct q6prm {
+	struct device *dev;
+	gpr_device_t *gdev;
+	wait_queue_head_t wait;
+	struct gpr_ibasic_rsp_result_t result;
+	struct mutex lock;
+};
+
+#define PRM_CMD_REQUEST_HW_RSC		0x0100100F
+#define PRM_CMD_RSP_REQUEST_HW_RSC	0x02001002
+#define PRM_CMD_RELEASE_HW_RSC		0x01001010
+#define PRM_CMD_RSP_RELEASE_HW_RSC	0x02001003
+
+#define PARAM_ID_RSC_HW_CORE		0x08001032
+#define PARAM_ID_RSC_LPASS_CORE		0x0800102B
+#define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
+
+#define LPAIF_DIG_CLK	1
+#define LPAIF_BIT_CLK	2
+#define LPAIF_OSR_CLK	3
+
+struct prm_cmd_request_hw_core {
+	struct apm_module_param_data param_data;
+	uint32_t hw_clk_id;
+} __packed;
+
+struct prm_cmd_request_rsc {
+	struct apm_module_param_data param_data;
+	uint32_t num_clk_id;
+	struct audio_hw_clk_cfg clock_ids[1];
+} __packed;
+
+struct prm_cmd_release_rsc {
+	struct apm_module_param_data param_data;
+	uint32_t num_clk_id;
+	struct audio_hw_clk_cfg clock_ids[1];
+} __packed;
+
+static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
+{
+	gpr_device_t *gdev = prm->gdev;
+	struct gpr_hdr *hdr = &pkt->hdr;
+	int rc;
+
+	mutex_lock(&prm->lock);
+	prm->result.opcode = 0;
+	prm->result.status = 0;
+
+	rc = gpr_send_pkt(prm->gdev, pkt);
+	if (rc < 0)
+		goto err;
+
+	if (rsp_opcode)
+		rc = wait_event_timeout(prm->wait,
+					(prm->result.opcode == hdr->opcode) ||
+					(prm->result.opcode == rsp_opcode),
+					5 * HZ);
+	else
+		rc = wait_event_timeout(prm->wait,
+					(prm->result.opcode == hdr->opcode),
+					5 * HZ);
+
+	if (!rc) {
+		dev_err(&gdev->dev, "CMD timeout for [%x] opcode\n",
+			hdr->opcode);
+		rc = -ETIMEDOUT;
+	} else if (prm->result.status > 0) {
+		dev_err(&gdev->dev, "DSP returned error[%x] %x\n", hdr->opcode,
+			prm->result.status);
+		rc = -EINVAL;
+	} else {
+		dev_err(&gdev->dev, "DSP returned [%x]\n",
+			prm->result.status);
+		rc = 0;
+	}
+
+err:
+	mutex_unlock(&prm->lock);
+	return rc;
+}
+
+static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool enable)
+{
+	struct prm_cmd_request_hw_core *req;
+	struct apm_module_param_data *param_data;
+	struct gpr_pkt *pkt;
+	struct q6prm *prm = dev_get_drvdata(dev->parent);
+	gpr_device_t *gdev  = prm->gdev;
+	void *p;
+	int rc = 0;
+	uint32_t opcode, rsp_opcode;
+
+	if (enable) {
+		opcode = PRM_CMD_REQUEST_HW_RSC;
+		rsp_opcode = PRM_CMD_RSP_REQUEST_HW_RSC;
+	} else {
+		opcode = PRM_CMD_RELEASE_HW_RSC;
+		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
+	}
+
+	p = audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id,
+				     GPR_PRM_MODULE_IID);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	req = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = &req->param_data;
+
+	param_data->module_instance_id = GPR_PRM_MODULE_IID;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_RSC_HW_CORE;
+	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
+
+	req->hw_clk_id = hw_block_id;
+
+	q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
+			     const char *client_name, uint32_t *client_handle)
+{
+	return q6prm_set_hw_core_req(dev, hw_block_id, true);
+
+}
+EXPORT_SYMBOL_GPL(q6prm_vote_lpass_core_hw);
+
+int q6prm_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
+			       uint32_t client_handle)
+{
+	return q6prm_set_hw_core_req(dev, hw_block_id, false);
+}
+EXPORT_SYMBOL_GPL(q6prm_unvote_lpass_core_hw);
+
+int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
+			  int clk_root, unsigned int freq)
+{
+	struct prm_cmd_request_rsc *req;
+	struct apm_module_param_data *param_data;
+	struct gpr_pkt *pkt;
+	struct q6prm *prm = dev_get_drvdata(dev->parent);
+	gpr_device_t *gdev  = prm->gdev;
+	void *p;
+	int rc = 0;
+
+	p = audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC,
+				     0, gdev->svc.id, GPR_PRM_MODULE_IID);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	req = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = &req->param_data;
+
+	param_data->module_instance_id = GPR_PRM_MODULE_IID;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_RSC_AUDIO_HW_CLK;
+	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
+
+	req->num_clk_id = 1;
+	req->clock_ids[0].clock_id = clk_id;
+	req->clock_ids[0].clock_freq = freq;
+	req->clock_ids[0].clock_attri = clk_attr;
+	req->clock_ids[0].clock_root = clk_root;
+
+	q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);
+
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6prm_set_lpass_clock);
+
+static int prm_callback(struct gpr_resp_pkt *data, void *priv, int op)
+{
+	gpr_device_t *gdev = priv;
+	struct q6prm *prm = dev_get_drvdata(&gdev->dev);
+	struct gpr_ibasic_rsp_result_t *result;
+	struct gpr_hdr *hdr = &data->hdr;
+
+	result = data->payload;
+
+	switch (hdr->opcode) {
+	case PRM_CMD_RSP_REQUEST_HW_RSC:
+	case PRM_CMD_RSP_RELEASE_HW_RSC:
+		prm->result.opcode = hdr->opcode;
+		prm->result.status = result->status;
+		wake_up(&prm->wait);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int prm_probe(gpr_device_t *gdev)
+{
+	struct device *dev = &gdev->dev;
+	struct q6prm *cc;
+
+	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
+	if (!cc)
+		return -ENOMEM;
+
+	cc->dev = dev;
+	cc->gdev = gdev;
+	mutex_init(&cc->lock);
+	init_waitqueue_head(&cc->wait);
+	dev_set_drvdata(dev, cc);
+
+	return devm_of_platform_populate(dev);
+}
+
+static const struct of_device_id prm_device_id[]  = {
+	{ .compatible = "qcom,q6prm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, prm_device_id);
+
+static gpr_driver_t prm_driver = {
+	.probe = prm_probe,
+	.gpr_callback = prm_callback,
+	.driver = {
+		.name = "qcom-prm",
+		.of_match_table = of_match_ptr(prm_device_id),
+	},
+};
+
+module_gpr_driver(prm_driver);
+MODULE_DESCRIPTION("Audio Process Manager");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
new file mode 100644
index 000000000000..fea4d1954bc1
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __Q6PRM_H__
+#define __Q6PRM_H__
+
+/* Clock ID for Primary I2S IBIT */
+#define Q6PRM_LPASS_CLK_ID_PRI_MI2S_IBIT                          0x100
+/* Clock ID for Primary I2S EBIT */
+#define Q6PRM_LPASS_CLK_ID_PRI_MI2S_EBIT                          0x101
+/* Clock ID for Secondary I2S IBIT */
+#define Q6PRM_LPASS_CLK_ID_SEC_MI2S_IBIT                          0x102
+/* Clock ID for Secondary I2S EBIT */
+#define Q6PRM_LPASS_CLK_ID_SEC_MI2S_EBIT                          0x103
+/* Clock ID for Tertiary I2S IBIT */
+#define Q6PRM_LPASS_CLK_ID_TER_MI2S_IBIT                          0x104
+/* Clock ID for Tertiary I2S EBIT */
+#define Q6PRM_LPASS_CLK_ID_TER_MI2S_EBIT                          0x105
+/* Clock ID for Quartnery I2S IBIT */
+#define Q6PRM_LPASS_CLK_ID_QUAD_MI2S_IBIT                         0x106
+/* Clock ID for Quartnery I2S EBIT */
+#define Q6PRM_LPASS_CLK_ID_QUAD_MI2S_EBIT                         0x107
+/* Clock ID for Speaker I2S IBIT */
+#define Q6PRM_LPASS_CLK_ID_SPEAKER_I2S_IBIT                       0x108
+/* Clock ID for Speaker I2S EBIT */
+#define Q6PRM_LPASS_CLK_ID_SPEAKER_I2S_EBIT                       0x109
+/* Clock ID for Speaker I2S OSR */
+#define Q6PRM_LPASS_CLK_ID_SPEAKER_I2S_OSR                        0x10A
+
+/* Clock ID for QUINARY  I2S IBIT */
+#define Q6PRM_LPASS_CLK_ID_QUI_MI2S_IBIT			0x10B
+/* Clock ID for QUINARY  I2S EBIT */
+#define Q6PRM_LPASS_CLK_ID_QUI_MI2S_EBIT			0x10C
+/* Clock ID for SENARY  I2S IBIT */
+#define Q6PRM_LPASS_CLK_ID_SEN_MI2S_IBIT			0x10D
+/* Clock ID for SENARY  I2S EBIT */
+#define Q6PRM_LPASS_CLK_ID_SEN_MI2S_EBIT			0x10E
+/* Clock ID for INT0 I2S IBIT  */
+#define Q6PRM_LPASS_CLK_ID_INT0_MI2S_IBIT                       0x10F
+/* Clock ID for INT1 I2S IBIT  */
+#define Q6PRM_LPASS_CLK_ID_INT1_MI2S_IBIT                       0x110
+/* Clock ID for INT2 I2S IBIT  */
+#define Q6PRM_LPASS_CLK_ID_INT2_MI2S_IBIT                       0x111
+/* Clock ID for INT3 I2S IBIT  */
+#define Q6PRM_LPASS_CLK_ID_INT3_MI2S_IBIT                       0x112
+/* Clock ID for INT4 I2S IBIT  */
+#define Q6PRM_LPASS_CLK_ID_INT4_MI2S_IBIT                       0x113
+/* Clock ID for INT5 I2S IBIT  */
+#define Q6PRM_LPASS_CLK_ID_INT5_MI2S_IBIT                       0x114
+/* Clock ID for INT6 I2S IBIT  */
+#define Q6PRM_LPASS_CLK_ID_INT6_MI2S_IBIT                       0x115
+
+/* Clock ID for QUINARY MI2S OSR CLK  */
+#define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
+
+#define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
+#define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
+
+#define Q6PRM_LPASS_CLK_ID_VA_CORE_MCLK				0x307
+#define Q6PRM_LPASS_CLK_ID_VA_CORE_2X_MCLK			0x308
+
+#define Q6PRM_LPASS_CLK_ID_TX_CORE_MCLK				0x30c
+#define Q6PRM_LPASS_CLK_ID_TX_CORE_NPL_MCLK			0x30d
+
+#define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK				0x30e
+#define Q6PRM_LPASS_CLK_ID_RX_CORE_NPL_MCLK			0x30f
+
+#define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
+#define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
+#define Q6PRM_HW_CORE_ID_LPASS		1
+#define Q6PRM_HW_CORE_ID_DCODEC		2
+
+int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
+			  int clk_root, unsigned int freq);
+int q6prm_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
+			     const char *client_name, uint32_t *client_handle);
+int q6prm_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
+			       uint32_t client_handle);
+#endif /* __Q6PRM_H__ */
-- 
2.21.0

