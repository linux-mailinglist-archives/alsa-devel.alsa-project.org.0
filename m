Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433D33C681
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 20:10:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 034EB18D5;
	Mon, 15 Mar 2021 20:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 034EB18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615835406;
	bh=97L0+BsXypu1RmyCJShrFNg+UJUBLZgaf2acNR2TiKE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oe3MTOzbu9bedqCMwwuBC5+0sIHSOE75d0UZMaQrkiXiHLQa56nG/TXUXkhCQ+hB9
	 rATcveNA1nZDo4Y4UNEy/+GWSsounQMZ+Ljxi7yYohDHztSSPIgHjU0YnR2Ittcr7j
	 uHGjnOgwNIDmOIZFVaPICgpzxABQ4EByEyuLY0E4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF6A6F80424;
	Mon, 15 Mar 2021 20:07:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60B2BF802DB; Mon, 15 Mar 2021 20:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D36BF80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 20:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D36BF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="g1tmJCuy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FJ65vA021194; Mon, 15 Mar 2021 14:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=O9w11qcSDO3j5101IRu3wesN3Tf1Y5dr3B56jq9bF84=;
 b=g1tmJCuyMt1bQsS2OTnBzC2zTykuzEj9YMj5Cyg5repIGJlmKDNDNTZfHfpMxpx06vp1
 qLbr8A3bsluq49WeiqpzwH6q9aBmfU/tNQ0zHWXXGzUqf6aZJe1juv51ugvRFtClGmqt
 ZhqjJG3vlKhrvuYj5IQziXvZXTmwTZCHjrGSKTbyVDin67UksQWKGHotnbThgsh7i+2y
 1EEE5yClRgtD7/2ksLCn2zk+UX5jAiqP6g/ctNIYncqxIKAt+psEe4+JvIdjxGtKzi5d
 PUS8gwrpOQlganu7c6TbSHZkrjWlrfgHuQpZVHp3oSSb1Q71pUZuowcxiNFVEyQMG2Kg 5w== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 378tpv2t0m-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Mar 2021 14:07:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 15 Mar
 2021 19:07:18 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 15 Mar 2021 19:07:18 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 38DC311D7;
 Mon, 15 Mar 2021 19:07:18 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 4/4] ALSA: hda/cirrus: Make CS8409 driver more generic by
 using fixups.
Date: Mon, 15 Mar 2021 19:07:16 +0000
Message-ID: <20210315190716.47686-5-vitalyr@opensource.cirrus.com>
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

CS8409/CS42L42 Driver currently does most of the platform specific
setup inside the main body of the code, however, this setup can be
moved into fixup functions, to make the driver more generic.

Making the driver more generic, allows the driver to use the
cs_parse_auto_config function in the patch function. This function
forces all of the ADCs to be permanently powered, which means the
cap_sync_hook function is no longer needed to restart the stream, when
the jack has been ejected.

Since the codec is re-initialized on every init/resume, there is no
need to add specific verbs to be run on init, and instead these can
be combined with the initialization verbs, which are run on init.

In addition, the extra fixup verbs are no longer required, since this
is taken care of elsewhere.

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Changes in v1:
- No changes

Changes in v2:
- Removed redundant fields in cs8409_cs42l42_init_verbs table.

Changes in v3:
- No changes

---
 sound/pci/hda/patch_cirrus.c | 280 ++++++++++++-----------------------
 1 file changed, 98 insertions(+), 182 deletions(-)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index c99ec5e485af..9180b8000006 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1292,9 +1292,14 @@ enum {
 	CS8409_BULLSEYE,
 	CS8409_WARLOCK,
 	CS8409_CYBORG,
-	CS8409_VERBS,
+	CS8409_FIXUPS,
 };
 
+static void cs8409_cs42l42_fixups(struct hda_codec *codec,
+				    const struct hda_fixup *fix, int action);
+static int cs8409_cs42l42_exec_verb(struct hdac_device *dev,
+		unsigned int cmd, unsigned int flags, unsigned int *res);
+
 /* Dell Inspiron models with cs8409/cs42l42 */
 static const struct hda_model_fixup cs8409_models[] = {
 	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
@@ -1368,48 +1373,28 @@ static const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
 	{} /* terminator */
 };
 
-static const struct hda_verb cs8409_cs42l42_add_verbs[] = {
-	{ 0x24, 0x71c, 0xF0 }, /* Widget node ASP-1-TX */
-	{ 0x24, 0x71d, 0x20 },
-	{ 0x24, 0x71e, 0x21 },
-	{ 0x24, 0x71f, 0x04 },
-	{ 0x34, 0x71c, 0x50 }, /* Widget node ASP-1-RX0 */
-	{ 0x34, 0x71d, 0x20 },
-	{ 0x34, 0x71e, 0xa1 },
-	{ 0x34, 0x71f, 0x04 },
-	{ 0x2C, 0x71c, 0xF0 }, /* Widget node ASP-2-TX */
-	{ 0x2C, 0x71d, 0x00 },
-	{ 0x2C, 0x71e, 0x10 },
-	{ 0x2C, 0x71f, 0x90 },
-	{ 0x44, 0x71c, 0x90 }, /* Widget node DMIC-1 */
-	{ 0x44, 0x71d, 0x00 },
-	{ 0x44, 0x71e, 0xA0 },
-	{ 0x44, 0x71f, 0x90 },
-	{} /* terminator */
-};
-
 static const struct hda_fixup cs8409_fixups[] = {
 	[CS8409_BULLSEYE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = cs8409_cs42l42_pincfgs,
 		.chained = true,
-		.chain_id = CS8409_VERBS,
+		.chain_id = CS8409_FIXUPS,
 	},
 	[CS8409_WARLOCK] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = cs8409_cs42l42_pincfgs,
 		.chained = true,
-		.chain_id = CS8409_VERBS,
+		.chain_id = CS8409_FIXUPS,
 	},
 	[CS8409_CYBORG] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = cs8409_cs42l42_pincfgs,
 		.chained = true,
-		.chain_id = CS8409_VERBS,
+		.chain_id = CS8409_FIXUPS,
 	},
-	[CS8409_VERBS] = {
-		.type = HDA_FIXUP_VERBS,
-		.v.verbs = cs8409_cs42l42_add_verbs,
+	[CS8409_FIXUPS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs8409_cs42l42_fixups,
 	},
 };
 
@@ -2004,26 +1989,6 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	}
 }
 
-static int cs8409_cs42l42_build_controls(struct hda_codec *codec)
-{
-	int err;
-
-	err = snd_hda_gen_build_controls(codec);
-	if (err < 0)
-		return err;
-
-	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_BUILD);
-
-	/* Run jack auto detect first time on boot
-	 * after controls have been added, to check if jack has
-	 * been already plugged in
-	 */
-	cs8409_cs42l42_run_jack_detect(codec);
-	usleep_range(100000, 150000);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM
 /* Manage PDREF, when transition to D3hot */
 static int cs8409_suspend(struct hda_codec *codec)
@@ -2044,31 +2009,6 @@ static int cs8409_suspend(struct hda_codec *codec)
 }
 #endif
 
-static void cs8409_cs42l42_cap_sync_hook(struct hda_codec *codec,
-					 struct snd_kcontrol *kcontrol,
-					 struct snd_ctl_elem_value *ucontrol)
-{
-	struct cs_spec *spec = codec->spec;
-	unsigned int curval, expval;
-	/* CS8409 DMIC Pin only allows the setting of the Stream Parameters in
-	 * Power State D0. When a headset is unplugged, and the path is switched to
-	 * the DMIC, the Stream is restarted with the new ADC, but this is done in
-	 * Power State D3. Restart the Stream now DMIC is in D0.
-	 */
-	if (spec->gen.cur_adc == CS8409_CS42L42_DMIC_ADC_PIN_NID) {
-		curval = snd_hda_codec_read(codec, spec->gen.cur_adc,
-			0, AC_VERB_GET_CONV, 0);
-		expval = (spec->gen.cur_adc_stream_tag << 4) | 0;
-		if (curval != expval) {
-			codec_dbg(codec, "%s Restarting Stream after DMIC switch\n", __func__);
-			__snd_hda_codec_cleanup_stream(codec, spec->gen.cur_adc, 1);
-			snd_hda_codec_setup_stream(codec, spec->gen.cur_adc,
-					   spec->gen.cur_adc_stream_tag, 0,
-					   spec->gen.cur_adc_format);
-		}
-	}
-}
-
 /* Enable/Disable Unsolicited Response for gpio(s) 3,4 */
 static void cs8409_enable_ur(struct hda_codec *codec, int flag)
 {
@@ -2152,25 +2092,14 @@ static int cs8409_cs42l42_init(struct hda_codec *codec)
 {
 	int ret = snd_hda_gen_init(codec);
 
-	if (!ret) {
-		/* On Dell platforms with suspend D3 mode support we
-		 * have to re-initialise cs8409 bridge and companion
-		 * cs42l42 codec
-		 */
-		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
-		snd_hda_sequence_write(codec, cs8409_cs42l42_add_verbs);
-
-		cs8409_cs42l42_hw_init(codec);
-
-		cs8409_cs42l42_run_jack_detect(codec);
-		usleep_range(100000, 150000);
-	}
+	if (!ret)
+		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
 
 	return ret;
 }
 
 static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
-	.build_controls = cs8409_cs42l42_build_controls,
+	.build_controls = cs_build_controls,
 	.build_pcms = snd_hda_gen_build_pcms,
 	.init = cs8409_cs42l42_init,
 	.free = cs_free,
@@ -2180,66 +2109,91 @@ static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
 #endif
 };
 
-static int cs8409_cs42l42_fixup(struct hda_codec *codec)
+static void cs8409_cs42l42_fixups(struct hda_codec *codec,
+				    const struct hda_fixup *fix, int action)
 {
-	int err;
 	struct cs_spec *spec = codec->spec;
 	int caps;
 
-	/* Basic initial sequence for specific hw configuration */
-	snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
-
-	/* CS8409 is simple HDA bridge and intended to be used with a remote
-	 * companion codec. Most of input/output PIN(s) have only basic
-	 * capabilities. NID(s) 0x24 and 0x34 have only OUTC and INC
-	 * capabilities and no presence detect capable (PDC) and call to
-	 * snd_hda_gen_build_controls() will mark them as non detectable
-	 * phantom jacks. However, in this configuration companion codec
-	 * CS42L42 is connected to these pins and it has jack detect
-	 * capabilities. We have to override pin capabilities,
-	 * otherwise they will not be created as input devices.
-	 */
-	caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_HP_PIN_NID,
-			AC_PAR_PIN_CAP);
-	if (caps >= 0)
-		snd_hdac_override_parm(&codec->core,
-			CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP,
-			(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
-
-	caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
-			AC_PAR_PIN_CAP);
-	if (caps >= 0)
-		snd_hdac_override_parm(&codec->core,
-			CS8409_CS42L42_AMIC_PIN_NID, AC_PAR_PIN_CAP,
-			(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
-
-	snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
-		(get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID) | AC_WCAP_UNSOL_CAP));
-
-	snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
-		(get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID) | AC_WCAP_UNSOL_CAP));
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_add_verbs(codec, cs8409_cs42l42_init_verbs);
+		/* verb exec op override */
+		spec->exec_verb = codec->core.exec_verb;
+		codec->core.exec_verb = cs8409_cs42l42_exec_verb;
 
-	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
+		mutex_init(&spec->cs8409_i2c_mux);
 
-	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, 0, 0);
-	if (err < 0)
-		return err;
+		codec->patch_ops = cs8409_cs42l42_patch_ops;
 
-	err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
-	if (err < 0)
-		return err;
+		spec->gen.suppress_auto_mute = 1;
+		spec->gen.no_primary_hp = 1;
+		spec->gen.suppress_vmaster = 1;
 
-	if (!snd_hda_gen_add_kctl(
-			&spec->gen, NULL, &cs8409_cs42l42_hp_volume_mixer))
-		return -1;
+		/* GPIO 5 out, 3,4 in */
+		spec->gpio_dir = GPIO5_INT;
+		spec->gpio_data = 0;
+		spec->gpio_mask = 0x03f;
 
-	if (!snd_hda_gen_add_kctl(
-			&spec->gen, NULL, &cs8409_cs42l42_amic_volume_mixer))
-		return -1;
+		spec->cs42l42_hp_jack_in = 0;
+		spec->cs42l42_mic_jack_in = 0;
 
-	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
+		/* Basic initial sequence for specific hw configuration */
+		snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
 
-	return 0;
+		/* CS8409 is simple HDA bridge and intended to be used with a remote
+		 * companion codec. Most of input/output PIN(s) have only basic
+		 * capabilities. NID(s) 0x24 and 0x34 have only OUTC and INC
+		 * capabilities and no presence detect capable (PDC) and call to
+		 * snd_hda_gen_build_controls() will mark them as non detectable
+		 * phantom jacks. However, in this configuration companion codec
+		 * CS42L42 is connected to these pins and it has jack detect
+		 * capabilities. We have to override pin capabilities,
+		 * otherwise they will not be created as input devices.
+		 */
+		caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_HP_PIN_NID,
+				AC_PAR_PIN_CAP);
+		if (caps >= 0)
+			snd_hdac_override_parm(&codec->core,
+				CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP,
+				(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
+
+		caps = snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
+				AC_PAR_PIN_CAP);
+		if (caps >= 0)
+			snd_hdac_override_parm(&codec->core,
+				CS8409_CS42L42_AMIC_PIN_NID, AC_PAR_PIN_CAP,
+				(caps | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
+
+		snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
+			(get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID) | AC_WCAP_UNSOL_CAP));
+
+		snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
+			(get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID) | AC_WCAP_UNSOL_CAP));
+		break;
+	case HDA_FIXUP_ACT_PROBE:
+		snd_hda_gen_add_kctl(&spec->gen,
+			NULL, &cs8409_cs42l42_hp_volume_mixer);
+		snd_hda_gen_add_kctl(&spec->gen,
+			NULL, &cs8409_cs42l42_amic_volume_mixer);
+		cs8409_cs42l42_hw_init(codec);
+		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		cs8409_cs42l42_hw_init(codec);
+		// Fall through
+	case HDA_FIXUP_ACT_BUILD:
+		/* Run jack auto detect first time on boot
+		 * after controls have been added, to check if jack has
+		 * been already plugged in.
+		 * Run immediately after init.
+		 */
+		cs8409_cs42l42_run_jack_detect(codec);
+		usleep_range(100000, 150000);
+		break;
+	default:
+		break;
+	}
 }
 
 static int cs8409_cs42l42_exec_verb(struct hdac_device *dev,
@@ -2280,11 +2234,9 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev,
 
 static int patch_cs8409(struct hda_codec *codec)
 {
-	struct cs_spec *spec;
-	int err = -EINVAL;
+	int err;
 
-	spec = cs_alloc_spec(codec, CS8409_VENDOR_NID);
-	if (!spec)
+	if (!cs_alloc_spec(codec, CS8409_VENDOR_NID))
 		return -ENOMEM;
 
 	snd_hda_pick_fixup(codec,
@@ -2295,52 +2247,16 @@ static int patch_cs8409(struct hda_codec *codec)
 			codec->bus->pci->subsystem_vendor,
 			codec->bus->pci->subsystem_device);
 
-	switch (codec->fixup_id) {
-	/* Dell platforms with CS42L42 companion codec */
-	case CS8409_BULLSEYE:
-	case CS8409_WARLOCK:
-	case CS8409_CYBORG:
-
-		snd_hda_add_verbs(codec, cs8409_cs42l42_add_verbs);
-
-		/* verb exec op override */
-		spec->exec_verb = codec->core.exec_verb;
-		codec->core.exec_verb = cs8409_cs42l42_exec_verb;
-
-		mutex_init(&spec->cs8409_i2c_mux);
-
-		codec->patch_ops = cs8409_cs42l42_patch_ops;
-
-		spec->gen.cap_sync_hook = cs8409_cs42l42_cap_sync_hook;
-
-		spec->gen.suppress_auto_mute = 1;
-		spec->gen.no_primary_hp = 1;
-		spec->gen.suppress_vmaster = 1;
-		/* GPIO 5 out, 3,4 in */
-		spec->gpio_dir = GPIO5_INT;
-		spec->gpio_data = 0;
-		spec->gpio_mask = 0x03f;
-
-		spec->cs42l42_hp_jack_in = 0;
-		spec->cs42l42_mic_jack_in = 0;
-
-		err = cs8409_cs42l42_fixup(codec);
-		break;
-
-	default:
-		codec_err(codec, "VID=%08x, DEV=%08x not supported\n",
-				codec->bus->pci->subsystem_vendor,
-				codec->bus->pci->subsystem_device);
-		break;
-	}
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
 
-	if (!err) {
-		cs8409_cs42l42_hw_init(codec);
-		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
-	} else
+	err = cs_parse_auto_config(codec);
+	if (err < 0) {
 		cs_free(codec);
+		return err;
+	}
 
-	return err;
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
+	return 0;
 }
 
 /*
-- 
2.25.1

