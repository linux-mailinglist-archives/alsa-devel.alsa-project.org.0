Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1CF32BA10
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 19:56:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07B6192E;
	Wed,  3 Mar 2021 19:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07B6192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614797797;
	bh=roB29q7gK6MC1mr6uFdVMAx4CGTaDh/VHhXKUciKSko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rjUUSBuH4vg4S9s+hZuTcjtTMKc3RZt8EcSXCeYleYY3wm7Ag1HhpJt6Ab3Wb7/w0
	 KWCVLXDeGsp+coBIsfujBywUCPpOgdDUe+R9URQzBDSSJ9SG3AvaUGwXR07UTu8wtc
	 qN9FYiXQt0pxLPozgQxrExJ7lYYMPFwMgHEHc1wQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C554FF8042F;
	Wed,  3 Mar 2021 19:54:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB6D6F8032D; Wed,  3 Mar 2021 19:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A28CF8025E
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 19:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A28CF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RJ81jTOp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123IrMkN001579; Wed, 3 Mar 2021 12:53:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=igFcdf/3f5FdhOX4Kt43hJX8noQgBxmX37+z9Q96TJE=;
 b=RJ81jTOpgCCHc6pGY15huQwvWFbOkEFHEPplYz3ScvmzJT0oFOVJLnIobG7zXL6NPPYx
 XSsuhPNDMJsTIMCler7NR0v4+ZSzjLlrf50aAe8dogQOHygCjAHvTMsSZc8ntQivGNWY
 bk7VsVH8As4BAxQipiuECnbbP5rxt3x1j1bPs7X4+tMV+QkpEkzB/UaVjy+a6P+XIBL5
 xbz0zVgd/LyFR8pCDcq979Qq3D1S4fxKSd7jKhrziuVQ0pyCn3aVMDXTP/KMsr5Nfymj
 Btzm9kAC5vz2ruf//Khb3n2NQBiQXncmVHVc3eES3m6WI0TZBmHZwHHQYeZCVyB8HXvx 7g== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctnd7x-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 03 Mar 2021 12:53:53 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 3 Mar 2021
 18:53:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 3 Mar 2021 18:53:52 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40AAB11D5;
 Wed,  3 Mar 2021 18:53:51 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/4] ALSA: hda/cirrus: Add Headphone and Headset MIC Volume
 Control
Date: Wed, 3 Mar 2021 18:53:49 +0000
Message-ID: <20210303185349.6227-5-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303185349.6227-1-vitalyr@opensource.cirrus.com>
References: <20210303185349.6227-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030131
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

CS8409 does not support Volume Control for NIDs 0x24 (the Headphones),
or 0x34 (The Headset Mic).
However, CS42L42 codec does support gain control for both.
We can add support for Volume Controls, by writing the the CS42L42
regmap via i2c commands, using custom info, get and put volume
functions, saved in the control.

Tested on DELL Inspiron-3500, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cirrus.c | 177 +++++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index fa417f7adc7d..caad844fd047 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1258,6 +1258,14 @@ static int patch_cs4213(struct hda_codec *codec)
 #define CIR_I2C_QWRITE	0x005D
 #define CIR_I2C_QREAD	0x005E
 
+#define CS8409_CS42L42_HP_VOL_REAL_MIN   (-63)
+#define CS8409_CS42L42_HP_VOL_REAL_MAX   (0)
+#define CS8409_CS42L42_AMIC_VOL_REAL_MIN (-97)
+#define CS8409_CS42L42_AMIC_VOL_REAL_MAX (12)
+#define CS8409_CS42L42_REG_HS_VOLUME_CHA (0x2301)
+#define CS8409_CS42L42_REG_HS_VOLUME_CHB (0x2303)
+#define CS8409_CS42L42_REG_AMIC_VOLUME   (0x1D03)
+
 static struct mutex cs8409_i2c_mux;
 
 struct cs8409_i2c_param {
@@ -1584,6 +1592,166 @@ static unsigned int cs8409_i2c_write(struct hda_codec *codec,
 	return retval;
 }
 
+static int cs8409_cs42l42_volume_info(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_info *uinfo)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	u16 nid = get_amp_nid(kcontrol);
+	u8 chs = get_amp_channels(kcontrol);
+
+	codec_dbg(codec, "%s() nid: %d\n", __func__, nid);
+	switch (nid) {
+	case CS8409_CS42L42_HP_PIN_NID:
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+		uinfo->count = chs == 3 ? 2 : 1;
+		uinfo->value.integer.min = CS8409_CS42L42_HP_VOL_REAL_MIN;
+		uinfo->value.integer.max = CS8409_CS42L42_HP_VOL_REAL_MAX;
+		break;
+	case CS8409_CS42L42_AMIC_PIN_NID:
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+		uinfo->count = chs == 3 ? 2 : 1;
+		uinfo->value.integer.min = CS8409_CS42L42_AMIC_VOL_REAL_MIN;
+		uinfo->value.integer.max = CS8409_CS42L42_AMIC_VOL_REAL_MAX;
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int cs8409_cs42l42_volume_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	hda_nid_t nid = get_amp_nid(kcontrol);
+	int chs = get_amp_channels(kcontrol);
+	long *valp = ucontrol->value.integer.value;
+	char vol = 0;
+
+	codec_dbg(codec, "%s() nid: %d\n", __func__, nid);
+	snd_hda_power_up(codec);
+	switch (nid) {
+	case CS8409_CS42L42_HP_PIN_NID:
+		mutex_lock(&cs8409_i2c_mux);
+		if (chs & 1) {
+			vol = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_HS_VOLUME_CHA, 1));
+			codec_dbg(codec, "%s() vol(a) = %d\n", __func__, vol);
+			*valp++ = vol;
+		}
+		if (chs & 2) {
+			vol = -(cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_HS_VOLUME_CHB, 1));
+			codec_dbg(codec, "%s() vol(b) = %d\n", __func__, vol);
+			*valp++ = vol;
+		}
+		mutex_unlock(&cs8409_i2c_mux);
+		break;
+	case CS8409_CS42L42_AMIC_PIN_NID:
+		mutex_lock(&cs8409_i2c_mux);
+		if (chs & 1) {
+			vol = cs8409_i2c_read(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_AMIC_VOLUME, 1);
+			codec_dbg(codec, "%s() vol() = %d\n", __func__, vol);
+			*valp++ = vol;
+		}
+		mutex_unlock(&cs8409_i2c_mux);
+		break;
+	default:
+		break;
+	}
+	snd_hda_power_down(codec);
+	return 0;
+}
+
+static int cs8409_cs42l42_volume_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	hda_nid_t nid = get_amp_nid(kcontrol);
+	int chs = get_amp_channels(kcontrol);
+	long *valp = ucontrol->value.integer.value;
+	int change = 0;
+	char vol = 0;
+
+	codec_dbg(codec, "%s() nid: %d\n", __func__, nid);
+	snd_hda_power_up(codec);
+	switch (nid) {
+	case CS8409_CS42L42_HP_PIN_NID:
+		mutex_lock(&cs8409_i2c_mux);
+		if (chs & 1) {
+			vol = -(*valp);
+			codec_dbg(codec, "%s() vol(a) = %d\n", __func__, vol);
+			change = cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_HS_VOLUME_CHA, vol, 1);
+			valp++;
+		}
+		if (chs & 2) {
+			vol = -(*valp);
+			codec_dbg(codec, "%s() vol(b) = %d\n", __func__, vol);
+			change |= cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_HS_VOLUME_CHB, vol, 1);
+		}
+		mutex_unlock(&cs8409_i2c_mux);
+		break;
+	case CS8409_CS42L42_AMIC_PIN_NID:
+		mutex_lock(&cs8409_i2c_mux);
+		if (chs & 1) {
+			codec_dbg(codec, "%s() vol() = %d\n", __func__, (char)*valp);
+			change = cs8409_i2c_write(
+				codec, CS42L42_I2C_ADDR,
+				CS8409_CS42L42_REG_AMIC_VOLUME, (char)*valp, 1);
+			valp++;
+		}
+		mutex_unlock(&cs8409_i2c_mux);
+		break;
+	default:
+		break;
+	}
+	snd_hda_power_down(codec);
+	return change;
+}
+
+static const DECLARE_TLV_DB_SCALE(
+	cs8409_cs42l42_hp_db_scale,
+	CS8409_CS42L42_HP_VOL_REAL_MIN * 100, 100, 1);
+
+static const DECLARE_TLV_DB_SCALE(
+	cs8409_cs42l42_amic_db_scale,
+	CS8409_CS42L42_AMIC_VOL_REAL_MIN * 100, 100, 1);
+
+static const struct snd_kcontrol_new cs8409_cs42l42_hp_volume_mixer = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.index = 0,
+	.name = "Headphone Playback Volume",
+	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
+	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE
+			 | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
+	.info = cs8409_cs42l42_volume_info,
+	.get = cs8409_cs42l42_volume_get,
+	.put = cs8409_cs42l42_volume_put,
+	.tlv = { .p = cs8409_cs42l42_hp_db_scale },
+	.private_value = HDA_COMPOSE_AMP_VAL(
+		CS8409_CS42L42_HP_PIN_NID, 3, 0, HDA_OUTPUT)
+		| HDA_AMP_VAL_MIN_MUTE
+};
+
+static const struct snd_kcontrol_new cs8409_cs42l42_amic_volume_mixer = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.index = 0,
+	.name = "Headset Mic Capture Volume",
+	.subdevice = (HDA_SUBDEV_AMP_FLAG | HDA_SUBDEV_NID_FLAG),
+	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE
+			 | SNDRV_CTL_ELEM_ACCESS_TLV_READ),
+	.info = cs8409_cs42l42_volume_info,
+	.get = cs8409_cs42l42_volume_get,
+	.put = cs8409_cs42l42_volume_put,
+	.tlv = { .p = cs8409_cs42l42_amic_db_scale },
+	.private_value = HDA_COMPOSE_AMP_VAL(
+		CS8409_CS42L42_AMIC_PIN_NID, 1, 0, HDA_INPUT)
+		| HDA_AMP_VAL_MIN_MUTE
+};
+
 /* Assert/release RTS# line to CS42L42 */
 static void cs8409_cs42l42_reset(struct hda_codec *codec)
 {
@@ -1969,6 +2137,14 @@ static int cs8409_cs42l42_fixup(struct hda_codec *codec)
 	if (err < 0)
 		return err;
 
+	if (!snd_hda_gen_add_kctl(
+			&spec->gen, NULL, &cs8409_cs42l42_hp_volume_mixer))
+		return -1;
+
+	if (!snd_hda_gen_add_kctl(
+			&spec->gen, NULL, &cs8409_cs42l42_amic_volume_mixer))
+		return -1;
+
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
 	return err;
@@ -2051,6 +2227,7 @@ static int patch_cs8409(struct hda_codec *codec)
 
 		spec->gen.suppress_auto_mute = 1;
 		spec->gen.no_primary_hp = 1;
+		spec->gen.suppress_vmaster = 1;
 
 		spec->cs42l42_hp_jack_in = 0;
 		spec->cs42l42_mic_jack_in = 0;
-- 
2.25.1

