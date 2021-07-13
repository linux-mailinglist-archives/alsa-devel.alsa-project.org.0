Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 187323C72A0
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981901758;
	Tue, 13 Jul 2021 16:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981901758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187765;
	bh=bJeooBzmrn4yWHblukwag+ihLGjQto098NhO1OjFHz4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTz9yaPI3fEsw5vd6JJIzulbQ4RRcUJMsBWNvw+/Zc6prKCxRFogc+mGdHgIszRUy
	 BTYOFc+US48XMYt/JOnqlHgLw606WvFjYB9KC/mZA6BAs17mI4BiKcMfUqJzkjzHhq
	 OOz+WVs2CDnfmNhwZSqs7OXIjAh6Uh2zOokYM8fM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28826F80672;
	Tue, 13 Jul 2021 16:31:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C45A7F805AB; Tue, 13 Jul 2021 16:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3905CF804FD
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3905CF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="1YoYHpCu"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="oZyZ+/0m"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 105B5201E4
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g79u6p2iEPWn+mTcvW/LzQPp6XkIOpnWgGbmffefZSk=;
 b=1YoYHpCuR06+bRI19zTljSOQUM5Wq3V1H9zaWgmK6/Hc+p76NGb0tgX3Vpb6ENfJwtujVl
 CvgPGTWR7QlmyhLu7qWKse9e+C1N6pnv39CPgXeNTOSj1PplM0huvvFrmfgoqOOsIZVwyR
 lOxDjG9VKjFQfYRKpAI+Bb8EBeE8vbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186583;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g79u6p2iEPWn+mTcvW/LzQPp6XkIOpnWgGbmffefZSk=;
 b=oZyZ+/0ma6VONhsuFAZsdmZqsw7E5VNqVwlAzYo0qTkyVYXIaHJo4bXHg5gA40STDDyLVR
 r5jOzh8/SV0N+EBQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id F3DE6A3B92;
 Tue, 13 Jul 2021 14:29:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 45/51] ALSA: vx222: Allocate resources with device-managed APIs
Date: Tue, 13 Jul 2021 16:28:51 +0200
Message-Id: <20210713142857.19654-46-tiwai@suse.de>
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

This patch converts the resource management in PCI vx222 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper, and the card object release is
managed now via card->private_free instead of a lowlevel snd_device.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/vx222/vx222.c | 68 +++++++----------------------------------
 1 file changed, 11 insertions(+), 57 deletions(-)

diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index 46a80ef1d481..f48cc20b9e8a 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -100,25 +100,6 @@ static const struct snd_vx_hardware vx222_mic_hw = {
 
 /*
  */
-static int snd_vx222_free(struct vx_core *chip)
-{
-	struct snd_vx222 *vx = to_vx222(chip);
-
-	if (chip->irq >= 0)
-		free_irq(chip->irq, (void*)chip);
-	if (vx->port[0])
-		pci_release_regions(vx->pci);
-	pci_disable_device(vx->pci);
-	return 0;
-}
-
-static int snd_vx222_dev_free(struct snd_device *device)
-{
-	struct vx_core *chip = device->device_data;
-	return snd_vx222_free(chip);
-}
-
-
 static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 			    const struct snd_vx_hardware *hw,
 			    struct snd_vx222 **rchip)
@@ -126,13 +107,10 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	struct vx_core *chip;
 	struct snd_vx222 *vx;
 	int i, err;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_vx222_dev_free,
-	};
 	const struct snd_vx_ops *vx_ops;
 
 	/* enable PCI device */
-	err = pci_enable_device(pci);
+	err = pcim_enable_device(pci);
 	if (err < 0)
 		return err;
 	pci_set_master(pci);
@@ -140,38 +118,26 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	vx_ops = hw->type == VX_TYPE_BOARD ? &vx222_old_ops : &vx222_ops;
 	chip = snd_vx_create(card, hw, vx_ops,
 			     sizeof(struct snd_vx222) - sizeof(struct vx_core));
-	if (! chip) {
-		pci_disable_device(pci);
+	if (!chip)
 		return -ENOMEM;
-	}
 	vx = to_vx222(chip);
 	vx->pci = pci;
 
 	err = pci_request_regions(pci, CARD_NAME);
-	if (err < 0) {
-		snd_vx222_free(chip);
+	if (err < 0)
 		return err;
-	}
 	for (i = 0; i < 2; i++)
 		vx->port[i] = pci_resource_start(pci, i + 1);
 
-	if (request_threaded_irq(pci->irq, snd_vx_irq_handler,
-				 snd_vx_threaded_irq_handler, IRQF_SHARED,
-				 KBUILD_MODNAME, chip)) {
+	if (devm_request_threaded_irq(&pci->dev, pci->irq, snd_vx_irq_handler,
+				      snd_vx_threaded_irq_handler, IRQF_SHARED,
+				      KBUILD_MODNAME, chip)) {
 		dev_err(card->dev, "unable to grab IRQ %d\n", pci->irq);
-		snd_vx222_free(chip);
 		return -EBUSY;
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		snd_vx222_free(chip);
-		return err;
-	}
-
-	*rchip = vx;
 	return 0;
 }
 
@@ -192,8 +158,8 @@ static int snd_vx222_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				0, &card);
 	if (err < 0)
 		return err;
 
@@ -210,10 +176,8 @@ static int snd_vx222_probe(struct pci_dev *pci,
 		break;
 	}
 	err = snd_vx222_create(card, pci, hw, &vx);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	card->private_data = vx;
 	vx->core.ibl.size = ibl[dev];
 
@@ -227,27 +191,18 @@ static int snd_vx222_probe(struct pci_dev *pci,
 #endif
 
 	err = snd_vx_setup_firmware(&vx->core);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 
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
 
-static void snd_vx222_remove(struct pci_dev *pci)
-{
-	snd_card_free(pci_get_drvdata(pci));
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int snd_vx222_suspend(struct device *dev)
 {
@@ -275,7 +230,6 @@ static struct pci_driver vx222_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_vx222_ids,
 	.probe = snd_vx222_probe,
-	.remove = snd_vx222_remove,
 	.driver = {
 		.pm = SND_VX222_PM_OPS,
 	},
-- 
2.26.2

