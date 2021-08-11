Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBA63E9871
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BC18193E;
	Wed, 11 Aug 2021 21:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BC18193E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628709271;
	bh=TA0JC9f9sFbe86aMznLux6wa/YBvjCQvjHexei855sc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0XLpkgH5rEFS2NsVQE6PMcRjTb80UBCQP6oMG5oIme75irODguCuiziHpdpmDkDd
	 JYcIbCFakN8tQABO6CJxrV4EZgb6wjZT9QaZGnv/peVmh3MtJgSwkTJ43Iy5cnppeQ
	 +omcE2HuEkggbW05oIROVauCZRtS8ni1hF17s2oQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A78CDF8032D;
	Wed, 11 Aug 2021 21:12:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23172F804B4; Wed, 11 Aug 2021 21:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF2B9F8020D
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 21:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF2B9F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Hy69F5qD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B9hdxw013981; 
 Wed, 11 Aug 2021 14:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4KIkoP2u0ZyoBkPyWp6RZOY6CPdWZhUFe+qKIvXgejQ=;
 b=Hy69F5qDe+dyVxTiDoE24l7Xwxo/TvIlES0iKZtsiE1udNCd7yknHb3VlS6KNHSPOCRT
 utIpaWOLXBZGxq+e3pPvxAHz0F1a682HaGyCARxxeGmUwid9ijv1dRS5nUmtHb4yAToB
 EVhWOmLs2UEsHWi/kchNVUPbetdLgOWJbi66o04jJOy/TmGSjgiLTlON5mAzBbMDxN6L
 7Ach4a747d0gPaXY1z1py4YBsbMnrrh0UNyBqKd+xUCq8bIOgLS7wKirnS0oorG+cFbz
 vI4L7BwLr05X7zwTYR1mWDAlOnVsjy+Xn9qcpRsePBf2c0Ug1bg3ZVUK73BMz4Rr5C6d eQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3acc5ngpgw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 14:12:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:30 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E8A7745D;
 Wed, 11 Aug 2021 18:57:29 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 16/27] ALSA: hda/cs8409: Support i2c bulk read/write
 functions
Date: Wed, 11 Aug 2021 19:56:43 +0100
Message-ID: <20210811185654.6837-17-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0ERkoQxUiUZyGkF_2hNH_hg2-0Ch89dq
X-Proofpoint-GUID: 0ERkoQxUiUZyGkF_2hNH_hg2-0Ch89dq
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110132
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

This allows mutex locks to be moved into i2c functions, as
the bulk read/write functions can lock/unlock themselves to
prevent interruption of sequence reads/writes.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409-tables.c |   3 +-
 sound/pci/hda/patch_cs8409.c        | 208 +++++++++++++++++-----------
 sound/pci/hda/patch_cs8409.h        |   8 +-
 3 files changed, 136 insertions(+), 83 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index b03ddef2a25f..0f2fd8bb92bf 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -146,7 +146,7 @@ const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
 };
 
 /* Vendor specific HW configuration for CS42L42 */
-const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
+const struct cs8409_i2c_param cs42l42_init_reg_seq[CS42L42_INIT_REG_SEQ_SIZE] = {
 	{ 0x1010, 0xB0 },
 	{ 0x1D01, 0x00 },
 	{ 0x1D02, 0x06 },
@@ -206,7 +206,6 @@ const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
 	{ 0x1320, 0xff },
 	{ 0x1b79, 0xff },
 	{ 0x1b7a, 0xff },
-	{} /* Terminator */
 };
 
 /* Vendor specific hw configuration for CS8409 */
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index bb3c6ef5eab6..6c1dbff13aeb 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -86,13 +86,13 @@ static void cs8409_disable_i2c_clock(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
 
-	mutex_lock(&spec->cs8409_i2c_mux);
+	mutex_lock(&spec->i2c_mux);
 	if (spec->i2c_clck_enabled) {
 		cs8409_vendor_coef_set(spec->codec, 0x0,
 			       cs8409_vendor_coef_get(spec->codec, 0x0) & 0xfffffff7);
 		spec->i2c_clck_enabled = 0;
 	}
-	mutex_unlock(&spec->cs8409_i2c_mux);
+	mutex_unlock(&spec->i2c_mux);
 }
 
 /*
@@ -195,12 +195,12 @@ static int cs8409_i2c_set_page(struct hda_codec *codec, unsigned int i2c_reg)
  * cs8409_i2c_read - CS8409 I2C Read.
  * @codec: the codec instance
  * @i2c_address: I2C Address
- * @i2c_reg: Register to read
+ * @addr: Register to read
  *
  * CS8409 I2C Read.
  * Returns negative on error, otherwise returns read value in bits 0-7.
  */
-static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, unsigned int i2c_reg)
+static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, unsigned int addr)
 {
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
@@ -209,41 +209,90 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 	if (spec->cs42l42_suspended)
 		return -EPERM;
 
+	mutex_lock(&spec->i2c_mux);
 	cs8409_enable_i2c_clock(codec);
 	cs8409_set_i2c_dev_addr(codec, i2c_address);
 
-	if (cs8409_i2c_set_page(codec, i2c_reg)) {
+	if (cs8409_i2c_set_page(codec, addr)) {
 		codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
-			__func__, i2c_address, i2c_reg);
+			__func__, i2c_address, addr);
 		return -EIO;
 	}
 
-	i2c_reg_data = (i2c_reg << 8) & 0x0ffff;
+	i2c_reg_data = (addr << 8) & 0x0ffff;
 	cs8409_vendor_coef_set(codec, CS8409_I2C_QREAD, i2c_reg_data);
-	if (cs8409_i2c_wait_complete(codec) < 0) {
-		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x\n",
-			  __func__, i2c_address, i2c_reg);
-		return -EIO;
-	}
+	if (cs8409_i2c_wait_complete(codec) < 0)
+		goto error;
 
 	/* Register in bits 15-8 and the data in 7-0 */
 	read_data = cs8409_vendor_coef_get(codec, CS8409_I2C_QREAD);
 
+	mutex_unlock(&spec->i2c_mux);
 	return read_data & 0x0ff;
+
+error:
+	mutex_unlock(&spec->i2c_mux);
+	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, i2c_address, addr);
+	return -EIO;
+}
+
+/**
+ * cs8409_i2c_bulk_read - CS8409 I2C Read Sequence.
+ * @codec: the codec instance
+ * @seq: Register Sequence to read
+ * @count: Number of registeres to read
+ *
+ * Returns negative on error, values are read into value element of cs8409_i2c_param sequence.
+ */
+static int cs8409_i2c_bulk_read(struct hda_codec *codec, unsigned int i2c_address,
+				struct cs8409_i2c_param *seq, int count)
+{
+	struct cs8409_spec *spec = codec->spec;
+	unsigned int i2c_reg_data;
+	int i;
+
+	if (spec->cs42l42_suspended)
+		return -EPERM;
+
+	mutex_lock(&spec->i2c_mux);
+	cs8409_set_i2c_dev_addr(codec, i2c_address);
+
+	for (i = 0; i < count; i++) {
+		cs8409_enable_i2c_clock(codec);
+		if (cs8409_i2c_set_page(codec, seq[i].addr))
+			goto error;
+
+		i2c_reg_data = (seq[i].addr << 8) & 0x0ffff;
+		cs8409_vendor_coef_set(codec, CS8409_I2C_QREAD, i2c_reg_data);
+
+		if (cs8409_i2c_wait_complete(codec) < 0)
+			goto error;
+
+		seq[i].value = cs8409_vendor_coef_get(codec, CS8409_I2C_QREAD) & 0xff;
+	}
+
+	mutex_unlock(&spec->i2c_mux);
+
+	return 0;
+
+error:
+	mutex_unlock(&spec->i2c_mux);
+	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", i2c_address);
+	return -EIO;
 }
 
 /**
  * cs8409_i2c_write - CS8409 I2C Write.
  * @codec: the codec instance
  * @i2c_address: I2C Address
- * @i2c_reg: Register to write to
- * @i2c_data: Data to write
+ * @addr: Register to write to
+ * @value: Data to write
  *
  * CS8409 I2C Write.
  * Returns negative on error, otherwise returns 0.
  */
-static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, unsigned int i2c_reg,
-			    unsigned int i2c_data)
+static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, unsigned int addr,
+			    unsigned int value)
 {
 	struct cs8409_spec *spec = codec->spec;
 	unsigned int i2c_reg_data;
@@ -251,25 +300,73 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 	if (spec->cs42l42_suspended)
 		return -EPERM;
 
+	mutex_lock(&spec->i2c_mux);
+
 	cs8409_enable_i2c_clock(codec);
 	cs8409_set_i2c_dev_addr(codec, i2c_address);
 
-	if (cs8409_i2c_set_page(codec, i2c_reg)) {
+	if (cs8409_i2c_set_page(codec, addr)) {
 		codec_err(codec, "%s() Paged Transaction Failed 0x%02x : 0x%04x\n",
-			__func__, i2c_address, i2c_reg);
+			__func__, i2c_address, addr);
 		return -EIO;
 	}
 
-	i2c_reg_data = ((i2c_reg << 8) & 0x0ff00) | (i2c_data & 0x0ff);
+	i2c_reg_data = ((addr << 8) & 0x0ff00) | (value & 0x0ff);
 	cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg_data);
 
-	if (cs8409_i2c_wait_complete(codec) < 0) {
-		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x\n",
-			__func__, i2c_address, i2c_reg);
-		return -EIO;
+	if (cs8409_i2c_wait_complete(codec) < 0)
+		goto error;
+
+	mutex_unlock(&spec->i2c_mux);
+	return 0;
+
+error:
+	mutex_unlock(&spec->i2c_mux);
+	codec_err(codec, "%s() Failed 0x%02x : 0x%04x\n", __func__, i2c_address, addr);
+	return -EIO;
+}
+
+/**
+ * cs8409_i2c_bulk_write - CS8409 I2C Write Sequence.
+ * @codec: the codec instance
+ * @seq: Register Sequence to write
+ * @count: Number of registeres to write
+ *
+ * Returns negative on error.
+ */
+static int cs8409_i2c_bulk_write(struct hda_codec *codec, unsigned int i2c_address,
+				 const struct cs8409_i2c_param *seq, int count)
+{
+	struct cs8409_spec *spec = codec->spec;
+	unsigned int i2c_reg_data;
+	int i;
+
+	if (spec->cs42l42_suspended)
+		return -EPERM;
+
+	mutex_lock(&spec->i2c_mux);
+	cs8409_set_i2c_dev_addr(codec, i2c_address);
+
+	for (i = 0; i < count; i++) {
+		cs8409_enable_i2c_clock(codec);
+		if (cs8409_i2c_set_page(codec, seq[i].addr))
+			goto error;
+
+		i2c_reg_data = ((seq[i].addr << 8) & 0x0ff00) | (seq[i].value & 0x0ff);
+		cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg_data);
+
+		if (cs8409_i2c_wait_complete(codec) < 0)
+			goto error;
 	}
 
+	mutex_unlock(&spec->i2c_mux);
+
 	return 0;
+
+error:
+	mutex_unlock(&spec->i2c_mux);
+	codec_err(codec, "I2C Bulk Write Failed 0x%02x\n", i2c_address);
+	return -EIO;
 }
 
 int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo)
@@ -333,7 +430,6 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 
 	switch (ofs) {
 	case CS42L42_VOL_DAC:
-		mutex_lock(&spec->cs8409_i2c_mux);
 		if (chs & BIT(0)) {
 			spec->vol[ofs] = *valp;
 			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
@@ -346,16 +442,13 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
 					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK);
 		}
-		mutex_unlock(&spec->cs8409_i2c_mux);
 		break;
 	case CS42L42_VOL_ADC:
-		mutex_lock(&spec->cs8409_i2c_mux);
 		if (chs & BIT(0)) {
 			spec->vol[ofs] = *valp;
 			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
 					 spec->vol[ofs] & CS8409_CS42L42_REG_AMIC_VOL_MASK);
 		}
-		mutex_unlock(&spec->cs8409_i2c_mux);
 		break;
 	default:
 		break;
@@ -368,6 +461,12 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 static void cs8409_cs42l42_reset(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
+	struct cs8409_i2c_param irq_regs[] = {
+		{ 0x1308, 0x00 },
+		{ 0x1309, 0x00 },
+		{ 0x130A, 0x00 },
+		{ 0x130F, 0x00 },
+	};
 
 	/* Assert RTS# line */
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
@@ -381,25 +480,13 @@ static void cs8409_cs42l42_reset(struct hda_codec *codec)
 	spec->cs42l42_suspended = 0;
 	spec->last_page = 0;
 
-	mutex_lock(&spec->cs8409_i2c_mux);
-
 	/* Clear interrupts, by reading interrupt status registers */
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1309);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130A);
-	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130F);
-
-	mutex_unlock(&spec->cs8409_i2c_mux);
-
+	cs8409_i2c_bulk_read(codec, CS42L42_I2C_ADDR, irq_regs, ARRAY_SIZE(irq_regs));
 }
 
 /* Configure CS42L42 slave codec for jack autodetect */
 static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 {
-	struct cs8409_spec *spec = codec->spec;
-
-	mutex_lock(&spec->cs8409_i2c_mux);
-
 	/* Set TIP_SENSE_EN for analog front-end of tip sense.
 	 * Additionally set HSBIAS_SENSE_EN for some variants.
 	 */
@@ -418,17 +505,11 @@ static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
 	/* Enable interrupt */
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3);
-
-	mutex_unlock(&spec->cs8409_i2c_mux);
 }
 
 /* Enable and run CS42L42 slave codec jack auto detect */
 static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
 {
-	struct cs8409_spec *spec = codec->spec;
-
-	mutex_lock(&spec->cs8409_i2c_mux);
-
 	/* Clear interrupts */
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b77);
@@ -447,22 +528,6 @@ static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
 	/* Wait ~10ms */
 	usleep_range(10000, 25000);
 
-	mutex_unlock(&spec->cs8409_i2c_mux);
-
-}
-
-static void cs8409_cs42l42_reg_setup(struct hda_codec *codec)
-{
-	const struct cs8409_i2c_param *seq = cs42l42_init_reg_seq;
-	struct cs8409_spec *spec = codec->spec;
-
-	mutex_lock(&spec->cs8409_i2c_mux);
-
-	for (; seq->addr; seq++)
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, seq->addr, seq->reg);
-
-	mutex_unlock(&spec->cs8409_i2c_mux);
-
 }
 
 /*
@@ -490,15 +555,11 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	if (res & CS8409_CS42L42_INT)
 		return;
 
-	mutex_lock(&spec->cs8409_i2c_mux);
-
 	/* Read jack detect status registers */
 	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
 	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124);
 	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f);
 
-	mutex_unlock(&spec->cs8409_i2c_mux);
-
 	/* If status values are < 0, read error has occurred. */
 	if (reg_cdc_status < 0 || reg_hs_status < 0 || reg_ts_status < 0)
 		return;
@@ -506,10 +567,8 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	/* HSDET_AUTO_DONE */
 	if (reg_cdc_status & CS42L42_HSDET_AUTO_DONE) {
 
-		mutex_lock(&spec->cs8409_i2c_mux);
 		/* Disable HSDET_AUTO_DONE */
 		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0xFF);
-		mutex_unlock(&spec->cs8409_i2c_mux);
 
 		type = ((reg_hs_status & CS42L42_HSTYPE_MASK) + 1);
 		/* CS42L42 reports optical jack as type 4
@@ -533,10 +592,8 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 			}
 		}
 
-		mutex_lock(&spec->cs8409_i2c_mux);
 		/* Re-Enable Tip Sense Interrupt */
 		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0xF3);
-		mutex_unlock(&spec->cs8409_i2c_mux);
 
 	} else {
 		/* TIP_SENSE INSERT/REMOVE */
@@ -600,10 +657,8 @@ static int cs8409_suspend(struct hda_codec *codec)
 
 	cs8409_enable_ur(codec, 0);
 
-	mutex_lock(&spec->cs8409_i2c_mux);
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe);
-	mutex_unlock(&spec->cs8409_i2c_mux);
 
 	spec->cs42l42_suspended = 1;
 
@@ -660,26 +715,23 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	cs8409_cs42l42_reset(codec);
 
 	/* Initialise CS42L42 companion codec */
-	cs8409_cs42l42_reg_setup(codec);
+	cs8409_i2c_bulk_write(codec, CS42L42_I2C_ADDR, cs42l42_init_reg_seq,
+			      CS42L42_INIT_REG_SEQ_SIZE);
 
 	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_CYBORG) {
 		/* FULL_SCALE_VOL = 0 for Warlock / Cyborg */
-		mutex_lock(&spec->cs8409_i2c_mux);
 		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01);
-		mutex_unlock(&spec->cs8409_i2c_mux);
 		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
 		cs8409_vendor_coef_set(codec, 0x09, 0x0003);
 	}
 
 	/* Restore Volumes after Resume */
-	mutex_lock(&spec->cs8409_i2c_mux);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
 			 -(spec->vol[1]) & CS8409_CS42L42_REG_HS_VOL_MASK);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
 			 -(spec->vol[2]) & CS8409_CS42L42_REG_HS_VOL_MASK);
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
 			 spec->vol[0] & CS8409_CS42L42_REG_AMIC_VOL_MASK);
-	mutex_unlock(&spec->cs8409_i2c_mux);
 
 	cs8409_cs42l42_enable_jack_detect(codec);
 
@@ -768,7 +820,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->exec_verb = codec->core.exec_verb;
 		codec->core.exec_verb = cs8409_cs42l42_exec_verb;
 
-		mutex_init(&spec->cs8409_i2c_mux);
+		mutex_init(&spec->i2c_mux);
 
 		codec->patch_ops = cs8409_cs42l42_patch_ops;
 
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index ee66fd0c01dc..d84cda94dfb9 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -243,6 +243,8 @@ enum cs8409_coefficient_index_registers {
 #define CS8409_CS42L42_DMIC_PIN_NID		CS8409_PIN_DMIC1_IN
 #define CS8409_CS42L42_DMIC_ADC_PIN_NID		CS8409_PIN_DMIC1
 
+#define CS42L42_INIT_REG_SEQ_SIZE		59
+
 enum {
 	CS8409_BULLSEYE,
 	CS8409_WARLOCK,
@@ -257,7 +259,7 @@ enum {
 
 struct cs8409_i2c_param {
 	unsigned int addr;
-	unsigned int reg;
+	unsigned int value;
 };
 
 struct cs8409_cir_param {
@@ -279,7 +281,7 @@ struct cs8409_spec {
 	unsigned int cs42l42_suspended:1;
 	s8 vol[CS42L42_VOLUMES];
 
-	struct mutex cs8409_i2c_mux;
+	struct mutex i2c_mux;
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
@@ -303,7 +305,7 @@ extern const struct hda_model_fixup cs8409_models[];
 extern const struct hda_fixup cs8409_fixups[];
 extern const struct hda_verb cs8409_cs42l42_init_verbs[];
 extern const struct hda_pintbl cs8409_cs42l42_pincfgs[];
-extern const struct cs8409_i2c_param cs42l42_init_reg_seq[];
+extern const struct cs8409_i2c_param cs42l42_init_reg_seq[CS42L42_INIT_REG_SEQ_SIZE];
 extern const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[];
 extern const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[];
 
-- 
2.25.1

