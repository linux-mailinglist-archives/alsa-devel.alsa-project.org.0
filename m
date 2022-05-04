Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2E51A50C
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 18:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D371620;
	Wed,  4 May 2022 18:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D371620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651680838;
	bh=zaNtbZO2sXMPp6Skc8+Qw4k0ZSL3t4eRToOdFIO6mh0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMBC69S6dvX/06ZEIpiup1epRaNnQ+ExhtvILNTYKovP0gSz6fepdC0XgZ14fL8xw
	 iYxzQZtzZ83rUE8oxfSUQxim6YAAc+YWZISgeMgszez3nD56rSH2Wpn5+j5vp8BAHz
	 mFM+DDuv+F6EB56qQy+6G1LgnweGgzmu2ODXYX2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB8F1F8049E;
	Wed,  4 May 2022 18:12:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A975EF80129; Wed,  4 May 2022 18:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DBC8F80129
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 18:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DBC8F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j7TknbmA"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2444eM0Y022668;
 Wed, 4 May 2022 11:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=ZKCB6dSDdWjC7uNzTek+77/fO8XVZ1uO6IiRscjYf3U=;
 b=j7TknbmATv8vFwdGvxn+iWDnMd3HYxRoUcW1mfh9c94Eoaf9yJVUE1j1BY9+voAVow41
 mH/k1c4eHz1X50o/vRzmK8DW6XPs/DM4TZjwPVIY79rV1K1gGM8TMG+D4RQqtZfZTpbZ
 N8l7uG3Nyr9ne0TgWgEVHMdLUS3b0GJ6xvbWBnbUw6ROrkOWJ06yTWfZnw684uY9xCXX
 nMAZPZHAM+DsxF9qkcWPPseBefy0Lx7QEBofKNYV3ff1u41DBZNuKB1UxOPvQkpdDcgl
 4t7wf2LuiHk7qGKcv9OYRpSzD9QFd7sctQOKBSIjhEoWO5ti+MZkeUqlOM0OBk+UJ4Qq +Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcvrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 11:12:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 17:12:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 17:12:47 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.73])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1BD11459;
 Wed,  4 May 2022 16:12:47 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
Subject: [PATCH v1 3/3] ALSA: hda/cs8409: Support manual mode detection for
 CS42L42
Date: Wed, 4 May 2022 17:12:36 +0100
Message-ID: <20220504161236.2490532-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504161236.2490532-1-sbinding@opensource.cirrus.com>
References: <20220504161236.2490532-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tlrDwmQre3IaKaL4Hvk0FhU5ZMIdF7jb
X-Proofpoint-GUID: tlrDwmQre3IaKaL4Hvk0FhU5ZMIdF7jb
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

For Jack detection on CS42L42, detection is normally done using
"auto" mode, which automatically detects what type of jack is
connected to the device. However, some headsets are not
automatically detected, and as such and alternative detection
method "manual mode" can be used to detect these headsets.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409-tables.c |   3 -
 sound/pci/hda/patch_cs8409.c        | 159 +++++++++++++++++++++++-----
 sound/pci/hda/patch_cs8409.h        |   1 -
 3 files changed, 132 insertions(+), 31 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index a7ee489e6aec..0d11b24a1317 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -252,7 +252,6 @@ struct sub_codec cs8409_cs42l42_codec = {
 	.init_seq_num = ARRAY_SIZE(cs42l42_init_reg_seq),
 	.hp_jack_in = 0,
 	.mic_jack_in = 0,
-	.force_status_change = 1,
 	.paged = 1,
 	.suspended = 1,
 	.no_type_dect = 0,
@@ -444,7 +443,6 @@ struct sub_codec dolphin_cs42l42_0 = {
 	.init_seq_num = ARRAY_SIZE(dolphin_c0_init_reg_seq),
 	.hp_jack_in = 0,
 	.mic_jack_in = 0,
-	.force_status_change = 1,
 	.paged = 1,
 	.suspended = 1,
 	.no_type_dect = 0,
@@ -458,7 +456,6 @@ struct sub_codec dolphin_cs42l42_1 = {
 	.init_seq_num = ARRAY_SIZE(dolphin_c1_init_reg_seq),
 	.hp_jack_in = 0,
 	.mic_jack_in = 0,
-	.force_status_change = 1,
 	.paged = 1,
 	.suspended = 1,
 	.no_type_dect = 1,
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index d35d124bf3dc..c3a8b04c71d8 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -634,38 +634,128 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
 	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2, 0xc0);
 }
 
-static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
+static int cs42l42_manual_hs_det(struct sub_codec *cs42l42)
 {
-	int status_changed = cs42l42->force_status_change;
+	unsigned int hs_det_status;
+	unsigned int hs_det_comp1;
+	unsigned int hs_det_comp2;
+	unsigned int hs_det_sw;
+	unsigned int hs_type;
+
+	/* Set hs detect to manual, active mode */
+	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2,
+			 (1 << CS42L42_HSDET_CTRL_SHIFT) |
+			 (0 << CS42L42_HSDET_SET_SHIFT) |
+			 (0 << CS42L42_HSBIAS_REF_SHIFT) |
+			 (0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+
+	/* Configure HS DET comparator reference levels. */
+	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL1,
+			 (CS42L42_HSDET_COMP1_LVL_VAL << CS42L42_HSDET_COMP1_LVL_SHIFT) |
+			 (CS42L42_HSDET_COMP2_LVL_VAL << CS42L42_HSDET_COMP2_LVL_SHIFT));
+
+	/* Open the SW_HSB_HS3 switch and close SW_HSB_HS4 for a Type 1 headset. */
+	cs8409_i2c_write(cs42l42, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP1);
+
+	msleep(100);
+
+	hs_det_status = cs8409_i2c_read(cs42l42, CS42L42_HS_DET_STATUS);
+
+	hs_det_comp1 = (hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
+			CS42L42_HSDET_COMP1_OUT_SHIFT;
+	hs_det_comp2 = (hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
+			CS42L42_HSDET_COMP2_OUT_SHIFT;
+
+	/* Close the SW_HSB_HS3 switch for a Type 2 headset. */
+	cs8409_i2c_write(cs42l42, CS42L42_HS_SWITCH_CTL, CS42L42_HSDET_SW_COMP2);
 
-	cs42l42->force_status_change = 0;
+	msleep(100);
+
+	hs_det_status = cs8409_i2c_read(cs42l42, CS42L42_HS_DET_STATUS);
+
+	hs_det_comp1 |= ((hs_det_status & CS42L42_HSDET_COMP1_OUT_MASK) >>
+			CS42L42_HSDET_COMP1_OUT_SHIFT) << 1;
+	hs_det_comp2 |= ((hs_det_status & CS42L42_HSDET_COMP2_OUT_MASK) >>
+			CS42L42_HSDET_COMP2_OUT_SHIFT) << 1;
+
+	/* Use Comparator 1 with 1.25V Threshold. */
+	switch (hs_det_comp1) {
+	case CS42L42_HSDET_COMP_TYPE1:
+		hs_type = CS42L42_PLUG_CTIA;
+		hs_det_sw = CS42L42_HSDET_SW_TYPE1;
+		break;
+	case CS42L42_HSDET_COMP_TYPE2:
+		hs_type = CS42L42_PLUG_OMTP;
+		hs_det_sw = CS42L42_HSDET_SW_TYPE2;
+		break;
+	default:
+		/* Fallback to Comparator 2 with 1.75V Threshold. */
+		switch (hs_det_comp2) {
+		case CS42L42_HSDET_COMP_TYPE1:
+			hs_type = CS42L42_PLUG_CTIA;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE1;
+			break;
+		case CS42L42_HSDET_COMP_TYPE2:
+			hs_type = CS42L42_PLUG_OMTP;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE2;
+			break;
+		case CS42L42_HSDET_COMP_TYPE3:
+			hs_type = CS42L42_PLUG_HEADPHONE;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE3;
+			break;
+		default:
+			hs_type = CS42L42_PLUG_INVALID;
+			hs_det_sw = CS42L42_HSDET_SW_TYPE4;
+			break;
+		}
+	}
+
+	/* Set Switches */
+	cs8409_i2c_write(cs42l42, CS42L42_HS_SWITCH_CTL, hs_det_sw);
+
+	/* Set HSDET mode to Manual—Disabled */
+	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2,
+			 (0 << CS42L42_HSDET_CTRL_SHIFT) |
+			 (0 << CS42L42_HSDET_SET_SHIFT) |
+			 (0 << CS42L42_HSBIAS_REF_SHIFT) |
+			 (0 << CS42L42_HSDET_AUTO_TIME_SHIFT));
+
+	/* Configure HS DET comparator reference levels. */
+	cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL1,
+			 (CS42L42_HSDET_COMP1_LVL_DEFAULT << CS42L42_HSDET_COMP1_LVL_SHIFT) |
+			 (CS42L42_HSDET_COMP2_LVL_DEFAULT << CS42L42_HSDET_COMP2_LVL_SHIFT));
+
+	return hs_type;
+}
+
+static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
+{
+	int status_changed = 0;
 
 	/* TIP_SENSE INSERT/REMOVE */
 	switch (reg_ts_status) {
 	case CS42L42_TS_PLUG:
-		if (!cs42l42->hp_jack_in) {
-			if (cs42l42->no_type_dect) {
-				status_changed = 1;
-				cs42l42->hp_jack_in = 1;
-				cs42l42->mic_jack_in = 0;
-			} else {
-				cs42l42_run_jack_detect(cs42l42);
-			}
+		if (cs42l42->no_type_dect) {
+			status_changed = 1;
+			cs42l42->hp_jack_in = 1;
+			cs42l42->mic_jack_in = 0;
+		} else {
+			cs42l42_run_jack_detect(cs42l42);
 		}
 		break;
 
 	case CS42L42_TS_UNPLUG:
-		if (cs42l42->hp_jack_in || cs42l42->mic_jack_in) {
-			status_changed = 1;
-			cs42l42->hp_jack_in = 0;
-			cs42l42->mic_jack_in = 0;
-		}
+		status_changed = 1;
+		cs42l42->hp_jack_in = 0;
+		cs42l42->mic_jack_in = 0;
 		break;
 	default:
 		/* jack in transition */
 		break;
 	}
 
+	codec_dbg(cs42l42->codec, "Tip Sense Detection: (%d)\n", reg_ts_status);
+
 	return status_changed;
 }
 
@@ -698,24 +788,40 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 
 		type = (reg_hs_status & CS42L42_HSDET_TYPE_MASK) >> CS42L42_HSDET_TYPE_SHIFT;
 
+		/* Configure the HSDET mode. */
+		cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2, 0x80);
+
 		if (cs42l42->no_type_dect) {
 			status_changed = cs42l42_handle_tip_sense(cs42l42, current_plug_status);
-		} else if (type == CS42L42_PLUG_INVALID) {
-			/* Type CS42L42_PLUG_INVALID not supported	*/
-			status_changed = cs42l42_handle_tip_sense(cs42l42, CS42L42_TS_UNPLUG);
 		} else {
-			if (!cs42l42->hp_jack_in) {
-				status_changed = 1;
-				cs42l42->hp_jack_in = 1;
+			if (type == CS42L42_PLUG_INVALID || type == CS42L42_PLUG_HEADPHONE) {
+				codec_dbg(cs42l42->codec,
+					  "Auto detect value not valid (%d), running manual det\n",
+					  type);
+				type = cs42l42_manual_hs_det(cs42l42);
 			}
-			/* type = CS42L42_PLUG_HEADPHONE has no mic */
-			if ((!cs42l42->mic_jack_in) && (type != CS42L42_PLUG_HEADPHONE)) {
+
+			switch (type) {
+			case CS42L42_PLUG_CTIA:
+			case CS42L42_PLUG_OMTP:
 				status_changed = 1;
+				cs42l42->hp_jack_in = 1;
 				cs42l42->mic_jack_in = 1;
+				break;
+			case CS42L42_PLUG_HEADPHONE:
+				status_changed = 1;
+				cs42l42->hp_jack_in = 1;
+				cs42l42->mic_jack_in = 0;
+				break;
+			default:
+				status_changed = 1;
+				cs42l42->hp_jack_in = 0;
+				cs42l42->mic_jack_in = 0;
+				break;
 			}
+			codec_dbg(cs42l42->codec, "Detection done (%d)\n", type);
 		}
-		/* Configure the HSDET mode. */
-		cs8409_i2c_write(cs42l42, CS42L42_HSDET_CTL2, 0x80);
+
 		/* Enable the HPOUT ground clamp and configure the HP pull-down */
 		cs8409_i2c_write(cs42l42, CS42L42_DAC_CTL2, 0x02);
 		/* Re-Enable Tip Sense Interrupt */
@@ -803,7 +909,6 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
 	cs42l42->last_page = 0;
 	cs42l42->hp_jack_in = 0;
 	cs42l42->mic_jack_in = 0;
-	cs42l42->force_status_change = 1;
 
 	/* Put CS42L42 into Reset */
 	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 988259f8a940..ebf473a3f109 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -304,7 +304,6 @@ struct sub_codec {
 
 	unsigned int hp_jack_in:1;
 	unsigned int mic_jack_in:1;
-	unsigned int force_status_change:1;
 	unsigned int suspended:1;
 	unsigned int paged:1;
 	unsigned int last_page;
-- 
2.25.1

