Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B7A33C32E
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:02:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8676418CD;
	Mon, 15 Mar 2021 18:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8676418CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827755;
	bh=VujILP342IgOMq+yES2gEWyDyshc4uf8EBMSruPI3xI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mt67P9SNHv/1Ccc9sB7JiaQqx9UFjhihGgGzWIWKQpJoD2En8xRwnXl7mCfZn2jX9
	 A07iQO6THQpD8VDfh0CXCApRQ/XyPUeIHIrRp74LZjBN8D6/nv4gowJeGPw/7iPss5
	 800u7ahOYF1DPRHg2sMbZGM1RYB16/TWR4nKfEkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46AA0F804ED;
	Mon, 15 Mar 2021 17:58:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3698F804EC; Mon, 15 Mar 2021 17:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B142F801F7
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B142F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZBwHM/kW"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGmgbi030888; Mon, 15 Mar 2021 11:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=F3iz7A2hl2um+VjvJvvrQa9m7vquHoJwGGaFt2eDw2Q=;
 b=ZBwHM/kWF4VVs1E7xTJRaVxSVnPw7eFiZpXMt4r5KO/YBzIgI9Lj7/+EcmkQ5Vzjf7cI
 /rL9/OQufGfGivuspmZrn2SW9u1YIjForfsZwHAgj50lJ7h1AR9klG6DejnRwDp8tAin
 uEaEDp06y3mpyMBgjWl6ZxvhtfEjJVoOrPUNtZKaTkiz6wVrH4Fq8h2lz3EKRHlHCRyi
 eCUDxrGmYGHaeN4z0qV5M4yTRdfLuzXerOta5NUDuL37lT07un7x2K/zV7WbGeSKFBId
 ZCdJwhssNUdY126JVufg8mndpF0dUBJlSJLYe9TIkDpy6pmMAUCjS2onk10YlxnyR4no pA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3790bs2bpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Mar 2021 11:58:12 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 16:57:07 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 16:57:07 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DDF0711D7;
 Mon, 15 Mar 2021 16:57:06 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/4] ALSA: hda/cirrus: Add error handling into CS8409 I2C
 functions
Date: Mon, 15 Mar 2021 16:57:03 +0000
Message-ID: <20210315165706.3629-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315165706.3629-1-vitalyr@opensource.cirrus.com>
References: <20210315165706.3629-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 impostorscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150114
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

Also removing 2 redundant cs8409_i2c_read() calls, as we already did read
them in a code above.

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Changes in v1:
- No changes

Changes in v2:
- Chanaged commit message to describe removal of 2 cs8409_i2c_read()s.
- Added comments for i2c_read/write functions
- Removed redundant parentheses

---
 sound/pci/hda/patch_cirrus.c | 136 +++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 45 deletions(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 6a9e5c803977..6c062c7ab76a 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1493,22 +1493,34 @@ static const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[] = {
 	{} /* Terminator */
 };
 
-/* Enable I2C clocks */
-static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int flag)
+/**
+ * cs8409_enable_i2c_clock - Enable I2C clocks
+ * @codec: the codec instance
+ * @enable: Enable or disable I2C clocks
+ *
+ * Enable or Disable I2C clocks.
+ */
+static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int enable)
 {
 	unsigned int retval = 0;
 	unsigned int newval = 0;
 
 	retval = cs_vendor_coef_get(codec, 0x0);
-	newval = (flag) ? (retval | 0x8) : (retval & 0xfffffff7);
+	newval = (enable) ? (retval | 0x8) : (retval & 0xfffffff7);
 	cs_vendor_coef_set(codec, 0x0, newval);
 }
 
-/* Wait I2C transaction  */
+/**
+ * cs8409_i2c_wait_complete - Wait for I2C transaction
+ * @codec: the codec instance
+ *
+ * Wait for I2C transaction to complete.
+ * Return -1 if transaction wait times out.
+ */
 static int cs8409_i2c_wait_complete(struct hda_codec *codec)
 {
 	int repeat = 5;
-	unsigned int retval = 0;
+	unsigned int retval;
 
 	do {
 		retval = cs_vendor_coef_get(codec, CIR_I2C_STATUS);
@@ -1516,82 +1528,103 @@ static int cs8409_i2c_wait_complete(struct hda_codec *codec)
 			usleep_range(2000, 4000);
 			--repeat;
 		} else
-			break;
+			return 0;
 
 	} while (repeat);
 
-	return repeat > 0 ? 0 : -1;
+	return -1;
 }
 
-/* CS8409 slave i2cRead */
-static unsigned int cs8409_i2c_read(struct hda_codec *codec,
+/**
+ * cs8409_i2c_read - CS8409 I2C Read.
+ * @codec: the codec instance
+ * @i2c_address: I2C Address
+ * @i2c_reg: Register to read
+ * @paged: Is a paged transaction
+ *
+ * CS8409 I2C Read.
+ * Returns negative on error, otherwise returns read value in bits 0-7.
+ */
+static int cs8409_i2c_read(struct hda_codec *codec,
 		unsigned int i2c_address,
 		unsigned int i2c_reg,
 		unsigned int paged)
 {
 	unsigned int i2c_reg_data;
-	unsigned int retval = 0;
+	unsigned int read_data;
 
 	cs8409_enable_i2c_clock(codec, 1);
 	cs_vendor_coef_set(codec, CIR_I2C_ADDR, i2c_address);
 
 	if (paged) {
 		cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg >> 8);
-		if (cs8409_i2c_wait_complete(codec) == -1) {
+		if (cs8409_i2c_wait_complete(codec) < 0) {
 			codec_err(codec,
-				"%s() Paged Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
-				__func__, i2c_address, i2c_reg, retval);
+				"%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
+				__func__, i2c_address, i2c_reg);
+			return -EIO;
 		}
 	}
 
 	i2c_reg_data = (i2c_reg << 8) & 0x0ffff;
 	cs_vendor_coef_set(codec, CIR_I2C_QREAD, i2c_reg_data);
-	if (cs8409_i2c_wait_complete(codec) == -1) {
-		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
-			__func__, i2c_address, i2c_reg, retval);
+	if (cs8409_i2c_wait_complete(codec) < 0) {
+		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x\n",
+			__func__, i2c_address, i2c_reg);
+		return -EIO;
 	}
 
 	/* Register in bits 15-8 and the data in 7-0 */
-	retval = cs_vendor_coef_get(codec, CIR_I2C_QREAD);
-	retval &= 0x0ff;
+	read_data = cs_vendor_coef_get(codec, CIR_I2C_QREAD);
 
 	cs8409_enable_i2c_clock(codec, 0);
 
-	return retval;
+	return read_data & 0x0ff;
 }
 
-/* CS8409 slave i2cWrite */
-static unsigned int cs8409_i2c_write(struct hda_codec *codec,
+/**
+ * cs8409_i2c_read - CS8409 I2C Write.
+ * @codec: the codec instance
+ * @i2c_address: I2C Address
+ * @i2c_reg: Register to write to
+ * @i2c_data: Data to write
+ * @paged: Is a paged transaction
+ *
+ * CS8409 I2C Write.
+ * Returns negative on error, otherwise returns 0.
+ */
+static int cs8409_i2c_write(struct hda_codec *codec,
 		unsigned int i2c_address, unsigned int i2c_reg,
 		unsigned int i2c_data,
 		unsigned int paged)
 {
-	unsigned int retval = 0;
-	unsigned int i2c_reg_data = 0;
+	unsigned int i2c_reg_data;
 
 	cs8409_enable_i2c_clock(codec, 1);
 	cs_vendor_coef_set(codec, CIR_I2C_ADDR, i2c_address);
 
 	if (paged) {
 		cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg >> 8);
-		if (cs8409_i2c_wait_complete(codec) == -1) {
+		if (cs8409_i2c_wait_complete(codec) < 0) {
 			codec_err(codec,
-				"%s() Paged Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
-				__func__, i2c_address, i2c_reg, retval);
+				"%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
+				__func__, i2c_address, i2c_reg);
+			return -EIO;
 		}
 	}
 
 	i2c_reg_data = ((i2c_reg << 8) & 0x0ff00) | (i2c_data & 0x0ff);
 	cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg_data);
 
-	if (cs8409_i2c_wait_complete(codec) == -1) {
-		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
-			__func__, i2c_address, i2c_reg, retval);
+	if (cs8409_i2c_wait_complete(codec) < 0) {
+		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x\n",
+			__func__, i2c_address, i2c_reg);
+		return -EIO;
 	}
 
 	cs8409_enable_i2c_clock(codec, 0);
 
-	return retval;
+	return 0;
 }
 
 static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kcontrol,
@@ -1624,14 +1657,27 @@ static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kcontrol,
 static void cs8409_cs42l42_update_volume(struct hda_codec *codec)
 {
 	struct cs_spec *spec = codec->spec;
+	int data;
 
 	mutex_lock(&spec->cs8409_i2c_mux);
-	spec->cs42l42_hp_volume[0] = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
-				CS8409_CS42L42_REG_HS_VOLUME_CHA, 1));
-	spec->cs42l42_hp_volume[1] = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
-				CS8409_CS42L42_REG_HS_VOLUME_CHB, 1));
-	spec->cs42l42_hs_mic_volume[0] = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
-				CS8409_CS42L42_REG_AMIC_VOLUME, 1));
+	data = cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_HS_VOLUME_CHA, 1);
+	if (data >= 0)
+		spec->cs42l42_hp_volume[0] = -data;
+	else
+		spec->cs42l42_hp_volume[0] = CS8409_CS42L42_HP_VOL_REAL_MIN;
+	data = cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_HS_VOLUME_CHB, 1);
+	if (data >= 0)
+		spec->cs42l42_hp_volume[1] = -data;
+	else
+		spec->cs42l42_hp_volume[1] = CS8409_CS42L42_HP_VOL_REAL_MIN;
+	data = cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_AMIC_VOLUME, 1);
+	if (data >= 0)
+		spec->cs42l42_hs_mic_volume[0] = -data;
+	else
+		spec->cs42l42_hs_mic_volume[0] = CS8409_CS42L42_AMIC_VOL_REAL_MIN;
 	mutex_unlock(&spec->cs8409_i2c_mux);
 	spec->cs42l42_volume_init = 1;
 }
@@ -1782,7 +1828,7 @@ static void cs8409_cs42l42_reset(struct hda_codec *codec)
 }
 
 /* Configure CS42L42 slave codec for jack autodetect */
-static int cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
+static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 {
 	struct cs_spec *spec = codec->spec;
 
@@ -1804,8 +1850,6 @@ static int cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b79, 0x00, 1);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
-
-	return 0;
 }
 
 /* Enable and run CS42L42 slave codec jack auto detect */
@@ -1860,9 +1904,9 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 {
 	struct cs_spec *spec = codec->spec;
 	int status_changed = 0;
-	unsigned int reg_cdc_status = 0;
-	unsigned int reg_hs_status = 0;
-	unsigned int reg_ts_status = 0;
+	int reg_cdc_status;
+	int reg_hs_status;
+	int reg_ts_status;
 	int type = 0;
 	struct hda_jack_tbl *jk;
 
@@ -1881,13 +1925,15 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124, 1);
 	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
 
-	/* Clear interrupts */
+	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b7b, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
+	/* If status values are < 0, read error has occurred. */
+	if (reg_cdc_status < 0 || reg_hs_status < 0 || reg_ts_status < 0)
+		return;
+
 	/* HSDET_AUTO_DONE */
 	if (reg_cdc_status & CS42L42_HSDET_AUTO_DONE) {
 
-- 
2.25.1

