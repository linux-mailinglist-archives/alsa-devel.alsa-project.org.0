Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFD8372801
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 11:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8AA1693;
	Tue,  4 May 2021 11:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8AA1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620119988;
	bh=XmzptXsaod/RbmocJ0qHfEeYbTmHfiVcLnrKJOcYv0Q=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XiW8slkgpaMV5wSfklVyuILaR+1LLz9Z4TU0jvfxIcxMBSHYYxn5jTYOt1Xmu0d2B
	 ybzcdQyhPeHSz8QzB1wTBbU/BKHv7H1C5/GVxtI8lJubMu4p1fTNHrstwHmowtz8go
	 iU9RNHwtcsslyoPxwCbVFvbfR3aKsjDBYlU3zjJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB74F80162;
	Tue,  4 May 2021 11:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 861D7F8021C; Tue,  4 May 2021 11:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 308DCF80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 11:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 308DCF80114
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93E8EB19A
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 09:18:04 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Fix speaker amp on HP Envy AiO 32
Date: Tue,  4 May 2021 11:18:02 +0200
Message-Id: <20210504091802.13200-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

HP Envy AiO 32-a12xxx has an external amp that is controlled via GPIO
bit 0x04.  However, unlike other devices, this amp seems to shut down
itself after the certain period, hence the OS needs to up/down the bit
dynamically only during the actual playback.

This patch adds the control of the GPIO bit via the existing pcm_hook
mechanism.  Ideally it should be triggered at the actual stream start,
but we have only the state change at prepare/cleanup, so use those for
switching the GPIO bit on/off.  This should be good enough for the
purpose, and was actually confirmed to work fine.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212873
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bbbe37f3e724..ee2841dd0c6d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4338,6 +4338,35 @@ static void alc245_fixup_hp_x360_amp(struct hda_codec *codec,
 	}
 }
 
+/* toggle GPIO2 at each time stream is started; we use PREPARE state instead */
+static void alc274_hp_envy_pcm_hook(struct hda_pcm_stream *hinfo,
+				    struct hda_codec *codec,
+				    struct snd_pcm_substream *substream,
+				    int action)
+{
+	switch (action) {
+	case HDA_GEN_PCM_ACT_PREPARE:
+		alc_update_gpio_data(codec, 0x04, true);
+		break;
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		alc_update_gpio_data(codec, 0x04, false);
+		break;
+	}
+}
+
+static void alc274_fixup_hp_envy_gpio(struct hda_codec *codec,
+				      const struct hda_fixup *fix,
+				      int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PROBE) {
+		spec->gpio_mask |= 0x04;
+		spec->gpio_dir |= 0x04;
+		spec->gen.pcm_playback_hook = alc274_hp_envy_pcm_hook;
+	}
+}
+
 static void alc_update_coef_led(struct hda_codec *codec,
 				struct alc_coef_led *led,
 				bool polarity, bool on)
@@ -6465,6 +6494,7 @@ enum {
 	ALC255_FIXUP_XIAOMI_HEADSET_MIC,
 	ALC274_FIXUP_HP_MIC,
 	ALC274_FIXUP_HP_HEADSET_MIC,
+	ALC274_FIXUP_HP_ENVY_GPIO,
 	ALC256_FIXUP_ASUS_HPE,
 	ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
 	ALC287_FIXUP_HP_GPIO_LED,
@@ -7907,6 +7937,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC274_FIXUP_HP_MIC
 	},
+	[ALC274_FIXUP_HP_ENVY_GPIO] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc274_fixup_hp_envy_gpio,
+	},
 	[ALC256_FIXUP_ASUS_HPE] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -8140,6 +8174,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", ALC269_FIXUP_HP_MUTE_LED_MIC3),
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8724, "HP EliteBook 850 G7", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8729, "HP", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8730, "HP ProBook 445 G7", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
-- 
2.26.2

