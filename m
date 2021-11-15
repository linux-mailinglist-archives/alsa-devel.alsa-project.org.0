Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B79D0450466
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 13:26:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AB6916B0;
	Mon, 15 Nov 2021 13:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AB6916B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636979206;
	bh=AvrWfJg0cD2rRx5D44osZPTlxukVEALutbwAkhpa9dg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OWIGKHN0pzr2HKen0yAgXIlnDMqbVq/xh7w6rnZZB1BJGr0AwBL64TtvGhkvIdWet
	 iMOBp6nVNV+c+pjHUSkNWSZDDQuhKaBAoO17T7PszIksQJ/45UoEPU8kYtzvOqIbie
	 zpq9TdzgtSB5nkaicq8li86koonG1bFPzjzywPgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDEF8F804FB;
	Mon, 15 Nov 2021 13:23:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD0F9F80515; Mon, 15 Nov 2021 13:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 209D3F804CF
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 209D3F804CF
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220639134"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220639134"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:01 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="505899093"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 04:23:00 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RESEND PATCH 05/10] ASoC: intel: sof_sdw: Use a fixed DAI link id
 for AMP
Date: Mon, 15 Nov 2021 20:22:36 +0800
Message-Id: <20211115122241.13242-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
References: <20211115122241.13242-1-yung-chuan.liao@linux.intel.com>
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
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 26 ++++++++++++++++++++++---
 sound/soc/intel/boards/sof_sdw_common.h |  6 ++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2492cd3556a8..1be5c4754337 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -462,6 +462,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "rt700-aif1",
 		.init = sof_sdw_rt700_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
@@ -470,6 +471,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt711-sdca-aif1",
 		.init = sof_sdw_rt711_sdca_init,
 		.exit = sof_sdw_rt711_sdca_exit,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
@@ -478,6 +480,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt711-aif1",
 		.init = sof_sdw_rt711_init,
 		.exit = sof_sdw_rt711_exit,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x1308,
@@ -486,12 +489,14 @@ static struct sof_sdw_codec_info codec_info_list[] = {
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
@@ -500,6 +505,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_sdca_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
@@ -508,6 +514,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_sdca_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x714,
@@ -516,6 +523,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
@@ -524,6 +532,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ignore_pch_dmic = true,
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x8373,
@@ -531,12 +540,14 @@ static struct sof_sdw_codec_info codec_info_list[] = {
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
@@ -544,6 +555,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "sdw-mockup-aif1",
 		.init = NULL,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0xaa55, /* headset codec mockup */
@@ -551,6 +563,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "sdw-mockup-aif1",
 		.init = NULL,
+		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x55aa, /* amplifier mockup */
@@ -558,6 +571,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, false},
 		.dai_name = "sdw-mockup-aif1",
 		.init = NULL,
+		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x5555,
@@ -565,6 +579,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {false, true},
 		.dai_name = "sdw-mockup-aif1",
 		.init = sof_sdw_mic_codec_mockup_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 };
 
@@ -906,7 +921,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      const struct snd_soc_acpi_link_adr *link,
 			      int *cpu_id, bool *group_generated,
 			      struct snd_soc_codec_conf *codec_conf,
-			      int codec_count,
+			      int codec_count, int *link_id,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic)
 {
@@ -964,6 +979,11 @@ static int create_sdw_dailink(struct snd_soc_card *card,
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
@@ -1018,7 +1038,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
-		init_dai_link(dev, dai_links + *link_index, *link_index, name,
+		init_dai_link(dev, dai_links + *link_index, (*link_id)++, name,
 			      playback, capture,
 			      cpus + *cpu_id, cpu_dai_num,
 			      codecs, codec_num,
@@ -1215,7 +1235,7 @@ static int sof_card_dai_links_create(struct device *dev,
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

