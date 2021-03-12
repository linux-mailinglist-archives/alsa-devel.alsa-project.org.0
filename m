Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC33396E3
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:46:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 491B81845;
	Fri, 12 Mar 2021 19:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 491B81845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615574812;
	bh=PLQDxZaCF73weM7q+GQ4Yflw5sJUVdH9i/nQj1IKVPY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=midUO5UmxdfZ1SmCU6Y2fh/o7TQb02PBmtQEoCnX6kksnW4s3l5pF8b2CPsOvJF39
	 mWDpEFDgfp7n4u6n/VQSycuTWU7dvwQp3QpT0MbtUJmgG873m2yExIK94+jQFO18TM
	 EUHak9JuQFZ7fw/0COATl3ugH0GzhSRkcnfo09sY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA76F800BF;
	Fri, 12 Mar 2021 19:45:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76A05F8020D; Fri, 12 Mar 2021 19:45:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00AF9F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00AF9F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MJtSCiXw"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CIRb3b003181; Fri, 12 Mar 2021 12:44:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=sWgrLWJv8rwYbAM8uyk9lutwyEe7CTtgK0TzflaVSBk=;
 b=MJtSCiXwrLiovmmHzPcrjgjAT+hO6jya022rMv4Egh2ebCpEcwzmeH1ah9Lx9nPTT2aU
 SkyWrGrSnxQdCq+rlR1rTlpd55oluX7Qr0htYdAr3ATNbDn9okOGdAeiGEtzgGdQQwoO
 5VvxY9aM3Zt7Zq4oPlYQByIMJcKwrF0BxmJxLZVCV9dPlvhQkqOClnyQ5G1G5P/+k/Gv
 Nh7NQvES7Wb/tZCjDMxexlikMDMckuzsQMeI4/0p5Xwtb7Q3SiFnQLvcQSgNPaLfQHaG
 WNthBjJUk4wTYmeSe708Y31BUfQT4rr4wcvTfHDL0CZFfX2RC3XVycwoHnRfTDQAn8gv jg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 37471w0b29-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 12 Mar 2021 12:44:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 12 Mar
 2021 18:44:53 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 12 Mar 2021 18:44:53 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A8EB811D7;
 Fri, 12 Mar 2021 18:44:53 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/4] ALSA: hda/cirrus: Cleanup patch_cirrus.c code.
Date: Fri, 12 Mar 2021 18:44:50 +0000
Message-ID: <20210312184452.3288-3-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312184452.3288-1-vitalyr@opensource.cirrus.com>
References: <20210312184452.3288-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 adultscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120135
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

Minor changes, clean up code, remove unnecessary
initialization of variables, reduced number of
warnings from ./scripts/checkpatch.pl from 19 to 0

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cirrus.c | 155 ++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 77 deletions(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index ca8b522b1d6d..20e2cc433c6e 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -127,7 +127,7 @@ enum {
  * 1 DAC => HP(sense) / Speakers,
  * 1 ADC <= LineIn(sense) / MicIn / DMicIn,
  * 1 SPDIF OUT => SPDIF Trasmitter(sense)
-*/
+ */
 #define CS4210_DAC_NID		0x02
 #define CS4210_ADC_NID		0x03
 #define CS4210_VENDOR_NID	0x0B
@@ -146,6 +146,7 @@ enum {
 static inline int cs_vendor_coef_get(struct hda_codec *codec, unsigned int idx)
 {
 	struct cs_spec *spec = codec->spec;
+
 	snd_hda_codec_write(codec, spec->vendor_nid, 0,
 			    AC_VERB_SET_COEF_INDEX, idx);
 	return snd_hda_codec_read(codec, spec->vendor_nid, 0,
@@ -156,6 +157,7 @@ static inline void cs_vendor_coef_set(struct hda_codec *codec, unsigned int idx,
 				      unsigned int coef)
 {
 	struct cs_spec *spec = codec->spec;
+
 	snd_hda_codec_write(codec, spec->vendor_nid, 0,
 			    AC_VERB_SET_COEF_INDEX, idx);
 	snd_hda_codec_write(codec, spec->vendor_nid, 0,
@@ -192,6 +194,7 @@ static void cs_automute(struct hda_codec *codec)
 static bool is_active_pin(struct hda_codec *codec, hda_nid_t nid)
 {
 	unsigned int val;
+
 	val = snd_hda_codec_get_pincfg(codec, nid);
 	return (get_defcfg_connect(val) != AC_JACK_PORT_NONE);
 }
@@ -210,7 +213,7 @@ static void init_input_coef(struct hda_codec *codec)
 			coef |= 1 << 3; /* DMIC1 2 chan on, GPIO0 off
 					 * No effect if SPDIF_OUT2 is
 					 * selected in IDX_SPDIF_CTL.
-					*/
+					 */
 
 		cs_vendor_coef_set(codec, IDX_BEEP_CFG, coef);
 	}
@@ -284,13 +287,6 @@ static const struct hda_verb cs_errata_init_verbs[] = {
 	{0x11, AC_VERB_SET_COEF_INDEX, 0x0001},
 	{0x11, AC_VERB_SET_PROC_COEF, 0x0008},
 	{0x11, AC_VERB_SET_PROC_STATE, 0x00},
-
-#if 0 /* Don't to set to D3 as we are in power-up sequence */
-	{0x07, AC_VERB_SET_POWER_STATE, 0x03}, /* S/PDIF Rx: D3 */
-	{0x08, AC_VERB_SET_POWER_STATE, 0x03}, /* S/PDIF Tx: D3 */
-	/*{0x01, AC_VERB_SET_POWER_STATE, 0x03},*/ /* AFG: D3 This is already handled */
-#endif
-
 	{} /* terminator */
 };
 
@@ -378,8 +374,10 @@ static int cs_parse_auto_config(struct hda_codec *codec)
 	/* keep the ADCs powered up when it's dynamically switchable */
 	if (spec->gen.dyn_adc_switch) {
 		unsigned int done = 0;
+
 		for (i = 0; i < spec->gen.input_mux.num_items; i++) {
 			int idx = spec->gen.dyn_adc_idx[i];
+
 			if (done & (1 << idx))
 				continue;
 			snd_hda_gen_fix_pin_power(codec,
@@ -513,6 +511,7 @@ static void cs420x_fixup_gpio_13(struct hda_codec *codec,
 {
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		struct cs_spec *spec = codec->spec;
+
 		spec->gpio_eapd_hp = 2; /* GPIO1 = headphones */
 		spec->gpio_eapd_speaker = 8; /* GPIO3 = speakers */
 		spec->gpio_mask = spec->gpio_dir =
@@ -525,6 +524,7 @@ static void cs420x_fixup_gpio_23(struct hda_codec *codec,
 {
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		struct cs_spec *spec = codec->spec;
+
 		spec->gpio_eapd_hp = 4; /* GPIO2 = headphones */
 		spec->gpio_eapd_speaker = 8; /* GPIO3 = speakers */
 		spec->gpio_mask = spec->gpio_dir =
@@ -669,6 +669,7 @@ static void cs4208_fixup_gpio0(struct hda_codec *codec,
 {
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		struct cs_spec *spec = codec->spec;
+
 		spec->gpio_eapd_hp = 0;
 		spec->gpio_eapd_speaker = 1;
 		spec->gpio_mask = spec->gpio_dir =
@@ -823,7 +824,7 @@ static int patch_cs4208(struct hda_codec *codec)
  * 1 DAC => HP(sense) / Speakers,
  * 1 ADC <= LineIn(sense) / MicIn / DMicIn,
  * 1 SPDIF OUT => SPDIF Trasmitter(sense)
-*/
+ */
 
 /* CS4210 board names */
 static const struct hda_model_fixup cs421x_models[] = {
@@ -866,6 +867,7 @@ static void cs421x_fixup_sense_b(struct hda_codec *codec,
 				 const struct hda_fixup *fix, int action)
 {
 	struct cs_spec *spec = codec->spec;
+
 	if (action == HDA_FIXUP_ACT_PRE_PROBE)
 		spec->sense_b = 1;
 }
@@ -891,9 +893,9 @@ static const struct hda_verb cs421x_coef_init_verbs[] = {
 	{0x0B, AC_VERB_SET_PROC_STATE, 1},
 	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_DEV_CFG},
 	/*
-	    Disable Coefficient Index Auto-Increment(DAI)=1,
-	    PDREF=0
-	*/
+	 *  Disable Coefficient Index Auto-Increment(DAI)=1,
+	 *  PDREF=0
+	 */
 	{0x0B, AC_VERB_SET_PROC_COEF, 0x0001 },
 
 	{0x0B, AC_VERB_SET_COEF_INDEX, CS421X_IDX_ADC_CFG},
@@ -980,12 +982,12 @@ static int cs421x_boost_vol_put(struct snd_kcontrol *kcontrol,
 
 	coef &= ~0x0003;
 	coef |= (vol & 0x0003);
-	if (original_coef == coef)
-		return 0;
-	else {
+	if (original_coef != coef) {
 		cs_vendor_coef_set(codec, CS421X_IDX_SPK_CTL, coef);
 		return 1;
 	}
+
+	return 0;
 }
 
 static const struct snd_kcontrol_new cs421x_speaker_boost_ctl = {
@@ -1024,8 +1026,8 @@ static void cs4210_pinmux_init(struct hda_codec *codec)
 	    is_active_pin(codec, CS421X_DMIC_PIN_NID)) {
 
 		/*
-		    GPIO or SENSE_B forced - disconnect the DMIC pin.
-		*/
+		 *  GPIO or SENSE_B forced - disconnect the DMIC pin.
+		 */
 		def_conf = snd_hda_codec_get_pincfg(codec, CS421X_DMIC_PIN_NID);
 		def_conf &= ~AC_DEFCFG_PORT_CONN;
 		def_conf |= (AC_JACK_PORT_NONE << AC_DEFCFG_PORT_CONN_SHIFT);
@@ -1064,6 +1066,7 @@ static void parse_cs421x_digital(struct hda_codec *codec)
 
 	for (i = 0; i < cfg->dig_outs; i++) {
 		hda_nid_t nid = cfg->dig_out_pins[i];
+
 		if (get_wcaps(codec, nid) & AC_WCAP_UNSOL_CAP) {
 			spec->spdif_detect = 1;
 			snd_hda_jack_detect_enable_callback(codec, nid,
@@ -1142,9 +1145,9 @@ static int cs421x_parse_auto_config(struct hda_codec *codec)
 
 #ifdef CONFIG_PM
 /*
-	Manage PDREF, when transitioning to D3hot
-	(DAC,ADC) -> D3, PDREF=1, AFG->D3
-*/
+ *	Manage PDREF, when transitioning to D3hot
+ *	(DAC,ADC) -> D3, PDREF=1, AFG->D3
+ */
 static int cs421x_suspend(struct hda_codec *codec)
 {
 	struct cs_spec *spec = codec->spec;
@@ -1195,10 +1198,10 @@ static int patch_cs4210(struct hda_codec *codec)
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
 	/*
-	    Update the GPIO/DMIC/SENSE_B pinmux before the configuration
-	    is auto-parsed. If GPIO or SENSE_B is forced, DMIC input
-	    is disabled.
-	*/
+	 *  Update the GPIO/DMIC/SENSE_B pinmux before the configuration
+	 *   is auto-parsed. If GPIO or SENSE_B is forced, DMIC input
+	 *   is disabled.
+	 */
 	cs4210_pinmux_init(codec);
 
 	err = cs421x_parse_auto_config(codec);
@@ -1496,8 +1499,8 @@ static const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[] = {
 /* Enable I2C clocks */
 static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int flag)
 {
-	unsigned int retval = 0;
-	unsigned int newval = 0;
+	unsigned int retval;
+	unsigned int newval;
 
 	retval = cs_vendor_coef_get(codec, 0x0);
 	newval = (flag) ? (retval | 0x8) : (retval & 0xfffffff7);
@@ -1669,13 +1672,13 @@ static int cs8409_cs42l42_volume_get(struct snd_kcontrol *kcontrol,
 	}
 	switch (nid) {
 	case CS8409_CS42L42_HP_PIN_NID:
-		if (chs & 1)
+		if (chs & BIT(0))
 			*valp++ = spec->cs42l42_hp_volume[0];
-		if (chs & 2)
+		if (chs & BIT(1))
 			*valp++ = spec->cs42l42_hp_volume[1];
 		break;
 	case CS8409_CS42L42_AMIC_PIN_NID:
-		if (chs & 1)
+		if (chs & BIT(0))
 			*valp++ = spec->cs42l42_hs_mic_volume[0];
 		break;
 	default:
@@ -1693,19 +1696,19 @@ static int cs8409_cs42l42_volume_put(struct snd_kcontrol *kcontrol,
 	int chs = get_amp_channels(kcontrol);
 	long *valp = ucontrol->value.integer.value;
 	int change = 0;
-	char vol = 0;
+	char vol;
 
 	snd_hda_power_up(codec);
 	switch (nid) {
 	case CS8409_CS42L42_HP_PIN_NID:
 		mutex_lock(&spec->cs8409_i2c_mux);
-		if (chs & 1) {
+		if (chs & BIT(0)) {
 			vol = -(*valp);
 			change = cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
 				CS8409_CS42L42_REG_HS_VOLUME_CHA, vol, 1);
 			valp++;
 		}
-		if (chs & 2) {
+		if (chs & BIT(1)) {
 			vol = -(*valp);
 			change |= cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
 				CS8409_CS42L42_REG_HS_VOLUME_CHB, vol, 1);
@@ -1714,7 +1717,7 @@ static int cs8409_cs42l42_volume_put(struct snd_kcontrol *kcontrol,
 		break;
 	case CS8409_CS42L42_AMIC_PIN_NID:
 		mutex_lock(&spec->cs8409_i2c_mux);
-		if (chs & 1) {
+		if (chs & BIT(0)) {
 			change = cs8409_i2c_write(
 				codec, CS42L42_I2C_ADDR,
 				CS8409_CS42L42_REG_AMIC_VOLUME, (char)*valp, 1);
@@ -1878,7 +1881,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	int reg_cdc_status;
 	int reg_hs_status;
 	int reg_ts_status;
-	int type = 0;
+	int type;
 	struct hda_jack_tbl *jk;
 
 	/* jack_unsol_event() will be called every time gpio line changing state.
@@ -1955,7 +1958,7 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	if (status_changed) {
 
 		snd_hda_set_pin_ctl(codec, CS8409_CS42L42_SPK_PIN_NID,
-				(spec->cs42l42_hp_jack_in)?0 : PIN_OUT);
+				spec->cs42l42_hp_jack_in ? 0 : PIN_OUT);
 
 		/* Report jack*/
 		jk = snd_hda_jack_tbl_get_mst(codec, CS8409_CS42L42_HP_PIN_NID, 0);
@@ -2043,18 +2046,18 @@ static void cs8409_enable_ur(struct hda_codec *codec, int flag)
 	/* GPIO4 INT# and GPIO3 WAKE# */
 	snd_hda_codec_write(codec, codec->core.afg,
 			0, AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK,
-			flag?(GPIO3_INT | GPIO4_INT) : 0);
+			flag ? (GPIO3_INT | GPIO4_INT) : 0);
 
 	snd_hda_codec_write(codec, codec->core.afg,
 			0, AC_VERB_SET_UNSOLICITED_ENABLE,
-			flag?AC_UNSOL_ENABLED : 0);
+			flag ? AC_UNSOL_ENABLED : 0);
 
 }
 
 /* Vendor specific HW configuration
  * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
  */
-static int cs8409_cs42l42_hw_init(struct hda_codec *codec)
+static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 {
 	const struct cs8409_cir_param *seq = cs8409_cs42l42_hw_cfg;
 	struct cs_spec *spec = codec->spec;
@@ -2094,14 +2097,16 @@ static int cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	if (spec->cs42l42_volume_init) {
 		mutex_lock(&spec->cs8409_i2c_mux);
 		cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
-					CS8409_CS42L42_REG_HS_VOLUME_CHA, -spec->cs42l42_hp_volume[0],
+					CS8409_CS42L42_REG_HS_VOLUME_CHA,
+					-spec->cs42l42_hp_volume[0],
 					1);
 		cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
-					CS8409_CS42L42_REG_HS_VOLUME_CHB, -spec->cs42l42_hp_volume[1],
+					CS8409_CS42L42_REG_HS_VOLUME_CHB,
+					-spec->cs42l42_hp_volume[1],
 					1);
-		cs8409_i2c_write(
-					codec, CS42L42_I2C_ADDR,
-					CS8409_CS42L42_REG_AMIC_VOLUME, spec->cs42l42_hs_mic_volume[0],
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR,
+					CS8409_CS42L42_REG_AMIC_VOLUME,
+					spec->cs42l42_hs_mic_volume[0],
 					1);
 		mutex_unlock(&spec->cs8409_i2c_mux);
 	}
@@ -2112,15 +2117,11 @@ static int cs8409_cs42l42_hw_init(struct hda_codec *codec)
 
 	/* Enable Unsolicited Response */
 	cs8409_enable_ur(codec, 1);
-
-	return 1;
 }
 
 static int cs8409_cs42l42_init(struct hda_codec *codec)
 {
-	int ret = 0;
-
-	ret = snd_hda_gen_init(codec);
+	int ret = snd_hda_gen_init(codec);
 
 	if (!ret) {
 		/* On Dell platforms with suspend D3 mode support we
@@ -2152,9 +2153,9 @@ static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
 
 static int cs8409_cs42l42_fixup(struct hda_codec *codec)
 {
-	int err = 0;
+	int err;
 	struct cs_spec *spec = codec->spec;
-	unsigned int pincap = 0;
+	unsigned int caps;
 
 	/* Basic initial sequence for specific hw configuration */
 	snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
@@ -2169,25 +2170,29 @@ static int cs8409_cs42l42_fixup(struct hda_codec *codec)
 	 * capabilities. We have to override pin capabilities,
 	 * otherwise they will not be created as input devices.
 	 */
-	_snd_hdac_read_parm(&codec->core,
-			CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP, &pincap);
-
-	snd_hdac_override_parm(&codec->core,
+	caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_HP_PIN_NID,
+			AC_PAR_PIN_CAP);
+	if (caps >= 0)
+		snd_hdac_override_parm(&codec->core,
 			CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP,
-			(pincap | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
+			(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
 
-	_snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
-			AC_PAR_PIN_CAP, &pincap);
-
-	snd_hdac_override_parm(&codec->core,
+	caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
+			AC_PAR_PIN_CAP);
+	if (caps >= 0)
+		snd_hdac_override_parm(&codec->core,
 			CS8409_CS42L42_AMIC_PIN_NID, AC_PAR_PIN_CAP,
-			(pincap | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
+			(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
 
-	snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
-			(get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID) | AC_WCAP_UNSOL_CAP));
+	caps = get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID);
+	if (caps >= 0)
+		snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
+			(caps | AC_WCAP_UNSOL_CAP));
 
-	snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
-			(get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID) | AC_WCAP_UNSOL_CAP));
+	caps = get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID);
+	if (caps >= 0)
+		snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
+			(caps | AC_WCAP_UNSOL_CAP));
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
@@ -2209,7 +2214,7 @@ static int cs8409_cs42l42_fixup(struct hda_codec *codec)
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
-	return err;
+	return 0;
 }
 
 static int cs8409_cs42l42_exec_verb(struct hdac_device *dev,
@@ -2218,11 +2223,8 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev,
 	struct hda_codec *codec = container_of(dev, struct hda_codec, core);
 	struct cs_spec *spec = codec->spec;
 
-	unsigned int nid = 0;
-	unsigned int verb = 0;
-
-	nid = ((cmd >> 20) & 0x07f);
-	verb = ((cmd >> 8) & 0x0fff);
+	unsigned int nid = ((cmd >> 20) & 0x07f);
+	unsigned int verb = ((cmd >> 8) & 0x0fff);
 
 	/* CS8409 pins have no AC_PINSENSE_PRESENCE
 	 * capabilities. We have to intercept 2 calls for pins 0x24 and 0x34
@@ -2298,9 +2300,6 @@ static int patch_cs8409(struct hda_codec *codec)
 		spec->cs42l42_mic_jack_in = 0;
 
 		err = cs8409_cs42l42_fixup(codec);
-
-		if (err > 0)
-			err = cs8409_cs42l42_hw_init(codec);
 		break;
 
 	default:
@@ -2309,10 +2308,12 @@ static int patch_cs8409(struct hda_codec *codec)
 				codec->bus->pci->subsystem_device);
 		break;
 	}
-	if (err < 0)
-		cs_free(codec);
-	else
+
+	if (!err) {
+		cs8409_cs42l42_hw_init(codec);
 		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
+	} else
+		cs_free(codec);
 
 	return err;
 }
-- 
2.25.1

