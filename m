Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD904439D81
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F32216CA;
	Mon, 25 Oct 2021 19:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F32216CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635182633;
	bh=+N3DeZZmH2oirnxxck5TfTR/MZVO/DQUtQhVo4gDGIc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mXDnKPwW7CUC4OzVrinni2DAr6GoByMNUVuBluwvLopsEkZoTXaUNzHr8gtwm2iRt
	 jRxaM/tqtgTvllwVDDiis6XpE295gZRZ7GAivlVGLKhr5EIsNYQ5uuyi68b1JiwYwd
	 4e8ZSitidyOIov5DluxC6bqOnk76jOv4t9+l7Usk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5667F80570;
	Mon, 25 Oct 2021 19:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 524A1F80542; Mon, 25 Oct 2021 19:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EB5AF804FE
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 19:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EB5AF804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UzFeGRMu"
Received: by mail-wm1-x32c.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso331969wmc.1
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 10:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kwh/zfyHKoZT2T+jmgQ6n/y3v9zeytVaHdrWCJhtta4=;
 b=UzFeGRMuouettuGjNjAUrH0PIQGz9QJ32mys6gaIGAR99Grt9k1SpRtWx1/vc2zkw3
 EWkUWcQ5sfQCvOPeF0dk98XmoX2AaHVybQL49N36rpcIk490aZX3L5qgGp8jxy7j1Y5N
 khlWF+qamZLLpzOrw1uLiz3kKvMFzcRSBvYnVN0wpuITuefmy20MLXxlszQzmktIhg97
 cWBRj9iNJiFjj5/8dcL+lzFaqdHgUp1LC16RKwNJRE0I6Zn//MULPtpWNZ0eB/x+/uNm
 Cer8RjtcwacCGxzBWXXHqZWqjCtFt6IaJbuwr7x19cl1KWK6G+dNjQ3WLWIvcnEdSV+0
 3pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kwh/zfyHKoZT2T+jmgQ6n/y3v9zeytVaHdrWCJhtta4=;
 b=JkejLc1VHl3qIjSV+udCyiXMW99GpWZpBLzqsCNXRa176Ozmr+G+ewJ3cs9Wf1mgC3
 iTlU5AfNVwuPmNYb2vsdUUTV8/+1aSyVP8d+MU+TpbaSb6MmxdJ2BtZ1ikbirb9yXGKa
 8W3VFZ+JI8xEV1s6uM+GIy4f4QYvmuhA8dvsyziFLOyxebFG4Qa7MI2kJinR2tnb/qsS
 WjST6yipc0ip5fbgX9p+3so7Q39R2fBep/hZ9+oXwz7B+z/bFtIWAYl0brM/owMeXJCK
 bzxoqhcd1muuMRtAdyiNGlh29MSt+e/5Ovq1pHppjuSXxCVh85YtY+UdplX0BcEKBtkJ
 qi/g==
X-Gm-Message-State: AOAM530FXYZCQd/ONsCa+l4+qMOpJM88Vn3UR00ya8kltH7UXNtWRdof
 zEBVX6Roul97zRaxK9E5bVoq1w==
X-Google-Smtp-Source: ABdhPJypVwDosPOXXoI3SPg/TjbJe/VTsPvp1VCfLdbFb05WhZJCZEdxgSNqRCn8mE9iug7OCv3cHg==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr18631875wml.144.1635182250099; 
 Mon, 25 Oct 2021 10:17:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r11sm5181012wrt.42.2021.10.25.10.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 10:17:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v10 17/17] ASoC: qdsp6: audioreach: add support for
 q6prm-clocks
Date: Mon, 25 Oct 2021 18:16:49 +0100
Message-Id: <20211025171649.17730-18-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
References: <20211025171649.17730-1-srinivas.kandagatla@linaro.org>
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

Add q6prm clocks using existing qdsp6-audio-clock driver

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/Kconfig              |  4 ++
 sound/soc/qcom/qdsp6/Makefile       |  1 +
 sound/soc/qcom/qdsp6/q6prm-clocks.c | 85 +++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6prm-clocks.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 465a2a603401..5b74c5bcc47f 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -96,8 +96,12 @@ config SND_SOC_QDSP6_APM
 	select SND_SOC_QDSP6_APM_DAI
 	select SND_SOC_QDSP6_APM_LPASS_DAI
 
+config SND_SOC_QDSP6_PRM_LPASS_CLOCKS
+	tristate
+
 config SND_SOC_QDSP6_PRM
 	tristate
+	select SND_SOC_QDSP6_PRM_LPASS_CLOCKS
 
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index c932f8e24b32..3963bf234664 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -16,3 +16,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_APM) += snd-q6apm.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += q6apm-dai.o
 obj-$(CONFIG_SND_SOC_QDSP6_APM_LPASS_DAI) += q6apm-lpass-dais.o
 obj-$(CONFIG_SND_SOC_QDSP6_PRM) += q6prm.o
+obj-$(CONFIG_SND_SOC_QDSP6_PRM_LPASS_CLOCKS) += q6prm-clocks.o
diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
new file mode 100644
index 000000000000..a26cda5140c1
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021, Linaro Limited
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include "q6dsp-lpass-clocks.h"
+#include "q6prm.h"
+
+#define Q6PRM_CLK(id) {					\
+		.clk_id	= id,				\
+		.q6dsp_clk_id	= Q6PRM_##id,		\
+		.name = #id,				\
+		.rate = 19200000,			\
+	}
+
+static const struct q6dsp_clk_init q6prm_clks[] = {
+	Q6PRM_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_SEC_MI2S_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_TER_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_TER_MI2S_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QUAD_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QUAD_MI2S_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_SPEAKER_I2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_SPEAKER_I2S_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_SPEAKER_I2S_OSR),
+	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_SEN_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_SEN_MI2S_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INT0_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INT1_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INT2_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INT3_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INT4_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_TX_CORE_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_TX_CORE_NPL_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_NPL_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_2X_MCLK),
+	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
+		       "LPASS_HW_MACRO"),
+	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
+		       "LPASS_HW_DCODEC"),
+};
+
+static const struct q6dsp_clk_desc q6dsp_clk_q6prm __maybe_unused = {
+	.clks = q6prm_clks,
+	.num_clks = ARRAY_SIZE(q6prm_clks),
+	.lpass_set_clk = q6prm_set_lpass_clock,
+	.lpass_vote_clk = q6prm_vote_lpass_core_hw,
+	.lpass_unvote_clk = q6prm_unvote_lpass_core_hw,
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id q6prm_clock_device_id[] = {
+	{ .compatible = "qcom,q6prm-lpass-clocks", .data = &q6dsp_clk_q6prm },
+	{},
+};
+MODULE_DEVICE_TABLE(of, q6prm_clock_device_id);
+#endif
+
+static struct platform_driver q6prm_clock_platform_driver = {
+	.driver = {
+		.name = "q6prm-lpass-clock",
+		.of_match_table = of_match_ptr(q6prm_clock_device_id),
+	},
+	.probe = q6dsp_clock_dev_probe,
+};
+module_platform_driver(q6prm_clock_platform_driver);
+
+MODULE_DESCRIPTION("Q6 Proxy Resource Manager LPASS clock driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

