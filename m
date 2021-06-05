Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B439C6C9
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Jun 2021 10:28:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6198C170C;
	Sat,  5 Jun 2021 10:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6198C170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622881716;
	bh=6WnhUmvpOPZ9sw6KcSUogzLzaKLxIAKGy4q06LRHlqI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dh7l9HXjIMeK0mhVjYj2yW27Oz1V09xM3dvQetISCFDkKlDdEAYR9OSbIckwq5JgC
	 FJVB/epLjwczqO7VvpbnxQFFIg540GG4QZh58gT/YSx/u/eb2xoynZBPNJdmbPKCMu
	 yG2iz462m92GLTacwjaPrtEE7fwlqcwabyA6yWLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB29AF80253;
	Sat,  5 Jun 2021 10:26:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD1EF804BC; Sat,  5 Jun 2021 10:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9C04F80253
 for <alsa-devel@alsa-project.org>; Sat,  5 Jun 2021 10:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9C04F80253
Received: from 36-226-165-123.dynamic-ip.hinet.net ([36.226.165.123]
 helo=localhost) by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <jeremy.szu@canonical.com>)
 id 1lpRd4-0001D3-EE; Sat, 05 Jun 2021 08:26:03 +0000
From: Jeremy Szu <jeremy.szu@canonical.com>
To: tiwai@suse.com
Subject: [PATCH 3/3] ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook
 840 Aero G8
Date: Sat,  5 Jun 2021 16:25:38 +0800
Message-Id: <20210605082539.41797-3-jeremy.szu@canonical.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605082539.41797-1-jeremy.szu@canonical.com>
References: <20210605082539.41797-1-jeremy.szu@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Chris Chiu <chris.chiu@canonical.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 open list <linux-kernel@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Jian-Hong Pan <jhp@endlessos.org>, Hui Wang <hui.wang@canonical.com>
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

The HP EliteBook 840 Aero G8 using ALC285 codec which using 0x04 to
control mute LED and 0x01 to control micmute LED.
In the other hand, there is no output from right channel of speaker.
Therefore, add a quirk to make it works.

Signed-off-by: Jeremy Szu <jeremy.szu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 11324163ebe1..215beb3ac678 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8330,6 +8330,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x87f5, "HP", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x87f7, "HP Spectre x360 14", ALC245_FIXUP_HP_X360_AMP),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884c, "HP EliteBook 840 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x886d, "HP ZBook Fury 17.3 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.31.1

