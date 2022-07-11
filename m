Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CD956D79F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 10:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBA4FA;
	Mon, 11 Jul 2022 10:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBA4FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657527422;
	bh=mHn34nFJ2uRu22WorggbQGYabG5m5IloI46O1SRQ7dE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E347F7uVRAaUZ4Teb8epBwUle/UilHAifE60Tw0J0ZKJegN23lnQxJj3fLMPnjukR
	 ijJpoCq8/lbiq4ZtwcCwoJZ2j3lfQ8RfhU8LHvhpT0IRKfe6PuIXsrlwvX7AulUO+I
	 Kmb2LiAyvopR4LC75u/+HYt/FnIiTir/SCF8zz7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A18F800E1;
	Mon, 11 Jul 2022 10:16:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED855F80155; Mon, 11 Jul 2022 10:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg506.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1AD7F80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 10:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1AD7F80152
X-QQ-mid: bizesmtp73t1657527335tdmplea0
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 11 Jul 2022 16:15:29 +0800 (CST)
X-QQ-SSF: 01400000002000G0T000B00A0000000
X-QQ-FEAT: 357G+HpUJafKVCqO/P4HU43U4zyZg+9kBNp/Le0Dv+PEfu7zWOm9YZ67+06Vh
 Twrfj/SaTivXtg17N7qgT0Yok17vf9Fud70QEt2IXdYGeCFqnz8G3fVs3vRZH5C1KWLyUsK
 oRlalOjDdVi1Q90PqFM7MVIAkklbqxxjAuNjDqnU+pz7BSpQm7xkewzGVSEn6AIYWEOx9A2
 cMZ6P6o3GGBXm+rhSB3I4uso9Usk3yL54nd5LLY6xcO9I/Lcd8ZKu3L6NUujd/T3HkZdrN8
 sew5zpffE7kj9FJ6DM6Bv1NRnGasGgr+P8p2/PDC2t7kPUiMTG65eFsCCKJLVVEbbINW86/
 wNeObm9K9uLiAf8AxE5OjJJlgDX7w+Ytx8g1gPCsFHinP6TjqwA4j4M82dxo7ENegHHA/zp
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix headset mic for Acer SF313-51
Date: Mon, 11 Jul 2022 16:15:27 +0800
Message-Id: <20220711081527.6254-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign9
X-QQ-Bgrelay: 1
Cc: sbinding@opensource.cirrus.com, kailang@realtek.com,
 tanureal@opensource.cirrus.com, tcrawford@system76.com,
 wse@tuxedocomputers.com, kai.heng.feng@canonical.com, andy.chi@canonical.com,
 Meng Tang <tangmeng@uniontech.com>, cam@neo-zeon.de, yong.wu@mediatek.com
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

The issue on Acer SWIFT SF313-51 is that headset microphone
doesn't work. The following quirk fixed headset microphone issue.
Note that the fixup of SF314-54/55 (ALC256_FIXUP_ACER_HEADSET_MIC)
was not successful on my SF313-51.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 007dd8b5e1f2..fe7c1194d052 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8886,6 +8886,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1290, "Acer Veriton Z4860G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1291, "Acer Veriton Z4660G", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x129c, "Acer SWIFT SF314-55", ALC256_FIXUP_ACER_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x129d, "Acer SWIFT SF313-51", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1300, "Acer SWIFT SF314-56", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21", ALC233_FIXUP_ACER_HEADSET_MIC),
-- 
2.20.1



