Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166C36D674
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 13:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96F1416D5;
	Wed, 28 Apr 2021 13:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96F1416D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619609392;
	bh=5aEiaK6JhHBaWaJNa74gAY5D6p1b/19Cgyw2L+o7hpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6wMOmPNKprL9QTZNKd89zPdcXRhXETKN537Q3o24zgLI8x0DPErvvP6oZ349Evei
	 irAhEsfgEdIHJcno/K+ShM2Mrlv8PvLBzQdsJNBXOh9j40C5yI+bB4h3IU6UjzxiGA
	 5ypFnUTtXD8ouNdr8/nZtLobif9is3itC3B1Kl+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F3B6F804AB;
	Wed, 28 Apr 2021 13:27:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3808BF8012A; Wed, 28 Apr 2021 13:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BF09F8016C
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 13:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BF09F8016C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B31E2B15F
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 11:27:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/13] ALSA: hda/realtek: Re-order ALC269 Acer quirk table
 entries
Date: Wed, 28 Apr 2021 13:26:56 +0200
Message-Id: <20210428112704.23967-6-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210428112704.23967-1-tiwai@suse.de>
References: <20210428112704.23967-1-tiwai@suse.de>
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

Just re-order the alc269_fixup_tbl[] entries for Acer devices for
avoiding the oversight of the duplicated or unapplied item in future.
No functional changes.

Also Cc-to-stable for the further patch applications.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5c594b8b8723..fd7255490635 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7971,12 +7971,12 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x0349, "Acer AOD260", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x047c, "Acer AC700", ALC269_FIXUP_ACER_AC700),
 	SND_PCI_QUIRK(0x1025, 0x072d, "Acer Aspire V5-571G", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1025, 0x080d, "Acer Aspire V5-122P", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x0740, "Acer AO725", ALC271_FIXUP_HP_GATE_MIC_JACK),
 	SND_PCI_QUIRK(0x1025, 0x0742, "Acer AO756", ALC271_FIXUP_HP_GATE_MIC_JACK),
 	SND_PCI_QUIRK(0x1025, 0x0762, "Acer Aspire E1-472", ALC271_FIXUP_HP_GATE_MIC_JACK_E1_572),
 	SND_PCI_QUIRK(0x1025, 0x0775, "Acer Aspire E1-572", ALC271_FIXUP_HP_GATE_MIC_JACK_E1_572),
 	SND_PCI_QUIRK(0x1025, 0x079b, "Acer Aspire V5-573G", ALC282_FIXUP_ASPIRE_V5_PINS),
+	SND_PCI_QUIRK(0x1025, 0x080d, "Acer Aspire V5-122P", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x0840, "Acer Aspire E1", ALC269VB_FIXUP_ASPIRE_E1_COEF),
 	SND_PCI_QUIRK(0x1025, 0x101c, "Acer Veriton N2510G", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x1025, 0x102b, "Acer Aspire C24-860", ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE),
-- 
2.26.2

