Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B0195A30
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:46:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C91215F9;
	Fri, 27 Mar 2020 16:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C91215F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323991;
	bh=xWYlfcAa0ICkdtNdUP3k2xREhwrXwci19BABBLXGLKs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cX3ursGK2r5/CtJQEXOnlecqqhXMb+nJcHI0Z1RnwFnkZUy1R5wGMkiCvUXnkiLWC
	 TEBXoC6VQ6nMWstMwLm6kkzMOAr0zcMIyoVGC/jnkWWOF8ZKnjfMLAJbI+jx+DKS77
	 9JRvIPhLAFUxRN3wIenNLrdbwphqIZ1ApcTAMVps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B422F8035E;
	Fri, 27 Mar 2020 16:35:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A114EF8034D; Fri, 27 Mar 2020 16:34:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 64381F8034B
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64381F8034B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8F1B1FB;
 Fri, 27 Mar 2020 08:34:52 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B4B63F71F;
 Fri, 27 Mar 2020 08:34:52 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: ti: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <875zevir3p.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-875zevir3p.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: ti: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 2842b87148af9ab7a0f3913022f2935e47cedd97 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:21:14 +0900
Subject: [PATCH] ASoC: ti: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/875zevir3p.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/ams-delta.c        | 4 ++--
 sound/soc/ti/davinci-evm.c      | 4 ++--
 sound/soc/ti/davinci-vcif.c     | 4 ++--
 sound/soc/ti/n810.c             | 2 +-
 sound/soc/ti/omap-abe-twl6040.c | 6 +++---
 sound/soc/ti/omap-mcbsp-st.c    | 2 +-
 sound/soc/ti/omap-mcbsp.c       | 4 ++--
 sound/soc/ti/omap-mcpdm.c       | 2 +-
 sound/soc/ti/omap3pandora.c     | 4 ++--
 sound/soc/ti/osk5912.c          | 2 +-
 sound/soc/ti/rx51.c             | 2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 8e2fb81ad05c..e17cd5e939f0 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -460,14 +460,14 @@ static void ams_delta_shutdown(struct snd_pcm_substream *substream)
 
 static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = &card->dapm;
 	int ret;
 	/* Codec is ready, now add/activate board specific controls */
 
 	/* Store a pointer to the codec structure for tty ldisc use */
-	cx20442_codec = rtd->codec_dai->component;
+	cx20442_codec = asoc_rtd_to_codec(rtd, 0)->component;
 
 	/* Add hook switch - can be used to control the codec from userspace
 	 * even if line discipline fails */
diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 686b23d7a90d..2cfbeebdfb41 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -54,8 +54,8 @@ static int evm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *soc_card = rtd->card;
 	int ret = 0;
 	unsigned sysclk = ((struct snd_soc_card_drvdata_davinci *)
diff --git a/sound/soc/ti/davinci-vcif.c b/sound/soc/ti/davinci-vcif.c
index c84650e4a7aa..ee4d3ef821a1 100644
--- a/sound/soc/ti/davinci-vcif.c
+++ b/sound/soc/ti/davinci-vcif.c
@@ -43,7 +43,7 @@ static void davinci_vcif_start(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct davinci_vcif_dev *davinci_vcif_dev =
-			snd_soc_dai_get_drvdata(rtd->cpu_dai);
+			snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct davinci_vc *davinci_vc = davinci_vcif_dev->davinci_vc;
 	u32 w;
 
@@ -62,7 +62,7 @@ static void davinci_vcif_stop(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct davinci_vcif_dev *davinci_vcif_dev =
-			snd_soc_dai_get_drvdata(rtd->cpu_dai);
+			snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 	struct davinci_vc *davinci_vc = davinci_vcif_dev->davinci_vc;
 	u32 w;
 
diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index 3ad2b6daf31e..a1672b479cb7 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -101,7 +101,7 @@ static int n810_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int err;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 6d564ab5e437..61e45fea5dd8 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -46,7 +46,7 @@ static int omap_abe_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
 	int clk_id, freq;
@@ -78,7 +78,7 @@ static int omap_abe_dmic_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_DMIC_SYSCLK_PAD_CLKS,
@@ -166,7 +166,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static int omap_abe_twl6040_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_card *card = rtd->card;
 	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
 	int hs_trim;
diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 1a3fe854e856..5a32b54bbf3b 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -489,7 +489,7 @@ OMAP_MCBSP_ST_CONTROLS(3);
 
 int omap_mcbsp_st_add_controls(struct snd_soc_pcm_runtime *rtd, int port_id)
 {
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 
 	if (!mcbsp->st_data) {
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 26b503bbdb5f..ff24546a10ee 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -737,7 +737,7 @@ static void omap_mcbsp_set_threshold(struct snd_pcm_substream *substream,
 		unsigned int packet_size)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	int words;
 
@@ -902,7 +902,7 @@ static snd_pcm_sframes_t omap_mcbsp_dai_delay(
 			struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	u16 fifo_use;
 	snd_pcm_sframes_t delay;
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index a726cd7a8252..0ff33fe165f2 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -532,7 +532,7 @@ static const struct snd_soc_component_driver omap_mcpdm_component = {
 void omap_mcpdm_configure_dn_offsets(struct snd_soc_pcm_runtime *rtd,
 				    u8 rx1, u8 rx2)
 {
-	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	mcpdm->dn_rx_offset = MCPDM_DNOFST_RX1(rx1) | MCPDM_DNOFST_RX2(rx2);
 }
diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index 545f8dac9bd5..b04146311b31 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -32,8 +32,8 @@ static int omap3pandora_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 1ca466bc4025..e01485cc51a1 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -39,7 +39,7 @@ static int osk_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int err;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index fdb0dc85fe67..2a714a004163 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -103,7 +103,7 @@ static int rx51_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* Set the codec system clock for DAC and ADC */
 	return snd_soc_dai_set_sysclk(codec_dai, 0, 19200000,
-- 
2.20.1

