Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A14C1180C5
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:50:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0EBE16CE;
	Tue, 10 Dec 2019 07:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0EBE16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575960611;
	bh=xgw+XZr8l6uZxpGBjZjlfbdnTIcZ0nWngjtF/QKAQ0s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m21vjl8cRdDKpHXMlf69cAU8JppG04CBWtnXQRpTJ1eTsFVa28xL2mjwW1YQsOmkz
	 abqBv8EJprq+yuk1px8bKV5MTG4Oc+yJjduoWtX5cBDsEs88YBPvbq12LaE8uoHgyP
	 A5CE7ES2gmt7Oafgo2Lu5xYPUI3U8ZkAg7pGLMuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9009F80292;
	Tue, 10 Dec 2019 07:36:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9187CF80308; Tue, 10 Dec 2019 07:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24690F80266
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 07:35:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24690F80266
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 233B4B1FC
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 06:35:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 10 Dec 2019 07:34:20 +0100
Message-Id: <20191210063454.31603-22-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210063454.31603-1-tiwai@suse.de>
References: <20191210063454.31603-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 21/55] ALSA: hda: Support PCM sync_stop
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

The driver invokes snd_pcm_period_elapsed() simply from the interrupt
handler.  Set card->sync_irq for enabling the missing sync_stop PCM
operation.  It's cleared and reset dynamically at IRQ re-acquiring for
the PM resume, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 4 +++-
 sound/pci/hda/hda_tegra.c | 4 +---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 35b4526f0d28..d225d4baba9e 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -790,6 +790,7 @@ static int azx_acquire_irq(struct azx *chip, int do_disconnect)
 		return -1;
 	}
 	bus->irq = chip->pci->irq;
+	chip->card->sync_irq = bus->irq;
 	pci_intx(chip->pci, !chip->msi);
 	return 0;
 }
@@ -1028,6 +1029,7 @@ static int azx_suspend(struct device *dev)
 	if (bus->irq >= 0) {
 		free_irq(bus->irq, chip);
 		bus->irq = -1;
+		chip->card->sync_irq = -1;
 	}
 
 	if (chip->msi)
@@ -1884,7 +1886,6 @@ static int azx_first_init(struct azx *chip)
 	}
 
 	pci_set_master(pci);
-	synchronize_irq(bus->irq);
 
 	gcap = azx_readw(chip, GCAP);
 	dev_dbg(card->dev, "chipset global capabilities = 0x%x\n", gcap);
@@ -2043,6 +2044,7 @@ static int disable_msi_reset_irq(struct azx *chip)
 
 	free_irq(bus->irq, chip);
 	bus->irq = -1;
+	chip->card->sync_irq = -1;
 	pci_disable_msi(chip->pci);
 	chip->msi = 0;
 	err = azx_acquire_irq(chip, 1);
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 8350954b7986..fc2e0a294bc1 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -170,7 +170,6 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 
 	if (chip && chip->running) {
 		azx_stop_chip(chip);
-		synchronize_irq(bus->irq);
 		azx_enter_link_reset(chip);
 	}
 	hda_tegra_disable_clocks(hda);
@@ -298,8 +297,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 		return err;
 	}
 	bus->irq = irq_id;
-
-	synchronize_irq(bus->irq);
+	card->sync_irq = bus->irq;
 
 	gcap = azx_readw(chip, GCAP);
 	dev_dbg(card->dev, "chipset global capabilities = 0x%x\n", gcap);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
