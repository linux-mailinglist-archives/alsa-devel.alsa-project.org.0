Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40294A722C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 20:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAFF816A6;
	Tue,  3 Sep 2019 20:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAFF816A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567533778;
	bh=KCui7iIrZPbuIdy5wfueQF64z27HwN75F2F73kXSiFg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R8pzNUnK/yfnVkwBmAPEFp/4LhIBp95VRPG/RQsVcSzRsLAHs9XDiaqr366QB3HSJ
	 gUaJGsCPtA6T8hb/pyW+iJxYvxjmEPk/iOvncLUg/UFDPJ1flSxUAiRUgodryCLnHa
	 evnXCFaaYV9Gk1gwP7Z5RxCXImYVDOBUhLwVGkjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41F4DF80539;
	Tue,  3 Sep 2019 20:00:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2014BF8045F; Tue,  3 Sep 2019 20:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68C9DF80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 20:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68C9DF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mKZb8Shh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=CYvNu2cKcY4lT8gMAf5xfJU7mlv/HVixnNOL6VgZw80=; b=mKZb8ShhW/Wa
 XlRY0/tZDWa+xfy9DsdTnvQJOnOxBeIji1CC93FzPJLs8bx7Rivo/4/d3SpWyw5pASUVu3Zhmknbb
 Mh1llsTWcIKxdc6pvXuxJ5t6sSm+qjsCmpmovy+xM/HgK082gO6x9gO6+Ao/jwWQpMNHPy3NkZOGP
 P4irE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5D6J-0000zW-0C; Tue, 03 Sep 2019 18:00:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6118D2740A97; Tue,  3 Sep 2019 19:00:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
In-Reply-To: <20190903165322.20791-2-katsuhiro@katsuster.net>
X-Patchwork-Hint: ignore
Message-Id: <20190903180018.6118D2740A97@ypsilon.sirena.org.uk>
Date: Tue,  3 Sep 2019 19:00:18 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>
Subject: [alsa-devel] Applied "ASoC: es8316: add clock control of MCLK" to
	the asoc tree
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

   ASoC: es8316: add clock control of MCLK

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

From 6dd567dc964878c04269a44114ef13693712edf1 Mon Sep 17 00:00:00 2001
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Date: Wed, 4 Sep 2019 01:53:20 +0900
Subject: [PATCH] ASoC: es8316: add clock control of MCLK

This patch introduce clock property for MCLK master freq control.
Driver will set rate of MCLK master if set_sysclk is called and
changing sysclk by board driver.

[Modified slightly to apply without an earlier patch in the series due
to context diffs -- broonie]

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Link: https://lore.kernel.org/r/20190903165322.20791-2-katsuhiro@katsuster.net
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8316.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6db002cc2058..6248b01ca049 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
@@ -33,6 +34,7 @@ static const unsigned int supported_mclk_lrck_ratios[] = {
 
 struct es8316_priv {
 	struct mutex lock;
+	struct clk *mclk;
 	struct regmap *regmap;
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
@@ -360,7 +362,7 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
-	int i;
+	int i, ret;
 	int count = 0;
 
 	es8316->sysclk = freq;
@@ -368,6 +370,12 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	if (freq == 0)
 		return 0;
 
+	if (es8316->mclk) {
+		ret = clk_set_rate(es8316->mclk, freq);
+		if (ret)
+			return ret;
+	}
+
 	/* Limit supported sample rates to ones that can be autodetected
 	 * by the codec running in slave mode.
 	 */
@@ -697,9 +705,26 @@ static int es8316_set_jack(struct snd_soc_component *component,
 static int es8316_probe(struct snd_soc_component *component)
 {
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	es8316->component = component;
 
+	es8316->mclk = devm_clk_get(component->dev, "mclk");
+	if (PTR_ERR(es8316->mclk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (IS_ERR(es8316->mclk)) {
+		dev_err(component->dev, "clock is invalid, ignored\n");
+		es8316->mclk = NULL;
+	}
+
+	if (es8316->mclk) {
+		ret = clk_prepare_enable(es8316->mclk);
+		if (ret) {
+			dev_err(component->dev, "unable to enable clock\n");
+			return ret;
+		}
+	}
+
 	/* Reset codec and enable current state machine */
 	snd_soc_component_write(component, ES8316_RESET, 0x3f);
 	usleep_range(5000, 5500);
@@ -722,8 +747,17 @@ static int es8316_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static void es8316_remove(struct snd_soc_component *component)
+{
+	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
+
+	if (es8316->mclk)
+		clk_disable_unprepare(es8316->mclk);
+}
+
 static const struct snd_soc_component_driver soc_component_dev_es8316 = {
 	.probe			= es8316_probe,
+	.remove			= es8316_remove,
 	.set_jack		= es8316_set_jack,
 	.controls		= es8316_snd_controls,
 	.num_controls		= ARRAY_SIZE(es8316_snd_controls),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
