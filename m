Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98531467B0C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 17:11:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C19323CC;
	Fri,  3 Dec 2021 17:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C19323CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638547892;
	bh=In8Ixb92SqHgMZ4aU7ygVD5R4z9SbzD5lzvrUeF6C1A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LV453OE/oyMSOAPFF0AJlJs85IyE31VcD7qqdjwWY+tqxuu+dlhw1Dw1Kh1YlJ0L+
	 XUR7xTujOW1rvHY2VCq5ju5BbnwkfSXf/Xze2FgnBthLlqrMHCBizAsbsDFRz2dVxt
	 WyhSnoM4wog/eG96zfjW9ZFMRgSxa0CQqkhjBGWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C63EF80519;
	Fri,  3 Dec 2021 17:08:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E47F80517; Fri,  3 Dec 2021 17:08:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6705F8050F
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 17:08:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6705F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="eeOakmVL"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638547714; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cB/0yPhmFVZArm9iAjhGmtpBlssNkD7sER6nbCNBUNs=;
 b=eeOakmVL9cUyj1COu9gd2ZQib3Db/oJyYmb/9gKvbgvTmel7eaGm7q+2S6pKZ55JLE24CS5M
 ahbFrRN/MWQtM3mvXtT5Tv7+xz74brO8N5/bq3N0r19fRkhVEmzpvgPoEQfSBWLtF41AEU2m
 Kp3wYf78XwGqm5HkSgF+BpvHcdY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61aa4102db3ac5552acdbc07 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Dec 2021 16:08:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0D3B2C4361C; Fri,  3 Dec 2021 16:08:33 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2906CC43618;
 Fri,  3 Dec 2021 16:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2906CC43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.com
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v8 06/10] ASoC: qcom: Add regmap config support for codec dma
 driver
Date: Fri,  3 Dec 2021 21:37:34 +0530
Message-Id: <1638547658-22032-7-git-send-email-srivasam@codeaurora.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638547658-22032-1-git-send-email-srivasam@codeaurora.com>
References: <1638547658-22032-1-git-send-email-srivasam@codeaurora.com>
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

From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Update regmap configuration for supporting headset playback and
capture and DMIC capture using codec dma interface

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 185 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 3bd9eb3..4fb9669 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -28,6 +28,8 @@
 #define LPASS_CPU_I2S_SD2_3_MASK	GENMASK(3, 2)
 #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
 #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
+#define LPASS_REG_READ 1
+#define LPASS_REG_WRITE 0
 
 /*
  * Channel maps for Quad channel playbacks on MI2S Secondary
@@ -798,6 +800,189 @@ static struct regmap_config lpass_hdmi_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->rxtx_irq_ports; ++i) {
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_RXTX_IRQEN_REG(v, i))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
+		if (reg == LPAIF_CDC_RXTX_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_RXTX_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_RXTX_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_RXTX_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_RXTX_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+	}
+	return false;
+}
+
+static bool lpass_rxtx_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	return __lpass_rxtx_regmap_accessible(dev, reg, LPASS_REG_WRITE);
+}
+
+static bool lpass_rxtx_regmap_readable(struct device *dev, unsigned int reg)
+{
+	return __lpass_rxtx_regmap_accessible(dev, reg, LPASS_REG_READ);
+}
+
+static bool lpass_rxtx_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->rxtx_irq_ports; ++i) {
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_rdma_channels; ++i)
+		if (reg == LPAIF_CDC_RXTX_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+
+	for (i = 0; i < v->rxtx_wrdma_channels; ++i)
+		if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+
+	return false;
+}
+
+static bool __lpass_va_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->va_irq_ports; ++i) {
+		if (reg == LPAIF_VA_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_VA_IRQEN_REG(v, i))
+			return true;
+		if (reg == LPAIF_VA_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->va_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_VA_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_VA_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_VA_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_VA_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_VA_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_VA_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+	}
+	return false;
+}
+
+static bool lpass_va_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	return __lpass_va_regmap_accessible(dev, reg, LPASS_REG_WRITE);
+}
+
+static bool lpass_va_regmap_readable(struct device *dev, unsigned int reg)
+{
+	return __lpass_va_regmap_accessible(dev, reg, LPASS_REG_READ);
+}
+
+static bool lpass_va_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->va_irq_ports; ++i) {
+		if (reg == LPAIF_VA_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_VA_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->va_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_VA_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+	}
+
+	return false;
+}
+
+static struct regmap_config lpass_rxtx_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = lpass_rxtx_regmap_writeable,
+	.readable_reg = lpass_rxtx_regmap_readable,
+	.volatile_reg = lpass_rxtx_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static struct regmap_config lpass_va_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = lpass_va_regmap_writeable,
+	.readable_reg = lpass_va_regmap_readable,
+	.volatile_reg = lpass_va_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
 static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
 						struct device_node *node,
 						const char *name)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

