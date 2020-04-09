Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB91A3B29
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F427168F;
	Thu,  9 Apr 2020 22:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F427168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462967;
	bh=ZwWPLCM0Mupn2Ybf8DTCrjFjIYycptJ1wW5y06bh9ic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BXrvhNUbXe+gbsQt5utWExMyWnnsGAVNpyFF858IMY9XihIBW714B16NV3fzzd/R0
	 UeOGI3aNw3K8cIaMElNUGKX8TU4pAx5CFcDej5PHlyG1C51WS/sz1lVAD6jUQRI6ta
	 c3Lyan6qo5UzHET8JyAXxpay3fB4JmDxuTO+2mH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22036F80336;
	Thu,  9 Apr 2020 21:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B0B6F80332; Thu,  9 Apr 2020 21:59:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ADEDF8032A
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ADEDF8032A
IronPort-SDR: IipMVUpUzc/NCnEZkSDS3+ftwFzPq1D737j3s+i2PhIXXeYZBchzmd1LzMp4o+raDXBEsXnMIz
 KqBCR5sHHZWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:29 -0700
IronPort-SDR: kl8qEAxVlGenLQdfxE4JQ+rivjtPX5k5bWjuJ7HOQFjf5cPo1BMBH4uZFpiwGAqHxdeW8QKpoi
 jnASgac0PMng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745417"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 15/16] clk: hifiberry-dacpro: add delay on clock
 prepare/deprepare
Date: Thu,  9 Apr 2020 14:58:40 -0500
Message-Id: <20200409195841.18901-16-pierre-louis.bossart@linux.intel.com>
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

Add a delay to make sure the PCM512x codec can detect SCLK presence.

The initial code from the Raspberry tree used msleep(2), which can be
up to 20ms. A delay of 5-10ms seems fine in practice.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index f1f5af260083..2907b203fcf2 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/kernel.h>
@@ -145,6 +146,8 @@ static int clk_hifiberry_dacpro_prepare(struct clk_hw *hw)
 	default:
 		return -EINVAL;
 	}
+	/* wait for SCLK update to be detected by PCM512x codec */
+	usleep_range(5000, 10000);
 
 	clk->prepared = 1;
 
@@ -168,6 +171,8 @@ static void clk_hifiberry_dacpro_unprepare(struct clk_hw *hw)
 	default:
 		return;
 	}
+	/* wait for SCLK update to be detected by PCM512x codec */
+	usleep_range(5000, 10000);
 
 	clk->prepared = false;
 }
-- 
2.20.1

