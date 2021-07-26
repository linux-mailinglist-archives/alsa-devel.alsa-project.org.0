Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AA3D667E
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA14173E;
	Mon, 26 Jul 2021 20:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA14173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627322905;
	bh=KkAIHAjRKD8QDvHbPr4UCcNeJDIPtPNYtonU9iB9ono=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZwESFyQemOH8l+iTozCdqyqRul1Ci+L4tgMQyVVpsAB+KUMgXSZ3I55L8oxZG1KVn
	 jWW+1CHQZLpvAD0DGCrG+Vew+gDr9arDomPPJOFiOV8XHVSu2iSkFQowOLowO6CwXM
	 tLbysEehPaUnqIB4exvpmh2YfjBy9IbmYu12NYSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D03DF80527;
	Mon, 26 Jul 2021 20:03:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8764BF80539; Mon, 26 Jul 2021 20:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88677F804DF
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88677F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ntPDRYLp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYdC012545; 
 Mon, 26 Jul 2021 13:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EA33rxlPIYr6HlM+t7bBMFNWbHOtHVrHP2BieJBPn2I=;
 b=ntPDRYLpYKD18MypV1V8LgXVRECxWkWf0E9CgfgX3wMR1CrIkFD5SOJlcg08qabrShXl
 4qIE6m160I1SnGzQCpc+gIy0wjwleDnKyKZdMEXFNxCZbaYjFQUxVlQ/q+yX++cI12u8
 Uh/H0yNNa6QuChR1vnp2BlGzgRwnNiyKfhZWHxWSeOPW103WfjYQ0k0VkP4F6sgOKZI8
 GQe/UXqbbt8k75FFQrKpQ34yrgVXaCU2uOZHuCLgyGTs1P5EL7iUT57MHb9GtRtDgJkV
 i/VdOUHfwuHPPnt9j4k7oRuzZLuKwD49cmCoU5IYKpZxhIJ26vztn7f4rtLiX5wPhT0d ew== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhhav-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:03:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:08 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 09EA746E;
 Mon, 26 Jul 2021 17:47:08 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 15/27] ALSA: hda/cs8409: Avoid re-setting the same page as the
 last access
Date: Mon, 26 Jul 2021 18:46:28 +0100
Message-ID: <20210726174640.6390-16-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dulAEy8lkR-h0IWy6Rr-Qlv_WtRZdv6E
X-Proofpoint-ORIG-GUID: dulAEy8lkR-h0IWy6Rr-Qlv_WtRZdv6E
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260105
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 124 +++++++++++++++++++----------------
 sound/pci/hda/patch_cs8409.h |   2 +
 2 files changed, 71 insertions(+), 55 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 474b6750e9b4..2f9ffc26bbf5 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -143,18 +143,37 @@ static void cs8409_set_i2c_dev_addr(struct hda_codec *codec, unsigned int addr)
 	}
 }
 
+/**
+ * cs8409_i2c_set_page - CS8409 I2C set page register.
+ * @codec: the codec instance
+ * @i2c_reg: Page register
+ *
+ * Returns negative on error.
+ */
+static int cs8409_i2c_set_page(struct hda_codec *codec, unsigned int i2c_reg)
+{
+	struct cs8409_spec *spec = codec->spec;
+
+	if (spec->paged && (spec->last_page != (i2c_reg >> 8))) {
+		cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg >> 8);
+		if (cs8409_i2c_wait_complete(codec) < 0)
+			return -EIO;
+		spec->last_page = i2c_reg >> 8;
+	}
+
+	return 0;
+}
+
 /**
  * cs8409_i2c_read - CS8409 I2C Read.
  * @codec: the codec instance
  * @i2c_address: I2C Address
  * @i2c_reg: Register to read
- * @paged: Is a paged transaction
  *
  * CS8409 I2C Read.
  * Returns negative on error, otherwise returns read value in bits 0-7.
  */
-static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, unsigned int i2c_reg,
-			   unsigned int paged)
+static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, unsigned int i2c_reg)
 {
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
@@ -166,13 +185,10 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 	cs8409_enable_i2c_clock(codec);
 	cs8409_set_i2c_dev_addr(codec, i2c_address);
 
-	if (paged) {
-		cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg >> 8);
-		if (cs8409_i2c_wait_complete(codec) < 0) {
-			codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
-				__func__, i2c_address, i2c_reg);
-			return -EIO;
-		}
+	if (cs8409_i2c_set_page(codec, i2c_reg)) {
+		codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
+			__func__, i2c_address, i2c_reg);
+		return -EIO;
 	}
 
 	i2c_reg_data = (i2c_reg << 8) & 0x0ffff;
@@ -195,13 +211,12 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
  * @i2c_address: I2C Address
  * @i2c_reg: Register to write to
  * @i2c_data: Data to write
- * @paged: Is a paged transaction
  *
  * CS8409 I2C Write.
  * Returns negative on error, otherwise returns 0.
  */
 static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, unsigned int i2c_reg,
-			    unsigned int i2c_data, unsigned int paged)
+			    unsigned int i2c_data)
 {
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
@@ -212,13 +227,10 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 	cs8409_enable_i2c_clock(codec);
 	cs8409_set_i2c_dev_addr(codec, i2c_address);
 
-	if (paged) {
-		cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg >> 8);
-		if (cs8409_i2c_wait_complete(codec) < 0) {
-			codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
-				__func__, i2c_address, i2c_reg);
-			return -EIO;
-		}
+	if (cs8409_i2c_set_page(codec, i2c_reg)) {
+		codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
+			__func__, i2c_address, i2c_reg);
+		return -EIO;
 	}
 
 	i2c_reg_data = ((i2c_reg << 8) & 0x0ff00) | (i2c_data & 0x0ff);
@@ -298,14 +310,14 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 		if (chs & BIT(0)) {
 			spec->vol[ofs] = *valp;
 			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
-					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
+					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK);
 		}
 		if (chs & BIT(1)) {
 			ofs++;
 			valp++;
 			spec->vol[ofs] = *valp;
 			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
-					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
+					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK);
 		}
 		mutex_unlock(&spec->cs8409_i2c_mux);
 		break;
@@ -314,7 +326,7 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 		if (chs & BIT(0)) {
 			spec->vol[ofs] = *valp;
 			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
-					 spec->vol[ofs] & CS8409_CS42L42_REG_AMIC_VOL_MASK, 1);
+					 spec->vol[ofs] & CS8409_CS42L42_REG_AMIC_VOL_MASK);
 		}
 		mutex_unlock(&spec->cs8409_i2c_mux);
 		break;
@@ -340,14 +352,15 @@ static void cs8409_cs42l42_reset(struct hda_codec *codec)
 	usleep_range(10000, 15000);
 
 	spec->cs42l42_suspended = 0;
+	spec->last_page = 0;
 
 	mutex_lock(&spec->cs8409_i2c_mux);
 
 	/* Clear interrupts, by reading interrupt status registers */
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1309, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130A, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130F, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1309);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130A);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130F);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
@@ -364,20 +377,20 @@ static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 	 * Additionally set HSBIAS_SENSE_EN for some variants.
 	 */
 	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_BULLSEYE)
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b70, 0x0020, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b70, 0x0020);
 	else
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b70, 0x00a0, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b70, 0x00a0);
 
 	/* Clear WAKE# */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x00C1, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x00C1);
 	/* Wait ~2.5ms */
 	usleep_range(2500, 3000);
 	/* Set mode WAKE# output follows the combination logic directly */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x00C0, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x00C0);
 	/* Clear interrupts status */
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
 	/* Enable interrupt */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 }
@@ -390,20 +403,20 @@ static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
 	mutex_lock(&spec->cs8409_i2c_mux);
 
 	/* Clear interrupts */
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b77, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xFF, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
-
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1102, 0x87, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1f06, 0x86, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b74, 0x07, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFD, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0x80, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b77);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xFF);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
+
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1102, 0x87);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1f06, 0x86);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b74, 0x07);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFD);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0x80);
 	/* Wait ~110ms*/
 	usleep_range(110000, 200000);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x111f, 0x77, 1);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0xc0, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x111f, 0x77);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0xc0);
 	/* Wait ~10ms */
 	usleep_range(10000, 25000);
 
@@ -419,7 +432,7 @@ static void cs8409_cs42l42_reg_setup(struct hda_codec *codec)
 	mutex_lock(&spec->cs8409_i2c_mux);
 
 	for (; seq->addr; seq++)
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, seq->addr, seq->reg, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, seq->addr, seq->reg);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
@@ -453,9 +466,9 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	mutex_lock(&spec->cs8409_i2c_mux);
 
 	/* Read jack detect status registers */
-	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
-	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124, 1);
-	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
+	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
+	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124);
+	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
@@ -468,7 +481,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 
 		mutex_lock(&spec->cs8409_i2c_mux);
 		/* Disable HSDET_AUTO_DONE */
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFF, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFF);
 		mutex_unlock(&spec->cs8409_i2c_mux);
 
 		type = ((reg_hs_status & CS42L42_HSTYPE_MASK) + 1);
@@ -495,7 +508,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 
 		mutex_lock(&spec->cs8409_i2c_mux);
 		/* Re-Enable Tip Sense Interrupt */
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3);
 		mutex_unlock(&spec->cs8409_i2c_mux);
 
 	} else {
@@ -562,7 +575,7 @@ static int cs8409_suspend(struct hda_codec *codec)
 
 	mutex_lock(&spec->cs8409_i2c_mux);
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe);
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
 	spec->cs42l42_suspended = 1;
@@ -610,7 +623,7 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_CYBORG) {
 		/* FULL_SCALE_VOL = 0 for Warlock / Cyborg */
 		mutex_lock(&spec->cs8409_i2c_mux);
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01);
 		mutex_unlock(&spec->cs8409_i2c_mux);
 		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
 		cs8409_vendor_coef_set(codec, 0x09, 0x0003);
@@ -619,11 +632,11 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	/* Restore Volumes after Resume */
 	mutex_lock(&spec->cs8409_i2c_mux);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
-			 -(spec->vol[1]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
+			 -(spec->vol[1]) & CS8409_CS42L42_REG_HS_VOL_MASK);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
-			 -(spec->vol[2]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
+			 -(spec->vol[2]) & CS8409_CS42L42_REG_HS_VOL_MASK);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
-			 spec->vol[0] & CS8409_CS42L42_REG_AMIC_VOL_MASK, 1);
+			 spec->vol[0] & CS8409_CS42L42_REG_AMIC_VOL_MASK);
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
 	cs8409_cs42l42_enable_jack_detect(codec);
@@ -730,6 +743,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->cs42l42_mic_jack_in = 0;
 		spec->cs42l42_suspended = 1;
 
+		spec->paged = 1;
 		INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock);
 
 		/* Basic initial sequence for specific hw configuration */
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index c2c208218e34..ee66fd0c01dc 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -283,6 +283,8 @@ struct cs8409_spec {
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
+	unsigned int paged;
+	unsigned int last_page;
 
 	/* verb exec op override */
 	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
-- 
2.25.1

