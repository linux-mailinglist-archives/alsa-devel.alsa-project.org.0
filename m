Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58479F443
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 12:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5B816C3;
	Tue, 30 Apr 2019 12:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5B816C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556620392;
	bh=SVLG22hh6MZdYV6ab9bWUhUO1wcg3Eq7U9uyBxto6nE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jvDC2bzCNPegYO7p8zesTat6LpYV/io+jwghNJGboj8MW1xxFOT1B3aZYp3wsZvxN
	 CJg1eJnDEXgPEk0nKwQOy6M/LeAyTgugVRAeThA2pfHip2Sehk9f+rvEMjAb98ligp
	 cPV7QRUgtPAP0sLuXm/VSIUqTQ3Z7hGPlAgg7M6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C8A9F896E3;
	Tue, 30 Apr 2019 12:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBE4BF896AA; Tue, 30 Apr 2019 12:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98B05F8065C
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 12:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98B05F8065C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9BAC5AEBB;
 Tue, 30 Apr 2019 10:31:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 12:30:57 +0200
Message-Id: <20190430103057.20370-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Liwei Song <liwei.song@windriver.com>
Subject: [alsa-devel] [PATCH] ALSA: hda - Register irq handler after the
	chip initialization
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently the IRQ handler in HD-audio controller driver is registered
before the chip initialization.  That is, we have some window opened
between the azx_acquire_irq() call and the CORB/RIRB setup.  If an
interrupt is triggered in this small window, the IRQ handler may
access to the uninitialized RIRB buffer, which leads to a NULL
dereference Oops.

This is usually no big problem since most of Intel chips do register
the IRQ via MSI, and we've already fixed the order of the IRQ
enablement and the CORB/RIRB setup in the former commit b61749a89f82
("sound: enable interrupt after dma buffer initialization"), hence the
IRQ won't be triggered in that room.  However, some platforms use a
shared IRQ, and this may allow the IRQ trigger by another source.

Another possibility is the kdump environment: a stale interrupt might
be present in there, the IRQ handler can be falsely triggered as well.

For covering this small race, let's move the azx_acquire_irq() call
after hda_intel_init_chip() call.  Although this is a bit radical
change, it can cover more widely than checking the CORB/RIRB setup
locally in the callee side.

Reported-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 2ec91085fa3e..789308f54785 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1788,9 +1788,6 @@ static int azx_first_init(struct azx *chip)
 			chip->msi = 0;
 	}
 
-	if (azx_acquire_irq(chip, 0) < 0)
-		return -EBUSY;
-
 	pci_set_master(pci);
 	synchronize_irq(bus->irq);
 
@@ -1904,6 +1901,9 @@ static int azx_first_init(struct azx *chip)
 		return -ENODEV;
 	}
 
+	if (azx_acquire_irq(chip, 0) < 0)
+		return -EBUSY;
+
 	strcpy(card->driver, "HDA-Intel");
 	strlcpy(card->shortname, driver_short_names[chip->driver_type],
 		sizeof(card->shortname));
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
