Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C3A4EC0C0
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19ED3184C;
	Wed, 30 Mar 2022 13:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19ED3184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641110;
	bh=RMc2It4dGYVyP7I6bfOhhGG9ID4xvoJkIC5CZ+LRjz8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qWGSUqZLufGOai2+ulqG+3r7pG16GkqXuR89h262mvKeqol8oj+Rl/udmihN8kUlO
	 +IcTtlQySUZLnYAZThg2F54QzZkddpUrFWnQh7iksKDxVsic5Umi7FCxs1yoULx0ID
	 YfhstnaM5tLFVTPvLKAFFclZTfEOzgnzST3p7y3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF1FF80254;
	Wed, 30 Mar 2022 13:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6CC4F8055A; Wed, 30 Mar 2022 13:48:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2334F80557
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2334F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TIWbPZqt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3335FB81C36;
 Wed, 30 Mar 2022 11:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF22C34113;
 Wed, 30 Mar 2022 11:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640888;
 bh=RMc2It4dGYVyP7I6bfOhhGG9ID4xvoJkIC5CZ+LRjz8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TIWbPZqtp4IAirDVGefxJc0Ea4JceUtg0yz/j+PkkjYVX7j0p8thEPiwPtTPUd35S
 QwXkUUBGajtWw9AlrZ2QEk+WtLxH3mCJIzZL17lxTVNhdBlGWA/isV4vtVWAfgIOok
 fBO5TImuaunlxaKCQLAXnN1NwSYFX9Qiw/+zcPryfQxx69fy1MHBKi1T+8iC82C16i
 NUGC1uIIPDiMnyHwAVU1cojlkL7LjpENIItJZFKL/jU1R8fLNdxsQkaTgHa9j76MYf
 38nxhbu7SutfeI3XcY25tHCRnd3TtsgEYOfi+MnTVDRe1Co3U5EV/IeLnraFg7ZZ/S
 m16Spproudssw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 53/66] ASoC: SOF: Intel: hda: retrieve DMIC
 number for I2S boards
Date: Wed, 30 Mar 2022 07:46:32 -0400
Message-Id: <20220330114646.1669334-53-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 92c1b7c0f780f0084f7b114be316ae4e182676e5 ]

We currently extract the DMIC number only for HDaudio or SoundWire
platforms. For I2S/TDM platforms, this wasn't necessary until now, but
with devices with ES8336 we need to find a solution to detect dmics
more reliably than with a DMI quirk.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220308192610.392950-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/intel/hda.c | 46 +++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 848d1d563170..028751549f6d 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -432,11 +432,9 @@ static char *hda_model;
 module_param(hda_model, charp, 0444);
 MODULE_PARM_DESC(hda_model, "Use the given HDA board model.");
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
-static int hda_dmic_num = -1;
-module_param_named(dmic_num, hda_dmic_num, int, 0444);
+static int dmic_num_override = -1;
+module_param_named(dmic_num, dmic_num_override, int, 0444);
 MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
-#endif
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 static bool hda_codec_use_common_hdmi = IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI);
@@ -644,24 +642,35 @@ static int hda_init(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
-
-static int check_nhlt_dmic(struct snd_sof_dev *sdev)
+static int check_dmic_num(struct snd_sof_dev *sdev)
 {
 	struct nhlt_acpi_table *nhlt;
-	int dmic_num;
+	int dmic_num = 0;
 
 	nhlt = intel_nhlt_init(sdev->dev);
 	if (nhlt) {
 		dmic_num = intel_nhlt_get_dmic_geo(sdev->dev, nhlt);
 		intel_nhlt_free(nhlt);
-		if (dmic_num >= 1 && dmic_num <= 4)
-			return dmic_num;
 	}
 
-	return 0;
+	/* allow for module parameter override */
+	if (dmic_num_override != -1) {
+		dev_dbg(sdev->dev,
+			"overriding DMICs detected in NHLT tables %d by kernel param %d\n",
+			dmic_num, dmic_num_override);
+		dmic_num = dmic_num_override;
+	}
+
+	if (dmic_num < 0 || dmic_num > 4) {
+		dev_dbg(sdev->dev, "invalid dmic_number %d\n", dmic_num);
+		dmic_num = 0;
+	}
+
+	return dmic_num;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) || IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 				   const char *sof_tplg_filename,
 				   const char *idisp_str,
@@ -697,16 +706,8 @@ static int dmic_topology_fixup(struct snd_sof_dev *sdev,
 	const char *dmic_str;
 	int dmic_num;
 
-	/* first check NHLT for DMICs */
-	dmic_num = check_nhlt_dmic(sdev);
-
-	/* allow for module parameter override */
-	if (hda_dmic_num != -1) {
-		dev_dbg(sdev->dev,
-			"overriding DMICs detected in NHLT tables %d by kernel param %d\n",
-			dmic_num, hda_dmic_num);
-		dmic_num = hda_dmic_num;
-	}
+	/* first check for DMICs (using NHLT or module parameter) */
+	dmic_num = check_dmic_num(sdev);
 
 	switch (dmic_num) {
 	case 1:
@@ -1392,6 +1393,9 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		if (!sof_pdata->tplg_filename)
 			sof_pdata->tplg_filename = mach->sof_tplg_filename;
 
+		/* report to machine driver if any DMICs are found */
+		mach->mach_params.dmic_num = check_dmic_num(sdev);
+
 		if (mach->link_mask) {
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
-- 
2.34.1

