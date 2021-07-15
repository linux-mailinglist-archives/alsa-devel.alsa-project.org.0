Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84F43C9A82
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 639C61762;
	Thu, 15 Jul 2021 10:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 639C61762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337488;
	bh=zRpXtnL6OQE2O9yvL3oR1On/zIVyFWrX3maEbhuHhbM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tylnD42dXgJkfgFPDoTAL1wPLai/HccED4Rd+B9qgtTaLcDV0YDCqQXRXC8w259aG
	 dPXdQEUN8PojtVYie4Spl3XicZQ61IKBn+AWLFknQ1PaaFQIMwRztvVURB6eSQr5GY
	 srIDEn3cRbNKvR3f79DWPYcLJ0QUMrHlHXGhTXgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43350F80798;
	Thu, 15 Jul 2021 10:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE5EAF80751; Thu, 15 Jul 2021 10:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C28DF8056F
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C28DF8056F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dO6elzCJ"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fImqLQ8S"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 79FE81FDEA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoygPP8H52ZENTI7HiYROdAhiB2nZYpwxd60DNX2ceI=;
 b=dO6elzCJuXWTP3K/zUoSOOPuhEWHxzkZAci9jnLbUOQA8kmFBVWuygKQFiKGGvWkY179XX
 TvM7P1Sgzrs7kiY111YFQd9sTJe3PCHQRtxZ1nsaI7mmUmkmptqbO9nnQFdUYi+4dhqYgB
 ISJ4usWKbmL6dXI0TpUBHncD2P6R3/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoygPP8H52ZENTI7HiYROdAhiB2nZYpwxd60DNX2ceI=;
 b=fImqLQ8S8RGA1DGW+7+xQTWnuTdCDYqxDTLq6+UKgXhb/R2JBIVpzrAniSFYJ4GEYAI6xf
 7eee5b5ss94FEHCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 4EEB2A3B8F;
 Thu, 15 Jul 2021 08:00:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 60/79] ALSA: cmi8330: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:22 +0200
Message-Id: <20210715075941.23332-61-tiwai@suse.de>
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

This patch converts the resource management in ISA cmi8330 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.  The remove callback became
superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8330.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/sound/isa/cmi8330.c b/sound/isa/cmi8330.c
index ef6d0a20efd8..f209b16c5229 100644
--- a/sound/isa/cmi8330.c
+++ b/sound/isa/cmi8330.c
@@ -507,8 +507,8 @@ static int snd_cmi8330_card_new(struct device *pdev, int dev,
 	struct snd_cmi8330 *acard;
 	int err;
 
-	err = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_cmi8330), &card);
+	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_cmi8330), &card);
 	if (err < 0) {
 		snd_printk(KERN_ERR PFX "could not get a new card\n");
 		return err;
@@ -629,20 +629,12 @@ static int snd_cmi8330_isa_probe(struct device *pdev,
 	if (err < 0)
 		return err;
 	err = snd_cmi8330_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	dev_set_drvdata(pdev, card);
 	return 0;
 }
 
-static void snd_cmi8330_isa_remove(struct device *devptr,
-				  unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
-}
-
 #ifdef CONFIG_PM
 static int snd_cmi8330_isa_suspend(struct device *dev, unsigned int n,
 				   pm_message_t state)
@@ -661,7 +653,6 @@ static int snd_cmi8330_isa_resume(struct device *dev, unsigned int n)
 static struct isa_driver snd_cmi8330_driver = {
 	.match		= snd_cmi8330_isa_match,
 	.probe		= snd_cmi8330_isa_probe,
-	.remove		= snd_cmi8330_isa_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_cmi8330_isa_suspend,
 	.resume		= snd_cmi8330_isa_resume,
@@ -693,25 +684,16 @@ static int snd_cmi8330_pnp_detect(struct pnp_card_link *pcard,
 	res = snd_cmi8330_pnp(dev, card->private_data, pcard, pid);
 	if (res < 0) {
 		snd_printk(KERN_ERR PFX "PnP detection failed\n");
-		snd_card_free(card);
 		return res;
 	}
 	res = snd_cmi8330_probe(card, dev);
-	if (res < 0) {
-		snd_card_free(card);
+	if (res < 0)
 		return res;
-	}
 	pnp_set_card_drvdata(pcard, card);
 	dev++;
 	return 0;
 }
 
-static void snd_cmi8330_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 #ifdef CONFIG_PM
 static int snd_cmi8330_pnp_suspend(struct pnp_card_link *pcard, pm_message_t state)
 {
@@ -729,7 +711,6 @@ static struct pnp_card_driver cmi8330_pnpc_driver = {
 	.name = "cmi8330",
 	.id_table = snd_cmi8330_pnpids,
 	.probe = snd_cmi8330_pnp_detect,
-	.remove = snd_cmi8330_pnp_remove,
 #ifdef CONFIG_PM
 	.suspend	= snd_cmi8330_pnp_suspend,
 	.resume		= snd_cmi8330_pnp_resume,
-- 
2.26.2

