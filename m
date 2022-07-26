Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA058146F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 15:47:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC35E11;
	Tue, 26 Jul 2022 15:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC35E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658843277;
	bh=ojhq/m4w8zHjOEY7DYramnZ2WBg1Hn3avY/pcVJRe+A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l7H8ltfmyfGVjtzWVdZIayK4yiHuO7Vy0hTAqa995Ijz/fFs7eshtWcHhjvmIat61
	 k/WeoQZ1WAeqBmqbG+4pmZCcn0CwDSOmwoSXWROMfwwQX/tEc31kaLy6B6Jq79voLx
	 040J+SPG4Vlngk3bfYAFfkgSMUkNQSXlHVz0zw9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B98F80238;
	Tue, 26 Jul 2022 15:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C49AF8025A; Tue, 26 Jul 2022 15:46:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6673F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 15:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6673F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YVMiMawT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q4TPHH032253;
 Tue, 26 Jul 2022 08:46:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=4HZ77gT3UYugSEYibBUwTnGXjWmBzs6W8apWPc7c5Z0=;
 b=YVMiMawTj9DjUVHXvy0UOqVxcotn4AD7IsTPhEs87H9uqPshujWfTaW/rmbZjthlQAlS
 LGLIoEgV/+Qvzh/lD6trnWBtEmLgYRxH4rt8NxShKRimSNXeLffeKdW1Nmazccl7+Z/N
 BFPCaNoYUqMCZnDnnMXfqJv57C9ibgtpWm/RLmiARLc2ufLN8TadvLeir0zzWHwFaijn
 md7YYhiyHC+1Y4SNE2aod+b7/uDT9VC1UB7cliR/GQMKiGcU6sqmLz9DLoDsI8HnA1BB
 WXgalP48EPhhNDsCK/4mIw/f84y+tFiHCh2BeElPpquSofYdai56dZncZvt6pNXocIRW MQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp3hg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 08:46:45 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 26 Jul
 2022 08:46:44 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Tue, 26 Jul 2022 08:46:44 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 05E4E2C5;
 Tue, 26 Jul 2022 13:46:44 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Brent Lu
 <brent.lu@intel.com>, xliu <xiang.liu@cirrus.com>
Subject: [PATCH v1] ASoC: Intel: cirrus-common: Use UID to map correct amp to
 prefix
Date: Tue, 26 Jul 2022 14:46:34 +0100
Message-ID: <20220726134634.2842185-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tray4QtAiO20RqjTC30X5rerLhFMTwQN
X-Proofpoint-ORIG-GUID: tray4QtAiO20RqjTC30X5rerLhFMTwQN
X-Proofpoint-Spam-Reason: safe
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

Since the order of the amps in the ACPI determines the device name,
and the ACPI order may change depending on hardware configuration,
use UID to dynamically compute the dai links, allowing dynamic
assignment of the name_prefix.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_cirrus_common.c | 73 +++++++++-------------
 1 file changed, 31 insertions(+), 42 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index f4192df962d6..a96bc70a34d7 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -10,6 +10,9 @@
 #include "../../codecs/cs35l41.h"
 #include "sof_cirrus_common.h"
 
+#define CS35L41_HID "CSC3541"
+#define CS35L41_MAX_AMPS 4
+
 /*
  * Cirrus Logic CS35L41/CS35L53
  */
@@ -35,50 +38,12 @@ static const struct snd_soc_dapm_route cs35l41_dapm_routes[] = {
 	{"TR Spk", NULL, "TR SPK"},
 };
 
-static struct snd_soc_dai_link_component cs35l41_components[] = {
-	{
-		.name = CS35L41_DEV0_NAME,
-		.dai_name = CS35L41_CODEC_DAI,
-	},
-	{
-		.name = CS35L41_DEV1_NAME,
-		.dai_name = CS35L41_CODEC_DAI,
-	},
-	{
-		.name = CS35L41_DEV2_NAME,
-		.dai_name = CS35L41_CODEC_DAI,
-	},
-	{
-		.name = CS35L41_DEV3_NAME,
-		.dai_name = CS35L41_CODEC_DAI,
-	},
-};
+static struct snd_soc_dai_link_component cs35l41_components[CS35L41_MAX_AMPS];
 
 /*
  * Mapping between ACPI instance id and speaker position.
- *
- * Four speakers:
- *         0: Tweeter left, 1: Woofer left
- *         2: Tweeter right, 3: Woofer right
  */
-static struct snd_soc_codec_conf cs35l41_codec_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF(CS35L41_DEV0_NAME),
-		.name_prefix = "TL",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(CS35L41_DEV1_NAME),
-		.name_prefix = "WL",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(CS35L41_DEV2_NAME),
-		.name_prefix = "TR",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(CS35L41_DEV3_NAME),
-		.name_prefix = "WR",
-	},
-};
+static struct snd_soc_codec_conf cs35l41_codec_conf[CS35L41_MAX_AMPS];
 
 static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -117,10 +82,10 @@ static int cs35l41_init(struct snd_soc_pcm_runtime *rtd)
 static const struct {
 	unsigned int rx[2];
 } cs35l41_channel_map[] = {
-	{.rx = {0, 1}}, /* TL */
 	{.rx = {0, 1}}, /* WL */
-	{.rx = {1, 0}}, /* TR */
 	{.rx = {1, 0}}, /* WR */
+	{.rx = {0, 1}}, /* TL */
+	{.rx = {1, 0}}, /* TR */
 };
 
 static int cs35l41_hw_params(struct snd_pcm_substream *substream,
@@ -175,8 +140,32 @@ static const struct snd_soc_ops cs35l41_ops = {
 	.hw_params = cs35l41_hw_params,
 };
 
+static const char * const cs35l41_name_prefixes[] = { "WL", "WR", "TL", "TR" };
+
+static const char * const cs35l41_uid_strings[] = { "0", "1", "2", "3" };
+
+static void cs35l41_compute_codec_conf(void)
+{
+	int uid;
+	struct acpi_device *adev;
+	struct device *physdev;
+
+	for (uid = 0; uid < CS35L41_MAX_AMPS; uid++) {
+		adev = acpi_dev_get_first_match_dev(CS35L41_HID, cs35l41_uid_strings[uid], -1);
+		if (!adev)
+			return;
+		physdev = get_device(acpi_get_first_physical_node(adev));
+		cs35l41_components[uid].name = dev_name(physdev);
+		cs35l41_components[uid].dai_name = CS35L41_CODEC_DAI;
+		cs35l41_codec_conf[uid].dlc.name = dev_name(physdev);
+		cs35l41_codec_conf[uid].name_prefix = cs35l41_name_prefixes[uid];
+		acpi_dev_put(adev);
+	}
+}
+
 void cs35l41_set_dai_link(struct snd_soc_dai_link *link)
 {
+	cs35l41_compute_codec_conf();
 	link->codecs = cs35l41_components;
 	link->num_codecs = ARRAY_SIZE(cs35l41_components);
 	link->init = cs35l41_init;
-- 
2.34.1

