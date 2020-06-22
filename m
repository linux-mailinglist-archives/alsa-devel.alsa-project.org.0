Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5254B203B69
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 17:47:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014D31709;
	Mon, 22 Jun 2020 17:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014D31709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592840847;
	bh=NWKMBMb3hR143W6fO2zcgiPbECNEKQdnFhfW+i0XgwY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bVAIMTSCUzc8AXd5tYmrTVYoTOepuUUA7/E8NVd0t4uf2zVYdkk1SU05bHxMPDOSZ
	 ZGqU5OMtTA93ZId8mjsY2is0l7IZBfgIW9S50Ncc/ZpfoEClABx/IXF9HWBtQSkqCM
	 BihGNTO9zkQ3aryBiobIEGuEVpqpvfc+NdmisrX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C83F802DD;
	Mon, 22 Jun 2020 17:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 341A7F801F2; Mon, 22 Jun 2020 17:43:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D210F80162
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 17:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D210F80162
IronPort-SDR: 11P+v/AbZ+kjUnMjwIARloR8L+kme20FgiJ8DPVQWhWUvaYYhwge7EyDM0dIVpVTuHXrd5tVln
 G8Bxlz097o7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="141300431"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="141300431"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 08:42:49 -0700
IronPort-SDR: PuoaSk8EoEygtmXbJMPdNbmLg1vJB9ofKHH4cLJEZJysApxJisJEv1eS+PCdETHWPpxDWE/+Qg
 4KUc8DpUjM0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="478425144"
Received: from somsubhr-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.74.194])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2020 08:42:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
Date: Mon, 22 Jun 2020 10:42:38 -0500
Message-Id: <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <curtis@malainey.com>, broonie@kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

The mainline code currently prevents modules from being removed.

The BE dailink .init() function calls devm_gpiod_get() using the codec
component device as argument. When the machine driver is removed, the
references to the gpiod are not released, and it's not possible to
remove the codec driver module - which is the only entity which could
free the gpiod.

This conceptual deadlock can be avoided by invoking gpiod_get() in the
.init() callback, and calling gpiod_put() in the exit() callback.

Tested on SAMUS Chromebook with SOF driver.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 34a3abb5991f..c9da91147770 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -272,8 +272,8 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 			RT5677_CLK_SEL_SYS2);
 
 	/* Request rt5677 GPIO for headphone amp control */
-	bdw_rt5677->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
-						GPIOD_OUT_LOW);
+	bdw_rt5677->gpio_hp_en = gpiod_get(component->dev, "headphone-enable",
+					   GPIOD_OUT_LOW);
 	if (IS_ERR(bdw_rt5677->gpio_hp_en)) {
 		dev_err(component->dev, "Can't find HP_AMP_SHDN_L gpio\n");
 		return PTR_ERR(bdw_rt5677->gpio_hp_en);
@@ -307,6 +307,19 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static void bdw_rt5677_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct bdw_rt5677_priv *bdw_rt5677 =
+			snd_soc_card_get_drvdata(rtd->card);
+
+	/*
+	 * The .exit() can be reached without going through the .init()
+	 * so explicitly test if the gpiod is valid
+	 */
+	if (!IS_ERR_OR_NULL(bdw_rt5677->gpio_hp_en))
+		gpiod_put(bdw_rt5677->gpio_hp_en);
+}
+
 /* broadwell digital audio interface glue - connects codec <--> CPU */
 SND_SOC_DAILINK_DEF(dummy,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()));
@@ -372,6 +385,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
+		.exit = bdw_rt5677_exit,
 #if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 		SND_SOC_DAILINK_REG(dummy, be, dummy),
 #else
-- 
2.20.1

