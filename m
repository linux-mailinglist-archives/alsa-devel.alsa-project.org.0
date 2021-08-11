Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4543E983D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20A5018B3;
	Wed, 11 Aug 2021 21:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20A5018B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628708642;
	bh=xRvwc9bcHxdmfBMwKeWFXg1HmUKLqlIiSg7pXQgVMS0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aD8cpX3Gmm/IJ8J7InwNFl19kS0bZw5BBRz6pWBrZFi8S7BlrVLisG19vamN9qzFD
	 RakNqbb0rTrC7kmh72ZYP11cnWgBNtuiOEGSVxEc7gaXtQnkXuU8aYbzE87SdM21Ph
	 cOD52daM3TW+0IVROhV693DJ075mG8AIHKkgPQwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB366F8055A;
	Wed, 11 Aug 2021 20:58:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D86F80537; Wed, 11 Aug 2021 20:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 801DAF804EB
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 20:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 801DAF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YMDTKDEO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17BIq9wr001296; 
 Wed, 11 Aug 2021 13:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rvp8sn/zpPbJ7WDcCpzo/Bb8b9BSCJZSTkrn9YC9gAA=;
 b=YMDTKDEOCFMi9g+uh9YS3Gt2N1APqq+8/80gk+7Tu0YMcYUeU+bhfi3zj4YHDUMH82CC
 7vkD05wH0O4TnJ1EQxPVL3ojsikJSDydUGceb+kZvc49N96N+9J+hE+l76Yo2biatzSx
 uJBm3A5eFlsihKeHO2qw/Q5Es4xtJXAaHDR0j2G13jWptQiO4xDkoJIxnC4z7YJeA1PD
 oX2jGokgB+NF8Z5lxIiW2+s+oFU+Vlns/TUM3xYpGJi3bCX2clvhqbboNbJZdMH7kVD5
 xykMGVA2wNbhKD8QvCtqUUrs8+Si675myEBDUYM4Wpg2YJjdmBznBnofyzQik5gxuA0Y zQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3acgjkra4r-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 13:57:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:31 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2A2ED2A9;
 Wed, 11 Aug 2021 18:57:31 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 20/27] ALSA: hda/cs8409: Add Support to disable jack type
 detection for CS42L42
Date: Wed, 11 Aug 2021 19:56:47 +0100
Message-ID: <20210811185654.6837-21-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rXssGLpqMqeZH1yYzCp5WAZmb1vu8XYQ
X-Proofpoint-ORIG-GUID: rXssGLpqMqeZH1yYzCp5WAZmb1vu8XYQ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110130
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Some hardware configurations do not support jack type detection.
Instead, for those configurations, only tip detection is supported.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409-tables.c |  1 +
 sound/pci/hda/patch_cs8409.c        | 72 ++++++++++++++++-------------
 sound/pci/hda/patch_cs8409.h        |  1 +
 3 files changed, 43 insertions(+), 31 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 117c70536ff0..be9feb84aaa2 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -246,6 +246,7 @@ struct sub_codec cs8409_cs42l42_codec = {
 	.mic_jack_in = 0,
 	.paged = 1,
 	.suspended = 1,
+	.no_type_dect = 0,
 };
 
 /******************************************************************************
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 5b3221ddc51b..7ea46c83ac86 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -559,6 +559,39 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
 	usleep_range(10000, 25000);
 }
 
+static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_ts_status)
+{
+	int status_changed = 0;
+
+	/* TIP_SENSE INSERT/REMOVE */
+	switch (reg_ts_status) {
+	case CS42L42_JACK_INSERTED:
+		if (!cs42l42->hp_jack_in) {
+			if (cs42l42->no_type_dect) {
+				status_changed = 1;
+				cs42l42->hp_jack_in = 1;
+				cs42l42->mic_jack_in = 0;
+			} else {
+				cs42l42_run_jack_detect(cs42l42);
+			}
+		}
+		break;
+
+	case CS42L42_JACK_REMOVED:
+		if (cs42l42->hp_jack_in || cs42l42->mic_jack_in) {
+			status_changed = 1;
+			cs42l42->hp_jack_in = 0;
+			cs42l42->mic_jack_in = 0;
+		}
+		break;
+	default:
+		/* jack in transition */
+		break;
+	}
+
+	return status_changed;
+}
+
 static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 {
 	int status_changed = 0;
@@ -583,10 +616,13 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 		cs8409_i2c_write(cs42l42, 0x131b, 0xFF);
 
 		type = ((reg_hs_status & CS42L42_HSTYPE_MASK) + 1);
-		/* CS42L42 reports optical jack as type 4
-		 * We don't handle optical jack
-		 */
-		if (type != 4) {
+
+		if (cs42l42->no_type_dect) {
+			status_changed = cs42l42_handle_tip_sense(cs42l42, reg_ts_status);
+		} else if (type == 4) {
+			/* Type 4 not supported	*/
+			status_changed = cs42l42_handle_tip_sense(cs42l42, CS42L42_JACK_REMOVED);
+		} else {
 			if (!cs42l42->hp_jack_in) {
 				status_changed = 1;
 				cs42l42->hp_jack_in = 1;
@@ -596,37 +632,11 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 				status_changed = 1;
 				cs42l42->mic_jack_in = 1;
 			}
-		} else {
-			if (cs42l42->hp_jack_in || cs42l42->mic_jack_in) {
-				status_changed = 1;
-				cs42l42->hp_jack_in = 0;
-				cs42l42->mic_jack_in = 0;
-			}
 		}
-
 		/* Re-Enable Tip Sense Interrupt */
 		cs8409_i2c_write(cs42l42, 0x1320, 0xF3);
-
 	} else {
-		/* TIP_SENSE INSERT/REMOVE */
-		switch (reg_ts_status) {
-		case CS42L42_JACK_INSERTED:
-			cs42l42_run_jack_detect(cs42l42);
-			break;
-
-		case CS42L42_JACK_REMOVED:
-			if (cs42l42->hp_jack_in || cs42l42->mic_jack_in) {
-				status_changed = 1;
-				cs42l42->hp_jack_in = 0;
-				cs42l42->mic_jack_in = 0;
-			}
-			break;
-
-		default:
-			/* jack in transition */
-			status_changed = 0;
-			break;
-		}
+		status_changed = cs42l42_handle_tip_sense(cs42l42, reg_ts_status);
 	}
 
 	return status_changed;
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 817df295d594..a105c3c9023d 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -285,6 +285,7 @@ struct sub_codec {
 	unsigned int last_page;
 	unsigned int hsbias_hiz;
 	unsigned int full_scale_vol:1;
+	unsigned int no_type_dect:1;
 
 	s8 vol[CS42L42_VOLUMES];
 };
-- 
2.25.1

