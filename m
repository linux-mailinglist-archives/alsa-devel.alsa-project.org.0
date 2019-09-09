Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAAAD70C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B73D1671;
	Mon,  9 Sep 2019 12:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B73D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568025695;
	bh=IfxAcbq6sBjKwDrIlFHrXMzQsbuxpgNyiA4RHs+lzIA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XcWtNxH0ZzealGtpOiYMPrf8eqlJV4YI1hyUfs8hvVg97X49gB2O6EZXBGxv2xdE4
	 L/Z3TAw8/0g7m1RVXyO9Y7+tr/j217D+LNC73jPVH29ZEJOVwnxu3XShSNU2XZeE9W
	 DOQBx3kn0ZzXWi6tvXVZPtWlyKAnZWwG+AwOOsAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07994F8064C;
	Mon,  9 Sep 2019 12:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97FA3F805FB; Mon,  9 Sep 2019 12:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F3D1F805F7
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F3D1F805F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pA8kSDy1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7tQBabzGFNgFSknyRXUtCVROlUph9aJGvnMwb+EnPnQ=; b=pA8kSDy1/A6k
 I8FOL+n00KRf7avC/6XYSNm6JEd4M9cG/aul4uSgmNC+jXx5lBWMC/tioDVjCPLn9IeYGKPJ+ChCw
 R1TYm1K4hVM6uGDlk7K83tbuzrz5xLkfKJw+tBpnovkeGBTWOOMo4pY2DlQcxh2o7fsqgd0kPpgKL
 +QS4s=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZq-0001sD-1Q; Mon, 09 Sep 2019 10:07:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6A853D02D59; Mon,  9 Sep 2019 11:07:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
In-Reply-To: <20190907163653.9382-1-katsuhiro@katsuster.net>
X-Patchwork-Hint: ignore
Message-Id: <20190909100717.6A853D02D59@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:17 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>
Subject: [alsa-devel] Applied "ASoC: es8316: fix redundant codes of clock"
	to the asoc tree
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

   ASoC: es8316: fix redundant codes of clock

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

From 0db0c62c88b84b135bbaf784499a08e536354a43 Mon Sep 17 00:00:00 2001
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Date: Sun, 8 Sep 2019 01:36:52 +0900
Subject: [PATCH] ASoC: es8316: fix redundant codes of clock

This patch removes redundant null checks for optional MCLK clock.
And fix DT binding document for changing clock property to optional
from required.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Link: https://lore.kernel.org/r/20190907163653.9382-1-katsuhiro@katsuster.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../bindings/sound/everest,es8316.txt         |  3 ++
 sound/soc/codecs/es8316.c                     | 31 ++++++++-----------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.txt b/Documentation/devicetree/bindings/sound/everest,es8316.txt
index aefcff9c48a2..1bf03c5f2af4 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.txt
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.txt
@@ -6,6 +6,9 @@ Required properties:
 
   - compatible  : should be "everest,es8316"
   - reg : the I2C address of the device for I2C
+
+Optional properties:
+
   - clocks : a list of phandle, should contain entries for clock-names
   - clock-names : should include as follows:
          "mclk" : master clock (MCLK) of the device
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6248b01ca049..e9fa4981ccef 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -370,11 +370,9 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	if (freq == 0)
 		return 0;
 
-	if (es8316->mclk) {
-		ret = clk_set_rate(es8316->mclk, freq);
-		if (ret)
-			return ret;
-	}
+	ret = clk_set_rate(es8316->mclk, freq);
+	if (ret)
+		return ret;
 
 	/* Limit supported sample rates to ones that can be autodetected
 	 * by the codec running in slave mode.
@@ -709,20 +707,18 @@ static int es8316_probe(struct snd_soc_component *component)
 
 	es8316->component = component;
 
-	es8316->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(es8316->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	es8316->mclk = devm_clk_get_optional(component->dev, "mclk");
 	if (IS_ERR(es8316->mclk)) {
-		dev_err(component->dev, "clock is invalid, ignored\n");
-		es8316->mclk = NULL;
+		dev_err(component->dev, "unable to get mclk\n");
+		return PTR_ERR(es8316->mclk);
 	}
+	if (!es8316->mclk)
+		dev_warn(component->dev, "assuming static mclk\n");
 
-	if (es8316->mclk) {
-		ret = clk_prepare_enable(es8316->mclk);
-		if (ret) {
-			dev_err(component->dev, "unable to enable clock\n");
-			return ret;
-		}
+	ret = clk_prepare_enable(es8316->mclk);
+	if (ret) {
+		dev_err(component->dev, "unable to enable mclk\n");
+		return ret;
 	}
 
 	/* Reset codec and enable current state machine */
@@ -751,8 +747,7 @@ static void es8316_remove(struct snd_soc_component *component)
 {
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
 
-	if (es8316->mclk)
-		clk_disable_unprepare(es8316->mclk);
+	clk_disable_unprepare(es8316->mclk);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_es8316 = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
