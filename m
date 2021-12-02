Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4B4668A8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:51:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A82E29D0;
	Thu,  2 Dec 2021 17:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A82E29D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638463898;
	bh=DLzCOKQxJBTxWktIjN++syLg0CcURAVAbX1mhzlQmj8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZY0LqsTB+v51s98MVIEPuSqp75KsNTqd7xYU0lG7UBi2PMwaxutG4kYhdL9foH5Ek
	 95+EKgRjtLl2KGlYLlbSZH8VyoEf3P31wZaNdWt1amwtrjhqbnhGaEjKp2AY5t6Vxu
	 r6v2zT+lcs/B4eZSqzqiJo9CRucrEnI1eo07aeyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 707DCF800BE;
	Thu,  2 Dec 2021 17:50:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EFDEF802A0; Thu,  2 Dec 2021 17:50:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7D28F800BE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:50:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7D28F800BE
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id BC13BC80089;
 Thu,  2 Dec 2021 17:50:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id 6mT-j2k8NAvQ; Thu,  2 Dec 2021 17:50:10 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box
 (host-212-18-30-247.customer.m-online.net [212.18.30.247])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 60F1AC8006F;
 Thu,  2 Dec 2021 17:50:10 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Fix quirk for TongFang PHxTxX1
Date: Thu,  2 Dec 2021 17:50:10 +0100
Message-Id: <20211202165010.876431-1-wse@tuxedocomputers.com>
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

This fixes the SND_PCI_QUIRK(...) of the TongFang PHxTxX1 barebone. This
fixes the issue of sound not working after s3 suspend.

When waking up from s3 suspend the Coef 0x10 is set to 0x0220 instead of
0x0020. Setting the value manually makes the sound work again. This patch
does this automatically.

While being on it, I also fixed the comment formatting of the quirk and
shortened variable and function names.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Fixes: dd6dd6e3c791 ("ALSA: hda/realtek: Add quirk for TongFang PHxTxX1")
Cc: <stable@vger.kernel.org>
---
 sound/pci/hda/patch_realtek.c | 40 +++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9ce7457533c96..d361a1260d5a1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6503,22 +6503,26 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 /* for alc285_fixup_ideapad_s740_coef() */
 #include "ideapad_s740_helper.c"
 
-static void alc256_fixup_tongfang_reset_persistent_settings(struct hda_codec *codec,
-							    const struct hda_fixup *fix,
-							    int action)
+static const struct coef_fw alc256_fixup_set_coef_defaults_coefs[] = {
+	WRITE_COEF(0x10, 0x0020), WRITE_COEF(0x24, 0x0000),
+	WRITE_COEF(0x26, 0x0000), WRITE_COEF(0x29, 0x3000),
+	WRITE_COEF(0x37, 0xfe05), WRITE_COEF(0x45, 0x5089),
+	{}
+};
+
+static void alc256_fixup_set_coef_defaults(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
 {
 	/*
-	* A certain other OS sets these coeffs to different values. On at least one TongFang
-	* barebone these settings might survive even a cold reboot. So to restore a clean slate the
-	* values are explicitly reset to default here. Without this, the external microphone is
-	* always in a plugged-in state, while the internal microphone is always in an unplugged
-	* state, breaking the ability to use the internal microphone.
-	*/
-	alc_write_coef_idx(codec, 0x24, 0x0000);
-	alc_write_coef_idx(codec, 0x26, 0x0000);
-	alc_write_coef_idx(codec, 0x29, 0x3000);
-	alc_write_coef_idx(codec, 0x37, 0xfe05);
-	alc_write_coef_idx(codec, 0x45, 0x5089);
+	 * A certain other OS sets these coeffs to different values. On at least
+	 * one TongFang barebone these settings might survive even a cold
+	 * reboot. So to restore a clean slate the values are explicitly reset
+	 * to default here. Without this, the external microphone is always in a
+	 * plugged-in state, while the internal microphone is always in an
+	 * unplugged state, breaking the ability to use the internal microphone.
+	 */
+	alc_process_coef_fw(codec, alc256_fixup_set_coef_defaults_coefs);
 }
 
 static const struct coef_fw alc233_fixup_no_audio_jack_coefs[] = {
@@ -6759,7 +6763,7 @@ enum {
 	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
-	ALC256_FIXUP_TONGFANG_RESET_PERSISTENT_SETTINGS,
+	ALC256_FIXUP_SET_COEF_DEFAULTS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC233_FIXUP_NO_AUDIO_JACK,
 };
@@ -8465,9 +8469,9 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE,
 	},
-	[ALC256_FIXUP_TONGFANG_RESET_PERSISTENT_SETTINGS] = {
+	[ALC256_FIXUP_SET_COEF_DEFAULTS] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = alc256_fixup_tongfang_reset_persistent_settings,
+		.v.func = alc256_fixup_set_coef_defaults,
 	},
 	[ALC245_FIXUP_HP_GPIO_LED] = {
 		.type = HDA_FIXUP_FUNC,
@@ -8929,7 +8933,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
 	SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
 	SND_PCI_QUIRK(0x1c06, 0x2015, "Lemote A190X", ALC269_FIXUP_LEMOTE_A190X),
-	SND_PCI_QUIRK(0x1d05, 0x1132, "TongFang PHxTxX1", ALC256_FIXUP_TONGFANG_RESET_PERSISTENT_SETTINGS),
+	SND_PCI_QUIRK(0x1d05, 0x1132, "TongFang PHxTxX1", ALC256_FIXUP_SET_COEF_DEFAULTS),
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
-- 
2.25.1

