Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADB817A60F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:09:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859241666;
	Thu,  5 Mar 2020 14:08:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859241666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583413763;
	bh=EXP3qrBOexTl3d84/+S81bqjNxMxrENUAuqK4KQrPpU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8ol4jtXGTnm2GAjFg7qDL4p4eo8GMzW/msnMiOBrYqSvwMVn2dklkDPOeKqWwspT
	 8JI8dsP4c1aTx4z40dlFRDnZ5qqOLFagONpZKs0K38G9jqJVNvZBRBBH4y4kbb8tXh
	 9jKwJr0KQ83bQBEuGtdd0+L+fhaRIO9dstZHA0OI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFD3F8028C;
	Thu,  5 Mar 2020 14:06:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C84BAF80271; Thu,  5 Mar 2020 14:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE2B6F80271
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE2B6F80271
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 05:06:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="287659384"
Received: from virbhadx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.184.168])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2020 05:06:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 3/3] ASoC: Intel: kbl-rt5660: use .exit() dailink callback
 to release gpiod
Date: Thu,  5 Mar 2020 07:06:16 -0600
Message-Id: <20200305130616.28658-4-pierre-louis.bossart@linux.intel.com>
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

The gpiod handling is inspired from the bdw-rt5677 code. Apply same
fix to avoid reference count issue while removing modules for
consistency.

The SOF driver does not yet support this machine driver, and module
load/unload with the SKL driver isn't well supported, so this was not
tested on a device.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/kbl_rt5660.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index e23dea9ab79a..3ff3afd36536 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -165,8 +165,8 @@ static int kabylake_rt5660_codec_init(struct snd_soc_pcm_runtime *rtd)
 		dev_warn(component->dev, "Failed to add driver gpios\n");
 
 	/* Request rt5660 GPIO for lineout mute control, return if fails */
-	ctx->gpio_lo_mute = devm_gpiod_get(component->dev, "lineout-mute",
-					   GPIOD_OUT_HIGH);
+	ctx->gpio_lo_mute = gpiod_get(component->dev, "lineout-mute",
+				      GPIOD_OUT_HIGH);
 	if (IS_ERR(ctx->gpio_lo_mute)) {
 		dev_err(component->dev, "Can't find GPIO_MUTE# gpio\n");
 		return PTR_ERR(ctx->gpio_lo_mute);
@@ -207,6 +207,14 @@ static int kabylake_rt5660_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static void kabylake_rt5660_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+
+	if (!IS_ERR(ctx->gpio_lo_mute))
+		gpiod_put(ctx->gpio_lo_mute));
+}
+
 static int kabylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
 {
 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -421,6 +429,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.init = kabylake_rt5660_codec_init,
+		.exit = kabylake_rt5660_codec_exit,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 		SND_SOC_DAIFMT_NB_NF |
 		SND_SOC_DAIFMT_CBS_CFS,
-- 
2.20.1

