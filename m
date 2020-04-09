Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B90751A3B25
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629A41693;
	Thu,  9 Apr 2020 22:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629A41693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462903;
	bh=SgdWB+kSJhSChQrBGR5bEcQCs7u+ZcmvH+5eqrBYsgY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NuKwPNgTJ766UxX6EoWrrMuct3JqvBQmKXXic7W05eiewsKE8HwxF0UiGSN+IBecH
	 GI283egVKJ9TYP+5QHkBlFIhTn8HUE5qyM7fmAw8/Qh7uXLLKFTJCQ6MmRndoIQlZ1
	 u+IAR4pySLlETu2IEyZQ1mxrvqb0FCQCP2AAwL34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AB06F80328;
	Thu,  9 Apr 2020 21:59:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78901F802EB; Thu,  9 Apr 2020 21:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B188F8028F
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B188F8028F
IronPort-SDR: k4Unlj3aKK8fnv4hSmV76Wdpv8dNFLNvbQZKO1/6Ja47SJj6xo6E8w/kew52eur/epo05pD9bj
 ubDHpz8bPr4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:25 -0700
IronPort-SDR: dHP/bYIuIXTrVPUaQy+yzFaahuuDr9UKCMFuLiMQJKE4xPbdL5qLhqrC5rosaIRiHayHfiw6Jd
 nFqdBJVE8Adw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745396"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 13/16] clk: hifiberry-dacpro: add "sclk" lookup
Date: Thu,  9 Apr 2020 14:58:38 -0500
Message-Id: <20200409195841.18901-14-pierre-louis.bossart@linux.intel.com>
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

devm_clk_get() fails on ACPI platforms when a NULL string is used.
Create a "sclk" lookup to make sure codec and machine drivers can get
the clock.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index d01a90fed51b..36210f52c624 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -24,10 +24,12 @@
  * struct clk_hifiberry_hw - Common struct to the HiFiBerry DAC Pro
  * @hw: clk_hw for the common clk framework
  * @mode: 0 => CLK44EN, 1 => CLK48EN
+ * @sclk_lookup: handle for "sclk"
  */
 struct clk_hifiberry_hw {
 	struct clk_hw hw;
 	u8 mode;
+	struct clk_lookup *sclk_lookup;
 };
 
 #define to_hifiberry_clk(_hw) container_of(_hw, struct clk_hifiberry_hw, hw)
@@ -121,15 +123,34 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 	ret = devm_clk_hw_register_clkdev(dev, &proclk->hw,
 					  init.name, NULL);
 #endif
+	if (ret) {
+		dev_err(dev, "Fail to add clock driver\n");
+		return ret;
+	}
+
+	proclk->sclk_lookup = clkdev_hw_create(&proclk->hw, "sclk", NULL);
+	if (!proclk->sclk_lookup) {
+#ifndef CONFIG_ACPI
+		of_clk_del_provider(dev->of_node);
+#endif
+		return -ENOMEM;
+	}
+
+	platform_set_drvdata(pdev, proclk);
 
 	return ret;
 }
 
 static int clk_hifiberry_dacpro_remove(struct platform_device *pdev)
 {
+	struct clk_hifiberry_hw *proclk = platform_get_drvdata(pdev);
+
+	clkdev_drop(proclk->sclk_lookup);
+
 #ifndef CONFIG_ACPI
 	of_clk_del_provider(pdev->dev.of_node);
 #endif
+
 	return 0;
 }
 
-- 
2.20.1

