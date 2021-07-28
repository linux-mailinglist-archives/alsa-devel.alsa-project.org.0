Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5633D8F90
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 15:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E95451AD1;
	Wed, 28 Jul 2021 15:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E95451AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627480225;
	bh=JXPPTb0aExzgKqmi+MXGjQH3X8/yeSLrbzNSSSZe5Vo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gcFeTSjSw3hTc+O4obr0bEoL4mWtgUHQRLUeq789wuTV8zqDRqMo4iVNly0u0y6Bz
	 BP3uNBE4AIsztL4UjuqChjhn86NgY8N8tm4Ml6Y5+Zb/BwYpcgrniNrsxHsGZ2t5IS
	 UurR4qUSm7JEYe5AKfYjSwBZoz8kbf+/z6dow+Lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 486C7F80552;
	Wed, 28 Jul 2021 15:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE9CEF8053B; Wed, 28 Jul 2021 15:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A66EDF804DF
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 15:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A66EDF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KDk9Ykq7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S5XUqs014335; 
 Wed, 28 Jul 2021 08:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Wu5RHG+z4CrcbTD0wN2+615+GsLX2gZo7DeNNwOtopk=;
 b=KDk9Ykq7SJec2Jlvdz5/j9AUGeHmWdecClr6EuinujKYDEfjHzeBrlJZ1iAK5BehNKC7
 u5nDp+IVafmggN+U2NtCWaOM6Z1fKZnixgdxQ/k2DoI8tx0jiLV/rZPZWJ4N0HjYQBig
 B00sRNMehEiAg51ogABGwy2Q5UXKylbFpC5wjnJQC0Wpd94RWTrPvMw4j5SE8wWI5MoX
 HdWtzwNyxpH+Ev3eOC0jWq7pcKKrDxuM/gQt01ye06ZCSYIZUraS3JMc6aQc1IsECa/B
 Lu+CmmpfcopOD4wnBMhaRzPzptL0DoCUPN6Rw1ZAHqusckjMLRjCXi32tIqS1ssR7Ule TQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a30q20fx9-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 08:44:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 14:44:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 14:44:33 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BDB6B2BA;
 Wed, 28 Jul 2021 13:44:32 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 10/27] ALSA: hda/cs8409: Simplify CS42L42 jack detect.
Date: Wed, 28 Jul 2021 14:43:51 +0100
Message-ID: <20210728134408.369396-11-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
References: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tQYMHJdNmkJ-aDtGRIWRN4LFVve5s1ru
X-Proofpoint-GUID: tQYMHJdNmkJ-aDtGRIWRN4LFVve5s1ru
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=857 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280077
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

Cleanup interrupt masks.
Remove unnecessary read/writes.
Ensure Tip Sense/Type Detection interrupts are enabled/disabled
when needed.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Changes in v2:
- No changes

---
 sound/pci/hda/patch_cs8409.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index f4401c1e8572..4ad832f5c4ba 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -406,10 +406,8 @@ static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x00C0, 1);
 	/* Clear interrupts status */
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b7b, 1);
 	/* Enable interrupt */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0x03, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b79, 0x00, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3, 1);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 }
@@ -424,11 +422,13 @@ static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
 	/* Clear interrupts */
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b77, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xFF, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
 
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1102, 0x87, 1);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1f06, 0x86, 1);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b74, 0x07, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0x01, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFD, 1);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0x80, 1);
 	/* Wait ~110ms*/
 	usleep_range(110000, 200000);
@@ -487,9 +487,6 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124, 1);
 	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
 
-	/* Clear interrupts, by reading interrupt status registers */
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b7b, 1);
-
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
 	/* If status values are < 0, read error has occurred. */
@@ -499,6 +496,11 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	/* HSDET_AUTO_DONE */
 	if (reg_cdc_status & CS42L42_HSDET_AUTO_DONE) {
 
+		mutex_lock(&spec->cs8409_i2c_mux);
+		/* Disable HSDET_AUTO_DONE */
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFF, 1);
+		mutex_unlock(&spec->cs8409_i2c_mux);
+
 		type = ((reg_hs_status & CS42L42_HSTYPE_MASK) + 1);
 		/* CS42L42 reports optical jack as type 4
 		 * We don't handle optical jack
@@ -521,6 +523,11 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 			}
 		}
 
+		mutex_lock(&spec->cs8409_i2c_mux);
+		/* Re-Enable Tip Sense Interrupt */
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3, 1);
+		mutex_unlock(&spec->cs8409_i2c_mux);
+
 	} else {
 		/* TIP_SENSE INSERT/REMOVE */
 		switch (reg_ts_status) {
-- 
2.25.1

