Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC34C2AB2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:19:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3343B184D;
	Thu, 24 Feb 2022 12:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3343B184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701578;
	bh=EK9A666tCNq+7r/BQqRKvEyWeuGXzX3zoRdxigVPKVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jMxfT0o0dlsmM0QRcDG/Q4P1w25CYfDRTLM53hztWGa8iYGs8W3a7p+e+qwWV9lok
	 Lu5GjZ0tFyFCnDMHASrIDv9q2eVpVVx7FcRr74KwsjVKrDudOHE6EjSqVhW0NwGm5G
	 30UMyILzZupLhS+k0FoaNWzC0b6nDXMPNVb7A214=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DEC9F8051D;
	Thu, 24 Feb 2022 12:17:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AE81F80508; Thu, 24 Feb 2022 12:17:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC2DF80169
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC2DF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n1L4xpTz"
Received: by mail-wr1-x429.google.com with SMTP id d3so2468603wrf.1
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BM5CJMOAHhPAmpP71sdzK8wbdwXXqGTSZfCgqYugXg=;
 b=n1L4xpTzRA0q8gh+4j2RqBvCcWy1klX3V/ib8KM0vfbFhkOWyjB9pXS/5oJpm51rQq
 INweqZjGSUBpP2Q1odh3RRNLafB1nUBSoMAgIjXGZkk55Pq4UTgXrfWA2YzovmoOCOTi
 FG/Egy5crEl/WFOcsapHiZrZhmlqhLH14+lhYXF/DNJ7pVCLkhab+1+RjT7Y00RxHG2V
 cDj7qQxtE1bFZFM1uWCe9IRvQmZNUZtSUh8NyXTd7gJ0q+KsUL/3EScbhc1OJMJ0o9oU
 jCa4GrX4MpQ00hsslCcfVfbDwbnLHE79BPt3gu0JJpIMe8Le1/oroCffXzQemP+vGQ6c
 iX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4BM5CJMOAHhPAmpP71sdzK8wbdwXXqGTSZfCgqYugXg=;
 b=zq1alQZzPIMkWFtFgKyGdMAR1UhiKo68zvCdIZryEU/uHfYj3MkUpjQxvgnzpjwG8n
 X8YqVdiuh1TV63m6NRzutWNoZCngLEZBcm3klga24XTi6d2yMn8OwkCbv7hGSEpiELAO
 LatJXW89pFffFkYUqX9J1kETog6BEctahaswF8Rfo6ive09TeL1h8JcyDciSfoKGrNf5
 ex+SXvRqHESIDTET8uDupWY7C5QRy0KJ8XDmXnqLJhnTmmhYZoDxDwX+wUevreIkzLQa
 VcLZHXa79BpqR5TbcHENwngquEe7OhiOuOFPlbfbK7wXfDGKu3yPcVerqmEKBZv6ykcD
 HpPw==
X-Gm-Message-State: AOAM531kGwa2YZ5szDdu8iK5urYw8tWukXTcwoGVS+UDDGNsqcgh6HS4
 WvWh+G9kCtt/Ung6Fp81oQ0y3g==
X-Google-Smtp-Source: ABdhPJz1C94utP8QKj8W69ks5id0NikmOu8cCjYgpbdqcoMNOqv9qC5629Z+024K827DsNT10sjlyA==
X-Received: by 2002:a05:6000:178a:b0:1ea:7db1:3159 with SMTP id
 e10-20020a056000178a00b001ea7db13159mr1819550wrg.9.1645701445430; 
 Thu, 24 Feb 2022 03:17:25 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:24 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 03/16] ASoC: codecs: tx-macro: move clk provider to managed
 variants
Date: Thu, 24 Feb 2022 11:17:05 +0000
Message-Id: <20220224111718.6264-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

move clk provider registration to managed api variants, this should help
with some code tidyup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index bd549b387862..75a5513bff16 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1745,10 +1745,9 @@ static const struct clk_ops swclk_gate_ops = {
 
 };
 
-static struct clk *tx_macro_register_mclk_output(struct tx_macro *tx)
+static int tx_macro_register_mclk_output(struct tx_macro *tx)
 {
 	struct device *dev = tx->dev;
-	struct device_node *np = dev->of_node;
 	const char *parent_clk_name = NULL;
 	const char *clk_name = "lpass-tx-mclk";
 	struct clk_hw *hw;
@@ -1764,13 +1763,11 @@ static struct clk *tx_macro_register_mclk_output(struct tx_macro *tx)
 	init.num_parents = 1;
 	tx->hw.init = &init;
 	hw = &tx->hw;
-	ret = clk_hw_register(tx->dev, hw);
+	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
-		return ERR_PTR(ret);
-
-	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
+		return ret;
 
-	return NULL;
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
 }
 
 static const struct snd_soc_component_driver tx_macro_component_drv = {
@@ -1843,7 +1840,9 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	tx_macro_register_mclk_output(tx);
+	ret = tx_macro_register_mclk_output(tx);
+	if (ret)
+		goto err;
 
 	ret = devm_snd_soc_register_component(dev, &tx_macro_component_drv,
 					      tx_macro_dai,
@@ -1861,8 +1860,6 @@ static int tx_macro_remove(struct platform_device *pdev)
 {
 	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
 
-	of_clk_del_provider(pdev->dev.of_node);
-
 	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
 
 	return 0;
-- 
2.21.0

