Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2039E093
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:33:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F3E1671;
	Mon,  7 Jun 2021 17:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F3E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623080026;
	bh=ynCOry29ZFEgHRjn0lcwKXseW0839hehHDgqZA58+7g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgppG/fYtiPdVJXGzmcXx5jiHz9XXJB4AXvnTzWgE7vSZls5ivhrOFaW4IVR5OqSv
	 MJ8PrvrSMvz0mXK1zHmoKNk32XYUvcL3r2J/jy//Mzdpi19zzr44jhNBKC3Xj2Nb8f
	 dEfpDb7A3SJvl4YQyjShbNxANLIqSqwlmK78w1Dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73333F804E3;
	Mon,  7 Jun 2021 17:30:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEC4CF800AF; Mon,  7 Jun 2021 17:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66B66F8027C
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66B66F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ezJbmXJO"
Received: by mail-wm1-x333.google.com with SMTP id g204so10297464wmf.5
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fpSALZ4QvKe+UDR9WTTzY0agA74ILnhkVcpsIKuvJFc=;
 b=ezJbmXJO+TlaXi+377R5+t//WGHiuxRZecowOixbzJ5L6PtvuxXnPe1iPyW+CLTMnz
 Bx8Vg5PfK23Woch4LMeisRwTojaNpRcBdtdIR5S5m6721EvE9nL3JvlsE6Jre2YDPr3T
 AJh8jowwAWYNtI36jAIVKvLx4rTpI/+BaKNu5hYB9IcJo/MbY6tFCHSJDoOnEDAoKuRk
 RUQ8PjoQDGIbponowtfYFyEmpiWxI4P5/OeR6VNF02Fw72tPoMaLYIGA8NtJPjccuw/J
 ukpy3sHey1Gz54KaFSeTmMTYb6b8WGbSF6Gg8T6eljn0ANs2uKUptQTwHD15y86NxoKX
 LAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fpSALZ4QvKe+UDR9WTTzY0agA74ILnhkVcpsIKuvJFc=;
 b=KUz63qIzrznQq5G346RCAmE7dI02Ejm4nsk5yvHE54R0Eyjs7C4FFIrm68d0/EUZdD
 C94MULl+iWcIDnxelFcfDuQWSjaj45O4vIQAYGUKwxCfQCFvaC10MGORSG1uJpFYz/ni
 RbGnxfABYKigfJh/yv9dcjoEWaeu28iKdiooiE2NJ3UXD6P7nOWP6KreDxXB5TwodHs/
 +EMWunWNbE1E81UvR8RShfOUPbY3ngAWSibynGMwD+2BBWBBNDYh44KpObln45rNhIyf
 3QGGTXd0tlNoP0ek7W1Kx1Fm5WnnEm05c5GgvhfNzKxwcERMyXBkTeu8lYRAoEbrWigO
 WR+w==
X-Gm-Message-State: AOAM531haP1pS2XLcdFPoITsWymLwt7Vb2ZUAnga+6d2/Jdd+4tmCnSq
 AlDxsuigZlCfLRBbiP5TUxgtfg==
X-Google-Smtp-Source: ABdhPJzNmoRb5MhjYLVoSYZN5a7Ocf740gL5yunnhlVrnbgOOwuLFw+stHp1J5YG021fxxg7hLEtvQ==
X-Received: by 2002:a7b:cb55:: with SMTP id v21mr16795371wmj.19.1623079745978; 
 Mon, 07 Jun 2021 08:29:05 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:29:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 05/13] ASoC: qcom: audioreach: add q6apm support
Date: Mon,  7 Jun 2021 16:28:28 +0100
Message-Id: <20210607152836.17154-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Add support to q6apm (Audio Process Manager) component which is
core Audioreach service running in the DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/dt-bindings/sound/qcom,q6apm.h | 215 ++++++++
 sound/soc/qcom/audioreach/Makefile     |   2 +-
 sound/soc/qcom/audioreach/audioreach.c | 252 +++++++++
 sound/soc/qcom/audioreach/audioreach.h |   6 +
 sound/soc/qcom/audioreach/q6apm.c      | 695 +++++++++++++++++++++++++
 sound/soc/qcom/audioreach/q6apm.h      | 171 ++++++
 6 files changed, 1340 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/sound/qcom,q6apm.h
 create mode 100644 sound/soc/qcom/audioreach/q6apm.c
 create mode 100644 sound/soc/qcom/audioreach/q6apm.h

diff --git a/include/dt-bindings/sound/qcom,q6apm.h b/include/dt-bindings/sound/qcom,q6apm.h
new file mode 100644
index 000000000000..38e3a426b15a
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,q6apm.h
@@ -0,0 +1,215 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_BINDINGS_Q6_APM_H__
+#define __DT_BINDINGS_Q6_APM_H__
+
+#define	MSM_FRONTEND_DAI_MULTIMEDIA1	1
+#define	MSM_FRONTEND_DAI_MULTIMEDIA2	2
+#define	MSM_FRONTEND_DAI_MULTIMEDIA3	3
+#define	MSM_FRONTEND_DAI_MULTIMEDIA4	4
+#define	MSM_FRONTEND_DAI_MULTIMEDIA5	5
+#define	MSM_FRONTEND_DAI_MULTIMEDIA6	6
+#define	MSM_FRONTEND_DAI_MULTIMEDIA7	7
+#define	MSM_FRONTEND_DAI_MULTIMEDIA8	8
+
+/* Audio Process Manager (APM) virtual ports IDs */
+#define HDMI_RX		1
+#define SLIMBUS_0_RX    2
+#define SLIMBUS_0_TX    3
+#define SLIMBUS_1_RX    4
+#define SLIMBUS_1_TX    5
+#define SLIMBUS_2_RX    6
+#define SLIMBUS_2_TX    7
+#define SLIMBUS_3_RX    8
+#define SLIMBUS_3_TX    9
+#define SLIMBUS_4_RX    10
+#define SLIMBUS_4_TX    11
+#define SLIMBUS_5_RX    12
+#define SLIMBUS_5_TX    13
+#define SLIMBUS_6_RX    14
+#define SLIMBUS_6_TX    15
+#define PRIMARY_MI2S_RX		16
+#define PRIMARY_MI2S_TX		17
+#define SECONDARY_MI2S_RX	18
+#define SECONDARY_MI2S_TX	19
+#define TERTIARY_MI2S_RX	20
+#define TERTIARY_MI2S_TX	21
+#define QUATERNARY_MI2S_RX	22
+#define QUATERNARY_MI2S_TX	23
+#define PRIMARY_TDM_RX_0	24
+#define PRIMARY_TDM_TX_0	25
+#define PRIMARY_TDM_RX_1	26
+#define PRIMARY_TDM_TX_1	27
+#define PRIMARY_TDM_RX_2	28
+#define PRIMARY_TDM_TX_2	29
+#define PRIMARY_TDM_RX_3	30
+#define PRIMARY_TDM_TX_3	31
+#define PRIMARY_TDM_RX_4	32
+#define PRIMARY_TDM_TX_4	33
+#define PRIMARY_TDM_RX_5	34
+#define PRIMARY_TDM_TX_5	35
+#define PRIMARY_TDM_RX_6	36
+#define PRIMARY_TDM_TX_6	37
+#define PRIMARY_TDM_RX_7	38
+#define PRIMARY_TDM_TX_7	39
+#define SECONDARY_TDM_RX_0	40
+#define SECONDARY_TDM_TX_0	41
+#define SECONDARY_TDM_RX_1	42
+#define SECONDARY_TDM_TX_1	43
+#define SECONDARY_TDM_RX_2	44
+#define SECONDARY_TDM_TX_2	45
+#define SECONDARY_TDM_RX_3	46
+#define SECONDARY_TDM_TX_3	47
+#define SECONDARY_TDM_RX_4	48
+#define SECONDARY_TDM_TX_4	49
+#define SECONDARY_TDM_RX_5	50
+#define SECONDARY_TDM_TX_5	51
+#define SECONDARY_TDM_RX_6	52
+#define SECONDARY_TDM_TX_6	53
+#define SECONDARY_TDM_RX_7	54
+#define SECONDARY_TDM_TX_7	55
+#define TERTIARY_TDM_RX_0	56
+#define TERTIARY_TDM_TX_0	57
+#define TERTIARY_TDM_RX_1	58
+#define TERTIARY_TDM_TX_1	59
+#define TERTIARY_TDM_RX_2	60
+#define TERTIARY_TDM_TX_2	61
+#define TERTIARY_TDM_RX_3	62
+#define TERTIARY_TDM_TX_3	63
+#define TERTIARY_TDM_RX_4	64
+#define TERTIARY_TDM_TX_4	65
+#define TERTIARY_TDM_RX_5	66
+#define TERTIARY_TDM_TX_5	67
+#define TERTIARY_TDM_RX_6	68
+#define TERTIARY_TDM_TX_6	69
+#define TERTIARY_TDM_RX_7	70
+#define TERTIARY_TDM_TX_7	71
+#define QUATERNARY_TDM_RX_0	72
+#define QUATERNARY_TDM_TX_0	73
+#define QUATERNARY_TDM_RX_1	74
+#define QUATERNARY_TDM_TX_1	75
+#define QUATERNARY_TDM_RX_2	76
+#define QUATERNARY_TDM_TX_2	77
+#define QUATERNARY_TDM_RX_3	78
+#define QUATERNARY_TDM_TX_3	79
+#define QUATERNARY_TDM_RX_4	80
+#define QUATERNARY_TDM_TX_4	81
+#define QUATERNARY_TDM_RX_5	82
+#define QUATERNARY_TDM_TX_5	83
+#define QUATERNARY_TDM_RX_6	84
+#define QUATERNARY_TDM_TX_6	85
+#define QUATERNARY_TDM_RX_7	86
+#define QUATERNARY_TDM_TX_7	87
+#define QUINARY_TDM_RX_0	88
+#define QUINARY_TDM_TX_0	89
+#define QUINARY_TDM_RX_1	90
+#define QUINARY_TDM_TX_1	91
+#define QUINARY_TDM_RX_2	92
+#define QUINARY_TDM_TX_2	93
+#define QUINARY_TDM_RX_3	94
+#define QUINARY_TDM_TX_3	95
+#define QUINARY_TDM_RX_4	96
+#define QUINARY_TDM_TX_4	97
+#define QUINARY_TDM_RX_5	98
+#define QUINARY_TDM_TX_5	99
+#define QUINARY_TDM_RX_6	100
+#define QUINARY_TDM_TX_6	101
+#define QUINARY_TDM_RX_7	102
+#define QUINARY_TDM_TX_7	103
+#define DISPLAY_PORT_RX		104
+#define WSA_CODEC_DMA_RX_0	105
+#define WSA_CODEC_DMA_TX_0	106
+#define WSA_CODEC_DMA_RX_1	107
+#define WSA_CODEC_DMA_TX_1	108
+#define WSA_CODEC_DMA_TX_2	109
+#define VA_CODEC_DMA_TX_0	110
+#define VA_CODEC_DMA_TX_1	111
+#define VA_CODEC_DMA_TX_2	112
+#define RX_CODEC_DMA_RX_0	113
+#define TX_CODEC_DMA_TX_0	114
+#define RX_CODEC_DMA_RX_1	115
+#define TX_CODEC_DMA_TX_1	116
+#define RX_CODEC_DMA_RX_2	117
+#define TX_CODEC_DMA_TX_2	118
+#define RX_CODEC_DMA_RX_3	119
+#define TX_CODEC_DMA_TX_3	120
+#define RX_CODEC_DMA_RX_4	121
+#define TX_CODEC_DMA_TX_4	122
+#define RX_CODEC_DMA_RX_5	123
+#define TX_CODEC_DMA_TX_5	124
+#define RX_CODEC_DMA_RX_6	125
+#define RX_CODEC_DMA_RX_7	126
+
+#define LPASS_CLK_ID_PRI_MI2S_IBIT	1
+#define LPASS_CLK_ID_PRI_MI2S_EBIT	2
+#define LPASS_CLK_ID_SEC_MI2S_IBIT	3
+#define LPASS_CLK_ID_SEC_MI2S_EBIT	4
+#define LPASS_CLK_ID_TER_MI2S_IBIT	5
+#define LPASS_CLK_ID_TER_MI2S_EBIT	6
+#define LPASS_CLK_ID_QUAD_MI2S_IBIT	7
+#define LPASS_CLK_ID_QUAD_MI2S_EBIT	8
+#define LPASS_CLK_ID_SPEAKER_I2S_IBIT	9
+#define LPASS_CLK_ID_SPEAKER_I2S_EBIT	10
+#define LPASS_CLK_ID_SPEAKER_I2S_OSR	11
+#define LPASS_CLK_ID_QUI_MI2S_IBIT	12
+#define LPASS_CLK_ID_QUI_MI2S_EBIT	13
+#define LPASS_CLK_ID_SEN_MI2S_IBIT	14
+#define LPASS_CLK_ID_SEN_MI2S_EBIT	15
+#define LPASS_CLK_ID_INT0_MI2S_IBIT	16
+#define LPASS_CLK_ID_INT1_MI2S_IBIT	17
+#define LPASS_CLK_ID_INT2_MI2S_IBIT	18
+#define LPASS_CLK_ID_INT3_MI2S_IBIT	19
+#define LPASS_CLK_ID_INT4_MI2S_IBIT	20
+#define LPASS_CLK_ID_INT5_MI2S_IBIT	21
+#define LPASS_CLK_ID_INT6_MI2S_IBIT	22
+#define LPASS_CLK_ID_QUI_MI2S_OSR	23
+#define LPASS_CLK_ID_PRI_PCM_IBIT	24
+#define LPASS_CLK_ID_PRI_PCM_EBIT	25
+#define LPASS_CLK_ID_SEC_PCM_IBIT	26
+#define LPASS_CLK_ID_SEC_PCM_EBIT	27
+#define LPASS_CLK_ID_TER_PCM_IBIT	28
+#define LPASS_CLK_ID_TER_PCM_EBIT	29
+#define LPASS_CLK_ID_QUAD_PCM_IBIT	30
+#define LPASS_CLK_ID_QUAD_PCM_EBIT	31
+#define LPASS_CLK_ID_QUIN_PCM_IBIT	32
+#define LPASS_CLK_ID_QUIN_PCM_EBIT	33
+#define LPASS_CLK_ID_QUI_PCM_OSR	34
+#define LPASS_CLK_ID_PRI_TDM_IBIT	35
+#define LPASS_CLK_ID_PRI_TDM_EBIT	36
+#define LPASS_CLK_ID_SEC_TDM_IBIT	37
+#define LPASS_CLK_ID_SEC_TDM_EBIT	38
+#define LPASS_CLK_ID_TER_TDM_IBIT	39
+#define LPASS_CLK_ID_TER_TDM_EBIT	40
+#define LPASS_CLK_ID_QUAD_TDM_IBIT	41
+#define LPASS_CLK_ID_QUAD_TDM_EBIT	42
+#define LPASS_CLK_ID_QUIN_TDM_IBIT	43
+#define LPASS_CLK_ID_QUIN_TDM_EBIT	44
+#define LPASS_CLK_ID_QUIN_TDM_OSR	45
+#define LPASS_CLK_ID_MCLK_1		46
+#define LPASS_CLK_ID_MCLK_2		47
+#define LPASS_CLK_ID_MCLK_3		48
+#define LPASS_CLK_ID_MCLK_4		49
+#define LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE	50
+#define LPASS_CLK_ID_INT_MCLK_0		51
+#define LPASS_CLK_ID_INT_MCLK_1		52
+#define LPASS_CLK_ID_MCLK_5		53
+#define LPASS_CLK_ID_WSA_CORE_MCLK	54
+#define LPASS_CLK_ID_WSA_CORE_NPL_MCLK	55
+#define LPASS_CLK_ID_VA_CORE_MCLK	56
+#define LPASS_CLK_ID_TX_CORE_MCLK	57
+#define LPASS_CLK_ID_TX_CORE_NPL_MCLK	58
+#define LPASS_CLK_ID_RX_CORE_MCLK	59
+#define LPASS_CLK_ID_RX_CORE_NPL_MCLK	60
+#define LPASS_CLK_ID_VA_CORE_2X_MCLK	61
+
+#define LPASS_HW_AVTIMER_VOTE		101
+#define LPASS_HW_MACRO_VOTE		102
+#define LPASS_HW_DCODEC_VOTE		103
+
+#define Q6APM_MAX_CLK_ID			104
+
+#define LPASS_CLK_ATTRIBUTE_INVALID		0x0
+#define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
+#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVIDEND	0x2
+#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR	0x3
+
+#endif /* __DT_BINDINGS_Q6_APM_H__ */
diff --git a/sound/soc/qcom/audioreach/Makefile b/sound/soc/qcom/audioreach/Makefile
index 575edbed29a2..d76afc51556b 100644
--- a/sound/soc/qcom/audioreach/Makefile
+++ b/sound/soc/qcom/audioreach/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-ar-objs := audioreach.o
+snd-ar-objs := audioreach.o q6apm.o
 
 obj-$(CONFIG_SND_SOC_QCOM_AUDIOREACH) += snd-ar.o
 
diff --git a/sound/soc/qcom/audioreach/audioreach.c b/sound/soc/qcom/audioreach/audioreach.c
index 617163473b1c..7291adb37d49 100644
--- a/sound/soc/qcom/audioreach/audioreach.c
+++ b/sound/soc/qcom/audioreach/audioreach.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/gpr.h>
 #include <dt-bindings/soc/qcom,gpr.h>
+#include "q6apm.h"
 #include "audioreach.h"
 
 /* SubGraph Config */
@@ -277,3 +278,254 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode,
 				       APM_MODULE_INSTANCE_ID,
 				       true);
 }
+
+static void apm_populate_container_config(
+			struct apm_container_obj *cfg,
+			struct audioreach_container *cont)
+{
+
+	/* Container Config */
+	cfg->container_cfg.container_id = cont->container_id;
+	cfg->container_cfg.num_prop = 4;
+
+	/* Capablity list */
+	cfg->cap_data.prop_id = APM_CONTAINER_PROP_ID_CAPABILITY_LIST;
+	cfg->cap_data.prop_size = APM_CONTAINER_PROP_ID_CAPABILITY_SIZE;
+	cfg->num_capablity_id = 1;
+	cfg->capability_id = cont->capability_id;
+
+	/* Graph Position */
+	cfg->pos_data.prop_id = APM_CONTAINER_PROP_ID_GRAPH_POS;
+	cfg->pos_data.prop_size = sizeof(struct apm_cont_prop_id_graph_pos);
+	cfg->pos.graph_pos = cont->graph_pos;
+
+	/* Stack size */
+	cfg->stack_data.prop_id = APM_CONTAINER_PROP_ID_STACK_SIZE;
+	cfg->stack_data.prop_size = sizeof(struct
+					       apm_cont_prop_id_stack_size);
+	cfg->stack.stack_size = cont->stack_size;
+
+	/* Proc domain */
+	cfg->domain_data.prop_id = APM_CONTAINER_PROP_ID_PROC_DOMAIN;
+	cfg->domain_data.prop_size = sizeof(struct
+					       apm_cont_prop_id_domain);
+	cfg->domain.proc_domain = cont->proc_domain;
+}
+
+static void apm_populate_sub_graph_config(
+			struct apm_sub_graph_data *cfg,
+			struct audioreach_sub_graph *sg)
+{
+	cfg->sub_graph_cfg.sub_graph_id = sg->sub_graph_id;
+	cfg->sub_graph_cfg.num_sub_graph_prop = APM_SUB_GRAPH_CFG_NPROP;
+
+	/* Perf Mode */
+	cfg->perf_data.prop_id = APM_SUB_GRAPH_PROP_ID_PERF_MODE;
+	cfg->perf_data.prop_size = APM_SG_PROP_ID_PERF_MODE_SIZE;
+	cfg->perf.perf_mode = sg->perf_mode;
+
+	/* Direction */
+	cfg->dir_data.prop_id = APM_SUB_GRAPH_PROP_ID_DIRECTION;
+	cfg->dir_data.prop_size = APM_SG_PROP_ID_DIR_SIZE;
+	cfg->dir.direction = sg->direction;
+
+	/* Scenario ID */
+	cfg->sid_data.prop_id = APM_SUB_GRAPH_PROP_ID_SCENARIO_ID;
+	cfg->sid_data.prop_size = APM_SG_PROP_ID_SID_SIZE;
+	cfg->sid.scenario_id = sg->scenario_id;
+}
+
+static void apm_populate_connection_obj(struct apm_module_conn_obj *obj,
+					struct audioreach_module *module)
+{
+	obj->src_mod_inst_id = module->src_mod_inst_id;
+	obj->src_mod_op_port_id = module->src_mod_op_port_id;
+	obj->dst_mod_inst_id = module->instance_id;
+	obj->dst_mod_ip_port_id =	module->in_port;
+}
+
+static void apm_populate_module_prop_obj(struct apm_mod_prop_obj *obj,
+					 struct audioreach_module *module)
+{
+
+	obj->instance_id = module->instance_id;
+	obj->num_props = 1;
+	obj->prop_data_1.prop_id = APM_MODULE_PROP_ID_PORT_INFO;
+	obj->prop_data_1.prop_size = APM_MODULE_PROP_ID_PORT_INFO_SZ;
+	obj->prop_id_port.max_ip_port = module->max_ip_port;
+	obj->prop_id_port.max_op_port = module->max_op_port;
+}
+
+static void apm_populate_module_list_obj(struct apm_mod_list_obj *obj,
+					 struct audioreach_container *container,
+					 int sub_graph_id)
+{
+	struct audioreach_module *module;
+	int i;
+
+	obj->sub_graph_id = sub_graph_id;
+	obj->container_id = container->container_id;
+	obj->num_modules = container->num_modules;
+	i = 0;
+	list_for_each_entry(module, &container->modules_list, node) {
+		obj->mod_cfg[i].module_id = module->module_id;
+		obj->mod_cfg[i].instance_id = module->instance_id;
+		i++;
+	}
+}
+
+static void audioreach_populate_graph(struct apm_graph_open_params *open,
+				      struct list_head *sg_list,
+				      int num_sub_graphs)
+{
+	struct apm_sub_graph_params *sg_data = open->sg_data;
+	struct apm_container_params *c_data = open->cont_data;
+	struct apm_module_list_params *ml_data = open->mod_list_data;
+	struct apm_prop_list_params *mp_data = open->mod_prop_data;
+	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
+	struct apm_container_obj *cobj;
+	struct audioreach_container *container;
+	struct audioreach_module *module;
+	struct apm_mod_list_obj *mlobj;
+	struct apm_mod_prop_obj *module_prop_obj;
+	struct apm_module_conn_obj *conn_obj;
+	int ncontainer = 0, nmodule = 0, nconn = 0;
+	struct audioreach_sub_graph *sg;
+	int i = 0;
+
+	mlobj = &ml_data->mod_list_obj[0];
+
+	list_for_each_entry(sg, sg_list, node) {
+		struct apm_sub_graph_data *sg_cfg = &sg_data->sg_cfg[i++];
+
+		apm_populate_sub_graph_config(sg_cfg, sg);
+
+		list_for_each_entry(container, &sg->container_list, node) {
+			cobj = &c_data->cont_obj[ncontainer];
+
+			apm_populate_container_config(cobj, container);
+			apm_populate_module_list_obj(mlobj, container,
+						     sg->sub_graph_id);
+
+			list_for_each_entry(module, &container->modules_list, node) {
+				uint32_t src_mod_inst_id;
+
+				src_mod_inst_id = module->src_mod_inst_id;
+
+				module_prop_obj = &mp_data->mod_prop_obj[nmodule];
+				apm_populate_module_prop_obj(module_prop_obj,
+							     module);
+
+				if (src_mod_inst_id /*&& dst_mod_inst_id*/) {
+					conn_obj = &mc_data->conn_obj[nconn];
+					apm_populate_connection_obj(conn_obj, module);
+					nconn++;
+				}
+
+				nmodule++;
+			}
+			mlobj = (void *) mlobj +
+				APM_MOD_LIST_OBJ_PSIZE(container->num_modules);
+
+			ncontainer++;
+		}
+	}
+}
+
+void *audioreach_alloc_graph_pkt(struct q6apm *apm,
+				 struct list_head *sg_list,
+				 int graph_id)
+{
+	void *p;
+	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	struct gpr_pkt *pkt;
+	struct apm_graph_open_params params;
+	struct apm_module_param_data  *param_data;
+	struct audioreach_container *container;
+	int num_containers = 0;
+	int num_modules = 0;
+	int num_modules_list;
+	int num_modules_per_list;
+	int num_connections = 0;
+	int num_sub_graphs = 0;
+	struct audioreach_sub_graph *sgs;
+	struct audioreach_module *module;
+
+	list_for_each_entry(sgs, sg_list, node) {
+		num_sub_graphs++;
+		list_for_each_entry(container, &sgs->container_list, node) {
+			num_containers++;
+			num_modules += container->num_modules;
+			list_for_each_entry(module, &container->modules_list, node) {
+				if (module->src_mod_inst_id)
+					num_connections++;
+			}
+		}
+	}
+
+	num_modules_list = num_containers;
+	num_modules_per_list = num_modules/num_containers;
+	sg_sz = APM_SUB_GRAPH_PSIZE(num_sub_graphs);
+	cont_sz = APM_CONTAINER_PSIZE(num_containers);
+	ml_sz =	APM_MOD_LIST_PSIZE(num_modules_list, num_modules_per_list);
+	mp_sz = APM_MOD_PROP_PSIZE(num_modules);
+	mc_sz =	APM_MOD_CONN_PSIZE(num_connections);
+
+	payload_size = sg_sz + cont_sz + ml_sz + mp_sz + mc_sz;
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
+	if (IS_ERR(p))
+		return p;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	// SG
+	params.sg_data = p;
+	param_data = &params.sg_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_SUB_GRAPH_CONFIG;
+	param_data->param_size = sg_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.sg_data->num_sub_graphs = num_sub_graphs;
+	p += sg_sz;
+
+	//CONT
+	params.cont_data = p;
+	param_data = &params.cont_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_CONTAINER_CONFIG;
+	param_data->param_size = cont_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.cont_data->num_containers = num_containers;
+	p += cont_sz;
+
+	// ML List
+	params.mod_list_data = p;
+	param_data = &params.mod_list_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_LIST;
+	param_data->param_size = ml_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_list_data->num_modules_list = num_sub_graphs;
+	p += ml_sz;
+
+	// MOD PROP
+	params.mod_prop_data = p;
+	param_data = &params.mod_prop_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_PROP;
+	param_data->param_size = mp_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_prop_data->num_modules_prop_cfg = num_modules;
+	p += mp_sz;
+
+	// MOD CONN
+	params.mod_conn_list_data = p;
+	param_data = &params.mod_conn_list_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_CONN;
+	param_data->param_size = mc_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_conn_list_data->num_connections = num_connections;
+	p += mc_sz;
+
+	audioreach_populate_graph(&params, sg_list, num_sub_graphs);
+
+	return pkt;
+}
+
diff --git a/sound/soc/qcom/audioreach/audioreach.h b/sound/soc/qcom/audioreach/audioreach.h
index 872e400dce6c..e5736fdda66b 100644
--- a/sound/soc/qcom/audioreach/audioreach.h
+++ b/sound/soc/qcom/audioreach/audioreach.h
@@ -5,6 +5,9 @@
 #include <linux/types.h>
 #include <linux/soc/qcom/gpr.h>
 #include <sound/soc.h>
+struct q6apm;
+struct q6apm_graph;
+
 
 /* Module IDs */
 #define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
@@ -621,4 +624,7 @@ void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
 				uint32_t src_port);
 void *audioreach_alloc_pkt(int pkt_size, uint32_t opcode, uint32_t token,
 				uint32_t src_port, uint32_t dest_port);
+void *audioreach_alloc_graph_pkt(struct q6apm *apm,
+				 struct list_head *sg_list,
+				  int graph_id);
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/audioreach/q6apm.c b/sound/soc/qcom/audioreach/q6apm.c
new file mode 100644
index 000000000000..d0deb69114b0
--- /dev/null
+++ b/sound/soc/qcom/audioreach/q6apm.c
@@ -0,0 +1,695 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, Linaro Limited
+
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/gpr.h>
+#include <linux/wait.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm.h>
+#include "audioreach.h"
+#include "q6apm.h"
+
+/* Graph Management */
+struct apm_graph_mgmt_cmd {
+	struct apm_module_param_data param_data;
+	uint32_t num_sub_graphs;
+	uint32_t sub_graph_id_list[0];
+} __packed;
+
+#define APM_GRAPH_MGMT_PSIZE(n) ALIGN(sizeof(struct apm_graph_mgmt_cmd) + \
+				      n * sizeof(uint32_t), 8)
+
+int q6apm_send_cmd(struct q6apm *apm, struct gpr_pkt *pkt)
+{
+	int rc;
+
+	mutex_lock(&apm->cmd_lock);
+	rc = gpr_send_pkt(apm->gdev, pkt);
+	mutex_unlock(&apm->cmd_lock);
+
+	return rc;
+}
+
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+			uint32_t rsp_opcode)
+{
+	struct gpr_device *gdev = apm->gdev;
+	struct gpr_hdr *hdr = &pkt->hdr;
+	int rc;
+
+	mutex_lock(&apm->cmd_lock);
+	apm->result.opcode = 0;
+	apm->result.status = 0;
+
+	rc = gpr_send_pkt(apm->gdev, pkt);
+	if (rc < 0)
+		goto err;
+
+	if (rsp_opcode)
+		rc = wait_event_timeout(apm->wait,
+					(apm->result.opcode == hdr->opcode) ||
+					(apm->result.opcode == rsp_opcode),
+					5 * HZ);
+	else
+		rc = wait_event_timeout(apm->wait,
+					(apm->result.opcode == hdr->opcode),
+					5 * HZ);
+
+	if (!rc) {
+		dev_err(&gdev->dev, "CMD timeout for [%x] opcode\n",
+			hdr->opcode);
+		rc = -ETIMEDOUT;
+	} else if (apm->result.status > 0) {
+		dev_err(&gdev->dev, "DSP returned error[%x] %x\n", hdr->opcode,
+			apm->result.status);
+		rc = -EINVAL;
+	} else {
+		dev_err(&gdev->dev, "DSP returned [%x]\n",
+			apm->result.status);
+		rc = 0;
+	}
+
+err:
+	mutex_unlock(&apm->cmd_lock);
+	return rc;
+}
+
+static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm,
+						      uint32_t graph_id)
+{
+	struct audioreach_graph *graph = NULL;
+	struct audioreach_graph_info *info;
+	unsigned long flags;
+
+	spin_lock_irqsave(&apm->lock, flags);
+	graph = idr_find(&apm->graph_idr, graph_id);
+	spin_unlock_irqrestore(&apm->lock, flags);
+
+	if (graph) {
+		kref_get(&graph->refcount);
+		return graph;
+	}
+
+	info = idr_find(&apm->graph_info_idr, graph_id);
+
+	if (!info)
+		return ERR_PTR(-ENODEV);
+
+	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
+	if (!graph)
+		return ERR_PTR(-ENOMEM);
+
+	graph->apm = apm;
+	graph->info = info;
+	graph->id = graph_id;
+
+	/* Assuming Linear Graphs only for now! */
+	graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list, graph_id);
+	if (IS_ERR(graph->graph))
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock(&apm->lock);
+	idr_alloc(&apm->graph_idr, graph, graph_id,
+		  graph_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	kref_init(&graph->refcount);
+
+	q6apm_send_cmd_sync(apm, graph->graph, 0);
+
+	return graph;
+}
+
+static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph,
+				      uint32_t opcode)
+{
+	struct gpr_pkt *pkt;
+	void *p;
+	int i = 0, rc, payload_size;
+	struct q6apm *apm = graph->apm;
+	struct audioreach_graph_info *info = graph->info;
+	int num_sub_graphs = info->num_sub_graphs;
+	struct apm_graph_mgmt_cmd *mgmt_cmd;
+	struct apm_module_param_data *param_data;
+	struct audioreach_sub_graph *sg;
+
+	payload_size = APM_GRAPH_MGMT_PSIZE(num_sub_graphs);
+
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	mgmt_cmd = p;
+	mgmt_cmd->num_sub_graphs = num_sub_graphs;
+
+	param_data = &mgmt_cmd->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_SUB_GRAPH_LIST;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	list_for_each_entry(sg, &info->sg_list, node) {
+		mgmt_cmd->sub_graph_id_list[i++] = sg->sub_graph_id;
+	}
+
+	rc = q6apm_send_cmd_sync(apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static void q6apm_put_audioreach_graph(struct kref *ref)
+{
+	struct audioreach_graph *graph;
+	struct q6apm *apm;
+	unsigned long flags;
+
+	graph = container_of(ref, struct audioreach_graph, refcount);
+	apm = graph->apm;
+
+	audioreach_graph_mgmt_cmd(graph, APM_CMD_GRAPH_CLOSE);
+
+	spin_lock_irqsave(&apm->lock, flags);
+	graph = idr_remove(&apm->graph_idr, graph->id);
+	spin_unlock_irqrestore(&apm->lock, flags);
+
+	kfree(graph->graph);
+	kfree(graph);
+}
+
+static bool q6apm_get_apm_state(struct q6apm *apm)
+{
+	struct gpr_pkt *pkt;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0);
+	if (IS_ERR(pkt))
+		return -ENOMEM;
+
+	q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);
+
+	kfree(pkt);
+
+	return !apm->state ? false : true;
+}
+
+static struct audioreach_module *__q6apm_find_module_by_mid(struct q6apm *apm,
+					     struct audioreach_graph_info *info,
+					     uint32_t mid)
+{
+	struct audioreach_sub_graph *sgs;
+	struct audioreach_container *container;
+	struct audioreach_module *module;
+
+	list_for_each_entry(sgs, &info->sg_list, node) {
+		list_for_each_entry(container, &sgs->container_list, node) {
+			list_for_each_entry(module, &container->modules_list, node) {
+				if (mid == module->module_id)
+					return module;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+static struct audioreach_module *q6apm_graph_get_last_module(struct q6apm *apm,
+							     u32 sgid)
+{
+	struct audioreach_sub_graph *sg;
+	struct audioreach_module *module;
+	struct audioreach_container *container;
+
+	spin_lock(&apm->lock);
+	sg = idr_find(&apm->sub_graphs_idr, sgid);
+	spin_unlock(&apm->lock);
+	if (!sg)
+		return NULL;
+
+	container = list_last_entry(&sg->container_list, struct audioreach_container, node);
+	module = list_last_entry(&container->modules_list, struct audioreach_module, node);
+
+	return module;
+}
+
+static struct audioreach_module *q6apm_graph_get_first_module(struct q6apm *apm,
+							      u32 sgid)
+{
+	struct audioreach_sub_graph *sg;
+	struct audioreach_module *module;
+	struct audioreach_container *container;
+
+	spin_lock(&apm->lock);
+	sg = idr_find(&apm->sub_graphs_idr, sgid);
+	spin_unlock(&apm->lock);
+	if (!sg)
+		return NULL;
+
+	container = list_first_entry(&sg->container_list, struct audioreach_container, node);
+	module = list_first_entry(&container->modules_list, struct audioreach_module, node);
+
+	return module;
+}
+
+bool q6apm_is_sub_graphs_connected(struct q6apm *apm, u32 src_sgid, u32 dst_sgid)
+{
+	struct audioreach_module *module;
+	u32 iid;
+
+	module = q6apm_graph_get_last_module(apm, src_sgid);
+	if (!module)
+		return false;
+
+	iid = module->instance_id;
+	module = q6apm_graph_get_first_module(apm, dst_sgid);
+	if (!module)
+		return false;
+
+	if (module->src_mod_inst_id == iid)
+		return true;
+
+	return false;
+}
+
+int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid,
+			     u32 dst_sgid, bool connect)
+{
+
+	struct audioreach_module *module;
+	u32 iid;
+
+	if (connect) {
+		module = q6apm_graph_get_last_module(apm, src_sgid);
+		if (!module)
+			return -ENODEV;
+
+		iid = module->instance_id;
+	} else {
+		iid = 0;
+	}
+
+	module = q6apm_graph_get_first_module(apm, dst_sgid);
+	if (!module)
+		return ENODEV;
+
+	/* set src module in dst subgraph first module */
+	module->src_mod_inst_id = iid;
+
+	return 0;
+}
+
+int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
+	if (!module)
+		return -ENODEV;
+
+	return module->instance_id;
+
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_get_rx_shmem_module_iid);
+
+static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
+{
+	struct q6apm_graph *graph = priv;
+	struct device *dev = graph->dev;
+	struct gpr_hdr *hdr = &data->hdr;
+	struct gpr_ibasic_rsp_result_t *result;
+	int ret = -EINVAL;
+	uint32_t client_event = 0;
+
+	result = data->payload;
+
+	switch (hdr->opcode) {
+	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:
+		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
+		if (graph) {
+			struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
+			phys_addr_t phys;
+			unsigned long flags;
+
+			spin_lock_irqsave(&graph->lock, flags);
+
+			done = data->payload;
+			phys = graph->rx_data.buf[hdr->token].phys;
+
+			if (lower_32_bits(phys) != done->buf_addr_lsw ||
+			    upper_32_bits(phys) != done->buf_addr_msw) {
+				dev_err(dev, "WR BUFF Expected Token %d addr %pa\n", hdr->token, &phys);
+				ret = -EINVAL;
+			} else {
+				ret = 0;
+				graph->result.opcode = hdr->opcode;
+				graph->result.status = done->status;
+			}
+			spin_unlock_irqrestore(&graph->lock, flags);
+		} else {
+			dev_err(dev, "No SH Mem module found\n");
+			ret = -EINVAL;
+		}
+		if (graph->cb)
+			graph->cb(client_event, hdr->token, data->payload,
+				  graph->priv);
+
+		break;
+	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
+		if (graph) {
+			struct apm_cmd_rsp_shared_mem_map_regions *rsp;
+
+			graph->result.opcode = hdr->opcode;
+			graph->result.status = 0;
+			rsp = data->payload;
+
+			if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
+				graph->rx_data.mem_map_handle = rsp->mem_map_handle;
+			else
+				graph->tx_data.mem_map_handle = rsp->mem_map_handle;
+
+			wake_up(&graph->cmd_wait);
+			ret = 0;
+		}
+		break;
+	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:
+		if (graph) {
+			struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *done;
+			unsigned long flags;
+			phys_addr_t phys;
+
+			done = data->payload;
+			spin_lock_irqsave(&graph->lock, flags);
+			phys = graph->tx_data.buf[hdr->token].phys;
+			if (upper_32_bits(phys) != done->buf_addr_msw ||
+			    lower_32_bits(phys) != done->buf_addr_lsw) {
+				dev_err(dev, "RD BUFF Expected addr %pa %08x-%08x\n",
+					&phys,
+					done->buf_addr_lsw,
+					done->buf_addr_msw);
+				ret = -EINVAL;
+				//goto done;
+			} else {
+				ret = 0;
+			}
+			spin_unlock_irqrestore(&graph->lock, flags);
+			client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
+			wake_up(&graph->cmd_wait);
+
+			if (graph->cb)
+				graph->cb(client_event, hdr->token, data->payload,
+					  graph->priv);
+		}
+
+		break;
+	case DATA_CMD_WR_SH_MEM_EP_EOS_RENDERED:
+		break;
+	case GPR_BASIC_RSP_RESULT:
+		switch (result->opcode) {
+		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
+			if (graph) {
+				graph->result.opcode = result->opcode;
+				graph->result.status = 0;
+				if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
+					graph->rx_data.mem_map_handle = 0;
+				else
+					graph->tx_data.mem_map_handle = 0;
+
+				wake_up(&graph->cmd_wait);
+				ret = 0;
+			}
+
+		break;
+		case APM_CMD_SHARED_MEM_MAP_REGIONS:
+		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
+		case APM_CMD_SET_CFG:
+			graph->result.opcode = result->opcode;
+			graph->result.status = result->status;
+			if (result->status) {
+				dev_err(dev,
+					"Error (%d) Processing 0x%08x cmd\n",
+					result->status, result->opcode);
+				ret = -EINVAL;
+			} else {
+				ret = 0;
+			}
+			wake_up(&graph->cmd_wait);
+			if (graph->cb)
+				graph->cb(client_event, hdr->token, data->payload,
+					  graph->priv);
+
+		}
+		break;
+	}
+
+	return ret;
+}
+
+struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
+				     void *priv, int graph_id)
+{
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct q6apm_graph *graph;
+	struct audioreach_graph *ar_graph;
+	int ret;
+
+	dev_err(dev, "%s :graph id %d\n",__func__, graph_id);
+	ar_graph = q6apm_get_audioreach_graph(apm, graph_id);
+	if (IS_ERR(ar_graph)) {
+		dev_err(dev, "No graph found with id %d\n", graph_id);
+		return ERR_CAST(ar_graph);
+	}
+
+	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
+	if (!graph) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	graph->apm = apm;
+	graph->priv = priv;
+	graph->cb = cb;
+	graph->info = ar_graph->info;
+	graph->ar_graph = ar_graph;
+	graph->id = ar_graph->id;
+	graph->dev = dev;
+
+	spin_lock_init(&graph->lock);
+	init_waitqueue_head(&graph->cmd_wait);
+	mutex_init(&graph->cmd_lock);
+
+	graph->port = gpr_alloc_port(apm->gdev, dev, graph_callback, graph);
+	if (!graph->port) {
+		kfree(graph);
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	dev_dbg(dev, "%s: GRAPH-DEBUG Opening graph id %d with port id 0x%08x \n", __func__,
+		graph_id, graph->port->id);
+
+	return graph;
+err:
+	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
+	return ERR_PTR(ret);
+}
+
+int q6apm_graph_close(struct q6apm_graph *graph)
+{
+	struct audioreach_graph *ar_graph = graph->ar_graph;
+
+	gpr_free_port(graph->port);
+	graph->port = NULL;
+	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
+	kfree(graph);
+
+	return 0;
+}
+
+int q6apm_graph_prepare(struct q6apm_graph *graph)
+{
+	return audioreach_graph_mgmt_cmd(graph->ar_graph,
+					  APM_CMD_GRAPH_PREPARE);
+}
+
+int q6apm_graph_start(struct q6apm_graph *graph)
+{
+	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret = 0;
+
+	if (ar_graph->start_count == 0)
+		ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_START);
+
+	ar_graph->start_count++;
+
+	return ret;
+}
+
+int q6apm_graph_stop(struct q6apm_graph *graph)
+{
+	struct audioreach_graph *ar_graph = graph->ar_graph;
+
+	if (--ar_graph->start_count > 0)
+		return 0;
+
+	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+}
+
+int q6apm_graph_flush(struct q6apm_graph *graph)
+{
+	return audioreach_graph_mgmt_cmd(graph->ar_graph, APM_CMD_GRAPH_FLUSH);
+}
+
+static int q6apm_audio_probe(struct snd_soc_component *component)
+{
+	return 0;
+}
+
+static void q6apm_audio_remove(struct snd_soc_component *component)
+{
+}
+
+#define APM_AUDIO_DRV_NAME "q6apm-audio"
+
+static const struct snd_soc_component_driver q6apm_audio_component = {
+	.name		= APM_AUDIO_DRV_NAME,
+	.probe		= q6apm_audio_probe,
+	.remove		= q6apm_audio_remove,
+};
+
+static int apm_probe(struct gpr_device *gdev)
+{
+	struct device *dev = &gdev->dev;
+	struct q6apm *apm;
+
+	apm = devm_kzalloc(dev, sizeof(*apm), GFP_KERNEL);
+	if (!apm)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, apm);
+
+	mutex_init(&apm->cmd_lock);
+	apm->dev = dev;
+	apm->gdev = gdev;
+	init_waitqueue_head(&apm->wait);
+
+	idr_init(&apm->graph_idr);
+	idr_init(&apm->graph_info_idr);
+	idr_init(&apm->sub_graphs_idr);
+	idr_init(&apm->containers_idr);
+
+	idr_init(&apm->modules_idr);
+	spin_lock_init(&apm->lock);
+
+	q6apm_get_apm_state(apm);
+
+	devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+
+	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+}
+
+static int apm_exit(struct gpr_device *gdev)
+{
+	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
+
+	kfree(apm);
+
+	return 0;
+}
+
+struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph,
+						    uint32_t mid)
+{
+	struct audioreach_graph_info *info = graph->info;
+	struct q6apm *apm = graph->apm;
+
+	return __q6apm_find_module_by_mid(apm, info, mid);
+
+}
+
+struct audioreach_module *q6apm_find_module(struct q6apm *apm, uint32_t iid)
+{
+	struct audioreach_module *module;
+	unsigned long flags;
+
+	spin_lock_irqsave(&apm->lock, flags);
+	module = idr_find(&apm->modules_idr, iid);
+	spin_unlock_irqrestore(&apm->lock, flags);
+
+	return module;
+}
+
+static int apm_callback(struct gpr_resp_pkt *data, void *priv, int op)
+{
+	struct gpr_device *gdev = priv;
+	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
+	struct device *dev = &gdev->dev;
+	struct gpr_ibasic_rsp_result_t *result;
+	struct gpr_hdr *hdr = &data->hdr;
+	int ret = -EINVAL;
+
+	result = data->payload;
+
+	switch (hdr->opcode) {
+	case APM_CMD_RSP_GET_SPF_STATE:
+		apm->result.opcode = hdr->opcode;
+		apm->result.status = 0;
+		wake_up(&apm->wait);
+		break;
+	case GPR_BASIC_RSP_RESULT:
+		switch (result->opcode) {
+		case APM_CMD_GRAPH_START:
+		case APM_CMD_GRAPH_OPEN:
+		case APM_CMD_GRAPH_PREPARE:
+		case APM_CMD_GRAPH_CLOSE:
+		case APM_CMD_GRAPH_FLUSH:
+		case APM_CMD_GRAPH_STOP:
+		case APM_CMD_SET_CFG:
+			apm->result.opcode = result->opcode;
+			apm->result.status = result->status;
+			if (result->status) {
+				dev_err(dev,
+					"Error (%d) Processing 0x%08x cmd\n",
+					result->status, result->opcode);
+				ret = -EINVAL;
+			} else {
+				ret = 0;
+			}
+			wake_up(&apm->wait);
+
+		}
+		break;
+	}
+
+	return ret;
+}
+
+static const struct of_device_id apm_device_id[]  = {
+	{ .compatible = "qcom,q6apm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apm_device_id);
+
+static struct gpr_driver apm_driver = {
+	.probe = apm_probe,
+	.remove = apm_exit,
+	.callback = apm_callback,
+	.driver = {
+		.name = "qcom-apm",
+		.of_match_table = of_match_ptr(apm_device_id),
+	},
+};
+
+module_gpr_driver(apm_driver);
+MODULE_DESCRIPTION("Audio Process Manager");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/audioreach/q6apm.h b/sound/soc/qcom/audioreach/q6apm.h
new file mode 100644
index 000000000000..3c8ecafae13b
--- /dev/null
+++ b/sound/soc/qcom/audioreach/q6apm.h
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __Q6APM_H__
+#define __Q6APM_H__
+#include <linux/types.h>
+#include <linux/soc/qcom/gpr.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/sched.h>
+#include <linux/of.h>
+#include <linux/delay.h>
+#include <sound/soc.h>
+#include <linux/of_platform.h>
+#include <linux/jiffies.h>
+#include <linux/soc/qcom/gpr.h>
+#include <dt-bindings/sound/qcom,q6apm.h>
+#include "audioreach.h"
+
+#define APM_PORT_MAX		127
+#define APM_PORT_MAX_AUDIO_CHAN_CNT 8
+#define PCM_CHANNEL_NULL 0
+#define PCM_CHANNEL_FL    1	/* Front left channel. */
+#define PCM_CHANNEL_FR    2	/* Front right channel. */
+#define PCM_CHANNEL_FC    3	/* Front center channel. */
+#define PCM_CHANNEL_LS   4	/* Left surround channel. */
+#define PCM_CHANNEL_RS   5	/* Right surround channel. */
+#define PCM_CHANNEL_LFE  6	/* Low frequency effect channel. */
+#define PCM_CHANNEL_CS   7	/* Center surround channel; Rear center ch */
+#define PCM_CHANNEL_LB   8	/* Left back channel; Rear left channel. */
+#define PCM_CHANNEL_RB   9	/* Right back channel; Rear right channel. */
+#define PCM_CHANNELS   10	/* Top surround channel. */
+
+#define NO_TIMESTAMP    0xFF00
+#define FORMAT_LINEAR_PCM   0x0000
+/* APM client callback events */
+#define CMD_EOS				0x0003
+#define APM_CLIENT_EVENT_CMD_EOS_DONE		0x1003
+#define CMD_CLOSE				0x0004
+#define APM_CLIENT_EVENT_CMD_CLOSE_DONE		0x1004
+#define APM_CLIENT_EVENT_CMD_RUN_DONE		0x1008
+#define APM_CLIENT_EVENT_DATA_WRITE_DONE	0x1009
+#define APM_CLIENT_EVENT_DATA_READ_DONE		0x100a
+#define MAX_SESSIONS	8
+
+struct q6apm {
+	struct device *dev;
+	struct gpr_port *port;
+	struct gpr_device *gdev;
+	/* For Graph OPEN/START/STOP/CLOSE operations */
+	wait_queue_head_t wait;
+	struct gpr_ibasic_rsp_result_t result;
+
+	struct mutex cmd_lock;
+	uint32_t state;
+
+	spinlock_t lock;
+	struct idr graph_idr;
+	struct idr graph_info_idr;
+	struct idr sub_graphs_idr;
+	struct idr containers_idr;
+	struct idr modules_idr;
+};
+
+struct audio_buffer {
+	phys_addr_t phys;
+	uint32_t size;		/* size of buffer */
+};
+
+struct audioreach_graph_data {
+	struct audio_buffer *buf;
+	uint32_t num_periods;
+	uint32_t dsp_buf;
+	uint32_t mem_map_handle;
+};
+
+struct audioreach_graph {
+	struct audioreach_graph_info *info;
+	uint32_t id;
+	int state;
+	int start_count;
+	/* Cached Graph data */
+	void *graph;
+	struct kref refcount;
+	struct q6apm *apm;
+};
+
+typedef void (*q6apm_cb) (uint32_t opcode, uint32_t token,
+			  void *payload, void *priv);
+struct q6apm_graph {
+	void *priv;
+	q6apm_cb cb;
+	uint32_t id;
+	struct device *dev;
+	struct q6apm *apm;
+	struct gpr_port *port;
+	struct audioreach_graph_data rx_data;
+	struct audioreach_graph_data tx_data;
+	struct gpr_ibasic_rsp_result_t result;
+	spinlock_t lock;
+	wait_queue_head_t cmd_wait;
+	struct mutex cmd_lock;
+	struct audioreach_graph *ar_graph;
+	struct audioreach_graph_info *info;
+};
+
+/* Graph Operations */
+struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
+				     void *priv, int graph_id);
+int q6apm_graph_close(struct q6apm_graph *graph);
+int q6apm_graph_prepare(struct q6apm_graph *graph);
+int q6apm_graph_start(struct q6apm_graph *graph);
+int q6apm_graph_stop(struct q6apm_graph *graph);
+int q6apm_graph_flush(struct q6apm_graph *graph);
+
+/* Media Format */
+int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, int direction,
+				 uint32_t rate, uint32_t channels,
+				 u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				 uint16_t bits_per_sample);
+
+int q6apm_graph_media_format_shmem(struct q6apm_graph *graph, int direction,
+				 uint32_t rate, uint32_t channels,
+				 u8 channel_map[PCM_MAX_NUM_CHANNEL],
+				 uint16_t bits_per_sample);
+
+/* read/write related */
+int q6apm_send_eos_nowait(struct q6apm_graph *graph);
+int q6apm_read(struct q6apm_graph *graph);
+int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
+		       uint32_t lsw_ts, uint32_t flags);
+
+/* Memory Map related */
+int q6apm_map_memory_regions(struct q6apm_graph *graph,
+			     unsigned int dir,
+			     phys_addr_t phys,
+			     size_t bufsz, unsigned int bufcnt);
+int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
+			       unsigned int dir);
+/* Helpers */
+struct audioreach_module *q6apm_find_module(struct q6apm *apm, uint32_t iid);
+int q6apm_send_cmd(struct q6apm *apm, struct gpr_pkt *pkt);
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+			uint32_t rsp_opcode);
+
+/* Callback for graph specific */
+struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph,
+						    uint32_t mid);
+
+
+struct q6apm_cdc_dma_cfg {
+	u16	sample_rate;
+	u16	bit_width;
+	u16	data_format;
+	u16	num_channels;
+	u16	active_channels_mask;
+};
+
+struct q6apm_port_config {
+	struct q6apm_cdc_dma_cfg dma_cfg;
+};
+
+void q6apm_set_fe_dai_ops(struct snd_soc_dai_driver *dai_drv);
+int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid, u32 dst_sgid,
+			     bool connect);
+bool q6apm_is_sub_graphs_connected(struct q6apm *apm, u32 src_sgid,
+				   u32 dst_sgid);
+int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph);
+
+#endif /* __APM_GRAPH_ */
-- 
2.21.0

