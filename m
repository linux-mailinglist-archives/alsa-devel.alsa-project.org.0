Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468E4B200
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 08:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7D42169E;
	Wed, 19 Jun 2019 08:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7D42169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560924995;
	bh=dhrNpkyGjZ6aFzKgxuTrsRFwwT+zUYuk/G7ILOf27kE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=greJUXGhrWVYOMoKfsSv9puqIqT3T1nVnSWRVfA79l2gDANC/AEmqde7LB2RZPiPV
	 wbQI7z0XoImx/I987GNs5mpS+PJclu9CjKh2wJnQd2/6RdNi7Kvy0u0lSi6DbCfJzz
	 Pu2W27TXFRCRD64cLoP9z+EdMO7aF4064hlTqncI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D00ABF896DF;
	Wed, 19 Jun 2019 08:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 123B6F896C7; Wed, 19 Jun 2019 08:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F91CF80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 08:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F91CF80C87
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 23:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="150514300"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga007.jf.intel.com with ESMTP; 18 Jun 2019 23:14:19 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org
Date: Wed, 19 Jun 2019 02:15:38 +0800
Message-Id: <20190618181539.9169-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: Intel: sof-rt5682: add MCLK
	support for BYT platform
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

From: Xun Zhang <xun2.zhang@intel.com>

The sof-rt5682 machine driver currently uses BCLK on BYT/Minnowboard
platform. The MCLK signal is available since the Turbot revision, so
enable MCLK on BYT/Minnowboard Turbot platform.

Signed-off-by: Xun Zhang <xun2.zhang@intel.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 65 ++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e2e5f97d9920..f3d481b75b15 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -9,6 +9,7 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 #include <linux/dmi.h>
 #include <sound/core.h>
 #include <sound/jack.h>
@@ -32,6 +33,7 @@
 #define SOF_RT5682_SSP_AMP_MASK                 (GENMASK(8, 6))
 #define SOF_RT5682_SSP_AMP(quirk)	\
 	(((quirk) << SOF_RT5682_SSP_AMP_SHIFT) & SOF_RT5682_SSP_AMP_MASK)
+#define SOF_RT5682_MCLK_BYTCHT_EN		BIT(9)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -48,6 +50,7 @@ struct sof_hdmi_pcm {
 };
 
 struct sof_card_private {
+	struct clk *mclk;
 	struct snd_soc_jack sof_headset;
 	struct list_head hdmi_pcm_list;
 };
@@ -59,6 +62,22 @@ static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
 }
 
 static const struct dmi_system_id sof_rt5682_quirk_table[] = {
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Circuitco"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Minnowboard Max"),
+		},
+		.driver_data = (void *)(SOF_RT5682_SSP_CODEC(2)),
+	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UP-CHT01"),
+		},
+		.driver_data = (void *)(SOF_RT5682_SSP_CODEC(2)),
+	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
@@ -127,6 +146,27 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 					RT5682_CLK_SEL_I2S1_ASRC);
 	}
 
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+		/*
+		 * The firmware might enable the clock at
+		 * boot (this information may or may not
+		 * be reflected in the enable clock register).
+		 * To change the rate we must disable the clock
+		 * first to cover these cases. Due to common
+		 * clock framework restrictions that do not allow
+		 * to disable a clock that has not been enabled,
+		 * we need to enable the clock first.
+		 */
+		ret = clk_prepare_enable(ctx->mclk);
+		if (!ret)
+			clk_disable_unprepare(ctx->mclk);
+
+		ret = clk_set_rate(ctx->mclk, 19200000);
+
+		if (ret)
+			dev_err(rtd->dev, "unable to set MCLK rate\n");
+	}
+
 	/*
 	 * Headset buttons map to the google Reference headset.
 	 * These can be configured by userspace.
@@ -161,10 +201,20 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	int clk_id, clk_freq, pll_out, ret;
 
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
+		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+			ret = clk_prepare_enable(ctx->mclk);
+			if (ret < 0) {
+				dev_err(rtd->dev,
+					"could not configure MCLK state");
+				return ret;
+			}
+		}
+
 		clk_id = RT5682_PLL1_S_MCLK;
 		if (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ)
 			clk_freq = 24000000;
@@ -507,7 +557,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 		dmic_num = 0;
 		hdmi_num = 0;
 		/* default quirk for legacy cpu */
-		sof_rt5682_quirk = SOF_RT5682_SSP_CODEC(2);
+		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
+						SOF_RT5682_MCLK_BYTCHT_EN |
+						SOF_RT5682_SSP_CODEC(2);
 	} else {
 		dmic_num = 1;
 		hdmi_num = 3;
@@ -515,6 +567,17 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
+	/* need to get main clock from pmc */
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+		ctx->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+		ret = clk_prepare_enable(ctx->mclk);
+		if (ret < 0) {
+			dev_err(&pdev->dev,
+				"could not configure MCLK state");
+			return ret;
+		}
+	}
+
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
 	ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
