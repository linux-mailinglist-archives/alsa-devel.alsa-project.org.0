Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A4140E5C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 16:55:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952F1178A;
	Fri, 17 Jan 2020 16:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952F1178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579276504;
	bh=p/eNqm6/HhddMwX5Fkxhl5P1+DR5frKcmzgBgPDmPa0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ffyKK+lFiVvFAN/O0rnlQPx9MaKd8MUSoEiqFO+dQ6oJQadkT2+smZIw+iC7B87NP
	 niTFVWkL3e54rEfAFPtfU3NIeuS4PyHsOgnzBQEYMM4ePiflp/dQ1CmTtlNa+L+v5j
	 x+MG/g5JctOw5xciTElhUqZ79HR8u7H5y3nddn0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 020E4F802FD;
	Fri, 17 Jan 2020 16:45:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0F32F801F7; Fri, 17 Jan 2020 16:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37D02F8026F
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 16:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D02F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mqUuF7uw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9CNI+bPv+SBhcxeWCnSujAkJ5p3lmlHPnt4+QbwhBss=; b=mqUuF7uwYK3p
 bldWcC/Z7OneeKynOFe4ev6XGX1X6komyeAp8YSWfhgWn+XFnFDFDSUgdw/4liHa9To84N+QPQGVG
 2pMpuoivAmtrJIoKe5zzNmKLtwlRLe867xyZmptEV1J4RYO5bVS94gnHgxparPLhJ2z/9sEG9VJGA
 78Gjc=;
Received: from fw-tnat-cam4.arm.com ([217.140.106.52]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1isTnB-0006sW-5H; Fri, 17 Jan 2020 15:44:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id D602DD02A2A; Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20200114161841.451-4-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20200114161841.451-4-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Date: Fri, 17 Jan 2020 15:44:12 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, Mark Brown <broonie@kernel.org>,
 li.xu@cirrus.com
Subject: [alsa-devel] Applied "ASoC: madera: Update handling of DAPM routes
	for mono muxed outputs" to the asoc tree
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

   ASoC: madera: Update handling of DAPM routes for mono muxed outputs

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

From 8ab6ddc5c51b09630f3c89eb410ac48e13a2f0ff Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Tue, 14 Jan 2020 16:18:41 +0000
Subject: [PATCH] ASoC: madera: Update handling of DAPM routes for mono muxed
 outputs

Correctly link both channels on the DAC if an output muxed between a
stereo and mono output. Without this one channel of the DAC may be
erroneously powered down whilst in mono mode.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20200114161841.451-4-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs47l15.c | 13 ++++++++++++-
 sound/soc/codecs/cs47l35.c | 12 +++++++++++-
 sound/soc/codecs/cs47l85.c |  3 ++-
 sound/soc/codecs/cs47l90.c |  3 ++-
 sound/soc/codecs/cs47l92.c | 14 +++++++++++++-
 sound/soc/codecs/madera.c  | 13 ++++++++++---
 sound/soc/codecs/madera.h  |  4 +++-
 7 files changed, 53 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index ece1276f38eb..6533c4f5a1de 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -529,6 +529,7 @@ SND_SOC_DAPM_OUTPUT("DRC2 Signal Activity"),
 SND_SOC_DAPM_OUTPUT("DSP Trigger Out"),
 
 SND_SOC_DAPM_DEMUX("HPOUT1 Demux", SND_SOC_NOPM, 0, 0, &cs47l15_outdemux),
+SND_SOC_DAPM_MUX("HPOUT1 Mono Mux", SND_SOC_NOPM, 0, 0, &cs47l15_outdemux),
 
 SND_SOC_DAPM_PGA("PWM1 Driver", MADERA_PWM_DRIVE_1, MADERA_PWM1_ENA_SHIFT,
 		 0, NULL, 0),
@@ -1084,6 +1085,9 @@ static const struct snd_soc_dapm_route cs47l15_dapm_routes[] = {
 	{ "AEC2 Loopback", "HPOUT1R", "OUT1R" },
 	{ "HPOUT1 Demux", NULL, "OUT1L" },
 	{ "HPOUT1 Demux", NULL, "OUT1R" },
+
+	{ "OUT1R", NULL, "HPOUT1 Mono Mux" },
+
 	{ "HPOUTL", "HPOUT", "HPOUT1 Demux" },
 	{ "HPOUTR", "HPOUT", "HPOUT1 Demux" },
 	{ "EPOUTP", "EPOUT", "HPOUT1 Demux" },
@@ -1261,6 +1265,11 @@ static irqreturn_t cs47l15_adsp2_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct snd_soc_dapm_route cs47l15_mono_routes[] = {
+	{ "HPOUT1 Mono Mux", "HPOUT", "OUT1L" },
+	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
+};
+
 static int cs47l15_component_probe(struct snd_soc_component *component)
 {
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
@@ -1277,7 +1286,9 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	ret = madera_init_outputs(component, CS47L15_MONO_OUTPUTS);
+	ret = madera_init_outputs(component, cs47l15_mono_routes,
+				  ARRAY_SIZE(cs47l15_mono_routes),
+				  CS47L15_MONO_OUTPUTS);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index d396a8545d51..bd172e170088 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -631,6 +631,7 @@ SND_SOC_DAPM_OUTPUT("DRC2 Signal Activity"),
 SND_SOC_DAPM_OUTPUT("DSP Trigger Out"),
 
 SND_SOC_DAPM_DEMUX("HPOUT1 Demux", SND_SOC_NOPM, 0, 0, &cs47l35_outdemux),
+SND_SOC_DAPM_MUX("HPOUT1 Mono Mux", SND_SOC_NOPM, 0, 0, &cs47l35_outdemux),
 
 SND_SOC_DAPM_PGA("PWM1 Driver", MADERA_PWM_DRIVE_1, MADERA_PWM1_ENA_SHIFT,
 		 0, NULL, 0),
@@ -1309,6 +1310,8 @@ static const struct snd_soc_dapm_route cs47l35_dapm_routes[] = {
 	{ "SPKOUTN", NULL, "OUT4L" },
 	{ "SPKOUTP", NULL, "OUT4L" },
 
+	{ "OUT1R", NULL, "HPOUT1 Mono Mux" },
+
 	{ "HPOUTL", "HPOUT", "HPOUT1 Demux" },
 	{ "HPOUTR", "HPOUT", "HPOUT1 Demux" },
 	{ "EPOUTP", "EPOUT", "HPOUT1 Demux" },
@@ -1552,6 +1555,11 @@ static irqreturn_t cs47l35_adsp2_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct snd_soc_dapm_route cs47l35_mono_routes[] = {
+	{ "HPOUT1 Mono Mux", "HPOUT", "OUT1L" },
+	{ "HPOUT1 Mono Mux", "EPOUT", "OUT1L" },
+};
+
 static int cs47l35_component_probe(struct snd_soc_component *component)
 {
 	struct cs47l35 *cs47l35 = snd_soc_component_get_drvdata(component);
@@ -1568,7 +1576,9 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	ret = madera_init_outputs(component, CS47L35_MONO_OUTPUTS);
+	ret = madera_init_outputs(component, cs47l35_mono_routes,
+				  ARRAY_SIZE(cs47l35_mono_routes),
+				  CS47L35_MONO_OUTPUTS);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 32fe7ffb7526..a69311008134 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2507,7 +2507,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	ret = madera_init_outputs(component, CS47L85_MONO_OUTPUTS);
+	ret = madera_init_outputs(component, NULL, CS47L85_MONO_OUTPUTS,
+				  CS47L85_MONO_OUTPUTS);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 67cac60a859d..5448e4506741 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2418,7 +2418,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	ret = madera_init_outputs(component, CS47L90_MONO_OUTPUTS);
+	ret = madera_init_outputs(component, NULL, CS47L90_MONO_OUTPUTS,
+				  CS47L90_MONO_OUTPUTS);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index d50f75f3b3e4..3c108b936419 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -730,6 +730,7 @@ SND_SOC_DAPM_MUX("IN2L Mode", SND_SOC_NOPM, 0, 0, &madera_inmode[1]),
 SND_SOC_DAPM_MUX("IN2R Mode", SND_SOC_NOPM, 0, 0, &madera_inmode[1]),
 
 SND_SOC_DAPM_DEMUX("OUT3 Demux", SND_SOC_NOPM, 0, 0, &cs47l92_outdemux),
+SND_SOC_DAPM_MUX("OUT3 Mono Mux", SND_SOC_NOPM, 0, 0, &cs47l92_outdemux),
 
 SND_SOC_DAPM_OUTPUT("DRC1 Signal Activity"),
 SND_SOC_DAPM_OUTPUT("DRC2 Signal Activity"),
@@ -1584,6 +1585,8 @@ static const struct snd_soc_dapm_route cs47l92_dapm_routes[] = {
 	{ "OUT3 Demux", NULL, "OUT3L" },
 	{ "OUT3 Demux", NULL, "OUT3R" },
 
+	{ "OUT3R", NULL, "OUT3 Mono Mux" },
+
 	{ "HPOUT3L", "HPOUT3", "OUT3 Demux" },
 	{ "HPOUT3R", "HPOUT3", "OUT3 Demux" },
 	{ "HPOUT4L", "HPOUT4", "OUT3 Demux" },
@@ -1817,6 +1820,13 @@ static irqreturn_t cs47l92_adsp2_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct snd_soc_dapm_route cs47l92_mono_routes[] = {
+	{ "OUT1R", NULL, "OUT1L" },
+	{ "OUT2R", NULL, "OUT2L" },
+	{ "OUT3 Mono Mux", "HPOUT3", "OUT3L" },
+	{ "OUT3 Mono Mux", "HPOUT4", "OUT3L" },
+};
+
 static int cs47l92_component_probe(struct snd_soc_component *component)
 {
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
@@ -1833,7 +1843,9 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	ret = madera_init_outputs(component, CS47L92_MONO_OUTPUTS);
+	ret = madera_init_outputs(component, cs47l92_mono_routes,
+				  ARRAY_SIZE(cs47l92_mono_routes),
+				  CS47L92_MONO_OUTPUTS);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 52639811cc52..b537e60ef7c0 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -1162,7 +1162,9 @@ static const struct snd_soc_dapm_route madera_mono_routes[] = {
 	{ "OUT6R", NULL, "OUT6L" },
 };
 
-int madera_init_outputs(struct snd_soc_component *component, int n_mono_routes)
+int madera_init_outputs(struct snd_soc_component *component,
+			const struct snd_soc_dapm_route *routes,
+			int n_mono_routes, int n_real)
 {
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
@@ -1179,16 +1181,21 @@ int madera_init_outputs(struct snd_soc_component *component, int n_mono_routes)
 		n_mono_routes = MADERA_MAX_OUTPUT;
 	}
 
+	if (!routes)
+		routes = madera_mono_routes;
+
 	for (i = 0; i < n_mono_routes; i++) {
 		/* Default is 0 so noop with defaults */
 		if (pdata->out_mono[i]) {
 			val = MADERA_OUT1_MONO;
-			snd_soc_dapm_add_routes(dapm,
-						&madera_mono_routes[i], 1);
+			snd_soc_dapm_add_routes(dapm, &routes[i], 1);
 		} else {
 			val = 0;
 		}
 
+		if (i >= n_real)
+			continue;
+
 		regmap_update_bits(madera->regmap,
 				   MADERA_OUTPUT_PATH_CONFIG_1L + (i * 8),
 				   MADERA_OUT1_MONO, val);
diff --git a/sound/soc/codecs/madera.h b/sound/soc/codecs/madera.h
index 6d8938a3fb64..bff084695961 100644
--- a/sound/soc/codecs/madera.h
+++ b/sound/soc/codecs/madera.h
@@ -421,7 +421,9 @@ int madera_core_free(struct madera_priv *priv);
 int madera_init_overheat(struct madera_priv *priv);
 int madera_free_overheat(struct madera_priv *priv);
 int madera_init_inputs(struct snd_soc_component *component);
-int madera_init_outputs(struct snd_soc_component *component, int n_mono_routes);
+int madera_init_outputs(struct snd_soc_component *component,
+			const struct snd_soc_dapm_route *routes,
+			int n_mono_routes, int n_real);
 int madera_init_bus_error_irq(struct madera_priv *priv, int dsp_num,
 			      irq_handler_t handler);
 void madera_free_bus_error_irq(struct madera_priv *priv, int dsp_num);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
