Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F01402648
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 11:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157791720;
	Tue,  7 Sep 2021 11:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157791720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631007658;
	bh=A+rqMU4UFzlDLqT5AEop/LxhrkFU+3nXpdjjoUKhDpM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jaO57IwyBMdYDpUkbyJraKipybRMd9JzEBFcI+qxm5pHxXEKLJ70dxlxVe0WFjOeg
	 Yf7TG1jrgry83f4JSy1gvExIRgd9merw1gVNOfMwA5mmRF8J/Mdtv8Dz9+MxhcRERC
	 kW7vSs9X9eDmlLPOyqE9236WyF9FQJv9N2+FQ3QA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9599F80253;
	Tue,  7 Sep 2021 11:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BAF9F80253; Tue,  7 Sep 2021 11:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07685F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 11:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07685F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="W00jGP+S"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="d+PSTBo2"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2F23221F3C
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631007572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/9oSBfCpjgBic6CPFIs2ZPIx+7VweEL360NsA12hB5Y=;
 b=W00jGP+SEGvuJb1kV68lbMOjkNcjLCNf+/+r9+caDByTwcKUHU+kFhJQeIopzfNhetM6tP
 3TTsACTzwhKyydfhN2WhTCPRGfGSAqNT6GoCW3GJzV1GTi84DFPr/ZU9lXmr1I1ngnr915
 Cc4B12dc/RCcPkbxh1G6nHo7Iktf//0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631007572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/9oSBfCpjgBic6CPFIs2ZPIx+7VweEL360NsA12hB5Y=;
 b=d+PSTBo2y6upVg12lM0j4MgYgFgfhf50SxVWhwOMO2UvS00CJkxlDbdmk1017aQi/LnLWZ
 VBISmsm8cIn6b+BA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 29787A3B89;
 Tue,  7 Sep 2021 09:39:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: gus: Fix repeated probes of snd_gus_create()
Date: Tue,  7 Sep 2021 11:39:29 +0200
Message-Id: <20210907093930.29009-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

GUS card object may be repeatedly probed for the legacy ISA devices,
and the behavior doesn't fit with the devres resource management.

Revert partially back to the classical way for the snd_gus_card
object, so that the repeated calls of snd_gus_create() are allowed.

Fixes: 5b88da3c800f ("ALSA: gus: Allocate resources with device-managed APIs")
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/gus/gus_main.c | 44 ++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/sound/isa/gus/gus_main.c b/sound/isa/gus/gus_main.c
index ae1e2542ee4a..3b46490271fe 100644
--- a/sound/isa/gus/gus_main.c
+++ b/sound/isa/gus/gus_main.c
@@ -87,10 +87,24 @@ static void snd_gus_init_control(struct snd_gus_card *gus)
 
 static int snd_gus_free(struct snd_gus_card *gus)
 {
-	if (gus->gf1.res_port2) {
-		snd_gf1_stop(gus);
-		snd_gus_init_dma_irq(gus, 0);
+	if (gus->gf1.res_port2 == NULL)
+		goto __hw_end;
+	snd_gf1_stop(gus);
+	snd_gus_init_dma_irq(gus, 0);
+      __hw_end:
+	release_and_free_resource(gus->gf1.res_port1);
+	release_and_free_resource(gus->gf1.res_port2);
+	if (gus->gf1.irq >= 0)
+		free_irq(gus->gf1.irq, (void *) gus);
+	if (gus->gf1.dma1 >= 0) {
+		disable_dma(gus->gf1.dma1);
+		free_dma(gus->gf1.dma1);
 	}
+	if (!gus->equal_dma && gus->gf1.dma2 >= 0) {
+		disable_dma(gus->gf1.dma2);
+		free_dma(gus->gf1.dma2);
+	}
+	kfree(gus);
 	return 0;
 }
 
@@ -116,7 +130,7 @@ int snd_gus_create(struct snd_card *card,
 	};
 
 	*rgus = NULL;
-	gus = devm_kzalloc(card->dev, sizeof(*gus), GFP_KERNEL);
+	gus = kzalloc(sizeof(*gus), GFP_KERNEL);
 	if (gus == NULL)
 		return -ENOMEM;
 	spin_lock_init(&gus->reg_lock);
@@ -142,33 +156,35 @@ int snd_gus_create(struct snd_card *card,
 	gus->gf1.reg_timerctrl = GUSP(gus, TIMERCNTRL);
 	gus->gf1.reg_timerdata = GUSP(gus, TIMERDATA);
 	/* allocate resources */
-	gus->gf1.res_port1 = devm_request_region(card->dev, port, 16,
-						 "GUS GF1 (Adlib/SB)");
+	gus->gf1.res_port1 = request_region(port, 16, "GUS GF1 (Adlib/SB)");
 	if (!gus->gf1.res_port1) {
 		snd_printk(KERN_ERR "gus: can't grab SB port 0x%lx\n", port);
+		snd_gus_free(gus);
 		return -EBUSY;
 	}
-	gus->gf1.res_port2 = devm_request_region(card->dev, port + 0x100, 12,
-						 "GUS GF1 (Synth)");
+	gus->gf1.res_port2 = request_region(port + 0x100, 12, "GUS GF1 (Synth)");
 	if (!gus->gf1.res_port2) {
 		snd_printk(KERN_ERR "gus: can't grab synth port 0x%lx\n", port + 0x100);
+		snd_gus_free(gus);
 		return -EBUSY;
 	}
-	if (irq >= 0 && devm_request_irq(card->dev, irq, snd_gus_interrupt, 0,
-					 "GUS GF1", (void *) gus)) {
+	if (irq >= 0 && request_irq(irq, snd_gus_interrupt, 0, "GUS GF1", (void *) gus)) {
 		snd_printk(KERN_ERR "gus: can't grab irq %d\n", irq);
+		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	gus->gf1.irq = irq;
 	card->sync_irq = irq;
-	if (snd_devm_request_dma(card->dev, dma1, "GUS - 1")) {
+	if (request_dma(dma1, "GUS - 1")) {
 		snd_printk(KERN_ERR "gus: can't grab DMA1 %d\n", dma1);
+		snd_gus_free(gus);
 		return -EBUSY;
 	}
 	gus->gf1.dma1 = dma1;
 	if (dma2 >= 0 && dma1 != dma2) {
-		if (snd_devm_request_dma(card->dev, dma2, "GUS - 2")) {
+		if (request_dma(dma2, "GUS - 2")) {
 			snd_printk(KERN_ERR "gus: can't grab DMA2 %d\n", dma2);
+			snd_gus_free(gus);
 			return -EBUSY;
 		}
 		gus->gf1.dma2 = dma2;
@@ -193,8 +209,10 @@ int snd_gus_create(struct snd_card *card,
 	gus->gf1.volume_ramp = 25;
 	gus->gf1.smooth_pan = 1;
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, gus, &ops);
-	if (err < 0)
+	if (err < 0) {
+		snd_gus_free(gus);
 		return err;
+	}
 	*rgus = gus;
 	return 0;
 }
-- 
2.26.2

