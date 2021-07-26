Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC5C3D665C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEAE8182F;
	Mon, 26 Jul 2021 20:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEAE8182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627322815;
	bh=44AkMDN6IQQzc7h/q8xJLmdpTbKYsb585scVqCZv7F0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2xBla9ZCcqpFW3IfoBBUxvKIOplc3m9dxUh3r+C0+uFtbSaRUkcmENQtbHa6bm8/
	 95d4Qv3T4bNQ3I7Xp6edO21G4f17H7HGkQVY7nOGQ4/j01qjcp31re6MDAMZ1t1/ki
	 Wi/HT22PFtgXhEoNzThbZJVvwQmOt7ujRqMgkYbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBF97F80533;
	Mon, 26 Jul 2021 20:03:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8243CF804E2; Mon, 26 Jul 2021 20:03:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF57AF8051E
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF57AF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WHG55oiT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYd7012545; 
 Mon, 26 Jul 2021 13:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/hrLdsNQMo8ArenDXk1eJO5DvHhh/7Pp00ThrnIFGPg=;
 b=WHG55oiT0AmzlfqBVW0Tqi/lGIiKxMTsOHQSr1z2GdbTcCSEG1Y5iOCMfoP0LNCRIDrX
 VOeIDZq4msJikP0/yyV9qyogJwg8mm0uXs71QR2OiN354kRY+5/3pgjy8+dPbS8sWFOk
 M+Th5GbjqRyiV3ShXi7TSvjyLKmEj6m+tEJMKOzqt2qvPGv3mlt7OjaiDj9algw9YHCd
 FYd3WdLj8tjyMPDz0i0+z9q8y5aoH/Oodut+fXkIPh3ZPUcBQ4IriI6yt8ynwK+6412W
 u6H7GhxaKVilsu/ZXh1NWznPQ9RZ8o2iP0A2cz8fIXZUgV9v4J5QGS+N1RtLaNOpslEe Pw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhhau-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:03:09 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:06 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 77EC445D;
 Mon, 26 Jul 2021 17:47:05 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 10/27] ALSA: hda/cs8409: Simplify CS42L42 jack detect.
Date: Mon, 26 Jul 2021 18:46:23 +0100
Message-ID: <20210726174640.6390-11-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kYHRllnn1LinxhYSiFMC8I3npOJflEs7
X-Proofpoint-ORIG-GUID: kYHRllnn1LinxhYSiFMC8I3npOJflEs7
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=855
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260105
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

