Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC03D6688
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA6C191F;
	Mon, 26 Jul 2021 20:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA6C191F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627323033;
	bh=vOnvhb42vNBf7eXEE7TLX5PRvcGs8rBBdriyTuTeDGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QzsS8RuAxmGgoWcBoOzahEo02XwwbGqNEtSPJURHW/uojO592XfyscbigWISob/js
	 0zSC2YsRZvAgywS1vQAArVR1AMGTSC8V4VSqjkibX69lT3/qqamYs6GVi5rGw7vU4P
	 WCz/5xbPKwPlfYBZXMaB9985ePxtN3b04u3dAzKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1981F8057C;
	Mon, 26 Jul 2021 20:03:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7943F8054A; Mon, 26 Jul 2021 20:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA4EF80527
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA4EF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="eSqi3sew"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYdF012545; 
 Mon, 26 Jul 2021 13:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=uh5qq0jrbin94pNAH82/1OQ3wOvHs88ndVt9ZHEesf0=;
 b=eSqi3sewVfMySk8rqr3fQ81LB29PyLBv1C//TlsAhsvYR3W01IEwKYV2Tn10KFKzRvGT
 VdRuSR1HgmPhLpyIcH+Wwm+9vU2FGjsuyzMR0lBcyHETLP97vARUBq63lwwD9UGwixca
 bnCwE6l13tL4srWRJF50o3hlLvVx28XDT1u1JpUNykz9/1Pbv148K/qX3/yU/WLKf66r
 F8MLFdCg5+/04o29nhR6yOR1jTGwUbCnGhkQrayAAbO6teoTcmfiKS4a89e+o+ICYB14
 v14mcbUGmHjjUA6JriQ/YEiFUgUshKKyKPzdyLUYSEhdkhq7LEZEPmaV8G5J/FIcsLTT AQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhhav-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:03:13 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:09 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AC0022BA;
 Mon, 26 Jul 2021 17:47:08 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 17/27] ALSA: hda/cs8409: Separate CS8409,
 CS42L42 and project functions
Date: Mon, 26 Jul 2021 18:46:30 +0100
Message-ID: <20210726174640.6390-18-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: hoTyBLyoXQ8qv6kTQ5KWtJzeZ_Q3sy4d
X-Proofpoint-ORIG-GUID: hoTyBLyoXQ8qv6kTQ5KWtJzeZ_Q3sy4d
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
 sound/pci/hda/patch_cs8409-tables.c |  18 +-
 sound/pci/hda/patch_cs8409.c        | 315 +++++++++++++++-------------
 sound/pci/hda/patch_cs8409.h        |  24 +--
 3 files changed, 187 insertions(+), 170 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 0f2fd8bb92bf..77a7b2f42128 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -15,20 +15,18 @@
  *
  ******************************************************************************/
 
-static const DECLARE_TLV_DB_SCALE(cs42l42_dac_db_scale,
-	CS8409_CS42L42_HP_VOL_REAL_MIN * 100, 100, 1);
+static const DECLARE_TLV_DB_SCALE(cs42l42_dac_db_scale, CS42L42_HP_VOL_REAL_MIN * 100, 100, 1);
 
-static const DECLARE_TLV_DB_SCALE(cs42l42_adc_db_scale,
-	CS8409_CS42L42_AMIC_VOL_REAL_MIN * 100, 100, 1);
+static const DECLARE_TLV_DB_SCALE(cs42l42_adc_db_scale, CS42L42_AMIC_VOL_REAL_MIN * 100, 100, 1);
 
 const struct snd_kcontrol_new cs42l42_dac_volume_mixer = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.index = 0,
 	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
 	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
-	.info = cs8409_cs42l42_volume_info,
-	.get = cs8409_cs42l42_volume_get,
-	.put = cs8409_cs42l42_volume_put,
+	.info = cs42l42_volume_info,
+	.get = cs42l42_volume_get,
+	.put = cs42l42_volume_put,
 	.tlv = { .p = cs42l42_dac_db_scale },
 	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_TRANSMITTER_A, 3, 0,
 			 HDA_OUTPUT, CS42L42_VOL_DAC) | HDA_AMP_VAL_MIN_MUTE
@@ -39,9 +37,9 @@ const struct snd_kcontrol_new cs42l42_adc_volume_mixer = {
 	.index = 0,
 	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
 	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
-	.info = cs8409_cs42l42_volume_info,
-	.get = cs8409_cs42l42_volume_get,
-	.put = cs8409_cs42l42_volume_put,
+	.info = cs42l42_volume_info,
+	.get = cs42l42_volume_get,
+	.put = cs42l42_volume_put,
 	.tlv = { .p = cs42l42_adc_db_scale },
 	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_RECEIVER_A, 1, 0,
 			 HDA_INPUT, CS42L42_VOL_ADC) | HDA_AMP_VAL_MIN_MUTE
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 2f40030998b1..c17f72b332d5 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -14,6 +14,10 @@
 
 #include "patch_cs8409.h"
 
+/******************************************************************************
+ *                        CS8409 Specific Functions
+ ******************************************************************************/
+
 static int cs8409_parse_auto_config(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
@@ -45,6 +49,8 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
 	return 0;
 }
 
+static void cs8409_disable_i2c_clock(struct work_struct *work);
+
 static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec;
@@ -55,6 +61,8 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	codec->spec = spec;
 	spec->codec = codec;
 	codec->power_save_node = 1;
+	mutex_init(&spec->i2c_mux);
+	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock);
 	snd_hda_gen_spec_init(&spec->gen);
 
 	return spec;
@@ -342,7 +350,67 @@ static int cs8409_i2c_bulk_write(struct hda_codec *codec, unsigned int i2c_addre
 	return -EIO;
 }
 
-int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo)
+static int cs8409_init(struct hda_codec *codec)
+{
+	int ret = snd_hda_gen_init(codec);
+
+	if (!ret)
+		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
+
+	return ret;
+}
+
+static int cs8409_build_controls(struct hda_codec *codec)
+{
+	int err;
+
+	err = snd_hda_gen_build_controls(codec);
+	if (err < 0)
+		return err;
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_BUILD);
+
+	return 0;
+}
+
+/* Enable/Disable Unsolicited Response for gpio(s) 3,4 */
+static void cs8409_enable_ur(struct hda_codec *codec, int flag)
+{
+	/* GPIO4 INT# and GPIO3 WAKE# */
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK,
+			    flag ? CS8409_CS42L42_INT : 0);
+
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_UNSOLICITED_ENABLE,
+			    flag ? AC_UNSOL_ENABLED : 0);
+
+}
+
+static void cs8409_fix_caps(struct hda_codec *codec, unsigned int nid)
+{
+	int caps;
+
+	/* CS8409 is simple HDA bridge and intended to be used with a remote
+	 * companion codec. Most of input/output PIN(s) have only basic
+	 * capabilities. Receive and Transmit NID(s) have only OUTC and INC
+	 * capabilities and no presence detect capable (PDC) and call to
+	 * snd_hda_gen_build_controls() will mark them as non detectable
+	 * phantom jacks. However, a companion codec may be
+	 * connected to these pins which supports jack detect
+	 * capabilities. We have to override pin capabilities,
+	 * otherwise they will not be created as input devices.
+	 */
+	caps = snd_hdac_read_parm(&codec->core, nid, AC_PAR_PIN_CAP);
+	if (caps >= 0)
+		snd_hdac_override_parm(&codec->core, nid, AC_PAR_PIN_CAP,
+				       (caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
+
+	snd_hda_override_wcaps(codec, nid, (get_wcaps(codec, nid) | AC_WCAP_UNSOL_CAP));
+}
+
+/******************************************************************************
+ *                        CS42L42 Specific Functions
+ ******************************************************************************/
+
+int cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo)
 {
 	unsigned int ofs = get_amp_offset(kctrl);
 	u8 chs = get_amp_channels(kctrl);
@@ -353,12 +421,12 @@ int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_i
 
 	switch (ofs) {
 	case CS42L42_VOL_DAC:
-		uinfo->value.integer.min = CS8409_CS42L42_HP_VOL_REAL_MIN;
-		uinfo->value.integer.max = CS8409_CS42L42_HP_VOL_REAL_MAX;
+		uinfo->value.integer.min = CS42L42_HP_VOL_REAL_MIN;
+		uinfo->value.integer.max = CS42L42_HP_VOL_REAL_MAX;
 		break;
 	case CS42L42_VOL_ADC:
-		uinfo->value.integer.min = CS8409_CS42L42_AMIC_VOL_REAL_MIN;
-		uinfo->value.integer.max = CS8409_CS42L42_AMIC_VOL_REAL_MAX;
+		uinfo->value.integer.min = CS42L42_AMIC_VOL_REAL_MIN;
+		uinfo->value.integer.max = CS42L42_AMIC_VOL_REAL_MAX;
 		break;
 	default:
 		break;
@@ -367,7 +435,7 @@ int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_i
 	return 0;
 }
 
-int cs8409_cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
+int cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kctrl);
 	struct cs8409_spec *spec = codec->spec;
@@ -393,7 +461,7 @@ int cs8409_cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 	return 0;
 }
 
-int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
+int cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kctrl);
 	struct cs8409_spec *spec = codec->spec;
@@ -405,22 +473,22 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 	case CS42L42_VOL_DAC:
 		if (chs & BIT(0)) {
 			spec->vol[ofs] = *valp;
-			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
-					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK);
+			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHA,
+					 -(spec->vol[ofs]) & CS42L42_REG_HS_VOL_MASK);
 		}
 		if (chs & BIT(1)) {
 			ofs++;
 			valp++;
 			spec->vol[ofs] = *valp;
-			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
-					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK);
+			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHB,
+					 -(spec->vol[ofs]) & CS42L42_REG_HS_VOL_MASK);
 		}
 		break;
 	case CS42L42_VOL_ADC:
 		if (chs & BIT(0)) {
 			spec->vol[ofs] = *valp;
-			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
-					 spec->vol[ofs] & CS8409_CS42L42_REG_AMIC_VOL_MASK);
+			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_AMIC_VOL,
+					 spec->vol[ofs] & CS42L42_REG_AMIC_VOL_MASK);
 		}
 		break;
 	default:
@@ -430,35 +498,8 @@ int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_va
 	return 0;
 }
 
-/* Assert/release RTS# line to CS42L42 */
-static void cs8409_cs42l42_reset(struct hda_codec *codec)
-{
-	struct cs8409_spec *spec = codec->spec;
-	struct cs8409_i2c_param irq_regs[] = {
-		{ 0x1308, 0x00 },
-		{ 0x1309, 0x00 },
-		{ 0x130A, 0x00 },
-		{ 0x130F, 0x00 },
-	};
-
-	/* Assert RTS# line */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
-	/* wait ~10ms */
-	usleep_range(10000, 15000);
-	/* Release RTS# line */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, CS8409_CS42L42_RESET);
-	/* wait ~10ms */
-	usleep_range(10000, 15000);
-
-	spec->cs42l42_suspended = 0;
-	spec->last_page = 0;
-
-	/* Clear interrupts, by reading interrupt status registers */
-	cs8409_i2c_bulk_read(codec, CS42L42_I2C_ADDR, irq_regs, ARRAY_SIZE(irq_regs));
-}
-
 /* Configure CS42L42 slave codec for jack autodetect */
-static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
+static void cs42l42_enable_jack_detect(struct hda_codec *codec)
 {
 	/* Set TIP_SENSE_EN for analog front-end of tip sense.
 	 * Additionally set HSBIAS_SENSE_EN for some variants.
@@ -481,7 +522,7 @@ static void cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
 }
 
 /* Enable and run CS42L42 slave codec jack auto detect */
-static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
+static void cs42l42_run_jack_detect(struct hda_codec *codec)
 {
 	/* Clear interrupts */
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
@@ -503,14 +544,7 @@ static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
 
 }
 
-/*
- * In the case of CS8409 we do not have unsolicited events from NID's 0x24
- * and 0x34 where hs mic and hp are connected. Companion codec CS42L42 will
- * generate interrupt via gpio 4 to notify jack events. We have to overwrite
- * generic snd_hda_jack_unsol_event(), read CS42L42 jack detect status registers
- * and then notify status via generic snd_hda_jack_unsol_event() call.
- */
-static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
+static int cs42l42_jack_unsol_event(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
 	int status_changed = 0;
@@ -518,15 +552,6 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	int reg_hs_status;
 	int reg_ts_status;
 	int type;
-	struct hda_jack_tbl *jk;
-
-	/* jack_unsol_event() will be called every time gpio line changing state.
-	 * In this case gpio4 line goes up as a result of reading interrupt status
-	 * registers in previous cs8409_jack_unsol_event() call.
-	 * We don't need to handle this event, ignoring...
-	 */
-	if (res & CS8409_CS42L42_INT)
-		return;
 
 	/* Read jack detect status registers */
 	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308);
@@ -535,7 +560,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 
 	/* If status values are < 0, read error has occurred. */
 	if (reg_cdc_status < 0 || reg_hs_status < 0 || reg_ts_status < 0)
-		return;
+		return -EIO;
 
 	/* HSDET_AUTO_DONE */
 	if (reg_cdc_status & CS42L42_HSDET_AUTO_DONE) {
@@ -572,7 +597,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 		/* TIP_SENSE INSERT/REMOVE */
 		switch (reg_ts_status) {
 		case CS42L42_JACK_INSERTED:
-			cs8409_cs42l42_run_jack_detect(codec);
+			cs42l42_run_jack_detect(codec);
 			break;
 
 		case CS42L42_JACK_REMOVED:
@@ -590,48 +615,94 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 		}
 	}
 
-	if (status_changed) {
+	return status_changed;
+}
 
+/* Assert/release RTS# line to CS42L42 */
+static void cs42l42_reset(struct hda_codec *codec)
+{
+	struct cs8409_spec *spec = codec->spec;
+	struct cs8409_i2c_param irq_regs[] = {
+		{ 0x1308, 0x00 },
+		{ 0x1309, 0x00 },
+		{ 0x130A, 0x00 },
+		{ 0x130F, 0x00 },
+	};
+
+	/* Assert RTS# line */
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
+	/* wait ~10ms */
+	usleep_range(10000, 15000);
+	/* Release RTS# line */
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, CS8409_CS42L42_RESET);
+	/* wait ~10ms */
+	usleep_range(10000, 15000);
+
+	spec->cs42l42_suspended = 0;
+	spec->last_page = 0;
+
+	/* Clear interrupts, by reading interrupt status registers */
+	cs8409_i2c_bulk_read(codec, CS42L42_I2C_ADDR, irq_regs, ARRAY_SIZE(irq_regs));
+}
+
+#ifdef CONFIG_PM
+static void cs42l42_suspend(struct hda_codec *codec)
+{
+	/* Power down CS42L42 ASP/EQ/MIX/HP */
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe);
+}
+#endif
+
+/******************************************************************************
+ *                   BULLSEYE / WARLOCK / CYBORG Specific Functions
+ *                               CS8409/CS42L42
+ ******************************************************************************/
+
+/*
+ * In the case of CS8409 we do not have unsolicited events from NID's 0x24
+ * and 0x34 where hs mic and hp are connected. Companion codec CS42L42 will
+ * generate interrupt via gpio 4 to notify jack events. We have to overwrite
+ * generic snd_hda_jack_unsol_event(), read CS42L42 jack detect status registers
+ * and then notify status via generic snd_hda_jack_unsol_event() call.
+ */
+static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
+{
+	struct cs8409_spec *spec = codec->spec;
+	struct hda_jack_tbl *jk;
+
+	/* jack_unsol_event() will be called every time gpio line changing state.
+	 * In this case gpio4 line goes up as a result of reading interrupt status
+	 * registers in previous cs8409_jack_unsol_event() call.
+	 * We don't need to handle this event, ignoring...
+	 */
+	if (res & CS8409_CS42L42_INT)
+		return;
+
+	if (cs42l42_jack_unsol_event(codec)) {
 		snd_hda_set_pin_ctl(codec, CS8409_CS42L42_SPK_PIN_NID,
 				    spec->cs42l42_hp_jack_in ? 0 : PIN_OUT);
-
 		/* Report jack*/
 		jk = snd_hda_jack_tbl_get_mst(codec, CS8409_CS42L42_HP_PIN_NID, 0);
-		if (jk) {
+		if (jk)
 			snd_hda_jack_unsol_event(codec, (jk->tag << AC_UNSOL_RES_TAG_SHIFT) &
 							AC_UNSOL_RES_TAG);
-		}
 		/* Report jack*/
 		jk = snd_hda_jack_tbl_get_mst(codec, CS8409_CS42L42_AMIC_PIN_NID, 0);
-		if (jk) {
+		if (jk)
 			snd_hda_jack_unsol_event(codec, (jk->tag << AC_UNSOL_RES_TAG_SHIFT) &
 							 AC_UNSOL_RES_TAG);
-		}
 	}
 }
 
-/* Enable/Disable Unsolicited Response for gpio(s) 3,4 */
-static void cs8409_enable_ur(struct hda_codec *codec, int flag)
-{
-	/* GPIO4 INT# and GPIO3 WAKE# */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK,
-			    flag ? CS8409_CS42L42_INT : 0);
-
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_UNSOLICITED_ENABLE,
-			    flag ? AC_UNSOL_ENABLED : 0);
-
-}
-
 #ifdef CONFIG_PM
 /* Manage PDREF, when transition to D3hot */
-static int cs8409_suspend(struct hda_codec *codec)
+static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
 
 	cs8409_enable_ur(codec, 0);
 
-	/* Power down CS42L42 ASP/EQ/MIX/HP */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe);
+	cs42l42_suspend(codec);
 
 	spec->cs42l42_suspended = 1;
 
@@ -670,7 +741,7 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 			cs8409_vendor_coef_set(codec, seq_bullseye->cir, seq_bullseye->coeff);
 
 	/* Reset CS42L42 */
-	cs8409_cs42l42_reset(codec);
+	cs42l42_reset(codec);
 
 	/* Initialise CS42L42 companion codec */
 	cs8409_i2c_bulk_write(codec, CS42L42_I2C_ADDR, cs42l42_init_reg_seq,
@@ -684,49 +755,27 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	}
 
 	/* Restore Volumes after Resume */
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
-			 -(spec->vol[1]) & CS8409_CS42L42_REG_HS_VOL_MASK);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
-			 -(spec->vol[2]) & CS8409_CS42L42_REG_HS_VOL_MASK);
-	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
-			 spec->vol[0] & CS8409_CS42L42_REG_AMIC_VOL_MASK);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHA,
+			 -(spec->vol[1]) & CS42L42_REG_HS_VOL_MASK);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_HS_VOL_CHB,
+			 -(spec->vol[2]) & CS42L42_REG_HS_VOL_MASK);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS42L42_REG_AMIC_VOL,
+			 spec->vol[0] & CS42L42_REG_AMIC_VOL_MASK);
 
-	cs8409_cs42l42_enable_jack_detect(codec);
+	cs42l42_enable_jack_detect(codec);
 
 	/* Enable Unsolicited Response */
 	cs8409_enable_ur(codec, 1);
 }
 
-static int cs8409_cs42l42_init(struct hda_codec *codec)
-{
-	int ret = snd_hda_gen_init(codec);
-
-	if (!ret)
-		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
-
-	return ret;
-}
-
-static int cs8409_build_controls(struct hda_codec *codec)
-{
-	int err;
-
-	err = snd_hda_gen_build_controls(codec);
-	if (err < 0)
-		return err;
-	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_BUILD);
-
-	return 0;
-}
-
 static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
 	.build_controls = cs8409_build_controls,
 	.build_pcms = snd_hda_gen_build_pcms,
-	.init = cs8409_cs42l42_init,
+	.init = cs8409_init,
 	.free = snd_hda_gen_free,
 	.unsol_event = cs8409_jack_unsol_event,
 #ifdef CONFIG_PM
-	.suspend = cs8409_suspend,
+	.suspend = cs8409_cs42l42_suspend,
 #endif
 };
 
@@ -769,7 +818,6 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, u
 void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
 	struct cs8409_spec *spec = codec->spec;
-	int caps;
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
@@ -778,8 +826,6 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->exec_verb = codec->core.exec_verb;
 		codec->core.exec_verb = cs8409_cs42l42_exec_verb;
 
-		mutex_init(&spec->i2c_mux);
-
 		codec->patch_ops = cs8409_cs42l42_patch_ops;
 
 		spec->gen.suppress_auto_mute = 1;
@@ -796,40 +842,13 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->cs42l42_suspended = 1;
 
 		spec->paged = 1;
-		INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock);
 
 		/* Basic initial sequence for specific hw configuration */
 		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
 
-		/* CS8409 is simple HDA bridge and intended to be used with a remote
-		 * companion codec. Most of input/output PIN(s) have only basic
-		 * capabilities. NID(s) 0x24 and 0x34 have only OUTC and INC
-		 * capabilities and no presence detect capable (PDC) and call to
-		 * snd_hda_gen_build_controls() will mark them as non detectable
-		 * phantom jacks. However, in this configuration companion codec
-		 * CS42L42 is connected to these pins and it has jack detect
-		 * capabilities. We have to override pin capabilities,
-		 * otherwise they will not be created as input devices.
-		 */
-		caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_HP_PIN_NID,
-				AC_PAR_PIN_CAP);
-		if (caps >= 0)
-			snd_hdac_override_parm(&codec->core,
-				CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP,
-				(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
-
-		caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
-				AC_PAR_PIN_CAP);
-		if (caps >= 0)
-			snd_hdac_override_parm(&codec->core,
-				CS8409_CS42L42_AMIC_PIN_NID, AC_PAR_PIN_CAP,
-				(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
-
-		snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
-			(get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID) | AC_WCAP_UNSOL_CAP));
-
-		snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
-			(get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID) | AC_WCAP_UNSOL_CAP));
+		cs8409_fix_caps(codec, CS8409_CS42L42_HP_PIN_NID);
+		cs8409_fix_caps(codec, CS8409_CS42L42_AMIC_PIN_NID);
+
 		break;
 	case HDA_FIXUP_ACT_PROBE:
 		/* Set initial DMIC volume to -26 dB */
@@ -853,7 +872,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * been already plugged in.
 		 * Run immediately after init.
 		 */
-		cs8409_cs42l42_run_jack_detect(codec);
+		cs42l42_run_jack_detect(codec);
 		usleep_range(100000, 150000);
 		break;
 	default:
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index d84cda94dfb9..ac68cca2bc11 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -218,15 +218,15 @@ enum cs8409_coefficient_index_registers {
 
 #define CS42L42_VOLUMES				(4U)
 
-#define CS8409_CS42L42_HP_VOL_REAL_MIN		(-63)
-#define CS8409_CS42L42_HP_VOL_REAL_MAX		(0)
-#define CS8409_CS42L42_AMIC_VOL_REAL_MIN	(-97)
-#define CS8409_CS42L42_AMIC_VOL_REAL_MAX	(12)
-#define CS8409_CS42L42_REG_HS_VOL_CHA		(0x2301)
-#define CS8409_CS42L42_REG_HS_VOL_CHB		(0x2303)
-#define CS8409_CS42L42_REG_HS_VOL_MASK		(0x003F)
-#define CS8409_CS42L42_REG_AMIC_VOL		(0x1D03)
-#define CS8409_CS42L42_REG_AMIC_VOL_MASK	(0x00FF)
+#define CS42L42_HP_VOL_REAL_MIN			(-63)
+#define CS42L42_HP_VOL_REAL_MAX			(0)
+#define CS42L42_AMIC_VOL_REAL_MIN		(-97)
+#define CS42L42_AMIC_VOL_REAL_MAX		(12)
+#define CS42L42_REG_HS_VOL_CHA			(0x2301)
+#define CS42L42_REG_HS_VOL_CHB			(0x2303)
+#define CS42L42_REG_HS_VOL_MASK			(0x003F)
+#define CS42L42_REG_AMIC_VOL			(0x1D03)
+#define CS42L42_REG_AMIC_VOL_MASK		(0x00FF)
 #define CS42L42_HSDET_AUTO_DONE			(0x02)
 #define CS42L42_HSTYPE_MASK			(0x03)
 #define CS42L42_JACK_INSERTED			(0x0C)
@@ -296,9 +296,9 @@ struct cs8409_spec {
 extern const struct snd_kcontrol_new cs42l42_dac_volume_mixer;
 extern const struct snd_kcontrol_new cs42l42_adc_volume_mixer;
 
-int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo);
-int cs8409_cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
-int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
+int cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo);
+int cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
+int cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
 
 extern const struct snd_pci_quirk cs8409_fixup_tbl[];
 extern const struct hda_model_fixup cs8409_models[];
-- 
2.25.1

