Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1F3FFF1E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803E5182F;
	Fri,  3 Sep 2021 13:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803E5182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668305;
	bh=Pr9WTUr90rMVo6oABbHMsNEQ4n17KzFB79rw2ejc6jw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSeq930DrOnJ5GVdvD8VADVO7zP/rHefkQbPG00C1KXvSdfppJXSqlRehC4iCtQU8
	 v9MiP6ysY8xwJTCQvyM33puC6w+MNFBD0zCzJWKl4A3mkm/OZJqV4u6GS69PxmYG6k
	 uW+SdmBEme6Ke1d68H3VQEaGKux17j+4W5jDKXQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B89D6F804EB;
	Fri,  3 Sep 2021 13:21:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB90FF804FF; Fri,  3 Sep 2021 13:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C754F804EB
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C754F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e6+fImB2"
Received: by mail-wr1-x432.google.com with SMTP id b10so7784170wru.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jONUN0C6XA6UJsv3RxwoGrHmtYxRlaTGrHYolrxpDUg=;
 b=e6+fImB2E0yZrDQkgzhG9uaikbDcLMEoD94s4WdFl22Fy0pYVavjy60j3YwP4Yd3L+
 xigJx/HXmRwmkqpWBLILtl8VV1G9hJyrNXVCyr4Cqq9c1UXhhDuquiIo6XQjpn/jLCX+
 KSKZS2dSgUkP20h/PLhEvUweUpSMYueJUMIsrE7/sJobG4WOAiEO7C1XIiNgqKVx0Mb9
 NyPYMljiOHOzwF7+WMi/BmFj6U0PKAm9cPWNoc3g9jWyDwqG0qW9VAR5BR3XRmUBckER
 QYAf912xjksmucIB2pIyq775QS5tbPEXBnl4UYCu30GD9kUegcO+HBsZpuBRyJbTOO//
 ZWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jONUN0C6XA6UJsv3RxwoGrHmtYxRlaTGrHYolrxpDUg=;
 b=BXPQkwzI1L3TLvYqkjRIK1D82XubCUE52dtAlhoUUc1LSLOjfZKvHXWm7maq013F5z
 72IrAMO/A4e6m3jUEZu81JjpVgKWgW61z4gB1HPN4qr7foo6ONjzexUmJIR/XgXHyOBv
 YCW8oYqUXK5Fn8kHvBPH8FSkhpaLcBlh0H2ZlLHmtl9D0Fh0Em3HaKlOt3388chN5V+s
 KZ/CX+EWps/0Ns/Hr2WTYjhPjU9D6UcCj5ywEKgVm8Vvs4eu6m0llqhUiq/JaOhovMUo
 9FZ0b1gowr0niJVBPBPgIzP21A0vA6xoZLV4eWj8uFTRKPuFx6ynMSki1/P/z4g79qas
 weFA==
X-Gm-Message-State: AOAM530yjpckUv7cFIT/gIjZrdRnOimud23xymaZ5N8Suq+o9kT0t4Vm
 Eg9zI8vL7HOHBlL9+LIKy3tbFQ==
X-Google-Smtp-Source: ABdhPJw84qayxX7EGr8q2Pjz/FH/8xAFo185S00fXDg35mgcmRC/eiep5pkqHzJDQ2PiLg37AflZQQ==
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr3491050wru.269.1630668101995; 
 Fri, 03 Sep 2021 04:21:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 08/21] ASoC: dt-bindings: rename q6afe.h to
 q6dsp-lpass-ports.h
Date: Fri,  3 Sep 2021 12:20:19 +0100
Message-Id: <20210903112032.25834-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
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

move all LPASS audio ports defines from q6afe.h to q6dsp-lpass-ports.h
as these belong to LPASS IP.
Also this move helps in reusing this header across multiple audio
frameworks on Qualcomm Audio DSP.

This patch is split out of the dt-bindings patch to enable easy review.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/dt-bindings/sound/qcom,q6afe.h        | 203 +----------------
 .../sound/qcom,q6dsp-lpass-ports.h            | 208 ++++++++++++++++++
 2 files changed, 210 insertions(+), 201 deletions(-)
 create mode 100644 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h

diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
index 66c21ab03eef..9d5d89cfabcf 100644
--- a/include/dt-bindings/sound/qcom,q6afe.h
+++ b/include/dt-bindings/sound/qcom,q6afe.h
@@ -2,207 +2,8 @@
 #ifndef __DT_BINDINGS_Q6_AFE_H__
 #define __DT_BINDINGS_Q6_AFE_H__
 
-/* Audio Front End (AFE) virtual ports IDs */
-#define HDMI_RX		1
-#define SLIMBUS_0_RX    2
-#define SLIMBUS_0_TX    3
-#define SLIMBUS_1_RX    4
-#define SLIMBUS_1_TX    5
-#define SLIMBUS_2_RX    6
-#define SLIMBUS_2_TX    7
-#define SLIMBUS_3_RX    8
-#define SLIMBUS_3_TX    9
-#define SLIMBUS_4_RX    10
-#define SLIMBUS_4_TX    11
-#define SLIMBUS_5_RX    12
-#define SLIMBUS_5_TX    13
-#define SLIMBUS_6_RX    14
-#define SLIMBUS_6_TX    15
-#define PRIMARY_MI2S_RX		16
-#define PRIMARY_MI2S_TX		17
-#define SECONDARY_MI2S_RX	18
-#define SECONDARY_MI2S_TX	19
-#define TERTIARY_MI2S_RX	20
-#define TERTIARY_MI2S_TX	21
-#define QUATERNARY_MI2S_RX	22
-#define QUATERNARY_MI2S_TX	23
-#define PRIMARY_TDM_RX_0	24
-#define PRIMARY_TDM_TX_0	25
-#define PRIMARY_TDM_RX_1	26
-#define PRIMARY_TDM_TX_1	27
-#define PRIMARY_TDM_RX_2	28
-#define PRIMARY_TDM_TX_2	29
-#define PRIMARY_TDM_RX_3	30
-#define PRIMARY_TDM_TX_3	31
-#define PRIMARY_TDM_RX_4	32
-#define PRIMARY_TDM_TX_4	33
-#define PRIMARY_TDM_RX_5	34
-#define PRIMARY_TDM_TX_5	35
-#define PRIMARY_TDM_RX_6	36
-#define PRIMARY_TDM_TX_6	37
-#define PRIMARY_TDM_RX_7	38
-#define PRIMARY_TDM_TX_7	39
-#define SECONDARY_TDM_RX_0	40
-#define SECONDARY_TDM_TX_0	41
-#define SECONDARY_TDM_RX_1	42
-#define SECONDARY_TDM_TX_1	43
-#define SECONDARY_TDM_RX_2	44
-#define SECONDARY_TDM_TX_2	45
-#define SECONDARY_TDM_RX_3	46
-#define SECONDARY_TDM_TX_3	47
-#define SECONDARY_TDM_RX_4	48
-#define SECONDARY_TDM_TX_4	49
-#define SECONDARY_TDM_RX_5	50
-#define SECONDARY_TDM_TX_5	51
-#define SECONDARY_TDM_RX_6	52
-#define SECONDARY_TDM_TX_6	53
-#define SECONDARY_TDM_RX_7	54
-#define SECONDARY_TDM_TX_7	55
-#define TERTIARY_TDM_RX_0	56
-#define TERTIARY_TDM_TX_0	57
-#define TERTIARY_TDM_RX_1	58
-#define TERTIARY_TDM_TX_1	59
-#define TERTIARY_TDM_RX_2	60
-#define TERTIARY_TDM_TX_2	61
-#define TERTIARY_TDM_RX_3	62
-#define TERTIARY_TDM_TX_3	63
-#define TERTIARY_TDM_RX_4	64
-#define TERTIARY_TDM_TX_4	65
-#define TERTIARY_TDM_RX_5	66
-#define TERTIARY_TDM_TX_5	67
-#define TERTIARY_TDM_RX_6	68
-#define TERTIARY_TDM_TX_6	69
-#define TERTIARY_TDM_RX_7	70
-#define TERTIARY_TDM_TX_7	71
-#define QUATERNARY_TDM_RX_0	72
-#define QUATERNARY_TDM_TX_0	73
-#define QUATERNARY_TDM_RX_1	74
-#define QUATERNARY_TDM_TX_1	75
-#define QUATERNARY_TDM_RX_2	76
-#define QUATERNARY_TDM_TX_2	77
-#define QUATERNARY_TDM_RX_3	78
-#define QUATERNARY_TDM_TX_3	79
-#define QUATERNARY_TDM_RX_4	80
-#define QUATERNARY_TDM_TX_4	81
-#define QUATERNARY_TDM_RX_5	82
-#define QUATERNARY_TDM_TX_5	83
-#define QUATERNARY_TDM_RX_6	84
-#define QUATERNARY_TDM_TX_6	85
-#define QUATERNARY_TDM_RX_7	86
-#define QUATERNARY_TDM_TX_7	87
-#define QUINARY_TDM_RX_0	88
-#define QUINARY_TDM_TX_0	89
-#define QUINARY_TDM_RX_1	90
-#define QUINARY_TDM_TX_1	91
-#define QUINARY_TDM_RX_2	92
-#define QUINARY_TDM_TX_2	93
-#define QUINARY_TDM_RX_3	94
-#define QUINARY_TDM_TX_3	95
-#define QUINARY_TDM_RX_4	96
-#define QUINARY_TDM_TX_4	97
-#define QUINARY_TDM_RX_5	98
-#define QUINARY_TDM_TX_5	99
-#define QUINARY_TDM_RX_6	100
-#define QUINARY_TDM_TX_6	101
-#define QUINARY_TDM_RX_7	102
-#define QUINARY_TDM_TX_7	103
-#define DISPLAY_PORT_RX		104
-#define WSA_CODEC_DMA_RX_0	105
-#define WSA_CODEC_DMA_TX_0	106
-#define WSA_CODEC_DMA_RX_1	107
-#define WSA_CODEC_DMA_TX_1	108
-#define WSA_CODEC_DMA_TX_2	109
-#define VA_CODEC_DMA_TX_0	110
-#define VA_CODEC_DMA_TX_1	111
-#define VA_CODEC_DMA_TX_2	112
-#define RX_CODEC_DMA_RX_0	113
-#define TX_CODEC_DMA_TX_0	114
-#define RX_CODEC_DMA_RX_1	115
-#define TX_CODEC_DMA_TX_1	116
-#define RX_CODEC_DMA_RX_2	117
-#define TX_CODEC_DMA_TX_2	118
-#define RX_CODEC_DMA_RX_3	119
-#define TX_CODEC_DMA_TX_3	120
-#define RX_CODEC_DMA_RX_4	121
-#define TX_CODEC_DMA_TX_4	122
-#define RX_CODEC_DMA_RX_5	123
-#define TX_CODEC_DMA_TX_5	124
-#define RX_CODEC_DMA_RX_6	125
-#define RX_CODEC_DMA_RX_7	126
-#define QUINARY_MI2S_RX		127
-#define QUINARY_MI2S_TX		128
+/* This file exists due to backward compatibility reasons, Please do not DELETE! */
 
-#define LPASS_CLK_ID_PRI_MI2S_IBIT	1
-#define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-#define LPASS_CLK_ID_SEC_MI2S_IBIT	3
-#define LPASS_CLK_ID_SEC_MI2S_EBIT	4
-#define LPASS_CLK_ID_TER_MI2S_IBIT	5
-#define LPASS_CLK_ID_TER_MI2S_EBIT	6
-#define LPASS_CLK_ID_QUAD_MI2S_IBIT	7
-#define LPASS_CLK_ID_QUAD_MI2S_EBIT	8
-#define LPASS_CLK_ID_SPEAKER_I2S_IBIT	9
-#define LPASS_CLK_ID_SPEAKER_I2S_EBIT	10
-#define LPASS_CLK_ID_SPEAKER_I2S_OSR	11
-#define LPASS_CLK_ID_QUI_MI2S_IBIT	12
-#define LPASS_CLK_ID_QUI_MI2S_EBIT	13
-#define LPASS_CLK_ID_SEN_MI2S_IBIT	14
-#define LPASS_CLK_ID_SEN_MI2S_EBIT	15
-#define LPASS_CLK_ID_INT0_MI2S_IBIT	16
-#define LPASS_CLK_ID_INT1_MI2S_IBIT	17
-#define LPASS_CLK_ID_INT2_MI2S_IBIT	18
-#define LPASS_CLK_ID_INT3_MI2S_IBIT	19
-#define LPASS_CLK_ID_INT4_MI2S_IBIT	20
-#define LPASS_CLK_ID_INT5_MI2S_IBIT	21
-#define LPASS_CLK_ID_INT6_MI2S_IBIT	22
-#define LPASS_CLK_ID_QUI_MI2S_OSR	23
-#define LPASS_CLK_ID_PRI_PCM_IBIT	24
-#define LPASS_CLK_ID_PRI_PCM_EBIT	25
-#define LPASS_CLK_ID_SEC_PCM_IBIT	26
-#define LPASS_CLK_ID_SEC_PCM_EBIT	27
-#define LPASS_CLK_ID_TER_PCM_IBIT	28
-#define LPASS_CLK_ID_TER_PCM_EBIT	29
-#define LPASS_CLK_ID_QUAD_PCM_IBIT	30
-#define LPASS_CLK_ID_QUAD_PCM_EBIT	31
-#define LPASS_CLK_ID_QUIN_PCM_IBIT	32
-#define LPASS_CLK_ID_QUIN_PCM_EBIT	33
-#define LPASS_CLK_ID_QUI_PCM_OSR	34
-#define LPASS_CLK_ID_PRI_TDM_IBIT	35
-#define LPASS_CLK_ID_PRI_TDM_EBIT	36
-#define LPASS_CLK_ID_SEC_TDM_IBIT	37
-#define LPASS_CLK_ID_SEC_TDM_EBIT	38
-#define LPASS_CLK_ID_TER_TDM_IBIT	39
-#define LPASS_CLK_ID_TER_TDM_EBIT	40
-#define LPASS_CLK_ID_QUAD_TDM_IBIT	41
-#define LPASS_CLK_ID_QUAD_TDM_EBIT	42
-#define LPASS_CLK_ID_QUIN_TDM_IBIT	43
-#define LPASS_CLK_ID_QUIN_TDM_EBIT	44
-#define LPASS_CLK_ID_QUIN_TDM_OSR	45
-#define LPASS_CLK_ID_MCLK_1		46
-#define LPASS_CLK_ID_MCLK_2		47
-#define LPASS_CLK_ID_MCLK_3		48
-#define LPASS_CLK_ID_MCLK_4		49
-#define LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE	50
-#define LPASS_CLK_ID_INT_MCLK_0		51
-#define LPASS_CLK_ID_INT_MCLK_1		52
-#define LPASS_CLK_ID_MCLK_5		53
-#define LPASS_CLK_ID_WSA_CORE_MCLK	54
-#define LPASS_CLK_ID_WSA_CORE_NPL_MCLK	55
-#define LPASS_CLK_ID_VA_CORE_MCLK	56
-#define LPASS_CLK_ID_TX_CORE_MCLK	57
-#define LPASS_CLK_ID_TX_CORE_NPL_MCLK	58
-#define LPASS_CLK_ID_RX_CORE_MCLK	59
-#define LPASS_CLK_ID_RX_CORE_NPL_MCLK	60
-#define LPASS_CLK_ID_VA_CORE_2X_MCLK	61
-
-#define LPASS_HW_AVTIMER_VOTE		101
-#define LPASS_HW_MACRO_VOTE		102
-#define LPASS_HW_DCODEC_VOTE		103
-
-#define Q6AFE_MAX_CLK_ID			104
-
-#define LPASS_CLK_ATTRIBUTE_INVALID		0x0
-#define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
-#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVIDEND	0x2
-#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR	0x3
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #endif /* __DT_BINDINGS_Q6_AFE_H__ */
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
new file mode 100644
index 000000000000..0d3276c8fc11
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -0,0 +1,208 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_BINDINGS_Q6_AUDIO_PORTS_H__
+#define __DT_BINDINGS_Q6_AUDIO_PORTS_H__
+
+/* LPASS Audio virtual ports IDs */
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
+#define QUINARY_MI2S_RX		127
+#define QUINARY_MI2S_TX		128
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
+#define Q6AFE_MAX_CLK_ID			104
+
+#define LPASS_CLK_ATTRIBUTE_INVALID		0x0
+#define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
+#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVIDEND	0x2
+#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR	0x3
+
+#endif /* __DT_BINDINGS_Q6_AUDIO_PORTS_H__ */
-- 
2.21.0

