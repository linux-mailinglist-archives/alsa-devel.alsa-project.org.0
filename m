Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C43297EF656
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 17:38:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91EADF2;
	Fri, 17 Nov 2023 17:38:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91EADF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700239131;
	bh=oW/uzoJxszb+ehl6UDpWgk6IYptwhNtK4mWK9TWA73o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YeyMkp0oAqJHnafTGUSHn+3Md1aNW+QRQgHnBb218jOJs0W2oLsg/OuczO0rG7CRv
	 qs+7c4PLjg7rPiqAD3b8upUP0iseBhgAG6OLyV5sxR/FncqJiTqJUlgHEKHErSVZPm
	 JGXL0Uk+uj3bgYF+0u6GSk2TTOx1yK/HUC9067wo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 321E7F80579; Fri, 17 Nov 2023 17:37:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A89F3F8055A;
	Fri, 17 Nov 2023 17:37:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C8F3F8055B; Fri, 17 Nov 2023 17:37:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 408F7F8016E
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 17:36:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 408F7F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y+Rwckva
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AHFq7ax014874;
	Fri, 17 Nov 2023 10:36:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=E3wwcijZLLR2v3vODORrLKbR58/61l5lOeY6OfWRCJk=; b=
	Y+Rwckva4J34qmWrWwOOQ1AXWIxDp6blO8qqAIJCzYlNfJckXFyU8dScysHhpXD/
	OlTrEFlJi6tEsok35d/viDoZKNmZpzXvJjhn6KYkW/ySUxGT9nyhoghisly+hBvH
	T0ZPrg2KMMmUo5tmFRLqaA7OJc79a/Aq4elqjhq0+gF+o+R9k3oXeWN34hOptSIh
	0FjAh/QEgk6Qu5rsbHhsSaVLE3Oe5NxZ3gU79rauf6Dv8RJtuyMDTH2p08x/ZjNR
	DwqA4qzy72jQ6eK/LyPQ+wu1pBglhaRVvIWqxozG3wQn82DSjbt2ozLdge8aScE3
	J/TdUYidvJpWnpjUG4MUoA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ua6wpfrca-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:36:20 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 16:36:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Fri, 17 Nov 2023 16:36:17 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.225])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AD63E3581;
	Fri, 17 Nov 2023 16:36:17 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        "Takashi Iwai" <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 2/2] ALSA: cs35l41: Fix for old systems which do not
 support command
Date: Fri, 17 Nov 2023 16:36:09 +0000
Message-ID: <20231117163609.823627-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117163609.823627-1-sbinding@opensource.cirrus.com>
References: <20231117163609.823627-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tzs2NI77yzwds6AQd80xxs2B9Ui9vB7k
X-Proofpoint-ORIG-GUID: tzs2NI77yzwds6AQd80xxs2B9Ui9vB7k
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6BGZL7A6QFE3RKOSJHBTOKQ5QQ7DRLXA
X-Message-ID-Hash: 6BGZL7A6QFE3RKOSJHBTOKQ5QQ7DRLXA
X-MailFrom: prvs=66859973bd=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BGZL7A6QFE3RKOSJHBTOKQ5QQ7DRLXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some older laptops using cs35l41 use firmware which does not support
the CSPL_MBOX_CMD_SPK_OUT_ENABLE command.
Firmware versions v0.28.0 and older do not support this command.

Fixes: fa3efcc36aac ("ALSA: cs35l41: Use mbox command to enable speaker output for external boost")

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 include/sound/cs35l41.h        | 2 +-
 sound/pci/hda/cs35l41_hda.c    | 4 ++--
 sound/soc/codecs/cs35l41-lib.c | 6 ++++--
 sound/soc/codecs/cs35l41.c     | 4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 043f8ac65dbf..68e053fe7340 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -906,6 +906,6 @@ int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
 int cs35l41_mdsync_up(struct regmap *regmap);
 int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l41_boost_type b_type,
-			  int enable, bool firmware_running);
+			  int enable, struct cs_dsp *dsp);
 
 #endif /* __CS35L41_H */
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index b7d2aa18c566..cbd7d8badf91 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -598,7 +598,7 @@ static void cs35l41_hda_play_done(struct device *dev)
 	dev_dbg(dev, "Play (Complete)\n");
 
 	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1,
-			      cs35l41->cs_dsp.running);
+			      &cs35l41->cs_dsp);
 	cs35l41_mute(dev, false);
 }
 
@@ -611,7 +611,7 @@ static void cs35l41_hda_pause_start(struct device *dev)
 
 	cs35l41_mute(dev, true);
 	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 0,
-			      cs35l41->cs_dsp.running);
+			      &cs35l41->cs_dsp);
 }
 
 static void cs35l41_hda_pause_done(struct device *dev)
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 4569e4f7cf7e..e9993a39f7d0 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -16,6 +16,8 @@
 
 #include <sound/cs35l41.h>
 
+#define CS35L41_FIRMWARE_OLD_VERSION 0x001C00 /* v0.28.0 */
+
 static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_PWR_CTRL1,			0x00000000 },
 	{ CS35L41_PWR_CTRL2,			0x00000000 },
@@ -1214,7 +1216,7 @@ EXPORT_SYMBOL_GPL(cs35l41_safe_reset);
  * the PLL Lock interrupt, in the IRQ handler.
  */
 int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l41_boost_type b_type,
-			  int enable, bool firmware_running)
+			  int enable, struct cs_dsp *dsp)
 {
 	int ret;
 	unsigned int gpio1_func, pad_control, pwr_ctrl1, pwr_ctrl3, int_status, pup_pdn_mask;
@@ -1309,7 +1311,7 @@ int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l4
 			}
 			regmap_write(regmap, CS35L41_IRQ1_STATUS1, CS35L41_PUP_DONE_MASK);
 
-			if (firmware_running)
+			if (dsp->running && dsp->fw_id_version > CS35L41_FIRMWARE_OLD_VERSION)
 				ret = cs35l41_set_cspl_mbox_cmd(dev, regmap,
 								CSPL_MBOX_CMD_SPK_OUT_ENABLE);
 			else
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index d0e9128ac6d0..dfb4ce53491b 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -519,11 +519,11 @@ static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
 						ARRAY_SIZE(cs35l41_pup_patch));
 
 		ret = cs35l41_global_enable(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type,
-					    1, cs35l41->dsp.cs_dsp.running);
+					    1, &cs35l41->dsp.cs_dsp);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		ret = cs35l41_global_enable(cs35l41->dev, cs35l41->regmap, cs35l41->hw_cfg.bst_type,
-					    0, cs35l41->dsp.cs_dsp.running);
+					    0, &cs35l41->dsp.cs_dsp);
 
 		regmap_multi_reg_write_bypassed(cs35l41->regmap,
 						cs35l41_pdn_patch,
-- 
2.34.1

