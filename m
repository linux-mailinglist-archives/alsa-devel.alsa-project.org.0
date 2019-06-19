Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A994B914
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D61D71704;
	Wed, 19 Jun 2019 14:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D61D71704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560948568;
	bh=TEcV3dyOVzoH7+AgmA8CP1ZcS0EgnKr/qnfM5FFt3zA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=t0ETuE85gDmd3KsRb2LLWhZnFZKaoucZysmOUPxpth3A7NV1hdFmA1NUSsw0htBMY
	 R5kDmhD9kfRn1Rv3ZZ5xb82oi+xycTQ8Ilee/iScNsdwIxYo0xyJpsgEnLURfwfwE5
	 QU1JRDpu8ii88E1EL5D3+X3Pl3d49VQIL+W6eq44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D108F89852;
	Wed, 19 Jun 2019 14:13:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EF7DF808AF; Wed, 19 Jun 2019 14:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 364B2F808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364B2F808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ehovhVsX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mwtinfG1F7f6B+PqVVOiIBuP7C73v64L4DWmefHlq2I=; b=ehovhVsXZlTG
 RZXqy3fwpzNavH6PWM70eUo8C7Beqfh2bX91LSWrqBj+41V3vqTHcCZ/EjsF8S2sbIScShABefIJZ
 kFIn3+EgUVD9Cxp0CKVCl6xT+I43ZiAQOZBdUoO+WGY7AKtXjSWouWl40aEmE6UwiO19YRsZF7AYL
 TJ/Fo=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRd-0007Ck-7N; Wed, 19 Jun 2019 12:12:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id B2C72440049; Wed, 19 Jun 2019 13:12:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190618181539.9169-2-yung-chuan.liao@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121204.B2C72440049@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:04 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, Mark Brown <broonie@kernel.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
Subject: [alsa-devel] Applied "ASoC: Intel: sof-rt5682: correct naming for
	dmic16k" to the asoc tree
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

   ASoC: Intel: sof-rt5682: correct naming for dmic16k

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e711223ad35b326a597ebd3a6acc8276fd38e25c Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Wed, 19 Jun 2019 02:15:39 +0800
Subject: [PATCH] ASoC: Intel: sof-rt5682: correct naming for dmic16k

Change the link name to be "dmic16k", the cpu_dai_name to be "DMIC16k
Pin", to be aligned with other machine drivers.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 37 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f3d481b75b15..64db00353e18 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -377,7 +377,7 @@ static struct snd_soc_dai_link_component max98357a_component[] = {
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int ssp_amp,
-							  int dmic_num,
+							  int dmic_be_num,
 							  int hdmi_num)
 {
 	struct snd_soc_dai_link_component *idisp_components;
@@ -437,20 +437,23 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	id++;
 
 	/* dmic */
-	for (i = 1; i <= dmic_num; i++) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-						"dmic%02d", i);
-		if (!links[id].name)
-			goto devm_err;
+	if (dmic_be_num > 0) {
+		/* at least we have dmic01 */
+		links[id].name = "dmic01";
+		links[id].cpus = &cpus[id];
+		links[id].cpus->dai_name = "DMIC01 Pin";
+		if (dmic_be_num > 1) {
+			/* set up 2 BE links at most */
+			links[id + 1].name = "dmic16k";
+			links[id + 1].cpus = &cpus[id + 1];
+			links[id + 1].cpus->dai_name = "DMIC16k Pin";
+			dmic_be_num = 2;
+		}
+	}
 
+	for (i = 0; i < dmic_be_num; i++) {
 		links[id].id = id;
-		links[id].cpus = &cpus[id];
 		links[id].num_cpus = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "DMIC%02d Pin", i);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-
 		links[id].codecs = dmic_component;
 		links[id].num_codecs = ARRAY_SIZE(dmic_component);
 		links[id].platforms = platform_component;
@@ -545,7 +548,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_links;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
-	int dmic_num, hdmi_num;
+	int dmic_be_num, hdmi_num;
 	int ret, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
@@ -554,14 +557,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		is_legacy_cpu = 1;
-		dmic_num = 0;
+		dmic_be_num = 0;
 		hdmi_num = 0;
 		/* default quirk for legacy cpu */
 		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 						SOF_RT5682_MCLK_BYTCHT_EN |
 						SOF_RT5682_SSP_CODEC(2);
 	} else {
-		dmic_num = 1;
+		dmic_be_num = 2;
 		hdmi_num = 3;
 	}
 
@@ -586,13 +589,13 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
-	sof_audio_card_rt5682.num_links = 1 + dmic_num + hdmi_num;
+	sof_audio_card_rt5682.num_links = 1 + dmic_be_num + hdmi_num;
 
 	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
 		sof_audio_card_rt5682.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
-					      dmic_num, hdmi_num);
+					      dmic_be_num, hdmi_num);
 	if (!dai_links)
 		return -ENOMEM;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
