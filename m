Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC323C725A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:37:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36D91170F;
	Tue, 13 Jul 2021 16:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36D91170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187062;
	bh=tbIThGY2VsWnck0Zq9qRfZnheBoMGQGe3YYNJ1zqUQA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Efb//cKzRZA8y9Y0vRvEkCvkO0zOVgeoN6yCBiyvcHDhcNQnsKKub8crh/nkYjl1t
	 2UrRHt6TJazBwtT1fl2OJOc9+1KZX7KmZ/gU8IMoc+m56Uhl97ak57hKpOV5a3sYVK
	 lOJ4/G38bKPvmevFPkj3tXK87J9sIrmmAUAiRBQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97A9AF8052E;
	Tue, 13 Jul 2021 16:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0953F80538; Tue, 13 Jul 2021 16:29:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F3EBF8051C
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F3EBF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qx1LxNPK"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="r3cRolaA"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 6CBF122837
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UJlcNtLCmRyyiZVZtAne3g+hTdewxTFXlBLrEUT66E=;
 b=qx1LxNPKrLMjKDzn7GDxanOEw4EINMUZ76jJr9erjENK02lh/ItdxdbWMUkrpoR1dqvxip
 qay/VS4p1U4V1nz4wlt38ml4zBSuvhiXDgkA+iYlnCYiNzXfGRBH5oWD7sI+5HJbC9rZtJ
 9ciygL1Z819ntEJ6OulqGeGcKvA/GXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UJlcNtLCmRyyiZVZtAne3g+hTdewxTFXlBLrEUT66E=;
 b=r3cRolaA6DEOL//ZjWhDVcRNRRamCuScTsjLLXbFON9QSEgPEGqq2xKdiNCEx2alg0dU6b
 6nWuBs96hKWmIdDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6742CA3B90;
 Tue, 13 Jul 2021 14:29:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/51] ALSA: rme32: Allocate resources with device-managed APIs
Date: Tue, 13 Jul 2021 16:28:26 +0200
Message-Id: <20210713142857.19654-21-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713142857.19654-1-tiwai@suse.de>
References: <20210713142857.19654-1-tiwai@suse.de>
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

This patch converts the resource management in PCI rme32 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 49 +++++++++++------------------------------------
 1 file changed, 11 insertions(+), 38 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index b5b357853c94..5b6bd9f0b2f7 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1278,27 +1278,10 @@ static const struct snd_pcm_ops snd_rme32_capture_adat_fd_ops = {
 	.ack =		snd_rme32_capture_fd_ack,
 };
 
-static void snd_rme32_free(void *private_data)
+static void snd_rme32_free(struct rme32 *rme32)
 {
-	struct rme32 *rme32 = (struct rme32 *) private_data;
-
-	if (rme32 == NULL) {
-		return;
-	}
-	if (rme32->irq >= 0) {
+	if (rme32->irq >= 0)
 		snd_rme32_pcm_stop(rme32, 0);
-		free_irq(rme32->irq, (void *) rme32);
-		rme32->irq = -1;
-	}
-	if (rme32->iobase) {
-		iounmap(rme32->iobase);
-		rme32->iobase = NULL;
-	}
-	if (rme32->port) {
-		pci_release_regions(rme32->pci);
-		rme32->port = 0;
-	}
-	pci_disable_device(rme32->pci);
 }
 
 static void snd_rme32_free_spdif_pcm(struct snd_pcm *pcm)
@@ -1322,7 +1305,7 @@ static int snd_rme32_create(struct rme32 *rme32)
 	rme32->irq = -1;
 	spin_lock_init(&rme32->lock);
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
@@ -1331,16 +1314,16 @@ static int snd_rme32_create(struct rme32 *rme32)
 		return err;
 	rme32->port = pci_resource_start(rme32->pci, 0);
 
-	rme32->iobase = ioremap(rme32->port, RME32_IO_SIZE);
+	rme32->iobase = devm_ioremap(&pci->dev, rme32->port, RME32_IO_SIZE);
 	if (!rme32->iobase) {
 		dev_err(rme32->card->dev,
 			"unable to remap memory region 0x%lx-0x%lx\n",
-			   rme32->port, rme32->port + RME32_IO_SIZE - 1);
+			rme32->port, rme32->port + RME32_IO_SIZE - 1);
 		return -ENOMEM;
 	}
 
-	if (request_irq(pci->irq, snd_rme32_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, rme32)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_rme32_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, rme32)) {
 		dev_err(rme32->card->dev, "unable to grab IRQ %d\n", pci->irq);
 		return -EBUSY;
 	}
@@ -1907,8 +1890,8 @@ snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct rme32), &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*rme32), &card);
 	if (err < 0)
 		return err;
 	card->private_free = snd_rme32_card_free;
@@ -1918,10 +1901,8 @@ snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
         if (fullduplex[dev])
 		rme32->fullduplex_mode = 1;
 	err = snd_rme32_create(rme32);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
 	strcpy(card->driver, "Digi32");
 	switch (rme32->pci->device) {
@@ -1939,25 +1920,17 @@ snd_rme32_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		card->shortname, rme32->rev, rme32->port, rme32->irq);
 
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
 }
 
-static void snd_rme32_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 static struct pci_driver rme32_driver = {
 	.name =		KBUILD_MODNAME,
 	.id_table =	snd_rme32_ids,
 	.probe =	snd_rme32_probe,
-	.remove =	snd_rme32_remove,
 };
 
 module_pci_driver(rme32_driver);
-- 
2.26.2

