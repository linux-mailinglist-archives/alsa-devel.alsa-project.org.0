Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B8645A3A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 13:55:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A123B1765;
	Wed,  7 Dec 2022 13:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A123B1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670417706;
	bh=oEEcSsLXBMalNMOMBVVh1LlRpBTeMcF4TkaEJmroifQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TgvqZmJWLWSGk/tT9UFLHp6xXLgySWddhTOeoV41KUZ7azMmpzaRLnfIy83q/vHwr
	 Z/RwcA0dDfnJRVfA9mv4WhqlgyQdY++KYf7GKRKqnaRpj+xx8hyuV+Ml/ohtoIGy3w
	 LPOBUWyQzahB9jVmD1QcekQwCczoM2r1mcPZzgOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C330F80301;
	Wed,  7 Dec 2022 13:54:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91A95F80246; Tue,  6 Dec 2022 19:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail.edward-p.xyz (unknown [IPv6:2403:ac80:cc:7::13f:adc5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09392F8014E
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 19:06:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09392F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=edward-p.xyz header.i=@edward-p.xyz
 header.b="ndbeQvwn"
DKIM-Signature: a=rsa-sha256; bh=T+en6e3AXE3m/+a/1SsKJ6NeYBJ+M/f4BlVdIYx79zE=; 
 c=relaxed/relaxed; d=edward-p.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@edward-p.xyz; s=default; t=1670349916; v=1; x=1670781916;
 b=ndbeQvwnsDAhdzCWhwNUER4mARyMBxiCwfnnRQprNcrBoyovwnQVkJnhne5rucfE7tUosjr/
 7YWvjF0fBzxtlk3YK9+wNjb3SvjRjDk+7h+yc8VecceIWYT1JO9jLHOQFrgNulhyyrg6BGBCQbI
 T8dHv5S98lGnlAO0hhdkCaYjcjt8QPB9sNO9sbC7wXZCGp19AhGgFh+Ga8nThZhoiGnHz8ua7ne
 eACrA+Enst4+49GCRTaylQT5x31Zo/olmZVXgnEVEwRloenEVIFSHUnDFcVgRvC6rRLAAcgaQVb
 mhO/eeNidPSDXle1XfhzSlxB1FtP/lr+zVcQbHezK0zQA==
Received: by mail.edward-p.xyz (envelope-sender <edward@edward-p.xyz>) with
 ESMTPS id 62a3ecde; Wed, 07 Dec 2022 02:05:16 +0800
From: edward-p <edward@edward-p.xyz>
To: 
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo TianYi510Pro-14IOB
Date: Wed,  7 Dec 2022 02:04:58 +0800
Message-Id: <20221206180459.44260-1-edward@edward-p.xyz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Dec 2022 13:54:08 +0100
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Kailang Yang <kailang@realtek.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Meng Tang <tangmeng@uniontech.com>, Philipp Jungkamp <p.jungkamp@gmx.net>,
 Takashi Iwai <tiwai@suse.com>, edward-p <edward@edward-p.xyz>,
 alsa-devel@alsa-project.org, Tim Crawford <tcrawford@system76.com>,
 linux-kernel@vger.kernel.org
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

Lenovo TianYi510Pro-14IOB (17aa:3742)
require quirk for enabling headset-mic

Signed-off-by: edward-p <edward@edward-p.xyz>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216756
---
 sound/pci/hda/patch_realtek.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index e5c036385666..a2e1bdc06468 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10960,6 +10960,17 @@ static void alc897_fixup_lenovo_headset_mic(struct hda_codec *codec,
 	}
 }
 
+static void alc897_fixup_lenovo_headset_mode(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
+		spec->gen.hp_automute_hook = alc897_hp_automute_hook;
+	}
+}
+
 static const struct coef_fw alc668_coefs[] = {
 	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
 	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
@@ -11043,6 +11054,8 @@ enum {
 	ALC897_FIXUP_LENOVO_HEADSET_MIC,
 	ALC897_FIXUP_HEADSET_MIC_PIN,
 	ALC897_FIXUP_HP_HSMIC_VERB,
+	ALC897_FIXUP_LENOVO_HEADSET_MODE,
+	ALC897_FIXUP_HEADSET_MIC_PIN2,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -11469,6 +11482,19 @@ static const struct hda_fixup alc662_fixups[] = {
 			{ }
 		},
 	},
+	[ALC897_FIXUP_LENOVO_HEADSET_MODE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc897_fixup_lenovo_headset_mode,
+	},
+	[ALC897_FIXUP_HEADSET_MIC_PIN2] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1a, 0x01a11140 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC897_FIXUP_LENOVO_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc662_fixup_tbl[] = {
@@ -11521,6 +11547,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x32cb, "Lenovo ThinkCentre M70", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32cf, "Lenovo ThinkCentre M950", ALC897_FIXUP_HEADSET_MIC_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x32f7, "Lenovo ThinkCentre M90", ALC897_FIXUP_HEADSET_MIC_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x3742, "Lenovo TianYi510Pro-14IOB", ALC897_FIXUP_HEADSET_MIC_PIN2),
 	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo Ideapad Y550P", ALC662_FIXUP_IDEAPAD),
 	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Ideapad Y550", ALC662_FIXUP_IDEAPAD),
 	SND_PCI_QUIRK(0x1849, 0x5892, "ASRock B150M", ALC892_FIXUP_ASROCK_MOBO),
-- 
2.38.1

