Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F71A3B09
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:02:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04F9D16A8;
	Thu,  9 Apr 2020 22:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04F9D16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462555;
	bh=7dITtawxOQ8lDm2BM6ueGRZrIKeFbKQlZxEGH3laDK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oGh5YabK+sLloQXRQtrs3eQ+mdjwL6bteIKW7x1GUSUMijAYZzXdLSR2rC+6W8slA
	 qsd4+/hvTVz++zsqeGBRL6OIccgaH5dmrbnuvlRtsI+WU1HOwPMYDdcXVwzXt4sm8K
	 GfZ2vQPLvGmZIs/Guh6oDA7yQNLXuhnz6WvCJMIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD74F80290;
	Thu,  9 Apr 2020 21:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00816F801DA; Thu,  9 Apr 2020 21:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E9FAF801D8
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E9FAF801D8
IronPort-SDR: 9e/yRdcSKWEUSUAiGHpJyq+uf1M6BFmpKdGiswWQ1GkwMxLk+NnOjPjA/QvrnwH90d4J9tZ2nU
 LiraKzc+kcwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:03 -0700
IronPort-SDR: 8K+mXrYK+GvQ/LMwBFGYlin/OhB/dVt/tdyXM/fxSWBSnq/Iwf5qKATIxeFzDNpBM/XXA3O31D
 78K+hfWiC/Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745301"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve clock
Date: Thu,  9 Apr 2020 14:58:27 -0500
Message-Id: <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
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

Using devm_clk_get() with a NULL string fails on ACPI platforms, use
the "sclk" string as a fallback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/pcm512x.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 4f895a588c31..1df291b84925 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1603,6 +1603,7 @@ static const struct gpio_chip template_chip = {
 
 int pcm512x_probe(struct device *dev, struct regmap *regmap)
 {
+	const char * const clk_name[] = {NULL, "sclk"};
 	struct pcm512x_priv *pcm512x;
 	int i, ret;
 
@@ -1671,17 +1672,28 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 		goto err;
 	}
 
-	pcm512x->sclk = devm_clk_get(dev, NULL);
-	if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER) {
-		ret = -EPROBE_DEFER;
-		goto err;
-	}
-	if (!IS_ERR(pcm512x->sclk)) {
-		ret = clk_prepare_enable(pcm512x->sclk);
-		if (ret != 0) {
-			dev_err(dev, "Failed to enable SCLK: %d\n", ret);
+	for (i = 0; i < ARRAY_SIZE(clk_name); i++) {
+		pcm512x->sclk = devm_clk_get(dev, clk_name[i]);
+		if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER) {
+			ret = -EPROBE_DEFER;
 			goto err;
 		}
+		if (!IS_ERR(pcm512x->sclk)) {
+			dev_dbg(dev, "SCLK detected by devm_clk_get\n");
+			ret = clk_prepare_enable(pcm512x->sclk);
+			if (ret != 0) {
+				dev_err(dev, "Failed to enable SCLK: %d\n",
+					ret);
+				goto err;
+			}
+			break;
+		}
+
+		if (!clk_name[i])
+			dev_dbg(dev, "no SCLK detected with NULL string\n");
+		else
+			dev_dbg(dev, "no SCLK detected for %s string\n",
+				clk_name[i]);
 	}
 
 	/* Default to standby mode */
-- 
2.20.1

