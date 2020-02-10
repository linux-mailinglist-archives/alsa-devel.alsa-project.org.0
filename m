Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B801570C6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 09:25:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E406167A;
	Mon, 10 Feb 2020 09:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E406167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581323106;
	bh=LHlioKb4fUlQv9HJp12YdrR7Vte33ZTje9mc1oTj4sE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kaRxHDB5mfzEks0rZrwqhhCubaAsEYPbKrI4dUKDLNA58UruqzjfYL5tdpgHaHhOK
	 gq1L31E8orBzK3AphgRdWeZ4/3JSqGpQo/AR3d/xetOlP8TeP8Ridf2BS3kN01KEt1
	 fCllEfaX/13pG+9HrFU5TpIwKvRBLefcu5EGgIMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1887F8014F;
	Mon, 10 Feb 2020 09:23:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 303BEF80157; Mon, 10 Feb 2020 09:23:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB38BF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 09:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB38BF80118
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 00:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,424,1574150400"; d="scan'208";a="251116475"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga002.jf.intel.com with ESMTP; 10 Feb 2020 00:23:13 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 10 Feb 2020 16:16:51 +0800
Message-Id: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, mac.chiang@intel.com,
 Mark Brown <broonie@kernel.org>, Brent Lu <brent.lu@intel.com>,
 cychiang@google.com
Subject: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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

Intel sst firmware turns on BCLK/WCLK in START Ioctl call which timing is
later than the DAPM SUPPLY event handler da7219_dai_event is called (in
PREPARED state). Therefore, the SRM lock check always fail.

Moving the check to trigger callback could ensure the SRM is locked before
DSP starts to process data and avoid possisble noise.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/codecs/da7219.c | 68 +++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f83a6ea..0fb5ea5 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -794,9 +794,7 @@ static int da7219_dai_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	struct clk *bclk = da7219->dai_clks[DA7219_DAI_BCLK_IDX];
-	u8 pll_ctrl, pll_status;
-	int i = 0, ret;
-	bool srm_lock = false;
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -820,26 +818,6 @@ static int da7219_dai_event(struct snd_soc_dapm_widget *w,
 		/* PC synchronised to DAI */
 		snd_soc_component_update_bits(component, DA7219_PC_COUNT,
 				    DA7219_PC_FREERUN_MASK, 0);
-
-		/* Slave mode, if SRM not enabled no need for status checks */
-		pll_ctrl = snd_soc_component_read32(component, DA7219_PLL_CTRL);
-		if ((pll_ctrl & DA7219_PLL_MODE_MASK) != DA7219_PLL_MODE_SRM)
-			return 0;
-
-		/* Check SRM has locked */
-		do {
-			pll_status = snd_soc_component_read32(component, DA7219_PLL_SRM_STS);
-			if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
-				srm_lock = true;
-			} else {
-				++i;
-				msleep(50);
-			}
-		} while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
-
-		if (!srm_lock)
-			dev_warn(component->dev, "SRM failed to lock\n");
-
 		return 0;
 	case SND_SOC_DAPM_POST_PMD:
 		/* PC free-running */
@@ -1658,12 +1636,56 @@ static int da7219_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int da7219_set_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	u8 pll_ctrl, pll_status;
+	int i = 0;
+	bool srm_lock = false;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		/* Slave mode, if SRM not enabled no need for status checks */
+		pll_ctrl = snd_soc_component_read32(component, DA7219_PLL_CTRL);
+		if ((pll_ctrl & DA7219_PLL_MODE_MASK) != DA7219_PLL_MODE_SRM)
+			return 0;
+
+		/* Check SRM has locked */
+		do {
+			pll_status = snd_soc_component_read32(component,
+							DA7219_PLL_SRM_STS);
+			if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
+				srm_lock = true;
+			} else {
+				++i;
+				msleep(50);
+			}
+		} while ((i < DA7219_SRM_CHECK_RETRIES) && (!srm_lock));
+
+		if (!srm_lock)
+			dev_warn(component->dev, "SRM failed to lock\n");
+
+		break;
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops da7219_dai_ops = {
 	.hw_params	= da7219_hw_params,
 	.set_sysclk	= da7219_set_dai_sysclk,
 	.set_pll	= da7219_set_dai_pll,
 	.set_fmt	= da7219_set_dai_fmt,
 	.set_tdm_slot	= da7219_set_dai_tdm_slot,
+	.trigger	= da7219_set_dai_trigger,
 };
 
 #define DA7219_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
