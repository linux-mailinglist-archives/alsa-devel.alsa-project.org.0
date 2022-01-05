Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C548541A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 15:10:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECACF18FF;
	Wed,  5 Jan 2022 15:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECACF18FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641391842;
	bh=sdhNl1LNxWV8ILO2R5+vezTMKjG1F1K5FrMKyytX30o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fy2R7ULph6NDKYbKhjHAnZ5IuVB7anp9BtmjjY9QBD6ZrftOZWb5MLI6I7AVkhWvy
	 7gi0SYhIs9sWeErR/skGLTReLzfrKGnAkGOzRqiT4IYftE6Gcw8V9V1XFiFEUx74+d
	 EVwRyz3XR5IqOHFnwK/bxSDil25otGw+dopAr1fE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69242F8020C;
	Wed,  5 Jan 2022 15:09:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A2F9F801D8; Wed,  5 Jan 2022 15:09:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by alsa1.perex.cz (Postfix) with ESMTP id 69A6DF8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 15:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A6DF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.b="GRgN/ely"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=xiy2D
 fGe1Nt0R7TS0c0Zb4mwqiQ/2lfKjWEIJ40UTjE=; b=GRgN/elyG2u58YHaVlCEG
 ADTy9LHHecKLd9PWPjutd2NNyNsiFro0CVG2hFd8F2fgiRH3r69MURPvPS6DUz0q
 NYvoxGBP45ygXH0L0dU70tPgG1NhkRTSvjubUiT/6r6c9YqDz2TfvQvyHfxeUtWE
 B7jIj6bmXbOgI0NjySeGDo=
Received: from localhost.localdomain (unknown [183.194.153.98])
 by smtp13 (Coremail) with SMTP id EcCowACHp_+OptVheUmzGQ--.30771S2;
 Wed, 05 Jan 2022 22:09:23 +0800 (CST)
From: Baole Fang <fbl718@163.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 Kailang Yang <kailang@realtek.com>, Sami Loone <sami@loone.fi>,
 Elia Devito <eliadevito@gmail.com>,
 alsa-devel@alsa-project.org (moderated list:SOUND),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Legion Y9000X 2020
Date: Wed,  5 Jan 2022 22:08:54 +0800
Message-Id: <20220105140856.4855-1-fbl718@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowACHp_+OptVheUmzGQ--.30771S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1kZw4xZF1DXr1DCF1ftFb_yoW8Kw18pF
 WrAwn5Wr4kXFnayr43Ar4jgry8Gan3Cr48CFy5Aw1xZan3uFsrGrWFg3yavryDGrZ7GrZx
 Xr1kZas8WrW5Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UVq2iUUUUU=
X-Originating-IP: [183.194.153.98]
X-CM-SenderInfo: 5ieoliqy6rljoofrz/1tbiGBN-6Vv2gDMBYQAAsj
Cc: gregkh@linuxfoundation.org, Baole Fang <fbl718@163.com>
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

Legion Y9000X 2020 has a speaker, but the speaker doesn't work.
This can be fixed by applying alc285_fixup_ideapad_s740_coef
to fix the speaker's coefficients.
Besides, to support the transition between the speaker and the headphone,
alc287_fixup_legion_15imhg05_speakers needs to be run.

Signed-off-by: Baole Fang <fbl718@163.com>
---
 sound/pci/hda/patch_realtek.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 28255e752c4a..c7232f9be690 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6784,6 +6784,8 @@ enum {
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC233_FIXUP_NO_AUDIO_JACK,
 	ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME,
+	ALC285_FIXUP_LEGION_Y9000X_SPEAKERS,
+	ALC285_FIXUP_LEGION_Y9000X_AUTOMUTE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8380,6 +8382,18 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
 	},
+	[ALC285_FIXUP_LEGION_Y9000X_SPEAKERS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_ideapad_s740_coef,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_LEGION_Y9000X_AUTOMUTE,
+	},
+	[ALC285_FIXUP_LEGION_Y9000X_AUTOMUTE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_legion_15imhg05_speakers,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+	},
 	[ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS] = {
 		.type = HDA_FIXUP_VERBS,
 		//.v.verbs = legion_15imhg05_coefs,
@@ -8923,6 +8937,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station", ALC623_FIXUP_LENOVO_THINKSTATION_P340),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
+	SND_PCI_QUIRK(0x17aa, 0x3824, "Legion Y9000X 2020", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
-- 
2.25.1


