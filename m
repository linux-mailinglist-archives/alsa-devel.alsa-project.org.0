Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1696452A7
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 04:47:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65AAB17ED;
	Wed,  7 Dec 2022 04:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65AAB17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670384851;
	bh=oEEcSsLXBMalNMOMBVVh1LlRpBTeMcF4TkaEJmroifQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mXgrT4ppcQt/ta4hvrZcDiblRFWL3zeGZENws9LdAnwnEcT7X38YCJcM6Zrqs9dQO
	 HoTAu80iL6ouMJRuY6SL0qylzE4cUUNwKXXr6nqJhaAlbhSlROaRK+W6NVwG5/cPBf
	 /myN5/XVcKg3YFlgu7ovY4PVGlLZS4uGT+2pT2YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E2AF80121;
	Wed,  7 Dec 2022 04:46:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 247FEF802BE; Wed,  7 Dec 2022 04:46:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.edward-p.xyz (mail.edward-p.xyz [103.150.8.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45FC3F80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 04:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45FC3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=edward-p.xyz header.i=@edward-p.xyz
 header.b="R+sSwSq9"
DKIM-Signature: a=rsa-sha256; bh=T+en6e3AXE3m/+a/1SsKJ6NeYBJ+M/f4BlVdIYx79zE=; 
 c=relaxed/relaxed; d=edward-p.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:Message-Id:Message-Id:References:Autocrypt:Openpgp;
 i=@edward-p.xyz; s=default; t=1670384779; v=1; x=1670816779;
 b=R+sSwSq9Ei5s1NQVMDHSx3aludIKBbhS42QQUCy3sHB2a7dejw7fb81oiTighw7jXvO/B5dF
 UgjxalD8kkOVNaneYlXPblY3m3By5giGS6kt9OKsE/lSaocdGLtwSfhG/Pu0rWPUuxFR4LVSUPF
 5u6CvbTP6WG3iCmAtcAHKNgHqG2x+5vgslLZ+NXMqdRgrR5I9RDwFpeKw0RVOu/a2CH45mDrEX0
 drvom6luWcHbs4JgL1eF82TcR826TAL+OToZV8hVxfZsWVT7TCFhdlfj09okx7K8P3/Map0RqUk
 sdgmx6CsQMnaoiE/osox9oKehMZSO0Jl0Sig93UCMbD6A==
Received: by mail.edward-p.xyz (envelope-sender <edward@edward-p.xyz>) with
 ESMTPS id 22cd2ccf; Wed, 07 Dec 2022 11:46:19 +0800
From: edward-p <edward@edward-p.xyz>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo TianYi510Pro-14IOB
Date: Wed,  7 Dec 2022 11:45:35 +0800
Message-Id: <20221207034535.2150-1-edward@edward-p.xyz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, edward-p <edward@edward-p.xyz>
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

