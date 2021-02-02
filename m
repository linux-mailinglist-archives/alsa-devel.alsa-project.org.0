Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D7730B7D0
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 07:29:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E3E1769;
	Tue,  2 Feb 2021 07:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E3E1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612247391;
	bh=5OlxZU6Hvoqx6uXAOhWq6jb5FRhjYKFOwt30B02qHwo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=No0ak6CHwMrZDBCd782FXbIOCUmQyydG4Pwku7wJtRRQjDdsP+QAKtcnQH7kn3TFq
	 cbS5esb1s0NPFF3hP5xBvH5xQqNeqzG/1eqrQacZwkWvEHdpPbBTHF1xAUtzcgtjmM
	 aTzzhwpCVBnH1xp0He0aNcq5XoxLoMYfvX3bFRZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0706F800E1;
	Tue,  2 Feb 2021 07:28:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86AE4F80171; Tue,  2 Feb 2021 07:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF5DFF800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 07:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF5DFF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="fw1dvBwD"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612247277; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=t4d4srjb9O8cuvbHKvxP3tMfBWF01KKcSjaLhMt8Gww=;
 b=fw1dvBwDIYDG0/xRzACPvHkX6rNO0K8lOK/8Abtb0WHWGweGCR/9rGRh9u9jFZt1okjVjfQ0
 vPWbSXP+dmoQ57W9xVcFpg+yrj+CMYMOXhUTF2L2dKT83scq1ro0LUktGPhusHI7t2/P05hq
 BURE/jGxsOBUyuoXTzMyzcevIJE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6018f0e2bfd95207233d4326 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Feb 2021 06:27:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D4F66C43464; Tue,  2 Feb 2021 06:27:45 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 157F0C433C6;
 Tue,  2 Feb 2021 06:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 157F0C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org
Subject: [PATCH] ASoC: qcom: Fix typo error in HDMI regmap config callbacks
Date: Tue,  2 Feb 2021 11:57:27 +0530
Message-Id: <20210202062727.22469-1-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Had a typo in lpass platform driver that resulted in crash
during suspend/resume with an HDMI dongle connected.

The regmap read/write/volatile regesters validation callbacks in lpass-cpu
were using MI2S rdma_channels count instead of hdmi_rdma_channels.

This typo error causing to read registers from the regmap beyond the length
of the mapping created by ioremap().

This fix avoids the need for reducing number hdmi_rdma_channels,
which is done in
commit 7dfe20ee92f6 ("ASoC: qcom: Fix number of HDMI RDMA channels on sc7180").
So reverting the same.

Fixes: 7cb37b7bd0d3c ("ASoC: qcom: Add support for lpass hdmi driver")

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c    | 8 ++++----
 sound/soc/qcom/lpass-sc7180.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index a669202e0001..c642e5f8f28c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -595,7 +595,7 @@ static bool lpass_hdmi_regmap_writeable(struct device *dev, unsigned int reg)
 			return true;
 	}
 
-	for (i = 0; i < v->rdma_channels; ++i) {
+	for (i = 0; i < v->hdmi_rdma_channels; ++i) {
 		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
 			return true;
 		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
@@ -641,7 +641,7 @@ static bool lpass_hdmi_regmap_readable(struct device *dev, unsigned int reg)
 	if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
 		return true;
 
-	for (i = 0; i < v->rdma_channels; ++i) {
+	for (i = 0; i < v->hdmi_rdma_channels; ++i) {
 		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
 			return true;
 		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
@@ -668,7 +668,7 @@ static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
 	if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
 		return true;
 
-	for (i = 0; i < v->rdma_channels; ++i) {
+	for (i = 0; i < v->hdmi_rdma_channels; ++i) {
 		if (reg == LPAIF_HDMI_RDMACURR_REG(v, i))
 			return true;
 	}
@@ -812,7 +812,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 			return PTR_ERR(drvdata->hdmiif);
 
 		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
-					variant->hdmi_rdma_channels);
+					variant->hdmi_rdma_channels - 1);
 		drvdata->hdmiif_map = devm_regmap_init_mmio(dev, drvdata->hdmiif,
 					&lpass_hdmi_regmap_config);
 		if (IS_ERR(drvdata->hdmiif_map)) {
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 735c9dac28f2..8c168d3c589e 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -171,7 +171,7 @@ static struct lpass_variant sc7180_data = {
 	.rdma_channels		= 5,
 	.hdmi_rdma_reg_base		= 0x64000,
 	.hdmi_rdma_reg_stride	= 0x1000,
-	.hdmi_rdma_channels		= 3,
+	.hdmi_rdma_channels		= 4,
 	.dmactl_audif_start	= 1,
 	.wrdma_reg_base		= 0x18000,
 	.wrdma_reg_stride	= 0x1000,
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

