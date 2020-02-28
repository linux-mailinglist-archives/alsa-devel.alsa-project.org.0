Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E60A1742E1
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 00:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB33916E5;
	Sat, 29 Feb 2020 00:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB33916E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582931791;
	bh=eEwGmURSmSxCqSrnAr4E0ZJn3jbSB1T6kGlY7eg0+4E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odc2X/3oqhlCa99eMkzySmLoEB9ph4cYQQMQ6AVJdNg9/T0hJkY1f1eJAGm8N/vo5
	 wjggco3UTLfNy6nnc4rNMit0cNsdRnF/EJUe5f5Hzpjew49Gtd8WbAFtIR9ULrQI+n
	 69mBko60PX7AbqzwN01FiJom3j4HzedZVwpG2KXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52B67F80290;
	Sat, 29 Feb 2020 00:12:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CF83F80213; Sat, 29 Feb 2020 00:12:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F38F8014E
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 00:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F38F8014E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 15:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="232402947"
Received: from rbconrad-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.95.100])
 by orsmga008.jf.intel.com with ESMTP; 28 Feb 2020 15:12:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/9] ASoC: Intel: sof_pcm512x: make HDMI optional for all
 platforms
Date: Fri, 28 Feb 2020 17:11:58 -0600
Message-Id: <20200228231204.9026-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
References: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Make HDMI optional for APL and later platforms. If no HDMI codec
is found on the HDA bus, the graphics side driver is missing or
correct codec driver is not part of kernel build, codec_mask
reflects this and HDMI is disabled. The DSP topology will still
have the links for HDMI, so connect these to dummy codec to avoid
failures in topology loading.

This change also fixes a kernel oops that was triggered if
sof_pcm512x was used with SOF configured to use hdac-hdmi (can be
done via "use_common_hdmi=0" or by selecting
CONFIG_SND_SOC_SOF_HDA_COMMON_HDMI_CODEC=n). This is not a supported
configuration.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_pcm512x.c | 38 +++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 626153bd71e7..4ce707b6eb79 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -27,6 +27,8 @@
 #define SOF_PCM512X_SSP_CODEC(quirk)		((quirk) & GENMASK(3, 0))
 #define SOF_PCM512X_SSP_CODEC_MASK			(GENMASK(3, 0))
 
+#define IDISP_CODEC_MASK	0x4
+
 /* Default: SSP5 */
 static unsigned long sof_pcm512x_quirk = SOF_PCM512X_SSP_CODEC(5);
 
@@ -40,6 +42,7 @@ struct sof_hdmi_pcm {
 
 struct sof_card_private {
 	struct list_head hdmi_pcm_list;
+	bool idisp_codec;
 };
 
 static int sof_pcm512x_quirk_cb(const struct dmi_system_id *id)
@@ -136,6 +139,9 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	if (list_empty(&ctx->hdmi_pcm_list))
 		return -EINVAL;
 
+	if (!ctx->idisp_codec)
+		return 0;
+
 	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
 
 	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
@@ -214,7 +220,8 @@ SND_SOC_DAILINK_DEF(dmic_component,
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int dmic_be_num,
-							  int hdmi_num)
+							  int hdmi_num,
+							  bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
@@ -316,11 +323,19 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		if (!links[id].cpus->dai_name)
 			goto devm_err;
 
-		idisp_components[i - 1].name = "ehdaudio0D2";
-		idisp_components[i - 1].dai_name = devm_kasprintf(dev,
-								  GFP_KERNEL,
-								  "intel-hdmi-hifi%d",
-								  i);
+		/*
+		 * topology cannot be loaded if codec is missing, so
+		 * use the dummy codec if needed
+		 */
+		if (idisp_codec) {
+			idisp_components[i - 1].name = "ehdaudio0D2";
+			idisp_components[i - 1].dai_name =
+				devm_kasprintf(dev, GFP_KERNEL,
+					       "intel-hdmi-hifi%d", i);
+		} else {
+			idisp_components[i - 1].name = "snd-soc-dummy";
+			idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+		}
 		if (!idisp_components[i - 1].dai_name)
 			goto devm_err;
 
@@ -341,8 +356,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 static int sof_audio_probe(struct platform_device *pdev)
 {
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
-	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num, hdmi_num;
 	int ret, ssp_codec;
@@ -360,6 +375,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 	} else {
 		dmic_be_num = 2;
 #if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
+		if (mach->mach_params.common_hdmi_codec_drv &&
+		    (mach->mach_params.codec_mask & IDISP_CODEC_MASK))
+			ctx->idisp_codec = true;
+
+		/* links are always present in topology */
 		hdmi_num = 3;
 #endif
 	}
@@ -374,7 +394,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 	sof_audio_card_pcm512x.num_links = 1 + dmic_be_num + hdmi_num;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec,
-					      dmic_be_num, hdmi_num);
+					      dmic_be_num, hdmi_num,
+					      ctx->idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -383,7 +404,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	sof_audio_card_pcm512x.dev = &pdev->dev;
-	mach = (&pdev->dev)->platform_data;
 
 	/* set platform name for each dailink */
 	ret = snd_soc_fixup_dai_links_platform_name(&sof_audio_card_pcm512x,
-- 
2.20.1

