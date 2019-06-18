Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F664B203
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 08:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709EF16B5;
	Wed, 19 Jun 2019 08:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709EF16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560925046;
	bh=o+mqoEtYxvohB6+CI1m6t06dGanHuwSDLKzYWfxnaAA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uM/Jse8XjzM3MMo66oe6HYruXXw0PN+oWW9x9Wc4jGyh7gRK/XaY1ZBBinIgZi/ZT
	 UFHh45mIirAsJ4rhmUqqjVu5e2ONdNz+Ap/Rh2Mzr0hPjxgCqlorh0ZqFYMLLhILkG
	 +8WCfvLabwj26IEHGIWN/7XjtYK+RtSLC+zjPfMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0ECF896F9;
	Wed, 19 Jun 2019 08:16:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 155FAF896F9; Wed, 19 Jun 2019 08:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED08BF80CC4
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 08:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED08BF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 23:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="150514307"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga007.jf.intel.com with ESMTP; 18 Jun 2019 23:14:21 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org
Date: Wed, 19 Jun 2019 02:15:39 +0800
Message-Id: <20190618181539.9169-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618181539.9169-1-yung-chuan.liao@linux.intel.com>
References: <20190618181539.9169-1-yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH v2 2/2] ASoC: Intel: sof-rt5682: correct naming
	for dmic16k
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

From: Keyon Jie <yang.jie@linux.intel.com>

Change the link name to be "dmic16k", the cpu_dai_name to be "DMIC16k
Pin", to be aligned with other machine drivers.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
---
links[id].cpus = &cpus[id]; was missing on the first version
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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
