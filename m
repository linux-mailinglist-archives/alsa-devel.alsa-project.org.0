Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 836253077ED
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 15:24:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D24168C;
	Thu, 28 Jan 2021 15:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D24168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611843874;
	bh=ZVjklnHW6FtA5R4rkHyJdUXonPmtYlDESUb6hu8eOl8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IYsEObxVNkecGPqSjXITovOGbm7kePcL60B+2lNUC68NHLR9FtKUE90ZanTTBNpZw
	 FuFyZoahS3y7li6tgPpwwKTFKy3inuizEgesXwJ5BwPz59DLYgCBuNNM8KMFGMhKBp
	 gLuTcQj7GNt6bd9wkzPEJSC1FwBBGvh9zXVaQTJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82B6FF8051F;
	Thu, 28 Jan 2021 15:20:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E97CAF804CC; Thu, 28 Jan 2021 15:20:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7659F8027B
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 15:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7659F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wjdp2i/e"
Received: by mail-wr1-x436.google.com with SMTP id z6so5523177wrq.10
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 06:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrodypDf8SiV6V+E8i14JMGAydKD3GU3nenXzdoPth4=;
 b=wjdp2i/eL6C15UTm74ubwMLZ0Cf5k1jqDJKwEeJSqE6gYdPokPPTkMQPVY+dVdCr5Z
 2l4WQ1HOi4cIVln46OPkmG4TkgUbIz6xh4826Zewf0ZhFP7BZNAyVd7v9KfGEUR2VDBX
 WhU3jE2hjaNi/P4gKme+1XMc3iFR0DR8PJAx5oO0iRKgL0qTOXOCJvpILy2EW0T0xPb6
 5RPNaGjIeqQ7L0MOh2DPzn0fjJKrzbP2FhQ0LLHPbw5o9GEQMe5bCb3JKHTcoZHplTrd
 tZrkSTjW98unxBdZEK+Xgtn+nQRNQFcXmtZ/jTM5HDdPI29864WWfRcrjMZjmDy0uTS7
 A31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mrodypDf8SiV6V+E8i14JMGAydKD3GU3nenXzdoPth4=;
 b=f87AEe/fC8hSBRllIeM5ry1/0IhRsnLOgplPp/zzlUo8HHlRZhWFW6duz9Zlefl7+k
 DSSyRKso4u1wbRdoKY2HdS4u8YCNEwOrRWgeRlHaVf9sbQvz5SVBgYXQXd3FtfgQ+VKy
 FnAUpKHKn+6IwBHtiNljoBlhAjqbmPjoiUtV6LjbyzYAxQsvnh/fV5yRLUkzynYoHbcf
 jm5cgTa2oFByF9tsZo0yoOW4OFYWfkvFGA8OIgEzSi9fOCRBgI0Y4m1evS3nUWzGxlFf
 gFAH5nuBxoczB85B5gUF1YKv6KGd/7fF+lSTsvMoFue2WuYVD31J/4hsFyGkRO/8cX8f
 otYw==
X-Gm-Message-State: AOAM530GWlxS6zsd8tAiiQywVZLhsgjuKYkikktCag5rjKEnsZiaPbiU
 iviguk0fnEngio0mGgCGShLFvA==
X-Google-Smtp-Source: ABdhPJxSGawMAYdXx2anDPWDoFuVjP754cedSEetMh86eP694Y56g5MlTjIIHtAoY2S32PwKRey+6A==
X-Received: by 2002:a05:6000:41:: with SMTP id
 k1mr16421863wrx.386.1611843602696; 
 Thu, 28 Jan 2021 06:20:02 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d9sm7257096wrq.74.2021.01.28.06.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:20:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 6/7] ASoC: codec: lpass-tx-macro: add support for lpass tx
 macro
Date: Thu, 28 Jan 2021 14:19:28 +0000
Message-Id: <20210128141929.26573-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
References: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
TX macro block which is used for connecting with external
Soundwire TX Codecs like WCD938x.

This patch adds support to the codec part of the TX Macro block

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig          |    5 +
 sound/soc/codecs/Makefile         |    2 +
 sound/soc/codecs/lpass-tx-macro.c | 1196 +++++++++++++++++++++++++++++
 3 files changed, 1203 insertions(+)
 create mode 100644 sound/soc/codecs/lpass-tx-macro.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5dbe2bf2d329..66194ed7e3e2 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -228,6 +228,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
 	imply SND_SOC_LPASS_RX_MACRO
+	imply SND_SOC_LPASS_TX_MACRO
 	imply SND_SOC_WL1273
 	imply SND_SOC_WM0010
 	imply SND_SOC_WM1250_EV1
@@ -1825,4 +1826,8 @@ config SND_SOC_LPASS_RX_MACRO
 	depends on COMMON_CLK
 	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
 
+config SND_SOC_LPASS_TX_MACRO
+	depends on COMMON_CLK
+	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
+
 endmenu
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 045263122761..d068166ed668 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -109,6 +109,7 @@ snd-soc-lochnagar-sc-objs := lochnagar-sc.o
 snd-soc-lpass-wsa-macro-objs := lpass-wsa-macro.o
 snd-soc-lpass-va-macro-objs := lpass-va-macro.o
 snd-soc-lpass-rx-macro-objs := lpass-rx-macro.o
+snd-soc-lpass-tx-macro-objs := lpass-tx-macro.o
 snd-soc-madera-objs := madera.o
 snd-soc-max9759-objs := max9759.o
 snd-soc-max9768-objs := max9768.o
@@ -625,6 +626,7 @@ obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
 obj-$(CONFIG_SND_SOC_LPASS_WSA_MACRO)	+= snd-soc-lpass-wsa-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_VA_MACRO)	+= snd-soc-lpass-va-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_RX_MACRO)	+= snd-soc-lpass-rx-macro.o
+obj-$(CONFIG_SND_SOC_LPASS_TX_MACRO)	+= snd-soc-lpass-tx-macro.o
 
 # Mux
 obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+= snd-soc-simple-mux.o
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
new file mode 100644
index 000000000000..604bd14860a3
--- /dev/null
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -0,0 +1,1196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include <linux/of_clk.h>
+#include <linux/clk-provider.h>
+
+#define CDC_TX_CLK_RST_CTRL_MCLK_CONTROL (0x0000)
+#define CDC_TX_MCLK_EN_MASK		BIT(0)
+#define CDC_TX_MCLK_ENABLE		BIT(0)
+#define CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL (0x0004)
+#define CDC_TX_FS_CNT_CLR_MASK		BIT(1)
+#define CDC_TX_FS_CNT_EN_MASK		BIT(0)
+#define CDC_TX_FS_CNT_ENABLE		BIT(0)
+#define CDC_TX_CLK_RST_CTRL_SWR_CONTROL	(0x0008)
+#define CDC_TX_SWR_RESET_MASK		BIT(1)
+#define CDC_TX_SWR_RESET_ENABLE		BIT(1)
+#define CDC_TX_SWR_CLK_EN_MASK		BIT(0)
+#define CDC_TX_SWR_CLK_ENABLE		BIT(0)
+#define CDC_TX_TOP_CSR_TOP_CFG0		(0x0080)
+#define CDC_TX_TOP_CSR_ANC_CFG		(0x0084)
+#define CDC_TX_TOP_CSR_SWR_CTRL		(0x0088)
+#define CDC_TX_TOP_CSR_FREQ_MCLK	(0x0090)
+#define CDC_TX_TOP_CSR_DEBUG_BUS	(0x0094)
+#define CDC_TX_TOP_CSR_DEBUG_EN		(0x0098)
+#define CDC_TX_TOP_CSR_TX_I2S_CTL	(0x00A4)
+#define CDC_TX_TOP_CSR_I2S_CLK		(0x00A8)
+#define CDC_TX_TOP_CSR_I2S_RESET	(0x00AC)
+#define CDC_TX_TOP_CSR_SWR_DMICn_CTL(n)	(0x00C0 + n * 0x4)
+#define CDC_TX_TOP_CSR_SWR_DMIC0_CTL	(0x00C0)
+#define CDC_TX_SWR_DMIC_CLK_SEL_MASK	GENMASK(3, 1)
+#define CDC_TX_TOP_CSR_SWR_DMIC1_CTL	(0x00C4)
+#define CDC_TX_TOP_CSR_SWR_DMIC2_CTL	(0x00C8)
+#define CDC_TX_TOP_CSR_SWR_DMIC3_CTL	(0x00CC)
+#define CDC_TX_TOP_CSR_SWR_AMIC0_CTL	(0x00D0)
+#define CDC_TX_TOP_CSR_SWR_AMIC1_CTL	(0x00D4)
+#define CDC_TX_INP_MUX_ADC_MUXn_CFG0(n)	(0x0100 + 0x8 * n)
+#define CDC_TX_MACRO_SWR_MIC_MUX_SEL_MASK GENMASK(3, 0)
+#define CDC_TX_INP_MUX_ADC_MUX0_CFG0	(0x0100)
+#define CDC_TX_INP_MUX_ADC_MUXn_CFG1(n)	(0x0104 + 0x8 * n)
+#define CDC_TX_INP_MUX_ADC_MUX0_CFG1	(0x0104)
+#define CDC_TX_INP_MUX_ADC_MUX1_CFG0	(0x0108)
+#define CDC_TX_INP_MUX_ADC_MUX1_CFG1	(0x010C)
+#define CDC_TX_INP_MUX_ADC_MUX2_CFG0	(0x0110)
+#define CDC_TX_INP_MUX_ADC_MUX2_CFG1	(0x0114)
+#define CDC_TX_INP_MUX_ADC_MUX3_CFG0	(0x0118)
+#define CDC_TX_INP_MUX_ADC_MUX3_CFG1	(0x011C)
+#define CDC_TX_INP_MUX_ADC_MUX4_CFG0	(0x0120)
+#define CDC_TX_INP_MUX_ADC_MUX4_CFG1	(0x0124)
+#define CDC_TX_INP_MUX_ADC_MUX5_CFG0	(0x0128)
+#define CDC_TX_INP_MUX_ADC_MUX5_CFG1	(0x012C)
+#define CDC_TX_INP_MUX_ADC_MUX6_CFG0	(0x0130)
+#define CDC_TX_INP_MUX_ADC_MUX6_CFG1	(0x0134)
+#define CDC_TX_INP_MUX_ADC_MUX7_CFG0	(0x0138)
+#define CDC_TX_INP_MUX_ADC_MUX7_CFG1	(0x013C)
+#define CDC_TX_ANC0_CLK_RESET_CTL	(0x0200)
+#define CDC_TX_ANC0_MODE_1_CTL		(0x0204)
+#define CDC_TX_ANC0_MODE_2_CTL		(0x0208)
+#define CDC_TX_ANC0_FF_SHIFT		(0x020C)
+#define CDC_TX_ANC0_FB_SHIFT		(0x0210)
+#define CDC_TX_ANC0_LPF_FF_A_CTL	(0x0214)
+#define CDC_TX_ANC0_LPF_FF_B_CTL	(0x0218)
+#define CDC_TX_ANC0_LPF_FB_CTL		(0x021C)
+#define CDC_TX_ANC0_SMLPF_CTL		(0x0220)
+#define CDC_TX_ANC0_DCFLT_SHIFT_CTL	(0x0224)
+#define CDC_TX_ANC0_IIR_ADAPT_CTL	(0x0228)
+#define CDC_TX_ANC0_IIR_COEFF_1_CTL	(0x022C)
+#define CDC_TX_ANC0_IIR_COEFF_2_CTL	(0x0230)
+#define CDC_TX_ANC0_FF_A_GAIN_CTL	(0x0234)
+#define CDC_TX_ANC0_FF_B_GAIN_CTL	(0x0238)
+#define CDC_TX_ANC0_FB_GAIN_CTL		(0x023C)
+#define CDC_TXn_TX_PATH_CTL(n)		(0x0400 + 0x80 * n)
+#define CDC_TXn_PCM_RATE_MASK		GENMASK(3, 0)
+#define CDC_TXn_PGA_MUTE_MASK		BIT(4)
+#define CDC_TXn_CLK_EN_MASK		BIT(5)
+#define CDC_TX0_TX_PATH_CTL		(0x0400)
+#define CDC_TXn_TX_PATH_CFG0(n)		(0x0404 + 0x80 * n)
+#define CDC_TX0_TX_PATH_CFG0		(0x0404)
+#define CDC_TXn_PH_EN_MASK		BIT(0)
+#define CDC_TXn_ADC_MODE_MASK		GENMASK(2, 1)
+#define CDC_TXn_HPF_CUT_FREQ_MASK	GENMASK(6, 5)
+#define CDC_TXn_ADC_DMIC_SEL_MASK	BIT(7)
+#define CDC_TX0_TX_PATH_CFG1		(0x0408)
+#define CDC_TXn_TX_VOL_CTL(n)		(0x040C + 0x80 * n)
+#define CDC_TX0_TX_VOL_CTL		(0x040C)
+#define CDC_TX0_TX_PATH_SEC0		(0x0410)
+#define CDC_TX0_TX_PATH_SEC1		(0x0414)
+#define CDC_TXn_TX_PATH_SEC2(n)		(0x0418 + 0x80 * n)
+#define CDC_TXn_HPF_F_CHANGE_MASK	 BIT(1)
+#define CDC_TXn_HPF_ZERO_GATE_MASK	 BIT(0)
+#define CDC_TX0_TX_PATH_SEC2		(0x0418)
+#define CDC_TX0_TX_PATH_SEC3		(0x041C)
+#define CDC_TX0_TX_PATH_SEC4		(0x0420)
+#define CDC_TX0_TX_PATH_SEC5		(0x0424)
+#define CDC_TX0_TX_PATH_SEC6		(0x0428)
+#define CDC_TX0_TX_PATH_SEC7		(0x042C)
+#define CDC_TX0_MBHC_CTL_EN_MASK	BIT(6)
+#define CDC_TX1_TX_PATH_CTL		(0x0480)
+#define CDC_TX1_TX_PATH_CFG0		(0x0484)
+#define CDC_TX1_TX_PATH_CFG1		(0x0488)
+#define CDC_TX1_TX_VOL_CTL		(0x048C)
+#define CDC_TX1_TX_PATH_SEC0		(0x0490)
+#define CDC_TX1_TX_PATH_SEC1		(0x0494)
+#define CDC_TX1_TX_PATH_SEC2		(0x0498)
+#define CDC_TX1_TX_PATH_SEC3		(0x049C)
+#define CDC_TX1_TX_PATH_SEC4		(0x04A0)
+#define CDC_TX1_TX_PATH_SEC5		(0x04A4)
+#define CDC_TX1_TX_PATH_SEC6		(0x04A8)
+#define CDC_TX2_TX_PATH_CTL		(0x0500)
+#define CDC_TX2_TX_PATH_CFG0		(0x0504)
+#define CDC_TX2_TX_PATH_CFG1		(0x0508)
+#define CDC_TX2_TX_VOL_CTL		(0x050C)
+#define CDC_TX2_TX_PATH_SEC0		(0x0510)
+#define CDC_TX2_TX_PATH_SEC1		(0x0514)
+#define CDC_TX2_TX_PATH_SEC2		(0x0518)
+#define CDC_TX2_TX_PATH_SEC3		(0x051C)
+#define CDC_TX2_TX_PATH_SEC4		(0x0520)
+#define CDC_TX2_TX_PATH_SEC5		(0x0524)
+#define CDC_TX2_TX_PATH_SEC6		(0x0528)
+#define CDC_TX3_TX_PATH_CTL		(0x0580)
+#define CDC_TX3_TX_PATH_CFG0		(0x0584)
+#define CDC_TX3_TX_PATH_CFG1		(0x0588)
+#define CDC_TX3_TX_VOL_CTL		(0x058C)
+#define CDC_TX3_TX_PATH_SEC0		(0x0590)
+#define CDC_TX3_TX_PATH_SEC1		(0x0594)
+#define CDC_TX3_TX_PATH_SEC2		(0x0598)
+#define CDC_TX3_TX_PATH_SEC3		(0x059C)
+#define CDC_TX3_TX_PATH_SEC4		(0x05A0)
+#define CDC_TX3_TX_PATH_SEC5		(0x05A4)
+#define CDC_TX3_TX_PATH_SEC6		(0x05A8)
+#define CDC_TX4_TX_PATH_CTL		(0x0600)
+#define CDC_TX4_TX_PATH_CFG0		(0x0604)
+#define CDC_TX4_TX_PATH_CFG1		(0x0608)
+#define CDC_TX4_TX_VOL_CTL		(0x060C)
+#define CDC_TX4_TX_PATH_SEC0		(0x0610)
+#define CDC_TX4_TX_PATH_SEC1		(0x0614)
+#define CDC_TX4_TX_PATH_SEC2		(0x0618)
+#define CDC_TX4_TX_PATH_SEC3		(0x061C)
+#define CDC_TX4_TX_PATH_SEC4		(0x0620)
+#define CDC_TX4_TX_PATH_SEC5		(0x0624)
+#define CDC_TX4_TX_PATH_SEC6		(0x0628)
+#define CDC_TX5_TX_PATH_CTL		(0x0680)
+#define CDC_TX5_TX_PATH_CFG0		(0x0684)
+#define CDC_TX5_TX_PATH_CFG1		(0x0688)
+#define CDC_TX5_TX_VOL_CTL		(0x068C)
+#define CDC_TX5_TX_PATH_SEC0		(0x0690)
+#define CDC_TX5_TX_PATH_SEC1		(0x0694)
+#define CDC_TX5_TX_PATH_SEC2		(0x0698)
+#define CDC_TX5_TX_PATH_SEC3		(0x069C)
+#define CDC_TX5_TX_PATH_SEC4		(0x06A0)
+#define CDC_TX5_TX_PATH_SEC5		(0x06A4)
+#define CDC_TX5_TX_PATH_SEC6		(0x06A8)
+#define CDC_TX6_TX_PATH_CTL		(0x0700)
+#define CDC_TX6_TX_PATH_CFG0		(0x0704)
+#define CDC_TX6_TX_PATH_CFG1		(0x0708)
+#define CDC_TX6_TX_VOL_CTL		(0x070C)
+#define CDC_TX6_TX_PATH_SEC0		(0x0710)
+#define CDC_TX6_TX_PATH_SEC1		(0x0714)
+#define CDC_TX6_TX_PATH_SEC2		(0x0718)
+#define CDC_TX6_TX_PATH_SEC3		(0x071C)
+#define CDC_TX6_TX_PATH_SEC4		(0x0720)
+#define CDC_TX6_TX_PATH_SEC5		(0x0724)
+#define CDC_TX6_TX_PATH_SEC6		(0x0728)
+#define CDC_TX7_TX_PATH_CTL		(0x0780)
+#define CDC_TX7_TX_PATH_CFG0		(0x0784)
+#define CDC_TX7_TX_PATH_CFG1		(0x0788)
+#define CDC_TX7_TX_VOL_CTL		(0x078C)
+#define CDC_TX7_TX_PATH_SEC0		(0x0790)
+#define CDC_TX7_TX_PATH_SEC1		(0x0794)
+#define CDC_TX7_TX_PATH_SEC2		(0x0798)
+#define CDC_TX7_TX_PATH_SEC3		(0x079C)
+#define CDC_TX7_TX_PATH_SEC4		(0x07A0)
+#define CDC_TX7_TX_PATH_SEC5		(0x07A4)
+#define CDC_TX7_TX_PATH_SEC6		(0x07A8)
+#define TX_MAX_OFFSET			(0x07A8)
+
+#define TX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
+#define TX_MACRO_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			SNDRV_PCM_FMTBIT_S24_LE |\
+			SNDRV_PCM_FMTBIT_S24_3LE)
+
+#define  CF_MIN_3DB_4HZ			0x0
+#define  CF_MIN_3DB_75HZ		0x1
+#define  CF_MIN_3DB_150HZ		0x2
+#define	TX_ADC_MAX	5
+#define TX_ADC_TO_DMIC(n) ((n - TX_ADC_MAX)/2)
+#define NUM_DECIMATORS 8
+#define TX_NUM_CLKS_MAX	5
+#define TX_MACRO_DMIC_UNMUTE_DELAY_MS	40
+#define TX_MACRO_AMIC_UNMUTE_DELAY_MS	100
+#define TX_MACRO_DMIC_HPF_DELAY_MS	300
+#define TX_MACRO_AMIC_HPF_DELAY_MS	300
+#define MCLK_FREQ		9600000
+
+enum {
+	TX_MACRO_AIF_INVALID = 0,
+	TX_MACRO_AIF1_CAP,
+	TX_MACRO_AIF2_CAP,
+	TX_MACRO_AIF3_CAP,
+	TX_MACRO_MAX_DAIS
+};
+
+enum {
+	TX_MACRO_DEC0,
+	TX_MACRO_DEC1,
+	TX_MACRO_DEC2,
+	TX_MACRO_DEC3,
+	TX_MACRO_DEC4,
+	TX_MACRO_DEC5,
+	TX_MACRO_DEC6,
+	TX_MACRO_DEC7,
+	TX_MACRO_DEC_MAX,
+};
+
+enum {
+	TX_MACRO_CLK_DIV_2,
+	TX_MACRO_CLK_DIV_3,
+	TX_MACRO_CLK_DIV_4,
+	TX_MACRO_CLK_DIV_6,
+	TX_MACRO_CLK_DIV_8,
+	TX_MACRO_CLK_DIV_16,
+};
+
+enum {
+	MSM_DMIC,
+	SWR_MIC,
+	ANC_FB_TUNE1
+};
+
+struct tx_mute_work {
+	struct tx_macro *tx;
+	u32 decimator;
+	struct delayed_work dwork;
+};
+
+struct hpf_work {
+	struct tx_macro *tx;
+	u8 decimator;
+	u8 hpf_cut_off_freq;
+	struct delayed_work dwork;
+};
+
+struct tx_macro {
+	struct device *dev;
+	struct snd_soc_component *component;
+	struct hpf_work tx_hpf_work[NUM_DECIMATORS];
+	struct tx_mute_work tx_mute_dwork[NUM_DECIMATORS];
+	unsigned long active_ch_mask[TX_MACRO_MAX_DAIS];
+	unsigned long active_ch_cnt[TX_MACRO_MAX_DAIS];
+	unsigned long active_decimator[TX_MACRO_MAX_DAIS];
+	struct regmap *regmap;
+	struct clk_bulk_data clks[TX_NUM_CLKS_MAX];
+	struct clk_hw hw;
+	bool dec_active[NUM_DECIMATORS];
+	bool reset_swr;
+	int tx_mclk_users;
+	u16 dmic_clk_div;
+	bool bcs_enable;
+	int dec_mode[NUM_DECIMATORS];
+	bool bcs_clk_en;
+};
+#define to_tx_macro(_hw) container_of(_hw, struct tx_macro, hw)
+
+static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
+
+static const struct reg_default tx_defaults[] = {
+	/* TX Macro */
+	{ CDC_TX_CLK_RST_CTRL_MCLK_CONTROL, 0x00 },
+	{ CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00 },
+	{ CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
+	{ CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
+	{ CDC_TX_TOP_CSR_ANC_CFG, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
+	{ CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
+	{ CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
+	{ CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
+	{ CDC_TX_TOP_CSR_TX_I2S_CTL, 0x0C},
+	{ CDC_TX_TOP_CSR_I2S_CLK, 0x00},
+	{ CDC_TX_TOP_CSR_I2S_RESET, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
+	{ CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX1_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX2_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX2_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX3_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX3_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX4_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX4_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX5_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX5_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX6_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX6_CFG1, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX7_CFG0, 0x00},
+	{ CDC_TX_INP_MUX_ADC_MUX7_CFG1, 0x00},
+	{ CDC_TX_ANC0_CLK_RESET_CTL, 0x00},
+	{ CDC_TX_ANC0_MODE_1_CTL, 0x00},
+	{ CDC_TX_ANC0_MODE_2_CTL, 0x00},
+	{ CDC_TX_ANC0_FF_SHIFT, 0x00},
+	{ CDC_TX_ANC0_FB_SHIFT, 0x00},
+	{ CDC_TX_ANC0_LPF_FF_A_CTL, 0x00},
+	{ CDC_TX_ANC0_LPF_FF_B_CTL, 0x00},
+	{ CDC_TX_ANC0_LPF_FB_CTL, 0x00},
+	{ CDC_TX_ANC0_SMLPF_CTL, 0x00},
+	{ CDC_TX_ANC0_DCFLT_SHIFT_CTL, 0x00},
+	{ CDC_TX_ANC0_IIR_ADAPT_CTL, 0x00},
+	{ CDC_TX_ANC0_IIR_COEFF_1_CTL, 0x00},
+	{ CDC_TX_ANC0_IIR_COEFF_2_CTL, 0x00},
+	{ CDC_TX_ANC0_FF_A_GAIN_CTL, 0x00},
+	{ CDC_TX_ANC0_FF_B_GAIN_CTL, 0x00},
+	{ CDC_TX_ANC0_FB_GAIN_CTL, 0x00},
+	{ CDC_TX0_TX_PATH_CTL, 0x04},
+	{ CDC_TX0_TX_PATH_CFG0, 0x10},
+	{ CDC_TX0_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX0_TX_VOL_CTL, 0x00},
+	{ CDC_TX0_TX_PATH_SEC0, 0x00},
+	{ CDC_TX0_TX_PATH_SEC1, 0x00},
+	{ CDC_TX0_TX_PATH_SEC2, 0x01},
+	{ CDC_TX0_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX0_TX_PATH_SEC4, 0x20},
+	{ CDC_TX0_TX_PATH_SEC5, 0x00},
+	{ CDC_TX0_TX_PATH_SEC6, 0x00},
+	{ CDC_TX0_TX_PATH_SEC7, 0x25},
+	{ CDC_TX1_TX_PATH_CTL, 0x04},
+	{ CDC_TX1_TX_PATH_CFG0, 0x10},
+	{ CDC_TX1_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX1_TX_VOL_CTL, 0x00},
+	{ CDC_TX1_TX_PATH_SEC0, 0x00},
+	{ CDC_TX1_TX_PATH_SEC1, 0x00},
+	{ CDC_TX1_TX_PATH_SEC2, 0x01},
+	{ CDC_TX1_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX1_TX_PATH_SEC4, 0x20},
+	{ CDC_TX1_TX_PATH_SEC5, 0x00},
+	{ CDC_TX1_TX_PATH_SEC6, 0x00},
+	{ CDC_TX2_TX_PATH_CTL, 0x04},
+	{ CDC_TX2_TX_PATH_CFG0, 0x10},
+	{ CDC_TX2_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX2_TX_VOL_CTL, 0x00},
+	{ CDC_TX2_TX_PATH_SEC0, 0x00},
+	{ CDC_TX2_TX_PATH_SEC1, 0x00},
+	{ CDC_TX2_TX_PATH_SEC2, 0x01},
+	{ CDC_TX2_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX2_TX_PATH_SEC4, 0x20},
+	{ CDC_TX2_TX_PATH_SEC5, 0x00},
+	{ CDC_TX2_TX_PATH_SEC6, 0x00},
+	{ CDC_TX3_TX_PATH_CTL, 0x04},
+	{ CDC_TX3_TX_PATH_CFG0, 0x10},
+	{ CDC_TX3_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX3_TX_VOL_CTL, 0x00},
+	{ CDC_TX3_TX_PATH_SEC0, 0x00},
+	{ CDC_TX3_TX_PATH_SEC1, 0x00},
+	{ CDC_TX3_TX_PATH_SEC2, 0x01},
+	{ CDC_TX3_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX3_TX_PATH_SEC4, 0x20},
+	{ CDC_TX3_TX_PATH_SEC5, 0x00},
+	{ CDC_TX3_TX_PATH_SEC6, 0x00},
+	{ CDC_TX4_TX_PATH_CTL, 0x04},
+	{ CDC_TX4_TX_PATH_CFG0, 0x10},
+	{ CDC_TX4_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX4_TX_VOL_CTL, 0x00},
+	{ CDC_TX4_TX_PATH_SEC0, 0x00},
+	{ CDC_TX4_TX_PATH_SEC1, 0x00},
+	{ CDC_TX4_TX_PATH_SEC2, 0x01},
+	{ CDC_TX4_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX4_TX_PATH_SEC4, 0x20},
+	{ CDC_TX4_TX_PATH_SEC5, 0x00},
+	{ CDC_TX4_TX_PATH_SEC6, 0x00},
+	{ CDC_TX5_TX_PATH_CTL, 0x04},
+	{ CDC_TX5_TX_PATH_CFG0, 0x10},
+	{ CDC_TX5_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX5_TX_VOL_CTL, 0x00},
+	{ CDC_TX5_TX_PATH_SEC0, 0x00},
+	{ CDC_TX5_TX_PATH_SEC1, 0x00},
+	{ CDC_TX5_TX_PATH_SEC2, 0x01},
+	{ CDC_TX5_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX5_TX_PATH_SEC4, 0x20},
+	{ CDC_TX5_TX_PATH_SEC5, 0x00},
+	{ CDC_TX5_TX_PATH_SEC6, 0x00},
+	{ CDC_TX6_TX_PATH_CTL, 0x04},
+	{ CDC_TX6_TX_PATH_CFG0, 0x10},
+	{ CDC_TX6_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX6_TX_VOL_CTL, 0x00},
+	{ CDC_TX6_TX_PATH_SEC0, 0x00},
+	{ CDC_TX6_TX_PATH_SEC1, 0x00},
+	{ CDC_TX6_TX_PATH_SEC2, 0x01},
+	{ CDC_TX6_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX6_TX_PATH_SEC4, 0x20},
+	{ CDC_TX6_TX_PATH_SEC5, 0x00},
+	{ CDC_TX6_TX_PATH_SEC6, 0x00},
+	{ CDC_TX7_TX_PATH_CTL, 0x04},
+	{ CDC_TX7_TX_PATH_CFG0, 0x10},
+	{ CDC_TX7_TX_PATH_CFG1, 0x0B},
+	{ CDC_TX7_TX_VOL_CTL, 0x00},
+	{ CDC_TX7_TX_PATH_SEC0, 0x00},
+	{ CDC_TX7_TX_PATH_SEC1, 0x00},
+	{ CDC_TX7_TX_PATH_SEC2, 0x01},
+	{ CDC_TX7_TX_PATH_SEC3, 0x3C},
+	{ CDC_TX7_TX_PATH_SEC4, 0x20},
+	{ CDC_TX7_TX_PATH_SEC5, 0x00},
+	{ CDC_TX7_TX_PATH_SEC6, 0x00},
+};
+
+static bool tx_is_volatile_register(struct device *dev, unsigned int reg)
+{
+	/* Update volatile list for tx/tx macros */
+	switch (reg) {
+	case CDC_TX_TOP_CSR_SWR_DMIC0_CTL:
+	case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
+	case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
+	case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
+		return true;
+	}
+	return false;
+}
+
+static bool tx_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
+	case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
+	case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
+	case CDC_TX_TOP_CSR_TOP_CFG0:
+	case CDC_TX_TOP_CSR_ANC_CFG:
+	case CDC_TX_TOP_CSR_SWR_CTRL:
+	case CDC_TX_TOP_CSR_FREQ_MCLK:
+	case CDC_TX_TOP_CSR_DEBUG_BUS:
+	case CDC_TX_TOP_CSR_DEBUG_EN:
+	case CDC_TX_TOP_CSR_TX_I2S_CTL:
+	case CDC_TX_TOP_CSR_I2S_CLK:
+	case CDC_TX_TOP_CSR_I2S_RESET:
+	case CDC_TX_TOP_CSR_SWR_DMIC0_CTL:
+	case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
+	case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
+	case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
+	case CDC_TX_ANC0_CLK_RESET_CTL:
+	case CDC_TX_ANC0_MODE_1_CTL:
+	case CDC_TX_ANC0_MODE_2_CTL:
+	case CDC_TX_ANC0_FF_SHIFT:
+	case CDC_TX_ANC0_FB_SHIFT:
+	case CDC_TX_ANC0_LPF_FF_A_CTL:
+	case CDC_TX_ANC0_LPF_FF_B_CTL:
+	case CDC_TX_ANC0_LPF_FB_CTL:
+	case CDC_TX_ANC0_SMLPF_CTL:
+	case CDC_TX_ANC0_DCFLT_SHIFT_CTL:
+	case CDC_TX_ANC0_IIR_ADAPT_CTL:
+	case CDC_TX_ANC0_IIR_COEFF_1_CTL:
+	case CDC_TX_ANC0_IIR_COEFF_2_CTL:
+	case CDC_TX_ANC0_FF_A_GAIN_CTL:
+	case CDC_TX_ANC0_FF_B_GAIN_CTL:
+	case CDC_TX_ANC0_FB_GAIN_CTL:
+	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX0_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX1_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX2_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX3_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX4_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX5_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX6_CFG1:
+	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
+	case CDC_TX_INP_MUX_ADC_MUX7_CFG1:
+	case CDC_TX0_TX_PATH_CTL:
+	case CDC_TX0_TX_PATH_CFG0:
+	case CDC_TX0_TX_PATH_CFG1:
+	case CDC_TX0_TX_VOL_CTL:
+	case CDC_TX0_TX_PATH_SEC0:
+	case CDC_TX0_TX_PATH_SEC1:
+	case CDC_TX0_TX_PATH_SEC2:
+	case CDC_TX0_TX_PATH_SEC3:
+	case CDC_TX0_TX_PATH_SEC4:
+	case CDC_TX0_TX_PATH_SEC5:
+	case CDC_TX0_TX_PATH_SEC6:
+	case CDC_TX0_TX_PATH_SEC7:
+	case CDC_TX1_TX_PATH_CTL:
+	case CDC_TX1_TX_PATH_CFG0:
+	case CDC_TX1_TX_PATH_CFG1:
+	case CDC_TX1_TX_VOL_CTL:
+	case CDC_TX1_TX_PATH_SEC0:
+	case CDC_TX1_TX_PATH_SEC1:
+	case CDC_TX1_TX_PATH_SEC2:
+	case CDC_TX1_TX_PATH_SEC3:
+	case CDC_TX1_TX_PATH_SEC4:
+	case CDC_TX1_TX_PATH_SEC5:
+	case CDC_TX1_TX_PATH_SEC6:
+	case CDC_TX2_TX_PATH_CTL:
+	case CDC_TX2_TX_PATH_CFG0:
+	case CDC_TX2_TX_PATH_CFG1:
+	case CDC_TX2_TX_VOL_CTL:
+	case CDC_TX2_TX_PATH_SEC0:
+	case CDC_TX2_TX_PATH_SEC1:
+	case CDC_TX2_TX_PATH_SEC2:
+	case CDC_TX2_TX_PATH_SEC3:
+	case CDC_TX2_TX_PATH_SEC4:
+	case CDC_TX2_TX_PATH_SEC5:
+	case CDC_TX2_TX_PATH_SEC6:
+	case CDC_TX3_TX_PATH_CTL:
+	case CDC_TX3_TX_PATH_CFG0:
+	case CDC_TX3_TX_PATH_CFG1:
+	case CDC_TX3_TX_VOL_CTL:
+	case CDC_TX3_TX_PATH_SEC0:
+	case CDC_TX3_TX_PATH_SEC1:
+	case CDC_TX3_TX_PATH_SEC2:
+	case CDC_TX3_TX_PATH_SEC3:
+	case CDC_TX3_TX_PATH_SEC4:
+	case CDC_TX3_TX_PATH_SEC5:
+	case CDC_TX3_TX_PATH_SEC6:
+	case CDC_TX4_TX_PATH_CTL:
+	case CDC_TX4_TX_PATH_CFG0:
+	case CDC_TX4_TX_PATH_CFG1:
+	case CDC_TX4_TX_VOL_CTL:
+	case CDC_TX4_TX_PATH_SEC0:
+	case CDC_TX4_TX_PATH_SEC1:
+	case CDC_TX4_TX_PATH_SEC2:
+	case CDC_TX4_TX_PATH_SEC3:
+	case CDC_TX4_TX_PATH_SEC4:
+	case CDC_TX4_TX_PATH_SEC5:
+	case CDC_TX4_TX_PATH_SEC6:
+	case CDC_TX5_TX_PATH_CTL:
+	case CDC_TX5_TX_PATH_CFG0:
+	case CDC_TX5_TX_PATH_CFG1:
+	case CDC_TX5_TX_VOL_CTL:
+	case CDC_TX5_TX_PATH_SEC0:
+	case CDC_TX5_TX_PATH_SEC1:
+	case CDC_TX5_TX_PATH_SEC2:
+	case CDC_TX5_TX_PATH_SEC3:
+	case CDC_TX5_TX_PATH_SEC4:
+	case CDC_TX5_TX_PATH_SEC5:
+	case CDC_TX5_TX_PATH_SEC6:
+	case CDC_TX6_TX_PATH_CTL:
+	case CDC_TX6_TX_PATH_CFG0:
+	case CDC_TX6_TX_PATH_CFG1:
+	case CDC_TX6_TX_VOL_CTL:
+	case CDC_TX6_TX_PATH_SEC0:
+	case CDC_TX6_TX_PATH_SEC1:
+	case CDC_TX6_TX_PATH_SEC2:
+	case CDC_TX6_TX_PATH_SEC3:
+	case CDC_TX6_TX_PATH_SEC4:
+	case CDC_TX6_TX_PATH_SEC5:
+	case CDC_TX6_TX_PATH_SEC6:
+	case CDC_TX7_TX_PATH_CTL:
+	case CDC_TX7_TX_PATH_CFG0:
+	case CDC_TX7_TX_PATH_CFG1:
+	case CDC_TX7_TX_VOL_CTL:
+	case CDC_TX7_TX_PATH_SEC0:
+	case CDC_TX7_TX_PATH_SEC1:
+	case CDC_TX7_TX_PATH_SEC2:
+	case CDC_TX7_TX_PATH_SEC3:
+	case CDC_TX7_TX_PATH_SEC4:
+	case CDC_TX7_TX_PATH_SEC5:
+	case CDC_TX7_TX_PATH_SEC6:
+		return true;
+	}
+
+	return false;
+}
+
+static const struct regmap_config tx_regmap_config = {
+	.name = "tx_macro",
+	.reg_bits = 16,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.max_register = TX_MAX_OFFSET,
+	.reg_defaults = tx_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tx_defaults),
+	.writeable_reg = tx_is_rw_register,
+	.volatile_reg = tx_is_volatile_register,
+	.readable_reg = tx_is_rw_register,
+};
+
+static int tx_macro_mclk_enable(struct tx_macro *tx,
+				bool mclk_enable)
+{
+	struct regmap *regmap = tx->regmap;
+
+	if (mclk_enable) {
+		if (tx->tx_mclk_users == 0) {
+			regcache_mark_dirty(regmap);
+			regcache_sync(regmap);
+			/* 9.6MHz MCLK, set value 0x00 if other frequency */
+			regmap_update_bits(regmap, CDC_TX_TOP_CSR_FREQ_MCLK, 0x01, 0x01);
+			regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_MCLK_CONTROL,
+					   CDC_TX_MCLK_EN_MASK,
+					   CDC_TX_MCLK_ENABLE);
+			regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL,
+					   CDC_TX_FS_CNT_EN_MASK,
+					   CDC_TX_FS_CNT_ENABLE);
+		}
+		tx->tx_mclk_users++;
+	} else {
+		if (tx->tx_mclk_users <= 0) {
+			dev_err(tx->dev, "clock already disabled\n");
+			tx->tx_mclk_users = 0;
+			goto exit;
+		}
+		tx->tx_mclk_users--;
+		if (tx->tx_mclk_users == 0) {
+			regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL,
+					   CDC_TX_FS_CNT_EN_MASK, 0x0);
+			regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_MCLK_CONTROL,
+					   CDC_TX_MCLK_EN_MASK, 0x0);
+		}
+	}
+exit:
+	return 0;
+}
+
+static bool is_amic_enabled(struct snd_soc_component *component, int decimator)
+{
+	u16 adc_mux_reg, adc_reg, adc_n;
+
+	adc_mux_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG1(decimator);
+
+	if (snd_soc_component_read(component, adc_mux_reg) & SWR_MIC) {
+		adc_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG0(decimator);
+		adc_n = snd_soc_component_read_field(component, adc_reg,
+					     CDC_TX_MACRO_SWR_MIC_MUX_SEL_MASK);
+		if (adc_n < TX_ADC_MAX)
+			return true;
+	}
+
+	return false;
+}
+
+static void tx_macro_tx_hpf_corner_freq_callback(struct work_struct *work)
+{
+	struct delayed_work *hpf_delayed_work;
+	struct hpf_work *hpf_work;
+	struct tx_macro *tx;
+	struct snd_soc_component *component;
+	u16 dec_cfg_reg, hpf_gate_reg;
+	u8 hpf_cut_off_freq;
+	u16 adc_reg, adc_n;
+
+	hpf_delayed_work = to_delayed_work(work);
+	hpf_work = container_of(hpf_delayed_work, struct hpf_work, dwork);
+	tx = hpf_work->tx;
+	component = tx->component;
+	hpf_cut_off_freq = hpf_work->hpf_cut_off_freq;
+
+	dec_cfg_reg = CDC_TXn_TX_PATH_CFG0(hpf_work->decimator);
+	hpf_gate_reg = CDC_TXn_TX_PATH_SEC2(hpf_work->decimator);
+
+	if (is_amic_enabled(component, hpf_work->decimator)) {
+		adc_reg = CDC_TX_INP_MUX_ADC_MUXn_CFG0(hpf_work->decimator);
+		adc_n = snd_soc_component_read(component, adc_reg) &
+				CDC_TX_MACRO_SWR_MIC_MUX_SEL_MASK;
+		/* analog mic clear TX hold */
+		snd_soc_component_write_field(component,
+				dec_cfg_reg,
+				CDC_TXn_HPF_CUT_FREQ_MASK,
+				hpf_cut_off_freq);
+		snd_soc_component_update_bits(component, hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK |
+					      CDC_TXn_HPF_ZERO_GATE_MASK,
+					      0x02);
+		snd_soc_component_update_bits(component, hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK |
+					      CDC_TXn_HPF_ZERO_GATE_MASK,
+					      0x01);
+	} else {
+		snd_soc_component_write_field(component, dec_cfg_reg,
+					      CDC_TXn_HPF_CUT_FREQ_MASK,
+					      hpf_cut_off_freq);
+		snd_soc_component_write_field(component, hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK, 0x1);
+		/* Minimum 1 clk cycle delay is required as per HW spec */
+		usleep_range(1000, 1010);
+		snd_soc_component_write_field(component, hpf_gate_reg,
+					      CDC_TXn_HPF_F_CHANGE_MASK, 0x0);
+	}
+}
+
+static void tx_macro_mute_update_callback(struct work_struct *work)
+{
+	struct tx_mute_work *tx_mute_dwork;
+	struct snd_soc_component *component;
+	struct tx_macro *tx;
+	struct delayed_work *delayed_work;
+	u8 decimator;
+
+	delayed_work = to_delayed_work(work);
+	tx_mute_dwork = container_of(delayed_work, struct tx_mute_work, dwork);
+	tx = tx_mute_dwork->tx;
+	component = tx->component;
+	decimator = tx_mute_dwork->decimator;
+
+	snd_soc_component_write_field(component, CDC_TXn_TX_PATH_CTL(decimator),
+				      CDC_TXn_PGA_MUTE_MASK, 0x0);
+}
+
+static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+
+	ucontrol->value.integer.value[0] = tx->dec_mode[path];
+
+	return 0;
+}
+
+static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	int value = ucontrol->value.integer.value[0];
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int path = e->shift_l;
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	tx->dec_mode[path] = value;
+
+	return 0;
+}
+
+static int tx_macro_get_bcs(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = tx->bcs_enable;
+
+	return 0;
+}
+
+static int tx_macro_set_bcs(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	int value = ucontrol->value.integer.value[0];
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	tx->bcs_enable = value;
+
+	return 0;
+}
+
+static int tx_macro_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	u32 decimator, sample_rate;
+	int tx_fs_rate;
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
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
+		dev_err(component->dev, "%s: Invalid TX sample rate: %d\n",
+			__func__, params_rate(params));
+		return -EINVAL;
+	}
+
+	for_each_set_bit(decimator, &tx->active_ch_mask[dai->id],
+			 TX_MACRO_DEC_MAX) {
+		if (decimator >= 0) {
+			snd_soc_component_update_bits(component,
+						      CDC_TXn_TX_PATH_CTL(decimator),
+						      CDC_TXn_PCM_RATE_MASK,
+						      tx_fs_rate);
+		} else {
+			dev_err(component->dev,	"%s: ERROR: Invalid decimator: %d\n",
+				__func__, decimator);
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static int tx_macro_get_channel_map(struct snd_soc_dai *dai,
+				    unsigned int *tx_num, unsigned int *tx_slot,
+				    unsigned int *rx_num, unsigned int *rx_slot)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+
+	switch (dai->id) {
+	case TX_MACRO_AIF1_CAP:
+	case TX_MACRO_AIF2_CAP:
+	case TX_MACRO_AIF3_CAP:
+		*tx_slot = tx->active_ch_mask[dai->id];
+		*tx_num = tx->active_ch_cnt[dai->id];
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int tx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
+	u16 decimator;
+
+	decimator = tx->active_decimator[dai->id];
+
+	if (mute)
+		snd_soc_component_write_field(component,
+					      CDC_TXn_TX_PATH_CTL(decimator),
+					      CDC_TXn_PGA_MUTE_MASK, 0x1);
+	else
+		snd_soc_component_update_bits(component,
+					      CDC_TXn_TX_PATH_CTL(decimator),
+					      CDC_TXn_PGA_MUTE_MASK, 0x0);
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops tx_macro_dai_ops = {
+	.hw_params = tx_macro_hw_params,
+	.get_channel_map = tx_macro_get_channel_map,
+	.mute_stream = tx_macro_digital_mute,
+};
+
+static struct snd_soc_dai_driver tx_macro_dai[] = {
+	{
+		.name = "tx_macro_tx1",
+		.id = TX_MACRO_AIF1_CAP,
+		.capture = {
+			.stream_name = "TX_AIF1 Capture",
+			.rates = TX_MACRO_RATES,
+			.formats = TX_MACRO_FORMATS,
+			.rate_max = 192000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 8,
+		},
+		.ops = &tx_macro_dai_ops,
+	},
+	{
+		.name = "tx_macro_tx2",
+		.id = TX_MACRO_AIF2_CAP,
+		.capture = {
+			.stream_name = "TX_AIF2 Capture",
+			.rates = TX_MACRO_RATES,
+			.formats = TX_MACRO_FORMATS,
+			.rate_max = 192000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 8,
+		},
+		.ops = &tx_macro_dai_ops,
+	},
+	{
+		.name = "tx_macro_tx3",
+		.id = TX_MACRO_AIF3_CAP,
+		.capture = {
+			.stream_name = "TX_AIF3 Capture",
+			.rates = TX_MACRO_RATES,
+			.formats = TX_MACRO_FORMATS,
+			.rate_max = 192000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 8,
+		},
+		.ops = &tx_macro_dai_ops,
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
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 4, ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 5, ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 6, ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 7, ARRAY_SIZE(dec_mode_mux_text),
+			dec_mode_mux_text),
+};
+
+static const struct snd_kcontrol_new tx_macro_snd_controls[] = {
+	SOC_SINGLE_S8_TLV("TX_DEC0 Volume",
+			  CDC_TX0_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("TX_DEC1 Volume",
+			  CDC_TX1_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("TX_DEC2 Volume",
+			  CDC_TX2_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("TX_DEC3 Volume",
+			  CDC_TX3_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("TX_DEC4 Volume",
+			  CDC_TX4_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("TX_DEC5 Volume",
+			  CDC_TX5_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("TX_DEC6 Volume",
+			  CDC_TX6_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("TX_DEC7 Volume",
+			  CDC_TX7_TX_VOL_CTL,
+			  -84, 40, digital_gain),
+
+	SOC_ENUM_EXT("DEC0 MODE", dec_mode_mux_enum[0],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_ENUM_EXT("DEC1 MODE", dec_mode_mux_enum[1],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_ENUM_EXT("DEC2 MODE", dec_mode_mux_enum[2],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_ENUM_EXT("DEC3 MODE", dec_mode_mux_enum[3],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_ENUM_EXT("DEC4 MODE", dec_mode_mux_enum[4],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_ENUM_EXT("DEC5 MODE", dec_mode_mux_enum[5],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_ENUM_EXT("DEC6 MODE", dec_mode_mux_enum[6],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_ENUM_EXT("DEC7 MODE", dec_mode_mux_enum[7],
+			tx_macro_dec_mode_get, tx_macro_dec_mode_put),
+
+	SOC_SINGLE_EXT("DEC0_BCS Switch", SND_SOC_NOPM, 0, 1, 0,
+		       tx_macro_get_bcs, tx_macro_set_bcs),
+};
+
+static int tx_macro_swrm_clock(void *handle, bool enable)
+{
+	struct tx_macro *tx = (struct tx_macro *) handle;
+	struct regmap *regmap = tx->regmap;
+
+	if (enable) {
+		tx_macro_mclk_enable(tx, true);
+		if (tx->reset_swr)
+			regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+					   CDC_TX_SWR_RESET_MASK,
+					   CDC_TX_SWR_RESET_ENABLE);
+		regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_TX_SWR_CLK_EN_MASK,
+				   CDC_TX_SWR_CLK_ENABLE);
+		if (tx->reset_swr)
+			regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+					   CDC_TX_SWR_RESET_MASK, 0x0);
+		tx->reset_swr = false;
+	} else {
+		regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_TX_SWR_CLK_EN_MASK, 0x0);
+
+		tx_macro_mclk_enable(tx, false);
+	}
+	return 0;
+}
+
+static int tx_macro_component_probe(struct snd_soc_component *comp)
+{
+	struct tx_macro *tx = snd_soc_component_get_drvdata(comp);
+	int i;
+
+	snd_soc_component_init_regmap(comp, tx->regmap);
+
+	for (i = 0; i < NUM_DECIMATORS; i++) {
+		tx->tx_hpf_work[i].tx = tx;
+		tx->tx_hpf_work[i].decimator = i;
+		INIT_DELAYED_WORK(&tx->tx_hpf_work[i].dwork,
+			tx_macro_tx_hpf_corner_freq_callback);
+	}
+
+	for (i = 0; i < NUM_DECIMATORS; i++) {
+		tx->tx_mute_dwork[i].tx = tx;
+		tx->tx_mute_dwork[i].decimator = i;
+		INIT_DELAYED_WORK(&tx->tx_mute_dwork[i].dwork,
+			  tx_macro_mute_update_callback);
+	}
+	tx->component = comp;
+
+	snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
+				      0x0A);
+
+	return 0;
+}
+
+static int swclk_gate_enable(struct clk_hw *hw)
+{
+	return tx_macro_swrm_clock(to_tx_macro(hw), true);
+}
+
+static void swclk_gate_disable(struct clk_hw *hw)
+{
+	tx_macro_swrm_clock(to_tx_macro(hw), false);
+}
+
+static int swclk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct tx_macro *tx = to_tx_macro(hw);
+	int ret, val;
+
+	regmap_read(tx->regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL, &val);
+	ret = val & BIT(0);
+
+	return ret;
+}
+
+static unsigned long swclk_recalc_rate(struct clk_hw *hw,
+				       unsigned long parent_rate)
+{
+	return parent_rate / 2;
+}
+
+static const struct clk_ops swclk_gate_ops = {
+	.prepare = swclk_gate_enable,
+	.unprepare = swclk_gate_disable,
+	.is_enabled = swclk_gate_is_enabled,
+	.recalc_rate = swclk_recalc_rate,
+
+};
+
+static struct clk *tx_macro_register_mclk_output(struct tx_macro *tx)
+{
+	struct device *dev = tx->dev;
+	struct device_node *np = dev->of_node;
+	const char *parent_clk_name = NULL;
+	const char *clk_name = "lpass-tx-mclk";
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	parent_clk_name = __clk_get_name(tx->clks[2].clk);
+
+	init.name = clk_name;
+	init.ops = &swclk_gate_ops;
+	init.flags = 0;
+	init.parent_names = &parent_clk_name;
+	init.num_parents = 1;
+	tx->hw.init = &init;
+	hw = &tx->hw;
+	ret = clk_hw_register(tx->dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
+
+	return NULL;
+}
+
+static const struct snd_soc_component_driver tx_macro_component_drv = {
+	.name = "RX-MACRO",
+	.probe = tx_macro_component_probe,
+	.controls = tx_macro_snd_controls,
+	.num_controls = ARRAY_SIZE(tx_macro_snd_controls),
+};
+
+static int tx_macro_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tx_macro *tx;
+	void __iomem *base;
+	int ret;
+
+	tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
+	if (!tx)
+		return -ENOMEM;
+
+	tx->clks[0].id = "macro";
+	tx->clks[1].id = "dcodec";
+	tx->clks[2].id = "mclk";
+	tx->clks[3].id = "npl";
+	tx->clks[4].id = "fsgen";
+
+	ret = devm_clk_bulk_get(dev, TX_NUM_CLKS_MAX, tx->clks);
+	if (ret) {
+		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
+		return ret;
+	}
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	tx->regmap = devm_regmap_init_mmio(dev, base, &tx_regmap_config);
+
+	dev_set_drvdata(dev, tx);
+
+	tx->reset_swr = true;
+	tx->dev = dev;
+
+	/* set MCLK and NPL rates */
+	clk_set_rate(tx->clks[2].clk, MCLK_FREQ);
+	clk_set_rate(tx->clks[3].clk, MCLK_FREQ);
+
+	ret = clk_bulk_prepare_enable(TX_NUM_CLKS_MAX, tx->clks);
+	if (ret)
+		return ret;
+
+	tx_macro_register_mclk_output(tx);
+
+	ret = devm_snd_soc_register_component(dev, &tx_macro_component_drv,
+					      tx_macro_dai,
+					      ARRAY_SIZE(tx_macro_dai));
+	if (ret)
+		goto err;
+	return ret;
+err:
+	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+
+	return ret;
+}
+
+static int tx_macro_remove(struct platform_device *pdev)
+{
+	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+
+	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+
+	return 0;
+}
+
+static const struct of_device_id tx_macro_dt_match[] = {
+	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
+	{ }
+};
+static struct platform_driver tx_macro_driver = {
+	.driver = {
+		.name = "tx_macro",
+		.of_match_table = tx_macro_dt_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = tx_macro_probe,
+	.remove = tx_macro_remove,
+};
+
+module_platform_driver(tx_macro_driver);
+
+MODULE_DESCRIPTION("TX macro driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

