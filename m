Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9C239CC02
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 03:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 419A11729;
	Sun,  6 Jun 2021 03:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 419A11729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622941393;
	bh=MwgftswHx1PJUrRHTjjoiyoBwjgCbPB2dTlaJtZqSeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itrXaufjhf0ddghvsUdiZsttX9f/ZVv8UhzE2Grx3DsobF1nGdPGF+Ppgvb1AFicW
	 iJXmYuW+A2imys6RkOEiwsheVEMPbHC+gVCuGvwZ2nnYaDT+jAMI+02up9Uw8FUxLg
	 J6ARDA/ZMi84/J0vX86eOBdhtVahhMGlKIfhG1aQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BCE2F80269;
	Sun,  6 Jun 2021 03:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC27DF802E7; Sun,  6 Jun 2021 03:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A4FF800FF
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 03:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A4FF800FF
IronPort-SDR: MbaKH8nj509YfTM+bialUoK3MRvTMvsiTDKa05LI9uuBP9hwN78nhTTl+K+5E8P2xt/8lRfMPP
 ovnxOiKJN8Cw==
X-IronPort-AV: E=McAfee;i="6200,9189,10006"; a="268330989"
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="268330989"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 18:01:22 -0700
IronPort-SDR: y77Ereashd6AfDhFFHiBET8KVca0mwnmrR2S2sH1ZOwR6dBkXudP2gY5NNu+LGadVyqwv+Bu31
 FHygSxpN6sOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="412724639"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.32])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2021 18:01:18 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: sof_cs42l42: support JSL DAI link sequence
Date: Sun,  6 Jun 2021 08:40:59 +0800
Message-Id: <20210606004102.26190-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606004102.26190-1-brent.lu@intel.com>
References: <20210606004102.26190-1-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Dharageswari R <dharageswari.r@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Brent Lu <brent.lu@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org
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

The backend DAI link sequence of GLK platform is different from the
sequence of other platforms. We refactor the sof_card_dai_links_create()
function to support both style.

GLK: SPK - HP - DMIC - HDMI
Other: HP - DMIC - HDMI - SPK

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 318 ++++++++++++++++++---------
 1 file changed, 208 insertions(+), 110 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 8919d3ba3c89..e3171242f612 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -259,133 +259,166 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
-							  int ssp_codec,
-							  int ssp_amp,
-							  int dmic_be_num,
-							  int hdmi_num)
+static int create_spk_amp_dai_links(struct device *dev,
+				    struct snd_soc_dai_link *links,
+				    struct snd_soc_dai_link_component *cpus,
+				    int *id, int ssp_amp)
 {
-	struct snd_soc_dai_link_component *idisp_components;
-	struct snd_soc_dai_link_component *cpus;
-	struct snd_soc_dai_link *links;
-	int i, id = 0;
-
-	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
-			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
-	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
-			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
-	if (!links || !cpus)
-		goto devm_err;
+	int ret = 0;
 
 	/* speaker amp */
-	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-						"SSP%d-Codec", ssp_amp);
-		if (!links[id].name)
-			goto devm_err;
+	if (!(sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT))
+		return 0;
 
-		links[id].id = id;
+	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
+					 ssp_amp);
+	if (!links[*id].name) {
+		ret = -ENOMEM;
+		goto devm_err;
+	}
 
-		if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
-			max_98357a_dai_link(&links[id]);
-		} else {
-			dev_err(dev, "no amp defined\n");
-			goto devm_err;
-		}
+	links[*id].id = *id;
 
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		links[id].no_pcm = 1;
-		links[id].cpus = &cpus[id];
-		links[id].num_cpus = 1;
-
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SSP%d Pin",
-							  ssp_amp);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
+	if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
+		max_98357a_dai_link(&links[*id]);
+	} else {
+		dev_err(dev, "no amp defined\n");
+		ret = -EINVAL;
+		goto devm_err;
+	}
 
-		id++;
+	links[*id].platforms = platform_component;
+	links[*id].num_platforms = ARRAY_SIZE(platform_component);
+	links[*id].dpcm_playback = 1;
+	links[*id].no_pcm = 1;
+	links[*id].cpus = &cpus[*id];
+	links[*id].num_cpus = 1;
+
+	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+						   "SSP%d Pin", ssp_amp);
+	if (!links[*id].cpus->dai_name) {
+		ret = -ENOMEM;
+		goto devm_err;
 	}
 
+	(*id)++;
+
+devm_err:
+	return ret;
+}
+
+static int create_hp_codec_dai_links(struct device *dev,
+				     struct snd_soc_dai_link *links,
+				     struct snd_soc_dai_link_component *cpus,
+				     int *id, int ssp_codec)
+{
 	/* codec SSP */
-	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-					"SSP%d-Codec", ssp_codec);
-	if (!links[id].name)
+	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
+					 ssp_codec);
+	if (!links[*id].name)
 		goto devm_err;
 
-	links[id].id = id;
-	links[id].codecs = cs42l42_component;
-	links[id].num_codecs = ARRAY_SIZE(cs42l42_component);
-	links[id].platforms = platform_component;
-	links[id].num_platforms = ARRAY_SIZE(platform_component);
-	links[id].init = sof_cs42l42_init;
-	links[id].exit = sof_cs42l42_exit;
-	links[id].ops = &sof_cs42l42_ops;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
-	links[id].no_pcm = 1;
-	links[id].cpus = &cpus[id];
-	links[id].num_cpus = 1;
-
-	links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						  "SSP%d Pin",
-						  ssp_codec);
-	if (!links[id].cpus->dai_name)
+	links[*id].id = *id;
+	links[*id].codecs = cs42l42_component;
+	links[*id].num_codecs = ARRAY_SIZE(cs42l42_component);
+	links[*id].platforms = platform_component;
+	links[*id].num_platforms = ARRAY_SIZE(platform_component);
+	links[*id].init = sof_cs42l42_init;
+	links[*id].exit = sof_cs42l42_exit;
+	links[*id].ops = &sof_cs42l42_ops;
+	links[*id].dpcm_playback = 1;
+	links[*id].dpcm_capture = 1;
+	links[*id].no_pcm = 1;
+	links[*id].cpus = &cpus[*id];
+	links[*id].num_cpus = 1;
+
+	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+						   "SSP%d Pin",
+						   ssp_codec);
+	if (!links[*id].cpus->dai_name)
 		goto devm_err;
 
-	id++;
+	(*id)++;
+
+	return 0;
+
+devm_err:
+	return -ENOMEM;
+}
+
+static int create_dmic_dai_links(struct device *dev,
+				 struct snd_soc_dai_link *links,
+				 struct snd_soc_dai_link_component *cpus,
+				 int *id, int dmic_be_num)
+{
+	int i;
 
 	/* dmic */
-	if (dmic_be_num > 0) {
-		/* at least we have dmic01 */
-		links[id].name = "dmic01";
-		links[id].cpus = &cpus[id];
-		links[id].cpus->dai_name = "DMIC01 Pin";
-		links[id].init = dmic_init;
-		if (dmic_be_num > 1) {
-			/* set up 2 BE links at most */
-			links[id + 1].name = "dmic16k";
-			links[id + 1].cpus = &cpus[id + 1];
-			links[id + 1].cpus->dai_name = "DMIC16k Pin";
-			dmic_be_num = 2;
-		}
+	if (dmic_be_num <= 0)
+		return 0;
+
+	/* at least we have dmic01 */
+	links[*id].name = "dmic01";
+	links[*id].cpus = &cpus[*id];
+	links[*id].cpus->dai_name = "DMIC01 Pin";
+	links[*id].init = dmic_init;
+	if (dmic_be_num > 1) {
+		/* set up 2 BE links at most */
+		links[*id + 1].name = "dmic16k";
+		links[*id + 1].cpus = &cpus[*id + 1];
+		links[*id + 1].cpus->dai_name = "DMIC16k Pin";
+		dmic_be_num = 2;
 	}
 
 	for (i = 0; i < dmic_be_num; i++) {
-		links[id].id = id;
-		links[id].num_cpus = 1;
-		links[id].codecs = dmic_component;
-		links[id].num_codecs = ARRAY_SIZE(dmic_component);
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
-		links[id].no_pcm = 1;
-		id++;
+		links[*id].id = *id;
+		links[*id].num_cpus = 1;
+		links[*id].codecs = dmic_component;
+		links[*id].num_codecs = ARRAY_SIZE(dmic_component);
+		links[*id].platforms = platform_component;
+		links[*id].num_platforms = ARRAY_SIZE(platform_component);
+		links[*id].ignore_suspend = 1;
+		links[*id].dpcm_capture = 1;
+		links[*id].no_pcm = 1;
+
+		(*id)++;
 	}
 
+	return 0;
+}
+
+static int create_hdmi_dai_links(struct device *dev,
+				 struct snd_soc_dai_link *links,
+				 struct snd_soc_dai_link_component *cpus,
+				 int *id, int hdmi_num)
+{
+	struct snd_soc_dai_link_component *idisp_components;
+	int i;
+
 	/* HDMI */
-	if (hdmi_num > 0) {
-		idisp_components = devm_kzalloc(dev,
-						sizeof(struct snd_soc_dai_link_component) *
-						hdmi_num, GFP_KERNEL);
-		if (!idisp_components)
-			goto devm_err;
-	}
+	if (hdmi_num <= 0)
+		return 0;
+
+	idisp_components = devm_kzalloc(dev,
+					sizeof(struct snd_soc_dai_link_component) *
+					hdmi_num, GFP_KERNEL);
+	if (!idisp_components)
+		goto devm_err;
+
 	for (i = 1; i <= hdmi_num; i++) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-						"iDisp%d", i);
-		if (!links[id].name)
+		links[*id].name = devm_kasprintf(dev, GFP_KERNEL,
+						 "iDisp%d", i);
+		if (!links[*id].name)
 			goto devm_err;
 
-		links[id].id = id;
-		links[id].cpus = &cpus[id];
-		links[id].num_cpus = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "iDisp%d Pin", i);
-		if (!links[id].cpus->dai_name)
+		links[*id].id = *id;
+		links[*id].cpus = &cpus[*id];
+		links[*id].num_cpus = 1;
+		links[*id].cpus->dai_name = devm_kasprintf(dev,
+							   GFP_KERNEL,
+							   "iDisp%d Pin",
+							   i);
+		if (!links[*id].cpus->dai_name)
 			goto devm_err;
 
 		idisp_components[i - 1].name = "ehdaudio0D2";
@@ -396,14 +429,79 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		if (!idisp_components[i - 1].dai_name)
 			goto devm_err;
 
-		links[id].codecs = &idisp_components[i - 1];
-		links[id].num_codecs = 1;
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
-		links[id].no_pcm = 1;
-		id++;
+		links[*id].codecs = &idisp_components[i - 1];
+		links[*id].num_codecs = 1;
+		links[*id].platforms = platform_component;
+		links[*id].num_platforms = ARRAY_SIZE(platform_component);
+		links[*id].init = sof_hdmi_init;
+		links[*id].dpcm_playback = 1;
+		links[*id].no_pcm = 1;
+
+		(*id)++;
+	}
+
+	return 0;
+
+devm_err:
+	return -ENOMEM;
+}
+
+static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
+							  int ssp_codec,
+							  int ssp_amp,
+							  int dmic_be_num,
+							  int hdmi_num)
+{
+	struct snd_soc_dai_link_component *cpus;
+	struct snd_soc_dai_link *links;
+	int ret, id = 0;
+
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
+			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
+			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
+	if (!links || !cpus)
+		goto devm_err;
+
+	if (soc_intel_is_glk()) {
+		/* gemini lake starts from spk link */
+		ret = create_spk_amp_dai_links(dev, links, cpus, &id, ssp_amp);
+		if (ret < 0) {
+			dev_err(dev, "fail to create spk amp dai links, ret %d\n",
+				ret);
+			goto devm_err;
+		}
+	}
+
+	ret = create_hp_codec_dai_links(dev, links, cpus, &id, ssp_codec);
+	if (ret < 0) {
+		dev_err(dev, "fail to create hp codec dai links, ret %d\n",
+			ret);
+		goto devm_err;
+	}
+
+	ret = create_dmic_dai_links(dev, links, cpus, &id, dmic_be_num);
+	if (ret < 0) {
+		dev_err(dev, "fail to create dmic dai links, ret %d\n",
+			ret);
+		goto devm_err;
+	}
+
+	ret = create_hdmi_dai_links(dev, links, cpus, &id, hdmi_num);
+	if (ret < 0) {
+		dev_err(dev, "fail to create hdmi dai links, ret %d\n",
+			ret);
+		goto devm_err;
+	}
+
+	if (!soc_intel_is_glk()) {
+		/* other platforms end with spk link */
+		ret = create_spk_amp_dai_links(dev, links, cpus, &id, ssp_amp);
+		if (ret < 0) {
+			dev_err(dev, "fail to create spk amp dai links, ret %d\n",
+				ret);
+			goto devm_err;
+		}
 	}
 
 	return links;
-- 
2.17.1

