Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0FC3C9A88
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 742861731;
	Thu, 15 Jul 2021 10:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 742861731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337528;
	bh=f8Exp9nQ4/RjdzLrHagW/ojVbJAx7q9RxNf+Gs97iRo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0VHuDDOVl0BVIS8sISiKqoXG3sWxecGbnmdNbeVQ5gIhlovHHOU1zh7j2rsMsXHj
	 56puiXcqXCKWfAQj17D5kfD2KRrLKOv9X21Jo1eZhUjcqhzS+Bx6IcErnLn7q2KY/u
	 5pgMpQnEVfl+ozy7EpW5VvxyJjutzbMdqBCAP698=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8455F8079B;
	Thu, 15 Jul 2021 10:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C9FF80752; Thu, 15 Jul 2021 10:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4678F80571
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4678F80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="l6dx8Lbc"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0sRH6ry/"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id BD3031FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2bGx86bFHXrSseO5QPIpD1LTrmxR/AYBno1JEt8gXo=;
 b=l6dx8Lbc1dSanfXeSqIY5CmxOQ+DnVdda2sLrYVd1SZ01b9HpdEOqSk4TJuM85ZO0S2hk1
 0aMl64rC8VWIiIbftOGCqotaZX85VKdokvX6uw1WXMWRBwqA6ZUBSg5oHkDqAtB2j/apni
 l4jD+8HUr2jKRNW1kGWK8Iyx96LydZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2bGx86bFHXrSseO5QPIpD1LTrmxR/AYBno1JEt8gXo=;
 b=0sRH6ry/TBfi0wu8t4hZoLo3JtSMaOv4mzUccwReJ65QP4vf2QxrCSUF4zdYxZo8Qp2uWL
 JL3dqqmcAlkhJPDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B64EBA3B8F;
 Thu, 15 Jul 2021 08:00:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 61/79] ALSA: cs423x: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:23 +0200
Message-Id: <20210715075941.23332-62-tiwai@suse.de>
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

This patch converts the resource management in ISA cs423x drivers with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cs423x/cs4231.c | 21 +++++-----------
 sound/isa/cs423x/cs4236.c | 52 ++++++---------------------------------
 2 files changed, 13 insertions(+), 60 deletions(-)

diff --git a/sound/isa/cs423x/cs4231.c b/sound/isa/cs423x/cs4231.c
index ec054b929214..1e8923385366 100644
--- a/sound/isa/cs423x/cs4231.c
+++ b/sound/isa/cs423x/cs4231.c
@@ -79,20 +79,20 @@ static int snd_cs4231_probe(struct device *dev, unsigned int n)
 	struct snd_wss *chip;
 	int error;
 
-	error = snd_card_new(dev, index[n], id[n], THIS_MODULE, 0, &card);
+	error = snd_devm_card_new(dev, index[n], id[n], THIS_MODULE, 0, &card);
 	if (error < 0)
 		return error;
 
 	error = snd_wss_create(card, port[n], -1, irq[n], dma1[n], dma2[n],
 			WSS_HW_DETECT, 0, &chip);
 	if (error < 0)
-		goto out;
+		return error;
 
 	card->private_data = chip;
 
 	error = snd_wss_pcm(chip, 0);
 	if (error < 0)
-		goto out;
+		return error;
 
 	strscpy(card->driver, "CS4231", sizeof(card->driver));
 	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
@@ -108,11 +108,11 @@ static int snd_cs4231_probe(struct device *dev, unsigned int n)
 
 	error = snd_wss_mixer(chip);
 	if (error < 0)
-		goto out;
+		return error;
 
 	error = snd_wss_timer(chip, 0);
 	if (error < 0)
-		goto out;
+		return error;
 
 	if (mpu_port[n] > 0 && mpu_port[n] != SNDRV_AUTO_PORT) {
 		if (mpu_irq[n] == SNDRV_AUTO_IRQ)
@@ -125,18 +125,10 @@ static int snd_cs4231_probe(struct device *dev, unsigned int n)
 
 	error = snd_card_register(card);
 	if (error < 0)
-		goto out;
+		return error;
 
 	dev_set_drvdata(dev, card);
 	return 0;
-
-out:	snd_card_free(card);
-	return error;
-}
-
-static void snd_cs4231_remove(struct device *dev, unsigned int n)
-{
-	snd_card_free(dev_get_drvdata(dev));
 }
 
 #ifdef CONFIG_PM
@@ -164,7 +156,6 @@ static int snd_cs4231_resume(struct device *dev, unsigned int n)
 static struct isa_driver snd_cs4231_driver = {
 	.match		= snd_cs4231_match,
 	.probe		= snd_cs4231_probe,
-	.remove		= snd_cs4231_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_cs4231_suspend,
 	.resume		= snd_cs4231_resume,
diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index 0b7fd17f8ecc..b6bdebd9ef27 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -76,7 +76,6 @@ static int pnp_registered;
 
 struct snd_card_cs4236 {
 	struct snd_wss *chip;
-	struct resource *res_sb_port;
 #ifdef CONFIG_PNP
 	struct pnp_dev *wss;
 	struct pnp_dev *ctrl;
@@ -309,24 +308,16 @@ static int snd_card_cs423x_pnpc(int dev, struct snd_card_cs4236 *acard,
 #define is_isapnp_selected(dev)		0
 #endif
 
-static void snd_card_cs4236_free(struct snd_card *card)
-{
-	struct snd_card_cs4236 *acard = card->private_data;
-
-	release_and_free_resource(acard->res_sb_port);
-}
-
 static int snd_cs423x_card_new(struct device *pdev, int dev,
 			       struct snd_card **cardp)
 {
 	struct snd_card *card;
 	int err;
 
-	err = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_card_cs4236), &card);
+	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_card_cs4236), &card);
 	if (err < 0)
 		return err;
-	card->private_free = snd_card_cs4236_free;
 	*cardp = card;
 	return 0;
 }
@@ -340,8 +331,8 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 
 	acard = card->private_data;
 	if (sb_port[dev] > 0 && sb_port[dev] != SNDRV_AUTO_PORT) {
-		acard->res_sb_port = request_region(sb_port[dev], 16, IDENT " SB");
-		if (!acard->res_sb_port) {
+		if (!devm_request_region(card->dev, sb_port[dev], 16,
+					 IDENT " SB")) {
 			printk(KERN_ERR IDENT ": unable to register SB port at 0x%lx\n", sb_port[dev]);
 			return -EBUSY;
 		}
@@ -448,21 +439,12 @@ static int snd_cs423x_isa_probe(struct device *pdev,
 	if (err < 0)
 		return err;
 	err = snd_cs423x_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
-
 	dev_set_drvdata(pdev, card);
 	return 0;
 }
 
-static void snd_cs423x_isa_remove(struct device *pdev,
-				 unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(pdev));
-}
-
 #ifdef CONFIG_PM
 static int snd_cs423x_suspend(struct snd_card *card)
 {
@@ -495,7 +477,6 @@ static int snd_cs423x_isa_resume(struct device *dev, unsigned int n)
 static struct isa_driver cs423x_isa_driver = {
 	.match		= snd_cs423x_isa_match,
 	.probe		= snd_cs423x_isa_probe,
-	.remove		= snd_cs423x_isa_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_cs423x_isa_suspend,
 	.resume		= snd_cs423x_isa_resume,
@@ -539,24 +520,16 @@ static int snd_cs423x_pnpbios_detect(struct pnp_dev *pdev,
 	err = snd_card_cs423x_pnp(dev, card->private_data, pdev, cdev);
 	if (err < 0) {
 		printk(KERN_ERR "PnP BIOS detection failed for " IDENT "\n");
-		snd_card_free(card);
 		return err;
 	}
 	err = snd_cs423x_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pnp_set_drvdata(pdev, card);
 	dev++;
 	return 0;
 }
 
-static void snd_cs423x_pnp_remove(struct pnp_dev *pdev)
-{
-	snd_card_free(pnp_get_drvdata(pdev));
-}
-
 #ifdef CONFIG_PM
 static int snd_cs423x_pnp_suspend(struct pnp_dev *pdev, pm_message_t state)
 {
@@ -573,7 +546,6 @@ static struct pnp_driver cs423x_pnp_driver = {
 	.name = "cs423x-pnpbios",
 	.id_table = snd_cs423x_pnpbiosids,
 	.probe = snd_cs423x_pnpbios_detect,
-	.remove = snd_cs423x_pnp_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_cs423x_pnp_suspend,
 	.resume		= snd_cs423x_pnp_resume,
@@ -601,25 +573,16 @@ static int snd_cs423x_pnpc_detect(struct pnp_card_link *pcard,
 	if (res < 0) {
 		printk(KERN_ERR "isapnp detection failed and probing for " IDENT
 		       " is not supported\n");
-		snd_card_free(card);
 		return res;
 	}
 	res = snd_cs423x_probe(card, dev);
-	if (res < 0) {
-		snd_card_free(card);
+	if (res < 0)
 		return res;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	dev++;
 	return 0;
 }
 
-static void snd_cs423x_pnpc_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 #ifdef CONFIG_PM
 static int snd_cs423x_pnpc_suspend(struct pnp_card_link *pcard, pm_message_t state)
 {
@@ -637,7 +600,6 @@ static struct pnp_card_driver cs423x_pnpc_driver = {
 	.name = CS423X_ISAPNP_DRIVER,
 	.id_table = snd_cs423x_pnpids,
 	.probe = snd_cs423x_pnpc_detect,
-	.remove = snd_cs423x_pnpc_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_cs423x_pnpc_suspend,
 	.resume		= snd_cs423x_pnpc_resume,
-- 
2.26.2

