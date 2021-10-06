Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B788423D18
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1B31692;
	Wed,  6 Oct 2021 13:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1B31692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633520664;
	bh=JZQzshkhmop36bb+Vh9XP2nuXha8figps5of1PUNUzE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bf5hxfAm6TDLPKgGxrO0cLVDh3HR4GXlgtuJNs8Egi3Fsq4+qiWPSsT2ERPz1O7Ul
	 swwGVFTWK9a43xFCR/J/GcIDwUx7IR7PjKcDWKpkeQPk701VerBuCxh9RDTcd4jW6Y
	 1fTZew7r2OOB4d/dYw7jGwXcA1/jXXeK0v6gbdi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B93F80536;
	Wed,  6 Oct 2021 13:40:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52F38F80518; Wed,  6 Oct 2021 13:40:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 160B9F804E2
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 160B9F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Vajmk6Nt"
Received: by mail-wr1-x42c.google.com with SMTP id o20so7900915wro.3
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQi26kZD3NU6o9BQW3gnN4Gz9rwWQ34SGLUx3B9aDNU=;
 b=Vajmk6NtATU/86fa2HgL9iiCkHChG9e0IDmZX2wP6HZ1ht2eN85dkS3fUDtOtej00Z
 fSI0oJqBQDvWCoyVRjXocu7yVZ+BaGb+3fi+SgjcX1GDx3Iin+yY1qMvbkdYdKCQU4xH
 TxZyE+2VOFjAPdM8RSJHhw9JoLp0vHioGo9MBk0GuZuLlTUshH1S+kiHhdBRzrul+3Ic
 hRiWjOjD3Jfkm+l/1zb55RGEzx0PAgcwC+zGSJss51X05asqyK418c64OO8OuDKOfC63
 EyAaM+E/Epz+Vhilkpt+VCgbQ6XhD8b3+jBTB0pprp2+sA4+7xUisrfOi3XZ0004ZnHj
 Qwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQi26kZD3NU6o9BQW3gnN4Gz9rwWQ34SGLUx3B9aDNU=;
 b=v4NmHS+K35SpEK3poQ2hKsMnVEJVyTmFutSLurBmQajcfwAMCMBKWa2QtrHDY0B9Ph
 ymCZbXnBIN1A/TQqD5Mk5CMCR66fDHUAPl5eUsLkTvLpE5vjtUJ6+QCMXuETVv8KX5VN
 2WxmY2hs28QRziYvHSdaqhL+MeysTt2R5+FQh+PEhdKZ7Nph3Lvo/iOaxn4i/jQbdIHa
 y6/OAVK6QGed27XK1aVmmJRvN7jWSade+GFzPpEmkAjAdR4roUZnbEky985xTNmOtQ82
 OP8IYPKIB4r0kORC/0YklP7zJO0LrU4ZPgJhuAlgvgc6yn69dvWV22ba824RhBIXqPfZ
 l68g==
X-Gm-Message-State: AOAM532DakzJF70vvxUroz1gwhhr2n7GfzVcMfSolSjKmkHrr4PnSAyy
 6MyKeIrbT3tHTpPvWs7JtZ0tAA==
X-Google-Smtp-Source: ABdhPJy7TEcJTkg0Uh/CVoYCTxn/AZ1im2fot60R18jKVjc3b0Gbk199beqxq8Ys2EAGmyFkuNAgEw==
X-Received: by 2002:a5d:6245:: with SMTP id m5mr28922174wrv.148.1633520412130; 
 Wed, 06 Oct 2021 04:40:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n11sm5540110wmq.19.2021.10.06.04.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 04:40:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v9 05/17] ASoC: qdsp6: q6afe-clocks: move audio-clocks to
 common file
Date: Wed,  6 Oct 2021 12:39:38 +0100
Message-Id: <20211006113950.10782-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
index 9431656283cd..1ccab64ff00b 100644
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
+static const struct q6dsp_clk_desc q6dsp_clk_q6afe __maybe_unused = {
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

