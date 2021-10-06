Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4ED424374
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:55:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39336846;
	Wed,  6 Oct 2021 18:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39336846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633539331;
	bh=AruGNKN3/ogLVj/qf1UyWp5Do98EAyA+4RPqkBmNBxA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3d+iGegxJjQVlDCSHvjQFQIeX1YG6e1jGwn6/+zM7IvFwzlBHKHGA3g8OZSGrZeG
	 RkR3ULal8ChpDSg4vOz9Vp1tEqY5Gfm7xDrwLLLC3Bacw13FHTCM2BhyyDLIdytSSO
	 jwb2Nk9CoHNf6kKPvIWZX+0O00uHTUTLj/oHjzcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20336F8025C;
	Wed,  6 Oct 2021 18:54:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D131F8020D; Wed,  6 Oct 2021 18:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCDBCF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCDBCF8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="213168963"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="213168963"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="713011705"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 06 Oct 2021 09:52:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6E15D299; Wed,  6 Oct 2021 19:52:30 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ASoC: Intel: bytcht_es8316: Utilize dev_err_probe() to
 avoid log saturation
Date: Wed,  6 Oct 2021 19:52:28 +0300
Message-Id: <20211006165228.1692-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006165228.1692-1-andriy.shevchenko@linux.intel.com>
References: <20211006165228.1692-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

dev_err_probe() avoids printing into log when the deferred probe is invoked.
This is possible when clock provider is pending to appear.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Pierre-Louis Bossart <pierre-louis.bossart@linux.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index d8dcf63825a6..9d86fea51a7d 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -532,11 +532,8 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 
 	/* get the clock */
 	priv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
-	if (IS_ERR(priv->mclk)) {
-		ret = PTR_ERR(priv->mclk);
-		dev_err(dev, "clk_get pmc_plt_clk_3 failed: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->mclk))
+		return dev_err_probe(dev, PTR_ERR(priv->mclk), "clk_get pmc_plt_clk_3 failed\n");
 
 	/* get speaker enable GPIO */
 	codec_dev = acpi_get_first_physical_node(adev);
@@ -570,14 +567,9 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 				   /* see comment in byt_cht_es8316_resume() */
 				   GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(priv->speaker_en_gpio)) {
-		ret = PTR_ERR(priv->speaker_en_gpio);
-		switch (ret) {
-		default:
-			dev_err(dev, "get speaker GPIO failed: %d\n", ret);
-			fallthrough;
-		case -EPROBE_DEFER:
-			goto err_put_codec;
-		}
+		ret = dev_err_probe(dev, PTR_ERR(priv->speaker_en_gpio),
+				    "get speaker GPIO failed\n");
+		goto err_put_codec;
 	}
 
 	snprintf(components_string, sizeof(components_string),
-- 
2.33.0

