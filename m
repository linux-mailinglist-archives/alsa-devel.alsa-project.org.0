Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD23C6505
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 22:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5601F16B2;
	Mon, 12 Jul 2021 22:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5601F16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626122086;
	bh=0smptqcFaI1fBgkmMr+AJvCSM6YjK3SRvdVCz59kAk4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qqSUciw/1UyBal6O/k6nArap8XZ5+smTmGivfSfM+tHE/7zR+grh+hysTxhucmF83
	 GROJMwfzq1whWQvm/p2cn5ANhV8TUx6F/IvIrJyyAMXNS/l7JRI0NUGZWvl1x89/12
	 wo5fPpxoUJIvTDlap88yF9ANqon3fa+iLYQ57zwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 706FAF804E1;
	Mon, 12 Jul 2021 22:33:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7243CF804E1; Mon, 12 Jul 2021 22:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28CFEF80083
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 22:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28CFEF80083
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190431639"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="190431639"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="561880762"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.95.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: Intel: sof_cs42l42: support arbitrary DAI link
 sequence
Date: Mon, 12 Jul 2021 15:32:34 -0500
Message-Id: <20210712203240.46960-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
References: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Currently there are two types of DAI Link sequences defined in
topology files, one starts from speaker link and the other starts from
headphone link.

Type 1: SPK - HP - DMIC - HDMI
Type 2: HP - DMIC - HDMI - SPK

Here we add a macro SOF_CS42L42_DAILINK to define the DAI Link
sequence in quirk and refactor the sof_card_dai_links_create()
function to support arbitrary DAI Link sequence.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 342 ++++++++++++++++++---------
 1 file changed, 230 insertions(+), 112 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 2b16011b7a06..4cd8be177db1 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -37,7 +37,19 @@
 #define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
 #define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
 	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
-#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(10)
+#define SOF_CS42L42_DAILINK_SHIFT		10
+#define SOF_CS42L42_DAILINK_MASK		(GENMASK(24, 10))
+#define SOF_CS42L42_DAILINK(link1, link2, link3, link4, link5) \
+	((((link1) | ((link2) << 3) | ((link3) << 6) | ((link4) << 9) | ((link5) << 12)) << SOF_CS42L42_DAILINK_SHIFT) & SOF_CS42L42_DAILINK_MASK)
+#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(25)
+
+enum {
+	LINK_NONE = 0,
+	LINK_HP = 1,
+	LINK_SPK = 2,
+	LINK_DMIC = 3,
+	LINK_HDMI = 4,
+};
 
 /* Default: SSP2 */
 static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
@@ -265,133 +277,166 @@ static struct snd_soc_dai_link_component dmic_component[] = {
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
@@ -402,14 +447,86 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
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
+	int ret, id = 0, link_seq;
+
+	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
+			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component) *
+			     sof_audio_card_cs42l42.num_links, GFP_KERNEL);
+	if (!links || !cpus)
+		goto devm_err;
+
+	link_seq = (sof_cs42l42_quirk & SOF_CS42L42_DAILINK_MASK) >> SOF_CS42L42_DAILINK_SHIFT;
+
+	while (link_seq) {
+		int link_type = link_seq & 0x07;
+
+		switch (link_type) {
+		case LINK_HP:
+			ret = create_hp_codec_dai_links(dev, links, cpus, &id, ssp_codec);
+			if (ret < 0) {
+				dev_err(dev, "fail to create hp codec dai links, ret %d\n",
+					ret);
+				goto devm_err;
+			}
+			break;
+		case LINK_SPK:
+			ret = create_spk_amp_dai_links(dev, links, cpus, &id, ssp_amp);
+			if (ret < 0) {
+				dev_err(dev, "fail to create spk amp dai links, ret %d\n",
+					ret);
+				goto devm_err;
+			}
+			break;
+		case LINK_DMIC:
+			ret = create_dmic_dai_links(dev, links, cpus, &id, dmic_be_num);
+			if (ret < 0) {
+				dev_err(dev, "fail to create dmic dai links, ret %d\n",
+					ret);
+				goto devm_err;
+			}
+			break;
+		case LINK_HDMI:
+			ret = create_hdmi_dai_links(dev, links, cpus, &id, hdmi_num);
+			if (ret < 0) {
+				dev_err(dev, "fail to create hdmi dai links, ret %d\n",
+					ret);
+				goto devm_err;
+			}
+			break;
+		case LINK_NONE:
+			/* caught here if it's not used as terminator in macro */
+		default:
+			dev_err(dev, "invalid link type %d\n", link_type);
+			goto devm_err;
+		}
+
+		link_seq >>= 3;
 	}
 
 	return links;
@@ -490,7 +607,8 @@ static const struct platform_device_id board_ids[] = {
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(2) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_MAX98357A_SPEAKER_AMP_PRESENT |
-					SOF_CS42L42_SSP_AMP(1)),
+					SOF_CS42L42_SSP_AMP(1)) |
+					SOF_CS42L42_DAILINK(LINK_SPK, LINK_HP, LINK_DMIC, LINK_HDMI, LINK_NONE),
 	},
 	{ }
 };
-- 
2.25.1

