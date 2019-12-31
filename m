Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130612D553
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Dec 2019 01:34:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF2416EB;
	Tue, 31 Dec 2019 01:34:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF2416EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577752497;
	bh=chXqbBDAF6mxX7MM9on5M6sQe8R1D64mW6NAvfoRS0s=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gNeOCWtm7e6bYLFqRENgYeeumf+zYK/CiMJgD8AduO46dIEiBSUcT/5iTNDRnt7xN
	 kjgDFBq4jAYg9TFyBABtiDweZY6laY6/f4VaUkRWSJKeJY7Hb56rdcg6V1Xoo9roqH
	 3EUEqhM6CYWHAl3YnULTWzBsCRpgHnGlt4EoJbmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A1CF8027D;
	Tue, 31 Dec 2019 01:30:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24AB5F80271; Tue, 31 Dec 2019 01:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9581F8015E
 for <alsa-devel@alsa-project.org>; Tue, 31 Dec 2019 01:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9581F8015E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sMCtZM+P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SOuH1cr4SVCIEgXZvOn+X7YbRkDR81aUuFxV70hPKZE=; b=sMCtZM+PbU5C
 +J03hTvMLxBnR8rzm0nylasCwtycSY3Njotdl/uRrs3AqjT88HqyLja9ocpFWo7ZC79uAO5tWaxK6
 hPyPGAXPDMTiu4xKLnG8spjhHWnsp6X5L84jAeijub5GG1OHXpJG3bXPw5LZbJ478JiLuFq7u+Tfd
 5gHOg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1im5Qg-0002nn-Mp; Tue, 31 Dec 2019 00:30:34 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 40650D01A54; Tue, 31 Dec 2019 00:30:34 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20191230143517.21005-1-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20191230143517.21005-1-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Date: Tue, 31 Dec 2019 00:30:34 +0000 (GMT)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: madera: Enable clocks for input pins
	when used as a direct clock" to the asoc tree
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

   ASoC: madera: Enable clocks for input pins when used as a direct clock

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 1094af1199007976370b8f04b4d6668ad9707954 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 30 Dec 2019 14:35:16 +0000
Subject: [PATCH] ASoC: madera: Enable clocks for input pins when used as a
 direct clock

When one of the MCLK pins is used to supply an internal clock directly
enable the source clock for that pin.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20191230143517.21005-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs47l15.c |  8 ++++--
 sound/soc/codecs/cs47l35.c |  6 ++--
 sound/soc/codecs/cs47l85.c | 11 +++++---
 sound/soc/codecs/cs47l90.c | 11 +++++---
 sound/soc/codecs/cs47l92.c | 58 ++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/madera.c  | 53 ++++++++++++++++++++++++++++++++--
 sound/soc/codecs/madera.h  |  2 ++
 7 files changed, 129 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index ece1276f38eb..513e2875e4c6 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -438,11 +438,13 @@ static const struct snd_kcontrol_new cs47l15_aec_loopback_mux[] = {
 static const struct snd_soc_dapm_widget cs47l15_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD1", 20, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("MICVDD", 0, SND_SOC_DAPM_REGULATOR_BYPASS),
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index d396a8545d51..ba7aa6b31205 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -521,11 +521,13 @@ static const struct snd_kcontrol_new cs47l35_aec_loopback_mux[] = {
 static const struct snd_soc_dapm_widget cs47l35_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
-		    0, NULL, 0),
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD2", 0, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD1", 20, 0),
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 32fe7ffb7526..f85581a97bdc 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -790,15 +790,18 @@ static const struct snd_kcontrol_new cs47l85_output_anc_src[] = {
 static const struct snd_soc_dapm_widget cs47l85_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("ASYNCCLK", MADERA_ASYNC_CLOCK_1,
-		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, NULL, 0),
+		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("ASYNCOPCLK", MADERA_OUTPUT_ASYNC_CLOCK,
 		    MADERA_OPCLK_ASYNC_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD2", 0, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD3", 0, 0),
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 67cac60a859d..c3b6f4d41005 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -744,15 +744,18 @@ static const struct snd_kcontrol_new cs47l90_output_anc_src[] = {
 static const struct snd_soc_dapm_widget cs47l90_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("ASYNCCLK", MADERA_ASYNC_CLOCK_1,
-		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, NULL, 0),
+		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("ASYNCOPCLK", MADERA_OUTPUT_ASYNC_CLOCK,
 		    MADERA_OPCLK_ASYNC_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD2", 0, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("DBVDD3", 0, 0),
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 536b7d35d6b2..cbffcd84766d 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -163,6 +163,51 @@ static int cs47l92_adsp_power_ev(struct snd_soc_dapm_widget *w,
 	return wm_adsp_early_event(w, kcontrol, event);
 }
 
+static int cs47l92_outclk_ev(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
+	struct madera_priv *priv = &cs47l92->core;
+	struct madera *madera = priv->madera;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(madera->regmap, MADERA_OUTPUT_RATE_1, &val);
+	if (ret) {
+		dev_err(madera->dev, "Failed to read OUTCLK source: %d\n", ret);
+		return ret;
+	}
+
+	val &= MADERA_OUT_CLK_SRC_MASK;
+
+	switch (val) {
+	case MADERA_OUTCLK_MCLK1:
+	case MADERA_OUTCLK_MCLK2:
+	case MADERA_OUTCLK_MCLK3:
+		val -= (MADERA_OUTCLK_MCLK1 - MADERA_MCLK1);
+
+		switch (event) {
+		case SND_SOC_DAPM_PRE_PMU:
+			ret = clk_prepare_enable(madera->mclk[val].clk);
+			if (ret)
+				return ret;
+			break;
+		case SND_SOC_DAPM_POST_PMD:
+			clk_disable_unprepare(madera->mclk[val].clk);
+			break;
+		default:
+			break;
+		}
+	default:
+		break;
+	}
+
+	return madera_domain_clk_ev(w, kcontrol, event);
+}
+
 #define CS47L92_NG_SRC(name, base) \
 	SOC_SINGLE(name " NG HPOUT1L Switch",  base,  0, 1, 0), \
 	SOC_SINGLE(name " NG HPOUT1R Switch",  base,  1, 1, 0), \
@@ -615,15 +660,18 @@ static const struct snd_kcontrol_new cs47l92_aec_loopback_mux =
 static const struct snd_soc_dapm_widget cs47l92_dapm_widgets[] = {
 SND_SOC_DAPM_SUPPLY("SYSCLK", MADERA_SYSTEM_CLOCK_1, MADERA_SYSCLK_ENA_SHIFT,
 		    0, madera_sysclk_ev,
-		    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("ASYNCCLK", MADERA_ASYNC_CLOCK_1,
-		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, NULL, 0),
+		    MADERA_ASYNC_CLK_ENA_SHIFT, 0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OPCLK", MADERA_OUTPUT_SYSTEM_CLOCK,
 		    MADERA_OPCLK_ENA_SHIFT, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("ASYNCOPCLK", MADERA_OUTPUT_ASYNC_CLOCK,
 		    MADERA_OPCLK_ASYNC_ENA_SHIFT, 0, NULL, 0),
-SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1,
-		    MADERA_DSP_CLK_ENA_SHIFT, 0, NULL, 0),
+SND_SOC_DAPM_SUPPLY("DSPCLK", MADERA_DSP_CLOCK_1, MADERA_DSP_CLK_ENA_SHIFT,
+		    0, madera_clk_ev,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD1", 20, 0),
 SND_SOC_DAPM_REGULATOR_SUPPLY("CPVDD2", 20, 0),
@@ -666,7 +714,7 @@ SND_SOC_DAPM_SUPPLY("ISRC2CLK", SND_SOC_NOPM,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("OUTCLK", SND_SOC_NOPM,
 		    MADERA_DOM_GRP_OUT, 0,
-		    madera_domain_clk_ev,
+		    cs47l92_outclk_ev,
 		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_SUPPLY("SPDCLK", SND_SOC_NOPM,
 		    MADERA_DOM_GRP_SPD, 0,
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 52639811cc52..9b4b4c52b9e4 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -163,6 +163,48 @@ static const int madera_dsp_bus_error_irqs[MADERA_MAX_ADSP] = {
 	MADERA_IRQ_DSP7_BUS_ERR,
 };
 
+int madera_clk_ev(struct snd_soc_dapm_widget *w,
+		  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
+	struct madera *madera = priv->madera;
+	unsigned int val;
+	int clk_idx;
+	int ret;
+
+	ret = regmap_read(madera->regmap, w->reg, &val);
+	if (ret) {
+		dev_err(madera->dev, "Failed to check clock source: %d\n", ret);
+		return ret;
+	}
+
+	switch ((val & MADERA_SYSCLK_SRC_MASK) >> MADERA_SYSCLK_SRC_SHIFT) {
+	case MADERA_CLK_SRC_MCLK1:
+		clk_idx = MADERA_MCLK1;
+		break;
+	case MADERA_CLK_SRC_MCLK2:
+		clk_idx = MADERA_MCLK2;
+		break;
+	case MADERA_CLK_SRC_MCLK3:
+		clk_idx = MADERA_MCLK3;
+		break;
+	default:
+		return 0;
+	}
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return clk_prepare_enable(madera->mclk[clk_idx].clk);
+	case SND_SOC_DAPM_POST_PMD:
+		clk_disable_unprepare(madera->mclk[clk_idx].clk);
+		return 0;
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL_GPL(madera_clk_ev);
+
 static void madera_spin_sysclk(struct madera_priv *priv)
 {
 	struct madera *madera = priv->madera;
@@ -193,9 +235,16 @@ int madera_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct madera_priv *priv = snd_soc_component_get_drvdata(component);
 
-	madera_spin_sysclk(priv);
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+	case SND_SOC_DAPM_PRE_PMD:
+		madera_spin_sysclk(priv);
+		break;
+	default:
+		break;
+	}
 
-	return 0;
+	return madera_clk_ev(w, kcontrol, event);
 }
 EXPORT_SYMBOL_GPL(madera_sysclk_ev);
 
diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index 6d8938a3fb64..49a8f68ec43d 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -383,6 +383,8 @@ int madera_eq_coeff_put(struct snd_kcontrol *kcontrol,
 int madera_lhpf_coeff_put(struct snd_kcontrol *kcontrol,
 			  struct snd_ctl_elem_value *ucontrol);
 
+int madera_clk_ev(struct snd_soc_dapm_widget *w,
+		  struct snd_kcontrol *kcontrol, int event);
 int madera_sysclk_ev(struct snd_soc_dapm_widget *w,
 		     struct snd_kcontrol *kcontrol, int event);
 int madera_spk_ev(struct snd_soc_dapm_widget *w,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
