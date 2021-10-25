Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F95439CA6
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:02:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24F3516E8;
	Mon, 25 Oct 2021 19:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24F3516E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635181351;
	bh=xBBTx96qCCHhlma3m+5t3TD3F+1EFY7Yy2OERqRinJQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQ0VuvqIdwUYH3rCopqHENC4VxXvmVa29bcQpCDSUvFwu/2nDavbIW8d28NBOWNwJ
	 CDmA0lAAj8A2zLtAUAxz73+ypKFfQ0nKWOV7gAKEkr+6IV3R/+zjP/F2xhvXadVrO6
	 7g+JgXxCrj1HAxcBU6mxheocJdPmR4zUCK7IzasY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AC8F804F2;
	Mon, 25 Oct 2021 19:00:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27BEFF804F3; Mon, 25 Oct 2021 19:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F6DDF804E7
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 19:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F6DDF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dvVfmaW6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F7D960F9B;
 Mon, 25 Oct 2021 17:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635181231;
 bh=xBBTx96qCCHhlma3m+5t3TD3F+1EFY7Yy2OERqRinJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dvVfmaW614GqLYnTcSP8sQhQjBLoGhKWxyQYrqSObYq+9N7w/GMROokcMU+h2sGGW
 WwTUb/xxKa5bPy4OIHTT7QACXdD65LdMkxVuQNwKSHeuJyZVBpAd5mTSU352AE5S/5
 IiwDvPSMKjbENHWoVgSVbSdX0Z1lBK2BLFfKzcpeqITvWfEbMrgw7lnBl1bNRP/Q2x
 lUnyoUff6m+KdZt/zBB1Xepo9IJ9anGc9pZRyAFv9ifcJ9slIdeNkaW88htX7MTvRA
 1j4qi8YFkQBU9YqSUJjDO6MWE+bjXQ8cpzFLmvZvkP+/bOydeYNtSLxCeQsbpj0x6B
 53jv10Fy7Bi3A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/13] ALSA: hda/realtek: Fixes HP Spectre x360
 15-eb1xxx speakers
Date: Mon, 25 Oct 2021 13:00:12 -0400
Message-Id: <20211025170023.1394358-3-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025170023.1394358-1-sashal@kernel.org>
References: <20211025170023.1394358-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, chris.chiu@canonical.com,
 alsa-devel@alsa-project.org, kailang@realtek.com,
 Davide Baldo <davide@baldo.me>, jeremy.szu@canonical.com,
 Takashi Iwai <tiwai@suse.de>, eliadevito@gmail.com, tiwai@suse.com,
 wse@tuxedocomputers.com, hui.wang@canonical.com, pshou@realtek.com,
 sami@loone.fi, cam@neo-zeon.de
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

From: Davide Baldo <davide@baldo.me>

[ Upstream commit d94befbb5ae379f6dfd4fa6d460eacc09fa7b9c3 ]

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

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213953
Signed-off-by: Davide Baldo <davide@baldo.me>
Link: https://lore.kernel.org/r/20211015072121.5287-1-davide@baldo.me
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c36239cea474..52f00f56291f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6351,6 +6351,44 @@ static void alc_fixup_no_int_mic(struct hda_codec *codec,
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
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->micmute_led_polarity = 1;
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
@@ -6503,6 +6541,7 @@ enum {
 	ALC269_FIXUP_HP_DOCK_GPIO_MIC1_LED,
 	ALC280_FIXUP_HP_9480M,
 	ALC245_FIXUP_HP_X360_AMP,
+	ALC285_FIXUP_HP_SPECTRE_X360_EB1,
 	ALC288_FIXUP_DELL_HEADSET_MODE,
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC288_FIXUP_DELL_XPS_13,
@@ -8189,6 +8228,10 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -8523,6 +8566,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x8805, "HP ProBook 650 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
@@ -8942,6 +8987,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
 	{.id = ALC295_FIXUP_HP_OMEN, .name = "alc295-hp-omen"},
 	{.id = ALC285_FIXUP_HP_SPECTRE_X360, .name = "alc285-hp-spectre-x360"},
+	{.id = ALC285_FIXUP_HP_SPECTRE_X360_EB1, .name = "alc285-hp-spectre-x360-eb1"},
 	{.id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name = "alc287-ideapad-bass-spk-amp"},
 	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
 	{.id = ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name = "alc255-acer-headphone-and-mic"},
-- 
2.33.0

