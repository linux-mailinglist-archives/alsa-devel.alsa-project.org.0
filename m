Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186A725EE6B
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Sep 2020 17:00:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2626186E;
	Sun,  6 Sep 2020 16:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2626186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599404429;
	bh=vZhmV7AgQ51vYV6J5vrr5kpCpZ4xvs54gctNoU8crxo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fu1lNsKejEfBcgKMFWjwtVH/nY3oRdo2tRG30cybdcnsQCJCIjFmUXZOFz2XYAnzY
	 STszQZ5lhOJB9rDqGyLLC1nP3fEd1rbAH+y2WragZSXvXM0E2sDPjeQOkksOgiSMA2
	 NTMGZeIFZTBYdFtuFD0OSilaxmM1npLwTWDkQmeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7926DF802E9;
	Sun,  6 Sep 2020 16:56:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79723F8026F; Sun,  6 Sep 2020 10:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76C58F800B4
 for <alsa-devel@alsa-project.org>; Sun,  6 Sep 2020 10:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76C58F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mo14MIsd"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id F171C5C013F;
 Sun,  6 Sep 2020 04:25:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 06 Sep 2020 04:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oWXnsoc0PY4Vz0E0s
 tb/GE8LVAEz0pVt/LmEzv64ANc=; b=mo14MIsdPrVmnf86J2jq/eY+5+NAbTcIa
 ankoJXxpg8co+vKgsbw64bajyCVQJZfmUrHVGJSt0jXy1XRf8OpbaniLv6A8NrYZ
 3b9kHO5gkZBrn2K2N/YCkhs3xjxwqvg0sLybWb5fULIGEJ/lvgxuOAVm0Rkl+ccK
 5hD7aJn1MUSgqd9f4/JTxLICyKRa0wZCiUyoTzY/UJlG9vOZb7i6fgTl0UZMrdij
 OMl0la1iLr5yWFUcGw6MgUMd3ZzcSNSh2pj6QZHYj2E8UgIV4VO9SlE/DH6SdUn7
 tMn0dcfa7IQ6AOHSmz0NYbkaC/K1xv7TptxlB29F19QNY7rc2/iFQ==
X-ME-Sender: <xms:-JxUXzcYIVRvnRVb1STvGfoDAH5P5_i_HpWtIEdI1Hm1XMHAUtv-cA>
 <xme:-JxUX5PVgtrfqF1h05RQ_eW1z8MqPO3lClNUHIBZoi5w-wWbIqoQSYmkYiAZnq-Mw
 UgdP0hG2u9UjRdXwYk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegjedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefnuhhkvgculfho
 nhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpedvtd
 dvuefhgefggfehhfdugeekjeelueegtdeuteevgeefvddtlefhgfdvvdefkeenucfkphep
 vddtfedruddugedrudeguddrudeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:-JxUX8hZe-rh5rCREYk74YwOB82afpXIsMUEpwkzPtTxNIFKNyEAeg>
 <xmx:-JxUX09WciKe6aMIjgZXBs-HQr0MNHpPW3HIPnCJLKcmpeVaPDwUUQ>
 <xmx:-JxUX_t9UbOA0ww0h2nCAgSU9kyciiSByMfHJd9DYoKrcfFEHjJcqA>
 <xmx:-ZxUX44v0pHtxw8JR4IFbeJKkGvIEDX_26LTHHBf3u1tZ0-N0SP_FA>
Received: from localhost.localdomain (203-114-141-16.sta.inspire.net.nz
 [203.114.141.16])
 by mail.messagingengine.com (Postfix) with ESMTPA id 81DE53280059;
 Sun,  6 Sep 2020 04:25:25 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH] ALSA: hda: fixup headset for ASUS GX502 laptop
Date: Sun,  6 Sep 2020 20:25:07 +1200
Message-Id: <20200906082507.38091-1-luke@ljones.dev>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Sep 2020 16:56:12 +0200
Cc: hui.wang@canonical.com, Luke D Jones <luke@ljones.dev>, kailang@realtek.com
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

From: Luke D Jones <luke@ljones.dev>

The GX502 requires a few steps to enable the headset i/o: pincfg,
verbs to enable and unmute the amp used for headpone out, and
a jacksense callback to toggle output via internal or jack using
a verb.

Signed-off-by: Luke Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 70 ++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c521a1f17096..d2052a6e3b13 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5424,7 +5424,7 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
 		struct alc_spec *spec = codec->spec;
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
 		alc255_set_default_jack_type(codec);
-	} 
+	}
 	else
 		alc_fixup_headset_mode(codec, fix, action);
 }
@@ -5993,6 +5993,41 @@ static void alc_fixup_disable_mic_vref(struct hda_codec *codec,
 		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
 }
 
+
+static void alc294_gx502_toggle_output(struct hda_codec *codec,
+					struct hda_jack_callback *cb)
+{
+	/* The Windows driver sets the codec up in a very different way where
+	 * it appears to leave 0x10 = 0x8a20 set. For Linux we need to toggle it
+	 */
+	if (snd_hda_jack_detect_state(codec, 0x21) == HDA_JACK_PRESENT) {
+		alc_write_coef_idx(codec, 0x10, 0x8a20);
+	} else {
+		alc_write_coef_idx(codec, 0x10, 0x0a20);
+	}
+}
+
+static void alc294_fixup_gx502_hp(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+	/* Pin 0x21: headphones/headset mic */
+	if (!is_jack_detectable(codec, 0x21))
+		return;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_jack_detect_enable_callback(codec, 0x21,
+				alc294_gx502_toggle_output);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		/* Make sure to start in a correct state, i.e. if
+		 * headphones have been plugged in before powering up the system
+		 */
+		alc294_gx502_toggle_output(codec, NULL);
+		break;
+	}
+}
+
 static void  alc285_fixup_hp_gpio_amp_init(struct hda_codec *codec,
 			      const struct hda_fixup *fix, int action)
 {
@@ -6172,6 +6207,9 @@ enum {
 	ALC285_FIXUP_THINKPAD_X1_GEN7,
 	ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	ALC294_FIXUP_ASUS_HPE,
+	ALC294_FIXUP_ASUS_GX502_HP,
+	ALC294_FIXUP_ASUS_GX502_PINS,
+	ALC294_FIXUP_ASUS_GX502_VERBS,
 	ALC294_FIXUP_ASUS_COEF_1B,
 	ALC285_FIXUP_HP_GPIO_LED,
 	ALC285_FIXUP_HP_MUTE_LED,
@@ -7338,6 +7376,35 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
 	},
+	[ALC294_FIXUP_ASUS_GX502_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 }, /* front HP mic */
+			{ 0x1a, 0x01a11830 }, //0x00a11030 }, /* rear external mic */
+			{ 0x21, 0x03211020 }, /* HP out */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_GX502_VERBS
+	},
+	[ALC294_FIXUP_ASUS_GX502_VERBS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+		    /* set 0x15 to HP-OUT ctrl */
+			{ 0x15, AC_VERB_SET_PIN_WIDGET_CONTROL, 0xc0 },
+			/* unmute the 0x15 amp */
+			{ 0x15, AC_VERB_SET_AMP_GAIN_MUTE, 0xb000 },
+			/* set 0x0a input converter to digital */
+			{ 0x0a, 0x70d, 0x01 },
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_GX502_HP
+	},
+	[ALC294_FIXUP_ASUS_GX502_HP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc294_fixup_gx502_hp,
+	},
 	[ALC294_FIXUP_ASUS_COEF_1B] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -7711,6 +7778,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x834a, "ASUS S101", ALC269_FIXUP_STEREO_DMIC),
-- 
2.26.2

