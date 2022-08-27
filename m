Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E69335A50F5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 18:06:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 920401632;
	Mon, 29 Aug 2022 18:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 920401632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661789204;
	bh=UZYffjpjeerOon/WNBiec/Og9NDxAYb1jgvKPxf3Evc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oK251TXysoeunA5Sq1sfSDmrfnScQqi5+dZbQDJTING+FtH6sZcGYSRqCbtWSc+2q
	 RmgcuK4acEBPJDXH3Vm7QjWGOy36DF9XawAZP5uM9FCkH7aX6v++zxBQZnRkujAfPF
	 IoDjXQy/jH1Xl4ub1IuSjuCTC92Zq0S9WRpto2Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03262F80217;
	Mon, 29 Aug 2022 18:05:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADE3DF80132; Sat, 27 Aug 2022 22:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17D79F8012F
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 22:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D79F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e1d5J9gQ"
Received: by mail-lf1-x130.google.com with SMTP id bt10so6248764lfb.1
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JNKg6FU0SbOnCwksdnMTkZZHM84PvxOtn8A1m5Qs5ls=;
 b=e1d5J9gQQy91ts1nhfSG+NXqdygK5x1n3kbRZmKS2syKB1ZcuSsuow18mGWX64+wx7
 vFm1zuXy+S+jsZvCsbv6LikYsII+IHQY/Xrym2/Y7GwJlqqJPANv4kB2Kd4ZjtE1Zjj1
 u6Ei6qRHCIfu/3tA/UkHAX71M6KnJYu4k5zfnDBgp7qu/d6rUmfJfpJEGcenwjx3i93X
 9+o0TFcHm2D1xT2GglB8beyJR+UvkssjK8G1k2C6K4/JiFS6aBEdKrqdTtSlcgP+mdSJ
 ghMiCgXr4uB0nReon3/KEw4AOY3uh3BJaJ1nrLXzYdAEPYn0rAWsusr55BWzKjCbbWqe
 XVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JNKg6FU0SbOnCwksdnMTkZZHM84PvxOtn8A1m5Qs5ls=;
 b=4oUl6WjKyTJE8WTNImy8UmrbaH1YAnusI+EwRMVffAhj/FL/+kVJa5Z+/ZxC8kVaM6
 4Cg7EzYEVb9/+hYAJvnpaU+y6n5JKymppPv9sCcZwkjXCR1lyJkQCHGyEzumtjKkIwO0
 5whMahrJ0eAJdJAJRZXYjLi1+LshGXtg//bYT0uv89I5DC2fPK5aNQjcSfhrza3YvH9q
 31kLnceUO0bXCVzaShN9CroCrKQ9hz7Uhybwvsk60O99PykFX3O651rmDCYS8zNgbfY9
 m92ofiB5YvGIBg3YxKxbKH0LIVzS4e74/t4U+hZBm+PUjU/z1AYDeQH8qkFty99d6ydH
 PvoA==
X-Gm-Message-State: ACgBeo0nEQuSOYqRy8Z1hMexP/Wf3QXA9Pn/CaCS3qUeMekX9gMAvnQi
 9+nlLJggx44EpzxTNET4csO1uM6kDwI=
X-Google-Smtp-Source: AA6agR4RUeWtJNauairOW7FZiEDNRZiSL1LMLb9GQZbXmW9brI5H4P67IKEpJu6FOvFRI48eYuI1ZA==
X-Received: by 2002:a05:6512:c11:b0:492:f0b1:1628 with SMTP id
 z17-20020a0565120c1100b00492f0b11628mr3920302lfu.682.1661632446432; 
 Sat, 27 Aug 2022 13:34:06 -0700 (PDT)
Received: from Arch-Penik.domek (89-74-110-199.dynamic.chello.pl.
 [89.74.110.199]) by smtp.gmail.com with ESMTPSA id
 f29-20020a19381d000000b0048af3154456sm753775lfa.146.2022.08.27.13.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 13:34:05 -0700 (PDT)
From: =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add speaker AMP init for Samsung laptops
 with ALC298
Date: Sat, 27 Aug 2022 22:33:28 +0200
Message-Id: <20220827203328.30363-1-kasper93@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Aug 2022 18:05:43 +0200
Cc: =?UTF-8?q?Kacper=20Michaj=C5=82ow?= <kasper93@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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

Magic initialization sequence was extracted from Windows driver and
cleaned up manually.

Fixes internal speakers output.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=207423
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1851518
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Kacper Michajłow <kasper93@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 63 +++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 47e72cf76608..38930cf5aace 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4700,6 +4700,48 @@ static void alc236_fixup_hp_mute_led_micmute_vref(struct hda_codec *codec,
 	alc236_fixup_hp_micmute_led_vref(codec, fix, action);
 }
 
+static inline void alc298_samsung_write_coef_pack(struct hda_codec *codec,
+						  const unsigned short coefs[2])
+{
+	alc_write_coef_idx(codec, 0x23, coefs[0]);
+	alc_write_coef_idx(codec, 0x25, coefs[1]);
+	alc_write_coef_idx(codec, 0x26, 0xb011);
+}
+
+struct alc298_samsung_amp_desc {
+	unsigned char nid;
+	unsigned short init_seq[2][2];
+};
+
+static void alc298_fixup_samsung_amp(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	int i, j;
+	static const unsigned short init_seq[][2] = {
+		{ 0x19, 0x00 }, { 0x20, 0xc0 }, { 0x22, 0x44 }, { 0x23, 0x08 },
+		{ 0x24, 0x85 }, { 0x25, 0x41 }, { 0x35, 0x40 }, { 0x36, 0x01 },
+		{ 0x38, 0x81 }, { 0x3a, 0x03 }, { 0x3b, 0x81 }, { 0x40, 0x3e },
+		{ 0x41, 0x07 }, { 0x400, 0x1 }
+	};
+	static const struct alc298_samsung_amp_desc amps[] = {
+		{ 0x3a, { { 0x18, 0x1 }, { 0x26, 0x0 } } },
+		{ 0x39, { { 0x18, 0x2 }, { 0x26, 0x1 } } }
+	};
+
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(amps); i++) {
+		alc_write_coef_idx(codec, 0x22, amps[i].nid);
+
+		for (j = 0; j < ARRAY_SIZE(amps[i].init_seq); j++)
+			alc298_samsung_write_coef_pack(codec, amps[i].init_seq[j]);
+
+		for (j = 0; j < ARRAY_SIZE(init_seq); j++)
+			alc298_samsung_write_coef_pack(codec, init_seq[j]);
+	}
+}
+
 #if IS_REACHABLE(CONFIG_INPUT)
 static void gpio2_mic_hotkey_event(struct hda_codec *codec,
 				   struct hda_jack_callback *event)
@@ -7030,6 +7072,7 @@ enum {
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
+	ALC298_FIXUP_SAMSUNG_AMP,
 	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
 	ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
@@ -8396,6 +8439,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc236_fixup_hp_mute_led_micmute_vref,
 	},
+	[ALC298_FIXUP_SAMSUNG_AMP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc298_fixup_samsung_amp,
+		.chained = true,
+		.chain_id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET
+	},
 	[ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -9342,13 +9391,13 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x1254, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_HEADSET_MODE),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
-	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
-	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
-	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Flex Book (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
-	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NP930XCJ-K01US)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc189, "Samsung Galaxy Flex Book (NT950QCG-X716)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc18a, "Samsung Galaxy Book Ion (NP930XCJ-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
-	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
-	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_AMP),
+	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc832, "Samsung Galaxy Book Flex Alpha (NP730QCJ)", ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
@@ -9716,7 +9765,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC299_FIXUP_PREDATOR_SPK, .name = "predator-spk"},
 	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
-	{.id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc298-samsung-headphone"},
+	{.id = ALC298_FIXUP_SAMSUNG_AMP, .name = "alc298-samsung-amp"},
 	{.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-samsung-headphone"},
 	{.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-headset"},
 	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
-- 
2.37.2

