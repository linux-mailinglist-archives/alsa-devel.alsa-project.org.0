Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 551772CF975
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 06:13:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2E6188E;
	Sat,  5 Dec 2020 06:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2E6188E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607145210;
	bh=fnUcfnQkVzljtpGBJUD36qwImDBL5NAE8FGU8r9Wwic=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IFOHGHe4i0Kooahh3Jrx0Q0khZIwWpPvG1A0vR4UaLHdfxaEqWQRrBpVYTcQsvvmF
	 WB80698yFmePu7DGDHYrQ+HtyKcHTVOVhRPTq6JauemnX0h541MwLerxaqe4naQAJX
	 2S1GrTzoenA9Q59pjqJ3A7tpclbRf5NPKAnNunQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F5D1F80254;
	Sat,  5 Dec 2020 06:11:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A494DF8016D; Sat,  5 Dec 2020 06:11:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF3FEF800E8
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 06:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF3FEF800E8
Received: from [111.196.65.193] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1klPrG-0007tw-5d; Sat, 05 Dec 2020 05:11:47 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	stable@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: make bass spk volume adjustable on a
 yoga laptop
Date: Sat,  5 Dec 2020 13:11:30 +0800
Message-Id: <20201205051130.8122-1-hui.wang@canonical.com>
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

This change could fix 2 issues on this machine:
 - the bass speaker's output volume can't be adjusted, that is because
   the bass speaker is routed to the DAC (Nid 0x6) which has no volume
   control.
 - after plugging a headset with vol+, vol- and pause buttons on it,
   press those buttons, nothing happens, this means those buttons
   don't work at all. This machine has alc287 codec, need to add the
   codec id to the disable/enable_headset_jack_key(), then the headset
   button could work.

The quirk of ALC285_FIXUP_THINKPAD_HEADSET_JACK could fix both of these
2 issues.

Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8616c5624870..5a905fa1b33a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -3104,6 +3104,7 @@ static void alc_disable_headset_jack_key(struct hda_codec *codec)
 	case 0x10ec0215:
 	case 0x10ec0225:
 	case 0x10ec0285:
+	case 0x10ec0287:
 	case 0x10ec0295:
 	case 0x10ec0289:
 	case 0x10ec0299:
@@ -3130,6 +3131,7 @@ static void alc_enable_headset_jack_key(struct hda_codec *codec)
 	case 0x10ec0215:
 	case 0x10ec0225:
 	case 0x10ec0285:
+	case 0x10ec0287:
 	case 0x10ec0295:
 	case 0x10ec0289:
 	case 0x10ec0299:
@@ -8578,6 +8580,11 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x14, 0x90170110},
 		{0x19, 0x04a11040},
 		{0x21, 0x04211020}),
+	SND_HDA_PIN_QUIRK(0x10ec0287, 0x17aa, "Lenovo", ALC285_FIXUP_THINKPAD_HEADSET_JACK,
+		{0x14, 0x90170110},
+		{0x17, 0x90170111},
+		{0x19, 0x03a11030},
+		{0x21, 0x03211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0286, 0x1025, "Acer", ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE,
 		{0x12, 0x90a60130},
 		{0x17, 0x90170110},
-- 
2.25.1

