Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2F225F4EF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 10:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DE0179E;
	Mon,  7 Sep 2020 10:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DE0179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599466933;
	bh=IvOCTDU0JWRuX5ExT2rwyJ/GcYIJEA4bG5zvUoltkAM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HmfE7eileMHTkiD2hoShPPMAL6ZViQY5gGiTRNW82K6q0hiZf4iee04a3+nuXsXxx
	 KDMzM+pDSdUGBCKlKd9BpZbl+ihDNuZ60BTAXMtX+cL85aeN6hrO1FCz72o8epVcc+
	 5NU41sHF0aorvcgqjSCxqDBsrHQ9+AGbRztbnHBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB937F800B9;
	Mon,  7 Sep 2020 10:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10BA2F800FD; Mon,  7 Sep 2020 10:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAA9CF800B9
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 10:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA9CF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ZUiaQMie"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 292FA5C0162;
 Mon,  7 Sep 2020 04:20:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 07 Sep 2020 04:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zk8ZyZxWO1zP2jEYx
 B/yaorIL/zpNOYAswcJk5VHeio=; b=ZUiaQMiekEAbEVglJSdVRQmu8VG0VFKX6
 G6GDEGGPGhuRIA7yhTs4+3ALoEcU9xRqelahLJKK4XbsEAirJKnbTGKNY8SS4yFC
 GlZRi0vP8X+UshBSuM+zL7O3wfbH3UqEyNJ7U0OoAjq+x/P93aUDY3z4R4iGy1VO
 e/Gd9KHbmVBduBOIoeoIFBKl/pJF/vo19yd4vBhah5U7fPmEQEcFGWC9rLCa2Ea5
 Z+EZdDxllxqbIw30AAmHdmU1WEKc3qeBEK73l5w4a2pV4grnvsOeE+cvOZofDUZ4
 yqDhhuEOWbCb1pDQD9rcKiS2G7E8Vbii6XZNGBM///cnADNofZyuQ==
X-ME-Sender: <xms:QO1VX1xfLWO_kRlvyuqULLDCi9njw_PeVTt7J1foTDKG-CepkC1uWQ>
 <xme:QO1VX1RexPZ4TiByi6VlQk6c4QdB0jibjCj-peJYng2aOO3WuEWj7tfeWOlWEMMDp
 l-j4NWyOVXa-i4AaBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehtddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepnfhukhgvucffucflohhnvghsuceolhhukhgvsehljhhonhgvshdr
 uggvvheqnecuggftrfgrthhtvghrnhepfffghfehheekgfdttdeihfdugeetkeduiefhvd
 dujeduiefgtdehieejtedvjedvnecukfhppedvtdefrdduudegrddugedurdduieenucfu
 phgrmhfkphfpvghtfihorhhkpedvtdefrdduudegrddugedurdduieenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghs
 rdguvghv
X-ME-Proxy: <xmx:QO1VX_X5K0MfPSRi7awi2hsnj1Sy5R03mYh0rB0RSWW_md2anLtDTg>
 <xmx:QO1VX3j3CkUdubHXDxyvzJuChBMh0D5Czt9C4U4iM8vAQnEgqWdiSQ>
 <xmx:QO1VX3Dy5K5Ym3ijxNz4_eLYDR-L1Wqks8eIGBdHDGdsGswF9wmn5w>
 <xmx:Qu1VX6PdERW_z0dOxeIF7Du0abhptdg6QjuqUZMw4eK0hatj2TaqfA>
Received: from localhost.localdomain (203-114-141-16.sta.inspire.net.nz
 [203.114.141.16])
 by mail.messagingengine.com (Postfix) with ESMTPA id AEAF8328005A;
 Mon,  7 Sep 2020 04:20:14 -0400 (EDT)
From: Luke D Jones <luke@ljones.dev>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH V2] ALSA: hda: fixup headset for ASUS GX502 laptop
Date: Mon,  7 Sep 2020 20:19:59 +1200
Message-Id: <20200907081959.56186-1-luke@ljones.dev>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The GX502 requires a few steps to enable the headset i/o: pincfg,
verbs to enable and unmute the amp used for headpone out, and
a jacksense callback to toggle output via internal or jack using
a verb.

Signed-off-by: Luke D Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 65 +++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 29f5878f0c50..16009297f771 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5975,6 +5975,40 @@ static void alc_fixup_disable_mic_vref(struct hda_codec *codec,
 		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
 }
 
+
+static void alc294_gx502_toggle_output(struct hda_codec *codec,
+					struct hda_jack_callback *cb)
+{
+	/* The Windows driver sets the codec up in a very different way where
+	 * it appears to leave 0x10 = 0x8a20 set. For Linux we need to toggle it
+	 */
+	if (snd_hda_jack_detect_state(codec, 0x21) == HDA_JACK_PRESENT)
+		alc_write_coef_idx(codec, 0x10, 0x8a20);
+	else
+		alc_write_coef_idx(codec, 0x10, 0x0a20);
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
@@ -6154,6 +6188,9 @@ enum {
 	ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	ALC294_FIXUP_ASUS_HPE,
 	ALC294_FIXUP_ASUS_COEF_1B,
+	ALC294_FIXUP_ASUS_GX502_HP,
+	ALC294_FIXUP_ASUS_GX502_PINS,
+	ALC294_FIXUP_ASUS_GX502_VERBS,
 	ALC285_FIXUP_HP_GPIO_LED,
 	ALC285_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
@@ -7307,6 +7344,33 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC294_FIXUP_ASUS_HEADSET_MIC
 	},
+	[ALC294_FIXUP_ASUS_GX502_PINS] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11050 }, /* front HP mic */
+			{ 0x1a, 0x01a11830 }, /* rear external mic */
+			{ 0x21, 0x03211020 }, /* front HP out */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC294_FIXUP_ASUS_GX502_VERBS
+	},
+	[ALC294_FIXUP_ASUS_GX502_VERBS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			/* set 0x15 to HP-OUT ctrl */
+			{ 0x15, AC_VERB_SET_PIN_WIDGET_CONTROL, 0xc0 },
+			/* unmute the 0x15 amp */
+			{ 0x15, AC_VERB_SET_AMP_GAIN_MUTE, 0xb000 },
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
@@ -7588,6 +7652,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
 	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1881, "ASUS Zephyrus S/M", ALC294_FIXUP_ASUS_GX502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x834a, "ASUS S101", ALC269_FIXUP_STEREO_DMIC),
-- 
2.26.2

