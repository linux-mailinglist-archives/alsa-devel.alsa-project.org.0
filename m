Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE5F17A612
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:10:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E7A166D;
	Thu,  5 Mar 2020 14:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E7A166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583413803;
	bh=NR4lJtkO79X0x1gNEFr2AzcqIGo94SqWRyNaOGrnLf4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sdfq9O02h1nsPnG3653hQWPt06laE4WDLr9bshoOFQlLgCX4t4/1Z0ThP0NjA367g
	 1RBd4oLaHs/Bmza7mGXIa0jtSpEhIZKcYSUhKRCFNNKmUumHKbTTr0r+4yK+u0KhK/
	 VnyWdfzXFMCWVjsMiA7wN2S4K5ZrRmgzgBXoUoI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0761FF80290;
	Thu,  5 Mar 2020 14:06:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A165DF8027B; Thu,  5 Mar 2020 14:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C158F80266
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C158F80266
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 05:06:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="287659382"
Received: from virbhadx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.184.168])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2020 05:06:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload issues
Date: Thu,  5 Mar 2020 07:06:15 -0600
Message-Id: <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

The use of devm_gpiod_get() in a dailink .init() callback generates issues
when unloading modules. The dependencies between modules are not well
handled and the snd_soc_rt5677 module cannot be removed:

rmmod: ERROR: Module snd_soc_rt5677 is in use

Removing the use of devm_ and manually releasing the gpio descriptor
in the dailink .exit() callback solves the issue.

Tested on SAMUS Chromebook with SOF driver.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index a94f498388e1..641491cb449b 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -247,8 +247,8 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 			RT5677_CLK_SEL_SYS2);
 
 	/* Request rt5677 GPIO for headphone amp control */
-	bdw_rt5677->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
-						GPIOD_OUT_LOW);
+	bdw_rt5677->gpio_hp_en = gpiod_get(component->dev, "headphone-enable",
+					   GPIOD_OUT_LOW);
 	if (IS_ERR(bdw_rt5677->gpio_hp_en)) {
 		dev_err(component->dev, "Can't find HP_AMP_SHDN_L gpio\n");
 		return PTR_ERR(bdw_rt5677->gpio_hp_en);
@@ -282,6 +282,15 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static void bdw_rt5677_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct bdw_rt5677_priv *bdw_rt5677 =
+			snd_soc_card_get_drvdata(rtd->card);
+
+	if (!IS_ERR(bdw_rt5677->gpio_hp_en))
+		gpiod_put(bdw_rt5677->gpio_hp_en);
+}
+
 /* broadwell digital audio interface glue - connects codec <--> CPU */
 SND_SOC_DAILINK_DEF(dummy,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()));
@@ -350,6 +359,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
+		.exit = bdw_rt5677_exit,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
 };
-- 
2.20.1

