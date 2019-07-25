Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBBB75606
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24DAC1F0B;
	Thu, 25 Jul 2019 19:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24DAC1F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564076778;
	bh=G3g2WvWf7krf9VL+s28Nv72Umua+xwHUq5OumB5BQws=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Nzi7TYgu3P1H+P22WHkNdDUfkd/TjNZesqTllBaPQrAHbjTf75jJCj+L2Ox+vs646
	 lKjTpGAT07ggi4gB9y/TuIH1qVm3TS7t2TpgHvkP9aY0nA+a9z/cMXQlnOWEyK4gFC
	 Zk/7pXBgkC13/6w4V4Kp5w5r4c4BbVThdEhYPmj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7A97F80392;
	Thu, 25 Jul 2019 19:43:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C03F8044C; Thu, 25 Jul 2019 19:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97BD5F803D0
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 19:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BD5F803D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Gfuoe5Q+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IF+bdjY/1XlbU1xMmM6rdgZvvdiKSmc5wCsvU4ic3WU=; b=Gfuoe5Q+Q9tM
 jawpuaqsMgYHnGnr4wWkbg0vUQRgiCZJ0H6iNmIotxaK2wMZcA60q7NLlBP9cKLub1esd3UtDCP5/
 BWxN/sClsoMk8Di4OPYsC7rljQfY2U799+IWmTE/nxf8hBkMKw22qPHQ7S4waithSw3skbptSM9um
 /K9qA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqhmH-0003NP-E1; Thu, 25 Jul 2019 17:43:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C7EC92742BAE; Thu, 25 Jul 2019 18:43:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20190725163931.24964-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Message-Id: <20190725174340.C7EC92742BAE@ypsilon.sirena.org.uk>
Date: Thu, 25 Jul 2019 18:43:40 +0100 (BST)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: wm_adsp: Allow bus error handler to be
	called directly" to the asoc tree
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

   ASoC: wm_adsp: Allow bus error handler to be called directly

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 01ec57a4371e573bfcfa898307af098a8c6f9dcf Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Thu, 25 Jul 2019 17:39:29 +0100
Subject: [PATCH] ASoC: wm_adsp: Allow bus error handler to be called directly

There is no need for end drivers to add helper functions to allow the
bus error handler to be called, simply update the prototype so it can be
called directly.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20190725163931.24964-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs47l90.c | 9 +--------
 sound/soc/codecs/wm_adsp.c | 6 ++++--
 sound/soc/codecs/wm_adsp.h | 4 ++--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index c4ecb0e6911a..67cac60a859d 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2402,13 +2402,6 @@ static irqreturn_t cs47l90_adsp2_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t cs47l90_dsp_bus_error(int irq, void *data)
-{
-	struct wm_adsp *dsp = (struct wm_adsp *)data;
-
-	return wm_adsp2_bus_error(dsp);
-}
-
 static int cs47l90_component_probe(struct snd_soc_component *component)
 {
 	struct cs47l90 *cs47l90 = snd_soc_component_get_drvdata(component);
@@ -2558,7 +2551,7 @@ static int cs47l90_probe(struct platform_device *pdev)
 
 		if (ret == 0) {
 			ret = madera_init_bus_error_irq(&cs47l90->core, i,
-							cs47l90_dsp_bus_error);
+							wm_adsp2_bus_error);
 			if (ret != 0)
 				wm_adsp2_remove(&cs47l90->core.adsp[i]);
 		}
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index f5fbadc5e7e2..ae28d9907c30 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -4242,8 +4242,9 @@ static void wm_adsp_fatal_error(struct wm_adsp *dsp)
 	}
 }
 
-irqreturn_t wm_adsp2_bus_error(struct wm_adsp *dsp)
+irqreturn_t wm_adsp2_bus_error(int irq, void *data)
 {
+	struct wm_adsp *dsp = (struct wm_adsp *)data;
 	unsigned int val;
 	struct regmap *regmap = dsp->regmap;
 	int ret = 0;
@@ -4307,8 +4308,9 @@ irqreturn_t wm_adsp2_bus_error(struct wm_adsp *dsp)
 }
 EXPORT_SYMBOL_GPL(wm_adsp2_bus_error);
 
-irqreturn_t wm_halo_bus_error(struct wm_adsp *dsp)
+irqreturn_t wm_halo_bus_error(int irq, void *data)
 {
+	struct wm_adsp *dsp = (struct wm_adsp *)data;
 	struct regmap *regmap = dsp->regmap;
 	unsigned int fault[6];
 	struct reg_sequence clear[] = {
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 3b03d1eb986f..aa634ef6c9f5 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -171,8 +171,8 @@ int wm_adsp1_event(struct snd_soc_dapm_widget *w,
 int wm_adsp_early_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event);
 
-irqreturn_t wm_adsp2_bus_error(struct wm_adsp *adsp);
-irqreturn_t wm_halo_bus_error(struct wm_adsp *dsp);
+irqreturn_t wm_adsp2_bus_error(int irq, void *data);
+irqreturn_t wm_halo_bus_error(int irq, void *data);
 irqreturn_t wm_halo_wdt_expire(int irq, void *data);
 
 int wm_adsp_event(struct snd_soc_dapm_widget *w,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
