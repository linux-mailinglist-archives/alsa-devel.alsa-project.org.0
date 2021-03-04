Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682EA32D9E9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 20:04:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F342A177F;
	Thu,  4 Mar 2021 20:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F342A177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614884672;
	bh=LrIOX3molIo7/hybxrGKtourl2xUa3k2a9B2e9+t3pQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t6BUbfEC/v+009n6rHEpQe6SdDMiq0ym+F1g89LC7yYUjOwnV50n+dubWnhL5MLjp
	 m8L1qd1Hkswhfj9FziTZ0a+I+50jwGs1k9VqMCMwRrUGLHrn0QOKQpr/S1SVLD+a+5
	 mAEHfGWZKzmGQ5X8CtYbz08L5b9HauIohi/YwTNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31507F802A9;
	Thu,  4 Mar 2021 20:03:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8238FF802A9; Thu,  4 Mar 2021 20:02:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE653F8025B
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 20:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE653F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="kVgagHVc"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 124J1FD7032593; Thu, 4 Mar 2021 13:02:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cPUXk9JjLj1rIckmtHyVVzE9YJWJ8/mDxFF7hxKSIhk=;
 b=kVgagHVcN5yKkvV/pCBRxKvtyS5O+ocUdmFTrUe7kVdVZIJu0EkkXE/YK3dHv9haSmxF
 q6SNMHpXa5vdmxY3AlQQzaSiLSSa289wIv16pS+AE3Lj6ToK8UHyX8k1AxXkQaPWeGtg
 toTohdhq/2b6mXyEmx5soPe3rE64982g7sbWB1UVPUU4c99St5Gn2aFRgqJdxppQjbBq
 nokYLljeS7iHGv/9ijyzZiWsnE2GT46IXwzrO0NsKPqYKqDETPyeKcJwxuezLJ49fhwf
 He5+ierykEuNdxmZJgoTjRFdG76FFMyJNXV9rRTKM6S2YZFSyO0YjDe776DpTSNKa3XS CA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctq12a-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 04 Mar 2021 13:02:44 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 4 Mar 2021
 19:02:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 4 Mar 2021 19:02:42 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A802A11D5;
 Thu,  4 Mar 2021 19:02:42 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/4] ALSA: hda/cirrus: Add jack detect interrupt support
 from CS42L42 companion codec.
Date: Thu, 4 Mar 2021 19:02:40 +0000
Message-ID: <20210304190241.5363-4-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304190241.5363-1-vitalyr@opensource.cirrus.com>
References: <20210304190241.5363-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040090
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

In the case of CS8409 we do not have unsol events from NID's 0x24 and 0x34
where hs mic and hp are connected. Companion codec CS42L42 will generate
interrupt via gpio 4 to notify jack events. We have to overwrite standard
snd_hda_jack_unsol_event(), read CS42L42 jack detect status registers and
then notify status via generic snd_hda_jack_unsol_event() call.

Tested on DELL Inspiron-3500, DELL Inspiron-3501, DELL Inspiron-3505.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cirrus.c | 304 ++++++++++++++++++++++++++++++++++-
 1 file changed, 302 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index c95588681d53..0b8980240176 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <sound/core.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <sound/tlv.h>
 #include <sound/hda_codec.h>
@@ -38,6 +39,15 @@ struct cs_spec {
 	/* for MBP SPDIF control */
 	int (*spdif_sw_put)(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol);
+
+	unsigned int cs42l42_hp_jack_in:1;
+	unsigned int cs42l42_mic_jack_in:1;
+
+	struct mutex cs8409_i2c_mux;
+
+	/* verb exec op override */
+	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd,
+				 unsigned int flags, unsigned int *res);
 };
 
 /* available models with CS420x */
@@ -1229,6 +1239,13 @@ static int patch_cs4213(struct hda_codec *codec)
 #define CS8409_CS42L42_SPK_PIN_NID	0x2c
 #define CS8409_CS42L42_AMIC_PIN_NID	0x34
 #define CS8409_CS42L42_DMIC_PIN_NID	0x44
+#define CS8409_CS42L42_DMIC_ADC_PIN_NID	0x22
+
+#define CS42L42_HSDET_AUTO_DONE	0x02
+#define CS42L42_HSTYPE_MASK		0x03
+
+#define CS42L42_JACK_INSERTED	0x0C
+#define CS42L42_JACK_REMOVED	0x00
 
 #define GPIO3_INT (1 << 3)
 #define GPIO4_INT (1 << 4)
@@ -1429,6 +1446,7 @@ static const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
 	{ 0x1C03, 0xC0 },
 	{ 0x1105, 0x00 },
 	{ 0x1112, 0xC0 },
+	{ 0x1101, 0x02 },
 	{} /* Terminator */
 };
 
@@ -1565,6 +1583,8 @@ static unsigned int cs8409_i2c_write(struct hda_codec *codec,
 /* Assert/release RTS# line to CS42L42 */
 static void cs8409_cs42l42_reset(struct hda_codec *codec)
 {
+	struct cs_spec *spec = codec->spec;
+
 	/* Assert RTS# line */
 	snd_hda_codec_write(codec,
 			codec->core.afg, 0, AC_VERB_SET_GPIO_DATA, 0);
@@ -1576,21 +1596,184 @@ static void cs8409_cs42l42_reset(struct hda_codec *codec)
 	/* wait ~10ms */
 	usleep_range(10000, 15000);
 
-	/* Clear interrupts status */
+	mutex_lock(&spec->cs8409_i2c_mux);
+
+	/* Clear interrupts, by reading interrupt status registers */
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1309, 1);
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130A, 1);
 	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130F, 1);
 
+	mutex_unlock(&spec->cs8409_i2c_mux);
+
+}
+
+/* Configure CS42L42 slave codec for jack autodetect */
+static int cs8409_cs42l42_enable_jack_detect(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+
+	mutex_lock(&spec->cs8409_i2c_mux);
+
+	/* Set TIP_SENSE_EN for analog front-end of tip sense. */
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b70, 0x0020, 1);
+	/* Clear WAKE# */
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x0001, 1);
+	/* Wait ~2.5ms */
+	usleep_range(2500, 3000);
+	/* Set mode WAKE# output follows the combination logic directly */
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b71, 0x0020, 1);
+	/* Clear interrupts status */
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b7b, 1);
+	/* Enable interrupt */
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1320, 0x03, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b79, 0x00, 1);
+
+	mutex_unlock(&spec->cs8409_i2c_mux);
+
+	return 0;
+}
+
+/* Enable and run CS42L42 slave codec jack auto detect */
+static void cs8409_cs42l42_run_jack_detect(struct hda_codec *codec)
+{
+	struct cs_spec *spec = codec->spec;
+
+	mutex_lock(&spec->cs8409_i2c_mux);
+
+	/* Clear interrupts */
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b77, 1);
+
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1102, 0x87, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1f06, 0x86, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1b74, 0x07, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x131b, 0x01, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0x80, 1);
+	/* Wait ~110ms*/
+	usleep_range(110000, 200000);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x111f, 0x77, 1);
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1120, 0xc0, 1);
+	/* Wait ~10ms */
+	usleep_range(10000, 25000);
+
+	mutex_unlock(&spec->cs8409_i2c_mux);
+
 }
 
 static void cs8409_cs42l42_reg_setup(struct hda_codec *codec)
 {
 	const struct cs8409_i2c_param *seq = cs42l42_init_reg_seq;
+	struct cs_spec *spec = codec->spec;
+
+	mutex_lock(&spec->cs8409_i2c_mux);
 
 	for (; seq->addr; seq++)
 		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, seq->addr, seq->reg, 1);
 
+	mutex_unlock(&spec->cs8409_i2c_mux);
+
+}
+
+/*
+ * In the case of CS8409 we do not have unsolicited events from NID's 0x24
+ * and 0x34 where hs mic and hp are connected. Companion codec CS42L42 will
+ * generate interrupt via gpio 4 to notify jack events. We have to overwrite
+ * generic snd_hda_jack_unsol_event(), read CS42L42 jack detect status registers
+ * and then notify status via generic snd_hda_jack_unsol_event() call.
+ */
+void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
+{
+	struct cs_spec *spec = codec->spec;
+	int status_changed = 0;
+	unsigned int reg_cdc_status = 0;
+	unsigned int reg_hs_status = 0;
+	unsigned int reg_ts_status = 0;
+	int type = 0;
+	struct hda_jack_tbl *jk;
+
+	/* jack_unsol_event() will be called every time gpio line changing state.
+	 * In this case gpio4 line goes up as a result of reading interrupt status
+	 * registers in previous cs8409_jack_unsol_event() call.
+	 * We don't need to handle this event, ignoring...
+	 */
+	if ((res & (1 << 4)))
+		return;
+
+	mutex_lock(&spec->cs8409_i2c_mux);
+
+	/* Read jack detect status registers */
+	reg_cdc_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
+	reg_hs_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1124, 1);
+	reg_ts_status = cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
+
+	/* Clear interrupts */
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1b7b, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130f, 1);
+
+	mutex_unlock(&spec->cs8409_i2c_mux);
+
+	/* HSDET_AUTO_DONE */
+	if (reg_cdc_status & CS42L42_HSDET_AUTO_DONE) {
+
+		type = ((reg_hs_status & CS42L42_HSTYPE_MASK) + 1);
+		/* CS42L42 reports optical jack as type 4
+		 * We don't handle optical jack
+		 */
+		if (type != 4) {
+			if (!spec->cs42l42_hp_jack_in) {
+				status_changed = 1;
+				spec->cs42l42_hp_jack_in = 1;
+			}
+			/* type = 3 has no mic */
+			if ((!spec->cs42l42_mic_jack_in) && (type != 3)) {
+				status_changed = 1;
+				spec->cs42l42_mic_jack_in = 1;
+			}
+		}
+
+	} else {
+		/* TIP_SENSE INSERT/REMOVE */
+		switch (reg_ts_status) {
+		case CS42L42_JACK_INSERTED:
+			cs8409_cs42l42_run_jack_detect(codec);
+			break;
+
+		case CS42L42_JACK_REMOVED:
+			if (spec->cs42l42_hp_jack_in || spec->cs42l42_mic_jack_in) {
+				status_changed = 1;
+				spec->cs42l42_hp_jack_in = 0;
+				spec->cs42l42_mic_jack_in = 0;
+			}
+			break;
+
+		default:
+			/* jack in transition */
+			status_changed = 0;
+			break;
+		}
+	}
+
+	if (status_changed) {
+
+		snd_hda_set_pin_ctl(codec, CS8409_CS42L42_SPK_PIN_NID,
+				(spec->cs42l42_hp_jack_in)?0 : PIN_OUT);
+
+		/* Report jack*/
+		jk = snd_hda_jack_tbl_get_mst(codec, CS8409_CS42L42_HP_PIN_NID, 0);
+		if (jk) {
+			snd_hda_jack_unsol_event(codec,
+				(jk->tag << AC_UNSOL_RES_TAG_SHIFT) & AC_UNSOL_RES_TAG);
+		}
+		/* Report jack*/
+		jk = snd_hda_jack_tbl_get_mst(codec, CS8409_CS42L42_AMIC_PIN_NID, 0);
+		if (jk) {
+			snd_hda_jack_unsol_event(codec,
+				(jk->tag << AC_UNSOL_RES_TAG_SHIFT) & AC_UNSOL_RES_TAG);
+		}
+	}
 }
 
 static int cs8409_cs42l42_build_controls(struct hda_codec *codec)
@@ -1603,6 +1786,13 @@ static int cs8409_cs42l42_build_controls(struct hda_codec *codec)
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_BUILD);
 
+	/* Run jack auto detect first time on boot
+	 * after controls have been added, to check if jack has
+	 * been already plugged in
+	 */
+	cs8409_cs42l42_run_jack_detect(codec);
+	usleep_range(100000, 150000);
+
 	return 0;
 }
 
@@ -1610,21 +1800,72 @@ static int cs8409_cs42l42_build_controls(struct hda_codec *codec)
 /* Manage PDREF, when transition to D3hot */
 static int cs8409_suspend(struct hda_codec *codec)
 {
+	struct cs_spec *spec = codec->spec;
+
+	mutex_lock(&spec->cs8409_i2c_mux);
+	/* Power down CS42L42 ASP/EQ/MIX/HP */
+	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe, 1);
+	mutex_unlock(&spec->cs8409_i2c_mux);
+
 	snd_hda_shutup_pins(codec);
+
 	return 0;
 }
 #endif
 
+static void cs8409_cs42l42_cap_sync_hook(struct hda_codec *codec,
+					 struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct cs_spec *spec = codec->spec;
+	unsigned int curval, expval;
+	/* CS8409 DMIC Pin only allows the setting of the Stream Parameters in
+	 * Power State D0. When a headset is unplugged, and the path is switched to
+	 * the DMIC, the Stream is restarted with the new ADC, but this is done in
+	 * Power State D3. Restart the Stream now DMIC is in D0.
+	 */
+	if (spec->gen.cur_adc == CS8409_CS42L42_DMIC_ADC_PIN_NID) {
+		curval = snd_hda_codec_read(codec, spec->gen.cur_adc,
+			0, AC_VERB_GET_CONV, 0);
+		expval = (spec->gen.cur_adc_stream_tag << 4) | 0;
+		if (curval != expval) {
+			codec_dbg(codec, "%s Restarting Stream after DMIC switch\n", __func__);
+			__snd_hda_codec_cleanup_stream(codec, spec->gen.cur_adc, 1);
+			snd_hda_codec_setup_stream(codec, spec->gen.cur_adc,
+					   spec->gen.cur_adc_stream_tag, 0,
+					   spec->gen.cur_adc_format);
+		}
+	}
+}
+
+/* Enable/Disable Unsolicited Response for gpio(s) 3,4 */
+static void cs8409_enable_ur(struct hda_codec *codec, int flag)
+{
+	/* GPIO4 INT# and GPIO3 WAKE# */
+	snd_hda_codec_write(codec, codec->core.afg,
+			0, AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK,
+			flag?(GPIO3_INT | GPIO4_INT) : 0);
+
+	snd_hda_codec_write(codec, codec->core.afg,
+			0, AC_VERB_SET_UNSOLICITED_ENABLE,
+			flag?AC_UNSOL_ENABLED : 0);
+
+}
+
 /* Vendor specific HW configuration
  * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
  */
 static int cs8409_cs42l42_hw_init(struct hda_codec *codec)
 {
 	const struct cs8409_cir_param *seq = cs8409_cs42l42_hw_cfg;
+	struct cs_spec *spec = codec->spec;
 
 	for (; seq->nid; seq++)
 		cs_vendor_coef_set(codec, seq->cir, seq->coeff);
 
+	/* Disable Unsolicited Response during boot */
+	cs8409_enable_ur(codec, 0);
+
 	/* Reset CS42L42 */
 	cs8409_cs42l42_reset(codec);
 
@@ -1634,11 +1875,18 @@ static int cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	if (codec->fixup_id == CS8409_WARLOCK ||
 			codec->fixup_id == CS8409_CYBORG) {
 		/* FULL_SCALE_VOL = 0 for Warlock / Cyborg */
+		mutex_lock(&spec->cs8409_i2c_mux);
 		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01, 1);
+		mutex_unlock(&spec->cs8409_i2c_mux);
 		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
 		cs_vendor_coef_set(codec, 0x09, 0x0003);
 	}
 
+	cs8409_cs42l42_enable_jack_detect(codec);
+
+	/* Enable Unsolicited Response */
+	cs8409_enable_ur(codec, 1);
+
 	return 1;
 }
 
@@ -1668,6 +1916,8 @@ static int cs8409_cs42l42_init(struct hda_codec *codec)
 
 		cs8409_cs42l42_hw_init(codec);
 
+		cs8409_cs42l42_run_jack_detect(codec);
+		usleep_range(100000, 150000);
 	}
 
 	return ret;
@@ -1678,7 +1928,7 @@ static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
 	.build_pcms = snd_hda_gen_build_pcms,
 	.init = cs8409_cs42l42_init,
 	.free = cs_free,
-	.unsol_event = snd_hda_jack_unsol_event,
+	.unsol_event = cs8409_jack_unsol_event,
 #ifdef CONFIG_PM
 	.suspend = cs8409_suspend,
 #endif
@@ -1738,6 +1988,45 @@ static int cs8409_cs42l42_fixup(struct hda_codec *codec)
 	return err;
 }
 
+static int cs8409_cs42l42_exec_verb(struct hdac_device *dev,
+		unsigned int cmd, unsigned int flags, unsigned int *res)
+{
+	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
+	struct cs_spec *spec = codec->spec;
+
+	unsigned int nid = 0;
+	unsigned int verb = 0;
+
+	nid = ((cmd >> 20) & 0x07f);
+	verb = ((cmd >> 8) & 0x0fff);
+
+	/* CS8409 pins have no AC_PINSENSE_PRESENCE
+	 * capabilities. We have to intercept 2 calls for pins 0x24 and 0x34
+	 * and return correct pin sense values for read_pin_sense() call from
+	 * hda_jack based on CS42L42 jack detect status.
+	 */
+	switch (nid) {
+	case CS8409_CS42L42_HP_PIN_NID:
+		if (verb == AC_VERB_GET_PIN_SENSE) {
+			*res = (spec->cs42l42_hp_jack_in) ? AC_PINSENSE_PRESENCE : 0;
+			return 0;
+		}
+		break;
+
+	case CS8409_CS42L42_AMIC_PIN_NID:
+		if (verb == AC_VERB_GET_PIN_SENSE) {
+			*res = (spec->cs42l42_mic_jack_in) ? AC_PINSENSE_PRESENCE : 0;
+			return 0;
+		}
+		break;
+
+	default:
+		break;
+	}
+
+	return spec->exec_verb(dev, cmd, flags, res);
+}
+
 static int patch_cs8409(struct hda_codec *codec)
 {
 	struct cs_spec *spec;
@@ -1763,8 +2052,16 @@ static int patch_cs8409(struct hda_codec *codec)
 
 		snd_hda_add_verbs(codec, cs8409_cs42l42_add_verbs);
 
+		/* verb exec op override */
+		spec->exec_verb = codec->core.exec_verb;
+		codec->core.exec_verb = cs8409_cs42l42_exec_verb;
+
+		mutex_init(&spec->cs8409_i2c_mux);
+
 		codec->patch_ops = cs8409_cs42l42_patch_ops;
 
+		spec->gen.cap_sync_hook = cs8409_cs42l42_cap_sync_hook;
+
 		spec->gen.suppress_auto_mute = 1;
 		spec->gen.no_primary_hp = 1;
 		/* GPIO 5 out, 3,4 in */
@@ -1772,6 +2069,9 @@ static int patch_cs8409(struct hda_codec *codec)
 		spec->gpio_data = 0;
 		spec->gpio_mask = 0x03f;
 
+		spec->cs42l42_hp_jack_in = 0;
+		spec->cs42l42_mic_jack_in = 0;
+
 		err = cs8409_cs42l42_fixup(codec);
 
 		if (err > 0)
-- 
2.25.1

