Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB46544E41F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 10:48:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 220C31666;
	Fri, 12 Nov 2021 10:47:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 220C31666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636710519;
	bh=l89nU3wl2UzJ/c+p8o/lJUx0xKJz8tYyDmMoibFWXXU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jy51j0uthxvzU64MxNjdsdzc/Zs044uJNn+ahkG4ch4KWfaer8/zHBGnRDOCRdDuQ
	 +zi12jkv5+vxaj+5akvHNhGnob41++LUFvnDg3kPAw9QffPVNMpEfXH8P8QPO6RjPJ
	 liKTssiAaPc+7slj+Oj3ZL5NRsI73syhcl/++Euw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F195F804B1;
	Fri, 12 Nov 2021 10:47:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2692F8049E; Fri, 12 Nov 2021 10:47:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E488F800C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 10:47:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E488F800C1
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id DBC09C800BB;
 Fri, 12 Nov 2021 10:47:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id 7Q1scMJ8ElaS; Fri, 12 Nov 2021 10:47:11 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box
 (host-212-18-30-247.customer.m-online.net [212.18.30.247])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 84DC5C800B8;
 Fri, 12 Nov 2021 10:47:11 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASRock NUC Box 1100
Date: Fri, 12 Nov 2021 10:47:11 +0100
Message-Id: <20211112094711.963474-1-wse@tuxedocomputers.com>
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

This applies a SND_PCI_QUIRK(...) to the ASRock NUC Box 1100 series. This
fixes the issue of the headphone jack not being detected unless warm
rebooted from a certain other OS.

When booting a certain other OS some coeff settings are changed that enable
the audio jack. These settings are preserved on a warm reboot and can be
easily dumped.

The relevant indexes and values where gathered by naively diff-ing and
reading a working and a non-working coeff dump.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: <stable@vger.kernel.org>
---
 sound/pci/hda/patch_realtek.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2f1727faec69..2aef9866f170 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6521,6 +6521,25 @@ static void alc256_fixup_tongfang_reset_persistent_settings(struct hda_codec *co
 	alc_write_coef_idx(codec, 0x45, 0x5089);
 }
 
+static void alc233_fixup_asrock_nuc_box_1100_no_audio_jack(struct hda_codec *codec,
+							     const struct hda_fixup *fix,
+							     int action)
+{
+	/*
+	 * The audio jack input and output is not detected on the ASRock NUC Box 1100 series when
+	 * cold booting without this fix. Warm rebooting from a certain other OS makes the audio
+	 * functional, as COEF settings are preserved in this case. This fix sets these altered
+	 * COEF values as the default.
+	 */
+	alc_write_coef_idx(codec, 0x1a, 0x9003);
+	alc_write_coef_idx(codec, 0x1b, 0x0e2b);
+	alc_write_coef_idx(codec, 0x37, 0xfe06);
+	alc_write_coef_idx(codec, 0x38, 0x4981);
+	alc_write_coef_idx(codec, 0x45, 0xd489);
+	alc_write_coef_idx(codec, 0x46, 0x0074);
+	alc_write_coef_idx(codec, 0x49, 0x0149);
+}
+
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -6740,6 +6759,7 @@ enum {
 	ALC287_FIXUP_13S_GEN2_SPEAKERS,
 	ALC256_FIXUP_TONGFANG_RESET_PERSISTENT_SETTINGS,
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
+	ALC233_FIXUP_ASROCK_NUC_BOX_1100_NO_AUDIO_JACK,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8460,6 +8480,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC,
 	},
+	[ALC233_FIXUP_ASROCK_NUC_BOX_1100_NO_AUDIO_JACK] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc233_fixup_asrock_nuc_box_1100_no_audio_jack,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8894,6 +8918,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x511e, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x511f, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
+	SND_PCI_QUIRK(0x1849, 0x1233, "ASRock NUC Box 1100", ALC233_FIXUP_ASROCK_NUC_BOX_1100_NO_AUDIO_JACK),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
 	SND_PCI_QUIRK(0x1b35, 0x1235, "CZC B20", ALC269_FIXUP_CZC_B20),
 	SND_PCI_QUIRK(0x1b35, 0x1236, "CZC TMI", ALC269_FIXUP_CZC_TMI),
-- 
2.25.1

