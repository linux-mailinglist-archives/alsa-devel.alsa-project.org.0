Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1153933C670
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 20:09:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9384018DB;
	Mon, 15 Mar 2021 20:08:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9384018DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615835343;
	bh=kPy0Q2c6IE3JdBFL280C3L9CDJW0wrrsPDK5w7FMtjA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oSxheafFl2j3yHOsVPb5tCBa3qzH+KFXPLB2jXAVgt/msvppt//kJWLLFDXkoMdLq
	 xVkTnHGWaNwSjGJomBP2LjNHdPWV3v6qoPTgJnhP75Bb45PtbDhMxy4rTOMRTEbAPE
	 kebeAt10uYW+IHGqQmKvXqUKAhRNd/oIC+EBI2XI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59F17F80100;
	Mon, 15 Mar 2021 20:07:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 573A6F8023E; Mon, 15 Mar 2021 20:07:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B978F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 20:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B978F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PuGxodko"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FJ65Y8021197; Mon, 15 Mar 2021 14:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=loMjDUZUf1XkjICci9O/dk2diAkntZ2Xc1yrxf1/OAs=;
 b=PuGxodko3j6yelZgBW21Ewg4aHceM/cA49Db4Obd9MPmqlkTnTbxxDwbYtwchACrJH6e
 zE7DGbKzhp0vTEvqdOTKZOwk4Rak6wHwcgb6AsjS3spaVz+SROfJIXQv/AUiCerRnnqE
 Ixrliol4fstZjEHEA2qltBQI0HxicAyQD90Br+dQf1TSjIV7Ujnd/VpW9yIO8sdRC9L1
 Rr5r+JYxid7Xg7Jt8S9rw2IqijxWowyO8w7cVWnNaayZ43W1aKxG1fxh2ISsihytyjOf
 ub8ILiHq3Mc5kkJO3Tb3o5AyU1wLLlPun8Z8kg+5TlDOBxLWLrciZ9ZcNmds9v/pV8/O 5g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 378tpv2t0j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Mar 2021 14:07:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 19:07:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 19:07:17 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BD74F11D7;
 Mon, 15 Mar 2021 19:07:16 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/4] ALSA: hda/cirrus: Add error handling into CS8409 I2C
 functions
Date: Mon, 15 Mar 2021 19:07:13 +0000
Message-ID: <20210315190716.47686-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315190716.47686-1-vitalyr@opensource.cirrus.com>
References: <20210315190716.47686-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150128
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

Changes in v3:
- Fixed warnings Reported-by: kernel test robot <lkp@intel.com>

---
 sound/pci/hda/patch_cirrus.c | 136 +++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 45 deletions(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 6a9e5c803977..d95478ea2fb2 100644
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
+ * cs8409_i2c_write - CS8409 I2C Write.
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

