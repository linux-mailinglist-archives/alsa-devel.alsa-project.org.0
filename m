Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0232F87E17C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 02:13:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94A3223E1;
	Mon, 18 Mar 2024 02:12:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94A3223E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710724382;
	bh=R9nk88XFEQV12LnozYWGws5BK0Mfq9XjE0WavYqZF94=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VHUqxk2YbQDyWqR46QC5n2rjm4CY47CPOjtbgVwRHqEx3haCva6cb0SyhahWMtVZS
	 Hu6UezS8rSod8wZdFY90+xtSnsFtKfAAwbbRJYsMJHRYtq78/ERs2nJ8QtSpS0uNc1
	 a9seHAMjeBNNM2UuLRrmIi+7z9RgcFodwfYBtjAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71EB6F80088; Mon, 18 Mar 2024 02:12:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D611CF8059F;
	Mon, 18 Mar 2024 02:12:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B15FDF804E7; Mon, 18 Mar 2024 02:12:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E0F5F8010B
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 02:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E0F5F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=L29zuMuw
Received: from hwang4-ThinkPad-T14s-Gen-2a.conference (2.general.hwang4.uk.vpn
 [10.172.195.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id EAF0140F03;
	Mon, 18 Mar 2024 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1710724335;
	bh=tcRRoJY6jbwxSg5p4b6l4WMGxKo6TMfhtjENcjfE7v8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=L29zuMuwNIbCCi1e41E8DGqfJQ8Um06d1GIfdUUR+Yj3OjQdhOv8uNYlRRyXlXX+4
	 /8f1RCaEHFeGr7Cp0mwnA8YP4UcYAWbrIyIDrW9cn6Ct6S+Vic2X+CIZ65mHLC9T26
	 ztvbQ1hG+I2djIcxVuewEebMUAE1Cwj8KLAho/S3hGzX68o438o3WVe88xxWmJq3ls
	 W/hXu1L8g5iwM8EZG3jT+LXJ9OY+e5XndkoPwljEoZEF5QrDJwquWLAhe4WtGXi4B1
	 clnFlGhF8y6/OgOGn5zs1Fa13CnJ6ud5DipX6Du55PQC40On2jv7wKXnan+g8rr2zz
	 JpoBWqaDi+xcw==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/realtek: fix the hp playback volume issue for LG
 machines
Date: Mon, 18 Mar 2024 09:11:28 +0800
Message-Id: <20240318011128.156023-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IPU4TONQM7BMB2QZMZVAT4GM2FC7SIIM
X-Message-ID-Hash: IPU4TONQM7BMB2QZMZVAT4GM2FC7SIIM
X-MailFrom: hui.wang@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPU4TONQM7BMB2QZMZVAT4GM2FC7SIIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Recently we tested the headphone playback on 2 LG machines, if we set
the volume to the max value or near to the max value, the sound is too
loud, it could even bring harm to listeners.

A workaround is to decrease the max volume to a reasonable value for
the headphone's amplifier, then the users couldn't set the volume
bigger than that value from the userspace.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e904f62e1952..d463d416fc23 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6964,6 +6964,25 @@ static void alc256_fixup_mic_no_presence_and_resume(struct hda_codec *codec,
 	}
 }
 
+static void alc256_decrease_headphone_amp_val(struct hda_codec *codec,
+					      const struct hda_fixup *fix, int action)
+{
+	u32 caps;
+	u8 nsteps, offs;
+
+	if (action != HDA_FIXUP_ACT_PRE_PROBE)
+		return;
+
+	caps = query_amp_caps(codec, 0x3, HDA_OUTPUT);
+	nsteps = ((caps & AC_AMPCAP_NUM_STEPS) >> AC_AMPCAP_NUM_STEPS_SHIFT) - 10;
+	offs = ((caps & AC_AMPCAP_OFFSET) >> AC_AMPCAP_OFFSET_SHIFT) - 10;
+	caps &= ~AC_AMPCAP_NUM_STEPS & ~AC_AMPCAP_OFFSET;
+	caps |= (nsteps << AC_AMPCAP_NUM_STEPS_SHIFT) | (offs << AC_AMPCAP_OFFSET_SHIFT);
+
+	if (snd_hda_override_amp_caps(codec, 0x3, HDA_OUTPUT, caps))
+		codec_warn(codec, "failed to override amp caps for NID 0x3\n");
+}
+
 static void alc_fixup_dell4_mic_no_presence_quiet(struct hda_codec *codec,
 						  const struct hda_fixup *fix,
 						  int action)
@@ -7382,6 +7401,7 @@ enum {
 	ALC294_FIXUP_CS35L41_I2C_2,
 	ALC245_FIXUP_CS35L56_SPI_4_HP_GPIO_LED,
 	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
+	ALC256_FIXUP_HEADPHONE_AMP_VOL,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9581,6 +9601,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc256_fixup_acer_sfg16_micmute_led,
 	},
+	[ALC256_FIXUP_HEADPHONE_AMP_VOL] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_decrease_headphone_amp_val,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -10319,6 +10343,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x9e56, "Lenovo ZhaoYang CF4620Z", ALC286_FIXUP_SONY_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1849, 0x1233, "ASRock NUC Box 1100", ALC233_FIXUP_NO_AUDIO_JACK),
 	SND_PCI_QUIRK(0x1849, 0xa233, "Positivo Master C6300", ALC269_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1854, 0x0440, "LG CQ6", ALC256_FIXUP_HEADPHONE_AMP_VOL),
+	SND_PCI_QUIRK(0x1854, 0x0441, "LG CQ6 AIO", ALC256_FIXUP_HEADPHONE_AMP_VOL),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x19e5, 0x320f, "Huawei WRT-WX9 ", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1b35, 0x1235, "CZC B20", ALC269_FIXUP_CZC_B20),
-- 
2.34.1

