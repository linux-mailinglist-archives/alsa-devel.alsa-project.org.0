Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCF443B249
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 14:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D72D16EE;
	Tue, 26 Oct 2021 14:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D72D16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635250893;
	bh=vtyzFlgGmcX9LPA2cehkEIc1hMffMsfl4j4rhxrCqro=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/FYjkF1VsISf108ECIwRmpcOsJTjVMSLCWabp98lMR2AUqrBHFxbjBbWTOiG0A/p
	 pZIuiD3ABUskeyQVfjmdgb+0RGoyCohNlkzefMgz0npwbVQAEdXF/a79MWk89NBdKl
	 OcDFQnVcbVDZv84tGaXIVjyLXSwGr+fMeSz4vagI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19FD9F80300;
	Tue, 26 Oct 2021 14:20:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC61F802E7; Tue, 26 Oct 2021 14:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 369F2F802E7
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 14:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 369F2F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="qWsWUED2"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635250811; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=tYto2LoVENLzeNtQFzqzVBgMkcTo1jqLc7m9bcYCLBY=;
 b=qWsWUED2+PU6xt7QmCIYiP/otUq+eobHWHgHYHyNhFGp7jKXlj1YwNz4MtBr39LuAa1aMMFM
 AYaRgQgVJSD7vArYPzzLGBJsKEZG7xvAdp9Zru0hWEmwq9F9HaCsRm+maGwyyWOTAm2xTClj
 bdZRFDE8skrhaCwypAB54v8k4X8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6177f26314914866fa6961a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 12:19:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 45D81C4360D; Tue, 26 Oct 2021 12:19:46 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 36143C43618;
 Tue, 26 Oct 2021 12:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 36143C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v4 1/3] ASoC: qcom: soundwire: Disable soundwire rxtx cgcr
 hardware control
Date: Tue, 26 Oct 2021 17:49:22 +0530
Message-Id: <1635250764-13994-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org>
References: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Update soundwire master rxtx cgcr register field to make clock gating control as
software controllable.
It is required for soundwire v1.6.0 and above for RX and TX path to work.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 drivers/soundwire/qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 0ef79d6..2492190 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -109,6 +109,7 @@
 #define SWR_MAX_CMD_ID	14
 #define MAX_FIFO_RD_RETRY 3
 #define SWR_OVERFLOW_RETRY_COUNT 30
+#define SWR_RXTX_CGCR_HW_CTL_MASK ~BIT(1)
 
 struct qcom_swrm_port_config {
 	u8 si;
@@ -127,6 +128,7 @@ struct qcom_swrm_ctrl {
 	struct device *dev;
 	struct regmap *regmap;
 	void __iomem *mmio;
+	char __iomem *audio_csr_mmio;
 	struct completion broadcast;
 	struct completion enumeration;
 	struct work_struct slave_work;
@@ -610,6 +612,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
 	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
 
+	if (ctrl->audio_csr_mmio) {
+		val = ioread32(ctrl->audio_csr_mmio);
+		val &= SWR_RXTX_CGCR_HW_CTL_MASK;
+		iowrite32(val, ctrl->audio_csr_mmio);
+	}
+
 	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
 
 	/* Enable Auto enumeration */
@@ -1201,6 +1209,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	const struct qcom_swrm_data *data;
 	int ret;
 	u32 val;
+	int swrm_hctl_reg;
 
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
@@ -1251,6 +1260,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 
+	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg)) {
+		ctrl->audio_csr_mmio = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);
+		if (!ctrl->audio_csr_mmio)
+			return -ENODEV;
+	}
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
 		goto err_clk;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

