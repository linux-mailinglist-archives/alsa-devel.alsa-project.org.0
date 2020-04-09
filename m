Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3C1A3B1D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6501D16BC;
	Thu,  9 Apr 2020 22:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6501D16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462867;
	bh=9NYBbzvX8+A6Wsc+qrOddNJyYMdCwgevxtUFDkQXyzo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sOrFS44Cp7sjFxB3Cyp9krEyF7z2k6eSgxaQjlph0jDdO89fkwMdhijEj8qEQYIca
	 MwXoRisSC9VsT69UOWmtph5PDNX2BaDsRkac8tiR1QBYSyc8EtFdiLCS+VOTu77z5L
	 9W3kbsmMjL/wUCFPMrcEfXHUhXkjGzJxhq3P0j5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11065F80316;
	Thu,  9 Apr 2020 21:59:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1E4F802E7; Thu,  9 Apr 2020 21:59:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CC1AF802E1
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CC1AF802E1
IronPort-SDR: /eFbRDcDYK3v20JuGFVeaOVA89rhfzSS+vJ0WAAQmypuwhXxj3s7hzaRb4jgN0rKfrcuRANCwn
 p/iJwwQpOasg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:23 -0700
IronPort-SDR: b2ecK7vShH+XHBN68K5eq38Q6xB/ZlfLdSj2GUn3HZlQw8hQy1ZNu+k3yBPgEiJzy7cqkICB4R
 spWMQDt8Afnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745389"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 12/16] clk: hifiberry-dacpro: add ACPI support
Date: Thu,  9 Apr 2020 14:58:37 -0500
Message-Id: <20200409195841.18901-13-pierre-louis.bossart@linux.intel.com>
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

On ACPI platforms the of_ functions are irrelevant, conditionally
compile them out and add devm_clk_hw_register_clkdev() call instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index bf0616c959da..d01a90fed51b 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -114,15 +114,22 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+#ifndef CONFIG_ACPI
 	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
 				     &proclk->hw);
+#else
+	ret = devm_clk_hw_register_clkdev(dev, &proclk->hw,
+					  init.name, NULL);
+#endif
 
 	return ret;
 }
 
 static int clk_hifiberry_dacpro_remove(struct platform_device *pdev)
 {
+#ifndef CONFIG_ACPI
 	of_clk_del_provider(pdev->dev.of_node);
+#endif
 	return 0;
 }
 
-- 
2.20.1

