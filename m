Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754758BCE9
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Aug 2022 22:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8801E4;
	Sun,  7 Aug 2022 22:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8801E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659904098;
	bh=eQV24dpR5z0G7QiydmhHUmJjAFlxWuxBeJULNuViiTY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lXyzENf1VYew0JC0CQU7QbaA4JI0pzPjCdhnzhWXGQgF8oCtPAjCM5QM6GzCwCXXa
	 UwqIh8kxDPy3/KiGPCchpUa21iuZL6c2I+eFBiwplGxvqPlTNGEqO+yv1dhEICH77Z
	 7FkPXfD7Sy6M/MYHlO8nlkbNHPT7W6Ic2TT086RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB54F8025C;
	Sun,  7 Aug 2022 22:27:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83AE9F80237; Sun,  7 Aug 2022 22:27:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=KHOP_HELO_FCRDNS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30BCBF8012B
 for <alsa-devel@alsa-project.org>; Sun,  7 Aug 2022 22:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30BCBF8012B
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id KmrhoPxI5iBgAKmrhouJDR; Sun, 07 Aug 2022 22:27:15 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 07 Aug 2022 22:27:15 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Harsha Priya <harshapriya.n@intel.com>,
 "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>,
 Naveen M <naveen.m@intel.com>
Subject: [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927: Simplify clk_get()
 usage
Date: Sun,  7 Aug 2022 22:27:12 +0200
Message-Id: <b1b46138f2ce94431d7edd9becc3699159d3992c.1659904023.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brent Lu <brent.lu@intel.com>
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

If clk_get() returns -ENOENT, there is no need to defer the driver, -ENOENT
will be returned the same for each retries.
So, return the error code directly instead of -EPROBE_DEFER.

Remove this special case and use dev_err_probe() to simplify code. It will
also be less verbose if the clk is really deferred.

Fixes: 47cbea216281 ("ASoC: Intel: eve: Enable mclk and ssp sclk early")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This is based on my understanding of clk_get().
Review with care.

Not sure the Fixes tag is needed. The patch does not fix anything.
If devm_clk_get() returns -ENOENT, it will just loop several time until
the framework gives up.
If it returns -EPROBE_DEFER, this case is already handled by the
"return ret;"

So this patch should be a no-op, just a clean-up.
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 31 ++++---------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 2c79fca57b19..e23001ca2d04 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -798,7 +798,6 @@ static int kabylake_audio_probe(struct platform_device *pdev)
 {
 	struct kbl_codec_private *ctx;
 	struct snd_soc_acpi_mach *mach;
-	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -815,32 +814,14 @@ static int kabylake_audio_probe(struct platform_device *pdev)
 			&constraints_dmic_2ch : &constraints_dmic_channels;
 
 	ctx->mclk = devm_clk_get(&pdev->dev, "ssp1_mclk");
-	if (IS_ERR(ctx->mclk)) {
-		ret = PTR_ERR(ctx->mclk);
-		if (ret == -ENOENT) {
-			dev_info(&pdev->dev,
-				"Failed to get ssp1_mclk, defer probe\n");
-			return -EPROBE_DEFER;
-		}
-
-		dev_err(&pdev->dev, "Failed to get ssp1_mclk with err:%d\n",
-								ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->mclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ctx->mclk),
+				     "Failed to get ssp1_mclk\n");
 
 	ctx->sclk = devm_clk_get(&pdev->dev, "ssp1_sclk");
-	if (IS_ERR(ctx->sclk)) {
-		ret = PTR_ERR(ctx->sclk);
-		if (ret == -ENOENT) {
-			dev_info(&pdev->dev,
-				"Failed to get ssp1_sclk, defer probe\n");
-			return -EPROBE_DEFER;
-		}
-
-		dev_err(&pdev->dev, "Failed to get ssp1_sclk with err:%d\n",
-								ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->sclk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ctx->sclk),
+				     "Failed to get ssp1_sclk\n");
 
 	return devm_snd_soc_register_card(&pdev->dev, &kabylake_audio_card);
 }
-- 
2.34.1

