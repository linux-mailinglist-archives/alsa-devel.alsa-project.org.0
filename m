Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50B3DEEAF
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 15:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC01C184C;
	Tue,  3 Aug 2021 15:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC01C184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995816;
	bh=Zxkj6+9uUHetqDauPpWuSL95+sbOgB0CsAm+EPQsZeE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U/5u6EwfH50lnXPL9bl1rJCtKNs4svJuBqWFr6bf05038mQWrr3S2zJm3oSw6Cu3t
	 ZjxiT4VVDuZ/Di3ReaFcLM+vwdMUJ2r9/xZsqmHoTIeJRqdVisPRFVsFO8MgdmLidJ
	 7Aciged7WtTRg6zoCp4VrRdC696SMG0lQ/6LqLSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE75F805C7;
	Tue,  3 Aug 2021 14:55:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ED54F805AB; Tue,  3 Aug 2021 14:54:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87065F80524
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87065F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TLd648eo"
Received: by mail-wm1-x332.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so2071546wmq.2
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVnXaedL4jvGBLGq0TYpLl2kFDFM6BquLaF4IT5zjr0=;
 b=TLd648eoubo6XRrQwFEQKOUozU2IaFmtZim9Chjb/MG/lzmpnMECXsGdqjKmD+JSuj
 zhli7OTj9txTmzHtLB0T+TlmFGfJ5jEPLfbteOy6jCGaV8fCi62BBh7XlXQZOUqlbkxB
 TIAw3Kt5pr8M7OMSXryWGGc2giYWakhPQKfA7UCu8grTaqjZt5iV0uTxp0O82AfvmUnq
 UXlp8mChNfNXnMPNCvo5ZQuiSRlBaWeI3qEhqWwVGTBX01VctIA3KU43acwAY/8JPgpP
 CjKOHmmDJ3BP61wbdKTIgrh1mlwEX8gPGmxI4RVbK8xeMHMaMdu4NK6/+ZhxtlPmqOV4
 Dspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVnXaedL4jvGBLGq0TYpLl2kFDFM6BquLaF4IT5zjr0=;
 b=omGU1ZS/Cgkdav0/Q1PXrEowhcW8BUeUPc93NB4uaKQemNpqzIWyrGUBu51lUolUze
 FulPMwv4gmtoUv1WYFsCoNpUtNYlLo+W9z8L1f9I2oHEHBZUr/A9MUSwr/srWXzk+Zh6
 4ziGqFLey6D0KvVeiPtGpzBBVPmWe/qbGSt2Femj/VxpIqDqDsAjD6pwPmnDkDbTYUi9
 D/XFVMWOSD2/FNCecHYSeedcg67eOI4I9fjBWNCD5oKrnHQffGRhqT8rZYASNaRHJMoN
 XQKCZx+ZSFaKgj22LIk1GfVkocgL785V+BG7NOSppc4rZA057p0Ex716ii9AIGZEkBBp
 uvlg==
X-Gm-Message-State: AOAM533gyR5XyGCRALlgoxeE5F7CWxLHxbmTwXiFZzRNGpW2TGfecqaJ
 wb87rEnMVBJGsD4ZZrrNWpNobA==
X-Google-Smtp-Source: ABdhPJzTrowy6n0z5/7XjM7y/3dExJWRoaY9mLpnd5aeYof5rYUd6fghxaJ3gKlbb/3S5jQSFqjCCQ==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr21885583wmq.101.1627995284615; 
 Tue, 03 Aug 2021 05:54:44 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 19/20] ASoC: qdsp6: audioreach: add q6prm support
Date: Tue,  3 Aug 2021 13:54:10 +0100
Message-Id: <20210803125411.28066-20-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
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
 sound/soc/qcom/qdsp6/Makefile |   2 +
 sound/soc/qcom/qdsp6/q6prm.c  | 256 ++++++++++++++++++++++++++++++++++
 3 files changed, 262 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6prm.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a2540a28b482..e9155c4022b4 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -109,12 +109,16 @@ config SND_SOC_QDSP6_APM_DAI
 config SND_SOC_QDSP6_APM_BEDAI
 	tristate
 
+config SND_SOC_QDSP6_PRM
+	tristate
+
 config SND_SOC_QDSP6_AUDIOREACH
 	tristate "SoC ALSA audio drives for Qualcomm QDSP AUDIOREACH Framework"
 	depends on QCOM_GPR
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_QDSP6_APM_DAI
 	select SND_SOC_QDSP6_APM_BEDAI
+	select SND_SOC_QDSP6_PRM
 	help
 	 To add support for Qualcomm QDSP6 AudioReach Audio Framework.
 	 This will enable sound soc platform specific audio drivers.
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index d62f85b3f18a..0388b1c10eb1 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -2,6 +2,7 @@
 snd-ar-objs := audioreach.o q6apm.o topology.o
 snd-apm-dai-objs := q6apm-dai.o
 snd-apm-bedai-objs := q6dsp-audio-ports.o q6apm-bedai.o
+snd-prm-objs := q6prm.o
 
 snd-afe-dai-objs += q6dsp-audio-ports.o q6afe-dai.o
 snd-afe-clks-objs := q6dsp-audio-clocks.o q6afe-clocks.o
@@ -19,3 +20,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
 obj-$(CONFIG_SND_SOC_QDSP6_AUDIOREACH) += snd-ar.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += snd-apm-dai.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_BEDAI) += snd-apm-bedai.o
+obj-$(CONFIG_SND_SOC_QDSP6_PRM) += snd-prm.o
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
new file mode 100644
index 000000000000..6836646fea17
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
+#include <dt-bindings/sound/qcom,q6dsp-audio-ports.h>
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
+				 int clk_root, unsigned int freq)
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
-- 
2.21.0

