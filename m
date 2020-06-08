Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6B1F23C7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 01:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BE2C1677;
	Tue,  9 Jun 2020 01:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BE2C1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591658278;
	bh=zkzHQ3L6t8f+yP/wGT2EgnhMayEURSqiXPI+bmXbr6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UeDYLdOZEVW3+czGGOSicfNyBUCg07e/omD2awxBrqeiMbLcL8RGlp75tjwsWgonc
	 OJSEp14p0DtjCnJlOZaGBlty5W5xE9BMdlLDNSaw8v0zKeJmhrXPTxcbMvAwBahepe
	 XJRajlPHWjrRU3ck9pKkP2rzkic1QhQ0eH4TNbWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54906F802E8;
	Tue,  9 Jun 2020 01:15:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFEE7F802D2; Tue,  9 Jun 2020 01:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE237F801F7
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 01:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE237F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bh0yGGoL"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8DF0E21532;
 Mon,  8 Jun 2020 23:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658094;
 bh=zkzHQ3L6t8f+yP/wGT2EgnhMayEURSqiXPI+bmXbr6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bh0yGGoLRoIAjOrSn2SarRTwDcRrLIGQY10UHe15/4rO1eKzla1j0JLVx7rYUj+vR
 6byqBCdAv1aCrpjzAvUXaKYLuHi9k1zu5j8teRIZWR6LEAM7OrsXWLUprxIENHr5fJ
 jRmPzU7cP77qXhNiJsXwOctK/jGvcviJuAI9dRbE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 136/606] ALSA: hda/realtek - Add HP new mute led
 supported for ALC236
Date: Mon,  8 Jun 2020 19:04:21 -0400
Message-Id: <20200608231211.3363633-136-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>
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

From: Kailang Yang <kailang@realtek.com>

[ Upstream commit 24164f434dc9c23cd34fca1e36acea9d0581bdde ]

HP new platform has new mute led feature.
COEF index 0x34 bit 5 to control playback mute led.
COEF index 0x35 bit 2 and bit 3 to control Mic mute led.

[ corrected typos by tiwai ]

Signed-off-by: Kailang Yang <kailang@realtek.com>
Link: https://lore.kernel.org/r/6741211598ba499687362ff2aa30626b@realtek.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 44fbd5d2d89c..368ed3678fc2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4223,6 +4223,23 @@ static void alc285_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 	}
 }
 
+static void alc236_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
+					  const struct hda_fixup *fix,
+					  int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->mute_led_polarity = 0;
+		spec->mute_led_coef_idx = 0x34;
+		spec->mute_led_coefbit_mask = 1<<5;
+		spec->mute_led_coefbit_on = 0;
+		spec->mute_led_coefbit_off = 1<<5;
+		spec->gen.vmaster_mute.hook = alc_fixup_mute_led_coefbit_hook;
+		spec->gen.vmaster_mute_enum = 1;
+	}
+}
+
 /* turn on/off mic-mute LED per capture hook by coef bit */
 static void alc_hp_cap_micmute_update(struct hda_codec *codec)
 {
@@ -4250,6 +4267,20 @@ static void alc285_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 	}
 }
 
+static void alc236_fixup_hp_coef_micmute_led(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->mic_led_coef_idx = 0x35;
+		spec->mic_led_coefbit_mask = 3<<2;
+		spec->mic_led_coefbit_on = 2<<2;
+		spec->mic_led_coefbit_off = 1<<2;
+		snd_hda_gen_add_micmute_led(codec, alc_hp_cap_micmute_update);
+	}
+}
+
 static void alc285_fixup_hp_mute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -4257,6 +4288,13 @@ static void alc285_fixup_hp_mute_led(struct hda_codec *codec,
 	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
 }
 
+static void alc236_fixup_hp_mute_led(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	alc236_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc236_fixup_hp_coef_micmute_led(codec, fix, action);
+}
+
 #if IS_REACHABLE(CONFIG_INPUT)
 static void gpio2_mic_hotkey_event(struct hda_codec *codec,
 				   struct hda_jack_callback *event)
@@ -6056,6 +6094,7 @@ enum {
 	ALC294_FIXUP_ASUS_COEF_1B,
 	ALC285_FIXUP_HP_GPIO_LED,
 	ALC285_FIXUP_HP_MUTE_LED,
+	ALC236_FIXUP_HP_MUTE_LED,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7208,6 +7247,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_hp_mute_led,
 	},
+	[ALC236_FIXUP_HP_MUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_mute_led,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7354,6 +7397,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x8736, "HP", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x877d, "HP", ALC236_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.25.1

