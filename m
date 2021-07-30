Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9633DBC3D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 525D91FF6;
	Fri, 30 Jul 2021 17:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 525D91FF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627658748;
	bh=0KXmR6duHaFx6e8XWa9ZeeGivs4ck86zDHE0ruejaAw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4pbau7iqZV7b/fcoGRjil6jqajWdsFSXHZEhx4lOvEc6f0SmiWVKjdGSdddqmi6J
	 bZgeDuaqjJMGgdixATs3Gum4HOnyvK7/chsukmN7nV3vM80NpuxwAwPc7rzNqdEi8l
	 ZS3wki0rWCUj/Dajy4X4g+HPaIJdkPVGb/12eCuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECADAF8055A;
	Fri, 30 Jul 2021 17:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E495F804E5; Fri, 30 Jul 2021 17:19:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 910F3F804E5
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910F3F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="LVwzmGqR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UELBKf004490; 
 Fri, 30 Jul 2021 10:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=74oP7/xqNX6orDotETyzf/XTbYFaTr9rGi5Nj2AWXIw=;
 b=LVwzmGqRYN+V/FjO8DUmbdR5q5aXUncRhLHIxgHUFPT93bUArYoXTZBF0XLcFTPS6Mx6
 AlroHKiNtrSLv8HEAGkUj6KCVTNeXYyOYcTwO8NCQFbcaPU+1b81js9eMsxMs+3k1U1h
 +Lz40WQAwuNbglJhU6UAw/AWyiKY6AUtctBC+u+tvfId18+7XlSC96GNX4nsKnDSthXM
 WsvQ5fxtpD2icfKkaSIqegqoqoOwCSvhHylYy9uXpCrbeTq7oxY7sk4FtJeypnW8gvqq
 C58FZywkgDX6sjZ4NrboKl+dMmhDRZKR7e3BDfqVC9mklqt0f3Fre1G2OgKsX+43zM0d Ug== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a41wd181m-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:19:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:19:10 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:19:10 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0A58B45D;
 Fri, 30 Jul 2021 15:19:10 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 15/27] ALSA: hda/cs8409: Avoid re-setting the same page as
 the last access
Date: Fri, 30 Jul 2021 16:18:32 +0100
Message-ID: <20210730151844.7873-16-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
References: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yXlWA1f9QdXSdibjSqbW3iJQFwx7YBWl
X-Proofpoint-ORIG-GUID: yXlWA1f9QdXSdibjSqbW3iJQFwx7YBWl
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300102
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

Changes in v2:
- No changes

Changes in v3:
- No changes

 sound/pci/hda/patch_cs8409.c | 124 +++++++++++++++++++----------------
 sound/pci/hda/patch_cs8409.h |   2 +
 2 files changed, 71 insertions(+), 55 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 194d336cb060..a6aaeabd2279 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -155,18 +155,37 @@ static void cs8409_set_i2c_dev_addr(struct hda_codec *codec, unsigned int addr)
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
@@ -178,13 +197,10 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
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
@@ -207,13 +223,12 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
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
@@ -224,13 +239,10 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
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
@@ -310,14 +322,14 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
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
@@ -326,7 +338,7 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 		if (chs & BIT(0)) {
 			spec->vol[ofs] = *valp;
 			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
-					 spec->vol[ofs] & CS8409_CS42L42_REG_AMIC_VOL_MASK, 1);
+					 spec->vol[ofs] & CS8409_CS42L42_REG_AMIC_VOL_MASK);
 		}
 		mutex_unlock(&spec->cs8409_i2c_mux);
 		break;
@@ -352,14 +364,15 @@ static void cs8409_cs42l42_reset(struct hda_codec *codec)
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
 
@@ -376,20 +389,20 @@ static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
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
@@ -402,20 +415,20 @@ static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
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
 
@@ -431,7 +444,7 @@ static void cs8409_cs42l42_reg_setup(struct hda_codec *codec)
 	mutex_lock(&spec->cs8409_i2c_mux);
 
 	for (; seq->addr; seq++)
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, seq->addr, seq->reg, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, seq->addr, seq->reg);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
@@ -465,9 +478,9 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	mutex_lock(&spec->cs8409_i2c_mux);
 
 	/* Read jack detect status registers */
-	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
-	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124, 1);
-	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
+	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
+	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124);
+	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
@@ -480,7 +493,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 
 		mutex_lock(&spec->cs8409_i2c_mux);
 		/* Disable HSDET_AUTO_DONE */
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFF, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFF);
 		mutex_unlock(&spec->cs8409_i2c_mux);
 
 		type = ((reg_hs_status & CS42L42_HSTYPE_MASK) + 1);
@@ -507,7 +520,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 
 		mutex_lock(&spec->cs8409_i2c_mux);
 		/* Re-Enable Tip Sense Interrupt */
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3);
 		mutex_unlock(&spec->cs8409_i2c_mux);
 
 	} else {
@@ -574,7 +587,7 @@ static int cs8409_suspend(struct hda_codec *codec)
 
 	mutex_lock(&spec->cs8409_i2c_mux);
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe);
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
 	spec->cs42l42_suspended = 1;
@@ -630,7 +643,7 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_CYBORG) {
 		/* FULL_SCALE_VOL = 0 for Warlock / Cyborg */
 		mutex_lock(&spec->cs8409_i2c_mux);
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01, 1);
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01);
 		mutex_unlock(&spec->cs8409_i2c_mux);
 		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
 		cs8409_vendor_coef_set(codec, 0x09, 0x0003);
@@ -639,11 +652,11 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
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
@@ -749,6 +762,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->cs42l42_hp_jack_in = 0;
 		spec->cs42l42_mic_jack_in = 0;
 		spec->cs42l42_suspended = 1;
+		spec->paged = 1;
 
 		/* Basic initial sequence for specific hw configuration */
 		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
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

