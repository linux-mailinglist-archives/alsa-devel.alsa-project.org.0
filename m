Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E420358FBB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 00:18:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEEA71661;
	Fri,  9 Apr 2021 00:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEEA71661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617920335;
	bh=E3i1GihBIMsBFxEO9LyiNF9OSJf7pkh1dOYNIygYNnc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YG51yYzVKehgh9lWO1yxsFVl6BlN5Pd/i+wuCQNsg1bJd2h4eawz+mpRptmTD+Fb+
	 SDyub3peLfvIlhq0R91XoHrl/0C7AMzyWnZu7rzufOG1NQQxvz9rsYkuGwaYgm+Eb9
	 SZIhS/0yPuRxjTo0JvOdPpQcudwPw4KuE525C35s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E6DF80246;
	Fri,  9 Apr 2021 00:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ACFFF8020B; Fri,  9 Apr 2021 00:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30A0AF800BD
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 00:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30A0AF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org
 header.b="GLvUJboJ"; 
 dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org
 header.b="0pI/lET+"
From: Jonas Witschel <diabonas@archlinux.org>
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
 s=dkim-ed25519; t=1617920234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gHaWLA0gbX//IUycmmw3IgzpjVp57mKhAogscy1vy+U=;
 b=GLvUJboJG38xJNSdeNIVgsMhuMAkyvsFQTFzMWyDbGX+RNeIkWrjv/egM2RGQmW+CzEp4G
 hcGxPcFvrlHDH9Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
 s=dkim-rsa; t=1617920234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gHaWLA0gbX//IUycmmw3IgzpjVp57mKhAogscy1vy+U=;
 b=0pI/lET+t4RecRSRAxt/isUFWdAtEsyWwEYcLKu08p/6yJvuHFQDrDLz2D5SIMHgZTRLXA
 1DhTboJsKHSj5Br6XvF/aTaFCaeiLphlqzKa0+K5BQpH2EPhx5+IUK4Q5HBemCgeoSYLOn
 wNkoek58PUMsU1GPyEMHVwH0NRLzCRq+A4rxS5ilIWwLA8uf5xd6j7Q3Yf7TSNUiFoXXlo
 /CO6BUW2rVrPuo/n6uvdPPqD+EDkrsSylpvzg+7ZXFNkWgrxM0rOWPDtu7v6iSGFfyYjL+
 mn+dleky9hzmlvObrdEkDrcuoW1PGBbMqgOjwjOveK7aRqCHYhIrdaRRf/mMU8rq8zPQSe
 pOb/lk/mDESnruQ8TFj7jHm2+kTHSOw12q9g5eCxN35uo6VgmK9roBEZ7WGMGVvHcsvm51
 ZufAiJTYmVBkyhYbx2tFgcCWX/hI7hxbFbG1s5lDsy05TuhBAr2ptUumt6k71Wv2zNqIYV
 UDc+wVzbScFTJyQLlCg4jspMUQgPcYtPpZCpbfPiPR9Ji8/KNRGl66PRrSeYzeQIEOZCT6
 CJqSVRf1wFHWnnPttCGWsZ7oosNBCr+BJo0I7sMQLxEfAhIEAgiZZtJpjf31Mgo7+qSbTe
 he7CPl2xAlSlL5QWboMp641XML+gwglm8pEZgpRAZK7h2DiTtbZU4=
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 445 G7
Date: Fri,  9 Apr 2021 00:16:29 +0200
Message-Id: <20210408221629.22230-1-diabonas@archlinux.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.archlinux.org;
 auth=pass smtp.auth=diabonas smtp.mailfrom=diabonas@archlinux.org
Cc: Jonas Witschel <diabonas@archlinux.org>
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

The HP ProBook 445 G7 (17T32ES) uses ALC236. Like ALC236_FIXUP_HP_GPIO_LED,
COEF index 0x34 bit 5 is used to control the playback mute LED, but the
microphone mute LED is controlled using pin VREF instead of a COEF index.

AlsaInfo: https://alsa-project.org/db/?f=0d3f4d1af39cc359f9fea9b550727ee87e5cf45a
Signed-off-by: Jonas Witschel <diabonas@archlinux.org>
---
 sound/pci/hda/patch_realtek.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 00a15e7cfdb9..c4372d143051 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4445,6 +4445,25 @@ static void alc236_fixup_hp_mute_led(struct hda_codec *codec,
 	alc236_fixup_hp_coef_micmute_led(codec, fix, action);
 }
 
+static void alc236_fixup_hp_micmute_led_vref(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->cap_mute_led_nid = 0x1a;
+		snd_hda_gen_add_micmute_led_cdev(codec, vref_micmute_led_set);
+		codec->power_filter = led_power_filter;
+	}
+}
+
+static void alc236_fixup_hp_mute_led_micmute_vref(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	alc236_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc236_fixup_hp_micmute_led_vref(codec, fix, action);
+}
+
 #if IS_REACHABLE(CONFIG_INPUT)
 static void gpio2_mic_hotkey_event(struct hda_codec *codec,
 				   struct hda_jack_callback *event)
@@ -6407,6 +6426,7 @@ enum {
 	ALC285_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
+	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
 	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
@@ -7653,6 +7673,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led,
 	},
+	[ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
+	},
 	[ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -8070,6 +8094,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8724, "HP EliteBook 850 G7", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8729, "HP", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8730, "HP ProBook 445 G7", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8736, "HP", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8760, "HP", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
-- 
2.31.1

