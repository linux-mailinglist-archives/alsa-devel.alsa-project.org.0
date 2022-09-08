Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3027A5B1603
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 09:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CB816B2;
	Thu,  8 Sep 2022 09:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CB816B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662623469;
	bh=n42+F1QIZG4mHZiJpOyyzTzl90fRNpUWkUMCEX5p3YQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R3qIy1uDZNeO3lBDWJ53E9S5NRPz3aZlwD/uLpTGHI1fUbECgZ2OGZGL/E0ydGHwU
	 IAtLLZX8lRdKBpz/xyXjhMj6dh12TOfcLwG5wDPwyQzWH7gBdBDZXoblFVdFbMHwxl
	 Bgnd0dRkG1L0alSC7BFBw9BbVOBF0z/+0sLY1fb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06919F800CB;
	Thu,  8 Sep 2022 09:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A3DF80217; Thu,  8 Sep 2022 09:50:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B998F800CB
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 09:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B998F800CB
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 94F331A0EDB;
 Thu,  8 Sep 2022 09:50:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 686241A0ED8;
 Thu,  8 Sep 2022 09:50:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 465B0180031F;
 Thu,  8 Sep 2022 15:50:00 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: ak4458: Remove component probe() and remove()
Date: Thu,  8 Sep 2022 15:31:56 +0800
Message-Id: <1662622316-23426-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

Most function in ak4458_probe() and ak4458_remove() are
duplicate with dai ops, so remove them and move dsd_path
setting to dai ops.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 53 ++++++---------------------------------
 1 file changed, 7 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index ea33cc83c86c..b534212096ee 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -447,6 +447,13 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AK4458_0B_CONTROL7,
 				      AK4458_DCHAIN_MASK, dchn);
 
+	if (ak4458->drvdata->type == AK4497) {
+		ret = snd_soc_component_update_bits(component, AK4458_09_DSD2,
+						    0x4, (ak4458->dsd_path << 2));
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = ak4458_rstn_control(component, 0);
 	if (ret)
 		return ret;
@@ -629,48 +636,6 @@ static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
 	}
 }
 
-static int ak4458_init(struct snd_soc_component *component)
-{
-	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	/* External Mute ON */
-	if (ak4458->mute_gpiod)
-		gpiod_set_value_cansleep(ak4458->mute_gpiod, 1);
-
-	ak4458_reset(ak4458, false);
-
-	ret = snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
-			    0x80, 0x80);   /* ACKS bit = 1; 10000000 */
-	if (ret < 0)
-		return ret;
-
-	if (ak4458->drvdata->type == AK4497) {
-		ret = snd_soc_component_update_bits(component, AK4458_09_DSD2,
-						    0x4, (ak4458->dsd_path << 2));
-		if (ret < 0)
-			return ret;
-	}
-
-	return ak4458_rstn_control(component, 1);
-}
-
-static int ak4458_probe(struct snd_soc_component *component)
-{
-	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
-
-	ak4458->fs = 48000;
-
-	return ak4458_init(component);
-}
-
-static void ak4458_remove(struct snd_soc_component *component)
-{
-	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
-
-	ak4458_reset(ak4458, true);
-}
-
 #ifdef CONFIG_PM
 static int __maybe_unused ak4458_runtime_suspend(struct device *dev)
 {
@@ -714,8 +679,6 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
 #endif /* CONFIG_PM */
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
-	.probe			= ak4458_probe,
-	.remove			= ak4458_remove,
 	.controls		= ak4458_snd_controls,
 	.num_controls		= ARRAY_SIZE(ak4458_snd_controls),
 	.dapm_widgets		= ak4458_dapm_widgets,
@@ -728,8 +691,6 @@ static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_ak4497 = {
-	.probe			= ak4458_probe,
-	.remove			= ak4458_remove,
 	.controls		= ak4497_snd_controls,
 	.num_controls		= ARRAY_SIZE(ak4497_snd_controls),
 	.dapm_widgets		= ak4497_dapm_widgets,
-- 
2.34.1

