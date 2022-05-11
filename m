Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34659523030
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 12:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3CE01A24;
	Wed, 11 May 2022 12:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3CE01A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652263461;
	bh=hP3nCc8fzFzXhxeLHes9X3Magag6Fa5HCMgy4HNMaf0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHSy0TXbMbGcQcS1F1AxwGMf/otI2cTnpPiGCNYI8LbWhS+XFOfQW3O5aVJ9tO/PV
	 2Kg62smQM2bW5ojQz3K6sQuEu688MP5RHZaQxaoFyq39OqA6ouHAo1LTJVve6RleP6
	 GvS1TXxmbeCcjvZyii/GVwFgcbdfj0gLATGLMHHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 676D3F80517;
	Wed, 11 May 2022 12:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5F79F80212; Wed, 11 May 2022 12:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52009F8015B
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 12:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52009F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Oa3bMDpD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B4xHqO029588;
 Wed, 11 May 2022 05:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0BenE2DZMjLw5FK0pp3118UKTC0GOs7ew9wsLz0PhJg=;
 b=Oa3bMDpDmKGtQi9ZMx5W16Ntw/GRmrIqCIPdP0J4q0AKvMj2gzYc75kCrohSkfG9y3zz
 Pf/bjd9SlDqa3snkDxTDvD253/L1Z2q7HyTpqq5H0LKeKOPPUErDGllOKDne8TxQecME
 5xv7iMavkjmrigjZAv8Bep2BLWmgaq3+h9bkbGGtd0b7gNUp6S2+p01NjLbm+7V4XM0v
 LXiT/ib0I6NA80NrwNe79OpyCt47DF7Glnbwr9ljSKDDdXRX4Swb0PgvTK0piv7Q3p0r
 1WybJmlUWhJZ7ujg5vSDBPCV1+WZIjgOHF3z9LgDUE65LFhrTMogGgInhrFV3+GdvAy1 7w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nwt0g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 May 2022 05:02:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 11 May
 2022 11:02:13 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 11 May 2022 11:02:13 +0100
Received: from sbinding-cirrus-dsktp.ad.cirrus.com (unknown [198.90.238.24])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2038C11D3;
 Wed, 11 May 2022 10:02:13 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/3] ALSA: hda/cs8409: Add Speaker Playback Switch for
 Cyborg
Date: Wed, 11 May 2022 11:02:06 +0100
Message-ID: <20220511100207.1268321-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511100207.1268321-1-sbinding@opensource.cirrus.com>
References: <20220511100207.1268321-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bSnWiKLlc5zxNO4UpXwYmXN8cMvI-fLR
X-Proofpoint-GUID: bSnWiKLlc5zxNO4UpXwYmXN8cMvI-fLR
X-Proofpoint-Spam-Reason: safe
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

Add support for a Speaker Playback Switch, which disables
the Amp connected to cs8409. The Switch is not added
automatically because cs8409 does not have an output amp
for the speaker NID.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 72 ++++++++++++++++++++++++++++++------
 sound/pci/hda/patch_cs8409.h |  3 ++
 2 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 91571e82d148..e9b9273dbfd9 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -419,6 +419,39 @@ static void cs8409_fix_caps(struct hda_codec *codec, unsigned int nid)
 	snd_hda_override_wcaps(codec, nid, (get_wcaps(codec, nid) | AC_WCAP_UNSOL_CAP));
 }
 
+static int cs8409_spk_sw_gpio_get(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct cs8409_spec *spec = codec->spec;
+
+	ucontrol->value.integer.value[0] = !!(spec->gpio_data & spec->speaker_pdn_gpio);
+	return 0;
+}
+
+static int cs8409_spk_sw_gpio_put(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct cs8409_spec *spec = codec->spec;
+	unsigned int gpio_data;
+
+	gpio_data = (spec->gpio_data & ~spec->speaker_pdn_gpio) |
+		(ucontrol->value.integer.value[0] ? spec->speaker_pdn_gpio : 0);
+	if (gpio_data == spec->gpio_data)
+		return 0;
+	spec->gpio_data = gpio_data;
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, spec->gpio_data);
+	return 1;
+}
+
+static const struct snd_kcontrol_new cs8409_spk_sw_ctrl = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.info = snd_ctl_boolean_mono_info,
+	.get = cs8409_spk_sw_gpio_get,
+	.put = cs8409_spk_sw_gpio_put,
+};
+
 /******************************************************************************
  *                        CS42L42 Specific Functions
  ******************************************************************************/
@@ -836,7 +869,7 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 static void cs42l42_resume(struct sub_codec *cs42l42)
 {
 	struct hda_codec *codec = cs42l42->codec;
-	unsigned int gpio_data;
+	struct cs8409_spec *spec = codec->spec;
 	struct cs8409_i2c_param irq_regs[] = {
 		{ CS42L42_CODEC_STATUS, 0x00 },
 		{ CS42L42_DET_INT_STATUS1, 0x00 },
@@ -846,9 +879,9 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 	int fsv_old, fsv_new;
 
 	/* Bring CS42L42 out of Reset */
-	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
-	gpio_data |= cs42l42->reset_gpio;
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, gpio_data);
+	spec->gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
+	spec->gpio_data |= cs42l42->reset_gpio;
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, spec->gpio_data);
 	usleep_range(10000, 15000);
 
 	cs42l42->suspended = 0;
@@ -880,7 +913,7 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 static void cs42l42_suspend(struct sub_codec *cs42l42)
 {
 	struct hda_codec *codec = cs42l42->codec;
-	unsigned int gpio_data;
+	struct cs8409_spec *spec = codec->spec;
 	int reg_cdc_status = 0;
 	const struct cs8409_i2c_param cs42l42_pwr_down_seq[] = {
 		{ CS42L42_DAC_CTL2, 0x02 },
@@ -911,9 +944,9 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
 	cs42l42->mic_jack_in = 0;
 
 	/* Put CS42L42 into Reset */
-	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
-	gpio_data &= ~cs42l42->reset_gpio;
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, gpio_data);
+	spec->gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
+	spec->gpio_data &= ~cs42l42->reset_gpio;
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, spec->gpio_data);
 }
 #endif
 
@@ -1107,6 +1140,8 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->gen.no_primary_hp = 1;
 		spec->gen.suppress_vmaster = 1;
 
+		spec->speaker_pdn_gpio = 0;
+
 		/* GPIO 5 out, 3,4 in */
 		spec->gpio_dir = spec->scodecs[CS8409_CODEC0]->reset_gpio;
 		spec->gpio_data = 0;
@@ -1118,21 +1153,33 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		cs8409_fix_caps(codec, CS8409_CS42L42_HP_PIN_NID);
 		cs8409_fix_caps(codec, CS8409_CS42L42_AMIC_PIN_NID);
 
-		/* Set HSBIAS_SENSE_EN and Full Scale volume for some variants. */
+		spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
+
 		switch (codec->fixup_id) {
+		case CS8409_CYBORG:
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
+				CS42L42_FULL_SCALE_VOL_MINUS6DB;
+			spec->speaker_pdn_gpio = CS8409_CYBORG_SPEAKER_PDN;
+			break;
 		case CS8409_ODIN:
+			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
+			spec->speaker_pdn_gpio = CS8409_CYBORG_SPEAKER_PDN;
+			break;
 		case CS8409_WARLOCK_MLK:
 		case CS8409_WARLOCK_MLK_DUAL_MIC:
-			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
 			break;
 		default:
-			spec->scodecs[CS8409_CODEC0]->hsbias_hiz = 0x0020;
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
 				CS42L42_FULL_SCALE_VOL_MINUS6DB;
 			break;
 		}
 
+		if (spec->speaker_pdn_gpio > 0) {
+			spec->gpio_dir |= spec->speaker_pdn_gpio;
+			spec->gpio_data |= spec->speaker_pdn_gpio;
+		}
+
 		break;
 	case HDA_FIXUP_ACT_PROBE:
 		/* Fix Sample Rate to 48kHz */
@@ -1149,6 +1196,9 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 				&cs42l42_dac_volume_mixer);
 		snd_hda_gen_add_kctl(&spec->gen, "Mic Capture Volume",
 				&cs42l42_adc_volume_mixer);
+		if (spec->speaker_pdn_gpio > 0)
+			snd_hda_gen_add_kctl(&spec->gen, "Speaker Playback Switch",
+					     &cs8409_spk_sw_ctrl);
 		/* Disable Unsolicited Response during boot */
 		cs8409_enable_ur(codec, 0);
 		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 9852dc4234b4..630a7a2de51f 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -238,6 +238,7 @@ enum cs8409_coefficient_index_registers {
 #define CS42L42_I2C_ADDR			(0x48 << 1)
 #define CS8409_CS42L42_RESET			GENMASK(5, 5) /* CS8409_GPIO5 */
 #define CS8409_CS42L42_INT			GENMASK(4, 4) /* CS8409_GPIO4 */
+#define CS8409_CYBORG_SPEAKER_PDN		GENMASK(2, 2) /* CS8409_GPIO2 */
 #define CS8409_CS42L42_HP_PIN_NID		CS8409_PIN_ASP1_TRANSMITTER_A
 #define CS8409_CS42L42_SPK_PIN_NID		CS8409_PIN_ASP2_TRANSMITTER_A
 #define CS8409_CS42L42_AMIC_PIN_NID		CS8409_PIN_ASP1_RECEIVER_A
@@ -326,6 +327,8 @@ struct cs8409_spec {
 	unsigned int gpio_dir;
 	unsigned int gpio_data;
 
+	int speaker_pdn_gpio;
+
 	struct mutex i2c_mux;
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
-- 
2.25.1

