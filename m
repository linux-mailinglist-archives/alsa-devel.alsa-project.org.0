Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2814A0B6
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 14:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189E916D2;
	Tue, 18 Jun 2019 14:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189E916D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560860691;
	bh=udwWbjni2JY4Wk9bZHtRoHH62lJuz3m0YRq25yOlhjA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZRG1ks8SdnQj5rWqibd1ocpKax4rA31jFzAdmT+haBASHOIhMrzc6wQ09jn/GIwb
	 /IV7YzLDax9Hc0lKsl3u3gTO/kPIC1HHjur5D99rATNp4n0ZoOQ8H3MwQXP95qct6w
	 Zxh8FMhYBXdStVvuk92oum564CFkAUPAPTEsnFis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E376CF8075C;
	Tue, 18 Jun 2019 14:22:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F03BBF896F4; Tue, 18 Jun 2019 14:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2332F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 14:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2332F89682
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 05:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,389,1557212400"; d="scan'208";a="161727614"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jun 2019 05:22:18 -0700
From: Bard liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Tue, 18 Jun 2019 08:23:36 +0800
Message-Id: <20190618002336.5734-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618002336.5734-1-yung-chuan.liao@linux.intel.com>
References: <20190618002336.5734-1-yung-chuan.liao@linux.intel.com>
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: Intel: sof-rt5682: correct naming
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
 sound/soc/intel/boards/sof_rt5682.c | 34 +++++++++++++++--------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f3d481b75b15..919cf6fafe75 100644
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
@@ -437,20 +437,22 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
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
+		links[id].cpus->dai_name = "DMIC01 Pin";
+		if (dmic_be_num > 1) {
+			/* set up 2 BE links at most */
+			links[id + 1].name = "dmic16k";
+			links[id + 1].cpus->dai_name = "DMIC16k Pin";
+			dmic_be_num = 2;
+		}
+	}
 
+	for (i = 0; i < dmic_be_num; i++) {
 		links[id].id = id;
 		links[id].cpus = &cpus[id];
 		links[id].num_cpus = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "DMIC%02d Pin", i);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-
 		links[id].codecs = dmic_component;
 		links[id].num_codecs = ARRAY_SIZE(dmic_component);
 		links[id].platforms = platform_component;
@@ -545,7 +547,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_links;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
-	int dmic_num, hdmi_num;
+	int dmic_be_num, hdmi_num;
 	int ret, ssp_amp, ssp_codec;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
@@ -554,14 +556,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 
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
 
@@ -586,13 +588,13 @@ static int sof_audio_probe(struct platform_device *pdev)
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
