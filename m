Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A7C3392
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 335B11678;
	Tue,  1 Oct 2019 13:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 335B11678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931187;
	bh=J5HkFmAuy4wpOwtH7r0JTaO9HbJVGzIsKk3EtMSMWSQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Fc6dg/bW3zUdYgoEN+LlpphdFB4KQikB9ek17gwUQNytT3+7O7SF38BCjtwocPZhn
	 Ne3cWWX2f3yfh/uOXLwAi/bmrqqVvX7eKOF/haMjZ0N+kuBjmdRr155AxyDT4+rUS6
	 QFyt3PiZ0ac6X5Mc5WlaIRaotfT4t1qKZZs9PSpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AE60F80C08;
	Tue,  1 Oct 2019 13:41:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 477A1F8070B; Tue,  1 Oct 2019 13:41:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E803AF804FF
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E803AF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uba1xh6I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=wF9PhMGH+Lj8JE4h4I6EzLCX3sM3u3HxgVYZ38hhRes=; b=uba1xh6IxCh3
 mNCRfDNXG4p3kkva09171A1GXfohYxq+9sSRvGfn+542pH8dR2h9H0hjiJN07JU0+1aK/H5eihoAh
 aFQ7plk/mdhJk498J3sKpffCyYW0lx1XBGMIoyJHDoSSZWj7xhdl5tQuE+Chw1kHVHSnMhh6GO9Yj
 sXO4s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWR-0004Ur-Ew; Tue, 01 Oct 2019 11:40:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DE1BD2742A30; Tue,  1 Oct 2019 12:40:50 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20190920130218.32690-4-s.nawrocki@samsung.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114050.DE1BD2742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:50 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
 b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, Krzysztof Kozlowski <krzk@kernel.org>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Subject: [alsa-devel] Applied "ASoC: wm8994: Add support for setting MCLK
	clock rate" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: wm8994: Add support for setting MCLK clock rate

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 419e2f50833661cec15200d5ee7385daee733667 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Fri, 20 Sep 2019 15:02:12 +0200
Subject: [PATCH] ASoC: wm8994: Add support for setting MCLK clock rate

Extend the set_sysclk() handler so we also set frequency of the MCLK1,
MCLK2 clocks through clk API when those clocks are specified in DT.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Link: https://lore.kernel.org/r/20190920130218.32690-4-s.nawrocki@samsung.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8994.c | 48 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/wm8994.h | 10 +++++++-
 2 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index c3d06e8bc54f..35fbaa0138bf 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -167,12 +167,12 @@ static int configure_aif_clock(struct snd_soc_component *component, int aif)
 
 	switch (wm8994->sysclk[aif]) {
 	case WM8994_SYSCLK_MCLK1:
-		rate = wm8994->mclk[0];
+		rate = wm8994->mclk_rate[0];
 		break;
 
 	case WM8994_SYSCLK_MCLK2:
 		reg1 |= 0x8;
-		rate = wm8994->mclk[1];
+		rate = wm8994->mclk_rate[1];
 		break;
 
 	case WM8994_SYSCLK_FLL1:
@@ -2367,12 +2367,29 @@ static int wm8994_set_fll(struct snd_soc_dai *dai, int id, int src,
 	return _wm8994_set_fll(dai->component, id, src, freq_in, freq_out);
 }
 
+static int wm8994_set_mclk_rate(struct wm8994_priv *wm8994, unsigned int id,
+				unsigned int *freq)
+{
+	int ret;
+
+	if (!wm8994->mclk[id].clk || *freq == wm8994->mclk_rate[id])
+		return 0;
+
+	ret = clk_set_rate(wm8994->mclk[id].clk, *freq);
+	if (ret < 0)
+		return ret;
+
+	*freq = clk_get_rate(wm8994->mclk[id].clk);
+
+	return 0;
+}
+
 static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 		int clk_id, unsigned int freq, int dir)
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
-	int i;
+	int ret, i;
 
 	switch (dai->id) {
 	case 1:
@@ -2387,7 +2404,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	switch (clk_id) {
 	case WM8994_SYSCLK_MCLK1:
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK1;
-		wm8994->mclk[0] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[0] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK1 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -2395,7 +2417,12 @@ static int wm8994_set_dai_sysclk(struct snd_soc_dai *dai,
 	case WM8994_SYSCLK_MCLK2:
 		/* TODO: Set GPIO AF */
 		wm8994->sysclk[dai->id - 1] = WM8994_SYSCLK_MCLK2;
-		wm8994->mclk[1] = freq;
+
+		ret = wm8994_set_mclk_rate(wm8994, dai->id - 1, &freq);
+		if (ret < 0)
+			return ret;
+
+		wm8994->mclk_rate[1] = freq;
 		dev_dbg(dai->dev, "AIF%d using MCLK2 at %uHz\n",
 			dai->id, freq);
 		break;
@@ -4447,6 +4474,7 @@ static const struct snd_soc_component_driver soc_component_dev_wm8994 = {
 static int wm8994_probe(struct platform_device *pdev)
 {
 	struct wm8994_priv *wm8994;
+	int ret;
 
 	wm8994 = devm_kzalloc(&pdev->dev, sizeof(struct wm8994_priv),
 			      GFP_KERNEL);
@@ -4458,6 +4486,16 @@ static int wm8994_probe(struct platform_device *pdev)
 
 	wm8994->wm8994 = dev_get_drvdata(pdev->dev.parent);
 
+	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
+	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
+
+	ret = devm_clk_bulk_get_optional(pdev->dev.parent, ARRAY_SIZE(wm8994->mclk),
+					 wm8994->mclk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get clocks: %d\n", ret);
+		return ret;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_idle(&pdev->dev);
 
diff --git a/sound/soc/codecs/wm8994.h b/sound/soc/codecs/wm8994.h
index 1d6f2abe1c11..41c4b126114d 100644
--- a/sound/soc/codecs/wm8994.h
+++ b/sound/soc/codecs/wm8994.h
@@ -6,6 +6,7 @@
 #ifndef _WM8994_H
 #define _WM8994_H
 
+#include <linux/clk.h>
 #include <sound/soc.h>
 #include <linux/firmware.h>
 #include <linux/completion.h>
@@ -14,6 +15,12 @@
 
 #include "wm_hubs.h"
 
+enum {
+	WM8994_MCLK1,
+	WM8994_MCLK2,
+	WM8994_NUM_MCLK
+};
+
 /* Sources for AIF1/2 SYSCLK - use with set_dai_sysclk() */
 #define WM8994_SYSCLK_MCLK1 1
 #define WM8994_SYSCLK_MCLK2 2
@@ -73,9 +80,10 @@ struct wm8994;
 struct wm8994_priv {
 	struct wm_hubs_data hubs;
 	struct wm8994 *wm8994;
+	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
 	int sysclk[2];
 	int sysclk_rate[2];
-	int mclk[2];
+	int mclk_rate[2];
 	int aifclk[2];
 	int aifdiv[2];
 	int channels[2];
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
