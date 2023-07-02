Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B1744CB4
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jul 2023 10:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F29857;
	Sun,  2 Jul 2023 10:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F29857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688286234;
	bh=QqTOVUNxPVkQZsvMN01ojfQ2OCrkfJ3TpzoozyOorq0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Md56Wx/Vn7Rx7RJ0rg+gdfmKr+UI2ESaXIv3AEC4EsOfDxvvbLy0OlMd4jS6qVrrr
	 gVNk9LlnibFrgcYD3vn3WgHH0zwqVT/GBIuD9HIxz0l7OjLMdKqDPq66IYiqE+SJxH
	 bCrlNLBn0GM7paQtdiMw9QX8Pqnegz6b44XGldsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 244A4F80571; Sun,  2 Jul 2023 10:22:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4AA4F8055C;
	Sun,  2 Jul 2023 10:22:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB1BF80124; Sun,  2 Jul 2023 10:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BD63F80125
	for <alsa-devel@alsa-project.org>; Sun,  2 Jul 2023 10:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD63F80125
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[183.194.157.248])
	by rmsmtp-lg-appmail-33-12047 (RichMail) with SMTP id 2f0f64a132f5463-0757c;
	Sun, 02 Jul 2023 16:19:02 +0800 (CST)
X-RM-TRANSID: 2f0f64a132f5463-0757c
From: Shenghao Ding <13916275206@139.com>
To: broonie@kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Cc: kevin-lu@ti.com,
	shenghao-ding@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	x1077012@ti.com,
	peeyush@ti.com,
	navada@ti.com,
	tiwai@suse.de,
	Shenghao Ding <13916275206@139.com>
Subject: [PATCH v1 1/3] ALSA: hda/tas2781: Add tas2781 HDA driver
Date: Sun,  2 Jul 2023 16:18:55 +0800
Message-Id: <20230702081857.799693-1-13916275206@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H4GOYDZDOJSUNPDL5UKEOCR6YGQAI6UW
X-Message-ID-Hash: H4GOYDZDOJSUNPDL5UKEOCR6YGQAI6UW
X-MailFrom: 13916275206@139.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H4GOYDZDOJSUNPDL5UKEOCR6YGQAI6UW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
laptop will be aggregated as one speaker. The code support realtek as the
primary codec.

Signed-off-by: Shenghao Ding <13916275206@139.com>

---
Changes in v1:
 - remove white space at the end of the line in alc_fixup_headset_mode_alc255_no_hp_mic
 - Add tiwai@suse.de into Cc list
 - remove useless index
 - combine ALC287_FIXUP_TAS2781_I2C_2 and ALC287_FIXUP_TAS2781_I2C_4 together as
    ALC287_FIXUP_TAS2781_I2C, The code view all the tas2781s in the laptop as one instance.
 - delete the white space at the end of the line in alc_fixup_headset_mode_alc255_no_hp_mic
 - fix Laptop 0x17aa38be get the wrong fixup_id and enter into the wrong entry.
---
 sound/pci/hda/patch_realtek.c | 114 ++++++++++++++++++++++++++++++++--
 1 file changed, 110 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index afe8253f9a4f..2e5354a5decf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5883,7 +5883,7 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
 		struct alc_spec *spec = codec->spec;
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
 		alc255_set_default_jack_type(codec);
-	} 
+	}
 	else
 		alc_fixup_headset_mode(codec, fix, action);
 }
@@ -6705,7 +6705,7 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
 	}
 }
 
-struct cs35l41_dev_name {
+struct scodec_dev_name {
 	const char *bus;
 	const char *hid;
 	int index;
@@ -6714,7 +6714,7 @@ struct cs35l41_dev_name {
 /* match the device name in a slightly relaxed manner */
 static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
 {
-	struct cs35l41_dev_name *p = data;
+	struct scodec_dev_name *p = data;
 	const char *d = dev_name(dev);
 	int n = strlen(p->bus);
 	char tmp[32];
@@ -6730,12 +6730,32 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
 	return !strcmp(d + n, tmp);
 }
 
+static int comp_match_tas2781_dev_name(struct device *dev,
+	void *data)
+{
+	struct scodec_dev_name *p = data;
+	const char *d = dev_name(dev);
+	int n = strlen(p->bus);
+	char tmp[32];
+
+	/* check the bus name */
+	if (strncmp(d, p->bus, n))
+		return 0;
+	/* skip the bus number */
+	if (isdigit(d[n]))
+		n++;
+	/* the rest must be exact matching */
+	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
+
+	return !strcmp(d + n, tmp);
+}
+
 static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
 				  const char *hid, int count)
 {
 	struct device *dev = hda_codec_dev(cdc);
 	struct alc_spec *spec = cdc->spec;
-	struct cs35l41_dev_name *rec;
+	struct scodec_dev_name *rec;
 	int ret, i;
 
 	switch (action) {
@@ -6763,6 +6783,41 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 	}
 }
 
+static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
+	const char *bus, const char *hid)
+{
+	struct device *dev = hda_codec_dev(cdc);
+	struct alc_spec *spec = cdc->spec;
+	struct scodec_dev_name *rec;
+	int ret;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		rec = devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
+		if (!rec)
+			return;
+		rec->bus = bus;
+		rec->hid = hid;
+		rec->index = 0;
+		spec->comps[0].codec = cdc;
+		component_match_add(dev, &spec->match,
+			comp_match_tas2781_dev_name, rec);
+		ret = component_master_add_with_match(dev, &comp_master_ops,
+			spec->match);
+		if (ret)
+			codec_err(cdc,
+				"Fail to register component aggregator %d\n",
+				ret);
+		else
+			spec->gen.pcm_playback_hook =
+				comp_generic_playback_hook;
+		break;
+	case HDA_FIXUP_ACT_FREE:
+		component_master_del(dev, &comp_master_ops);
+		break;
+	}
+}
+
 static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
 	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 2);
@@ -6790,6 +6845,12 @@ static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st
 	cs35l41_generic_fixup(cdc, action, "i2c", "CLSA0101", 2);
 }
 
+static void tas2781_fixup_i2c(struct hda_codec *cdc,
+	const struct hda_fixup *fix, int action)
+{
+	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
+}
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -7210,6 +7271,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
 	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 	ALC236_FIXUP_DELL_DUAL_CODECS,
+	ALC287_FIXUP_TAS2781_I2C,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9255,6 +9317,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC255_FIXUP_DELL1_MIC_NO_PRESENCE,
 	},
+	[ALC287_FIXUP_TAS2781_I2C] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = tas2781_fixup_i2c,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9813,6 +9881,33 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x387e, "Yoga S780-16 pro Quad YC",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual powe mode2 YC",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3884, "Y780 YG DUAL",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38ba, "Yoga S780-14.5 Air AMD quad YC",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38bb, "Yoga S780-14.5 Air AMD quad AAC",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38bf, "Yoga S980-14.5 proX LX Dual",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38c3, "Y980 DUAL", ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38cb, "Y790 YG DUAL",
+		ALC287_FIXUP_TAS2781_I2C),
+	SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL",
+		ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
@@ -10728,6 +10823,17 @@ static int patch_alc269(struct hda_codec *codec)
 		codec->fixup_id = HDA_FIXUP_ID_NOT_SET;
 	}
 
+	/* FIXME: Laptop 0x17aa38be will get the wrong fixup_id and
+	 * enter into the wrong entry.
+	 * Correct the wrong entry.
+	 */
+	if (codec->fixup_id == ALC287_FIXUP_YOGA7_14ITL_SPEAKERS &&
+		codec->core.vendor_id == 0x10ec0287 &&
+		codec->core.subsystem_id == 0x17aa38be) {
+		codec_dbg(codec, "Clear wrong fixup for 17aa38be\n");
+		codec->fixup_id = ALC287_FIXUP_TAS2781_I2C;
+	}
+
 	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups, true);
 	snd_hda_pick_pin_fixup(codec, alc269_fallback_pin_fixup_tbl, alc269_fixups, false);
 	snd_hda_pick_fixup(codec, NULL,	alc269_fixup_vendor_tbl,
-- 
2.34.1


