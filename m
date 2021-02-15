Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4831B5DF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 09:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C318186F;
	Mon, 15 Feb 2021 09:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C318186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613377645;
	bh=8jTgEPPurPyg2ENeMqFJX+Eo6VxWG3q7fYqRAssCWKs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zu9lGAJKwi6V1DRtyjkKB77zpLJuVQ2Luu3apHIpCRfPEkeL09HKrUHq0Yypo0WbG
	 q+oCguXs1l6SonnlFWISYLfCZdS0N2ufVYvBfDuVVZjcjhVpapL+3wm/ydJGpPsw5s
	 DXUvO1Cogcymj24qdSfMeqd/Y1qMPpcR57n/lyEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CFDFF800AE;
	Mon, 15 Feb 2021 09:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53370F80258; Mon, 15 Feb 2021 09:25:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40B92F800AE
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 09:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40B92F800AE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77966AD78
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 08:25:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Quirk for HP Spectre x360 14 amp setup
Date: Mon, 15 Feb 2021 09:25:40 +0100
Message-Id: <20210215082540.4520-1-tiwai@suse.de>
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

HP Spectre x360 14 model (PCI SSID 103c:87f7) seems requiring a unique
setup for its external amp: the GPIO0 needs to be toggled on and off
shortly at each device initialization via runtime PM.

This patch implements that workaround as well as the model option
string, so that users with other devices may try the same workaround
more easily.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210633
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 52907506e16e..1927605f0f7e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4291,6 +4291,28 @@ static void alc280_fixup_hp_gpio4(struct hda_codec *codec,
 	}
 }
 
+/* HP Spectre x360 14 model needs a unique workaround for enabling the amp;
+ * it needs to toggle the GPIO0 once on and off at each time (bko#210633)
+ */
+static void alc245_fixup_hp_x360_amp(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->gpio_mask |= 0x01;
+		spec->gpio_dir |= 0x01;
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		/* need to toggle GPIO to enable the amp */
+		alc_update_gpio_data(codec, 0x01, true);
+		msleep(100);
+		alc_update_gpio_data(codec, 0x01, false);
+		break;
+	}
+}
+
 static void alc_update_coef_led(struct hda_codec *codec,
 				struct alc_coef_led *led,
 				bool polarity, bool on)
@@ -6277,6 +6299,7 @@ enum {
 	ALC280_FIXUP_HP_DOCK_PINS,
 	ALC269_FIXUP_HP_DOCK_GPIO_MIC1_LED,
 	ALC280_FIXUP_HP_9480M,
+	ALC245_FIXUP_HP_X360_AMP,
 	ALC288_FIXUP_DELL_HEADSET_MODE,
 	ALC288_FIXUP_DELL1_MIC_NO_PRESENCE,
 	ALC288_FIXUP_DELL_XPS_13,
@@ -6982,6 +7005,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc280_fixup_hp_9480m,
 	},
+	[ALC245_FIXUP_HP_X360_AMP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_x360_amp,
+	},
 	[ALC288_FIXUP_DELL_HEADSET_MODE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_mode_dell_alc288,
@@ -7996,6 +8023,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f4, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
@@ -8368,6 +8396,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc298-samsung-headphone"},
 	{.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-headset"},
 	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
+	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.26.2

