Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A23E9870
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A757D1930;
	Wed, 11 Aug 2021 21:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A757D1930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628709256;
	bh=o+0QcqfzsDg0iWyawVc/QESr2znTt5+op2gOxVDm7Dg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRPLBjPynK/jknB3uQpC+6T2pPLnZssmCF0YO1lnjWlHd+RUP8xTSnV8uQX5dM6yB
	 tU/myDIY2SFxiy6KRWlIQAaxvrCtr35mAEh7MxvkiHwSo+uHSe/74iKntjJqP/G8+a
	 VVPLnp1fS7Ihsuw/4tNDi6rkhZc1ziS2F4lY1noU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B927CF804D2;
	Wed, 11 Aug 2021 21:12:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7662F804CC; Wed, 11 Aug 2021 21:12:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC8C6F800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 21:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC8C6F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="B+ySmGej"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B9hdxv013981; 
 Wed, 11 Aug 2021 14:12:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=h/yohAcNEYaBMZnomHJsOTw4yGUccIoPWhb66gr6PNo=;
 b=B+ySmGejlWLT05i8qrCkGcSVBYdSTciWAJt03vC0nUsSK7IZoXuw9lEMBKOE8B5qZse2
 VtGeTweIsIj1ZarSzzTvIYiF9fbycWeG53A7/OsKUCOB5VXqqCFxLf6wtD8jyIrhdovB
 N3ITQGwpoqSuhdTp2OgQkAeUtUTKF1kjcLhJdfDuE6JCIW2pIa1i2SyZyUB5QBR2+jzq
 fPOl/H6Km6gkWR7us2GIO5jDOgX8taEZ2LqzD2wP6n2+Oz+RYQ6ALBtfDAyrc+ReJsGW
 4rdnsp7ilOsOG4sfLLtmzqydrgW4nilPFhZCI48+MFKq8zOSswPtg6AsSu1iQQm+Ph7J aw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3acc5ngpgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 14:12:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:29 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BE0D346E;
 Wed, 11 Aug 2021 18:57:28 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 12/27] ALSA: hda/cs8409: Generalize volume controls
Date: Wed, 11 Aug 2021 19:56:39 +0100
Message-ID: <20210811185654.6837-13-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7_Z44obyMk0NMGpJFWSxkAsUCQhrFIVz
X-Proofpoint-GUID: 7_Z44obyMk0NMGpJFWSxkAsUCQhrFIVz
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

Use amp offsets as indexes for saved volumes.
Remove dependencies on NID inside volume control functions.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409-tables.c |  37 +++++++
 sound/pci/hda/patch_cs8409.c        | 165 +++++++++-------------------
 sound/pci/hda/patch_cs8409.h        |  27 +++--
 3 files changed, 105 insertions(+), 124 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 07d3ae28c105..b03ddef2a25f 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -10,6 +10,43 @@
 
 #include "patch_cs8409.h"
 
+/******************************************************************************
+ *                          CS42L42 Specific Data
+ *
+ ******************************************************************************/
+
+static const DECLARE_TLV_DB_SCALE(cs42l42_dac_db_scale,
+	CS8409_CS42L42_HP_VOL_REAL_MIN * 100, 100, 1);
+
+static const DECLARE_TLV_DB_SCALE(cs42l42_adc_db_scale,
+	CS8409_CS42L42_AMIC_VOL_REAL_MIN * 100, 100, 1);
+
+const struct snd_kcontrol_new cs42l42_dac_volume_mixer = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.index = 0,
+	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
+	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
+	.info = cs8409_cs42l42_volume_info,
+	.get = cs8409_cs42l42_volume_get,
+	.put = cs8409_cs42l42_volume_put,
+	.tlv = { .p = cs42l42_dac_db_scale },
+	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_TRANSMITTER_A, 3, 0,
+			 HDA_OUTPUT, CS42L42_VOL_DAC) | HDA_AMP_VAL_MIN_MUTE
+};
+
+const struct snd_kcontrol_new cs42l42_adc_volume_mixer = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.index = 0,
+	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
+	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
+	.info = cs8409_cs42l42_volume_info,
+	.get = cs8409_cs42l42_volume_get,
+	.put = cs8409_cs42l42_volume_put,
+	.tlv = { .p = cs42l42_adc_db_scale },
+	.private_value = HDA_COMPOSE_AMP_VAL_OFS(CS8409_PIN_ASP1_RECEIVER_A, 1, 0,
+			 HDA_INPUT, CS42L42_VOL_ADC) | HDA_AMP_VAL_MIN_MUTE
+};
+
 /* Dell Inspiron platforms
  * with cs8409 bridge and cs42l42 codec
  */
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 0b13bcecd778..08205c19698c 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -208,162 +208,97 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 	return 0;
 }
 
-static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo)
+int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo)
 {
-	u16 nid = get_amp_nid(kctrl);
+	unsigned int ofs = get_amp_offset(kctrl);
 	u8 chs = get_amp_channels(kctrl);
 
-	switch (nid) {
-	case CS8409_CS42L42_HP_PIN_NID:
-		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-		uinfo->count = chs == 3 ? 2 : 1;
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->value.integer.step = 1;
+	uinfo->count = chs == 3 ? 2 : 1;
+
+	switch (ofs) {
+	case CS42L42_VOL_DAC:
 		uinfo->value.integer.min = CS8409_CS42L42_HP_VOL_REAL_MIN;
 		uinfo->value.integer.max = CS8409_CS42L42_HP_VOL_REAL_MAX;
 		break;
-	case CS8409_CS42L42_AMIC_PIN_NID:
-		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
-		uinfo->count = chs == 3 ? 2 : 1;
+	case CS42L42_VOL_ADC:
 		uinfo->value.integer.min = CS8409_CS42L42_AMIC_VOL_REAL_MIN;
 		uinfo->value.integer.max = CS8409_CS42L42_AMIC_VOL_REAL_MAX;
 		break;
 	default:
 		break;
 	}
-	return 0;
-}
 
-static void cs8409_cs42l42_update_volume(struct hda_codec *codec)
-{
-	struct cs8409_spec *spec = codec->spec;
-	int data;
-
-	mutex_lock(&spec->cs8409_i2c_mux);
-	data = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOLUME_CHA, 1);
-	if (data >= 0)
-		spec->cs42l42_hp_volume[0] = -data;
-	else
-		spec->cs42l42_hp_volume[0] = CS8409_CS42L42_HP_VOL_REAL_MIN;
-	data = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOLUME_CHB, 1);
-	if (data >= 0)
-		spec->cs42l42_hp_volume[1] = -data;
-	else
-		spec->cs42l42_hp_volume[1] = CS8409_CS42L42_HP_VOL_REAL_MIN;
-	data = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOLUME, 1);
-	if (data >= 0)
-		spec->cs42l42_hs_mic_volume[0] = -data;
-	else
-		spec->cs42l42_hs_mic_volume[0] = CS8409_CS42L42_AMIC_VOL_REAL_MIN;
-	mutex_unlock(&spec->cs8409_i2c_mux);
-	spec->cs42l42_volume_init = 1;
+	return 0;
 }
 
-static int cs8409_cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
+int cs8409_cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kctrl);
 	struct cs8409_spec *spec = codec->spec;
-	hda_nid_t nid = get_amp_nid(kctrl);
 	int chs = get_amp_channels(kctrl);
+	unsigned int ofs = get_amp_offset(kctrl);
 	long *valp = uctrl->value.integer.value;
 
-	if (!spec->cs42l42_volume_init) {
-		snd_hda_power_up(codec);
-		cs8409_cs42l42_update_volume(codec);
-		snd_hda_power_down(codec);
-	}
-	switch (nid) {
-	case CS8409_CS42L42_HP_PIN_NID:
+	switch (ofs) {
+	case CS42L42_VOL_DAC:
 		if (chs & BIT(0))
-			*valp++ = spec->cs42l42_hp_volume[0];
+			*valp++ = spec->vol[ofs];
 		if (chs & BIT(1))
-			*valp++ = spec->cs42l42_hp_volume[1];
+			*valp = spec->vol[ofs+1];
 		break;
-	case CS8409_CS42L42_AMIC_PIN_NID:
+	case CS42L42_VOL_ADC:
 		if (chs & BIT(0))
-			*valp++ = spec->cs42l42_hs_mic_volume[0];
+			*valp = spec->vol[ofs];
 		break;
 	default:
 		break;
 	}
+
 	return 0;
 }
 
-static int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
+int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl)
 {
 	struct hda_codec *codec = snd_kcontrol_chip(kctrl);
 	struct cs8409_spec *spec = codec->spec;
-	hda_nid_t nid = get_amp_nid(kctrl);
 	int chs = get_amp_channels(kctrl);
+	unsigned int ofs = get_amp_offset(kctrl);
 	long *valp = uctrl->value.integer.value;
-	int change = 0;
-	char vol;
 
-	snd_hda_power_up(codec);
-	switch (nid) {
-	case CS8409_CS42L42_HP_PIN_NID:
+	switch (ofs) {
+	case CS42L42_VOL_DAC:
 		mutex_lock(&spec->cs8409_i2c_mux);
 		if (chs & BIT(0)) {
-			vol = -(*valp);
-			change = cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
-						  CS8409_CS42L42_REG_HS_VOLUME_CHA, vol, 1);
-			valp++;
+			spec->vol[ofs] = *valp;
+			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
+					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
 		}
 		if (chs & BIT(1)) {
-			vol = -(*valp);
-			change |= cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
-						   CS8409_CS42L42_REG_HS_VOLUME_CHB, vol, 1);
+			ofs++;
+			valp++;
+			spec->vol[ofs] = *valp;
+			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
+					 -(spec->vol[ofs]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
 		}
 		mutex_unlock(&spec->cs8409_i2c_mux);
 		break;
-	case CS8409_CS42L42_AMIC_PIN_NID:
+	case CS42L42_VOL_ADC:
 		mutex_lock(&spec->cs8409_i2c_mux);
 		if (chs & BIT(0)) {
-			change = cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
-						  CS8409_CS42L42_REG_AMIC_VOLUME, (char)*valp, 1);
-			valp++;
+			spec->vol[ofs] = *valp;
+			cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
+					 spec->vol[ofs] & CS8409_CS42L42_REG_AMIC_VOL_MASK, 1);
 		}
 		mutex_unlock(&spec->cs8409_i2c_mux);
 		break;
 	default:
 		break;
 	}
-	cs8409_cs42l42_update_volume(codec);
-	snd_hda_power_down(codec);
-	return change;
-}
-
-static const DECLARE_TLV_DB_SCALE(cs8409_cs42l42_hp_db_scale,
-				  CS8409_CS42L42_HP_VOL_REAL_MIN * 100, 100, 1);
-
-static const DECLARE_TLV_DB_SCALE(cs8409_cs42l42_amic_db_scale,
-				  CS8409_CS42L42_AMIC_VOL_REAL_MIN * 100, 100, 1);
-
-static const struct snd_kcontrol_new cs8409_cs42l42_hp_volume_mixer = {
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	.index = 0,
-	.name = "Headphone Playback Volume",
-	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
-	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
-	.info = cs8409_cs42l42_volume_info,
-	.get = cs8409_cs42l42_volume_get,
-	.put = cs8409_cs42l42_volume_put,
-	.tlv = { .p = cs8409_cs42l42_hp_db_scale },
-	.private_value = HDA_COMPOSE_AMP_VAL(CS8409_CS42L42_HP_PIN_NID, 3, 0, HDA_OUTPUT) |
-			 HDA_AMP_VAL_MIN_MUTE
-};
 
-static const struct snd_kcontrol_new cs8409_cs42l42_amic_volume_mixer = {
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	.index = 0,
-	.name = "Mic Capture Volume",
-	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
-	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
-	.info = cs8409_cs42l42_volume_info,
-	.get = cs8409_cs42l42_volume_get,
-	.put = cs8409_cs42l42_volume_put,
-	.tlv = { .p = cs8409_cs42l42_amic_db_scale },
-	.private_value = HDA_COMPOSE_AMP_VAL(CS8409_CS42L42_AMIC_PIN_NID, 1, 0, HDA_INPUT) |
-			 HDA_AMP_VAL_MIN_MUTE
-};
+	return 0;
+}
 
 /* Assert/release RTS# line to CS42L42 */
 static void cs8409_cs42l42_reset(struct hda_codec *codec)
@@ -657,18 +592,14 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	}
 
 	/* Restore Volumes after Resume */
-	if (spec->cs42l42_volume_init) {
-		mutex_lock(&spec->cs8409_i2c_mux);
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOLUME_CHA,
-				 -spec->cs42l42_hp_volume[0], 1);
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOLUME_CHB,
-				 -spec->cs42l42_hp_volume[1], 1);
-		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOLUME,
-				 spec->cs42l42_hs_mic_volume[0], 1);
-		mutex_unlock(&spec->cs8409_i2c_mux);
-	}
-
-	cs8409_cs42l42_update_volume(codec);
+	mutex_lock(&spec->cs8409_i2c_mux);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHA,
+			 -(spec->vol[1]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_HS_VOL_CHB,
+			 -(spec->vol[2]) & CS8409_CS42L42_REG_HS_VOL_MASK, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, CS8409_CS42L42_REG_AMIC_VOL,
+			 spec->vol[0] & CS8409_CS42L42_REG_AMIC_VOL_MASK, 1);
+	mutex_unlock(&spec->cs8409_i2c_mux);
 
 	cs8409_cs42l42_enable_jack_detect(codec);
 
@@ -811,8 +742,10 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		/* Set initial DMIC volume to -26 dB */
 		snd_hda_codec_amp_init_stereo(codec, CS8409_CS42L42_DMIC_ADC_PIN_NID,
 					      HDA_INPUT, 0, 0xff, 0x19);
-		snd_hda_gen_add_kctl(&spec->gen, NULL, &cs8409_cs42l42_hp_volume_mixer);
-		snd_hda_gen_add_kctl(&spec->gen, NULL, &cs8409_cs42l42_amic_volume_mixer);
+		snd_hda_gen_add_kctl(&spec->gen, "Headphone Playback Volume",
+				&cs42l42_dac_volume_mixer);
+		snd_hda_gen_add_kctl(&spec->gen, "Mic Capture Volume",
+				&cs42l42_adc_volume_mixer);
 		/* Disable Unsolicited Response during boot */
 		cs8409_enable_ur(codec, 0);
 		cs8409_cs42l42_hw_init(codec);
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 0f2084b6ec8e..bf0e8a4cc4cc 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -215,16 +215,17 @@ enum cs8409_coefficient_index_registers {
 
 /* CS42L42 Specific Definitions */
 
-#define CS42L42_HP_CH				(2U)
-#define CS42L42_HS_MIC_CH			(1U)
+#define CS42L42_VOLUMES				(4U)
 
 #define CS8409_CS42L42_HP_VOL_REAL_MIN		(-63)
 #define CS8409_CS42L42_HP_VOL_REAL_MAX		(0)
 #define CS8409_CS42L42_AMIC_VOL_REAL_MIN	(-97)
 #define CS8409_CS42L42_AMIC_VOL_REAL_MAX	(12)
-#define CS8409_CS42L42_REG_HS_VOLUME_CHA	(0x2301)
-#define CS8409_CS42L42_REG_HS_VOLUME_CHB	(0x2303)
-#define CS8409_CS42L42_REG_AMIC_VOLUME		(0x1D03)
+#define CS8409_CS42L42_REG_HS_VOL_CHA		(0x2301)
+#define CS8409_CS42L42_REG_HS_VOL_CHB		(0x2303)
+#define CS8409_CS42L42_REG_HS_VOL_MASK		(0x003F)
+#define CS8409_CS42L42_REG_AMIC_VOL		(0x1D03)
+#define CS8409_CS42L42_REG_AMIC_VOL_MASK	(0x00FF)
 #define CS42L42_HSDET_AUTO_DONE			(0x02)
 #define CS42L42_HSTYPE_MASK			(0x03)
 #define CS42L42_JACK_INSERTED			(0x0C)
@@ -248,6 +249,11 @@ enum {
 	CS8409_FIXUPS,
 };
 
+enum {
+	CS42L42_VOL_ADC,
+	CS42L42_VOL_DAC,
+};
+
 struct cs8409_i2c_param {
 	unsigned int addr;
 	unsigned int reg;
@@ -268,10 +274,8 @@ struct cs8409_spec {
 
 	unsigned int cs42l42_hp_jack_in:1;
 	unsigned int cs42l42_mic_jack_in:1;
-	unsigned int cs42l42_volume_init:1;
 	unsigned int cs42l42_suspended:1;
-	char cs42l42_hp_volume[CS42L42_HP_CH];
-	char cs42l42_hs_mic_volume[CS42L42_HS_MIC_CH];
+	s8 vol[CS42L42_VOLUMES];
 
 	struct mutex cs8409_i2c_mux;
 
@@ -280,6 +284,13 @@ struct cs8409_spec {
 			 unsigned int *res);
 };
 
+extern const struct snd_kcontrol_new cs42l42_dac_volume_mixer;
+extern const struct snd_kcontrol_new cs42l42_adc_volume_mixer;
+
+int cs8409_cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *uinfo);
+int cs8409_cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
+int cs8409_cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
+
 extern const struct snd_pci_quirk cs8409_fixup_tbl[];
 extern const struct hda_model_fixup cs8409_models[];
 extern const struct hda_fixup cs8409_fixups[];
-- 
2.25.1

