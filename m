Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241378A056
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:03:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3F3FBC0;
	Sun, 27 Aug 2023 19:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3F3FBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155829;
	bh=ij92w1e/ZrZmiRV5ppc599MVukP1qLW9GZHahBGwT7w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Xp/kXzS+JucVSk9d6fjJLssC77uW5XhD66yA8lsvHqSe3UFY54y+/GV1gbTOo9pWj
	 rto5IpuOmhUC/XynoCi1Nkp4mLl6Xok43zUcUgKsOsGKaUazORItu70RSHUIAhU4J8
	 O09Zpk1BkdeBVGg/D09LliC9qv5Lb+YgNvle7t/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49F6DF80564; Sun, 27 Aug 2023 19:01:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A2F1F80563;
	Sun, 27 Aug 2023 19:01:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBD37F80158; Thu, 24 Aug 2023 17:58:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 816F0F80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 17:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 816F0F80074
Received: from fabians-envy.localnet ([81.95.8.245]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MzyAy-1plCp73rPC-00wzta; Thu, 24 Aug 2023 17:57:51 +0200
From: Fabian Vogt <fabian@ritter-vogt.de>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 SungHwan Jung <onenowy@gmail.com>
Subject: 
 [PATCH] ALSA: hda/realtek: Add quirk for mute LEDs on HP ENVY x360 15-eu0xxx
Date: Thu, 24 Aug 2023 17:57:50 +0200
Message-ID: <4504056.LvFx2qVVIh@fabians-envy>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:F0a+FMLpOhqb6tBysEiC0NzEclV4tBUJelYJvukP8488vDO2TH5
 kXQUGCzfSRVJ6HjIVnxodwL4dbJA1Ll1J0d0hpZf9RkT7hKa/gM6btNTOfLNoInja5tkhOn
 ag8i/OxI9vE1f+10m8LEUBpqUBjxenTTmFA9kDg4nIAx5B1NRxTNFGlkXLBD+WqjX4qepNd
 6qQAmeluBcW2sH8D2GsDA==
UI-OutboundReport: notjunk:1;M01:P0:9KX+/T3gwUQ=;QLU3XaUU4ZunHc20nIkCauAsB0d
 QzsbwTNEGhZmqvqdvevZSkOlYrjR+hrN5/YgqsHxEaE8jsHgXGKo10unnqVjP8UgV0t5d1cxF
 J507oJBs3VPrWvZXUdBJSSd6lDwFU1pNLUuQkAzzOG2CcWUhExt8jq2FTDBh/j4divoNn0i9/
 ekbRjQ68ZeM1w5Ffob8W3TP5Vf22FgWxS+9tHndmfT1IIDZTaYCMYMwKhd5zvohrJ5VEZdM0c
 in9dhKPccHq2vlBqMI5HOc8QqTW0pqmvMrJNQAgQMHCeu5nw7q0jsDmw5d2JRkxI2uuU3c+XV
 c6p/81aSzxbzdo5RnzAhzH+zm91LXtWlFM6xZw7TJoBDt/Raz5ifVb+YTvonvpRyBvc5Qelx2
 H38IT5Y8rrpNeW8/8PQ18BlH38GhUuW+YfmJH2MrYWnThUuIq/+ZA1KpsDyKKbK+yRLiuAQhk
 2QMVipusdWgMBShEs8kC9FXdzcC4MV7PVV4188NjoT8ehshkVzSvh+OMADSh++OOUMN1OdVM/
 vkxhmZ+cSZrEbEs4v5GoYikRK2b8/ueIXBEwe/20E8CIHeuzU3yX5akO6O6Ea+Vnw8S3m2nUh
 Q7L6JQ8aP681FYW9Qv5eUQcP5lYq3ukQApNeK/e8cTbm/fQLs01NB1jr2lMmx8uWed2OdXjx/
 hWRG100cT2OQfi7NG3ne+tgMq+7iXp00rvNd/yT7jDbXXYgM6RNcEITkTicPTNXILUlkXQ1Ee
 71cgefVDu5+at8FaT9FJQlKJC6bh/fIpb8i73T2Z1VCIadjy7MB7ImpDsWpQgxYoNHLMNiiE1
 v1+WIf0wO0nZrFAMqpCuIX92NFaSZE5jdgUSakddWmScKMEOSET8rjJHYM5MWoX9DMAYi5mcN
 4Oa/6b5S/1Rp24g==
X-MailFrom: fabian@ritter-vogt.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H3RZAIXAPL5JQDE7XZ5P6XDVCTRECXW3
X-Message-ID-Hash: H3RZAIXAPL5JQDE7XZ5P6XDVCTRECXW3
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:01:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3RZAIXAPL5JQDE7XZ5P6XDVCTRECXW3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The LED for the mic mute button is controlled by GPIO2.
The mute button LED is slightly more complex, it's controlled by two bits
in coeff 0x0b. Add a fixup for the mute LED and chain to an existing fixup
for the mic mute LED.

Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
Applies on top of 89bf6209cad6.

I see that SungHwan Jung (CC'd) recently submitted the same fixup for
a rather similar but different model as
"ALSA: hda/realtek: Add quirk for HP Victus 16-d1xxx to enable mute LED"
Does your HP Victus also need the ALC245_FIXUP_HP_GPIO_LED? Then we could
combine the quirks.

 sound/pci/hda/patch_realtek.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index dc7b7a407638..cac207d7c0b9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4639,6 +4639,24 @@ static void alc236_fixup_hp_mute_led_coefbit2(struct hda_codec *codec,
 	}
 }
 
+/* The mute LED is controlled by two bits in coef 0x0b:
+ * To turn on, set bit 3 but clear bit 2.
+ */
+static void alc245_fixup_hp_x360_mute_led(struct hda_codec *codec,
+				      const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->mute_led_polarity = 0;
+		spec->mute_led_coef.idx = 0x0b;
+		spec->mute_led_coef.mask = 0xc;
+		spec->mute_led_coef.on = 0x8;
+		spec->mute_led_coef.off = 0x4;
+		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
+	}
+}
+
 /* turn on/off mic-mute LED per capture hook by coef bit */
 static int coef_micmute_led_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)
@@ -7231,6 +7249,7 @@ enum {
 	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
+	ALC245_FIXUP_HP_X360_MUTE_LED,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9309,6 +9328,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
 	},
+	[ALC245_FIXUP_HP_X360_MUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_x360_mute_led,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_HP_GPIO_LED
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9551,6 +9576,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x887a, "HP Laptop 15s-eq2xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x888a, "HP ENVY x360 Convertible 15-eu0xxx", ALC245_FIXUP_HP_X360_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
-- 
2.41.0




