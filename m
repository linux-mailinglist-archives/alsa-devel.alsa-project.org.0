Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C225F4BD9D9
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:14:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518E51703;
	Mon, 21 Feb 2022 14:13:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518E51703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449251;
	bh=QilgmRm+T3CSJ6u7OADtHk14zhQyw71g+5KS3XswgiA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=My71OqR4mdnVTxYSjmxvjOHSDM6iUl8EOjrj+JxWd/bD1T3avk8d786BSrKwKVupB
	 Eg8DTZTZxDa/TykLkm35s6nigfsxk/wk4wCOO6y7mZdEhcEGGtr1ONGyzdfNsSuqEr
	 dM1ugyzwl6gPuultNFXmXGXqNsxY4wuqKQ8+y7LY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7CAF8053A;
	Mon, 21 Feb 2022 14:11:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2013BF80533; Mon, 21 Feb 2022 14:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33F05F80515
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33F05F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="faIwDDvC"
Received: by mail-wm1-x32b.google.com with SMTP id n8so9476118wms.3
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=at3S5biHzZRQ5m3HY8Vsi7c1hMS+BWBfzlmLlepvupM=;
 b=faIwDDvCMFUEF365S3xjC5ACrPp7alH7moZZBT7u8h2JopCKjQv6oR0hnojsJxt4nX
 gW8YPghV7MzBMDBMSxDzkxge6UPqxV8PHiEwbndMtwbClQHyCV07RL1yRAs8m6hepQ/I
 l9x4Jryu6tq34aXWJs3Px21zIpSusUdKkGUrkhljHfU1omzZJ7myLsumwSDmpEibKffn
 ETCAun07s1vRNZ0kgrU+MTbScQ/wzYQlrvVeub74t2cIsLNnuVpUrLxXbaIQ3GMyLtZN
 twP4OWM99hLins9KsaQqWdc5M7sHE6LxCTu9lkMTQCztm1xtIsiR+Rp/iGvHdQkMuI0+
 ypyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=at3S5biHzZRQ5m3HY8Vsi7c1hMS+BWBfzlmLlepvupM=;
 b=1n3IU06kWUDVpNkQOpVwp3rR0RzQsxKZjZpyE4NGg0/giZPWCZ8Od9osXyP1/zIXKB
 ufGL22NphOEOq7z8HtDb/sLw5v6D1PGJ59aQXanyq6WjlUup7ShRk+eB28UgZdw+3X3P
 bHgukWc0IrL6AemUZU5+0kNXkil0ElS7JStb5/hIxyVAO4kHJrXKKTuErNY8VW5nbnKP
 aN61xnsk6LSPeukoHQuFZde1I3RVaaR8/bKiAXZSg2/7bLI1c5BEFlDxI2GTFnXEkrzi
 z5f2kzE3mHSM2GCbDYVFiJKY+6AQYTGAjsTnzYkTQR8zj+usO+0uvPMcS6A8veIZbHDp
 xbAA==
X-Gm-Message-State: AOAM5317Smi9DZx4VJKq6CkqfqsFZnBfhqkDv7ooRUW2fmkpEm69ZB/z
 n3EsV5ZOcW8PtUGlJjVgUKElVA==
X-Google-Smtp-Source: ABdhPJwdS0x6aEHX2AWFNqZ0uWaJOk2qtndMD9nkFanM/s2IpgpnWoYitl9TdBmG9QSBo7veMQobBQ==
X-Received: by 2002:a1c:4443:0:b0:34d:a9d6:884 with SMTP id
 r64-20020a1c4443000000b0034da9d60884mr21774467wma.50.1645449051415; 
 Mon, 21 Feb 2022 05:10:51 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:50 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 09/10] ASoC: codecs: tx-macro: setup soundwire clks correctly
Date: Mon, 21 Feb 2022 13:10:36 +0000
Message-Id: <20220221131037.8809-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
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

For SoundWire Frame sync to be generated correctly we need both MCLK
and MCLKx2 (npl). Without pm runtime enabled these two clocks will remain on,
however after adding pm runtime support its possible that NPl clock could be
turned off even when SoundWire controller is active.

Fix this by enabling mclk and npl clk when SoundWire clks are enabled.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1c0f0d27ed42..f90786100d1a 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1687,6 +1687,7 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	struct tx_macro *tx = to_tx_macro(hw);
 	struct regmap *regmap = tx->regmap;
 
+	clk_prepare_enable(tx->clks[2].clk);
 	tx_macro_mclk_enable(tx, true);
 	if (tx->reset_swr)
 		regmap_update_bits(regmap, CDC_TX_CLK_RST_CTRL_SWR_CONTROL,
@@ -1713,6 +1714,7 @@ static void swclk_gate_disable(struct clk_hw *hw)
 			   CDC_TX_SWR_CLK_EN_MASK, 0x0);
 
 	tx_macro_mclk_enable(tx, false);
+	clk_disable_unprepare(tx->clks[2].clk);
 }
 
 static int swclk_gate_is_enabled(struct clk_hw *hw)
@@ -1750,7 +1752,7 @@ static struct clk *tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(tx->clks[2].clk);
+	parent_clk_name = __clk_get_name(tx->clks[3].clk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
-- 
2.21.0

