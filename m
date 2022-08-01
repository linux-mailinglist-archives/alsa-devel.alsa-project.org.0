Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9875866ED
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 11:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAE5C950;
	Mon,  1 Aug 2022 11:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAE5C950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659346914;
	bh=SHl0kjTLxDK3iyY5n5GDTDzJU3LF8bLI6RZ75RnvxIc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FqnIGxdl63Zb+LpPZBdwocENfQ6S4ijkox4bueadewVCiQbfFrFO4hr907T/2BmZ3
	 LG1XZiQyhrEr+Ibh+GYXZZCpMSgC9U0fTmWn53Iz9aDuh6GeiaptI2TcHNLsVoyu4Z
	 KWZ1W5Xhbej9Gh/stoYNtRcQi1aiZEkp1DTd12Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439C3F80246;
	Mon,  1 Aug 2022 11:40:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17DEF80139; Mon,  1 Aug 2022 11:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 659AAF80139
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 11:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 659AAF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g4HjTJfO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2716XIsL018137;
 Mon, 1 Aug 2022 04:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=5xtjMnZJB9i9Lj2dgy+5Z3DIduXnHmHNPq1fJbcrI98=;
 b=g4HjTJfOMELHdVcuPba8tfZ0/bOYPVVdrXE1bCntpCNLZNbT/xokm5GhcFOhLtmgRs6k
 L+fZ1qln6o0v2lBX5aPZUY/CMd97Pv7UW6zwVv42NVTIAeOxgC+UbGF1DbZVnBokzmfA
 02hW0ku8PFlTgRfu/9dW61VFC6yr56HnJf8f9VA9xlji2H9zT0f25V6X9xRYOoY29ap3
 VIb5hjQcABoq/NqVtuHmGtNOm7nn9LVBWSttoIFsrBqIXST28xF4HgsWrZc7B/API+IA
 V89c+vx0vIp0+EgYG+HLCdjwFzgwpnQ/rKX8mFWi1FGoYtGCw8X27Au6IqFbVJyDZxM6 bA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hn222j8ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Aug 2022 04:40:44 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Mon, 1 Aug 2022
 04:40:42 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Mon, 1 Aug 2022 04:40:42 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4CE492D4;
 Mon,  1 Aug 2022 09:40:41 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Brent Lu
 <brent.lu@intel.com>, xliu <xiang.liu@cirrus.com>
Subject: [PATCH v3] ASoC: Intel: cirrus-common: Use UID to map correct amp to
 prefix
Date: Mon, 1 Aug 2022 10:40:34 +0100
Message-ID: <20220801094034.3927841-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ic13FIAKVzNW_Mts-6te1sjayV9ckhsS
X-Proofpoint-ORIG-GUID: Ic13FIAKVzNW_Mts-6te1sjayV9ckhsS
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

The UIDs for these amps in ACPI are fixed, and map to a name_prefix,
where:
UID 0x0 -> WL
UID 0x1 -> WR
UID 0x2 -> TL
UID 0x3 -> TR

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/intel/boards/sof_cirrus_common.c | 92 ++++++++++++----------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index f4192df962d6..6e39eda77385 100644
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
@@ -175,10 +140,51 @@ static const struct snd_soc_ops cs35l41_ops = {
 	.hw_params = cs35l41_hw_params,
 };
 
+static const char * const cs35l41_name_prefixes[] = { "WL", "WR", "TL", "TR" };
+
+/*
+ * Expected UIDs are integers (stored as strings).
+ * UID Mapping is fixed:
+ * UID 0x0 -> WL
+ * UID 0x1 -> WR
+ * UID 0x2 -> TL
+ * UID 0x3 -> TR
+ * Note: If there are less than 4 Amps, UIDs still map to WL/WR/TL/TR. Dynamic code will only create
+ * dai links for UIDs which exist, and ignore non-existant ones. Only 2 or 4 amps are expected.
+ * Return number of codecs found.
+ */
+static int cs35l41_compute_codec_conf(void)
+{
+	const char * const uid_strings[] = { "0", "1", "2", "3" };
+	unsigned int uid, sz = 0;
+	struct acpi_device *adev;
+	struct device *physdev;
+
+	for (uid = 0; uid < CS35L41_MAX_AMPS; uid++) {
+		adev = acpi_dev_get_first_match_dev(CS35L41_HID, uid_strings[uid], -1);
+		if (!adev) {
+			pr_devel("Cannot find match for HID %s UID %u (%s)\n", CS35L41_HID, uid,
+				 cs35l41_name_prefixes[uid]);
+			continue;
+		}
+		physdev = get_device(acpi_get_first_physical_node(adev));
+		cs35l41_components[sz].name = dev_name(physdev);
+		cs35l41_components[sz].dai_name = CS35L41_CODEC_DAI;
+		cs35l41_codec_conf[sz].dlc.name = dev_name(physdev);
+		cs35l41_codec_conf[sz].name_prefix = cs35l41_name_prefixes[uid];
+		acpi_dev_put(adev);
+		sz++;
+	}
+
+	if (sz != 2 && sz != 4)
+		pr_warn("Invalid number of cs35l41 amps found: %d, expected 2 or 4\n", sz);
+	return sz;
+}
+
 void cs35l41_set_dai_link(struct snd_soc_dai_link *link)
 {
+	link->num_codecs = cs35l41_compute_codec_conf();
 	link->codecs = cs35l41_components;
-	link->num_codecs = ARRAY_SIZE(cs35l41_components);
 	link->init = cs35l41_init;
 	link->ops = &cs35l41_ops;
 }
-- 
2.34.1

