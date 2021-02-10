Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E931624E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 10:34:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C12716D3;
	Wed, 10 Feb 2021 10:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C12716D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612949667;
	bh=GkuxPyBJBsi3coDe0RrfEuNbvyRKcDcVIhuGbgJxKqM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmCJIQXk+2jg79Bb1l0S5li+8FC2BAwAvRmHeL6IOprTrG48AwdBfWfqo6Yt501NH
	 yhTqM8+s+wVPQHynXhunozAVr1Eo6wNoBN56dpd534y7SS0yp/CEn+Qih9uEmvCM7G
	 cC5naqG9op/Iaxns/YeT3iKjRacKCcTwiIbBAFrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CF9F802A0;
	Wed, 10 Feb 2021 10:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8942F8027C; Wed, 10 Feb 2021 10:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F288DF80278
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 10:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F288DF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gFNXC0On"
Received: by mail-wr1-x433.google.com with SMTP id h12so1654288wrw.6
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 01:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hd04GY/zon4fqvafgVme9nLDaf591+MEOwuFwP2Cq5M=;
 b=gFNXC0OnHWd7ogdkwj5d4uyOUG0oSuALYPXIigBgboO6j7iFeq7VLS9DnWGLMTOr8J
 Yh7guESuIlpqOwaREd0DaCV//8LxHuWvWDdneHpWCZb6x4xfPCajyoOX4S5kEUQYtZEh
 2RRLrAp1QcHy/PkFNSN3rxmJRKKi8XOSAweo7wtruvq3j5o724vo+EF6SPIBZOuL3CxW
 2JpkNpQ5SadUArcLg6Kijx/j9me586SOK3ZMB4PIGuTFQD6Ck1jp9hHpBPYVsY3LRFL7
 V2tJEHo7X61/f0Pz3O30X1qmr99WHucpNm5ZNnXl0mYsdtrVC/Z6vRv9M2sLsrh6YTe5
 8/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hd04GY/zon4fqvafgVme9nLDaf591+MEOwuFwP2Cq5M=;
 b=dOXH9zL2YOWaYW6Q/QVSnCxoxc1ksa7HYuSmd5XSBubefwkjaznoM7yY2LMi6jwWWX
 rXs7MgBZCMwmBMxVJKsJl+mFSqA+PV1ySqnxUhMRoMpZ639sandDV3Akmx46wuVa/BNy
 xz4iSuNfUoSpejmJZ6SNA26B0OKtYvs1rJ3MMoZlMVR2mw3RezD/oHzgi1jRnHRnCnRu
 GxodlY/C9s2OhOPe6/OAO2CUpgIa3uIQ9t00eehvgZ3iHh3m9HssWoVieUN3JX2Cp+8P
 eYDrdPNro+gmAkCcDwMXz+KgyJddNXy3h09scrCzb7ngm76faMrCo1bEtuWUEqY8w0Tz
 FFQw==
X-Gm-Message-State: AOAM5312Nxy2uqC5KqhE5WmDmIAbxrzxGyaYSpF3UM1coLDPzTDEMtCO
 YWL0xIXRXUsjJQjQRALdKm8NXA==
X-Google-Smtp-Source: ABdhPJwioDoRauo0ZrOwQHIhSVBug+PBYDVPvatqmPzpYt8r5hfTeNVX6Lk18iiR/8aW5ZOs3oE6eQ==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr2567368wrr.199.1612949530692; 
 Wed, 10 Feb 2021 01:32:10 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t2sm2150583wru.53.2021.02.10.01.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 01:32:09 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 2/7] ASoC: codecs: lpass-rx-macro: add support for lpass rx
 macro
Date: Wed, 10 Feb 2021 09:30:50 +0000
Message-Id: <20210210093055.18350-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210210093055.18350-1-srinivas.kandagatla@linaro.org>
References: <20210210093055.18350-1-srinivas.kandagatla@linaro.org>
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

LPASS RX Codec Macro is available in Qualcomm LPASS (Low Power Audio SubSystem).
This is used for connecting with SoundWire devices like WCD938x Codecs to provide
headphone/ear/lineout functionality.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig          |    5 +
 sound/soc/codecs/Makefile         |    2 +
 sound/soc/codecs/lpass-rx-macro.c | 2001 +++++++++++++++++++++++++++++
 3 files changed, 2008 insertions(+)
 create mode 100644 sound/soc/codecs/lpass-rx-macro.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index df34b3b3bb14..e1322d7644d4 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -227,6 +227,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
+	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_WL1273
 	imply SND_SOC_WM0010
 	imply SND_SOC_WM1250_EV1
@@ -1820,4 +1821,8 @@ config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
 
+config SND_SOC_LPASS_RX_MACRO
+	depends on COMMON_CLK
+	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
+
 endmenu
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 628b0c9b3e2a..f63dd83705f1 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -106,6 +106,7 @@ snd-soc-l3-objs := l3.o
 snd-soc-lm4857-objs := lm4857.o
 snd-soc-lm49453-objs := lm49453.o
 snd-soc-lochnagar-sc-objs := lochnagar-sc.o
+snd-soc-lpass-rx-macro-objs := lpass-rx-macro.o
 snd-soc-lpass-wsa-macro-objs := lpass-wsa-macro.o
 snd-soc-lpass-va-macro-objs := lpass-va-macro.o
 snd-soc-madera-objs := madera.o
@@ -623,6 +624,7 @@ obj-$(CONFIG_SND_SOC_SIMPLE_AMPLIFIER)	+= snd-soc-simple-amplifier.o
 obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
 obj-$(CONFIG_SND_SOC_LPASS_WSA_MACRO)	+= snd-soc-lpass-wsa-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_VA_MACRO)	+= snd-soc-lpass-va-macro.o
+obj-$(CONFIG_SND_SOC_LPASS_RX_MACRO)	+= snd-soc-lpass-rx-macro.o
 
 # Mux
 obj-$(CONFIG_SND_SOC_SIMPLE_MUX)	+= snd-soc-simple-mux.o
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
new file mode 100644
index 000000000000..5dd84f09ec0c
--- /dev/null
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -0,0 +1,2001 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+#include <linux/of_clk.h>
+#include <linux/clk-provider.h>
+
+#define CDC_RX_TOP_TOP_CFG0		(0x0000)
+#define CDC_RX_TOP_SWR_CTRL		(0x0008)
+#define CDC_RX_TOP_DEBUG		(0x000C)
+#define CDC_RX_TOP_DEBUG_BUS		(0x0010)
+#define CDC_RX_TOP_DEBUG_EN0		(0x0014)
+#define CDC_RX_TOP_DEBUG_EN1		(0x0018)
+#define CDC_RX_TOP_DEBUG_EN2		(0x001C)
+#define CDC_RX_TOP_HPHL_COMP_WR_LSB	(0x0020)
+#define CDC_RX_TOP_HPHL_COMP_WR_MSB	(0x0024)
+#define CDC_RX_TOP_HPHL_COMP_LUT	(0x0028)
+#define CDC_RX_TOP_HPH_LUT_BYPASS_MASK	BIT(7)
+#define CDC_RX_TOP_HPHL_COMP_RD_LSB	(0x002C)
+#define CDC_RX_TOP_HPHL_COMP_RD_MSB	(0x0030)
+#define CDC_RX_TOP_HPHR_COMP_WR_LSB	(0x0034)
+#define CDC_RX_TOP_HPHR_COMP_WR_MSB	(0x0038)
+#define CDC_RX_TOP_HPHR_COMP_LUT	(0x003C)
+#define CDC_RX_TOP_HPHR_COMP_RD_LSB	(0x0040)
+#define CDC_RX_TOP_HPHR_COMP_RD_MSB	(0x0044)
+#define CDC_RX_TOP_DSD0_DEBUG_CFG0	(0x0070)
+#define CDC_RX_TOP_DSD0_DEBUG_CFG1	(0x0074)
+#define CDC_RX_TOP_DSD0_DEBUG_CFG2	(0x0078)
+#define CDC_RX_TOP_DSD0_DEBUG_CFG3	(0x007C)
+#define CDC_RX_TOP_DSD1_DEBUG_CFG0	(0x0080)
+#define CDC_RX_TOP_DSD1_DEBUG_CFG1	(0x0084)
+#define CDC_RX_TOP_DSD1_DEBUG_CFG2	(0x0088)
+#define CDC_RX_TOP_DSD1_DEBUG_CFG3	(0x008C)
+#define CDC_RX_TOP_RX_I2S_CTL		(0x0090)
+#define CDC_RX_TOP_TX_I2S2_CTL		(0x0094)
+#define CDC_RX_TOP_I2S_CLK		(0x0098)
+#define CDC_RX_TOP_I2S_RESET		(0x009C)
+#define CDC_RX_TOP_I2S_MUX		(0x00A0)
+#define CDC_RX_CLK_RST_CTRL_MCLK_CONTROL	(0x0100)
+#define CDC_RX_CLK_MCLK_EN_MASK		BIT(0)
+#define CDC_RX_CLK_MCLK_ENABLE		BIT(0)
+#define CDC_RX_CLK_MCLK2_EN_MASK	BIT(1)
+#define CDC_RX_CLK_MCLK2_ENABLE		BIT(1)
+#define CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL	(0x0104)
+#define CDC_RX_FS_MCLK_CNT_EN_MASK	BIT(0)
+#define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
+#define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
+#define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
+#define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
+#define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
+#define CDC_RX_SWR_RESET_MASK		BIT(1)
+#define CDC_RX_SWR_RESET		BIT(1)
+#define CDC_RX_SWR_FRAME_SYNC_SEL_MASK	GENMASK(4, 2)
+#define CDC_RX_CLK_RST_CTRL_DSD_CONTROL	(0x010C)
+#define CDC_RX_CLK_RST_CTRL_ASRC_SHARE_CONTROL	(0x0110)
+#define CDC_RX_SOFTCLIP_CRC		(0x0140)
+#define CDC_RX_SOFTCLIP_CLK_EN_MASK	BIT(0)
+#define CDC_RX_SOFTCLIP_SOFTCLIP_CTRL	(0x0144)
+#define CDC_RX_SOFTCLIP_EN_MASK		BIT(0)
+#define CDC_RX_INP_MUX_RX_INT0_CFG0	(0x0180)
+#define CDC_RX_INTX_1_MIX_INP0_SEL_MASK	GENMASK(3, 0)
+#define CDC_RX_INTX_1_MIX_INP1_SEL_MASK	GENMASK(7, 4)
+#define CDC_RX_INP_MUX_RX_INT0_CFG1	(0x0184)
+#define CDC_RX_INTX_2_SEL_MASK		GENMASK(3, 0)
+#define CDC_RX_INTX_1_MIX_INP2_SEL_MASK	GENMASK(7, 4)
+#define CDC_RX_INP_MUX_RX_INT1_CFG0	(0x0188)
+#define CDC_RX_INP_MUX_RX_INT1_CFG1	(0x018C)
+#define CDC_RX_INP_MUX_RX_INT2_CFG0	(0x0190)
+#define CDC_RX_INP_MUX_RX_INT2_CFG1	(0x0194)
+#define CDC_RX_INP_MUX_RX_MIX_CFG4	(0x0198)
+#define CDC_RX_INP_MUX_RX_MIX_CFG5	(0x019C)
+#define CDC_RX_INP_MUX_SIDETONE_SRC_CFG0	(0x01A0)
+#define CDC_RX_CLSH_CRC			(0x0200)
+#define CDC_RX_CLSH_CLK_EN_MASK		BIT(0)
+#define CDC_RX_CLSH_DLY_CTRL		(0x0204)
+#define CDC_RX_CLSH_DECAY_CTRL		(0x0208)
+#define CDC_RX_CLSH_DECAY_RATE_MASK	GENMASK(2, 0)
+#define CDC_RX_CLSH_HPH_V_PA		(0x020C)
+#define CDC_RX_CLSH_HPH_V_PA_MIN_MASK	GENMASK(5, 0)
+#define CDC_RX_CLSH_EAR_V_PA		(0x0210)
+#define CDC_RX_CLSH_HPH_V_HD		(0x0214)
+#define CDC_RX_CLSH_EAR_V_HD		(0x0218)
+#define CDC_RX_CLSH_K1_MSB		(0x021C)
+#define CDC_RX_CLSH_K1_MSB_COEFF_MASK	GENMASK(3, 0)
+#define CDC_RX_CLSH_K1_LSB		(0x0220)
+#define CDC_RX_CLSH_K2_MSB		(0x0224)
+#define CDC_RX_CLSH_K2_LSB		(0x0228)
+#define CDC_RX_CLSH_IDLE_CTRL		(0x022C)
+#define CDC_RX_CLSH_IDLE_HPH		(0x0230)
+#define CDC_RX_CLSH_IDLE_EAR		(0x0234)
+#define CDC_RX_CLSH_TEST0		(0x0238)
+#define CDC_RX_CLSH_TEST1		(0x023C)
+#define CDC_RX_CLSH_OVR_VREF		(0x0240)
+#define CDC_RX_CLSH_CLSG_CTL		(0x0244)
+#define CDC_RX_CLSH_CLSG_CFG1		(0x0248)
+#define CDC_RX_CLSH_CLSG_CFG2		(0x024C)
+#define CDC_RX_BCL_VBAT_PATH_CTL	(0x0280)
+#define CDC_RX_BCL_VBAT_CFG		(0x0284)
+#define CDC_RX_BCL_VBAT_ADC_CAL1	(0x0288)
+#define CDC_RX_BCL_VBAT_ADC_CAL2	(0x028C)
+#define CDC_RX_BCL_VBAT_ADC_CAL3	(0x0290)
+#define CDC_RX_BCL_VBAT_PK_EST1		(0x0294)
+#define CDC_RX_BCL_VBAT_PK_EST2		(0x0298)
+#define CDC_RX_BCL_VBAT_PK_EST3		(0x029C)
+#define CDC_RX_BCL_VBAT_RF_PROC1	(0x02A0)
+#define CDC_RX_BCL_VBAT_RF_PROC2	(0x02A4)
+#define CDC_RX_BCL_VBAT_TAC1		(0x02A8)
+#define CDC_RX_BCL_VBAT_TAC2		(0x02AC)
+#define CDC_RX_BCL_VBAT_TAC3		(0x02B0)
+#define CDC_RX_BCL_VBAT_TAC4		(0x02B4)
+#define CDC_RX_BCL_VBAT_GAIN_UPD1	(0x02B8)
+#define CDC_RX_BCL_VBAT_GAIN_UPD2	(0x02BC)
+#define CDC_RX_BCL_VBAT_GAIN_UPD3	(0x02C0)
+#define CDC_RX_BCL_VBAT_GAIN_UPD4	(0x02C4)
+#define CDC_RX_BCL_VBAT_GAIN_UPD5	(0x02C8)
+#define CDC_RX_BCL_VBAT_DEBUG1		(0x02CC)
+#define CDC_RX_BCL_VBAT_GAIN_UPD_MON	(0x02D0)
+#define CDC_RX_BCL_VBAT_GAIN_MON_VAL	(0x02D4)
+#define CDC_RX_BCL_VBAT_BAN		(0x02D8)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD1	(0x02DC)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD2	(0x02E0)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD3	(0x02E4)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD4	(0x02E8)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD5	(0x02EC)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD6	(0x02F0)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD7	(0x02F4)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD8	(0x02F8)
+#define CDC_RX_BCL_VBAT_BCL_GAIN_UPD9	(0x02FC)
+#define CDC_RX_BCL_VBAT_ATTN1		(0x0300)
+#define CDC_RX_BCL_VBAT_ATTN2		(0x0304)
+#define CDC_RX_BCL_VBAT_ATTN3		(0x0308)
+#define CDC_RX_BCL_VBAT_DECODE_CTL1	(0x030C)
+#define CDC_RX_BCL_VBAT_DECODE_CTL2	(0x0310)
+#define CDC_RX_BCL_VBAT_DECODE_CFG1	(0x0314)
+#define CDC_RX_BCL_VBAT_DECODE_CFG2	(0x0318)
+#define CDC_RX_BCL_VBAT_DECODE_CFG3	(0x031C)
+#define CDC_RX_BCL_VBAT_DECODE_CFG4	(0x0320)
+#define CDC_RX_BCL_VBAT_DECODE_ST	(0x0324)
+#define CDC_RX_INTR_CTRL_CFG		(0x0340)
+#define CDC_RX_INTR_CTRL_CLR_COMMIT	(0x0344)
+#define CDC_RX_INTR_CTRL_PIN1_MASK0	(0x0360)
+#define CDC_RX_INTR_CTRL_PIN1_STATUS0	(0x0368)
+#define CDC_RX_INTR_CTRL_PIN1_CLEAR0	(0x0370)
+#define CDC_RX_INTR_CTRL_PIN2_MASK0	(0x0380)
+#define CDC_RX_INTR_CTRL_PIN2_STATUS0	(0x0388)
+#define CDC_RX_INTR_CTRL_PIN2_CLEAR0	(0x0390)
+#define CDC_RX_INTR_CTRL_LEVEL0		(0x03C0)
+#define CDC_RX_INTR_CTRL_BYPASS0	(0x03C8)
+#define CDC_RX_INTR_CTRL_SET0		(0x03D0)
+#define CDC_RX_RXn_RX_PATH_CTL(n)	(0x0400 + 0x80 * n)
+#define CDC_RX_RX0_RX_PATH_CTL		(0x0400)
+#define CDC_RX_PATH_RESET_EN_MASK	BIT(6)
+#define CDC_RX_PATH_CLK_EN_MASK		BIT(5)
+#define CDC_RX_PATH_CLK_ENABLE		BIT(5)
+#define CDC_RX_PATH_PGA_MUTE_MASK	BIT(4)
+#define CDC_RX_PATH_PGA_MUTE_ENABLE	BIT(4)
+#define CDC_RX_PATH_PCM_RATE_MASK	GENMASK(3, 0)
+#define CDC_RX_RXn_RX_PATH_CFG0(n)	(0x0404 + 0x80 * n)
+#define CDC_RX_RXn_COMP_EN_MASK		BIT(1)
+#define CDC_RX_RX0_RX_PATH_CFG0		(0x0404)
+#define CDC_RX_RXn_CLSH_EN_MASK		BIT(6)
+#define CDC_RX_DLY_ZN_EN_MASK		BIT(3)
+#define CDC_RX_DLY_ZN_ENABLE		BIT(3)
+#define CDC_RX_RXn_HD2_EN_MASK		BIT(2)
+#define CDC_RX_RXn_RX_PATH_CFG1(n)	(0x0408 + 0x80 * n)
+#define CDC_RX_RXn_SIDETONE_EN_MASK	BIT(4)
+#define CDC_RX_RX0_RX_PATH_CFG1		(0x0408)
+#define CDC_RX_RX0_HPH_L_EAR_SEL_MASK	BIT(1)
+#define CDC_RX_RXn_RX_PATH_CFG2(n)	(0x040C + 0x80 * n)
+#define CDC_RX_RXn_HPF_CUT_FREQ_MASK	GENMASK(1, 0)
+#define CDC_RX_RX0_RX_PATH_CFG2		(0x040C)
+#define CDC_RX_RXn_RX_PATH_CFG3(n)	(0x0410 + 0x80 * n)
+#define CDC_RX_RX0_RX_PATH_CFG3		(0x0410)
+#define CDC_RX_DC_COEFF_SEL_MASK	GENMASK(1, 0)
+#define CDC_RX_DC_COEFF_SEL_TWO		0x2
+#define CDC_RX_RXn_RX_VOL_CTL(n)	(0x0414 + 0x80 * n)
+#define CDC_RX_RX0_RX_VOL_CTL		(0x0414)
+#define CDC_RX_RXn_RX_PATH_MIX_CTL(n)	(0x0418 + 0x80 * n)
+#define CDC_RX_RXn_MIX_PCM_RATE_MASK	GENMASK(3, 0)
+#define CDC_RX_RXn_MIX_RESET_MASK	BIT(6)
+#define CDC_RX_RXn_MIX_RESET		BIT(6)
+#define CDC_RX_RXn_MIX_CLK_EN_MASK	BIT(5)
+#define CDC_RX_RXn_MIX_PGA_MUTE_MASK	BIT(4)
+#define CDC_RX_RX0_RX_PATH_MIX_CTL	(0x0418)
+#define CDC_RX_RX0_RX_PATH_MIX_CFG	(0x041C)
+#define CDC_RX_RXn_RX_VOL_MIX_CTL(n)	(0x0420 + 0x80 * n)
+#define CDC_RX_RX0_RX_VOL_MIX_CTL	(0x0420)
+#define CDC_RX_RX0_RX_PATH_SEC1		(0x0424)
+#define CDC_RX_RX0_RX_PATH_SEC2		(0x0428)
+#define CDC_RX_RX0_RX_PATH_SEC3		(0x042C)
+#define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
+#define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
+#define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
+#define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
+#define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
+#define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
+#define CDC_RX_RXn_RX_PATH_DSM_CTL(n)	(0x0440 + 0x80 * n)
+#define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
+#define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
+#define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
+#define CDC_RX_RX0_RX_PATH_DSM_DATA2	(0x0448)
+#define CDC_RX_RX0_RX_PATH_DSM_DATA3	(0x044C)
+#define CDC_RX_RX0_RX_PATH_DSM_DATA4	(0x0450)
+#define CDC_RX_RX0_RX_PATH_DSM_DATA5	(0x0454)
+#define CDC_RX_RX0_RX_PATH_DSM_DATA6	(0x0458)
+#define CDC_RX_RX1_RX_PATH_CTL		(0x0480)
+#define CDC_RX_RX1_RX_PATH_CFG0		(0x0484)
+#define CDC_RX_RX1_RX_PATH_CFG1		(0x0488)
+#define CDC_RX_RX1_RX_PATH_CFG2		(0x048C)
+#define CDC_RX_RX1_RX_PATH_CFG3		(0x0490)
+#define CDC_RX_RX1_RX_VOL_CTL		(0x0494)
+#define CDC_RX_RX1_RX_PATH_MIX_CTL	(0x0498)
+#define CDC_RX_RX1_RX_PATH_MIX_CFG	(0x049C)
+#define CDC_RX_RX1_RX_VOL_MIX_CTL	(0x04A0)
+#define CDC_RX_RX1_RX_PATH_SEC1		(0x04A4)
+#define CDC_RX_RX1_RX_PATH_SEC2		(0x04A8)
+#define CDC_RX_RX1_RX_PATH_SEC3		(0x04AC)
+#define CDC_RX_RXn_HD2_ALPHA_MASK	GENMASK(5, 2)
+#define CDC_RX_RX1_RX_PATH_SEC4		(0x04B0)
+#define CDC_RX_RX1_RX_PATH_SEC7		(0x04B4)
+#define CDC_RX_RX1_RX_PATH_MIX_SEC0	(0x04B8)
+#define CDC_RX_RX1_RX_PATH_MIX_SEC1	(0x04BC)
+#define CDC_RX_RX1_RX_PATH_DSM_CTL	(0x04C0)
+#define CDC_RX_RX1_RX_PATH_DSM_DATA1	(0x04C4)
+#define CDC_RX_RX1_RX_PATH_DSM_DATA2	(0x04C8)
+#define CDC_RX_RX1_RX_PATH_DSM_DATA3	(0x04CC)
+#define CDC_RX_RX1_RX_PATH_DSM_DATA4	(0x04D0)
+#define CDC_RX_RX1_RX_PATH_DSM_DATA5	(0x04D4)
+#define CDC_RX_RX1_RX_PATH_DSM_DATA6	(0x04D8)
+#define CDC_RX_RX2_RX_PATH_CTL		(0x0500)
+#define CDC_RX_RX2_RX_PATH_CFG0		(0x0504)
+#define CDC_RX_RX2_CLSH_EN_MASK		BIT(4)
+#define CDC_RX_RX2_DLY_Z_EN_MASK	BIT(3)
+#define CDC_RX_RX2_RX_PATH_CFG1		(0x0508)
+#define CDC_RX_RX2_RX_PATH_CFG2		(0x050C)
+#define CDC_RX_RX2_RX_PATH_CFG3		(0x0510)
+#define CDC_RX_RX2_RX_VOL_CTL		(0x0514)
+#define CDC_RX_RX2_RX_PATH_MIX_CTL	(0x0518)
+#define CDC_RX_RX2_RX_PATH_MIX_CFG	(0x051C)
+#define CDC_RX_RX2_RX_VOL_MIX_CTL	(0x0520)
+#define CDC_RX_RX2_RX_PATH_SEC0		(0x0524)
+#define CDC_RX_RX2_RX_PATH_SEC1		(0x0528)
+#define CDC_RX_RX2_RX_PATH_SEC2		(0x052C)
+#define CDC_RX_RX2_RX_PATH_SEC3		(0x0530)
+#define CDC_RX_RX2_RX_PATH_SEC4		(0x0534)
+#define CDC_RX_RX2_RX_PATH_SEC5		(0x0538)
+#define CDC_RX_RX2_RX_PATH_SEC6		(0x053C)
+#define CDC_RX_RX2_RX_PATH_SEC7		(0x0540)
+#define CDC_RX_RX2_RX_PATH_MIX_SEC0	(0x0544)
+#define CDC_RX_RX2_RX_PATH_MIX_SEC1	(0x0548)
+#define CDC_RX_RX2_RX_PATH_DSM_CTL	(0x054C)
+#define CDC_RX_IDLE_DETECT_PATH_CTL	(0x0780)
+#define CDC_RX_IDLE_DETECT_CFG0		(0x0784)
+#define CDC_RX_IDLE_DETECT_CFG1		(0x0788)
+#define CDC_RX_IDLE_DETECT_CFG2		(0x078C)
+#define CDC_RX_IDLE_DETECT_CFG3		(0x0790)
+#define CDC_RX_COMPANDERn_CTL0(n)	(0x0800 + 0x40 * n)
+#define CDC_RX_COMPANDERn_CLK_EN_MASK	BIT(0)
+#define CDC_RX_COMPANDERn_SOFT_RST_MASK	BIT(1)
+#define CDC_RX_COMPANDERn_HALT_MASK	BIT(2)
+#define CDC_RX_COMPANDERn_DROPOUT_EN_MASK	BIT(3)
+#define CDC_RX_COMPANDER0_CTL0		(0x0800)
+#define CDC_RX_COMPANDER0_CTL1		(0x0804)
+#define CDC_RX_COMPANDER0_CTL2		(0x0808)
+#define CDC_RX_COMPANDER0_CTL3		(0x080C)
+#define CDC_RX_COMPANDER0_CTL4		(0x0810)
+#define CDC_RX_COMPANDER0_CTL5		(0x0814)
+#define CDC_RX_COMPANDER0_CTL6		(0x0818)
+#define CDC_RX_COMPANDER0_CTL7		(0x081C)
+#define CDC_RX_COMPANDER1_CTL0		(0x0840)
+#define CDC_RX_COMPANDER1_CTL1		(0x0844)
+#define CDC_RX_COMPANDER1_CTL2		(0x0848)
+#define CDC_RX_COMPANDER1_CTL3		(0x084C)
+#define CDC_RX_COMPANDER1_CTL4		(0x0850)
+#define CDC_RX_COMPANDER1_CTL5		(0x0854)
+#define CDC_RX_COMPANDER1_CTL6		(0x0858)
+#define CDC_RX_COMPANDER1_CTL7		(0x085C)
+#define CDC_RX_COMPANDER1_HPH_LOW_PWR_MODE_MASK	BIT(5)
+#define CDC_RX_SIDETONE_IIR0_IIR_PATH_CTL	(0x0A00)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL	(0x0A04)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL	(0x0A08)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL	(0x0A0C)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL	(0x0A10)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B5_CTL	(0x0A14)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B6_CTL	(0x0A18)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B7_CTL	(0x0A1C)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_B8_CTL	(0x0A20)
+#define CDC_RX_SIDETONE_IIR0_IIR_CTL		(0x0A24)
+#define CDC_RX_SIDETONE_IIR0_IIR_GAIN_TIMER_CTL	(0x0A28)
+#define CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL	(0x0A2C)
+#define CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL	(0x0A30)
+#define CDC_RX_SIDETONE_IIR1_IIR_PATH_CTL	(0x0A80)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL	(0x0A84)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL	(0x0A88)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL	(0x0A8C)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL	(0x0A90)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B5_CTL	(0x0A94)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B6_CTL	(0x0A98)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B7_CTL	(0x0A9C)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_B8_CTL	(0x0AA0)
+#define CDC_RX_SIDETONE_IIR1_IIR_CTL		(0x0AA4)
+#define CDC_RX_SIDETONE_IIR1_IIR_GAIN_TIMER_CTL	(0x0AA8)
+#define CDC_RX_SIDETONE_IIR1_IIR_COEF_B1_CTL	(0x0AAC)
+#define CDC_RX_SIDETONE_IIR1_IIR_COEF_B2_CTL	(0x0AB0)
+#define CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG0	(0x0B00)
+#define CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG1	(0x0B04)
+#define CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG2	(0x0B08)
+#define CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG3	(0x0B0C)
+#define CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG0	(0x0B10)
+#define CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG1	(0x0B14)
+#define CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG2	(0x0B18)
+#define CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG3	(0x0B1C)
+#define CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CTL	(0x0B40)
+#define CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CFG1	(0x0B44)
+#define CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CTL	(0x0B50)
+#define CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CFG1	(0x0B54)
+#define CDC_RX_EC_REF_HQ0_EC_REF_HQ_PATH_CTL	(0x0C00)
+#define CDC_RX_EC_REF_HQ0_EC_REF_HQ_CFG0	(0x0C04)
+#define CDC_RX_EC_REF_HQ1_EC_REF_HQ_PATH_CTL	(0x0C40)
+#define CDC_RX_EC_REF_HQ1_EC_REF_HQ_CFG0	(0x0C44)
+#define CDC_RX_EC_REF_HQ2_EC_REF_HQ_PATH_CTL	(0x0C80)
+#define CDC_RX_EC_REF_HQ2_EC_REF_HQ_CFG0	(0x0C84)
+#define CDC_RX_EC_ASRC0_CLK_RST_CTL		(0x0D00)
+#define CDC_RX_EC_ASRC0_CTL0			(0x0D04)
+#define CDC_RX_EC_ASRC0_CTL1			(0x0D08)
+#define CDC_RX_EC_ASRC0_FIFO_CTL		(0x0D0C)
+#define CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_LSB	(0x0D10)
+#define CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_MSB	(0x0D14)
+#define CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_LSB	(0x0D18)
+#define CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_MSB	(0x0D1C)
+#define CDC_RX_EC_ASRC0_STATUS_FIFO		(0x0D20)
+#define CDC_RX_EC_ASRC1_CLK_RST_CTL		(0x0D40)
+#define CDC_RX_EC_ASRC1_CTL0			(0x0D44)
+#define CDC_RX_EC_ASRC1_CTL1			(0x0D48)
+#define CDC_RX_EC_ASRC1_FIFO_CTL		(0x0D4C)
+#define CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_LSB	(0x0D50)
+#define CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_MSB	(0x0D54)
+#define CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_LSB	(0x0D58)
+#define CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_MSB	(0x0D5C)
+#define CDC_RX_EC_ASRC1_STATUS_FIFO		(0x0D60)
+#define CDC_RX_EC_ASRC2_CLK_RST_CTL		(0x0D80)
+#define CDC_RX_EC_ASRC2_CTL0			(0x0D84)
+#define CDC_RX_EC_ASRC2_CTL1			(0x0D88)
+#define CDC_RX_EC_ASRC2_FIFO_CTL		(0x0D8C)
+#define CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_LSB	(0x0D90)
+#define CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_MSB	(0x0D94)
+#define CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_LSB	(0x0D98)
+#define CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_MSB	(0x0D9C)
+#define CDC_RX_EC_ASRC2_STATUS_FIFO		(0x0DA0)
+#define CDC_RX_DSD0_PATH_CTL			(0x0F00)
+#define CDC_RX_DSD0_CFG0			(0x0F04)
+#define CDC_RX_DSD0_CFG1			(0x0F08)
+#define CDC_RX_DSD0_CFG2			(0x0F0C)
+#define CDC_RX_DSD1_PATH_CTL			(0x0F80)
+#define CDC_RX_DSD1_CFG0			(0x0F84)
+#define CDC_RX_DSD1_CFG1			(0x0F88)
+#define CDC_RX_DSD1_CFG2			(0x0F8C)
+#define RX_MAX_OFFSET				(0x0F8C)
+
+#define MCLK_FREQ		9600000
+
+#define RX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
+			SNDRV_PCM_RATE_384000)
+/* Fractional Rates */
+#define RX_MACRO_FRAC_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 |\
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
+
+#define RX_MACRO_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+		SNDRV_PCM_FMTBIT_S24_LE |\
+		SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+#define RX_MACRO_ECHO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			SNDRV_PCM_RATE_48000)
+#define RX_MACRO_ECHO_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+		SNDRV_PCM_FMTBIT_S24_LE |\
+		SNDRV_PCM_FMTBIT_S24_3LE)
+
+#define RX_MACRO_MAX_DMA_CH_PER_PORT 2
+#define RX_MACRO_INTERP_MUX_NUM_INPUTS 3
+#define RX_MACRO_SIDETONE_IIR_COEFF_MAX 5
+
+#define MAX_IMPED_PARAMS 6
+
+#define RX_MACRO_EC_MIX_TX0_MASK 0xf0
+#define RX_MACRO_EC_MIX_TX1_MASK 0x0f
+#define RX_MACRO_EC_MIX_TX2_MASK 0x0f
+
+#define COMP_MAX_COEFF 25
+#define RX_NUM_CLKS_MAX	5
+
+struct comp_coeff_val {
+	u8 lsb;
+	u8 msb;
+};
+
+enum {
+	HPH_ULP,
+	HPH_LOHIFI,
+	HPH_MODE_MAX,
+};
+
+static const struct comp_coeff_val comp_coeff_table[HPH_MODE_MAX][COMP_MAX_COEFF] = {
+	{
+		{0x40, 0x00},
+		{0x4C, 0x00},
+		{0x5A, 0x00},
+		{0x6B, 0x00},
+		{0x7F, 0x00},
+		{0x97, 0x00},
+		{0xB3, 0x00},
+		{0xD5, 0x00},
+		{0xFD, 0x00},
+		{0x2D, 0x01},
+		{0x66, 0x01},
+		{0xA7, 0x01},
+		{0xF8, 0x01},
+		{0x57, 0x02},
+		{0xC7, 0x02},
+		{0x4B, 0x03},
+		{0xE9, 0x03},
+		{0xA3, 0x04},
+		{0x7D, 0x05},
+		{0x90, 0x06},
+		{0xD1, 0x07},
+		{0x49, 0x09},
+		{0x00, 0x0B},
+		{0x01, 0x0D},
+		{0x59, 0x0F},
+	},
+	{
+		{0x40, 0x00},
+		{0x4C, 0x00},
+		{0x5A, 0x00},
+		{0x6B, 0x00},
+		{0x80, 0x00},
+		{0x98, 0x00},
+		{0xB4, 0x00},
+		{0xD5, 0x00},
+		{0xFE, 0x00},
+		{0x2E, 0x01},
+		{0x66, 0x01},
+		{0xA9, 0x01},
+		{0xF8, 0x01},
+		{0x56, 0x02},
+		{0xC4, 0x02},
+		{0x4F, 0x03},
+		{0xF0, 0x03},
+		{0xAE, 0x04},
+		{0x8B, 0x05},
+		{0x8E, 0x06},
+		{0xBC, 0x07},
+		{0x56, 0x09},
+		{0x0F, 0x0B},
+		{0x13, 0x0D},
+		{0x6F, 0x0F},
+	},
+};
+
+struct rx_macro_reg_mask_val {
+	u16 reg;
+	u8 mask;
+	u8 val;
+};
+
+enum {
+	INTERP_HPHL,
+	INTERP_HPHR,
+	INTERP_AUX,
+	INTERP_MAX
+};
+
+enum {
+	RX_MACRO_RX0,
+	RX_MACRO_RX1,
+	RX_MACRO_RX2,
+	RX_MACRO_RX3,
+	RX_MACRO_RX4,
+	RX_MACRO_RX5,
+	RX_MACRO_PORTS_MAX
+};
+
+enum {
+	RX_MACRO_COMP1, /* HPH_L */
+	RX_MACRO_COMP2, /* HPH_R */
+	RX_MACRO_COMP_MAX
+};
+
+enum {
+	RX_MACRO_EC0_MUX = 0,
+	RX_MACRO_EC1_MUX,
+	RX_MACRO_EC2_MUX,
+	RX_MACRO_EC_MUX_MAX,
+};
+
+enum {
+	INTn_1_INP_SEL_ZERO = 0,
+	INTn_1_INP_SEL_DEC0,
+	INTn_1_INP_SEL_DEC1,
+	INTn_1_INP_SEL_IIR0,
+	INTn_1_INP_SEL_IIR1,
+	INTn_1_INP_SEL_RX0,
+	INTn_1_INP_SEL_RX1,
+	INTn_1_INP_SEL_RX2,
+	INTn_1_INP_SEL_RX3,
+	INTn_1_INP_SEL_RX4,
+	INTn_1_INP_SEL_RX5,
+};
+
+enum {
+	INTn_2_INP_SEL_ZERO = 0,
+	INTn_2_INP_SEL_RX0,
+	INTn_2_INP_SEL_RX1,
+	INTn_2_INP_SEL_RX2,
+	INTn_2_INP_SEL_RX3,
+	INTn_2_INP_SEL_RX4,
+	INTn_2_INP_SEL_RX5,
+};
+
+enum {
+	INTERP_MAIN_PATH,
+	INTERP_MIX_PATH,
+};
+
+struct interp_sample_rate {
+	int sample_rate;
+	int rate_val;
+};
+
+static struct interp_sample_rate sr_val_tbl[] = {
+	{8000, 0x0}, {16000, 0x1}, {32000, 0x3}, {48000, 0x4}, {96000, 0x5},
+	{192000, 0x6}, {384000, 0x7}, {44100, 0x9}, {88200, 0xA},
+	{176400, 0xB}, {352800, 0xC},
+};
+
+enum {
+	RX_MACRO_AIF_INVALID = 0,
+	RX_MACRO_AIF1_PB,
+	RX_MACRO_AIF2_PB,
+	RX_MACRO_AIF3_PB,
+	RX_MACRO_AIF4_PB,
+	RX_MACRO_AIF_ECHO,
+	RX_MACRO_MAX_DAIS,
+};
+
+enum {
+	RX_MACRO_AIF1_CAP = 0,
+	RX_MACRO_AIF2_CAP,
+	RX_MACRO_AIF3_CAP,
+	RX_MACRO_MAX_AIF_CAP_DAIS
+};
+
+struct rx_macro {
+	struct device *dev;
+	int comp_enabled[RX_MACRO_COMP_MAX];
+	/* Main path clock users count */
+	int main_clk_users[INTERP_MAX];
+	int rx_port_value[RX_MACRO_PORTS_MAX];
+	u16 prim_int_users[INTERP_MAX];
+	int rx_mclk_users;
+	bool reset_swr;
+	int clsh_users;
+	int rx_mclk_cnt;
+	bool is_ear_mode_on;
+	bool hph_pwr_mode;
+	bool hph_hd2_mode;
+	struct snd_soc_component *component;
+	unsigned long active_ch_mask[RX_MACRO_MAX_DAIS];
+	unsigned long active_ch_cnt[RX_MACRO_MAX_DAIS];
+	u16 bit_width[RX_MACRO_MAX_DAIS];
+	int is_softclip_on;
+	int is_aux_hpf_on;
+	int softclip_clk_users;
+
+	struct regmap *regmap;
+	struct clk_bulk_data clks[RX_NUM_CLKS_MAX];
+	struct clk_hw hw;
+};
+#define to_rx_macro(_hw) container_of(_hw, struct rx_macro, hw)
+
+static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
+
+static const char *const rx_macro_hph_pwr_mode_text[] = {
+	"ULP", "LOHIFI"
+};
+
+static const struct soc_enum rx_macro_hph_pwr_mode_enum =
+		SOC_ENUM_SINGLE_EXT(2, rx_macro_hph_pwr_mode_text);
+
+static const struct reg_default rx_defaults[] = {
+	/* RX Macro */
+	{ CDC_RX_TOP_TOP_CFG0, 0x00 },
+	{ CDC_RX_TOP_SWR_CTRL, 0x00 },
+	{ CDC_RX_TOP_DEBUG, 0x00 },
+	{ CDC_RX_TOP_DEBUG_BUS, 0x00 },
+	{ CDC_RX_TOP_DEBUG_EN0, 0x00 },
+	{ CDC_RX_TOP_DEBUG_EN1, 0x00 },
+	{ CDC_RX_TOP_DEBUG_EN2, 0x00 },
+	{ CDC_RX_TOP_HPHL_COMP_WR_LSB, 0x00 },
+	{ CDC_RX_TOP_HPHL_COMP_WR_MSB, 0x00 },
+	{ CDC_RX_TOP_HPHL_COMP_LUT, 0x00 },
+	{ CDC_RX_TOP_HPHL_COMP_RD_LSB, 0x00 },
+	{ CDC_RX_TOP_HPHL_COMP_RD_MSB, 0x00 },
+	{ CDC_RX_TOP_HPHR_COMP_WR_LSB, 0x00 },
+	{ CDC_RX_TOP_HPHR_COMP_WR_MSB, 0x00 },
+	{ CDC_RX_TOP_HPHR_COMP_LUT, 0x00 },
+	{ CDC_RX_TOP_HPHR_COMP_RD_LSB, 0x00 },
+	{ CDC_RX_TOP_HPHR_COMP_RD_MSB, 0x00 },
+	{ CDC_RX_TOP_DSD0_DEBUG_CFG0, 0x11 },
+	{ CDC_RX_TOP_DSD0_DEBUG_CFG1, 0x20 },
+	{ CDC_RX_TOP_DSD0_DEBUG_CFG2, 0x00 },
+	{ CDC_RX_TOP_DSD0_DEBUG_CFG3, 0x00 },
+	{ CDC_RX_TOP_DSD1_DEBUG_CFG0, 0x11 },
+	{ CDC_RX_TOP_DSD1_DEBUG_CFG1, 0x20 },
+	{ CDC_RX_TOP_DSD1_DEBUG_CFG2, 0x00 },
+	{ CDC_RX_TOP_DSD1_DEBUG_CFG3, 0x00 },
+	{ CDC_RX_TOP_RX_I2S_CTL, 0x0C },
+	{ CDC_RX_TOP_TX_I2S2_CTL, 0x0C },
+	{ CDC_RX_TOP_I2S_CLK, 0x0C },
+	{ CDC_RX_TOP_I2S_RESET, 0x00 },
+	{ CDC_RX_TOP_I2S_MUX, 0x00 },
+	{ CDC_RX_CLK_RST_CTRL_MCLK_CONTROL, 0x00 },
+	{ CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00 },
+	{ CDC_RX_CLK_RST_CTRL_SWR_CONTROL, 0x00 },
+	{ CDC_RX_CLK_RST_CTRL_DSD_CONTROL, 0x00 },
+	{ CDC_RX_CLK_RST_CTRL_ASRC_SHARE_CONTROL, 0x08 },
+	{ CDC_RX_SOFTCLIP_CRC, 0x00 },
+	{ CDC_RX_SOFTCLIP_SOFTCLIP_CTRL, 0x38 },
+	{ CDC_RX_INP_MUX_RX_INT0_CFG0, 0x00 },
+	{ CDC_RX_INP_MUX_RX_INT0_CFG1, 0x00 },
+	{ CDC_RX_INP_MUX_RX_INT1_CFG0, 0x00 },
+	{ CDC_RX_INP_MUX_RX_INT1_CFG1, 0x00 },
+	{ CDC_RX_INP_MUX_RX_INT2_CFG0, 0x00 },
+	{ CDC_RX_INP_MUX_RX_INT2_CFG1, 0x00 },
+	{ CDC_RX_INP_MUX_RX_MIX_CFG4, 0x00 },
+	{ CDC_RX_INP_MUX_RX_MIX_CFG5, 0x00 },
+	{ CDC_RX_INP_MUX_SIDETONE_SRC_CFG0, 0x00 },
+	{ CDC_RX_CLSH_CRC, 0x00 },
+	{ CDC_RX_CLSH_DLY_CTRL, 0x03 },
+	{ CDC_RX_CLSH_DECAY_CTRL, 0x02 },
+	{ CDC_RX_CLSH_HPH_V_PA, 0x1C },
+	{ CDC_RX_CLSH_EAR_V_PA, 0x39 },
+	{ CDC_RX_CLSH_HPH_V_HD, 0x0C },
+	{ CDC_RX_CLSH_EAR_V_HD, 0x0C },
+	{ CDC_RX_CLSH_K1_MSB, 0x01 },
+	{ CDC_RX_CLSH_K1_LSB, 0x00 },
+	{ CDC_RX_CLSH_K2_MSB, 0x00 },
+	{ CDC_RX_CLSH_K2_LSB, 0x80 },
+	{ CDC_RX_CLSH_IDLE_CTRL, 0x00 },
+	{ CDC_RX_CLSH_IDLE_HPH, 0x00 },
+	{ CDC_RX_CLSH_IDLE_EAR, 0x00 },
+	{ CDC_RX_CLSH_TEST0, 0x07 },
+	{ CDC_RX_CLSH_TEST1, 0x00 },
+	{ CDC_RX_CLSH_OVR_VREF, 0x00 },
+	{ CDC_RX_CLSH_CLSG_CTL, 0x02 },
+	{ CDC_RX_CLSH_CLSG_CFG1, 0x9A },
+	{ CDC_RX_CLSH_CLSG_CFG2, 0x10 },
+	{ CDC_RX_BCL_VBAT_PATH_CTL, 0x00 },
+	{ CDC_RX_BCL_VBAT_CFG, 0x10 },
+	{ CDC_RX_BCL_VBAT_ADC_CAL1, 0x00 },
+	{ CDC_RX_BCL_VBAT_ADC_CAL2, 0x00 },
+	{ CDC_RX_BCL_VBAT_ADC_CAL3, 0x04 },
+	{ CDC_RX_BCL_VBAT_PK_EST1, 0xE0 },
+	{ CDC_RX_BCL_VBAT_PK_EST2, 0x01 },
+	{ CDC_RX_BCL_VBAT_PK_EST3, 0x40 },
+	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x2A },
+	{ CDC_RX_BCL_VBAT_RF_PROC1, 0x00 },
+	{ CDC_RX_BCL_VBAT_TAC1, 0x00 },
+	{ CDC_RX_BCL_VBAT_TAC2, 0x18 },
+	{ CDC_RX_BCL_VBAT_TAC3, 0x18 },
+	{ CDC_RX_BCL_VBAT_TAC4, 0x03 },
+	{ CDC_RX_BCL_VBAT_GAIN_UPD1, 0x01 },
+	{ CDC_RX_BCL_VBAT_GAIN_UPD2, 0x00 },
+	{ CDC_RX_BCL_VBAT_GAIN_UPD3, 0x00 },
+	{ CDC_RX_BCL_VBAT_GAIN_UPD4, 0x64 },
+	{ CDC_RX_BCL_VBAT_GAIN_UPD5, 0x01 },
+	{ CDC_RX_BCL_VBAT_DEBUG1, 0x00 },
+	{ CDC_RX_BCL_VBAT_GAIN_UPD_MON, 0x00 },
+	{ CDC_RX_BCL_VBAT_GAIN_MON_VAL, 0x00 },
+	{ CDC_RX_BCL_VBAT_BAN, 0x0C },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD1, 0x00 },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD2, 0x77 },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD3, 0x01 },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD4, 0x00 },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD5, 0x4B },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD6, 0x00 },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD7, 0x01 },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD8, 0x00 },
+	{ CDC_RX_BCL_VBAT_BCL_GAIN_UPD9, 0x00 },
+	{ CDC_RX_BCL_VBAT_ATTN1, 0x04 },
+	{ CDC_RX_BCL_VBAT_ATTN2, 0x08 },
+	{ CDC_RX_BCL_VBAT_ATTN3, 0x0C },
+	{ CDC_RX_BCL_VBAT_DECODE_CTL1, 0xE0 },
+	{ CDC_RX_BCL_VBAT_DECODE_CTL2, 0x00 },
+	{ CDC_RX_BCL_VBAT_DECODE_CFG1, 0x00 },
+	{ CDC_RX_BCL_VBAT_DECODE_CFG2, 0x00 },
+	{ CDC_RX_BCL_VBAT_DECODE_CFG3, 0x00 },
+	{ CDC_RX_BCL_VBAT_DECODE_CFG4, 0x00 },
+	{ CDC_RX_BCL_VBAT_DECODE_ST, 0x00 },
+	{ CDC_RX_INTR_CTRL_CFG, 0x00 },
+	{ CDC_RX_INTR_CTRL_CLR_COMMIT, 0x00 },
+	{ CDC_RX_INTR_CTRL_PIN1_MASK0, 0xFF },
+	{ CDC_RX_INTR_CTRL_PIN1_STATUS0, 0x00 },
+	{ CDC_RX_INTR_CTRL_PIN1_CLEAR0, 0x00 },
+	{ CDC_RX_INTR_CTRL_PIN2_MASK0, 0xFF },
+	{ CDC_RX_INTR_CTRL_PIN2_STATUS0, 0x00 },
+	{ CDC_RX_INTR_CTRL_PIN2_CLEAR0, 0x00 },
+	{ CDC_RX_INTR_CTRL_LEVEL0, 0x00 },
+	{ CDC_RX_INTR_CTRL_BYPASS0, 0x00 },
+	{ CDC_RX_INTR_CTRL_SET0, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_CTL, 0x04 },
+	{ CDC_RX_RX0_RX_PATH_CFG0, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_CFG1, 0x64 },
+	{ CDC_RX_RX0_RX_PATH_CFG2, 0x8F },
+	{ CDC_RX_RX0_RX_PATH_CFG3, 0x00 },
+	{ CDC_RX_RX0_RX_VOL_CTL, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_RX_RX0_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_RX_RX0_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_SEC1, 0x08 },
+	{ CDC_RX_RX0_RX_PATH_SEC2, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_SEC3, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_SEC4, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_SEC7, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_RX_RX0_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_DSM_CTL, 0x08 },
+	{ CDC_RX_RX0_RX_PATH_DSM_DATA1, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_DSM_DATA2, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_DSM_DATA3, 0x00 },
+	{ CDC_RX_RX0_RX_PATH_DSM_DATA4, 0x55 },
+	{ CDC_RX_RX0_RX_PATH_DSM_DATA5, 0x55 },
+	{ CDC_RX_RX0_RX_PATH_DSM_DATA6, 0x55 },
+	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
+	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_CFG1, 0x64 },
+	{ CDC_RX_RX1_RX_PATH_CFG2, 0x8F },
+	{ CDC_RX_RX1_RX_PATH_CFG3, 0x00 },
+	{ CDC_RX_RX1_RX_VOL_CTL, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC1, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_SEC2, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC3, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC4, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_SEC7, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
+	{ CDC_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
+	{ CDC_RX_RX2_RX_PATH_CTL, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_CFG0, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_CFG1, 0x64 },
+	{ CDC_RX_RX2_RX_PATH_CFG2, 0x8F },
+	{ CDC_RX_RX2_RX_PATH_CFG3, 0x00 },
+	{ CDC_RX_RX2_RX_VOL_CTL, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
+	{ CDC_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC0, 0x04 },
+	{ CDC_RX_RX2_RX_PATH_SEC1, 0x08 },
+	{ CDC_RX_RX2_RX_PATH_SEC2, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC3, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC4, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC5, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC6, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_SEC7, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
+	{ CDC_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
+	{ CDC_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
+	{ CDC_RX_IDLE_DETECT_PATH_CTL, 0x00 },
+	{ CDC_RX_IDLE_DETECT_CFG0, 0x07 },
+	{ CDC_RX_IDLE_DETECT_CFG1, 0x3C },
+	{ CDC_RX_IDLE_DETECT_CFG2, 0x00 },
+	{ CDC_RX_IDLE_DETECT_CFG3, 0x00 },
+	{ CDC_RX_COMPANDER0_CTL0, 0x60 },
+	{ CDC_RX_COMPANDER0_CTL1, 0xDB },
+	{ CDC_RX_COMPANDER0_CTL2, 0xFF },
+	{ CDC_RX_COMPANDER0_CTL3, 0x35 },
+	{ CDC_RX_COMPANDER0_CTL4, 0xFF },
+	{ CDC_RX_COMPANDER0_CTL5, 0x00 },
+	{ CDC_RX_COMPANDER0_CTL6, 0x01 },
+	{ CDC_RX_COMPANDER0_CTL7, 0x28 },
+	{ CDC_RX_COMPANDER1_CTL0, 0x60 },
+	{ CDC_RX_COMPANDER1_CTL1, 0xDB },
+	{ CDC_RX_COMPANDER1_CTL2, 0xFF },
+	{ CDC_RX_COMPANDER1_CTL3, 0x35 },
+	{ CDC_RX_COMPANDER1_CTL4, 0xFF },
+	{ CDC_RX_COMPANDER1_CTL5, 0x00 },
+	{ CDC_RX_COMPANDER1_CTL6, 0x01 },
+	{ CDC_RX_COMPANDER1_CTL7, 0x28 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_PATH_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B5_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B6_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B7_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_B8_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_CTL, 0x40 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_GAIN_TIMER_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_PATH_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B5_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B6_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B7_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_B8_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_CTL, 0x40 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_GAIN_TIMER_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_COEF_B1_CTL, 0x00 },
+	{ CDC_RX_SIDETONE_IIR1_IIR_COEF_B2_CTL, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG0, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG1, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG2, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG3, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG0, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG1, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG2, 0x00 },
+	{ CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG3, 0x00 },
+	{ CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CTL, 0x04 },
+	{ CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CFG1, 0x00 },
+	{ CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CTL, 0x04 },
+	{ CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CFG1, 0x00 },
+	{ CDC_RX_EC_REF_HQ0_EC_REF_HQ_PATH_CTL, 0x00 },
+	{ CDC_RX_EC_REF_HQ0_EC_REF_HQ_CFG0, 0x01 },
+	{ CDC_RX_EC_REF_HQ1_EC_REF_HQ_PATH_CTL, 0x00 },
+	{ CDC_RX_EC_REF_HQ1_EC_REF_HQ_CFG0, 0x01 },
+	{ CDC_RX_EC_REF_HQ2_EC_REF_HQ_PATH_CTL, 0x00 },
+	{ CDC_RX_EC_REF_HQ2_EC_REF_HQ_CFG0, 0x01 },
+	{ CDC_RX_EC_ASRC0_CLK_RST_CTL, 0x00 },
+	{ CDC_RX_EC_ASRC0_CTL0, 0x00 },
+	{ CDC_RX_EC_ASRC0_CTL1, 0x00 },
+	{ CDC_RX_EC_ASRC0_FIFO_CTL, 0xA8 },
+	{ CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_LSB, 0x00 },
+	{ CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_MSB, 0x00 },
+	{ CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_LSB, 0x00 },
+	{ CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_MSB, 0x00 },
+	{ CDC_RX_EC_ASRC0_STATUS_FIFO, 0x00 },
+	{ CDC_RX_EC_ASRC1_CLK_RST_CTL, 0x00 },
+	{ CDC_RX_EC_ASRC1_CTL0, 0x00 },
+	{ CDC_RX_EC_ASRC1_CTL1, 0x00 },
+	{ CDC_RX_EC_ASRC1_FIFO_CTL, 0xA8 },
+	{ CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_LSB, 0x00 },
+	{ CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_MSB, 0x00 },
+	{ CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_LSB, 0x00 },
+	{ CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_MSB, 0x00 },
+	{ CDC_RX_EC_ASRC1_STATUS_FIFO, 0x00 },
+	{ CDC_RX_EC_ASRC2_CLK_RST_CTL, 0x00 },
+	{ CDC_RX_EC_ASRC2_CTL0, 0x00 },
+	{ CDC_RX_EC_ASRC2_CTL1, 0x00 },
+	{ CDC_RX_EC_ASRC2_FIFO_CTL, 0xA8 },
+	{ CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_LSB, 0x00 },
+	{ CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_MSB, 0x00 },
+	{ CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_LSB, 0x00 },
+	{ CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_MSB, 0x00 },
+	{ CDC_RX_EC_ASRC2_STATUS_FIFO, 0x00 },
+	{ CDC_RX_DSD0_PATH_CTL, 0x00 },
+	{ CDC_RX_DSD0_CFG0, 0x00 },
+	{ CDC_RX_DSD0_CFG1, 0x62 },
+	{ CDC_RX_DSD0_CFG2, 0x96 },
+	{ CDC_RX_DSD1_PATH_CTL, 0x00 },
+	{ CDC_RX_DSD1_CFG0, 0x00 },
+	{ CDC_RX_DSD1_CFG1, 0x62 },
+	{ CDC_RX_DSD1_CFG2, 0x96 },
+};
+
+static bool rx_is_wronly_register(struct device *dev,
+					unsigned int reg)
+{
+	switch (reg) {
+	case CDC_RX_BCL_VBAT_GAIN_UPD_MON:
+	case CDC_RX_INTR_CTRL_CLR_COMMIT:
+	case CDC_RX_INTR_CTRL_PIN1_CLEAR0:
+	case CDC_RX_INTR_CTRL_PIN2_CLEAR0:
+		return true;
+	}
+
+	return false;
+}
+
+static bool rx_is_volatile_register(struct device *dev, unsigned int reg)
+{
+	/* Update volatile list for rx/tx macros */
+	switch (reg) {
+	case CDC_RX_TOP_HPHL_COMP_RD_LSB:
+	case CDC_RX_TOP_HPHL_COMP_WR_LSB:
+	case CDC_RX_TOP_HPHL_COMP_RD_MSB:
+	case CDC_RX_TOP_HPHL_COMP_WR_MSB:
+	case CDC_RX_TOP_HPHR_COMP_RD_LSB:
+	case CDC_RX_TOP_HPHR_COMP_WR_LSB:
+	case CDC_RX_TOP_HPHR_COMP_RD_MSB:
+	case CDC_RX_TOP_HPHR_COMP_WR_MSB:
+	case CDC_RX_TOP_DSD0_DEBUG_CFG2:
+	case CDC_RX_TOP_DSD1_DEBUG_CFG2:
+	case CDC_RX_BCL_VBAT_GAIN_MON_VAL:
+	case CDC_RX_BCL_VBAT_DECODE_ST:
+	case CDC_RX_INTR_CTRL_PIN1_STATUS0:
+	case CDC_RX_INTR_CTRL_PIN2_STATUS0:
+	case CDC_RX_COMPANDER0_CTL6:
+	case CDC_RX_COMPANDER1_CTL6:
+	case CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_LSB:
+	case CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_MSB:
+	case CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_LSB:
+	case CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_MSB:
+	case CDC_RX_EC_ASRC0_STATUS_FIFO:
+	case CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_LSB:
+	case CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_MSB:
+	case CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_LSB:
+	case CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_MSB:
+	case CDC_RX_EC_ASRC1_STATUS_FIFO:
+	case CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_LSB:
+	case CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_MSB:
+	case CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_LSB:
+	case CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_MSB:
+	case CDC_RX_EC_ASRC2_STATUS_FIFO:
+		return true;
+	}
+	return false;
+}
+
+static bool rx_is_rw_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_RX_TOP_TOP_CFG0:
+	case CDC_RX_TOP_SWR_CTRL:
+	case CDC_RX_TOP_DEBUG:
+	case CDC_RX_TOP_DEBUG_BUS:
+	case CDC_RX_TOP_DEBUG_EN0:
+	case CDC_RX_TOP_DEBUG_EN1:
+	case CDC_RX_TOP_DEBUG_EN2:
+	case CDC_RX_TOP_HPHL_COMP_WR_LSB:
+	case CDC_RX_TOP_HPHL_COMP_WR_MSB:
+	case CDC_RX_TOP_HPHL_COMP_LUT:
+	case CDC_RX_TOP_HPHR_COMP_WR_LSB:
+	case CDC_RX_TOP_HPHR_COMP_WR_MSB:
+	case CDC_RX_TOP_HPHR_COMP_LUT:
+	case CDC_RX_TOP_DSD0_DEBUG_CFG0:
+	case CDC_RX_TOP_DSD0_DEBUG_CFG1:
+	case CDC_RX_TOP_DSD0_DEBUG_CFG3:
+	case CDC_RX_TOP_DSD1_DEBUG_CFG0:
+	case CDC_RX_TOP_DSD1_DEBUG_CFG1:
+	case CDC_RX_TOP_DSD1_DEBUG_CFG3:
+	case CDC_RX_TOP_RX_I2S_CTL:
+	case CDC_RX_TOP_TX_I2S2_CTL:
+	case CDC_RX_TOP_I2S_CLK:
+	case CDC_RX_TOP_I2S_RESET:
+	case CDC_RX_TOP_I2S_MUX:
+	case CDC_RX_CLK_RST_CTRL_MCLK_CONTROL:
+	case CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL:
+	case CDC_RX_CLK_RST_CTRL_SWR_CONTROL:
+	case CDC_RX_CLK_RST_CTRL_DSD_CONTROL:
+	case CDC_RX_CLK_RST_CTRL_ASRC_SHARE_CONTROL:
+	case CDC_RX_SOFTCLIP_CRC:
+	case CDC_RX_SOFTCLIP_SOFTCLIP_CTRL:
+	case CDC_RX_INP_MUX_RX_INT0_CFG0:
+	case CDC_RX_INP_MUX_RX_INT0_CFG1:
+	case CDC_RX_INP_MUX_RX_INT1_CFG0:
+	case CDC_RX_INP_MUX_RX_INT1_CFG1:
+	case CDC_RX_INP_MUX_RX_INT2_CFG0:
+	case CDC_RX_INP_MUX_RX_INT2_CFG1:
+	case CDC_RX_INP_MUX_RX_MIX_CFG4:
+	case CDC_RX_INP_MUX_RX_MIX_CFG5:
+	case CDC_RX_INP_MUX_SIDETONE_SRC_CFG0:
+	case CDC_RX_CLSH_CRC:
+	case CDC_RX_CLSH_DLY_CTRL:
+	case CDC_RX_CLSH_DECAY_CTRL:
+	case CDC_RX_CLSH_HPH_V_PA:
+	case CDC_RX_CLSH_EAR_V_PA:
+	case CDC_RX_CLSH_HPH_V_HD:
+	case CDC_RX_CLSH_EAR_V_HD:
+	case CDC_RX_CLSH_K1_MSB:
+	case CDC_RX_CLSH_K1_LSB:
+	case CDC_RX_CLSH_K2_MSB:
+	case CDC_RX_CLSH_K2_LSB:
+	case CDC_RX_CLSH_IDLE_CTRL:
+	case CDC_RX_CLSH_IDLE_HPH:
+	case CDC_RX_CLSH_IDLE_EAR:
+	case CDC_RX_CLSH_TEST0:
+	case CDC_RX_CLSH_TEST1:
+	case CDC_RX_CLSH_OVR_VREF:
+	case CDC_RX_CLSH_CLSG_CTL:
+	case CDC_RX_CLSH_CLSG_CFG1:
+	case CDC_RX_CLSH_CLSG_CFG2:
+	case CDC_RX_BCL_VBAT_PATH_CTL:
+	case CDC_RX_BCL_VBAT_CFG:
+	case CDC_RX_BCL_VBAT_ADC_CAL1:
+	case CDC_RX_BCL_VBAT_ADC_CAL2:
+	case CDC_RX_BCL_VBAT_ADC_CAL3:
+	case CDC_RX_BCL_VBAT_PK_EST1:
+	case CDC_RX_BCL_VBAT_PK_EST2:
+	case CDC_RX_BCL_VBAT_PK_EST3:
+	case CDC_RX_BCL_VBAT_RF_PROC1:
+	case CDC_RX_BCL_VBAT_RF_PROC2:
+	case CDC_RX_BCL_VBAT_TAC1:
+	case CDC_RX_BCL_VBAT_TAC2:
+	case CDC_RX_BCL_VBAT_TAC3:
+	case CDC_RX_BCL_VBAT_TAC4:
+	case CDC_RX_BCL_VBAT_GAIN_UPD1:
+	case CDC_RX_BCL_VBAT_GAIN_UPD2:
+	case CDC_RX_BCL_VBAT_GAIN_UPD3:
+	case CDC_RX_BCL_VBAT_GAIN_UPD4:
+	case CDC_RX_BCL_VBAT_GAIN_UPD5:
+	case CDC_RX_BCL_VBAT_DEBUG1:
+	case CDC_RX_BCL_VBAT_BAN:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD1:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD2:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD3:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD4:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD5:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD6:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD7:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD8:
+	case CDC_RX_BCL_VBAT_BCL_GAIN_UPD9:
+	case CDC_RX_BCL_VBAT_ATTN1:
+	case CDC_RX_BCL_VBAT_ATTN2:
+	case CDC_RX_BCL_VBAT_ATTN3:
+	case CDC_RX_BCL_VBAT_DECODE_CTL1:
+	case CDC_RX_BCL_VBAT_DECODE_CTL2:
+	case CDC_RX_BCL_VBAT_DECODE_CFG1:
+	case CDC_RX_BCL_VBAT_DECODE_CFG2:
+	case CDC_RX_BCL_VBAT_DECODE_CFG3:
+	case CDC_RX_BCL_VBAT_DECODE_CFG4:
+	case CDC_RX_INTR_CTRL_CFG:
+	case CDC_RX_INTR_CTRL_PIN1_MASK0:
+	case CDC_RX_INTR_CTRL_PIN2_MASK0:
+	case CDC_RX_INTR_CTRL_LEVEL0:
+	case CDC_RX_INTR_CTRL_BYPASS0:
+	case CDC_RX_INTR_CTRL_SET0:
+	case CDC_RX_RX0_RX_PATH_CTL:
+	case CDC_RX_RX0_RX_PATH_CFG0:
+	case CDC_RX_RX0_RX_PATH_CFG1:
+	case CDC_RX_RX0_RX_PATH_CFG2:
+	case CDC_RX_RX0_RX_PATH_CFG3:
+	case CDC_RX_RX0_RX_VOL_CTL:
+	case CDC_RX_RX0_RX_PATH_MIX_CTL:
+	case CDC_RX_RX0_RX_PATH_MIX_CFG:
+	case CDC_RX_RX0_RX_VOL_MIX_CTL:
+	case CDC_RX_RX0_RX_PATH_SEC1:
+	case CDC_RX_RX0_RX_PATH_SEC2:
+	case CDC_RX_RX0_RX_PATH_SEC3:
+	case CDC_RX_RX0_RX_PATH_SEC4:
+	case CDC_RX_RX0_RX_PATH_SEC7:
+	case CDC_RX_RX0_RX_PATH_MIX_SEC0:
+	case CDC_RX_RX0_RX_PATH_MIX_SEC1:
+	case CDC_RX_RX0_RX_PATH_DSM_CTL:
+	case CDC_RX_RX0_RX_PATH_DSM_DATA1:
+	case CDC_RX_RX0_RX_PATH_DSM_DATA2:
+	case CDC_RX_RX0_RX_PATH_DSM_DATA3:
+	case CDC_RX_RX0_RX_PATH_DSM_DATA4:
+	case CDC_RX_RX0_RX_PATH_DSM_DATA5:
+	case CDC_RX_RX0_RX_PATH_DSM_DATA6:
+	case CDC_RX_RX1_RX_PATH_CTL:
+	case CDC_RX_RX1_RX_PATH_CFG0:
+	case CDC_RX_RX1_RX_PATH_CFG1:
+	case CDC_RX_RX1_RX_PATH_CFG2:
+	case CDC_RX_RX1_RX_PATH_CFG3:
+	case CDC_RX_RX1_RX_VOL_CTL:
+	case CDC_RX_RX1_RX_PATH_MIX_CTL:
+	case CDC_RX_RX1_RX_PATH_MIX_CFG:
+	case CDC_RX_RX1_RX_VOL_MIX_CTL:
+	case CDC_RX_RX1_RX_PATH_SEC1:
+	case CDC_RX_RX1_RX_PATH_SEC2:
+	case CDC_RX_RX1_RX_PATH_SEC3:
+	case CDC_RX_RX1_RX_PATH_SEC4:
+	case CDC_RX_RX1_RX_PATH_SEC7:
+	case CDC_RX_RX1_RX_PATH_MIX_SEC0:
+	case CDC_RX_RX1_RX_PATH_MIX_SEC1:
+	case CDC_RX_RX1_RX_PATH_DSM_CTL:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA1:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA2:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA3:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA4:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA5:
+	case CDC_RX_RX1_RX_PATH_DSM_DATA6:
+	case CDC_RX_RX2_RX_PATH_CTL:
+	case CDC_RX_RX2_RX_PATH_CFG0:
+	case CDC_RX_RX2_RX_PATH_CFG1:
+	case CDC_RX_RX2_RX_PATH_CFG2:
+	case CDC_RX_RX2_RX_PATH_CFG3:
+	case CDC_RX_RX2_RX_VOL_CTL:
+	case CDC_RX_RX2_RX_PATH_MIX_CTL:
+	case CDC_RX_RX2_RX_PATH_MIX_CFG:
+	case CDC_RX_RX2_RX_VOL_MIX_CTL:
+	case CDC_RX_RX2_RX_PATH_SEC0:
+	case CDC_RX_RX2_RX_PATH_SEC1:
+	case CDC_RX_RX2_RX_PATH_SEC2:
+	case CDC_RX_RX2_RX_PATH_SEC3:
+	case CDC_RX_RX2_RX_PATH_SEC4:
+	case CDC_RX_RX2_RX_PATH_SEC5:
+	case CDC_RX_RX2_RX_PATH_SEC6:
+	case CDC_RX_RX2_RX_PATH_SEC7:
+	case CDC_RX_RX2_RX_PATH_MIX_SEC0:
+	case CDC_RX_RX2_RX_PATH_MIX_SEC1:
+	case CDC_RX_RX2_RX_PATH_DSM_CTL:
+	case CDC_RX_IDLE_DETECT_PATH_CTL:
+	case CDC_RX_IDLE_DETECT_CFG0:
+	case CDC_RX_IDLE_DETECT_CFG1:
+	case CDC_RX_IDLE_DETECT_CFG2:
+	case CDC_RX_IDLE_DETECT_CFG3:
+	case CDC_RX_COMPANDER0_CTL0:
+	case CDC_RX_COMPANDER0_CTL1:
+	case CDC_RX_COMPANDER0_CTL2:
+	case CDC_RX_COMPANDER0_CTL3:
+	case CDC_RX_COMPANDER0_CTL4:
+	case CDC_RX_COMPANDER0_CTL5:
+	case CDC_RX_COMPANDER0_CTL7:
+	case CDC_RX_COMPANDER1_CTL0:
+	case CDC_RX_COMPANDER1_CTL1:
+	case CDC_RX_COMPANDER1_CTL2:
+	case CDC_RX_COMPANDER1_CTL3:
+	case CDC_RX_COMPANDER1_CTL4:
+	case CDC_RX_COMPANDER1_CTL5:
+	case CDC_RX_COMPANDER1_CTL7:
+	case CDC_RX_SIDETONE_IIR0_IIR_PATH_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B1_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B2_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B3_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B4_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B5_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B6_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B7_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_B8_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_GAIN_TIMER_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_COEF_B1_CTL:
+	case CDC_RX_SIDETONE_IIR0_IIR_COEF_B2_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_PATH_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B1_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B2_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B3_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B4_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B5_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B6_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B7_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_B8_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_GAIN_TIMER_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_COEF_B1_CTL:
+	case CDC_RX_SIDETONE_IIR1_IIR_COEF_B2_CTL:
+	case CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG0:
+	case CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG1:
+	case CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG2:
+	case CDC_RX_IIR_INP_MUX_IIR0_MIX_CFG3:
+	case CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG0:
+	case CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG1:
+	case CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG2:
+	case CDC_RX_IIR_INP_MUX_IIR1_MIX_CFG3:
+	case CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CTL:
+	case CDC_RX_SIDETONE_SRC0_ST_SRC_PATH_CFG1:
+	case CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CTL:
+	case CDC_RX_SIDETONE_SRC1_ST_SRC_PATH_CFG1:
+	case CDC_RX_EC_REF_HQ0_EC_REF_HQ_PATH_CTL:
+	case CDC_RX_EC_REF_HQ0_EC_REF_HQ_CFG0:
+	case CDC_RX_EC_REF_HQ1_EC_REF_HQ_PATH_CTL:
+	case CDC_RX_EC_REF_HQ1_EC_REF_HQ_CFG0:
+	case CDC_RX_EC_REF_HQ2_EC_REF_HQ_PATH_CTL:
+	case CDC_RX_EC_REF_HQ2_EC_REF_HQ_CFG0:
+	case CDC_RX_EC_ASRC0_CLK_RST_CTL:
+	case CDC_RX_EC_ASRC0_CTL0:
+	case CDC_RX_EC_ASRC0_CTL1:
+	case CDC_RX_EC_ASRC0_FIFO_CTL:
+	case CDC_RX_EC_ASRC1_CLK_RST_CTL:
+	case CDC_RX_EC_ASRC1_CTL0:
+	case CDC_RX_EC_ASRC1_CTL1:
+	case CDC_RX_EC_ASRC1_FIFO_CTL:
+	case CDC_RX_EC_ASRC2_CLK_RST_CTL:
+	case CDC_RX_EC_ASRC2_CTL0:
+	case CDC_RX_EC_ASRC2_CTL1:
+	case CDC_RX_EC_ASRC2_FIFO_CTL:
+	case CDC_RX_DSD0_PATH_CTL:
+	case CDC_RX_DSD0_CFG0:
+	case CDC_RX_DSD0_CFG1:
+	case CDC_RX_DSD0_CFG2:
+	case CDC_RX_DSD1_PATH_CTL:
+	case CDC_RX_DSD1_CFG0:
+	case CDC_RX_DSD1_CFG1:
+	case CDC_RX_DSD1_CFG2:
+		return true;
+	}
+
+	return false;
+}
+
+static bool rx_is_writeable_register(struct device *dev, unsigned int reg)
+{
+	bool ret;
+
+	ret = rx_is_rw_register(dev, reg);
+	if (!ret)
+		return rx_is_wronly_register(dev, reg);
+
+	return ret;
+}
+
+static bool rx_is_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case CDC_RX_TOP_HPHL_COMP_RD_LSB:
+	case CDC_RX_TOP_HPHL_COMP_RD_MSB:
+	case CDC_RX_TOP_HPHR_COMP_RD_LSB:
+	case CDC_RX_TOP_HPHR_COMP_RD_MSB:
+	case CDC_RX_TOP_DSD0_DEBUG_CFG2:
+	case CDC_RX_TOP_DSD1_DEBUG_CFG2:
+	case CDC_RX_BCL_VBAT_GAIN_MON_VAL:
+	case CDC_RX_BCL_VBAT_DECODE_ST:
+	case CDC_RX_INTR_CTRL_PIN1_STATUS0:
+	case CDC_RX_INTR_CTRL_PIN2_STATUS0:
+	case CDC_RX_COMPANDER0_CTL6:
+	case CDC_RX_COMPANDER1_CTL6:
+	case CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_LSB:
+	case CDC_RX_EC_ASRC0_STATUS_FMIN_CNTR_MSB:
+	case CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_LSB:
+	case CDC_RX_EC_ASRC0_STATUS_FMAX_CNTR_MSB:
+	case CDC_RX_EC_ASRC0_STATUS_FIFO:
+	case CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_LSB:
+	case CDC_RX_EC_ASRC1_STATUS_FMIN_CNTR_MSB:
+	case CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_LSB:
+	case CDC_RX_EC_ASRC1_STATUS_FMAX_CNTR_MSB:
+	case CDC_RX_EC_ASRC1_STATUS_FIFO:
+	case CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_LSB:
+	case CDC_RX_EC_ASRC2_STATUS_FMIN_CNTR_MSB:
+	case CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_LSB:
+	case CDC_RX_EC_ASRC2_STATUS_FMAX_CNTR_MSB:
+	case CDC_RX_EC_ASRC2_STATUS_FIFO:
+		return true;
+	}
+
+	return rx_is_rw_register(dev, reg);
+}
+
+static const struct regmap_config rx_regmap_config = {
+	.name = "rx_macro",
+	.reg_bits = 16,
+	.val_bits = 32, /* 8 but with 32 bit read/write */
+	.reg_stride = 4,
+	.cache_type = REGCACHE_FLAT,
+	.reg_defaults = rx_defaults,
+	.num_reg_defaults = ARRAY_SIZE(rx_defaults),
+	.max_register = RX_MAX_OFFSET,
+	.writeable_reg = rx_is_writeable_register,
+	.volatile_reg = rx_is_volatile_register,
+	.readable_reg = rx_is_readable_register,
+};
+
+static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
+					       int rate_reg_val, u32 sample_rate)
+{
+
+	u8 int_1_mix1_inp;
+	u32 j, port;
+	u16 int_mux_cfg0, int_mux_cfg1;
+	u16 int_fs_reg;
+	u8 inp0_sel, inp1_sel, inp2_sel;
+	struct snd_soc_component *component = dai->component;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	for_each_set_bit(port, &rx->active_ch_mask[dai->id], RX_MACRO_PORTS_MAX) {
+		int_1_mix1_inp = port;
+		int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0;
+		/*
+		 * Loop through all interpolator MUX inputs and find out
+		 * to which interpolator input, the rx port
+		 * is connected
+		 */
+		for (j = 0; j < INTERP_MAX; j++) {
+			int_mux_cfg1 = int_mux_cfg0 + 4;
+
+			inp0_sel = snd_soc_component_read_field(component, int_mux_cfg0,
+								CDC_RX_INTX_1_MIX_INP0_SEL_MASK);
+			inp1_sel = snd_soc_component_read_field(component, int_mux_cfg0,
+								CDC_RX_INTX_1_MIX_INP1_SEL_MASK);
+			inp2_sel = snd_soc_component_read_field(component, int_mux_cfg1,
+								CDC_RX_INTX_1_MIX_INP2_SEL_MASK);
+
+			if ((inp0_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
+			    (inp1_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0) ||
+			    (inp2_sel == int_1_mix1_inp + INTn_1_INP_SEL_RX0)) {
+				int_fs_reg = CDC_RX_RXn_RX_PATH_CTL(j);
+				/* sample_rate is in Hz */
+				snd_soc_component_update_bits(component, int_fs_reg,
+							      CDC_RX_PATH_PCM_RATE_MASK,
+							      rate_reg_val);
+			}
+			int_mux_cfg0 += 8;
+		}
+	}
+
+	return 0;
+}
+
+static int rx_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
+					      int rate_reg_val, u32 sample_rate)
+{
+
+	u8 int_2_inp;
+	u32 j, port;
+	u16 int_mux_cfg1, int_fs_reg;
+	u8 int_mux_cfg1_val;
+	struct snd_soc_component *component = dai->component;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	for_each_set_bit(port, &rx->active_ch_mask[dai->id], RX_MACRO_PORTS_MAX) {
+		int_2_inp = port;
+
+		int_mux_cfg1 = CDC_RX_INP_MUX_RX_INT0_CFG1;
+		for (j = 0; j < INTERP_MAX; j++) {
+			int_mux_cfg1_val = snd_soc_component_read_field(component, int_mux_cfg1,
+									CDC_RX_INTX_2_SEL_MASK);
+
+			if (int_mux_cfg1_val == int_2_inp + INTn_2_INP_SEL_RX0) {
+				int_fs_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
+				snd_soc_component_update_bits(component, int_fs_reg,
+							      CDC_RX_RXn_MIX_PCM_RATE_MASK,
+							      rate_reg_val);
+			}
+			int_mux_cfg1 += 8;
+		}
+	}
+	return 0;
+}
+
+static int rx_macro_set_interpolator_rate(struct snd_soc_dai *dai,
+					  u32 sample_rate)
+{
+	int rate_val = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(sr_val_tbl); i++)
+		if (sample_rate == sr_val_tbl[i].sample_rate)
+			rate_val = sr_val_tbl[i].rate_val;
+
+	ret = rx_macro_set_prim_interpolator_rate(dai, rate_val, sample_rate);
+	if (ret)
+		return ret;
+
+	ret = rx_macro_set_mix_interpolator_rate(dai, rate_val, sample_rate);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int rx_macro_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	switch (substream->stream) {
+	case SNDRV_PCM_STREAM_PLAYBACK:
+		ret = rx_macro_set_interpolator_rate(dai, params_rate(params));
+		if (ret) {
+			dev_err(component->dev, "%s: cannot set sample rate: %u\n",
+				__func__, params_rate(params));
+			return ret;
+		}
+		rx->bit_width[dai->id] = params_width(params);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int rx_macro_get_channel_map(struct snd_soc_dai *dai,
+				    unsigned int *tx_num, unsigned int *tx_slot,
+				    unsigned int *rx_num, unsigned int *rx_slot)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+	u16 val, mask = 0, cnt = 0, temp;
+
+	switch (dai->id) {
+	case RX_MACRO_AIF1_PB:
+	case RX_MACRO_AIF2_PB:
+	case RX_MACRO_AIF3_PB:
+	case RX_MACRO_AIF4_PB:
+		for_each_set_bit(temp, &rx->active_ch_mask[dai->id],
+			 RX_MACRO_PORTS_MAX) {
+			mask |= (1 << temp);
+			if (++cnt == RX_MACRO_MAX_DMA_CH_PER_PORT)
+				break;
+		}
+		/*
+		 * CDC_DMA_RX_0 port drives RX0/RX1 -- ch_mask 0x1/0x2/0x3
+		 * CDC_DMA_RX_1 port drives RX2/RX3 -- ch_mask 0x1/0x2/0x3
+		 * CDC_DMA_RX_2 port drives RX4     -- ch_mask 0x1
+		 * CDC_DMA_RX_3 port drives RX5     -- ch_mask 0x1
+		 * AIFn can pair to any CDC_DMA_RX_n port.
+		 * In general, below convention is used::
+		 * CDC_DMA_RX_0(AIF1)/CDC_DMA_RX_1(AIF2)/
+		 * CDC_DMA_RX_2(AIF3)/CDC_DMA_RX_3(AIF4)
+		 */
+		if (mask & 0x0C)
+			mask = mask >> 2;
+		if ((mask & 0x10) || (mask & 0x20))
+			mask = 0x1;
+		*rx_slot = mask;
+		*rx_num = rx->active_ch_cnt[dai->id];
+		break;
+	case RX_MACRO_AIF_ECHO:
+		val = snd_soc_component_read(component,	CDC_RX_INP_MUX_RX_MIX_CFG4);
+		if (val & RX_MACRO_EC_MIX_TX0_MASK) {
+			mask |= 0x1;
+			cnt++;
+		}
+		if (val & RX_MACRO_EC_MIX_TX1_MASK) {
+			mask |= 0x2;
+			cnt++;
+		}
+		val = snd_soc_component_read(component,
+			CDC_RX_INP_MUX_RX_MIX_CFG5);
+		if (val & RX_MACRO_EC_MIX_TX2_MASK) {
+			mask |= 0x4;
+			cnt++;
+		}
+		*tx_slot = mask;
+		*tx_num = cnt;
+		break;
+	default:
+		dev_err(component->dev, "%s: Invalid AIF\n", __func__);
+		break;
+	}
+	return 0;
+}
+
+static int rx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+	uint16_t j, reg, mix_reg, dsm_reg;
+	u16 int_mux_cfg0, int_mux_cfg1;
+	u8 int_mux_cfg0_val, int_mux_cfg1_val;
+
+	switch (dai->id) {
+	case RX_MACRO_AIF1_PB:
+	case RX_MACRO_AIF2_PB:
+	case RX_MACRO_AIF3_PB:
+	case RX_MACRO_AIF4_PB:
+	for (j = 0; j < INTERP_MAX; j++) {
+		reg = CDC_RX_RXn_RX_PATH_CTL(j);
+		mix_reg = CDC_RX_RXn_RX_PATH_MIX_CTL(j);
+		dsm_reg = CDC_RX_RXn_RX_PATH_DSM_CTL(j);
+
+		if (mute) {
+			snd_soc_component_update_bits(component, reg,
+						      CDC_RX_PATH_PGA_MUTE_MASK,
+						      CDC_RX_PATH_PGA_MUTE_ENABLE);
+			snd_soc_component_update_bits(component, mix_reg,
+						      CDC_RX_PATH_PGA_MUTE_MASK,
+						      CDC_RX_PATH_PGA_MUTE_ENABLE);
+		} else {
+			snd_soc_component_update_bits(component, reg,
+						      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
+			snd_soc_component_update_bits(component, mix_reg,
+						      CDC_RX_PATH_PGA_MUTE_MASK, 0x0);
+		}
+
+		if (j == INTERP_AUX)
+			dsm_reg = CDC_RX_RX2_RX_PATH_DSM_CTL;
+
+		int_mux_cfg0 = CDC_RX_INP_MUX_RX_INT0_CFG0 + j * 8;
+		int_mux_cfg1 = int_mux_cfg0 + 4;
+		int_mux_cfg0_val = snd_soc_component_read(component, int_mux_cfg0);
+		int_mux_cfg1_val = snd_soc_component_read(component, int_mux_cfg1);
+
+		if (snd_soc_component_read(component, dsm_reg) & 0x01) {
+			if (int_mux_cfg0_val || (int_mux_cfg1_val & 0xF0))
+				snd_soc_component_update_bits(component, reg, 0x20, 0x20);
+			if (int_mux_cfg1_val & 0x0F) {
+				snd_soc_component_update_bits(component, reg, 0x20, 0x20);
+				snd_soc_component_update_bits(component, mix_reg, 0x20, 0x20);
+			}
+		}
+	}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static struct snd_soc_dai_ops rx_macro_dai_ops = {
+	.hw_params = rx_macro_hw_params,
+	.get_channel_map = rx_macro_get_channel_map,
+	.mute_stream = rx_macro_digital_mute,
+};
+
+static struct snd_soc_dai_driver rx_macro_dai[] = {
+	{
+		.name = "rx_macro_rx1",
+		.id = RX_MACRO_AIF1_PB,
+		.playback = {
+			.stream_name = "RX_MACRO_AIF1 Playback",
+			.rates = RX_MACRO_RATES | RX_MACRO_FRAC_RATES,
+			.formats = RX_MACRO_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &rx_macro_dai_ops,
+	},
+	{
+		.name = "rx_macro_rx2",
+		.id = RX_MACRO_AIF2_PB,
+		.playback = {
+			.stream_name = "RX_MACRO_AIF2 Playback",
+			.rates = RX_MACRO_RATES | RX_MACRO_FRAC_RATES,
+			.formats = RX_MACRO_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &rx_macro_dai_ops,
+	},
+	{
+		.name = "rx_macro_rx3",
+		.id = RX_MACRO_AIF3_PB,
+		.playback = {
+			.stream_name = "RX_MACRO_AIF3 Playback",
+			.rates = RX_MACRO_RATES | RX_MACRO_FRAC_RATES,
+			.formats = RX_MACRO_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &rx_macro_dai_ops,
+	},
+	{
+		.name = "rx_macro_rx4",
+		.id = RX_MACRO_AIF4_PB,
+		.playback = {
+			.stream_name = "RX_MACRO_AIF4 Playback",
+			.rates = RX_MACRO_RATES | RX_MACRO_FRAC_RATES,
+			.formats = RX_MACRO_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &rx_macro_dai_ops,
+	},
+	{
+		.name = "rx_macro_echo",
+		.id = RX_MACRO_AIF_ECHO,
+		.capture = {
+			.stream_name = "RX_AIF_ECHO Capture",
+			.rates = RX_MACRO_ECHO_RATES,
+			.formats = RX_MACRO_ECHO_FORMATS,
+			.rate_max = 48000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 3,
+		},
+		.ops = &rx_macro_dai_ops,
+	},
+};
+
+static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
+{
+	struct regmap *regmap = rx->regmap;
+
+	if (mclk_enable) {
+		if (rx->rx_mclk_users == 0) {
+			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_MCLK_CONTROL,
+					   CDC_RX_CLK_MCLK_EN_MASK |
+					   CDC_RX_CLK_MCLK2_EN_MASK,
+					   CDC_RX_CLK_MCLK_ENABLE |
+					   CDC_RX_CLK_MCLK2_ENABLE);
+			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+					   CDC_RX_FS_MCLK_CNT_EN_MASK,
+					   CDC_RX_FS_MCLK_CNT_ENABLE);
+			regcache_mark_dirty(regmap);
+			regcache_sync(regmap);
+		}
+		rx->rx_mclk_users++;
+	} else {
+		if (rx->rx_mclk_users <= 0) {
+			dev_err(rx->dev, "%s: clock already disabled\n", __func__);
+			rx->rx_mclk_users = 0;
+			return;
+		}
+		rx->rx_mclk_users--;
+		if (rx->rx_mclk_users == 0) {
+			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+					   CDC_RX_FS_MCLK_CNT_EN_MASK, 0x0);
+			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+					   CDC_RX_FS_MCLK_CNT_CLR_MASK,
+					   CDC_RX_FS_MCLK_CNT_CLR);
+			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_MCLK_CONTROL,
+					   CDC_RX_CLK_MCLK_EN_MASK |
+					   CDC_RX_CLK_MCLK2_EN_MASK, 0x0);
+		}
+	}
+}
+
+static inline void rx_macro_enable_clsh_block(struct rx_macro *rx, bool enable)
+{
+	if ((enable && ++rx->clsh_users == 1) || (!enable && --rx->clsh_users == 0))
+		snd_soc_component_update_bits(rx->component, CDC_RX_CLSH_CRC,
+					     CDC_RX_CLSH_CLK_EN_MASK, enable);
+	if (rx->clsh_users < 0)
+		rx->clsh_users = 0;
+}
+
+static int rx_macro_get_compander(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+				snd_soc_kcontrol_component(kcontrol);
+	int comp = ((struct soc_mixer_control *) kcontrol->private_value)->shift;
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rx->comp_enabled[comp];
+	return 0;
+}
+
+static int rx_macro_set_compander(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	int comp = ((struct soc_mixer_control *)  kcontrol->private_value)->shift;
+	int value = ucontrol->value.integer.value[0];
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	rx->comp_enabled[comp] = value;
+
+	return 0;
+}
+
+static int rx_macro_get_ear_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rx->is_ear_mode_on;
+	return 0;
+}
+
+static int rx_macro_put_ear_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	rx->is_ear_mode_on = (!ucontrol->value.integer.value[0] ? false : true);
+	return 0;
+}
+
+static int rx_macro_get_hph_hd2_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rx->hph_hd2_mode;
+	return 0;
+}
+
+static int rx_macro_put_hph_hd2_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	rx->hph_hd2_mode = ucontrol->value.integer.value[0];
+	return 0;
+}
+
+static int rx_macro_get_hph_pwr_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rx->hph_pwr_mode;
+	return 0;
+}
+
+static int rx_macro_put_hph_pwr_mode(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	rx->hph_pwr_mode = ucontrol->value.integer.value[0];
+	return 0;
+}
+
+static int rx_macro_soft_clip_enable_get(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rx->is_softclip_on;
+
+	return 0;
+}
+
+static int rx_macro_soft_clip_enable_put(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	rx->is_softclip_on = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static int rx_macro_aux_hpf_mode_get(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = rx->is_aux_hpf_on;
+
+	return 0;
+}
+
+static int rx_macro_aux_hpf_mode_put(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	rx->is_aux_hpf_on = ucontrol->value.integer.value[0];
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
+	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_RX_RX1_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_RX_RX2_RX_VOL_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX0 Mix Digital Volume", CDC_RX_RX0_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_RX_RX1_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_RX_RX2_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+
+	SOC_SINGLE_EXT("RX_COMP1 Switch", SND_SOC_NOPM, RX_MACRO_COMP1, 1, 0,
+		rx_macro_get_compander, rx_macro_set_compander),
+	SOC_SINGLE_EXT("RX_COMP2 Switch", SND_SOC_NOPM, RX_MACRO_COMP2, 1, 0,
+		rx_macro_get_compander, rx_macro_set_compander),
+
+	SOC_SINGLE_EXT("RX_EAR Mode Switch", SND_SOC_NOPM, 0, 1, 0,
+		rx_macro_get_ear_mode, rx_macro_put_ear_mode),
+
+	SOC_SINGLE_EXT("RX_HPH HD2 Mode Switch", SND_SOC_NOPM, 0, 1, 0,
+		rx_macro_get_hph_hd2_mode, rx_macro_put_hph_hd2_mode),
+
+	SOC_ENUM_EXT("RX_HPH PWR Mode", rx_macro_hph_pwr_mode_enum,
+		rx_macro_get_hph_pwr_mode, rx_macro_put_hph_pwr_mode),
+
+	SOC_SINGLE_EXT("RX_Softclip Switch", SND_SOC_NOPM, 0, 1, 0,
+		     rx_macro_soft_clip_enable_get,
+		     rx_macro_soft_clip_enable_put),
+	SOC_SINGLE_EXT("AUX_HPF Switch", SND_SOC_NOPM, 0, 1, 0,
+			rx_macro_aux_hpf_mode_get,
+			rx_macro_aux_hpf_mode_put),
+};
+
+static int rx_macro_component_probe(struct snd_soc_component *component)
+{
+	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, rx->regmap);
+
+	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_SEC7,
+				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
+				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
+	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_SEC7,
+				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
+				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
+	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_SEC7,
+				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
+				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
+	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_CFG3,
+				      CDC_RX_DC_COEFF_SEL_MASK,
+				      CDC_RX_DC_COEFF_SEL_TWO);
+	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_CFG3,
+				      CDC_RX_DC_COEFF_SEL_MASK,
+				      CDC_RX_DC_COEFF_SEL_TWO);
+	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_CFG3,
+				      CDC_RX_DC_COEFF_SEL_MASK,
+				      CDC_RX_DC_COEFF_SEL_TWO);
+
+	rx->component = component;
+
+	return 0;
+}
+
+static int swclk_gate_enable(struct clk_hw *hw)
+{
+	struct rx_macro *rx = to_rx_macro(hw);
+
+	rx_macro_mclk_enable(rx, true);
+	if (rx->reset_swr)
+		regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_RX_SWR_RESET_MASK,
+				   CDC_RX_SWR_RESET);
+
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_CLK_EN_MASK, 1);
+
+	if (rx->reset_swr)
+		regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+				   CDC_RX_SWR_RESET_MASK, 0);
+	rx->reset_swr = false;
+
+	return 0;
+}
+
+static void swclk_gate_disable(struct clk_hw *hw)
+{
+	struct rx_macro *rx = to_rx_macro(hw);
+
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL, 
+			   CDC_RX_SWR_CLK_EN_MASK, 0);
+
+	rx_macro_mclk_enable(rx, false);
+}
+
+static int swclk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct rx_macro *rx = to_rx_macro(hw);
+	int ret, val;
+
+	regmap_read(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL, &val);
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
+static struct clk *rx_macro_register_mclk_output(struct rx_macro *rx)
+{
+	struct device *dev = rx->dev;
+	struct device_node *np = dev->of_node;
+	const char *parent_clk_name = NULL;
+	const char *clk_name = "lpass-rx-mclk";
+	struct clk_hw *hw;
+	struct clk_init_data init;
+	int ret;
+
+	parent_clk_name = __clk_get_name(rx->clks[2].clk);
+
+	init.name = clk_name;
+	init.ops = &swclk_gate_ops;
+	init.flags = 0;
+	init.parent_names = &parent_clk_name;
+	init.num_parents = 1;
+	rx->hw.init = &init;
+	hw = &rx->hw;
+	ret = clk_hw_register(rx->dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
+
+	return NULL;
+}
+
+static const struct snd_soc_component_driver rx_macro_component_drv = {
+	.name = "RX-MACRO",
+	.probe = rx_macro_component_probe,
+	.controls = rx_macro_snd_controls,
+	.num_controls = ARRAY_SIZE(rx_macro_snd_controls),
+};
+
+static int rx_macro_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rx_macro *rx;
+	void __iomem *base;
+	int ret;
+
+	rx = devm_kzalloc(dev, sizeof(*rx), GFP_KERNEL);
+	if (!rx)
+		return -ENOMEM;
+
+	rx->clks[0].id = "macro";
+	rx->clks[1].id = "dcodec";
+	rx->clks[2].id = "mclk";
+	rx->clks[3].id = "npl";
+	rx->clks[4].id = "fsgen";
+
+	ret = devm_clk_bulk_get(dev, RX_NUM_CLKS_MAX, rx->clks);
+	if (ret) {
+		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
+		return ret;
+	}
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
+
+	dev_set_drvdata(dev, rx);
+
+	rx->reset_swr = true;
+	rx->dev = dev;
+
+	/* set MCLK and NPL rates */
+	clk_set_rate(rx->clks[2].clk, MCLK_FREQ);
+	clk_set_rate(rx->clks[3].clk, MCLK_FREQ);
+
+	ret = clk_bulk_prepare_enable(RX_NUM_CLKS_MAX, rx->clks);
+	if (ret)
+		return ret;
+
+	rx_macro_register_mclk_output(rx);
+
+	ret = devm_snd_soc_register_component(dev, &rx_macro_component_drv,
+					      rx_macro_dai,
+					      ARRAY_SIZE(rx_macro_dai));
+	if (ret)
+		clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+
+	return ret;
+}
+
+static int rx_macro_remove(struct platform_device *pdev)
+{
+	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
+
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+	return 0;
+}
+
+static const struct of_device_id rx_macro_dt_match[] = {
+	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
+	{ }
+};
+
+static struct platform_driver rx_macro_driver = {
+	.driver = {
+		.name = "rx_macro",
+		.owner = THIS_MODULE,
+		.of_match_table = rx_macro_dt_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = rx_macro_probe,
+	.remove = rx_macro_remove,
+};
+
+module_platform_driver(rx_macro_driver);
+
+MODULE_DESCRIPTION("RX macro driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

