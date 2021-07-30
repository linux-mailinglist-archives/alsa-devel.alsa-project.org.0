Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E233DBC35
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7BCC1FFA;
	Fri, 30 Jul 2021 17:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7BCC1FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627658707;
	bh=7tfjVFaOwcHHAJwW3zX2bJCj5VYup1iMY+gDn5HTnQY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dNUxn90aQ8qmP1IKqmARzLZV7lAKqy7KOoJZPsstaXzURAxXRPPf+CcygE7kl//iY
	 YrBh51/AZhpIa9zktVbJlL2EyXuuTTX8pJS2U1VAOs7XZc6x7ut50xxx3ZqwkG94Lw
	 c9VwKaeNcJ4jjUfYarutnx/OLnjgWCas29JojHdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF3DF804E5;
	Fri, 30 Jul 2021 17:19:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C1AF8053E; Fri, 30 Jul 2021 17:19:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1E20F804E4
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E20F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TSjBtv0F"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UEL0dj003614; 
 Fri, 30 Jul 2021 10:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uJiDGgAZuNVUz1HRRzwVIuea32lseF95YXkiOXKc9ug=;
 b=TSjBtv0Fsl/3sNywHLpc1/2TPtW+wETG9ilyLexwPf7BM6lzdW7AFb7s7NmFm95S07cI
 4YtOfDi6/ME09OYVH7zl0vpT0zMuUsFUmfPDc1i+bejc5K4kboXPyazdaELm8SK96ygm
 pQS1aIP5GuukAsVn4t3gsKDoR3/0f9yzNqrbnIO1FJ8nzLov2M+hkiHN04oMOIQBWQTZ
 SBvhD3lc18oaQ2RWoqLpEXAZr+dlThtGw7JjgqjBNxWSaVtzVKSWDK68J6MCjh+GjHVk
 edrOz8cKreHiMzJZYVPq4fc3xpDmHvzzSJx+KkRcnPAvjX2NmKhIpRFqiGGkX+cq2nCo lQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a41wd181n-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:19:20 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:19:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:19:11 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8FE46478;
 Fri, 30 Jul 2021 15:19:11 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 20/27] ALSA: hda/cs8409: Add Support to disable jack type
 detection for CS42L42
Date: Fri, 30 Jul 2021 16:18:37 +0100
Message-ID: <20210730151844.7873-21-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
References: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DTeWFsHqg1ET8z8txKButRkPOH-k6J7f
X-Proofpoint-ORIG-GUID: DTeWFsHqg1ET8z8txKButRkPOH-k6J7f
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300102
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
index 8b048ff12eb7..10903bcc3fcd 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -546,6 +546,39 @@ static void cs42l42_run_jack_detect(struct sub_codec *cs42l42)
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
@@ -570,10 +603,13 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
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
@@ -583,37 +619,11 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
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

