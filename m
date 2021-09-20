Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6C41104F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 09:39:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E9C61694;
	Mon, 20 Sep 2021 09:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E9C61694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632123576;
	bh=xBoZLOIUTT1bPLmNEGRpH2zCjvXrgtQPDm8GxLLOcvg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EtGFCXv/2mESTPV2ACKXUzBbzXrmTyjf6jpn/2T1wxqnlulVMz82wrKIiAgOlCZLT
	 d+kLxMk5qvjrn2Ya+yyYPdwxK+xi5SvYmfNJhLFrtV79wa2vILjM18NXAjeTKVgXVf
	 qHBCUJNxEArwuz+qI/BXs+49LIFH+KapdfIMmH9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA6CF80511;
	Mon, 20 Sep 2021 09:36:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C919F80508; Mon, 20 Sep 2021 09:36:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A5B1F804FB
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 09:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A5B1F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="PCdm0k4b"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632123410; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=K50d4npJAxjWiTCuGHctX6FyO/bfVsZLYNZSmtAgHws=;
 b=PCdm0k4byqA4WQ9gIDKikLm3aFRevrxzc/KYm1mVu1zVdQ2IPBu1oLRYdqdvJat4lZXtlun5
 KXuyOBKmBlcLh3hwjQ4M56UJhjmRT5VX6ClW6dmkMC1PhZZmJeMfjKHAfJpIHTBqLN3mp4Yf
 TYzbNwXoMSZUMa0mQo2azhNoPkM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61483a03bd6681d8ed796dc7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:36:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 19B3AC43638; Mon, 20 Sep 2021 07:36:34 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C7168C43635;
 Mon, 20 Sep 2021 07:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C7168C43635
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH 6/7] ASoC: codecs: lpass-tx-macro: Change bulk voting to
 individual clock voting
Date: Mon, 20 Sep 2021 13:05:30 +0530
Message-Id: <1632123331-2425-7-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Change bulk clock frequency voting to individual voting.

Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 67 +++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index e65b592..78e5e0b 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -258,7 +259,11 @@ struct tx_macro {
 	unsigned long active_ch_cnt[TX_MACRO_MAX_DAIS];
 	unsigned long active_decimator[TX_MACRO_MAX_DAIS];
 	struct regmap *regmap;
-	struct clk_bulk_data clks[TX_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *npl;
+	struct clk *macro;
+	struct clk *dcodec;
+	struct clk *fsgen;
 	struct clk_hw hw;
 	bool dec_active[NUM_DECIMATORS];
 	bool reset_swr;
@@ -1695,7 +1700,9 @@ static int swclk_gate_enable(struct clk_hw *hw)
 {
 	struct tx_macro *tx = to_tx_macro(hw);
 	struct regmap *regmap = tx->regmap;
-
+	pm_runtime_get_sync(tx->dev);
+	clk_set_rate(tx->npl, 2 * MCLK_FREQ);
+	clk_prepare_enable(tx->npl);
 	tx_macro_mclk_enable(tx, true);
 	if (tx->reset_swr)
 		regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
@@ -1722,6 +1729,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_TX_SWR_CLK_EN_MASK, 0x0);
 
 	tx_macro_mclk_enable(tx, false);
+	clk_disable_unprepare(tx->npl);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -1759,7 +1767,7 @@ static struct clk *tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(tx->clks[2].clk);
+	parent_clk_name = __clk_get_name(tx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -1799,17 +1807,25 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (!tx)
 		return -ENOMEM;
 
-	tx->clks[0].id = "macro";
-	tx->clks[1].id = "dcodec";
-	tx->clks[2].id = "mclk";
-	tx->clks[3].id = "npl";
-	tx->clks[4].id = "fsgen";
+	tx->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(tx->mclk))
+		return PTR_ERR(tx->mclk);
 
-	ret = devm_clk_bulk_get(dev, TX_NUM_CLKS_MAX, tx->clks);
-	if (ret) {
-		dev_err(dev, "Error getting RX Clocks (%d)\n", ret);
-		return ret;
-	}
+	tx->npl = devm_clk_get(dev, "npl");
+	if (IS_ERR(tx->npl))
+		return PTR_ERR(tx->npl);
+
+	tx->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(tx->macro))
+		return PTR_ERR(tx->macro);
+
+	tx->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(tx->dcodec))
+		return PTR_ERR(tx->dcodec);
+
+	tx->fsgen = devm_clk_get(dev, "fsgen");
+	if (IS_ERR(tx->fsgen))
+		return PTR_ERR(tx->fsgen);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -1823,12 +1839,15 @@ static int tx_macro_probe(struct platform_device *pdev)
 	tx->dev = dev;
 
 	/* set MCLK and NPL rates */
-	clk_set_rate(tx->clks[2].clk, MCLK_FREQ);
-	clk_set_rate(tx->clks[3].clk, 2 * MCLK_FREQ);
+	clk_set_rate(tx->mclk, MCLK_FREQ);
+	clk_set_rate(tx->npl, 2 * MCLK_FREQ);
 
-	ret = clk_bulk_prepare_enable(TX_NUM_CLKS_MAX, tx->clks);
-	if (ret)
-		return ret;
+	clk_prepare_enable(tx->macro);
+	clk_prepare_enable(tx->dcodec);
+
+	clk_prepare_enable(tx->mclk);
+	clk_prepare_enable(tx->npl);
+	clk_prepare_enable(tx->fsgen);
 
 	tx_macro_register_mclk_output(tx);
 
@@ -1839,7 +1858,11 @@ static int tx_macro_probe(struct platform_device *pdev)
 		goto err;
 	return ret;
 err:
-	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->macro);
+	clk_disable_unprepare(tx->dcodec);
+	clk_disable_unprepare(tx->fsgen);
 
 	return ret;
 }
@@ -1850,7 +1873,11 @@ static int tx_macro_remove(struct platform_device *pdev)
 
 	of_clk_del_provider(pdev->dev.of_node);
 
-	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
+	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->npl);
+	clk_disable_unprepare(tx->macro);
+	clk_disable_unprepare(tx->dcodec);
+	clk_disable_unprepare(tx->fsgen);
 
 	return 0;
 }
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

