Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C6341CD84
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 22:45:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BFE716EA;
	Wed, 29 Sep 2021 22:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BFE716EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632948319;
	bh=Dc+Qca27ncQSjfOacT+pAT2ZVC1sQc+5pWZtUMwPB2g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAY6MP0ZEbI6n8Eo+6LO9gSEJ4h1I+NsJkcMJO25kob/+SxGeshmhIvc6sunGzgid
	 hvVBcq2UYRGh0uGM6OjDXlG/57pq6xW6gYBjzSF6qU/SCBI6fg4jnntGe5DYz09NB5
	 5NWlHQkP9vIoBzldEArmQ8ExHBH2hS8/nyCZxTt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 692EBF8026D;
	Wed, 29 Sep 2021 22:44:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5F50F80227; Wed, 29 Sep 2021 22:44:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.baldo.me (mail.baldo.me [51.15.71.247])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FD63F80161
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 22:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD63F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baldo.me header.i=@baldo.me
 header.b="MaGiiiu6"
Received: from mail.baldo.me (localhost [127.0.0.1])
 by mail.baldo.me (Postfix) with ESMTPS id DD4784287D;
 Wed, 29 Sep 2021 20:43:52 +0000 (UTC)
Received: from mail.baldo.me (localhost [127.0.0.1])
 by mail.baldo.me (Postfix) with ESMTPS id B4BE24287F;
 Wed, 29 Sep 2021 20:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.baldo.me B4BE24287F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baldo.me;
 s=BA429582-84BB-11EA-85D5-B6667C1AB266; t=1632948232;
 bh=Xl2c0OmbD5Gdw4JAzbaCqr/m+t5DShGOy6882OkLobo=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=MaGiiiu6C3gAZX3JXwPvjyk886nOFGNQwdbivM+ABoINHgZXB34RyKzgOHrU/FOrT
 wRRChRrpOvIxAJ8J1s+NcHP8/QtDgzshe3vIpiwH5ekA0gDoQVr02R5DPffiFjd88Z
 t3b83/1N4x9ST2d+vJ238C5dXWEnoALfY/XL3f5q+W2Y/k+5NiKhnAxG8aKSlC7A0q
 NVxLU6l3iVHO/ZkrVSJv/o6XMEH4DGJkQMolgh4BB+cv+EaoK3J7LGXdhRPwXvO80l
 JRGnAsCHl9rAD24Axje8U54YgUzDVwAcltF/TNYc9XzrzyfM/udzXdZWlDxphJO+JP
 euDh287J8g/Vw==
Received: from localhost.localdomain (unknown [151.38.176.217])
 by mail.baldo.me (Postfix) with ESMTPSA id 5C03C4287D;
 Wed, 29 Sep 2021 20:43:52 +0000 (UTC)
From: Davide Baldo <davide@baldo.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Fixes HP Spectre x360 15-eb1xxx speakers
Date: Wed, 29 Sep 2021 22:42:37 +0200
Message-Id: <20210929204236.4571-1-davide@baldo.me>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <s5hee99nfzg.wl-tiwai@suse.de>
References: <s5hee99nfzg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Davide Baldo <davide@baldo.me>
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

Thank your for your review Takashi, the entry is now correctly
ordered.
I've received some feedback from a user from bugzilla
https://bugzilla.kernel.org/show_bug.cgi?id=213953
To address his issues I've added a variant of the laptop and forced
DAC1 for both speakers.

In laptop 'HP Spectre x360 Convertible 15-eb1xxx/8811' both front and
rear speakers are silent, this patch fixes that by overriding the pin
layout and by initializing the amplifier which needs a GPIO pin to be
set to 1 then 0, similar to the existing HP Spectre x360 14 model.

In order to have volume control, both front and rear speakers were
forced to use the DAC1.

This patch also correctly map the mute LED but since there is no
microphone on/off switch exposed by the alsa subsystem it never turns
on by itself.

There are still known audio issues in this laptop: headset microphone
doesn't work, the button to mute/unmute microphone is not yet mapped,
the LED of the mute/unmute speakers doesn't seems to be exposed via
GPIO and never turns on.

Signed-off-by: Davide Baldo <davide@baldo.me>
---
 sound/pci/hda/patch_realtek.c | 48 ++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 70516527ebce..240f47a61a5a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6414,6 +6414,44 @@ static void alc_fixup_no_int_mic(struct hda_codec *codec,
 	}
 }
 
+/* GPIO1 = amplifier on/off
+ * GPIO3 = mic mute LED
+ */
+static void alc285_fixup_hp_spectre_x360_eb1(struct hda_codec *codec,
+					  const struct hda_fixup *fix, int action)
+{
+	static const hda_nid_t conn[] = { 0x02 };
+
+	struct alc_spec *spec = codec->spec;
+	static const struct hda_pintbl pincfgs[] = {
+		{ 0x14, 0x90170110 },  /* front/high speakers */
+		{ 0x17, 0x90170130 },  /* back/bass speakers */
+		{ }
+	};
+
+	//enable micmute led
+	alc_fixup_hp_gpio_led(codec, action, 0x00, 0x04);
+	spec->micmute_led_polarity = 1;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		/* needed for amp of back speakers */
+		spec->gpio_mask |= 0x01;
+		spec->gpio_dir |= 0x01;
+		snd_hda_apply_pincfgs(codec, pincfgs);
+		/* share DAC to have unified volume control */
+		snd_hda_override_conn_list(codec, 0x14, ARRAY_SIZE(conn), conn);
+		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		/* need to toggle GPIO to enable the amp of back speakers */
+		alc_update_gpio_data(codec, 0x01, true);
+		msleep(100);
+		alc_update_gpio_data(codec, 0x01, false);
+		break;
+	}
+}
+
 static void alc285_fixup_hp_spectre_x360(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
 {
@@ -6534,6 +6572,7 @@ enum {
 	ALC269_FIXUP_HP_DOCK_GPIO_MIC1_LED,
 	ALC280_FIXUP_HP_9480M,
 	ALC245_FIXUP_HP_X360_AMP,
+	ALC285_FIXUP_HP_SPECTRE_X360_EB1,
 	ALC288_FIXUP_DELL_HEADSET_MODE,
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC288_FIXUP_DELL_XPS_13,
@@ -6658,7 +6697,7 @@ enum {
 	ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP,
 	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
 	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
-	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST,
+	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8222,6 +8261,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_hp_spectre_x360,
 	},
+	[ALC285_FIXUP_HP_SPECTRE_X360_EB1] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_hp_spectre_x360_eb1
+	},
 	[ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc285_fixup_ideapad_s740_coef,
@@ -8442,6 +8485,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x8805, "HP ProBook 650 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
@@ -8858,6 +8903,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
 	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
 	{.id = ALC285_FIXUP_HP_SPECTRE_X360, .name = "alc285-hp-spectre-x360"},
+	{.id = ALC285_FIXUP_HP_SPECTRE_X360_EB1, .name = "alc285-hp-spectre-x360-eb1"},
 	{.id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name = "alc287-ideapad-bass-spk-amp"},
 	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
 	{.id = ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name = "alc255-acer-headphone-and-mic"},
-- 
2.32.0

