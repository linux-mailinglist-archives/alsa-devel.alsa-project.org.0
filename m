Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9274246667B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 16:30:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A92525D0;
	Thu,  2 Dec 2021 16:29:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A92525D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638459019;
	bh=JwXumrqBCmKiTQZFoNoYaubI+hMM/6FAVnbjD+vm3SY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YyqdzJfdo16YO8hN4Z5IySO7kSYAv68SS4K8ym3nZkWTPI5p2lwHSHdqUpqTQkHzL
	 iob991oUBa3ot759XkmCbFUAHWlD+nCv2kB667rbRjVaseSxBnES8BWwUsplD5K7Fl
	 iAi41P7TxOigC6QoyHKcOOwgmR4YJ48buTsxYuKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75932F802E0;
	Thu,  2 Dec 2021 16:29:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5CCAF802A0; Thu,  2 Dec 2021 16:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C813F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 16:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C813F800EE
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 77294C80089;
 Thu,  2 Dec 2021 16:28:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id T43BbA8HVVIw; Thu,  2 Dec 2021 16:28:44 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box
 (host-212-18-30-247.customer.m-online.net [212.18.30.247])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 26010C80086;
 Thu,  2 Dec 2021 16:28:44 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix quirk for TongFang PHxTxX1
Date: Thu,  2 Dec 2021 16:28:43 +0100
Message-Id: <20211202152843.818617-1-wse@tuxedocomputers.com>
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

While being on it, I also fixed the comment formatting of the quirk.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: <stable@vger.kernel.org>
---
 sound/pci/hda/patch_realtek.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9ce7457533c96..d3a16843c7afd 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6503,22 +6503,25 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 /* for alc285_fixup_ideapad_s740_coef() */
 #include "ideapad_s740_helper.c"
 
+static const struct coef_fw alc256_fixup_tongfang_reset_persistent_settings_coefs[] = {
+	WRITE_COEF(0x10, 0x0020), WRITE_COEF(0x24, 0x0000), WRITE_COEF(0x26, 0x0000),
+	WRITE_COEF(0x29, 0x3000), WRITE_COEF(0x37, 0xfe05), WRITE_COEF(0x45, 0x5089),
+	{}
+};
+
 static void alc256_fixup_tongfang_reset_persistent_settings(struct hda_codec *codec,
 							    const struct hda_fixup *fix,
 							    int action)
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
+	alc_process_coef_fw(codec, alc256_fixup_tongfang_reset_persistent_settings_coefs);
 }
 
 static const struct coef_fw alc233_fixup_no_audio_jack_coefs[] = {
-- 
2.25.1

