Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D1476174
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 20:18:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3709717E7;
	Wed, 15 Dec 2021 20:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3709717E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639595887;
	bh=dccCS3ZmW9cPRDIbajVCf4EIHU72W2MF/N6brvSSmwU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V/jydOmDEdCKUioeUMHu94EjZxqEhNZgG2a+qwtrFOZB18uIZ2caE7/W4ObPRAwtG
	 KFbapDi0THCGjeGmrv6voO5+v72zkJxNVNwOynwGS2nWPBbeVfN6h/id7Pkak0Fj87
	 D0OQazBvb8Mb7rqpHFpPqYNrde5IyezJp4urjlHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D336F801F5;
	Wed, 15 Dec 2021 20:16:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D0D9F8019D; Wed, 15 Dec 2021 20:16:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86B96F80157
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 20:16:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86B96F80157
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 8FB56C80092;
 Wed, 15 Dec 2021 20:16:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id 8w8K25uWeqvg; Wed, 15 Dec 2021 20:16:46 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box
 (host-212-18-30-247.customer.m-online.net [212.18.30.247])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 35413C8007F;
 Wed, 15 Dec 2021 20:16:46 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix quirk for Clevo NJ51CU
Date: Wed, 15 Dec 2021 20:16:46 +0100
Message-Id: <20211215191646.844644-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
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

The Clevo NJ51CU comes either with the ALC293 or the ALC256 codec, but uses
the 0x8686 subproduct id in both cases. The ALC256 codec needs a different
quirk for the headset microphone working and and edditional quirk for sound
working after suspend and resume.

When waking up from s3 suspend the Coef 0x10 is set to 0x0220 instead of
0x0020 on  the ALC256 codec. Setting the value manually makes the sound
work again. This patch does this automatically.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Fixes: b5acfe152abaa ("ALSA: hda/realtek: Add some Clove SSID in the ALC293(ALC1220)")
Cc: <stable@vger.kernel.org>
---
 sound/pci/hda/patch_realtek.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3599f4c85ebf..3394ef209772 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6546,6 +6546,23 @@ static void alc233_fixup_no_audio_jack(struct hda_codec *codec,
 	alc_process_coef_fw(codec, alc233_fixup_no_audio_jack_coefs);
 }
 
+static void alc256_fixup_mic_no_presence_and_resume(struct hda_codec *codec,
+						    const struct hda_fixup *fix,
+						    int action)
+{
+	/*
+	 * The Clevo NJ51CU comes either with the ALC293 or the ALC256 codec,
+	 * but uses the 0x8686 subproduct id in both cases. The ALC256 codec
+	 * needs an additional quirk for sound working after suspend and resume.
+	 */
+	if (codec->core.vendor_id == 0x10ec0256) {
+		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
+		snd_hda_codec_set_pincfg(codec, 0x19, 0x04a11120);
+	}
+	else
+		snd_hda_codec_set_pincfg(codec, 0x1a, 0x04a1113c);
+}
+
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -6766,6 +6783,7 @@ enum {
 	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC233_FIXUP_NO_AUDIO_JACK,
+	ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8490,6 +8508,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc233_fixup_no_audio_jack,
 	},
+	[ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_mic_no_presence_and_resume,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8829,7 +8853,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x8562, "Clevo NH[57][0-9]RZ[Q]", ALC269_FIXUP_DMIC),
 	SND_PCI_QUIRK(0x1558, 0x8668, "Clevo NP50B[BE]", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8680, "Clevo NJ50LU", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-	SND_PCI_QUIRK(0x1558, 0x8686, "Clevo NH50[CZ]U", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1558, 0x8686, "Clevo NH50[CZ]U", ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME),
 	SND_PCI_QUIRK(0x1558, 0x8a20, "Clevo NH55DCQ-Y", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8a51, "Clevo NH70RCQ-Y", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1558, 0x8d50, "Clevo NH55RCQ-M", ALC293_FIXUP_SYSTEM76_MIC_NO_PRESENCE),
-- 
2.25.1

