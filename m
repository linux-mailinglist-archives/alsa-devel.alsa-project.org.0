Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 297552752FA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 10:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE1CA1711;
	Wed, 23 Sep 2020 10:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE1CA1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600848680;
	bh=zQfnXtaOnIzE6Ta0kgHnKEz+vPT8UZh0ZSU7T2H7yFw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lyThx1/UcfFT+0HvHaDzx5ZZFNkFPgur9o1QGyHraFzod8Rx9b3uycSZvAQgSjlV+
	 7aKva1i9hMY8q7aIsw3IesIzSqRrgthMYcFInq8taKjqzy4SVKfnY5cWcqYSDqJc79
	 GoOqU/bCodEaRB8vrvjkXnaqATLoSVKMUM+6MKsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52EE5F802EC;
	Wed, 23 Sep 2020 10:07:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29C4CF802E9; Wed, 23 Sep 2020 10:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 094A6F8028D
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 10:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 094A6F8028D
IronPort-SDR: BNB6wkqaPA+e5CvWrM9mJNqJAQEL3eu2GxhEeODm3iBC8AJctlP/+/pfp/uLSrCZOmFJzh8sWl
 qXFn2pnvlIFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="158178510"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="158178510"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 01:07:10 -0700
IronPort-SDR: xl9bwaQKhYadSTekIeFm6L5MuUNR/FuJo2xEZGRXd+vMMO+1nmIVrVp9WXtSsgWkcBBdSIFpNR
 i7IoJBpH9i/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="335371244"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 01:07:08 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/6] ASoC: Intel: sof_sdw: remove hard-coded codec_conf table
Date: Wed, 23 Sep 2020 11:05:12 +0300
Message-Id: <20200923080514.3242858-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
References: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Now that the ACPI machine params provide all the information needed,
allocate the card codec_conf dynamically and set .dlc and
.prefix_name.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 149 +++++++++++++++----------------
 1 file changed, 73 insertions(+), 76 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4b1cd3011d37..8e191a8d5dc5 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -136,75 +136,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 	{}
 };
 
-static struct snd_soc_codec_conf codec_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF("sdw:0:25d:711:0"),
-		.name_prefix = "rt711",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:0:25d:711:1"),
-		.name_prefix = "rt711",
-	},
-	/* rt1308 w/ I2S connection */
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1308:00"),
-		.name_prefix = "rt1308-1",
-	},
-	/* rt1308 left on link 1 */
-	{
-		.dlc = COMP_CODEC_CONF("sdw:1:25d:1308:0"),
-		.name_prefix = "rt1308-1",
-	},
-	/* two 1308s on link1 with different unique id */
-	{
-		.dlc = COMP_CODEC_CONF("sdw:1:25d:1308:0:0"),
-		.name_prefix = "rt1308-1",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:1:25d:1308:0:2"),
-		.name_prefix = "rt1308-2",
-	},
-	/* rt1308 right on link 2 */
-	{
-		.dlc = COMP_CODEC_CONF("sdw:2:25d:1308:0"),
-		.name_prefix = "rt1308-2",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:3:25d:715:0"),
-		.name_prefix = "rt715",
-	},
-	/* two MAX98373s on link1 with different unique id */
-	{
-		.dlc = COMP_CODEC_CONF("sdw:1:19f:8373:0:3"),
-		.name_prefix = "Right",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:1:19f:8373:0:7"),
-		.name_prefix = "Left",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:0:25d:5682:0"),
-		.name_prefix = "rt5682",
-	},
-	/* rt5682 on link2 */
-	{
-		.dlc = COMP_CODEC_CONF("sdw:2:25d:5682:0"),
-		.name_prefix = "rt5682",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:1:25d:1316:1"),
-		.name_prefix = "rt1316-1",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:2:25d:1316:1"),
-		.name_prefix = "rt1316-2",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("sdw:3:25d:714:1"),
-		.name_prefix = "rt714",
-	},
-};
-
 static struct snd_soc_dai_link_component dmic_component[] = {
 	{
 		.name = "dmic-codec",
@@ -538,10 +469,19 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *link,
 static int create_codec_dai_name(struct device *dev,
 				 const struct snd_soc_acpi_link_adr *link,
 				 struct snd_soc_dai_link_component *codec,
-				 int offset)
+				 int offset,
+				 struct snd_soc_codec_conf *codec_conf,
+				 int codec_count,
+				 int *codec_conf_index)
 {
 	int i;
 
+	/* sanity check */
+	if (*codec_conf_index + link->num_adr > codec_count) {
+		dev_err(dev, "codec_conf: out-of-bounds access requested\n");
+		return -EINVAL;
+	}
+
 	for (i = 0; i < link->num_adr; i++) {
 		unsigned int sdw_version, unique_id, mfg_id;
 		unsigned int link_id, part_id, class_id;
@@ -583,6 +523,11 @@ static int create_codec_dai_name(struct device *dev,
 
 		codec[comp_index].dai_name =
 			codec_info_list[codec_index].dai_name;
+
+		codec_conf[*codec_conf_index].dlc = codec[comp_index];
+		codec_conf[*codec_conf_index].name_prefix = link->adr_d[i].name_prefix;
+
+		++*codec_conf_index;
 	}
 
 	return 0;
@@ -701,7 +646,10 @@ static int create_sdw_dailink(struct device *dev, int *be_index,
 			      int sdw_be_num, int sdw_cpu_dai_num,
 			      struct snd_soc_dai_link_component *cpus,
 			      const struct snd_soc_acpi_link_adr *link,
-			      int *cpu_id, bool *group_generated)
+			      int *cpu_id, bool *group_generated,
+			      struct snd_soc_codec_conf *codec_conf,
+			      int codec_count,
+			      int *codec_conf_index)
 {
 	const struct snd_soc_acpi_link_adr *link_next;
 	struct snd_soc_dai_link_component *codecs;
@@ -739,7 +687,8 @@ static int create_sdw_dailink(struct device *dev, int *be_index,
 		if (cpu_dai_id[i] != ffs(link_next->mask) - 1)
 			continue;
 
-		ret = create_codec_dai_name(dev, link_next, codecs, codec_idx);
+		ret = create_codec_dai_name(dev, link_next, codecs, codec_idx,
+					    codec_conf, codec_count, codec_conf_index);
 		if (ret < 0)
 			return ret;
 
@@ -836,6 +785,42 @@ static inline int get_next_be_id(struct snd_soc_dai_link *links,
 
 #define IDISP_CODEC_MASK	0x4
 
+static int sof_card_codec_conf_alloc(struct device *dev,
+				     struct snd_soc_acpi_mach_params *mach_params,
+				     struct snd_soc_codec_conf **codec_conf,
+				     int *codec_conf_count)
+{
+	const struct snd_soc_acpi_link_adr *adr_link;
+	struct snd_soc_codec_conf *c_conf;
+	int num_codecs = 0;
+	int i;
+
+	adr_link = mach_params->links;
+	if (!adr_link)
+		return -EINVAL;
+
+	/* generate DAI links by each sdw link */
+	for (; adr_link->num_adr; adr_link++) {
+		for (i = 0; i < adr_link->num_adr; i++) {
+			if (!adr_link->adr_d[i].name_prefix) {
+				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
+					adr_link->adr_d[i].adr);
+				return -EINVAL;
+			}
+		}
+		num_codecs += adr_link->num_adr;
+	}
+
+	c_conf = devm_kzalloc(dev, num_codecs * sizeof(*c_conf), GFP_KERNEL);
+	if (!c_conf)
+		return -ENOMEM;
+
+	*codec_conf = c_conf;
+	*codec_conf_count = num_codecs;
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct device *dev,
 				     struct snd_soc_acpi_mach *mach,
 				     struct snd_soc_card *card)
@@ -847,6 +832,9 @@ static int sof_card_dai_links_create(struct device *dev,
 	struct snd_soc_acpi_mach_params *mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct snd_soc_dai_link_component *cpus;
+	struct snd_soc_codec_conf *codec_conf;
+	int codec_conf_count;
+	int codec_conf_index = 0;
 	bool group_generated[SDW_MAX_GROUPS];
 	int ssp_codec_index, ssp_mask;
 	struct snd_soc_dai_link *links;
@@ -859,6 +847,13 @@ static int sof_card_dai_links_create(struct device *dev,
 	int comp_num;
 	int ret;
 
+	mach_params = &mach->mach_params;
+
+	/* allocate codec conf, will be populated when dailinks are created */
+	ret = sof_card_codec_conf_alloc(dev, mach_params, &codec_conf, &codec_conf_count);
+	if (ret < 0)
+		return ret;
+
 	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
@@ -879,7 +874,6 @@ static int sof_card_dai_links_create(struct device *dev,
 	ssp_num = ssp_codec_index >= 0 ? hweight_long(ssp_mask) : 0;
 	comp_num = hdmi_num + ssp_num;
 
-	mach_params = &mach->mach_params;
 	ret = get_sdw_dailink_info(mach_params->links,
 				   &sdw_be_num, &sdw_cpu_dai_num);
 	if (ret < 0) {
@@ -943,7 +937,9 @@ static int sof_card_dai_links_create(struct device *dev,
 
 		ret = create_sdw_dailink(dev, &be_id, links, sdw_be_num,
 					 sdw_cpu_dai_num, cpus, adr_link,
-					 &cpu_id, group_generated);
+					 &cpu_id, group_generated,
+					 codec_conf, codec_conf_count,
+					 &codec_conf_index);
 		if (ret < 0) {
 			dev_err(dev, "failed to create dai link %d", be_id);
 			return -ENOMEM;
@@ -1074,6 +1070,9 @@ static int sof_card_dai_links_create(struct device *dev,
 	card->dai_link = links;
 	card->num_links = num_links;
 
+	card->codec_conf = codec_conf;
+	card->num_configs = codec_conf_count;
+
 	return 0;
 }
 
@@ -1100,8 +1099,6 @@ static struct snd_soc_card card_sof_sdw = {
 	.name = "soundwire",
 	.owner = THIS_MODULE,
 	.late_probe = sof_sdw_card_late_probe,
-	.codec_conf = codec_conf,
-	.num_configs = ARRAY_SIZE(codec_conf),
 };
 
 static int mc_probe(struct platform_device *pdev)
-- 
2.27.0

