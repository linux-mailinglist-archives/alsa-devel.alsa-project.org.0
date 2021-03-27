Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82D34B5A3
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 10:31:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B86167B;
	Sat, 27 Mar 2021 10:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B86167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616837471;
	bh=3PdxFYXLz68hBM3b5DVOgjSi7QKLXqeRBYX6vW1HL9Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jdwrPA7UzAkdMhiSdDrMrogTlbWI9OXcl0JiRFeJgnllg9DRxEbGx2b8jc/9TfsqF
	 XxppPZuDJthLYfBp3z/k5s0HOe+Fb3v9XCY67F1FJ7U5nBZZxfzyv/h9bKQ+rQJEK2
	 QgTBpfvAckj6AA8SdUyCGZBvabiPcpIN3i7k5JP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D356F80109;
	Sat, 27 Mar 2021 10:29:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A16EF8025F; Sat, 27 Mar 2021 10:29:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37FDF800B9
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 10:29:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37FDF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fyJW04Ge"
Received: by mail-lf1-x12d.google.com with SMTP id b14so11283827lfv.8
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6VxxamNMJtiInR5z2cowqOyCycRO6qgXHgaO1I7LP14=;
 b=fyJW04GepHbSwmOxZQITgRITOfXCTuEqaYiIO9/R8KgkNnljwXT21fAVroo/q5miLN
 yyBZooIxnFjdaDVhCcTZQ4NcnqW2Wbp64Igpdpgb9xdzlel55HdQk3PZtaVcjHwR3mWt
 uUfpDwLYYKbwE/7hKBui1Y1+njTua+GjUfvWyv3rOoifyOkVyGaSKnkenzR+hNYwS32J
 2ocUjJMy1ROFHq1jSgXAbnCYLyhWsQcP9d2DpWKKw4ifaKsvVKDu6SvwPjftvpYAHoWa
 XsziDLtMQVTGjX9nAD5g/ViB6XnQm5T9QnVONqrcXAkzq1MrmZA4Q/0V8yCzJQXBM8oi
 1tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6VxxamNMJtiInR5z2cowqOyCycRO6qgXHgaO1I7LP14=;
 b=UAkaJe1NG8FeJ32srZxxhQ5pGRsPTGLAYBhlHfg5UZGmsqKTTFn8JjCvMnw9fBaLm4
 rACD11XAR+bTqzsCVnDcGwlGIo5y6XfFXOAHo6vAkjTAdAvjyv6+gAaMdceGWCAnrTdz
 3mHkH5QSjfUu46AqxpKDVEajTPf2qTAi2N5iRWjAQ2RVAOALLO2MfBEfVe2AyYpZqDBT
 14d0FRIEIqBVN0kzvbo8z/FN/OmezFSZBy57HTYMoMpGRIHGlVuqKwvEsy4fIVAyPHCY
 afvCLGGPWxcm0PUckpvSpEVJ3GRncpypjzojIRcyPqpu9VanTLpfYnrFgg8L14naQTHg
 O9Kw==
X-Gm-Message-State: AOAM532RH2OsoSH+pyNsS8viwsYLdsMEKSUp/uRHQD0F3n2euRf6SoiP
 Mmp8vOo1y6OeIUP1Tc84tRluVQ==
X-Google-Smtp-Source: ABdhPJx+7LWILuBmzDqBHalQa9+1Kt4zJ3oBDEZYnOiqoyMliB+fopKgf+5nx1VEn2GS8pOBk4arLw==
X-Received: by 2002:a19:ee0d:: with SMTP id g13mr11125539lfb.38.1616837339038; 
 Sat, 27 Mar 2021 02:28:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm1469580ljj.26.2021.03.27.02.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 02:28:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: q6afe-clocks: fix reprobing of the driver
Date: Sat, 27 Mar 2021 12:28:57 +0300
Message-Id: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Takashi Iwai <tiwai@suse.com>
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

Q6afe-clocks driver can get reprobed. For example if the APR services
are restarted after the firmware crash. However currently Q6afe-clocks
driver will oops because hw.init will get cleared during first _probe
call. Rewrite the driver to fill the clock data at runtime rather than
using big static array of clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 209 ++++++++++++++--------------
 sound/soc/qcom/qdsp6/q6afe.c        |   2 +-
 sound/soc/qcom/qdsp6/q6afe.h        |   2 +-
 3 files changed, 108 insertions(+), 105 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
index f0362f061652..9431656283cd 100644
--- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
@@ -11,33 +11,29 @@
 #include <linux/slab.h>
 #include "q6afe.h"
 
-#define Q6AFE_CLK(id) &(struct q6afe_clk) {		\
+#define Q6AFE_CLK(id) {					\
 		.clk_id	= id,				\
 		.afe_clk_id	= Q6AFE_##id,		\
 		.name = #id,				\
-		.attributes = LPASS_CLK_ATTRIBUTE_COUPLE_NO, \
 		.rate = 19200000,			\
-		.hw.init = &(struct clk_init_data) {	\
-			.ops = &clk_q6afe_ops,		\
-			.name = #id,			\
-		},					\
 	}
 
-#define Q6AFE_VOTE_CLK(id, blkid, n) &(struct q6afe_clk) { \
+#define Q6AFE_VOTE_CLK(id, blkid, n) {			\
 		.clk_id	= id,				\
 		.afe_clk_id = blkid,			\
-		.name = #n,				\
-		.hw.init = &(struct clk_init_data) {	\
-			.ops = &clk_vote_q6afe_ops,	\
-			.name = #id,			\
-		},					\
+		.name = n,				\
 	}
 
-struct q6afe_clk {
-	struct device *dev;
+struct q6afe_clk_init {
 	int clk_id;
 	int afe_clk_id;
 	char *name;
+	int rate;
+};
+
+struct q6afe_clk {
+	struct device *dev;
+	int afe_clk_id;
 	int attributes;
 	int rate;
 	uint32_t handle;
@@ -48,8 +44,7 @@ struct q6afe_clk {
 
 struct q6afe_cc {
 	struct device *dev;
-	struct q6afe_clk **clks;
-	int num_clks;
+	struct q6afe_clk *clks[Q6AFE_MAX_CLK_ID];
 };
 
 static int clk_q6afe_prepare(struct clk_hw *hw)
@@ -105,7 +100,7 @@ static int clk_vote_q6afe_block(struct clk_hw *hw)
 	struct q6afe_clk *clk = to_q6afe_clk(hw);
 
 	return q6afe_vote_lpass_core_hw(clk->dev, clk->afe_clk_id,
-					clk->name, &clk->handle);
+					clk_hw_get_name(&clk->hw), &clk->handle);
 }
 
 static void clk_unvote_q6afe_block(struct clk_hw *hw)
@@ -120,84 +115,76 @@ static const struct clk_ops clk_vote_q6afe_ops = {
 	.unprepare	= clk_unvote_q6afe_block,
 };
 
-static struct q6afe_clk *q6afe_clks[Q6AFE_MAX_CLK_ID] = {
-	[LPASS_CLK_ID_PRI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
-	[LPASS_CLK_ID_PRI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
-	[LPASS_CLK_ID_SEC_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
-	[LPASS_CLK_ID_SEC_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
-	[LPASS_CLK_ID_TER_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
-	[LPASS_CLK_ID_TER_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
-	[LPASS_CLK_ID_QUAD_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
-	[LPASS_CLK_ID_QUAD_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
-	[LPASS_CLK_ID_SPEAKER_I2S_IBIT] =
-				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
-	[LPASS_CLK_ID_SPEAKER_I2S_EBIT] =
-				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
-	[LPASS_CLK_ID_SPEAKER_I2S_OSR] =
-				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
-	[LPASS_CLK_ID_QUI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
-	[LPASS_CLK_ID_QUI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
-	[LPASS_CLK_ID_SEN_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
-	[LPASS_CLK_ID_SEN_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
-	[LPASS_CLK_ID_INT0_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
-	[LPASS_CLK_ID_INT1_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
-	[LPASS_CLK_ID_INT2_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
-	[LPASS_CLK_ID_INT3_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
-	[LPASS_CLK_ID_INT4_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
-	[LPASS_CLK_ID_INT5_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
-	[LPASS_CLK_ID_INT6_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
-	[LPASS_CLK_ID_QUI_MI2S_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
-	[LPASS_CLK_ID_PRI_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_IBIT),
-	[LPASS_CLK_ID_PRI_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_EBIT),
-	[LPASS_CLK_ID_SEC_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_IBIT),
-	[LPASS_CLK_ID_SEC_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_EBIT),
-	[LPASS_CLK_ID_TER_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_IBIT),
-	[LPASS_CLK_ID_TER_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_EBIT),
-	[LPASS_CLK_ID_QUAD_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_IBIT),
-	[LPASS_CLK_ID_QUAD_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_EBIT),
-	[LPASS_CLK_ID_QUIN_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_IBIT),
-	[LPASS_CLK_ID_QUIN_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_EBIT),
-	[LPASS_CLK_ID_QUI_PCM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_PCM_OSR),
-	[LPASS_CLK_ID_PRI_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_IBIT),
-	[LPASS_CLK_ID_PRI_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_EBIT),
-	[LPASS_CLK_ID_SEC_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_IBIT),
-	[LPASS_CLK_ID_SEC_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_EBIT),
-	[LPASS_CLK_ID_TER_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_IBIT),
-	[LPASS_CLK_ID_TER_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_EBIT),
-	[LPASS_CLK_ID_QUAD_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_IBIT),
-	[LPASS_CLK_ID_QUAD_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_EBIT),
-	[LPASS_CLK_ID_QUIN_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_IBIT),
-	[LPASS_CLK_ID_QUIN_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_EBIT),
-	[LPASS_CLK_ID_QUIN_TDM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_OSR),
-	[LPASS_CLK_ID_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_1),
-	[LPASS_CLK_ID_MCLK_2] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_2),
-	[LPASS_CLK_ID_MCLK_3] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_3),
-	[LPASS_CLK_ID_MCLK_4] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_4),
-	[LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE] =
-		Q6AFE_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
-	[LPASS_CLK_ID_INT_MCLK_0] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_0),
-	[LPASS_CLK_ID_INT_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_1),
-	[LPASS_CLK_ID_WSA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
-	[LPASS_CLK_ID_WSA_CORE_NPL_MCLK] =
-				Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
-	[LPASS_CLK_ID_VA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
-	[LPASS_CLK_ID_TX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
-	[LPASS_CLK_ID_TX_CORE_NPL_MCLK] =
-			Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
-	[LPASS_CLK_ID_RX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
-	[LPASS_CLK_ID_RX_CORE_NPL_MCLK] =
-				Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
-	[LPASS_CLK_ID_VA_CORE_2X_MCLK] =
-				Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
-	[LPASS_HW_AVTIMER_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
-						 Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
-						 "LPASS_AVTIMER_MACRO"),
-	[LPASS_HW_MACRO_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
-						Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
-						"LPASS_HW_MACRO"),
-	[LPASS_HW_DCODEC_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
-					Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
-					"LPASS_HW_DCODEC"),
+static const struct q6afe_clk_init q6afe_clks[] = {
+	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
+	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUI_PCM_OSR),
+	Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_IBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_EBIT),
+	Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_OSR),
+	Q6AFE_CLK(LPASS_CLK_ID_MCLK_1),
+	Q6AFE_CLK(LPASS_CLK_ID_MCLK_2),
+	Q6AFE_CLK(LPASS_CLK_ID_MCLK_3),
+	Q6AFE_CLK(LPASS_CLK_ID_MCLK_4),
+	Q6AFE_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
+	Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_0),
+	Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_1),
+	Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
+	Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
+	Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
+	Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
+	Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
+	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
+	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
+	Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
+	Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
+		       Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
+		       "LPASS_AVTIMER_MACRO"),
+	Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
+		       Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
+		       "LPASS_HW_MACRO"),
+	Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
+		       Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
+		       "LPASS_HW_DCODEC"),
 };
 
 static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
@@ -207,7 +194,7 @@ static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
 	unsigned int idx = clkspec->args[0];
 	unsigned int attr = clkspec->args[1];
 
-	if (idx >= cc->num_clks || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
+	if (idx >= Q6AFE_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
 		dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
 		return ERR_PTR(-EINVAL);
 	}
@@ -230,20 +217,36 @@ static int q6afe_clock_dev_probe(struct platform_device *pdev)
 	if (!cc)
 		return -ENOMEM;
 
-	cc->clks = &q6afe_clks[0];
-	cc->num_clks = ARRAY_SIZE(q6afe_clks);
+	cc->dev = dev;
 	for (i = 0; i < ARRAY_SIZE(q6afe_clks); i++) {
-		if (!q6afe_clks[i])
-			continue;
+		unsigned int id = q6afe_clks[i].clk_id;
+		struct clk_init_data init = {
+			.name =  q6afe_clks[i].name,
+		};
+		struct q6afe_clk *clk;
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		clk->dev = dev;
+		clk->afe_clk_id = q6afe_clks[i].afe_clk_id;
+		clk->rate = q6afe_clks[i].rate;
+		clk->hw.init = &init;
+
+		if (clk->rate)
+			init.ops = &clk_q6afe_ops;
+		else
+			init.ops = &clk_vote_q6afe_ops;
 
-		q6afe_clks[i]->dev = dev;
+		cc->clks[id] = clk;
 
-		ret = devm_clk_hw_register(dev, &q6afe_clks[i]->hw);
+		ret = devm_clk_hw_register(dev, &clk->hw);
 		if (ret)
 			return ret;
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, q6afe_of_clk_hw_get, cc);
+	ret = devm_of_clk_add_hw_provider(dev, q6afe_of_clk_hw_get, cc);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index cad1cd1bfdf0..4327b72162ec 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1681,7 +1681,7 @@ int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 EXPORT_SYMBOL(q6afe_unvote_lpass_core_hw);
 
 int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
-			     char *client_name, uint32_t *client_handle)
+			     const char *client_name, uint32_t *client_handle)
 {
 	struct q6afe *afe = dev_get_drvdata(dev->parent);
 	struct afe_cmd_remote_lpass_core_hw_vote_request *vote_cfg;
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index 22e10269aa10..3845b56c0ed3 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -236,7 +236,7 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 int q6afe_set_lpass_clock(struct device *dev, int clk_id, int clk_src,
 			  int clk_root, unsigned int freq);
 int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
-			     char *client_name, uint32_t *client_handle);
+			     const char *client_name, uint32_t *client_handle);
 int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 			       uint32_t client_handle);
 #endif /* __Q6AFE_H__ */
-- 
2.30.2

