Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F63396E6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:47:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B95981899;
	Fri, 12 Mar 2021 19:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B95981899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615574862;
	bh=zIp+q+ra/c/W50GxBRgQA7TXeEY9jg7LyhUlaJm31eo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2L9iOgsa/ztYzpYCy5ZspEAxWJidZsl7GYnCUfTjtXuzcIyeVHx7Z0EiJ/m6EG9j
	 y/70QpvdeM/21+rGS7O7qoIcjq1J6z4UHA5ePsY4ciB80hKn6GG+eTytLfhnQgRFRQ
	 zCTTkvBQsccRbkz6Vbs8Uvko1cNJzrBcxaVsKMUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C39F80431;
	Fri, 12 Mar 2021 19:45:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 862C5F802E7; Fri, 12 Mar 2021 19:45:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 252ECF801ED
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:44:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252ECF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d9jGKYlg"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CIRaUC006487; Fri, 12 Mar 2021 12:44:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=s1tCCDhLznul4hsjn+jyyLroOTyj+ZOW9/dLgIx+hn4=;
 b=d9jGKYlgut4rzydJ0C2qYorWMzyzI3Vn3KZI+QZ3Wh36pjPDvFlPOJseTPt19sdwsd8z
 O0X9pfqVaNVvn2ehcGiqql0X2CXrBzhD+kf4luU5l3DGK6XlZGglVSpj8Y894S6O903y
 vNWhKJg5b3he3mzIY1mWz6XlMy7u/fMC7n5OqoYGRpvYyzWiIitzBfW3qgOcf+91aF/S
 UH1x2Y2V6WtDGjmm08RqXYuD+Q9F0ec330ELjf9wq5VCECZkLk+jbCFKx5waI3VDLVcm
 6FD4MlXotL3deA7JBj1yz7lkUzNOZC4NHaFA7Uvj6P2ieFGThA/3UJa77sJLg23TlLi9 DQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 374819gepv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 12 Mar 2021 12:44:55 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 12 Mar
 2021 18:44:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 12 Mar 2021 18:44:53 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EC83211CF;
 Fri, 12 Mar 2021 18:44:52 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/4] ALSA: hda/cirrus: Add error handling into CS8409 I2C
 functions
Date: Fri, 12 Mar 2021 18:44:49 +0000
Message-ID: <20210312184452.3288-2-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312184452.3288-1-vitalyr@opensource.cirrus.com>
References: <20210312184452.3288-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120135
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

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cirrus.c | 95 +++++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 39 deletions(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index 6a9e5c803977..ca8b522b1d6d 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1508,7 +1508,7 @@ static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int flag)
 static int cs8409_i2c_wait_complete(struct hda_codec *codec)
 {
 	int repeat = 5;
-	unsigned int retval = 0;
+	unsigned int retval;
 
 	do {
 		retval = cs_vendor_coef_get(codec, CIR_I2C_STATUS);
@@ -1520,78 +1520,82 @@ static int cs8409_i2c_wait_complete(struct hda_codec *codec)
 
 	} while (repeat);
 
-	return repeat > 0 ? 0 : -1;
+	return !!repeat;
 }
 
-/* CS8409 slave i2cRead */
-static unsigned int cs8409_i2c_read(struct hda_codec *codec,
+/* CS8409 slave i2cRead.
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
+		if (!cs8409_i2c_wait_complete(codec)) {
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
+	if (!cs8409_i2c_wait_complete(codec)) {
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
 
 /* CS8409 slave i2cWrite */
-static unsigned int cs8409_i2c_write(struct hda_codec *codec,
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
+		if (!cs8409_i2c_wait_complete(codec)) {
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
+	if (!cs8409_i2c_wait_complete(codec)) {
+		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x\n",
+			__func__, i2c_address, i2c_reg);
+		return -EIO;
 	}
 
 	cs8409_enable_i2c_clock(codec, 0);
 
-	return retval;
+	return 0;
 }
 
 static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kcontrol,
@@ -1624,14 +1628,27 @@ static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kcontrol,
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
@@ -1782,7 +1799,7 @@ static void cs8409_cs42l42_reset(struct hda_codec *codec)
 }
 
 /* Configure CS42L42 slave codec for jack autodetect */
-static int cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
+static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 {
 	struct cs_spec *spec = codec->spec;
 
@@ -1804,8 +1821,6 @@ static int cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b79, 0x00, 1);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
-
-	return 0;
 }
 
 /* Enable and run CS42L42 slave codec jack auto detect */
@@ -1860,9 +1875,9 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
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
 
@@ -1881,13 +1896,15 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124, 1);
 	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
 
-	/* Clear interrupts */
+	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b7b, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
 
 	mutex_unlock(&spec->cs8409_i2c_mux);
 
+	/* If status values are < 0, read error has occurred. */
+	if ((reg_cdc_status < 0) || (reg_hs_status < 0) || (reg_ts_status < 0))
+		return;
+
 	/* HSDET_AUTO_DONE */
 	if (reg_cdc_status & CS42L42_HSDET_AUTO_DONE) {
 
-- 
2.25.1

