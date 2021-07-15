Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10A3C9A32
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:09:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2159216C7;
	Thu, 15 Jul 2021 10:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2159216C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336599;
	bh=+zZ82PvAwfuGDL+lk+bxHefvcy6qWb9WRLvqm6rUJtQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OVm0bReirb6HRJ89P0jONHyTaoHjTH4hsMgmDhz17nnrS6fVpWrvQ7P7TkqSnW8+c
	 OiFebZTliuWAQFq+2qFs7A+Q5hkYCZeU8PznDgURsJPoZ2KpZGTWDQu0UQ2yYYzUYR
	 MLDCpf2vnIzbiiU6f8tDqunUg6EhANX2kXE5zWrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24CF8F805FE;
	Thu, 15 Jul 2021 10:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D33B2F805DA; Thu, 15 Jul 2021 10:00:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735ECF80095
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735ECF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dWnJsfg3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="mCX0Dnsm"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 11BA922859
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPwkniyc4i2ebrNRn1DxMXVIXeRB3qPV1y4v5jAw8Dk=;
 b=dWnJsfg3JmRzJzSLIi2jEY8O/812fCccOlTYQrcWRRY9dUiYM493mYM1H1t8mg2U3bXIxq
 lpbXUI6piWq7nHP/N7G+tNtAXLRC4t1JFL9J0kdzo7p5YACYpWVtXOgNHM3Vmyey/8ZkXh
 66RdXKcuOR0sfhWY/3BooldtZh7bQ4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPwkniyc4i2ebrNRn1DxMXVIXeRB3qPV1y4v5jAw8Dk=;
 b=mCX0Dnsm1bONOJzwy0QkJJj+NHn5x8/+j4FzrYJj1L+li63Px3pjkJS3xJiTru0Lm7Nbbm
 dQjBH8zd+PTBLmDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F3B88A3B9B;
 Thu, 15 Jul 2021 08:00:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 22/79] ALSA: rme96: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:58:44 +0200
Message-Id: <20210715075941.23332-23-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
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

This patch converts the resource management in PCI rme96 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme96.c | 57 ++++++++++++-----------------------------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index fc7ac077559c..8fc811504920 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1562,33 +1562,17 @@ static const struct snd_pcm_ops snd_rme96_capture_adat_ops = {
 };
 
 static void
-snd_rme96_free(void *private_data)
+snd_rme96_free(struct rme96 *rme96)
 {
-	struct rme96 *rme96 = (struct rme96 *)private_data;
-
-	if (!rme96)
-	        return;
-
 	if (rme96->irq >= 0) {
 		snd_rme96_trigger(rme96, RME96_STOP_BOTH);
 		rme96->areg &= ~RME96_AR_DAC_EN;
 		writel(rme96->areg, rme96->iobase + RME96_IO_ADDITIONAL_REG);
-		free_irq(rme96->irq, (void *)rme96);
-		rme96->irq = -1;
-	}
-	if (rme96->iobase) {
-		iounmap(rme96->iobase);
-		rme96->iobase = NULL;
-	}
-	if (rme96->port) {
-		pci_release_regions(rme96->pci);
-		rme96->port = 0;
 	}
 #ifdef CONFIG_PM_SLEEP
 	vfree(rme96->playback_suspend_buffer);
 	vfree(rme96->capture_suspend_buffer);
 #endif
-	pci_disable_device(rme96->pci);
 }
 
 static void
@@ -1614,7 +1598,7 @@ snd_rme96_create(struct rme96 *rme96)
 	rme96->irq = -1;
 	spin_lock_init(&rme96->lock);
 
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 
@@ -1623,16 +1607,16 @@ snd_rme96_create(struct rme96 *rme96)
 		return err;
 	rme96->port = pci_resource_start(rme96->pci, 0);
 
-	rme96->iobase = ioremap(rme96->port, RME96_IO_SIZE);
+	rme96->iobase = devm_ioremap(&pci->dev, rme96->port, RME96_IO_SIZE);
 	if (!rme96->iobase) {
 		dev_err(rme96->card->dev,
 			"unable to remap memory region 0x%lx-0x%lx\n",
 			rme96->port, rme96->port + RME96_IO_SIZE - 1);
-		return -ENOMEM;
+		return -EBUSY;
 	}
 
-	if (request_irq(pci->irq, snd_rme96_interrupt, IRQF_SHARED,
-			KBUILD_MODNAME, rme96)) {
+	if (devm_request_irq(&pci->dev, pci->irq, snd_rme96_interrupt,
+			     IRQF_SHARED, KBUILD_MODNAME, rme96)) {
 		dev_err(rme96->card->dev, "unable to grab IRQ %d\n", pci->irq);
 		return -EBUSY;
 	}
@@ -2462,8 +2446,8 @@ snd_rme96_probe(struct pci_dev *pci,
 		dev++;
 		return -ENOENT;
 	}
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct rme96), &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*rme96), &card);
 	if (err < 0)
 		return err;
 	card->private_free = snd_rme96_card_free;
@@ -2472,19 +2456,15 @@ snd_rme96_probe(struct pci_dev *pci,
 	rme96->pci = pci;
 	err = snd_rme96_create(rme96);
 	if (err)
-		goto free_card;
+		return err;
 	
 #ifdef CONFIG_PM_SLEEP
 	rme96->playback_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
-	if (!rme96->playback_suspend_buffer) {
-		err = -ENOMEM;
-		goto free_card;
-	}
+	if (!rme96->playback_suspend_buffer)
+		return -ENOMEM;
 	rme96->capture_suspend_buffer = vmalloc(RME96_BUFFER_SIZE);
-	if (!rme96->capture_suspend_buffer) {
-		err = -ENOMEM;
-		goto free_card;
-	}
+	if (!rme96->capture_suspend_buffer)
+		return -ENOMEM;
 #endif
 
 	strcpy(card->driver, "Digi96");
@@ -2511,26 +2491,17 @@ snd_rme96_probe(struct pci_dev *pci,
 		rme96->port, rme96->irq);
 	err = snd_card_register(card);
 	if (err)
-		goto free_card;
+		return err;
 
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
-free_card:
-	snd_card_free(card);
-	return err;
-}
-
-static void snd_rme96_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
 }
 
 static struct pci_driver rme96_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_rme96_ids,
 	.probe = snd_rme96_probe,
-	.remove = snd_rme96_remove,
 	.driver = {
 		.pm = RME96_PM_OPS,
 	},
-- 
2.26.2

