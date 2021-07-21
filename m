Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDC43D4682
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jul 2021 10:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85FD617E3;
	Sat, 24 Jul 2021 10:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85FD617E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627117168;
	bh=JhKSeT+jRsJ2revGR/zniDCOltMeu8HqIEigw9INBzU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TNOwJQ+qqAGDUpiqLALrslHSrExnEU1d8/VYInFg3sOUeNq6IFkVb6IWoFXngy3zw
	 kq6o2UoMt0lty7w100sQevhjqGk/2ti7GTSl20Q3PoYzwktnJJS8lDFTMGCm97djvY
	 brIuLsRJSSHWDGpn99lixWbvno/na+i2SkhZe2Mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D306CF80529;
	Sat, 24 Jul 2021 10:53:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C483F804AB; Wed, 21 Jul 2021 19:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A62E8F800DA
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 19:02:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A62E8F800DA
Received: from localhost.localdomain (unknown [46.188.10.168])
 by mail.ispras.ru (Postfix) with ESMTPSA id 01B0040D403D;
 Wed, 21 Jul 2021 17:02:04 +0000 (UTC)
From: Alexander Monakov <amonakov@ispras.ru>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: add mic quirk for Acer SF314-42
Date: Wed, 21 Jul 2021 20:01:41 +0300
Message-Id: <20210721170141.24807-1-amonakov@ispras.ru>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 24 Jul 2021 10:53:22 +0200
Cc: Chris Chiu <chris.chiu@canonical.com>, Jian-Hong Pan <jhp@endlessos.org>,
 Kailang Yang <kailang@realtek.com>, alsa-devel@alsa-project.org,
 Jeremy Szu <jeremy.szu@canonical.com>, Alexander Monakov <amonakov@ispras.ru>,
 Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>
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

The Acer Swift SF314-42 laptop is using Realtek ALC255 codec. Add a
quirk so microphone in a headset connected via the right-hand side jack
is usable.

Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Hui Wang <hui.wang@canonical.com>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Jeremy Szu <jeremy.szu@canonical.com>
Cc: Jian-Hong Pan <jhp@endlessos.org>
Cc: Chris Chiu <chris.chiu@canonical.com>
Cc: PeiSen Hou <pshou@realtek.com>
Cc: alsa-devel@alsa-project.org
---
Hello,

Acer Swift SF314-42 laptop is using AMD Ryzen SoC audio with Realtek
ALC255 codec. The are three ALSA cards: HDMI audio, AMD ACP card, and
AMD HDA card. There is an internal stereo microphone connected to the
ACP card, and a mini-jack connected to the Realtek codec. There are no
LEDs.

I'd like to be able to use a mic+headphones headset. Unfortunately, out
of the box ALSA does not correctly detect the microphone input of the
Realtek codec.  The suggested patch fixes that, though I cannot be sure
it's 100% correct.

With the patch, the experience is unfortunately still not ideal. I have
noticed a couple of issues:

1) at high enough gain, recording the microphone is picking up what is
being played via the headphones; maybe it's supposed to be like that,
but it surprised me;

2) there is a very noticeable "pop" when plugging the headset in/out,
accompanied by

pcieport 0000:00:08.1: PME: Spurious native interrupt!
pcieport 0000:00:08.1: PME: Spurious native interrupt!

in dmesg. I'd appreciate info and any help about this issue.

Thanks.
Alexander

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ab5113cccffa..87ad8469dbc5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8191,6 +8191,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21", ALC233_FIXUP_ACER_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T", ALC255_FIXUP_ACER_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x142b, "Acer Swift SF314-42", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),

base-commit: 62fb9874f5da54fdb243003b386128037319b219
-- 
2.31.1
