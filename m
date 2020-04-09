Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E651A3B1C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DF61693;
	Thu,  9 Apr 2020 22:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DF61693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462842;
	bh=zY7EQyzHDppMFSmHiOi9IwN+ZvN3AvLNwyP3oNdclp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u+paz10zLqxt3CxqpYLdVxIzu7lja/RzGUGd2Wh4pWQXaGjn8LxycH2ee9ekXGvcz
	 IIt1i2R+CkFEssnf98k13Gx2ieVQ33Fxj9NgKP7bXjkhcA5c7HznS5TQYXjdk5O6rG
	 KWr1sWNK0Xq2LFL6cHFIM3VVXk/41zLDOHvDtrnw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CEC8F80305;
	Thu,  9 Apr 2020 21:59:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 520F4F8028F; Thu,  9 Apr 2020 21:59:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7DCFF8028F
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7DCFF8028F
IronPort-SDR: bDcz6iKltlrEhNBIhbln8L6Jj4t0nnrEQJhptJFUjr7g5OqTFV/8kgcIcYrZZTw4dnBUgXWJbg
 b1tYU478m5Lg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:21 -0700
IronPort-SDR: 0D80xSN2e8ZlyhaRLFGKvpxSyzt9ebrNS/wl73d/6TDEu6hm7qMSOJYjkbPu6am2toWPVQ+oWk
 KhaQnMJ64z+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745377"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 11/16] clk: hifiberry-dacpro: transition to _hw functions
Date: Thu,  9 Apr 2020 14:58:36 -0500
Message-Id: <20200409195841.18901-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Matthias Reichl <hias@horus.com>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

devm_clk_register() and of_clk_add_provider() are deprecated, use the
recommended functions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index 78ede325d237..bf0616c959da 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -91,7 +91,6 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 	struct clk_hifiberry_hw *proclk;
 	struct clk_init_data init;
 	struct device *dev;
-	struct clk *clk;
 	int ret;
 
 	dev = &pdev->dev;
@@ -109,14 +108,15 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 	proclk->mode = 0;
 	proclk->hw.init = &init;
 
-	clk = devm_clk_register(dev, &proclk->hw);
-	if (!IS_ERR(clk)) {
-		ret = of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
-			clk);
-	} else {
+	ret = devm_clk_hw_register(dev, &proclk->hw);
+	if (ret) {
 		dev_err(dev, "Fail to register clock driver\n");
-		ret = PTR_ERR(clk);
+		return ret;
 	}
+
+	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
+				     &proclk->hw);
+
 	return ret;
 }
 
-- 
2.20.1

