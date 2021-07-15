Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8B3C9A98
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097F11731;
	Thu, 15 Jul 2021 10:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097F11731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337613;
	bh=yby3j6Ah7taIr3YMbNzndkc3FnTOj3TR9/1mi5N1/R0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MU1NOADYrSdSBUvbY87WUr+icrZ6tfUoTDwPonT3sjjDQdQ0/H8QTOW5IiljMyTG8
	 CUP5u4d6+rD/BoCj1fjXLXHXGYIWdmxvz3KU1QRPF7nj1xgzyjXoTlBvv9Nwi1yuPp
	 1lgVo66QO60GvRh1IJYQkcJ5CZUDPw7DRF5Ttupg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DC4EF807FC;
	Thu, 15 Jul 2021 10:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48AB0F80799; Thu, 15 Jul 2021 10:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C38CF805A1
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C38CF805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="B71lKg2f"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="46QQ2jkJ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E151A1FD3E
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e22ET7W+EaRYVMpYd47mjS9IHpm75AmsLtIqmXKU1cA=;
 b=B71lKg2fGsOj5VuXDnBBMYHzu7zVacxzXTGH59f9gQPAQoqt+QxW4gVSRIp8Qi1NiLn2ov
 2AG+QL/A648JH7UmAZ9XX12CXamnwr+yvsD7Qgr14EdM/N90HEA4UoYILlNeJuewiQ5Lqg
 lidVUoWJ+JIpVVIVipMsLU55rgmeOrA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e22ET7W+EaRYVMpYd47mjS9IHpm75AmsLtIqmXKU1cA=;
 b=46QQ2jkJUJ4AkC+AeDRjfrXVIU6c17sT3Oqti+09DjJxj2qIgrTR6+j1U8IDw87KsmcPbw
 +LsBjvKyS68uJJBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D96CEA3B9B;
 Thu, 15 Jul 2021 08:00:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 68/79] ALSA: opl3sa2: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:30 +0200
Message-Id: <20210715075941.23332-69-tiwai@suse.de>
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

This patch converts the resource management in ISA opl3sa2 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/opl3sa2.c | 60 +++++++++------------------------------------
 1 file changed, 11 insertions(+), 49 deletions(-)

diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index 6f42f869928c..bad1490a66a0 100644
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -208,7 +208,8 @@ static int snd_opl3sa2_detect(struct snd_card *card)
 	char str[2];
 
 	port = chip->port;
-	chip->res_port = request_region(port, 2, "OPL3-SA control");
+	chip->res_port = devm_request_region(card->dev, port, 2,
+					     "OPL3-SA control");
 	if (!chip->res_port) {
 		snd_printk(KERN_ERR PFX "can't grab port 0x%lx\n", port);
 		return -EBUSY;
@@ -609,14 +610,6 @@ static int snd_opl3sa2_pnp(int dev, struct snd_opl3sa2 *chip,
 }
 #endif /* CONFIG_PNP */
 
-static void snd_opl3sa2_free(struct snd_card *card)
-{
-	struct snd_opl3sa2 *chip = card->private_data;
-	if (chip->irq >= 0)
-		free_irq(chip->irq, card);
-	release_and_free_resource(chip->res_port);
-}
-
 static int snd_opl3sa2_card_new(struct device *pdev, int dev,
 				struct snd_card **cardp)
 {
@@ -624,8 +617,8 @@ static int snd_opl3sa2_card_new(struct device *pdev, int dev,
 	struct snd_opl3sa2 *chip;
 	int err;
 
-	err = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_opl3sa2), &card);
+	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_opl3sa2), &card);
 	if (err < 0)
 		return err;
 	strcpy(card->driver, "OPL3SA2");
@@ -633,7 +626,6 @@ static int snd_opl3sa2_card_new(struct device *pdev, int dev,
 	chip = card->private_data;
 	spin_lock_init(&chip->reg_lock);
 	chip->irq = -1;
-	card->private_free = snd_opl3sa2_free;
 	*cardp = card;
 	return 0;
 }
@@ -658,8 +650,8 @@ static int snd_opl3sa2_probe(struct snd_card *card, int dev)
 	err = snd_opl3sa2_detect(card);
 	if (err < 0)
 		return err;
-	err = request_irq(xirq, snd_opl3sa2_interrupt, 0,
-			  "OPL3-SA2", card);
+	err = devm_request_irq(card->dev, xirq, snd_opl3sa2_interrupt, 0,
+			       "OPL3-SA2", card);
 	if (err) {
 		snd_printk(KERN_ERR PFX "can't grab IRQ %d\n", xirq);
 		return -ENODEV;
@@ -737,25 +729,16 @@ static int snd_opl3sa2_pnp_detect(struct pnp_dev *pdev,
 	if (err < 0)
 		return err;
 	err = snd_opl3sa2_pnp(dev, card->private_data, pdev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_opl3sa2_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pnp_set_drvdata(pdev, card);
 	dev++;
 	return 0;
 }
 
-static void snd_opl3sa2_pnp_remove(struct pnp_dev *pdev)
-{
-	snd_card_free(pnp_get_drvdata(pdev));
-}
-
 #ifdef CONFIG_PM
 static int snd_opl3sa2_pnp_suspend(struct pnp_dev *pdev, pm_message_t state)
 {
@@ -771,7 +754,6 @@ static struct pnp_driver opl3sa2_pnp_driver = {
 	.name = "snd-opl3sa2-pnpbios",
 	.id_table = snd_opl3sa2_pnpbiosids,
 	.probe = snd_opl3sa2_pnp_detect,
-	.remove = snd_opl3sa2_pnp_remove,
 #ifdef CONFIG_PM
 	.suspend = snd_opl3sa2_pnp_suspend,
 	.resume = snd_opl3sa2_pnp_resume,
@@ -803,26 +785,16 @@ static int snd_opl3sa2_pnp_cdetect(struct pnp_card_link *pcard,
 	if (err < 0)
 		return err;
 	err = snd_opl3sa2_pnp(dev, card->private_data, pdev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	err = snd_opl3sa2_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	dev++;
 	return 0;
 }
 
-static void snd_opl3sa2_pnp_cremove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 #ifdef CONFIG_PM
 static int snd_opl3sa2_pnp_csuspend(struct pnp_card_link *pcard, pm_message_t state)
 {
@@ -839,7 +811,6 @@ static struct pnp_card_driver opl3sa2_pnpc_driver = {
 	.name = "snd-opl3sa2-cpnp",
 	.id_table = snd_opl3sa2_pnpids,
 	.probe = snd_opl3sa2_pnp_cdetect,
-	.remove = snd_opl3sa2_pnp_cremove,
 #ifdef CONFIG_PM
 	.suspend = snd_opl3sa2_pnp_csuspend,
 	.resume = snd_opl3sa2_pnp_cresume,
@@ -885,20 +856,12 @@ static int snd_opl3sa2_isa_probe(struct device *pdev,
 	if (err < 0)
 		return err;
 	err = snd_opl3sa2_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	dev_set_drvdata(pdev, card);
 	return 0;
 }
 
-static void snd_opl3sa2_isa_remove(struct device *devptr,
-				  unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
-}
-
 #ifdef CONFIG_PM
 static int snd_opl3sa2_isa_suspend(struct device *dev, unsigned int n,
 				   pm_message_t state)
@@ -917,7 +880,6 @@ static int snd_opl3sa2_isa_resume(struct device *dev, unsigned int n)
 static struct isa_driver snd_opl3sa2_isa_driver = {
 	.match		= snd_opl3sa2_isa_match,
 	.probe		= snd_opl3sa2_isa_probe,
-	.remove		= snd_opl3sa2_isa_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_opl3sa2_isa_suspend,
 	.resume		= snd_opl3sa2_isa_resume,
-- 
2.26.2

