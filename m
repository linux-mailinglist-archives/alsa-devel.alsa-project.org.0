Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 446BD43BFA4
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:22:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C31F116E6;
	Wed, 27 Oct 2021 04:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C31F116E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635301348;
	bh=2HYNdAvi3mhoXWxDVl9VP4ERYSagXwuAOaQfKQX3Tiw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlamJVClg2cmKnbfYS5+OUkUDLWA8prnRkvdRe3CYKsYw3b6AMq8MHv/YbH5U2ZiZ
	 b7JPcmwaTkiU4naS+dXlC2c57M5pX9sIvQ23poDADpsIYw/+Ox57GbWCeOl/C9Nb4E
	 h+4eqAfk9d1C/k9/Tz5Y4pO8A5KMyaVxjauHCiFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F875F80271;
	Wed, 27 Oct 2021 04:19:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 451BAF8032B; Wed, 27 Oct 2021 04:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86398F800FF
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86398F800FF
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217229407"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217229407"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:47 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486446290"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 05/10] ASoC: intel: sof_sdw: Use a fixed DAI link id for AMP
Date: Wed, 27 Oct 2021 10:18:19 +0800
Message-Id: <20211027021824.24776-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
References: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

Currently, we assign SoundWire DAI link id according to the order in
the link address table, with the assumption that the headset codec is
listed first, then amplifiers and last capture devices. If the headset
codec is not present in a platform, the dai link for amplifiers will be
shifted, which can be handled in two ways
a) modify the topology to renumber the dailink changes
b) keep the dailink numbers constant in topology but also avoid the
   variations in the machine driver.

This patch adds support for option b), the dailink index for amplifiers
and capture devices becomes fixed.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 26 ++++++++++++++++++++++---
 sound/soc/intel/boards/sof_sdw_common.h |  6 ++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8eccbac43306..db4f16613baf 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -393,6 +393,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "rt700-aif1",
 		.init = sof_sdw_rt700_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
@@ -401,6 +402,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt711-sdca-aif1",
 		.init = sof_sdw_rt711_sdca_init,
 		.exit = sof_sdw_rt711_sdca_exit,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
@@ -409,6 +411,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt711-aif1",
 		.init = sof_sdw_rt711_init,
 		.exit = sof_sdw_rt711_exit,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x1308,
@@ -417,12 +420,14 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt1308-aif",
 		.ops = &sof_sdw_rt1308_i2s_ops,
 		.init = sof_sdw_rt1308_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x1316,
 		.direction = {true, true},
 		.dai_name = "rt1316-aif",
 		.init = sof_sdw_rt1316_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x714,
@@ -431,6 +436,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_sdca_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
@@ -439,6 +445,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_sdca_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x714,
@@ -447,6 +454,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
@@ -455,6 +463,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x8373,
@@ -462,12 +471,14 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "max98373-aif1",
 		.init = sof_sdw_mx8373_init,
 		.codec_card_late_probe = sof_sdw_mx8373_late_probe,
+		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x5682,
 		.direction = {true, true},
 		.dai_name = "rt5682-sdw",
 		.init = sof_sdw_rt5682_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
@@ -475,6 +486,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "sdw-mockup-aif1",
 		.init = NULL,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0xaa55, /* headset codec mockup */
@@ -482,6 +494,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "sdw-mockup-aif1",
 		.init = NULL,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x55aa, /* amplifier mockup */
@@ -489,6 +502,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, false},
 		.dai_name = "sdw-mockup-aif1",
 		.init = NULL,
+		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x5555,
@@ -496,6 +510,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {false, true},
 		.dai_name = "sdw-mockup-aif1",
 		.init = sof_sdw_mic_codec_mockup_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 };
 
@@ -837,7 +852,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      const struct snd_soc_acpi_link_adr *link,
 			      int *cpu_id, bool *group_generated,
 			      struct snd_soc_codec_conf *codec_conf,
-			      int codec_count,
+			      int codec_count, int *link_id,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic)
 {
@@ -895,6 +910,11 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	if (codec_info_list[codec_index].ignore_pch_dmic)
 		*ignore_pch_dmic = true;
 
+	/* Shift the first amplifier's *link_id to SDW_AMP_DAI_ID */
+	if (codec_info_list[codec_index].codec_type == SOF_SDW_CODEC_TYPE_AMP &&
+	    *link_id < SDW_AMP_DAI_ID)
+		*link_id = SDW_AMP_DAI_ID;
+
 	cpu_dai_index = *cpu_id;
 	for_each_pcm_streams(stream) {
 		char *name, *cpu_name;
@@ -949,7 +969,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
-		init_dai_link(dev, dai_links + *link_index, *link_index, name,
+		init_dai_link(dev, dai_links + *link_index, (*link_id)++, name,
 			      playback, capture,
 			      cpus + *cpu_id, cpu_dai_num,
 			      codecs, codec_num,
@@ -1146,7 +1166,7 @@ static int sof_card_dai_links_create(struct device *dev,
 					 sdw_cpu_dai_num, cpus, adr_link,
 					 &cpu_id, group_generated,
 					 codec_conf, codec_conf_count,
-					 &codec_conf_index,
+					 &be_id, &codec_conf_index,
 					 &ignore_pch_dmic);
 		if (ret < 0) {
 			dev_err(dev, "failed to create dai link %d", link_index);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index b35f5a9b96f5..c6200aa14089 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -15,6 +15,7 @@
 
 #define MAX_NO_PROPS 2
 #define MAX_HDMI_NUM 4
+#define SDW_AMP_DAI_ID 2
 #define SDW_DMIC_DAI_ID 4
 #define SDW_MAX_CPU_DAIS 16
 #define SDW_INTEL_BIDIR_PDI_BASE 2
@@ -52,9 +53,14 @@ enum {
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 #define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(18)
 
+#define SOF_SDW_CODEC_TYPE_JACK		0
+#define SOF_SDW_CODEC_TYPE_AMP		1
+#define SOF_SDW_CODEC_TYPE_MIC		2
+
 struct sof_sdw_codec_info {
 	const int part_id;
 	const int version_id;
+	const int codec_type;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
 	const bool direction[2]; // playback & capture support
-- 
2.17.1

