Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8FF5960C5
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 19:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D535B826;
	Tue, 16 Aug 2022 19:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D535B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660669375;
	bh=nv9kz7LhVfiRZUstvFwCIE1rO0pUKirWsQ+KdTV4vA8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eQz3HwRtAha5M/gVRXSeAjkLOeLX8kJdDkyKsRenbMHJe3xjPXPyHEo/u/TaJ3ZTl
	 62cFf0Mrq9FXUzjsuHIJpt0lSLxEWNtuB9mdJjzoBfzk3LaJbkh98abo9x9zP4BaYW
	 3/QALVB3P6pulllQulJU+q5vUhewMiqSH4XYX4c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDF8F80424;
	Tue, 16 Aug 2022 19:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A084F8032D; Tue, 16 Aug 2022 19:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15368F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 19:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15368F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tXxE5Cxv"
Received: by mail-wm1-x32b.google.com with SMTP id h1so5515711wmd.3
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 10:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Z+IK169aH4eo4oE/yazCWb+E6gZJBwkTwFMy3pmkBbE=;
 b=tXxE5CxvL4XRHBZMKl7I+t8bJ7mpL80Q2V5+u/Fa+hQNVuyLnua1wsTEDEo+vM4eeK
 nt/zsqLCbtCJqj2b8TKM2CDb65ypsE+mgncG4u2oHraVyhxRcKJFm1bq9siYsPNDw5Gr
 0IFnztVyOlaKjI+ToN21O0UsUuP7/kXqcEGh3MvNNpH12YedG8CBSrC5UhQIB1uKYYOP
 tPj/C6cfzrECAs6IQJP06nYn3SNIcSemivgIoQcZhVNd/g7McInd0wOulO9d9nUtEsYx
 J92V3hWaiXQYvRvCtD8C8wh4DD+Sbc6xfjku9HLu6aY8Q/3MlPL9XudQA2mKdeRtmVGB
 fZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Z+IK169aH4eo4oE/yazCWb+E6gZJBwkTwFMy3pmkBbE=;
 b=DJNnKNGL/3XX8RrEvbnPW54IZ9VcT9uNsbnfAG5jqS1BSSN0oQ+29QFLW+c+ozZbLn
 9LLgw6TGDi/XENLRnTKMb0dljGjDwejuUC3S4smQ70Mg/5WwMzsmJupq1/zaSjZd+aem
 ORhZrnR5nBQhG3OIcR+O/sL5Yylbw7HTemHYf6P7Rq2luEv5c9jpAbakHPvmHhdLJPvf
 SEDaCQ+N35tcKDKnQCUGU7UdztsmChzGFpnT8yHy83BGdUuaOE5IVkNxobB1G+TL+Q6w
 R/JMZQYUYnQuLGWItworXBGgdhbbAwJmzI1pIDGslBNPcTr7cR14Ae3ojYpw+Miimith
 7sPw==
X-Gm-Message-State: ACgBeo1DlSvPb7sbLaN/PvNoz1Y2zjGe7qDBh/c9VkiPJilt8rKiCewy
 q53thx4vyH57BOVk/FQ016qMTg==
X-Google-Smtp-Source: AA6agR6a0b//5vAESrxZNaPs/j34eNRQa88EX/3HRkt3V06pu7BoM2GP1N9k6uWC5zMoEI4Ka1jYwg==
X-Received: by 2002:a05:600c:3d91:b0:3a5:4132:b6a0 with SMTP id
 bi17-20020a05600c3d9100b003a54132b6a0mr13237626wmb.126.1660669303392; 
 Tue, 16 Aug 2022 10:01:43 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a5d6043000000b0021d6dad334bsm10659535wrt.4.2022.08.16.10.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:01:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: qdsp6: q6prm: add new clocks
Date: Tue, 16 Aug 2022 18:01:18 +0100
Message-Id: <20220816170118.13470-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
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

Add support to new clocks that are added in Q6DSP as part of newer version
of LPASS support on SM8450 and SC8280XP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 18 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c           |  9 +++++++++
 sound/soc/qcom/qdsp6/q6prm.h                  | 19 +++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 0d3276c8fc11..9f7c5103bc82 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -193,6 +193,24 @@
 #define LPASS_CLK_ID_RX_CORE_MCLK	59
 #define LPASS_CLK_ID_RX_CORE_NPL_MCLK	60
 #define LPASS_CLK_ID_VA_CORE_2X_MCLK	61
+/* Clock ID for MCLK for WSA2 core */
+#define LPASS_CLK_ID_WSA2_CORE_MCLK	62
+/* Clock ID for NPL MCLK for WSA2 core */
+#define LPASS_CLK_ID_WSA2_CORE_2X_MCLK	63
+/* Clock ID for RX Core TX MCLK */
+#define LPASS_CLK_ID_RX_CORE_TX_MCLK	64
+/* Clock ID for RX CORE TX 2X MCLK */
+#define LPASS_CLK_ID_RX_CORE_TX_2X_MCLK	65
+/* Clock ID for WSA core TX MCLK */
+#define LPASS_CLK_ID_WSA_CORE_TX_MCLK	66
+/* Clock ID for WSA core TX 2X MCLK */
+#define LPASS_CLK_ID_WSA_CORE_TX_2X_MCLK	67
+/* Clock ID for WSA2 core TX MCLK */
+#define LPASS_CLK_ID_WSA2_CORE_TX_MCLK	68
+/* Clock ID for WSA2 core TX 2X MCLK */
+#define LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK	69
+/* Clock ID for RX CORE MCLK2 2X  MCLK */
+#define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
 
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index a26cda5140c1..73b0cbac73d4 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -50,6 +50,15 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_TX_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_TX_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_TX_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_TX_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index fea4d1954bc1..a988a32086fe 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -64,6 +64,25 @@
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK				0x30e
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_NPL_MCLK			0x30f
 
+/* Clock ID for MCLK for WSA2 core */
+#define Q6PRM_LPASS_CLK_ID_WSA2_CORE_MCLK 0x310
+/* Clock ID for NPL MCLK for WSA2 core */
+#define Q6PRM_LPASS_CLK_ID_WSA2_CORE_2X_MCLK 0x311
+/* Clock ID for RX Core TX MCLK */
+#define Q6PRM_LPASS_CLK_ID_RX_CORE_TX_MCLK 0x312
+/* Clock ID for RX CORE TX 2X MCLK */
+#define Q6PRM_LPASS_CLK_ID_RX_CORE_TX_2X_MCLK 0x313
+/* Clock ID for WSA core TX MCLK */
+#define Q6PRM_LPASS_CLK_ID_WSA_CORE_TX_MCLK 0x314
+/* Clock ID for WSA core TX 2X MCLK */
+#define Q6PRM_LPASS_CLK_ID_WSA_CORE_TX_2X_MCLK 0x315
+/* Clock ID for WSA2 core TX MCLK */
+#define Q6PRM_LPASS_CLK_ID_WSA2_CORE_TX_MCLK 0x316
+/* Clock ID for WSA2 core TX 2X MCLK */
+#define Q6PRM_LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK 0x317
+/* Clock ID for RX CORE MCLK2 2X  MCLK */
+#define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
+
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
-- 
2.21.0

