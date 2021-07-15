Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E28D33C9A9C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F0B6170B;
	Thu, 15 Jul 2021 10:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F0B6170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337699;
	bh=NsTOi7A7XrHjdiN0lE/+CUawVXb9U9dCVSEoPo/7Lxw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfqXzSuUphPw8I4iP6hUymxghK9Xep78FP3KNQreJFecboML3OPixw/nWLZk5lliK
	 iOC6mXyK+xJilgpIysXRYB5Bvbfrf+380vZ492rAYEoVg2Ur7+71BlojlI7HeCC+aW
	 stuf2yHwcRk+VP5LaL6PuIYuoOdBlombafMzfnOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A850EF805B6;
	Thu, 15 Jul 2021 10:01:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F38F807DC; Thu, 15 Jul 2021 10:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E02AF805B0
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E02AF805B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xefNSzcc"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="WA5BMWGD"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 5809622855
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLbHE8gL3568LNDNyp83CCjAj1qzs/+1vwUVbQlIa84=;
 b=xefNSzccXejLvPuF6MhN4AO8p4+nuzzGs6CBhSywOAZH38EpHy/2GVOPJD1a/gWrQFTwan
 QADp1CZvdPfy2FllIqNQYBcT0aos1Lz1FyGfWMWYojysd/5/wMO5Sf8I8yXE+KEXfMIxpU
 br2BgmaxgwMxW3F0dfZdr/tPtlV2Fd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLbHE8gL3568LNDNyp83CCjAj1qzs/+1vwUVbQlIa84=;
 b=WA5BMWGDWWVBceb+szFP03LbI8oNfYWmrCS3u+zf19RCaqziw2U+NkUU7+8n++5u6ygw2F
 yNOlZqLvJANXXuCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 45421A3B8F;
 Thu, 15 Jul 2021 08:00:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 71/79] ALSA: wavefront: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:33 +0200
Message-Id: <20210715075941.23332-72-tiwai@suse.de>
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

This patch converts the resource management in ISA wavefront driver
with devres as a clean up.  Each manual resource management is
converted with the corresponding devres helper.  The remove callback
became superfluous and dropped.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wavefront/wavefront.c | 46 +++++++--------------------------
 1 file changed, 9 insertions(+), 37 deletions(-)

diff --git a/sound/isa/wavefront/wavefront.c b/sound/isa/wavefront/wavefront.c
index dfdeaf7b6bf4..e6e46a0266b0 100644
--- a/sound/isa/wavefront/wavefront.c
+++ b/sound/isa/wavefront/wavefront.c
@@ -308,18 +308,6 @@ static struct snd_rawmidi *snd_wavefront_new_midi(struct snd_card *card,
 	return rmidi;
 }
 
-static void
-snd_wavefront_free(struct snd_card *card)
-{
-	snd_wavefront_card_t *acard = (snd_wavefront_card_t *)card->private_data;
-	
-	if (acard) {
-		release_and_free_resource(acard->wavefront.res_base);
-		if (acard->wavefront.irq > 0)
-			free_irq(acard->wavefront.irq, (void *)acard);
-	}
-}
-
 static int snd_wavefront_card_new(struct device *pdev, int dev,
 				  struct snd_card **cardp)
 {
@@ -327,8 +315,8 @@ static int snd_wavefront_card_new(struct device *pdev, int dev,
 	snd_wavefront_card_t *acard;
 	int err;
 
-	err = snd_card_new(pdev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(snd_wavefront_card_t), &card);
+	err = snd_devm_card_new(pdev, index[dev], id[dev], THIS_MODULE,
+				sizeof(snd_wavefront_card_t), &card);
 	if (err < 0)
 		return err;
 
@@ -339,7 +327,6 @@ static int snd_wavefront_card_new(struct device *pdev, int dev,
 	spin_lock_init(&acard->wavefront.midi.open);
 	spin_lock_init(&acard->wavefront.midi.virtual);
 	acard->wavefront.card = card;
-	card->private_free = snd_wavefront_free;
 
 	*cardp = card;
 	return 0;
@@ -394,15 +381,17 @@ snd_wavefront_probe (struct snd_card *card, int dev)
 
 	/* ------- ICS2115 Wavetable synth ------- */
 
-	acard->wavefront.res_base = request_region(ics2115_port[dev], 16,
-						   "ICS2115");
+	acard->wavefront.res_base =
+		devm_request_region(card->dev, ics2115_port[dev], 16,
+				    "ICS2115");
 	if (acard->wavefront.res_base == NULL) {
 		snd_printk(KERN_ERR "unable to grab ICS2115 i/o region 0x%lx-0x%lx\n",
 			   ics2115_port[dev], ics2115_port[dev] + 16 - 1);
 		return -EBUSY;
 	}
-	if (request_irq(ics2115_irq[dev], snd_wavefront_ics2115_interrupt,
-			0, "ICS2115", acard)) {
+	if (devm_request_irq(card->dev, ics2115_irq[dev],
+			     snd_wavefront_ics2115_interrupt,
+			     0, "ICS2115", acard)) {
 		snd_printk(KERN_ERR "unable to use ICS2115 IRQ %d\n", ics2115_irq[dev]);
 		return -EBUSY;
 	}
@@ -556,27 +545,18 @@ static int snd_wavefront_isa_probe(struct device *pdev,
 	if (err < 0)
 		return err;
 	err = snd_wavefront_probe(card, dev);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	
 	dev_set_drvdata(pdev, card);
 	return 0;
 }
 
-static void snd_wavefront_isa_remove(struct device *devptr,
-				    unsigned int dev)
-{
-	snd_card_free(dev_get_drvdata(devptr));
-}
-
 #define DEV_NAME "wavefront"
 
 static struct isa_driver snd_wavefront_driver = {
 	.match		= snd_wavefront_isa_match,
 	.probe		= snd_wavefront_isa_probe,
-	.remove		= snd_wavefront_isa_remove,
 	/* FIXME: suspend, resume */
 	.driver		= {
 		.name	= DEV_NAME
@@ -606,7 +586,6 @@ static int snd_wavefront_pnp_detect(struct pnp_card_link *pcard,
 	if (snd_wavefront_pnp (dev, card->private_data, pcard, pid) < 0) {
 		if (cs4232_pcm_port[dev] == SNDRV_AUTO_PORT) {
 			snd_printk (KERN_ERR "isapnp detection failed\n");
-			snd_card_free (card);
 			return -ENODEV;
 		}
 	}
@@ -620,18 +599,11 @@ static int snd_wavefront_pnp_detect(struct pnp_card_link *pcard,
 	return 0;
 }
 
-static void snd_wavefront_pnp_remove(struct pnp_card_link *pcard)
-{
-	snd_card_free(pnp_get_card_drvdata(pcard));
-	pnp_set_card_drvdata(pcard, NULL);
-}
-
 static struct pnp_card_driver wavefront_pnpc_driver = {
 	.flags		= PNP_DRIVER_RES_DISABLE,
 	.name		= "wavefront",
 	.id_table	= snd_wavefront_pnpids,
 	.probe		= snd_wavefront_pnp_detect,
-	.remove		= snd_wavefront_pnp_remove,
 	/* FIXME: suspend,resume */
 };
 
-- 
2.26.2

