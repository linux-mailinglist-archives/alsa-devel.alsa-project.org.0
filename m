Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099963E44D9
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 13:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 929BD16B9;
	Mon,  9 Aug 2021 13:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 929BD16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628508534;
	bh=loAgWI1blHu12++Bn7a41nHzV4fbQPu3JFwciO9ZQKo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPq0O4lt+wqsGBG3X4oNCAGO8aZtXz9m1YW+PChHqARyTyVqVV7iI8Bwox5Clm/c+
	 HXfIa0u9uTpS0xXJ/vR5bNtcW/fn05lHXEr5JKRRMOg4SdXyXeSMrzGJff/dMEicRd
	 AQMLLgLZjV3Q1OnmxGEbFJ51kf0tRKiFf49j153Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3983F80524;
	Mon,  9 Aug 2021 13:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D866F804B4; Mon,  9 Aug 2021 13:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF79BF804C3
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF79BF804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Dlo6CLxC"
Received: by mail-wr1-x435.google.com with SMTP id m12so20914888wru.12
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 04:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P/GrQum7HqFjwAP4vzAUmK4U+IxXkHWKdXR4vGSO5YU=;
 b=Dlo6CLxC38y9DFyYj1eKb/hrgZ4nsQOdhYr7aUds1zXPycero51qMufiNlKkMR/0BN
 uw++wyYW8584mTqEPYpnGpzZxkjrlUh3NIqP8xFfIiCQ7wczEo3Iy4ATFH5EWsqzYTLw
 NO/SMWStyeTCqJPgd95p5s547iqEOydmPQ6RZam9OVHl7/YxYAJ03YUK8MWGn3PRydqW
 S10l51I8XWr3QgqpuhcLVKLvcpA4VaZwVasUiUljNqrnK3uemzuLLAs0ijTgKYbIqR9c
 lXT9kF7U25oL3vK7U9Lq8sCKFrPu3aq66l9mxSVFCzqPRSwpyiboNEdF6sMtTPMxiYha
 FvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P/GrQum7HqFjwAP4vzAUmK4U+IxXkHWKdXR4vGSO5YU=;
 b=szVeos8zDWrfYM30c/9T065LzJmY5wku8OPQrEGSBTCYR+36g2ODMc1HkiAkonxHDv
 aO/rKDRl/Vd59I5IUM5V2nsD/XcT9S4n3BCdTfSjL7YLJg3FaqlIZsATck+6/SPxFTFK
 nF1fH1DDn+1r4UlYTwu6uS8W/v2owNCYg30c3IffdAG9oThSDOv6iSe59Wp4E4m05XJS
 WXLN8SKf5K06pzjVDmSXbKe9m3ILGxO0e5zTENrn9XS4WOxnqLKjuC06an0tvBBgjYVa
 yMCv5JMzaQtjM9MQZ7+PBRM1Loaff2LjVXIepPNfgIusYsQCEV7w7YWUDi6DnqaJPLpQ
 SfIA==
X-Gm-Message-State: AOAM533YsnSXSh6Exjy19cJ+qxKra8Ij5wpGMPvPGi0Kv6AyHzM4/0du
 QwzzxQIJQ24siFJ7Fd9tpHorkg==
X-Google-Smtp-Source: ABdhPJwsJQxDgDSCcDaiiZ7VZGciuZpplKxbOrVeFI2tk/EVPVHqSzPwog9o1KN+ACywsh7pwALL+Q==
X-Received: by 2002:a05:6000:1366:: with SMTP id
 q6mr24269028wrz.60.1628508280405; 
 Mon, 09 Aug 2021 04:24:40 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b80sm7774900wmb.2.2021.08.09.04.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:24:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v4 09/20] ASoC: qdsp6: q6afe-clocks: move audio-clocks to
 common file
Date: Mon,  9 Aug 2021 12:23:28 +0100
Message-Id: <20210809112339.8368-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
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

Move common parts of  q6afe-clocks to q6dsp-lpass-clocks so that we could
reuse most of the driver for new Q6DSP audio frameworks.

This is to make the code reuseable for new Q6DSP AudioReach framework.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/Makefile             |   2 +-
 sound/soc/qcom/qdsp6/q6afe-clocks.c       | 187 ++--------------------
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 186 +++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h |  30 ++++
 4 files changed, 232 insertions(+), 173 deletions(-)
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
 create mode 100644 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h

diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index 11e8705bbc5c..a4191d395557 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-q6dsp-common-objs := q6dsp-common.o q6dsp-lpass-ports.o
+snd-q6dsp-common-objs := q6dsp-common.o q6dsp-lpass-ports.o q6dsp-lpass-clocks.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_COMMON) += snd-q6dsp-common.o
 obj-$(CONFIG_SND_SOC_QDSP6_CORE) += q6core.o
diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
index 9431656283cd..0eddba7895db 100644
--- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
@@ -7,115 +7,18 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/slab.h>
+#include "q6dsp-lpass-clocks.h"
 #include "q6afe.h"
 
 #define Q6AFE_CLK(id) {					\
 		.clk_id	= id,				\
-		.afe_clk_id	= Q6AFE_##id,		\
+		.q6dsp_clk_id	= Q6AFE_##id,		\
 		.name = #id,				\
 		.rate = 19200000,			\
 	}
 
-#define Q6AFE_VOTE_CLK(id, blkid, n) {			\
-		.clk_id	= id,				\
-		.afe_clk_id = blkid,			\
-		.name = n,				\
-	}
-
-struct q6afe_clk_init {
-	int clk_id;
-	int afe_clk_id;
-	char *name;
-	int rate;
-};
-
-struct q6afe_clk {
-	struct device *dev;
-	int afe_clk_id;
-	int attributes;
-	int rate;
-	uint32_t handle;
-	struct clk_hw hw;
-};
-
-#define to_q6afe_clk(_hw) container_of(_hw, struct q6afe_clk, hw)
-
-struct q6afe_cc {
-	struct device *dev;
-	struct q6afe_clk *clks[Q6AFE_MAX_CLK_ID];
-};
-
-static int clk_q6afe_prepare(struct clk_hw *hw)
-{
-	struct q6afe_clk *clk = to_q6afe_clk(hw);
-
-	return q6afe_set_lpass_clock(clk->dev, clk->afe_clk_id, clk->attributes,
-				     Q6AFE_LPASS_CLK_ROOT_DEFAULT, clk->rate);
-}
-
-static void clk_q6afe_unprepare(struct clk_hw *hw)
-{
-	struct q6afe_clk *clk = to_q6afe_clk(hw);
-
-	q6afe_set_lpass_clock(clk->dev, clk->afe_clk_id, clk->attributes,
-			      Q6AFE_LPASS_CLK_ROOT_DEFAULT, 0);
-}
-
-static int clk_q6afe_set_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long parent_rate)
-{
-	struct q6afe_clk *clk = to_q6afe_clk(hw);
-
-	clk->rate = rate;
-
-	return 0;
-}
-
-static unsigned long clk_q6afe_recalc_rate(struct clk_hw *hw,
-					   unsigned long parent_rate)
-{
-	struct q6afe_clk *clk = to_q6afe_clk(hw);
-
-	return clk->rate;
-}
-
-static long clk_q6afe_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
-{
-	return rate;
-}
-
-static const struct clk_ops clk_q6afe_ops = {
-	.prepare	= clk_q6afe_prepare,
-	.unprepare	= clk_q6afe_unprepare,
-	.set_rate	= clk_q6afe_set_rate,
-	.round_rate	= clk_q6afe_round_rate,
-	.recalc_rate	= clk_q6afe_recalc_rate,
-};
-
-static int clk_vote_q6afe_block(struct clk_hw *hw)
-{
-	struct q6afe_clk *clk = to_q6afe_clk(hw);
-
-	return q6afe_vote_lpass_core_hw(clk->dev, clk->afe_clk_id,
-					clk_hw_get_name(&clk->hw), &clk->handle);
-}
 
-static void clk_unvote_q6afe_block(struct clk_hw *hw)
-{
-	struct q6afe_clk *clk = to_q6afe_clk(hw);
-
-	q6afe_unvote_lpass_core_hw(clk->dev, clk->afe_clk_id, clk->handle);
-}
-
-static const struct clk_ops clk_vote_q6afe_ops = {
-	.prepare	= clk_vote_q6afe_block,
-	.unprepare	= clk_unvote_q6afe_block,
-};
-
-static const struct q6afe_clk_init q6afe_clks[] = {
+static const struct q6dsp_clk_init q6afe_clks[] = {
 	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
 	Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
 	Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
@@ -176,88 +79,28 @@ static const struct q6afe_clk_init q6afe_clks[] = {
 	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
 	Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
 	Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
-	Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
+	Q6DSP_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
 		       Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
 		       "LPASS_AVTIMER_MACRO"),
-	Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
+	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE,
 		       Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
 		       "LPASS_HW_MACRO"),
-	Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
+	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
 		       Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
 		       "LPASS_HW_DCODEC"),
 };
 
-static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
-					  void *data)
-{
-	struct q6afe_cc *cc = data;
-	unsigned int idx = clkspec->args[0];
-	unsigned int attr = clkspec->args[1];
-
-	if (idx >= Q6AFE_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
-		dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
-		return ERR_PTR(-EINVAL);
-	}
-
-	if (cc->clks[idx]) {
-		cc->clks[idx]->attributes = attr;
-		return &cc->clks[idx]->hw;
-	}
-
-	return ERR_PTR(-ENOENT);
-}
-
-static int q6afe_clock_dev_probe(struct platform_device *pdev)
-{
-	struct q6afe_cc *cc;
-	struct device *dev = &pdev->dev;
-	int i, ret;
-
-	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
-	if (!cc)
-		return -ENOMEM;
-
-	cc->dev = dev;
-	for (i = 0; i < ARRAY_SIZE(q6afe_clks); i++) {
-		unsigned int id = q6afe_clks[i].clk_id;
-		struct clk_init_data init = {
-			.name =  q6afe_clks[i].name,
-		};
-		struct q6afe_clk *clk;
-
-		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
-		if (!clk)
-			return -ENOMEM;
-
-		clk->dev = dev;
-		clk->afe_clk_id = q6afe_clks[i].afe_clk_id;
-		clk->rate = q6afe_clks[i].rate;
-		clk->hw.init = &init;
-
-		if (clk->rate)
-			init.ops = &clk_q6afe_ops;
-		else
-			init.ops = &clk_vote_q6afe_ops;
-
-		cc->clks[id] = clk;
-
-		ret = devm_clk_hw_register(dev, &clk->hw);
-		if (ret)
-			return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(dev, q6afe_of_clk_hw_get, cc);
-	if (ret)
-		return ret;
-
-	dev_set_drvdata(dev, cc);
-
-	return 0;
-}
+static const struct q6dsp_clk_desc q6dsp_clk_q6afe = {
+	.clks = q6afe_clks,
+	.num_clks = ARRAY_SIZE(q6afe_clks),
+	.lpass_set_clk = q6afe_set_lpass_clock,
+	.lpass_vote_clk = q6afe_vote_lpass_core_hw,
+	.lpass_unvote_clk = q6afe_unvote_lpass_core_hw,
+};
 
 #ifdef CONFIG_OF
 static const struct of_device_id q6afe_clock_device_id[] = {
-	{ .compatible = "qcom,q6afe-clocks" },
+	{ .compatible = "qcom,q6afe-clocks", .data = &q6dsp_clk_q6afe },
 	{},
 };
 MODULE_DEVICE_TABLE(of, q6afe_clock_device_id);
@@ -268,7 +111,7 @@ static struct platform_driver q6afe_clock_platform_driver = {
 		.name = "q6afe-clock",
 		.of_match_table = of_match_ptr(q6afe_clock_device_id),
 	},
-	.probe = q6afe_clock_dev_probe,
+	.probe = q6dsp_clock_dev_probe,
 };
 module_platform_driver(q6afe_clock_platform_driver);
 
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
new file mode 100644
index 000000000000..4613867d1133
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, Linaro Limited
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include "q6dsp-lpass-clocks.h"
+
+#define Q6DSP_MAX_CLK_ID			104
+#define Q6DSP_LPASS_CLK_ROOT_DEFAULT		0
+
+
+struct q6dsp_clk {
+	struct device *dev;
+	int q6dsp_clk_id;
+	int attributes;
+	int rate;
+	uint32_t handle;
+	struct clk_hw hw;
+};
+
+#define to_q6dsp_clk(_hw) container_of(_hw, struct q6dsp_clk, hw)
+
+struct q6dsp_cc {
+	struct device *dev;
+	struct q6dsp_clk *clks[Q6DSP_MAX_CLK_ID];
+	const struct q6dsp_clk_desc *desc;
+};
+
+static int clk_q6dsp_prepare(struct clk_hw *hw)
+{
+	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
+	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
+
+	return cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
+				     Q6DSP_LPASS_CLK_ROOT_DEFAULT, clk->rate);
+}
+
+static void clk_q6dsp_unprepare(struct clk_hw *hw)
+{
+	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
+	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
+
+	cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
+			      Q6DSP_LPASS_CLK_ROOT_DEFAULT, 0);
+}
+
+static int clk_q6dsp_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
+
+	clk->rate = rate;
+
+	return 0;
+}
+
+static unsigned long clk_q6dsp_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
+
+	return clk->rate;
+}
+
+static long clk_q6dsp_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	return rate;
+}
+
+static const struct clk_ops clk_q6dsp_ops = {
+	.prepare	= clk_q6dsp_prepare,
+	.unprepare	= clk_q6dsp_unprepare,
+	.set_rate	= clk_q6dsp_set_rate,
+	.round_rate	= clk_q6dsp_round_rate,
+	.recalc_rate	= clk_q6dsp_recalc_rate,
+};
+
+static int clk_vote_q6dsp_block(struct clk_hw *hw)
+{
+	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
+	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
+
+	return cc->desc->lpass_vote_clk(clk->dev, clk->q6dsp_clk_id,
+				  clk_hw_get_name(&clk->hw), &clk->handle);
+}
+
+static void clk_unvote_q6dsp_block(struct clk_hw *hw)
+{
+	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
+	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
+
+	cc->desc->lpass_unvote_clk(clk->dev, clk->q6dsp_clk_id, clk->handle);
+}
+
+static const struct clk_ops clk_vote_q6dsp_ops = {
+	.prepare	= clk_vote_q6dsp_block,
+	.unprepare	= clk_unvote_q6dsp_block,
+};
+
+
+static struct clk_hw *q6dsp_of_clk_hw_get(struct of_phandle_args *clkspec,
+					  void *data)
+{
+	struct q6dsp_cc *cc = data;
+	unsigned int idx = clkspec->args[0];
+	unsigned int attr = clkspec->args[1];
+
+	if (idx >= Q6DSP_MAX_CLK_ID || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
+		dev_err(cc->dev, "Invalid clk specifier (%d, %d)\n", idx, attr);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (cc->clks[idx]) {
+		cc->clks[idx]->attributes = attr;
+		return &cc->clks[idx]->hw;
+	}
+
+	return ERR_PTR(-ENOENT);
+}
+
+int q6dsp_clock_dev_probe(struct platform_device *pdev)
+{
+	struct q6dsp_cc *cc;
+	struct device *dev = &pdev->dev;
+	const struct q6dsp_clk_init *q6dsp_clks;
+	const struct q6dsp_clk_desc *desc;
+	int i, ret;
+
+	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
+	if (!cc)
+		return -ENOMEM;
+
+	desc = of_device_get_match_data(&pdev->dev);
+	if (!desc)
+		return -EINVAL;
+
+	cc->desc = desc;
+	cc->dev = dev;
+	q6dsp_clks = desc->clks;
+
+	for (i = 0; i < desc->num_clks; i++) {
+		unsigned int id = q6dsp_clks[i].clk_id;
+		struct clk_init_data init = {
+			.name =  q6dsp_clks[i].name,
+		};
+		struct q6dsp_clk *clk;
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		clk->dev = dev;
+		clk->q6dsp_clk_id = q6dsp_clks[i].q6dsp_clk_id;
+		clk->rate = q6dsp_clks[i].rate;
+		clk->hw.init = &init;
+
+		if (clk->rate)
+			init.ops = &clk_q6dsp_ops;
+		else
+			init.ops = &clk_vote_q6dsp_ops;
+
+		cc->clks[id] = clk;
+
+		ret = devm_clk_hw_register(dev, &clk->hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, q6dsp_of_clk_hw_get, cc);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, cc);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(q6dsp_clock_dev_probe);
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
new file mode 100644
index 000000000000..3770d81f2bd6
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __Q6DSP_AUDIO_CLOCKS_H__
+#define __Q6DSP_AUDIO_CLOCKS_H__
+
+struct q6dsp_clk_init {
+	int clk_id;
+	int q6dsp_clk_id;
+	char *name;
+	int rate;
+};
+
+#define Q6DSP_VOTE_CLK(id, blkid, n) {			\
+		.clk_id	= id,				\
+		.q6dsp_clk_id = blkid,			\
+		.name = n,				\
+	}
+
+struct q6dsp_clk_desc {
+	const struct q6dsp_clk_init *clks;
+	size_t num_clks;
+	int (*lpass_set_clk)(struct device *dev, int clk_id, int attr,
+			      int root_clk, unsigned int freq);
+	int (*lpass_vote_clk)(struct device *dev, uint32_t hid, const char *n, uint32_t *h);
+	int (*lpass_unvote_clk)(struct device *dev, uint32_t hid, uint32_t h);
+};
+
+int q6dsp_clock_dev_probe(struct platform_device *pdev);
+
+#endif  /* __Q6DSP_AUDIO_CLOCKS_H__ */
-- 
2.21.0

