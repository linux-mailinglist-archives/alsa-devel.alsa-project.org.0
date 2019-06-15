Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF646E0A
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 05:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59A7E186E;
	Sat, 15 Jun 2019 05:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59A7E186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560570981;
	bh=MrSFkMxWs+hBhycXQXTRRofaAgSFAiTeRUK5IJ2zo+0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oZwQESgQB7s2qAteTn2b9NdagyYl+G1+UDhjoubijedmlAj1AXLNYUChenJKi02aE
	 6aFSYdfX4ChzdlGTNyGnZTpon5yNxpy7aZElJfwSCWl/RICIvIlwjlmnASzPzWV9J1
	 yhc3flvaCjCDqqOUgsYr9BXYeu1EJIvbRNW3IWeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB64BF896F1;
	Sat, 15 Jun 2019 05:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70530F89703; Sat, 15 Jun 2019 05:54:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D86F8076F
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 05:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D86F8076F
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 19597C80C98
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 05:54:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WV8RaL4I4BRB for <alsa-devel@alsa-project.org>;
 Sat, 15 Jun 2019 05:54:25 +0200 (CEST)
Received: from yang.nibelungen (unknown [188.193.2.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: rs@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id D192FC80C8E
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 05:54:25 +0200 (CEST)
From: Richard Sailer <rs@tuxedocomputers.com>
To: alsa-devel@alsa-project.org
Date: Sat, 15 Jun 2019 05:53:59 +0200
Message-Id: <20190615035359.23132-1-rs@tuxedocomputers.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH] ALSA: hda/realtek: Add quirks for several
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
