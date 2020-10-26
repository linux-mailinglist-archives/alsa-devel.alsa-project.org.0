Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E6298F23
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:22:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4450D16E1;
	Mon, 26 Oct 2020 15:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4450D16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603722161;
	bh=QF9UHmNFkFmNO5IcHH3SyL1L0r6OfO7SBmGyyWIewgM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CT83FXy3pnRauuUp1dFY7PVh2FhadkiSfAEFrOHS5UN5PKUYtDZZND9NwvxwDqYG+
	 0mh/j6Z1Ju8z9nzf3aiWgM6LEqOg+DAiYYYMH67y4wva9oVSFNtwSWFJtDS/AvxrX/
	 9b/B6B+oNFeVneecdNo/MnZjazUeAnLQGOeSOTIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAF2F8025E;
	Mon, 26 Oct 2020 15:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B79EF804B4; Mon, 26 Oct 2020 15:20:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66EB5F801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66EB5F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qY0GCMfU"
Received: by mail-wm1-x341.google.com with SMTP id k18so12632797wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kHHiOoDi9vI1rn5f2KGCbxNdUBPyafx6ZEtfm5ehJ4s=;
 b=qY0GCMfUuFpbXSSlmTFebfDTo2SZQzocaX7wgXECFSwjVKmqztqpFI1DtHAMf1bPOp
 vbnM4OeR27ndbDFHfv97PscScaYcEVwmppb4Gjlb1ynuCrBCzpRZvi+kWVE6xHjOnWuF
 h0/GVwUKZsSRG5wREsN/oaEL5qJtnlUd5Uc7/aDY+K/lY3FAjZuAnexLbt9SWbHo5Pkr
 Urpx+szt/ThR2ba6DkXX8rxFPex/I8CF8IZQqikfU1QVfU9C0vjo1ei42Y859hOMPU2F
 hIjUsTiZHb7/Iz+csCBQ69Bdhr+9APcHBQ0Ea+ulIu8aAsF9Pf8XN4qC0JNlsIXbE428
 zTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kHHiOoDi9vI1rn5f2KGCbxNdUBPyafx6ZEtfm5ehJ4s=;
 b=XCB0tf3oksE9JEPddBB8+CwBJ9f9i0DMLW2NTEMnE0xInfzjd4wa1d75gcFJHg2gl0
 bXZm0joSxDLIT5LvV+LY5Z65eFUOXquNVk8zPA3N9nHENwAkYT4C3DHnpTiAXR7tZQc+
 GkC7kRtYGK730siwzyceZYmfoz4jmE544SW21N6xoPCvHpBoiK4WO5Jscwdp7AHQe2Q1
 TD/4gujWqNTpNxzoXc1uDI4j9pFmeGJIDBGyrCwk5GHOi5rqM8adCUKnxmo0Ox0nPG9W
 SeX7yJLM3DW2OgIKCql4lCttu4+QdOCRkxERskGB/vup2OewWsRTFmrKSJb4X0LtUy6O
 ipFQ==
X-Gm-Message-State: AOAM531msEsrLW/yrTpiLu5+QJCj1vGvGC/a6imCJRDGG+ksvk+gAZQU
 9VU5Stc7JWnUJD4xv+XWERbb9A==
X-Google-Smtp-Source: ABdhPJxnaPS17WMSxZ7tYNWffniQAHzaKLbUvoVuwK90vi/UkXrw4FIYZhMO1Ywf6vzHvV9B9wvvJA==
X-Received: by 2002:a05:600c:2241:: with SMTP id
 a1mr17231400wmm.49.1603722000399; 
 Mon, 26 Oct 2020 07:20:00 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g4sm20253333wmh.13.2020.10.26.07.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:19:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v1 5/6] ASoC: codecs: lpass-va-macro: Add support to VA Macro
Date: Mon, 26 Oct 2020 14:19:44 +0000
Message-Id: <20201026141945.19707-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
References: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
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

Qualcomm LPASS (Low Power Audio SubSystem) has internal codec
VA macro block which is used for connecting with DMICs.

This patch adds support to the codec part of the VA Macro block

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig          |   4 +
 sound/soc/codecs/Makefile         |   2 +
 sound/soc/codecs/lpass-va-macro.c | 882 ++++++++++++++++++++++++++++++
 3 files changed, 888 insertions(+)
 create mode 100644 sound/soc/codecs/lpass-va-macro.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 31e2aa1644c3..4e45fb5e9817 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1788,4 +1788,8 @@ config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
 
+config SND_SOC_LPASS_VA_MACRO
+	depends on COMMON_CLK
+	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
+
 endmenu
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 9f24b3daf5df..5d68da2b1182 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -104,6 +104,7 @@ snd-soc-lm4857-objs := lm4857.o
 snd-soc-lm49453-objs := lm49453.o
 snd-soc-lochnagar-sc-objs := lochnagar-sc.o
 snd-soc-lpass-wsa-macro-objs := lpass-wsa-macro.o
+snd-soc-lpass-va-macro-objs := lpass-va-macro.o
 snd-soc-madera-objs := madera.o
 snd-soc-max9759-objs := max9759.o
 snd-soc-max9768-objs := max9768.o
@@ -615,3 +616,4 @@ obj-$(CONFIG_SND_SOC_MAX98504)	+= snd-soc-max98504.o
 obj-$(CONFIG_SND_SOC_SIMPLE_AMPLIFIER)	+= snd-soc-simple-amplifier.o
 obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
 obj-$(CONFIG_SND_SOC_LPASS_WSA_MACRO)	+= snd-soc-lpass-wsa-macro.o
+obj-$(CONFIG_SND_SOC_LPASS_VA_MACRO)	+= snd-soc-lpass-va-macro.o
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
new file mode 100644
index 000000000000..6f1565cf0d01
--- /dev/null
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -0,0 +1,882 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_clk.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+
+/* VA macro registers */
+#define CDC_VA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
+#define CDC_VA_MCLK_CONTROL_EN			BIT(0)
+#define CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0004)
+#define CDC_VA_FS_CONTROL_EN			BIT(0)
+#define CDC_VA_CLK_RST_CTRL_SWR_CONTROL		(0x0008)
+#define CDC_VA_TOP_CSR_TOP_CFG0			(0x0080)
+#define CDC_VA_FS_BROADCAST_EN			BIT(1)
+#define CDC_VA_TOP_CSR_DMIC0_CTL		(0x0084)
+#define CDC_VA_TOP_CSR_DMIC1_CTL		(0x0088)
+#define CDC_VA_TOP_CSR_DMIC2_CTL		(0x008C)
+#define CDC_VA_TOP_CSR_DMIC3_CTL		(0x0090)
+#define CDC_VA_DMIC_CLK_SEL_MASK		GENMASK(3, 1)
+#define CDC_VA_DMIC_CLK_SEL_SHFT		1
+#define CDC_VA_DMIC_CLK_SEL_DIV0		0x0
+#define CDC_VA_DMIC_CLK_SEL_DIV1		0x2
+#define CDC_VA_DMIC_CLK_SEL_DIV2		0x4
+#define CDC_VA_DMIC_CLK_SEL_DIV3		0x6
+#define CDC_VA_DMIC_CLK_SEL_DIV4		0x8
+#define CDC_VA_DMIC_CLK_SEL_DIV5		0xa
+#define CDC_VA_TOP_CSR_DMIC_CFG			(0x0094)
+#define CDC_VA_RESET_ALL_DMICS_MASK		BIT(7)
+#define CDC_VA_RESET_ALL_DMICS_RESET		BIT(7)
+#define CDC_VA_RESET_ALL_DMICS_DISABLE		0
+#define CDC_VA_DMIC3_FREQ_CHANGE_MASK		BIT(3)
+#define CDC_VA_DMIC3_FREQ_CHANGE_EN		BIT(3)
+#define CDC_VA_DMIC2_FREQ_CHANGE_MASK		BIT(2)
+#define CDC_VA_DMIC2_FREQ_CHANGE_EN		BIT(2)
+#define CDC_VA_DMIC1_FREQ_CHANGE_MASK		BIT(1)
+#define CDC_VA_DMIC1_FREQ_CHANGE_EN		BIT(1)
+#define CDC_VA_DMIC0_FREQ_CHANGE_MASK		BIT(0)
+#define CDC_VA_DMIC0_FREQ_CHANGE_EN		BIT(0)
+#define CDC_VA_DMIC_FREQ_CHANGE_DISABLE		0
+#define CDC_VA_TOP_CSR_DEBUG_BUS		(0x009C)
+#define CDC_VA_TOP_CSR_DEBUG_EN			(0x00A0)
+#define CDC_VA_TOP_CSR_TX_I2S_CTL		(0x00A4)
+#define CDC_VA_TOP_CSR_I2S_CLK			(0x00A8)
+#define CDC_VA_TOP_CSR_I2S_RESET		(0x00AC)
+#define CDC_VA_TOP_CSR_CORE_ID_0		(0x00C0)
+#define CDC_VA_TOP_CSR_CORE_ID_1		(0x00C4)
+#define CDC_VA_TOP_CSR_CORE_ID_2		(0x00C8)
+#define CDC_VA_TOP_CSR_CORE_ID_3		(0x00CC)
+#define CDC_VA_TOP_CSR_SWR_MIC_CTL0		(0x00D0)
+#define CDC_VA_TOP_CSR_SWR_MIC_CTL1		(0x00D4)
+#define CDC_VA_TOP_CSR_SWR_MIC_CTL2		(0x00D8)
+#define CDC_VA_TOP_CSR_SWR_CTRL			(0x00DC)
+#define CDC_VA_INP_MUX_ADC_MUX0_CFG0		(0x0100)
+#define CDC_VA_INP_MUX_ADC_MUX0_CFG1		(0x0104)
+#define CDC_VA_INP_MUX_ADC_MUX1_CFG0		(0x0108)
+#define CDC_VA_INP_MUX_ADC_MUX1_CFG1		(0x010C)
+#define CDC_VA_INP_MUX_ADC_MUX2_CFG0		(0x0110)
+#define CDC_VA_INP_MUX_ADC_MUX2_CFG1		(0x0114)
+#define CDC_VA_INP_MUX_ADC_MUX3_CFG0		(0x0118)
+#define CDC_VA_INP_MUX_ADC_MUX3_CFG1		(0x011C)
+#define CDC_VA_TX0_TX_PATH_CTL			(0x0400)
+#define CDC_VA_TX_PATH_CLK_EN_MASK		BIT(5)
+#define CDC_VA_TX_PATH_CLK_EN			BIT(5)
+#define CDC_VA_TX_PATH_CLK_DISABLE		0
+#define CDC_VA_TX_PATH_PGA_MUTE_EN_MASK		BIT(4)
+#define CDC_VA_TX_PATH_PGA_MUTE_EN		BIT(4)
+#define CDC_VA_TX_PATH_PGA_MUTE_DISABLE		0
+#define CDC_VA_TX0_TX_PATH_CFG0			(0x0404)
+#define CDC_VA_ADC_MODE_MASK			GENMASK(2, 1)
+#define CDC_VA_ADC_MODE_SHIFT			1
+#define  TX_HPF_CUT_OFF_FREQ_MASK		GENMASK(6, 5)
+#define  CF_MIN_3DB_4HZ			0x0
+#define  CF_MIN_3DB_75HZ		0x1
+#define  CF_MIN_3DB_150HZ		0x2
+#define CDC_VA_TX0_TX_PATH_CFG1			(0x0408)
+#define CDC_VA_TX0_TX_VOL_CTL			(0x040C)
+#define CDC_VA_TX0_TX_PATH_SEC0			(0x0410)
+#define CDC_VA_TX0_TX_PATH_SEC1			(0x0414)
+#define CDC_VA_TX0_TX_PATH_SEC2			(0x0418)
+#define CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_MASK	BIT(1)
+#define CDC_VA_TX_HPF_CUTOFF_FREQ_CHANGE_REQ	BIT(1)
+#define CDC_VA_TX_HPF_ZERO_GATE_MASK		BIT(0)
+#define CDC_VA_TX_HPF_ZERO_NO_GATE		BIT(0)
+#define CDC_VA_TX_HPF_ZERO_GATE			0
+#define CDC_VA_TX0_TX_PATH_SEC3			(0x041C)
+#define CDC_VA_TX0_TX_PATH_SEC4			(0x0420)
+#define CDC_VA_TX0_TX_PATH_SEC5			(0x0424)
+#define CDC_VA_TX0_TX_PATH_SEC6			(0x0428)
+#define CDC_VA_TX0_TX_PATH_SEC7			(0x042C)
+#define CDC_VA_TX1_TX_PATH_CTL			(0x0480)
+#define CDC_VA_TX1_TX_PATH_CFG0			(0x0484)
+#define CDC_VA_TX1_TX_PATH_CFG1			(0x0488)
+#define CDC_VA_TX1_TX_VOL_CTL			(0x048C)
+#define CDC_VA_TX1_TX_PATH_SEC0			(0x0490)
+#define CDC_VA_TX1_TX_PATH_SEC1			(0x0494)
+#define CDC_VA_TX1_TX_PATH_SEC2			(0x0498)
+#define CDC_VA_TX1_TX_PATH_SEC3			(0x049C)
+#define CDC_VA_TX1_TX_PATH_SEC4			(0x04A0)
+#define CDC_VA_TX1_TX_PATH_SEC5			(0x04A4)
+#define CDC_VA_TX1_TX_PATH_SEC6			(0x04A8)
+#define CDC_VA_TX2_TX_PATH_CTL			(0x0500)
+#define CDC_VA_TX2_TX_PATH_CFG0			(0x0504)
+#define CDC_VA_TX2_TX_PATH_CFG1			(0x0508)
+#define CDC_VA_TX2_TX_VOL_CTL			(0x050C)
+#define CDC_VA_TX2_TX_PATH_SEC0			(0x0510)
+#define CDC_VA_TX2_TX_PATH_SEC1			(0x0514)
+#define CDC_VA_TX2_TX_PATH_SEC2			(0x0518)
+#define CDC_VA_TX2_TX_PATH_SEC3			(0x051C)
+#define CDC_VA_TX2_TX_PATH_SEC4			(0x0520)
+#define CDC_VA_TX2_TX_PATH_SEC5			(0x0524)
+#define CDC_VA_TX2_TX_PATH_SEC6			(0x0528)
+#define CDC_VA_TX3_TX_PATH_CTL			(0x0580)
+#define CDC_VA_TX3_TX_PATH_CFG0			(0x0584)
+#define CDC_VA_TX_PATH_ADC_DMIC_SEL_MASK	BIT(7)
+#define CDC_VA_TX_PATH_ADC_DMIC_SEL_DMIC	BIT(7)
+#define CDC_VA_TX_PATH_ADC_DMIC_SEL_ADC		0
+#define CDC_VA_TX3_TX_PATH_CFG1			(0x0588)
+#define CDC_VA_TX3_TX_VOL_CTL			(0x058C)
+#define CDC_VA_TX3_TX_PATH_SEC0			(0x0590)
+#define CDC_VA_TX3_TX_PATH_SEC1			(0x0594)
+#define CDC_VA_TX3_TX_PATH_SEC2			(0x0598)
+#define CDC_VA_TX3_TX_PATH_SEC3			(0x059C)
+#define CDC_VA_TX3_TX_PATH_SEC4			(0x05A0)
+#define CDC_VA_TX3_TX_PATH_SEC5			(0x05A4)
+#define CDC_VA_TX3_TX_PATH_SEC6			(0x05A8)
+
+#define VA_MAX_OFFSET				(0x07A8)
+
+#define VA_MACRO_NUM_DECIMATORS 4
+#define VA_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
+#define VA_MACRO_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+		SNDRV_PCM_FMTBIT_S24_LE |\
+		SNDRV_PCM_FMTBIT_S24_3LE)
+
+#define VA_MACRO_MCLK_FREQ 9600000
+#define VA_MACRO_TX_PATH_OFFSET 0x80
+#define VA_MACRO_SWR_MIC_MUX_SEL_MASK 0xF
+#define VA_MACRO_ADC_MUX_CFG_OFFSET 0x8
+
+static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
+
+enum {
+	VA_MACRO_AIF_INVALID = 0,
+	VA_MACRO_AIF1_CAP,
+	VA_MACRO_AIF2_CAP,
+	VA_MACRO_AIF3_CAP,
+	VA_MACRO_MAX_DAIS,
+};
+
+enum {
+	VA_MACRO_DEC0,
+	VA_MACRO_DEC1,
+	VA_MACRO_DEC2,
+	VA_MACRO_DEC3,
+	VA_MACRO_DEC4,
+	VA_MACRO_DEC5,
+	VA_MACRO_DEC6,
+	VA_MACRO_DEC7,
+	VA_MACRO_DEC_MAX,
+};
+
+enum {
+	VA_MACRO_CLK_DIV_2,
+	VA_MACRO_CLK_DIV_3,
+	VA_MACRO_CLK_DIV_4,
+	VA_MACRO_CLK_DIV_6,
+	VA_MACRO_CLK_DIV_8,
+	VA_MACRO_CLK_DIV_16,
+};
+
+#define VA_NUM_CLKS_MAX		3
+
+struct va_macro {
+	struct device *dev;
+	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
+	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
+	unsigned long active_decimator[VA_MACRO_MAX_DAIS];
+	u16 dmic_clk_div;
+
+	int dec_mode[VA_MACRO_NUM_DECIMATORS];
+	struct regmap *regmap;
+	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
+	struct clk_hw hw;
+
+	s32 dmic_0_1_clk_cnt;
+	s32 dmic_2_3_clk_cnt;
+	s32 dmic_4_5_clk_cnt;
+	s32 dmic_6_7_clk_cnt;
+	u8 dmic_0_1_clk_div;
+	u8 dmic_2_3_clk_div;
+	u8 dmic_4_5_clk_div;
+	u8 dmic_6_7_clk_div;
+};
+
+#define to_va_macro(_hw) container_of(_hw, struct va_macro, hw)
+
+static bool va_is_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_VA_TOP_CSR_CORE_ID_0:
+	case CDC_VA_TOP_CSR_CORE_ID_1:
+	case CDC_VA_TOP_CSR_CORE_ID_2:
+	case CDC_VA_TOP_CSR_CORE_ID_3:
+	case CDC_VA_TOP_CSR_DMIC0_CTL:
+	case CDC_VA_TOP_CSR_DMIC1_CTL:
+	case CDC_VA_TOP_CSR_DMIC2_CTL:
+	case CDC_VA_TOP_CSR_DMIC3_CTL:
+		return true;
+	}
+	return false;
+}
+
+static const struct reg_default va_defaults[] = {
+	/* VA macro */
+	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
+	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
+	{ CDC_VA_TOP_CSR_TOP_CFG0, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC0_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC1_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC2_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC3_CTL, 0x00},
+	{ CDC_VA_TOP_CSR_DMIC_CFG, 0x80},
+	{ CDC_VA_TOP_CSR_DEBUG_BUS, 0x00},
+	{ CDC_VA_TOP_CSR_DEBUG_EN, 0x00},
+	{ CDC_VA_TOP_CSR_TX_I2S_CTL, 0x0C},
+	{ CDC_VA_TOP_CSR_I2S_CLK, 0x00},
+	{ CDC_VA_TOP_CSR_I2S_RESET, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_0, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_1, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_2, 0x00},
+	{ CDC_VA_TOP_CSR_CORE_ID_3, 0x00},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL0, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL1, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_MIC_CTL2, 0xEE},
+	{ CDC_VA_TOP_CSR_SWR_CTRL, 0x06},
+
+	/* VA core */
+	{ CDC_VA_INP_MUX_ADC_MUX0_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX0_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX1_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX1_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX2_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX2_CFG1, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX3_CFG0, 0x00},
+	{ CDC_VA_INP_MUX_ADC_MUX3_CFG1, 0x00},
+	{ CDC_VA_TX0_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX0_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX0_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX0_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX0_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX0_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX0_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX0_TX_PATH_SEC7, 0x25},
+	{ CDC_VA_TX1_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX1_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX1_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX1_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX1_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX1_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX1_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX1_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX2_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX2_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX2_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX2_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX2_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX2_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX2_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX2_TX_PATH_SEC6, 0x00},
+	{ CDC_VA_TX3_TX_PATH_CTL, 0x04},
+	{ CDC_VA_TX3_TX_PATH_CFG0, 0x10},
+	{ CDC_VA_TX3_TX_PATH_CFG1, 0x0B},
+	{ CDC_VA_TX3_TX_VOL_CTL, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC0, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC1, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC2, 0x01},
+	{ CDC_VA_TX3_TX_PATH_SEC3, 0x3C},
+	{ CDC_VA_TX3_TX_PATH_SEC4, 0x20},
+	{ CDC_VA_TX3_TX_PATH_SEC5, 0x00},
+	{ CDC_VA_TX3_TX_PATH_SEC6, 0x00},
+};
+
+static bool va_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_VA_CLK_RST_CTRL_MCLK_CONTROL:
+	case CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL:
+	case CDC_VA_CLK_RST_CTRL_SWR_CONTROL:
+	case CDC_VA_TOP_CSR_TOP_CFG0:
+	case CDC_VA_TOP_CSR_DMIC0_CTL:
+	case CDC_VA_TOP_CSR_DMIC1_CTL:
+	case CDC_VA_TOP_CSR_DMIC2_CTL:
+	case CDC_VA_TOP_CSR_DMIC3_CTL:
+	case CDC_VA_TOP_CSR_DMIC_CFG:
+	case CDC_VA_TOP_CSR_DEBUG_BUS:
+	case CDC_VA_TOP_CSR_DEBUG_EN:
+	case CDC_VA_TOP_CSR_TX_I2S_CTL:
+	case CDC_VA_TOP_CSR_I2S_CLK:
+	case CDC_VA_TOP_CSR_I2S_RESET:
+	case CDC_VA_INP_MUX_ADC_MUX0_CFG0:
+	case CDC_VA_INP_MUX_ADC_MUX0_CFG1:
+	case CDC_VA_INP_MUX_ADC_MUX1_CFG0:
+	case CDC_VA_INP_MUX_ADC_MUX1_CFG1:
+	case CDC_VA_INP_MUX_ADC_MUX2_CFG0:
+	case CDC_VA_INP_MUX_ADC_MUX2_CFG1:
+	case CDC_VA_INP_MUX_ADC_MUX3_CFG0:
+	case CDC_VA_INP_MUX_ADC_MUX3_CFG1:
+	case CDC_VA_TX0_TX_PATH_CTL:
+	case CDC_VA_TX0_TX_PATH_CFG0:
+	case CDC_VA_TX0_TX_PATH_CFG1:
+	case CDC_VA_TX0_TX_VOL_CTL:
+	case CDC_VA_TX0_TX_PATH_SEC0:
+	case CDC_VA_TX0_TX_PATH_SEC1:
+	case CDC_VA_TX0_TX_PATH_SEC2:
+	case CDC_VA_TX0_TX_PATH_SEC3:
+	case CDC_VA_TX0_TX_PATH_SEC4:
+	case CDC_VA_TX0_TX_PATH_SEC5:
+	case CDC_VA_TX0_TX_PATH_SEC6:
+	case CDC_VA_TX0_TX_PATH_SEC7:
+	case CDC_VA_TX1_TX_PATH_CTL:
+	case CDC_VA_TX1_TX_PATH_CFG0:
+	case CDC_VA_TX1_TX_PATH_CFG1:
+	case CDC_VA_TX1_TX_VOL_CTL:
+	case CDC_VA_TX1_TX_PATH_SEC0:
+	case CDC_VA_TX1_TX_PATH_SEC1:
+	case CDC_VA_TX1_TX_PATH_SEC2:
+	case CDC_VA_TX1_TX_PATH_SEC3:
+	case CDC_VA_TX1_TX_PATH_SEC4:
+	case CDC_VA_TX1_TX_PATH_SEC5:
+	case CDC_VA_TX1_TX_PATH_SEC6:
+	case CDC_VA_TX2_TX_PATH_CTL:
+	case CDC_VA_TX2_TX_PATH_CFG0:
+	case CDC_VA_TX2_TX_PATH_CFG1:
+	case CDC_VA_TX2_TX_VOL_CTL:
+	case CDC_VA_TX2_TX_PATH_SEC0:
+	case CDC_VA_TX2_TX_PATH_SEC1:
+	case CDC_VA_TX2_TX_PATH_SEC2:
+	case CDC_VA_TX2_TX_PATH_SEC3:
+	case CDC_VA_TX2_TX_PATH_SEC4:
+	case CDC_VA_TX2_TX_PATH_SEC5:
+	case CDC_VA_TX2_TX_PATH_SEC6:
+	case CDC_VA_TX3_TX_PATH_CTL:
+	case CDC_VA_TX3_TX_PATH_CFG0:
+	case CDC_VA_TX3_TX_PATH_CFG1:
+	case CDC_VA_TX3_TX_VOL_CTL:
+	case CDC_VA_TX3_TX_PATH_SEC0:
+	case CDC_VA_TX3_TX_PATH_SEC1:
+	case CDC_VA_TX3_TX_PATH_SEC2:
+	case CDC_VA_TX3_TX_PATH_SEC3:
+	case CDC_VA_TX3_TX_PATH_SEC4:
+	case CDC_VA_TX3_TX_PATH_SEC5:
+	case CDC_VA_TX3_TX_PATH_SEC6:
+		return true;
+	}
+
+	return false;
+}
+
+static bool va_is_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_VA_TOP_CSR_CORE_ID_0:
+	case CDC_VA_TOP_CSR_CORE_ID_1:
+	case CDC_VA_TOP_CSR_CORE_ID_2:
+	case CDC_VA_TOP_CSR_CORE_ID_3:
+		return true;
+	}
+
+	return va_is_rw_register(dev, reg);
+}
+
+static const struct regmap_config va_regmap_config = {
+	.name = "va_macro",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = va_defaults,
+	.num_reg_defaults = ARRAY_SIZE(va_defaults),
+	.max_register = VA_MAX_OFFSET,
+	.volatile_reg = va_is_volatile_register,
+	.readable_reg = va_is_readable_register,
+	.writeable_reg = va_is_rw_register,
+};
+
+static int va_clk_rsc_fs_gen_request(struct va_macro *va, bool enable)
+{
+	struct regmap *regmap = va->regmap;
+
+	if (enable) {
+		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
+				   CDC_VA_MCLK_CONTROL_EN,
+				   CDC_VA_MCLK_CONTROL_EN);
+
+		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+				   CDC_VA_FS_CONTROL_EN,
+				   CDC_VA_FS_CONTROL_EN);
+
+		regmap_update_bits(regmap, CDC_VA_TOP_CSR_TOP_CFG0,
+				   CDC_VA_FS_BROADCAST_EN,
+				   CDC_VA_FS_BROADCAST_EN);
+	} else {
+		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_MCLK_CONTROL,
+				   CDC_VA_MCLK_CONTROL_EN, 0x0);
+
+		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
+				   CDC_VA_FS_CONTROL_EN, 0x0);
+
+		regmap_update_bits(regmap, CDC_VA_TOP_CSR_TOP_CFG0,
+				   CDC_VA_FS_BROADCAST_EN, 0x0);
+	}
+
+	return 0;
+}
+
+static int va_macro_mclk_enable(struct va_macro *va, bool mclk_enable)
+{
+	struct regmap *regmap = va->regmap;
+
+	if (mclk_enable) {
+		va_clk_rsc_fs_gen_request(va, true);
+		regcache_mark_dirty(regmap);
+		regcache_sync_region(regmap, 0x0, VA_MAX_OFFSET);
+	} else {
+		va_clk_rsc_fs_gen_request(va, false);
+	}
+
+	return 0;
+}
+
+static int va_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct va_macro *va = snd_soc_component_get_drvdata(comp);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+
+	ucontrol->value.integer.value[0] = va->dec_mode[path];
+
+	return 0;
+}
+
+static int va_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	int value = ucontrol->value.integer.value[0];
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+	struct va_macro *va = snd_soc_component_get_drvdata(comp);
+
+	va->dec_mode[path] = value;
+
+	return 0;
+}
+
+static int va_macro_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *dai)
+{
+	int tx_fs_rate = -EINVAL;
+	struct snd_soc_component *component = dai->component;
+	u32 decimator, sample_rate;
+	u16 tx_fs_reg = 0;
+	struct device *va_dev = component->dev;
+	struct va_macro *va = snd_soc_component_get_drvdata(component);
+
+	sample_rate = params_rate(params);
+	switch (sample_rate) {
+	case 8000:
+		tx_fs_rate = 0;
+		break;
+	case 16000:
+		tx_fs_rate = 1;
+		break;
+	case 32000:
+		tx_fs_rate = 3;
+		break;
+	case 48000:
+		tx_fs_rate = 4;
+		break;
+	case 96000:
+		tx_fs_rate = 5;
+		break;
+	case 192000:
+		tx_fs_rate = 6;
+		break;
+	case 384000:
+		tx_fs_rate = 7;
+		break;
+	default:
+		dev_err(va_dev, "%s: Invalid TX sample rate: %d\n",
+			__func__, params_rate(params));
+		return -EINVAL;
+	}
+
+	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
+			 VA_MACRO_DEC_MAX) {
+		if (decimator >= 0) {
+			tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
+				    VA_MACRO_TX_PATH_OFFSET * decimator;
+			snd_soc_component_update_bits(component, tx_fs_reg,
+						0x0F, tx_fs_rate);
+		} else {
+			dev_err(va_dev,
+				"%s: ERROR: Invalid decimator: %d\n",
+				__func__, decimator);
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static int va_macro_get_channel_map(struct snd_soc_dai *dai,
+				    unsigned int *tx_num, unsigned int *tx_slot,
+				    unsigned int *rx_num, unsigned int *rx_slot)
+{
+	struct snd_soc_component *component = dai->component;
+	struct device *va_dev = component->dev;
+	struct va_macro *va = snd_soc_component_get_drvdata(component);
+
+	switch (dai->id) {
+	case VA_MACRO_AIF1_CAP:
+	case VA_MACRO_AIF2_CAP:
+	case VA_MACRO_AIF3_CAP:
+		*tx_slot = va->active_ch_mask[dai->id];
+		*tx_num = va->active_ch_cnt[dai->id];
+		break;
+	default:
+		dev_err(va_dev, "%s: Invalid AIF\n", __func__);
+		break;
+	}
+	return 0;
+}
+
+static int va_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct va_macro *va = snd_soc_component_get_drvdata(component);
+	u16 tx_vol_ctl_reg, decimator;
+
+	decimator = va->active_decimator[dai->id];
+
+	tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
+				VA_MACRO_TX_PATH_OFFSET * decimator;
+	if (mute)
+		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
+					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
+					      CDC_VA_TX_PATH_PGA_MUTE_EN);
+	else
+		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
+					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
+					      CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops va_macro_dai_ops = {
+	.hw_params = va_macro_hw_params,
+	.get_channel_map = va_macro_get_channel_map,
+	.mute_stream = va_macro_digital_mute,
+};
+
+static struct snd_soc_dai_driver va_macro_dais[] = {
+	{
+		.name = "va_macro_tx1",
+		.id = VA_MACRO_AIF1_CAP,
+		.capture = {
+			.stream_name = "VA_AIF1 Capture",
+			.rates = VA_MACRO_RATES,
+			.formats = VA_MACRO_FORMATS,
+			.rate_max = 192000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 8,
+		},
+		.ops = &va_macro_dai_ops,
+	},
+	{
+		.name = "va_macro_tx2",
+		.id = VA_MACRO_AIF2_CAP,
+		.capture = {
+			.stream_name = "VA_AIF2 Capture",
+			.rates = VA_MACRO_RATES,
+			.formats = VA_MACRO_FORMATS,
+			.rate_max = 192000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 8,
+		},
+		.ops = &va_macro_dai_ops,
+	},
+	{
+		.name = "va_macro_tx3",
+		.id = VA_MACRO_AIF3_CAP,
+		.capture = {
+			.stream_name = "VA_AIF3 Capture",
+			.rates = VA_MACRO_RATES,
+			.formats = VA_MACRO_FORMATS,
+			.rate_max = 192000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 8,
+		},
+		.ops = &va_macro_dai_ops,
+	},
+};
+
+static const char * const dec_mode_mux_text[] = {
+	"ADC_DEFAULT", "ADC_LOW_PWR", "ADC_HIGH_PERF",
+};
+
+static const struct soc_enum dec_mode_mux_enum[] = {
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 1, ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 2,  ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 3, ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+};
+
+static const struct snd_kcontrol_new va_macro_snd_controls[] = {
+	SOC_SINGLE_S8_TLV("VA_DEC0 Volume", CDC_VA_TX0_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("VA_DEC1 Volume", CDC_VA_TX1_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("VA_DEC2 Volume", CDC_VA_TX2_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("VA_DEC3 Volume", CDC_VA_TX3_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+
+	SOC_ENUM_EXT("VA_DEC0 MODE", dec_mode_mux_enum[0],
+		     va_macro_dec_mode_get, va_macro_dec_mode_put),
+	SOC_ENUM_EXT("VA_DEC1 MODE", dec_mode_mux_enum[1],
+		     va_macro_dec_mode_get, va_macro_dec_mode_put),
+	SOC_ENUM_EXT("VA_DEC2 MODE", dec_mode_mux_enum[2],
+		     va_macro_dec_mode_get, va_macro_dec_mode_put),
+	SOC_ENUM_EXT("VA_DEC3 MODE", dec_mode_mux_enum[3],
+		     va_macro_dec_mode_get, va_macro_dec_mode_put),
+};
+
+static int va_macro_component_probe(struct snd_soc_component *component)
+{
+	struct va_macro *va = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, va->regmap);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver va_macro_component_drv = {
+	.name = "VA MACRO",
+	.probe = va_macro_component_probe,
+	.controls = va_macro_snd_controls,
+	.num_controls = ARRAY_SIZE(va_macro_snd_controls),
+};
+
+static int fsgen_gate_enable(struct clk_hw *hw)
+{
+	return va_macro_mclk_enable(to_va_macro(hw), true);
+}
+
+static void fsgen_gate_disable(struct clk_hw *hw)
+{
+	va_macro_mclk_enable(to_va_macro(hw), false);
+}
+
+static int fsgen_gate_is_enabled(struct clk_hw *hw)
+{
+	struct va_macro *va = to_va_macro(hw);
+	int val;
+
+	regmap_read(va->regmap, CDC_VA_TOP_CSR_TOP_CFG0, &val);
+
+	return  !!(val & CDC_VA_FS_BROADCAST_EN);
+}
+
+static const struct clk_ops fsgen_gate_ops = {
+	.prepare = fsgen_gate_enable,
+	.unprepare = fsgen_gate_disable,
+	.is_enabled = fsgen_gate_is_enabled,
+};
+
+static int va_macro_register_fsgen_output(struct va_macro *va)
+{
+	struct clk *parent = va->clks[2].clk;
+	struct device *dev = va->dev;
+	struct device_node *np = dev->of_node;
+	const char *parent_clk_name = NULL;
+	const char *clk_name = "fsgen";
+	struct clk_init_data init;
+	int ret;
+
+	parent_clk_name = __clk_get_name(parent);
+
+	of_property_read_string(np, "clock-output-names", &clk_name);
+
+	init.name = clk_name;
+	init.ops = &fsgen_gate_ops;
+	init.flags = 0;
+	init.parent_names = &parent_clk_name;
+	init.num_parents = 1;
+	va->hw.init = &init;
+	ret = devm_clk_hw_register(va->dev, &va->hw);
+	if (ret)
+		return ret;
+
+	return of_clk_add_provider(np, of_clk_src_simple_get, va->hw.clk);
+}
+
+static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
+					      struct va_macro *va)
+{
+	u32 div_factor;
+	u32 mclk_rate = VA_MACRO_MCLK_FREQ;
+
+	if (!dmic_sample_rate || mclk_rate % dmic_sample_rate != 0)
+		goto undefined_rate;
+
+	div_factor = mclk_rate / dmic_sample_rate;
+
+	switch (div_factor) {
+	case 2:
+		va->dmic_clk_div = VA_MACRO_CLK_DIV_2;
+		break;
+	case 3:
+		va->dmic_clk_div = VA_MACRO_CLK_DIV_3;
+		break;
+	case 4:
+		va->dmic_clk_div = VA_MACRO_CLK_DIV_4;
+		break;
+	case 6:
+		va->dmic_clk_div = VA_MACRO_CLK_DIV_6;
+		break;
+	case 8:
+		va->dmic_clk_div = VA_MACRO_CLK_DIV_8;
+		break;
+	case 16:
+		va->dmic_clk_div = VA_MACRO_CLK_DIV_16;
+		break;
+	default:
+		/* Any other DIV factor is invalid */
+		goto undefined_rate;
+	}
+
+	return dmic_sample_rate;
+
+undefined_rate:
+	dev_err(va->dev, "%s: Invalid rate %d, for mclk %d\n",
+		__func__, dmic_sample_rate, mclk_rate);
+	dmic_sample_rate = 0;
+
+	return dmic_sample_rate;
+}
+
+static int va_macro_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct va_macro *va;
+	void __iomem *base;
+	u32 sample_rate = 0;
+	int ret;
+
+	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
+	if (!va)
+		return -ENOMEM;
+
+	va->dev = dev;
+	va->clks[0].id = "macro";
+	va->clks[1].id = "dcodec";
+	va->clks[2].id = "mclk";
+
+	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
+	if (ret) {
+		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
+		return ret;
+	}
+
+	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
+				   &sample_rate);
+	if (ret) {
+		dev_err(dev, "qcom,dmic-sample-rate dt entry missing\n");
+		va->dmic_clk_div = VA_MACRO_CLK_DIV_2;
+	} else {
+		ret = va_macro_validate_dmic_sample_rate(sample_rate, va);
+		if (!ret)
+			return -EINVAL;
+	}
+
+	/* mclk rate */
+	clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
+	ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
+	if (ret)
+		return ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
+		goto err;
+	}
+
+	va->regmap = devm_regmap_init_mmio(dev, base,  &va_regmap_config);
+	if (IS_ERR(va->regmap)) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	dev_set_drvdata(dev, va);
+	ret = va_macro_register_fsgen_output(va);
+	if (ret)
+		goto err;
+
+	ret = devm_snd_soc_register_component(dev, &va_macro_component_drv,
+					      va_macro_dais,
+					      ARRAY_SIZE(va_macro_dais));
+	if (ret)
+		goto soc_err;
+
+	return ret;
+
+soc_err:
+	of_clk_del_provider(pdev->dev.of_node);
+err:
+	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
+
+	return ret;
+}
+
+static int va_macro_remove(struct platform_device *pdev)
+{
+	struct va_macro *va = dev_get_drvdata(&pdev->dev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
+
+	return 0;
+}
+
+static const struct of_device_id va_macro_dt_match[] = {
+	{ .compatible = "qcom,sm8250-lpass-va-macro" },
+	{}
+};
+
+static struct platform_driver va_macro_driver = {
+	.driver = {
+		.name = "va_macro",
+		.of_match_table = va_macro_dt_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = va_macro_probe,
+	.remove = va_macro_remove,
+};
+
+module_platform_driver(va_macro_driver);
+MODULE_DESCRIPTION("VA macro driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

