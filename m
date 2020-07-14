Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D37321F848
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:33:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AEBD1672;
	Tue, 14 Jul 2020 19:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AEBD1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594748016;
	bh=vf3hjbGw/1FGWae2S+TGW9c2qBzUAHUmT8AgQ3QJKtc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SoaViCaCQS3sm1sLpw591+b4JIYeYJZ56q3rDkUPSX/JwCyHPH7IypNBAgydFOaQW
	 nmaHghLI2fE7gqHSmUiUWqLH9bR2chOzcpuBhRONFOMxdOpUY0BdSxHOZK+HQOEPkx
	 NrSWlfOxa8kooLJ0HbDQrFY4Qfhof/8c6TaiyYxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93130F80316;
	Tue, 14 Jul 2020 19:27:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39D26F802F9; Tue, 14 Jul 2020 19:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E333F8026F
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E333F8026F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D5C1AD77
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/10] ALSA: nm256: Replace the words blacklist
Date: Tue, 14 Jul 2020 19:26:29 +0200
Message-Id: <20200714172631.25371-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200714172631.25371-1-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
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

Follow the recent inclusive terminology guidelines and replace the
words "whitelist" and "blacklist" appropriately.

Only comment or enum/variable renames, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index 240195e85e3d..975994623c2c 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -1632,11 +1632,11 @@ snd_nm256_create(struct snd_card *card, struct pci_dev *pci,
 }
 
 
-enum { NM_BLACKLISTED, NM_RESET_WORKAROUND, NM_RESET_WORKAROUND_2 };
+enum { NM_IGNORED, NM_RESET_WORKAROUND, NM_RESET_WORKAROUND_2 };
 
 static const struct snd_pci_quirk nm256_quirks[] = {
 	/* HP omnibook 4150 has cs4232 codec internally */
-	SND_PCI_QUIRK(0x103c, 0x0007, "HP omnibook 4150", NM_BLACKLISTED),
+	SND_PCI_QUIRK(0x103c, 0x0007, "HP omnibook 4150", NM_IGNORED),
 	/* Reset workarounds to avoid lock-ups */
 	SND_PCI_QUIRK(0x104d, 0x8041, "Sony PCG-F305", NM_RESET_WORKAROUND),
 	SND_PCI_QUIRK(0x1028, 0x0080, "Dell Latitude LS", NM_RESET_WORKAROUND),
@@ -1658,9 +1658,9 @@ static int snd_nm256_probe(struct pci_dev *pci,
 		dev_dbg(&pci->dev, "Enabled quirk for %s.\n",
 			    snd_pci_quirk_name(q));
 		switch (q->value) {
-		case NM_BLACKLISTED:
+		case NM_IGNORED:
 			dev_info(&pci->dev,
-				 "The device is blacklisted. Loading stopped\n");
+				 "The device is on the denylist. Loading stopped\n");
 			return -ENODEV;
 		case NM_RESET_WORKAROUND_2:
 			reset_workaround_2 = 1;
-- 
2.16.4

