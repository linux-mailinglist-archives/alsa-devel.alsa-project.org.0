Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A47F4229A9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 15:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 139CD1699;
	Tue,  5 Oct 2021 15:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 139CD1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633442288;
	bh=3fkCdsKvBVUzO56Rsno+OPVjZ41jjpuar1vZ7R05iHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ot+FuFXLNuyqqwNRbzPbMp6VzypcTWNYmagY+Kb+4pcTcDmJVLIOrN8beP8PZbL4M
	 GrGvppbmVlsyPpnPduur8DXtVcC1CLElTI14f8wNdD5VCvItnwimy5O9y7ugJTUqmX
	 bik7Q4DmT+6f214OYVsdDMpX5VtBavA1CVX4w9p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F3AF80533;
	Tue,  5 Oct 2021 15:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C649BF80534; Tue,  5 Oct 2021 15:54:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C526F8052D
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 15:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C526F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="qCr/LgO1"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633442071; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ff2yVrfStV5eTd4rqXjo/9I9snoO+ajVI7UxEWq5IU0=;
 b=qCr/LgO17LfScwylZSLNHm47fvpyQfFJ0IMYjX6HyRaUB0Srw+cHXJyPhzRnwhpdEdx8azWz
 Z4TJvTptcKU9OHE1TOaAn+UoQ3Bjn/0aWdz55EL4EHHpVWI1mpGA6uN6krVk5IbTUd09mtyu
 dclbmAUQD5ARGrqxejP7MCRF39Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615c59055f16bce6689c5013 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 13:54:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 59410C14888; Tue,  5 Oct 2021 13:54:12 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BEE8EC41635;
 Tue,  5 Oct 2021 13:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BEE8EC41635
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
Subject: [PATCH v2 9/9] ASoC: qcom: SC7280: Update config for building codec
 dma drivers
Date: Tue,  5 Oct 2021 19:22:54 +0530
Message-Id: <1633441974-15353-10-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633441974-15353-1-git-send-email-srivasam@codeaurora.org>
References: <1633441974-15353-1-git-send-email-srivasam@codeaurora.org>
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

Add configuration for building SC7280 audio codec dma drivers.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/Kconfig  | 13 +++++++++++++
 sound/soc/qcom/Makefile |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index d9ffcb7..2b98ad9 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -20,6 +20,10 @@ config SND_SOC_LPASS_PLATFORM
 	tristate
 	select REGMAP_MMIO
 
+config SND_SOC_LPASS_CDC_DMA
+	tristate
+	select REGMAP_MMIO
+
 config SND_SOC_LPASS_IPQ806X
 	tristate
 	select SND_SOC_LPASS_CPU
@@ -36,6 +40,13 @@ config SND_SOC_LPASS_SC7180
 	select SND_SOC_LPASS_PLATFORM
 	select SND_SOC_LPASS_HDMI
 
+config SND_SOC_LPASS_SC7280
+	tristate
+	select SND_SOC_LPASS_CPU
+	select SND_SOC_LPASS_PLATFORM
+	select SND_SOC_LPASS_HDMI
+	select SND_SOC_LPASS_CDC_DMA
+
 config SND_SOC_STORM
 	tristate "ASoC I2S support for Storm boards"
 	select SND_SOC_LPASS_IPQ806X
@@ -156,7 +167,9 @@ config SND_SOC_SC7280
 	tristate "SoC Machine driver for SC7280 boards"
 	depends on I2C && SOUNDWIRE
 	select SND_SOC_QCOM_COMMON
+	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
+	select SND_SOC_WCD938X
 	select SND_SOC_LPASS_RX_MACRO
 	select SND_SOC_LPASS_TX_MACRO
 	help
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 625aec6..8b7b876 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -1,18 +1,22 @@
 # SPDX-License-Identifier: GPL-2.0
 # Platform
 snd-soc-lpass-cpu-objs := lpass-cpu.o
+snd-soc-lpass-cdc-dma-objs := lpass-cdc-dma.o
 snd-soc-lpass-hdmi-objs := lpass-hdmi.o
 snd-soc-lpass-platform-objs := lpass-platform.o
 snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
 snd-soc-lpass-apq8016-objs := lpass-apq8016.o
 snd-soc-lpass-sc7180-objs := lpass-sc7180.o
+snd-soc-lpass-sc7280-objs := lpass-sc7280.o
 
 obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
+obj-$(CONFIG_SND_SOC_LPASS_CDC_DMA) += snd-soc-lpass-cdc-dma.o
 obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
 obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
 obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
 obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
 obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
+obj-$(CONFIG_SND_SOC_LPASS_SC7280) += snd-soc-lpass-sc7280.o
 
 # Machine
 snd-soc-storm-objs := storm.o
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

