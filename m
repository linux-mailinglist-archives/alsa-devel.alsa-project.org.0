Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4DD264799
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 16:00:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC9F16D4;
	Thu, 10 Sep 2020 15:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC9F16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599746411;
	bh=eOipzIt7aP2Va3Td7KOVqf2mO0btIzECPL9dYl0iyXk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TSXWjKPxY4N9SLC7DhZKT09D8yXAbK82LZplZk8YrtmSrL02j3VQAadxb0EV2VDPc
	 1NevHzxYsDRRxKCw5/i+mfFxrLeh79k5zdnVvNLzDPphasdF2qgnh/RX16+XvQlWE1
	 fz/XUjSQfFHrFIJiTOVGckaAQ3xuEh8fAchzGVVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35ABFF8026F;
	Thu, 10 Sep 2020 15:57:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24955F802C3; Thu, 10 Sep 2020 15:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 050FDF8028C
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 15:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 050FDF8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Kwb9FGhK"
Received: by mail-wr1-x442.google.com with SMTP id a17so6822159wrn.6
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JuyBy5SQ7Lbzjz7YW70om8n+KmTvxYMUk+MZk/dzwhw=;
 b=Kwb9FGhK/VZxBJyw32CBJXlBvPh8JJqrejHsDQcx6O9DfDnqGscFNi1vOWFEv/JDvO
 5bAKHrqOopKBjW9KfqBdjL9jpxEYypeGrNbite8YEhbzS/6fWZq+rBh370l7/6vWc4nP
 JhO6l8tEbyb7nY7fvmUNAT6zOQMAkr82dtEs5HJE/YrOioqhkQX13VW8nVVKJpErzG9m
 vx8UVTFUrPweHMq/vdGw2RHq0tMqqxSftmckFvCmoC56PCOcuRm0akrg9j2j0ehiyO8e
 LGul4m6xMpzIJP0fKoPklKZxvdcdHpBkAtmOFjk9galeiYUzhBn3cIdn5ooBwljP+BNw
 0Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JuyBy5SQ7Lbzjz7YW70om8n+KmTvxYMUk+MZk/dzwhw=;
 b=AIm63YihA8gnyu9biTc8GdN4RzmYFkSwDrDhlQyIsd4j2IyObSDxikjKMrjrzt/yAV
 bTwJEwK/EuX0Mx4f+G1eUWSp2sMKp1beoATX8GjGcVno8suynHmXqtsW0Er5UD+Loo1l
 R/an0Y7dAy16QpnDzbWvAADmLXlEJHuoaIThstkX+/0X15AADqCzyWSCviGRgMFWk8li
 idwIPnGeE6yEmM1IYN72pFW3mi1b/vq+QoZnWMDI0OouavkWBplyeRjpCKYslGb9d92U
 Mx62XU4ardigAG0B+SdDNEUBYYG9yEzG0gQFRfDiu1FG6fPC/AmbSAXBW4i5E9MQu34n
 IUlg==
X-Gm-Message-State: AOAM532yQFsKXSnxxoeI4Nq9SZ+0oMA0szeegyiqCmxaRPxWwXBlLmzT
 GHBXoK8ggeUxKiByzJkZEq3IUg==
X-Google-Smtp-Source: ABdhPJxoAB4SgLJt/G+GmfOLrydKZkE5iN65qR8j3d4TGTuQTXLIW7vY72H0j/6CKQVH6sTxQnkeWw==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr8851548wrm.375.1599746252966; 
 Thu, 10 Sep 2020 06:57:32 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b2sm3786154wmh.47.2020.09.10.06.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:57:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	robh+dt@kernel.org
Subject: [PATCH 2/2] ASoC: q6afe-clocks: add q6afe clock controller
Date: Thu, 10 Sep 2020 14:57:08 +0100
Message-Id: <20200910135708.14842-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200910135708.14842-1-srinivas.kandagatla@linaro.org>
References: <20200910135708.14842-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 plai@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
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

q6afe already exposes lpass clocks, however this was not presented
as proper clock controller driver. This patch basically adds clock
controller support for q6afe clocks.

This is useful for other drivers like lpass digital codec or lpass
lowpower island drivers to request or vote for these clocks.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig              |   4 +
 sound/soc/qcom/qdsp6/Makefile       |   1 +
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 270 ++++++++++++++++++++++++++++
 3 files changed, 275 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6afe-clocks.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a607ace8b089..a7ef62685b41 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -63,6 +63,9 @@ config SND_SOC_QDSP6_AFE
 config SND_SOC_QDSP6_AFE_DAI
 	tristate
 
+config SND_SOC_QDSP6_AFE_CLOCKS
+	tristate
+
 config SND_SOC_QDSP6_ADM
 	tristate
 
@@ -83,6 +86,7 @@ config SND_SOC_QDSP6
 	select SND_SOC_QDSP6_CORE
 	select SND_SOC_QDSP6_AFE
 	select SND_SOC_QDSP6_AFE_DAI
+	select SND_SOC_QDSP6_AFE_CLOCKS
 	select SND_SOC_QDSP6_ADM
 	select SND_SOC_QDSP6_ROUTING
 	select SND_SOC_QDSP6_ASM
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index 7e91e96f7ad5..3c1dd9f32f1d 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_SND_SOC_QDSP6_COMMON) += q6dsp-common.o
 obj-$(CONFIG_SND_SOC_QDSP6_CORE) += q6core.o
 obj-$(CONFIG_SND_SOC_QDSP6_AFE) += q6afe.o
 obj-$(CONFIG_SND_SOC_QDSP6_AFE_DAI) += q6afe-dai.o
+obj-$(CONFIG_SND_SOC_QDSP6_AFE_CLOCKS) += q6afe-clocks.o
 obj-$(CONFIG_SND_SOC_QDSP6_ADM) += q6adm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ROUTING) += q6routing.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM) += q6asm.o
diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
new file mode 100644
index 000000000000..2967f4546af5
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-1.0
+// Copyright (c) 2020, Linaro Limited
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include "q6afe.h"
+
+#define Q6AFE_CLK(id) &(struct q6afe_clk) {		\
+		.clk_id	= id,				\
+		.afe_clk_id	= Q6AFE_##id,		\
+		.name = #id,				\
+		.attributes = LPASS_CLK_ATTRIBUTE_COUPLE_NO, \
+		.hw.init = &(struct clk_init_data) {	\
+			.ops = &clk_q6afe_ops,		\
+			.name = #id,			\
+		},					\
+	}
+
+#define Q6AFE_VOTE_CLK(id, blkid, n) &(struct q6afe_clk) { \
+		.clk_id	= id,				\
+		.afe_clk_id = blkid,			\
+		.name = #n,				\
+		.hw.init = &(struct clk_init_data) {	\
+			.ops = &clk_vote_q6afe_ops,	\
+			.name = #id,			\
+		},					\
+	}
+
+struct q6afe_clk {
+	struct device *dev;
+	int clk_id;
+	int afe_clk_id;
+	char *name;
+	int attributes;
+	int rate;
+	uint32_t handle;
+	struct clk_hw hw;
+};
+
+#define to_q6afe_clk(_hw) container_of(_hw, struct q6afe_clk, hw)
+
+struct q6afe_cc {
+	struct device *dev;
+	struct q6afe_clk **clks;
+	int num_clks;
+};
+
+static int clk_q6afe_prepare(struct clk_hw *hw)
+{
+	struct q6afe_clk *clk = to_q6afe_clk(hw);
+
+	return q6afe_set_lpass_clock(clk->dev, clk->afe_clk_id, clk->attributes,
+				     Q6AFE_LPASS_CLK_ROOT_DEFAULT, clk->rate);
+}
+
+static void clk_q6afe_unprepare(struct clk_hw *hw)
+{
+	struct q6afe_clk *clk = to_q6afe_clk(hw);
+
+	q6afe_set_lpass_clock(clk->dev, clk->afe_clk_id, clk->attributes,
+			      Q6AFE_LPASS_CLK_ROOT_DEFAULT, 0);
+}
+
+static int clk_q6afe_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct q6afe_clk *clk = to_q6afe_clk(hw);
+
+	clk->rate = rate;
+
+	return 0;
+}
+
+static unsigned long clk_q6afe_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct q6afe_clk *clk = to_q6afe_clk(hw);
+
+	return clk->rate;
+}
+
+static long clk_q6afe_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	return rate;
+}
+
+static const struct clk_ops clk_q6afe_ops = {
+	.prepare	= clk_q6afe_prepare,
+	.unprepare	= clk_q6afe_unprepare,
+	.set_rate	= clk_q6afe_set_rate,
+	.round_rate	= clk_q6afe_round_rate,
+	.recalc_rate	= clk_q6afe_recalc_rate,
+};
+
+static int clk_vote_q6afe_block(struct clk_hw *hw)
+{
+	struct q6afe_clk *clk = to_q6afe_clk(hw);
+
+	return q6afe_vote_lpass_core_hw(clk->dev, clk->afe_clk_id,
+					clk->name, &clk->handle);
+}
+
+static void clk_unvote_q6afe_block(struct clk_hw *hw)
+{
+	struct q6afe_clk *clk = to_q6afe_clk(hw);
+
+	q6afe_unvote_lpass_core_hw(clk->dev, clk->afe_clk_id, clk->handle);
+}
+
+static const struct clk_ops clk_vote_q6afe_ops = {
+	.prepare	= clk_vote_q6afe_block,
+	.unprepare	= clk_unvote_q6afe_block,
+};
+
+struct q6afe_clk *q6afe_clks[Q6AFE_MAX_CLK_ID] = {
+	[LPASS_CLK_ID_PRI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
+	[LPASS_CLK_ID_PRI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
+	[LPASS_CLK_ID_SEC_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
+	[LPASS_CLK_ID_SEC_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
+	[LPASS_CLK_ID_TER_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
+	[LPASS_CLK_ID_TER_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
+	[LPASS_CLK_ID_QUAD_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
+	[LPASS_CLK_ID_QUAD_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
+	[LPASS_CLK_ID_SPEAKER_I2S_IBIT] =
+				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
+	[LPASS_CLK_ID_SPEAKER_I2S_EBIT] =
+				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
+	[LPASS_CLK_ID_SPEAKER_I2S_OSR] =
+				Q6AFE_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
+	[LPASS_CLK_ID_QUI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
+	[LPASS_CLK_ID_QUI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
+	[LPASS_CLK_ID_SEN_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
+	[LPASS_CLK_ID_SEN_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
+	[LPASS_CLK_ID_INT0_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
+	[LPASS_CLK_ID_INT1_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
+	[LPASS_CLK_ID_INT2_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
+	[LPASS_CLK_ID_INT3_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
+	[LPASS_CLK_ID_INT4_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
+	[LPASS_CLK_ID_INT5_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
+	[LPASS_CLK_ID_INT6_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
+	[LPASS_CLK_ID_QUI_MI2S_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	[LPASS_CLK_ID_PRI_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_IBIT),
+	[LPASS_CLK_ID_PRI_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_PCM_EBIT),
+	[LPASS_CLK_ID_SEC_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_IBIT),
+	[LPASS_CLK_ID_SEC_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_PCM_EBIT),
+	[LPASS_CLK_ID_TER_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_IBIT),
+	[LPASS_CLK_ID_TER_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_PCM_EBIT),
+	[LPASS_CLK_ID_QUAD_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_IBIT),
+	[LPASS_CLK_ID_QUAD_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_PCM_EBIT),
+	[LPASS_CLK_ID_QUIN_PCM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_IBIT),
+	[LPASS_CLK_ID_QUIN_PCM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_PCM_EBIT),
+	[LPASS_CLK_ID_QUI_PCM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUI_PCM_OSR),
+	[LPASS_CLK_ID_PRI_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_IBIT),
+	[LPASS_CLK_ID_PRI_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_TDM_EBIT),
+	[LPASS_CLK_ID_SEC_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_IBIT),
+	[LPASS_CLK_ID_SEC_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_TDM_EBIT),
+	[LPASS_CLK_ID_TER_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_IBIT),
+	[LPASS_CLK_ID_TER_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_TER_TDM_EBIT),
+	[LPASS_CLK_ID_QUAD_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_IBIT),
+	[LPASS_CLK_ID_QUAD_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUAD_TDM_EBIT),
+	[LPASS_CLK_ID_QUIN_TDM_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_IBIT),
+	[LPASS_CLK_ID_QUIN_TDM_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_EBIT),
+	[LPASS_CLK_ID_QUIN_TDM_OSR] = Q6AFE_CLK(LPASS_CLK_ID_QUIN_TDM_OSR),
+	[LPASS_CLK_ID_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_1),
+	[LPASS_CLK_ID_MCLK_2] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_2),
+	[LPASS_CLK_ID_MCLK_3] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_3),
+	[LPASS_CLK_ID_MCLK_4] = Q6AFE_CLK(LPASS_CLK_ID_MCLK_4),
+	[LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE] =
+		Q6AFE_CLK(LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE),
+	[LPASS_CLK_ID_INT_MCLK_0] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_0),
+	[LPASS_CLK_ID_INT_MCLK_1] = Q6AFE_CLK(LPASS_CLK_ID_INT_MCLK_1),
+	[LPASS_CLK_ID_WSA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
+	[LPASS_CLK_ID_WSA_CORE_NPL_MCLK] =
+				Q6AFE_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
+	[LPASS_CLK_ID_VA_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
+	[LPASS_CLK_ID_TX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
+	[LPASS_CLK_ID_TX_CORE_NPL_MCLK] =
+			Q6AFE_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
+	[LPASS_CLK_ID_RX_CORE_MCLK] = Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
+	[LPASS_CLK_ID_RX_CORE_NPL_MCLK] =
+				Q6AFE_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
+	[LPASS_CLK_ID_VA_CORE_2X_MCLK] =
+				Q6AFE_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
+	[LPASS_HW_AVTIMER_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_AVTIMER_VOTE,
+						 Q6AFE_LPASS_CORE_AVTIMER_BLOCK,
+						 "LPASS_AVTIMER_MACRO"),
+	[LPASS_HW_MACRO_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_MACRO_VOTE,
+						Q6AFE_LPASS_CORE_HW_MACRO_BLOCK,
+						"LPASS_HW_MACRO"),
+	[LPASS_HW_DCODEC_VOTE] = Q6AFE_VOTE_CLK(LPASS_HW_DCODEC_VOTE,
+					Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK,
+					"LPASS_HW_DCODEC"),
+};
+
+static struct clk_hw *q6afe_of_clk_hw_get(struct of_phandle_args *clkspec,
+					  void *data)
+{
+	struct q6afe_cc *cc = data;
+	unsigned int idx = clkspec->args[0];
+	unsigned int attr = clkspec->args[1];
+
+	if (idx >= cc->num_clks || attr > LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR) {
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
+static int q6afe_clock_dev_probe(struct platform_device *pdev)
+{
+	struct q6afe_cc *cc;
+	struct device *dev = &pdev->dev;
+	int i, ret;
+
+	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
+	if (!cc)
+		return -ENOMEM;
+
+	cc->clks = &q6afe_clks[0];
+	cc->num_clks = ARRAY_SIZE(q6afe_clks);
+	for (i = 0; i < ARRAY_SIZE(q6afe_clks); i++) {
+		if (!q6afe_clks[i])
+			continue;
+
+		q6afe_clks[i]->dev = dev;
+
+		ret = devm_clk_hw_register(dev, &q6afe_clks[i]->hw);
+		if (ret)
+			return ret;
+	}
+
+	ret = of_clk_add_hw_provider(dev->of_node, q6afe_of_clk_hw_get, cc);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(dev, cc);
+
+	return 0;
+}
+
+static const struct of_device_id q6afe_clock_device_id[] = {
+	{ .compatible = "qcom,q6afe-clocks" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, q6afe_clock_device_id);
+
+static struct platform_driver q6afe_clock_platform_driver = {
+	.driver = {
+		.name = "q6afe-clock",
+		.of_match_table = of_match_ptr(q6afe_clock_device_id),
+	},
+	.probe = q6afe_clock_dev_probe,
+};
+module_platform_driver(q6afe_clock_platform_driver);
+
+MODULE_DESCRIPTION("Q6 Audio Frontend clock driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

