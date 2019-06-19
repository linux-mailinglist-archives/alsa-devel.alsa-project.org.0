Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C94B722
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 13:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187821698;
	Wed, 19 Jun 2019 13:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187821698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560944109;
	bh=NH5BCj7B5TCJAc2UU5fJrS9VnQvUB0zeL+4T7YzlwJA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XzS5Ew6sDbh5d4fDy+OKy86Y5E8Udko8EqfuHJh+pkX/knpuwRAgi87D6ypXvSvIz
	 Mh3Tdf2C3u0ML9qhTpDol3JBej5x+VQHs7U2JAfN4CYMjHqCcQdpZqtEbvTChUcd8a
	 NDxPQaJQVSv0Il2QYAoEsOoGeWRJuOKbu9pSetos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FBC5F896C7;
	Wed, 19 Jun 2019 13:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2641F896B8; Wed, 19 Jun 2019 13:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57A64F808AF
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 13:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A64F808AF
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id B8E29C80EF6;
 Wed, 19 Jun 2019 13:33:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnS4eypSwKtQ; Wed, 19 Jun 2019 13:33:18 +0200 (CEST)
Received: from yang.nibelungen (unknown [188.193.2.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rs@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 6817FC80EF5;
 Wed, 19 Jun 2019 13:33:18 +0200 (CEST)
From: Richard Sailer <rs@tuxedocomputers.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Date: Wed, 19 Jun 2019 13:33:11 +0200
Message-Id: <20190619113311.31656-1-rs@tuxedocomputers.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: jeremy@system76.com
Subject: [alsa-devel] [PATCH v2] ALSA: hda/realtek: Add quirks for several
	Clevo notebook barebones
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This adds 4 SND_PCI_QUIRK(...) lines for several barebone models of the ODM
Clevo. The model names are written in regex syntax to describe/match all clevo
models that are similar enough and use the same PCI SSID that this fixup works
for them.

Additionally the lines regarding SSID 0x96e1 and 0x97e1 didn't fix audio for the
all our Clevo notebooks using these SSIDs (models Clevo P960* and P970*) since
ALC1220_FIXP_CLEVO_PB51ED_PINS swapped pins that are not necesarry to be
swapped. This patch initiates ALC1220_FIXUP_CLEVO_P950 instead for these model
and fixes the audio.

This is strange since the System76 Oryx Pro also seems to be a P960 and
P970 barebone, so the original fixup should also not have worked for
them. @Jeremy: What's your take on this?

Signed-off-by: Richard Sailer <rs@tuxedocomputers.com>
---
 sound/pci/hda/patch_realtek.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1afb268f3da0..61dcd293afb1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2461,9 +2461,10 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1558, 0x9501, "Clevo P950HR", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1558, 0x95e1, "Clevo P95xER", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1558, 0x95e2, "Clevo P950ER", ALC1220_FIXUP_CLEVO_P950),
-	SND_PCI_QUIRK(0x1558, 0x96e1, "System76 Oryx Pro (oryp5)", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
-	SND_PCI_QUIRK(0x1558, 0x97e1, "System76 Oryx Pro (oryp5)", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
-	SND_PCI_QUIRK(0x1558, 0x65d1, "Tuxedo Book XC1509", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x96e1, "Clevo P960[ER][CDFN]-K", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1558, 0x97e1, "Clevo P970[ER][CDFN]", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1558, 0x65d1, "Clevo PB51[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
+	SND_PCI_QUIRK(0x1558, 0x67d1, "Clevo PB71[ER][CDF]", ALC1220_FIXUP_CLEVO_PB51ED_PINS),
 	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo laptop", ALC882_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x161f, 0x2054, "Medion laptop", ALC883_FIXUP_EAPD),
 	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Y530", ALC882_FIXUP_LENOVO_Y530),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
