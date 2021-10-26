Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA243B071
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:45:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7D551717;
	Tue, 26 Oct 2021 12:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7D551717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635245152;
	bh=qX4HDYsoyC/S+GtJuoZwau8IrzeDtrvjr51L9jOLMeY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLECRd6ydNnWz2H976OBWyAzh+FpY6TegJUbq5P1UDSDcPoGi1viG+N9b6PvhfmjA
	 vzlgkR2itviwLeGBVBFkRihrMV3PTts10lVcBPDYTqx1WzynSW1Jlqod3hUcsPWYax
	 DhJU1pdlwGEsRsK/RQKsk6o2lX7WDqSosUkU8DX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F84AF805A9;
	Tue, 26 Oct 2021 12:39:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E70D6F80508; Tue, 26 Oct 2021 12:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70E21F804AF
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70E21F804AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HAR8rJ+J"
Received: by mail-wr1-x433.google.com with SMTP id m22so15008772wrb.0
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYgv1eoGx9NFbm/uI8k2s23DY3/Vaao0ojhIbD31vzo=;
 b=HAR8rJ+JbdhNG+Kckpqp8tQ3FzbJRevWgbshMtgwlRQ0gKBzuioUogxdJACVc0sFSP
 kbUK8vZausW8LhM1DqinKfxaDo9qlfNURAZwpHbDoioJJTFGACqOEVypRhP8TgIfBe3O
 SPH6j3ebIA5xALsF+bED6GnPjqb2/R86LugK/lIhPROoi0mfzzzAAPBgtU7q3LBNqG6I
 UYi38odi7fH0pQ1G+bdxdcdsddQ+6iDU+1jHy2r0zKGXzfcYpxWd5Ih0c/AT5ltcTnEh
 nf4z03BBa9PrWOA8ostD8WD7Ysw8PoyYZwBvOslUN/ZrMiRL5ikQHzt1JfrdNLlpFZjE
 0ezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYgv1eoGx9NFbm/uI8k2s23DY3/Vaao0ojhIbD31vzo=;
 b=4GVW/fjPN2FFVE6wQhYOyAFK/n6hqmblRXXPiD+eBk4/BIOr3fEEquWb5OOlnZv0jK
 YbsXyLL95BEAAAYBQcTRGtmY4kCaJL/aoD3u2pofEmNOybPF5u2oHAJYQkEpRaFIjfre
 dXKji3a9mbsG75IBtQJqnqGAem0wURJCmE6ThJSOrKt7Jl0leRhAPBgKeXGt7hvqYYqJ
 WJCNaGy+9z/Xz1UAKK/XXdLw2E3nPC8v6ijtDEMZ6hYqTUokuq6Ux2UpZdGWMLQIBzmr
 HqhI16BrWCdKw+vgTL72pHwBUl+q00qROC8S+DKoLUJ4KKn3gP+5bTAYTfZKr5ZnFoAf
 WMYA==
X-Gm-Message-State: AOAM531bDgMElwXICpPPhb6c0FeeQRXYeKE9LCpTLQmt8KIJPTNQ4m8K
 S8qN/hc8GhagcZcX8rZ7S7vRJQ==
X-Google-Smtp-Source: ABdhPJxP3xnl2e+qqvKP6u52LTAlobSHjZv7kEQ1ZpBOoCVCx21+c5x9G1xnhaVNw5Eksy9a7yJ7iw==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr8489953wrd.273.1635244728543; 
 Tue, 26 Oct 2021 03:38:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x21sm221397wmc.14.2021.10.26.03.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:38:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [RESEND PATCH v10 16/17] ASoC: qdsp6: audioreach: add q6prm support
Date: Tue, 26 Oct 2021 11:38:14 +0100
Message-Id: <20211026103815.19468-17-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
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

Add support to q6prm (Proxy Resource Manager) module used for clock resources

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/Kconfig        |   4 +
 sound/soc/qcom/qdsp6/Makefile |   1 +
 sound/soc/qcom/qdsp6/q6prm.c  | 202 ++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6prm.h  |  78 +++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index d1132c4174db..465a2a603401 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -96,6 +96,9 @@ config SND_SOC_QDSP6_APM
 	select SND_SOC_QDSP6_APM_DAI
 	select SND_SOC_QDSP6_APM_LPASS_DAI
 
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
index 000000000000..82c40f2d4e1d
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -0,0 +1,202 @@
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
+#define PARAM_ID_RSC_HW_CORE		0x08001032
+#define PARAM_ID_RSC_LPASS_CORE		0x0800102B
+#define PARAM_ID_RSC_AUDIO_HW_CLK	0x0800102C
+
+struct prm_cmd_request_hw_core {
+	struct apm_module_param_data param_data;
+	uint32_t hw_clk_id;
+} __packed;
+
+struct prm_cmd_request_rsc {
+	struct apm_module_param_data param_data;
+	uint32_t num_clk_id;
+	struct audio_hw_clk_cfg clock_id;
+} __packed;
+
+static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+{
+	return audioreach_send_cmd_sync(prm->dev, prm->gdev, &prm->result, &prm->lock,
+					NULL, &prm->wait, pkt, rsp_opcode);
+}
+
+static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool enable)
+{
+	struct q6prm *prm = dev_get_drvdata(dev->parent);
+	struct apm_module_param_data *param_data;
+	struct prm_cmd_request_hw_core *req;
+	gpr_device_t *gdev = prm->gdev;
+	uint32_t opcode, rsp_opcode;
+	struct gpr_pkt *pkt;
+	int rc;
+
+	if (enable) {
+		opcode = PRM_CMD_REQUEST_HW_RSC;
+		rsp_opcode = PRM_CMD_RSP_REQUEST_HW_RSC;
+	} else {
+		opcode = PRM_CMD_RELEASE_HW_RSC;
+		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
+	}
+
+	pkt = audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id, GPR_PRM_MODULE_IID);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	req = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
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
+	rc = q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
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
+int q6prm_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id, uint32_t client_handle)
+{
+	return q6prm_set_hw_core_req(dev, hw_block_id, false);
+}
+EXPORT_SYMBOL_GPL(q6prm_unvote_lpass_core_hw);
+
+int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
+			  unsigned int freq)
+{
+	struct q6prm *prm = dev_get_drvdata(dev->parent);
+	struct apm_module_param_data *param_data;
+	struct prm_cmd_request_rsc *req;
+	gpr_device_t *gdev = prm->gdev;
+	struct gpr_pkt *pkt;
+	int rc;
+
+	pkt = audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC, 0, gdev->svc.id,
+				       GPR_PRM_MODULE_IID);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	req = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = &req->param_data;
+
+	param_data->module_instance_id = GPR_PRM_MODULE_IID;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_RSC_AUDIO_HW_CLK;
+	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
+
+	req->num_clk_id = 1;
+	req->clock_id.clock_id = clk_id;
+	req->clock_id.clock_freq = freq;
+	req->clock_id.clock_attri = clk_attr;
+	req->clock_id.clock_root = clk_root;
+
+	rc = q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);
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
+	switch (hdr->opcode) {
+	case PRM_CMD_RSP_REQUEST_HW_RSC:
+	case PRM_CMD_RSP_RELEASE_HW_RSC:
+		result = data->payload;
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
+#ifdef CONFIG_OF
+static const struct of_device_id prm_device_id[]  = {
+	{ .compatible = "qcom,q6prm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, prm_device_id);
+#endif
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
+MODULE_LICENSE("GPL");
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

