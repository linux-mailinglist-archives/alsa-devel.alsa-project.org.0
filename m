Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAFF7AB3AA
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:30:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6339BE86;
	Fri, 22 Sep 2023 16:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6339BE86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695393040;
	bh=+FDJNnGabGRd6XgWM4UxWTTdy5l1rJO/HBrAccUgnwg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SymAVuu8EE7jyfcbwTDVk2/VTnqXftvdwxWvWiZihxuOMhCbPKVdY3D9I6NxIriYN
	 ldYSNAYQFrW4GPfU0GKZQw98KbHqv2UOS2BFCTpvxZ2Gf51fTqdhIl/VhSSz4haSWk
	 bE6fAEkc1qKOdPdk8g/gZjkeAZwbzHbZw+mo4EXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52045F8057D; Fri, 22 Sep 2023 16:28:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE31AF80571;
	Fri, 22 Sep 2023 16:28:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA4E2F80125; Fri, 22 Sep 2023 16:28:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73F44F80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73F44F80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YUcJ270e
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38ME9ncE026380;
	Fri, 22 Sep 2023 09:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=2y/pDq8C2MEbE0taiLlGdXwcmRd1O1Hg1M6JesaUCFg=; b=
	YUcJ270evQUWTdBmipfxIo4suI7fMrHg8dXQGgaTv9hV6CXD8Tnl66jetnQYnkIa
	3gw3E0u09mFRCIpT8sCRVQjfIWKFRWOdZ38lr3Oa854WBoU0iUv4j2Lpv0TsCFw2
	HW8roawQFVindBuAkhHdelIkk5Mn0S4ONFl+8Ji+1hfEDt8Ae57PAP1O8Nk3UZ4o
	lag/SKYcMboFNEFpI6IknvHMuQWH9f0xmjouAVgPA8lEOnL2Rqki4Q55Rl0ibvs7
	5CaZrdIJ4EuSdtJzgdC4AfAPL2hj2Si8XHB5M5e7Qu3oj7QXMbh41Qw6k1y3MStM
	mX1pK+NtK/z1USRVaNS9Pw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t8tt7h2pv-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 09:28:31 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 22 Sep
 2023 15:28:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 22 Sep 2023 15:28:28 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.135])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 41754356C;
	Fri, 22 Sep 2023 14:28:28 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        "Takashi Iwai" <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ALSA: cs35l41: Fix for old systems which do not
 support command
Date: Fri, 22 Sep 2023 15:28:18 +0100
Message-ID: <20230922142818.2021103-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 77OpIBxbP8FD9eLWWyKUrBpFlceO4jw1
X-Proofpoint-ORIG-GUID: 77OpIBxbP8FD9eLWWyKUrBpFlceO4jw1
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CEODKSKP774GSQYFDT2LM4D4ZY7ZAKZA
X-Message-ID-Hash: CEODKSKP774GSQYFDT2LM4D4ZY7ZAKZA
X-MailFrom: prvs=462953d6eb=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEODKSKP774GSQYFDT2LM4D4ZY7ZAKZA/>
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
index 2fe8c6b0d4cf..ccee065958a3 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -903,6 +903,6 @@ int cs35l41_init_boost(struct device *dev, struct regmap *regmap,
 bool cs35l41_safe_reset(struct regmap *regmap, enum cs35l41_boost_type b_type);
 int cs35l41_mdsync_up(struct regmap *regmap);
 int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l41_boost_type b_type,
-			  int enable, bool firmware_running);
+			  int enable, struct cs_dsp *dsp);
 
 #endif /* __CS35L41_H */
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 28f6ef32937d..698fb7c5a028 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -527,7 +527,7 @@ static void cs35l41_hda_play_done(struct device *dev)
 	dev_dbg(dev, "Play (Complete)\n");
 
 	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1,
-			      cs35l41->cs_dsp.running);
+			      &cs35l41->cs_dsp);
 	if (cs35l41->cs_dsp.running) {
 		regmap_multi_reg_write(reg, cs35l41_hda_unmute_dsp,
 				       ARRAY_SIZE(cs35l41_hda_unmute_dsp));
@@ -546,7 +546,7 @@ static void cs35l41_hda_pause_start(struct device *dev)
 
 	regmap_multi_reg_write(reg, cs35l41_hda_mute, ARRAY_SIZE(cs35l41_hda_mute));
 	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 0,
-			      cs35l41->cs_dsp.running);
+			      &cs35l41->cs_dsp);
 }
 
 static void cs35l41_hda_pause_done(struct device *dev)
diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 2ec5fdc875b1..f18fbd4b3ede 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -16,6 +16,8 @@
 
 #include <sound/cs35l41.h>
 
+#define CS35L41_FIRMWARE_OLD_VERSION 0x001C00 /* v0.28.0 */
+
 static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_PWR_CTRL1,			0x00000000 },
 	{ CS35L41_PWR_CTRL2,			0x00000000 },
@@ -1213,7 +1215,7 @@ EXPORT_SYMBOL_GPL(cs35l41_safe_reset);
  * the PLL Lock interrupt, in the IRQ handler.
  */
 int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l41_boost_type b_type,
-			  int enable, bool firmware_running)
+			  int enable, struct cs_dsp *dsp)
 {
 	int ret;
 	unsigned int gpio1_func, pad_control, pwr_ctrl1, pwr_ctrl3, int_status, pup_pdn_mask;
@@ -1308,7 +1310,7 @@ int cs35l41_global_enable(struct device *dev, struct regmap *regmap, enum cs35l4
 			}
 			regmap_write(regmap, CS35L41_IRQ1_STATUS1, CS35L41_PUP_DONE_MASK);
 
-			if (firmware_running)
+			if (dsp->running && dsp->fw_id_version > CS35L41_FIRMWARE_OLD_VERSION)
 				ret = cs35l41_set_cspl_mbox_cmd(dev, regmap,
 								CSPL_MBOX_CMD_SPK_OUT_ENABLE);
 			else
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 4bc64ba71cd6..df326fe90447 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -520,11 +520,11 @@ static int cs35l41_main_amp_event(struct snd_soc_dapm_widget *w,
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

