Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275F3C9AAB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E31571783;
	Thu, 15 Jul 2021 10:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E31571783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337899;
	bh=gNYrnzJBD7oS1I0cMqnEXaic/oz0sKeijbKW5AxDeNs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UQIcH/DjrO5kkzdkA401UzX3LXZp/cXv9FbjEGvYxVdDIq/jZxP/X0Oay+KvqPOTh
	 BvD8K1FElzarvMISPjKbH+pwae0uTEsT+bEAVXd5MQBGEmEVvR0UsS1jqyJdS8DgTl
	 YNq87FfbdHgNVgBds8JRnmfbE5U78AUWnMvzWOtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 480C6F808C5;
	Thu, 15 Jul 2021 10:02:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E35BF80844; Thu, 15 Jul 2021 10:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E1B7F805B6
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E1B7F805B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="jG0yaZpv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="X3D/7SaG"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 682DC22285
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1dr4v6qn4IruHDbmov8fH0fheRl/U9KVdzrtudFX2VU=;
 b=jG0yaZpv6lUdiJ2g528Vvnda7USgtPQxrglT24Dl5E9o1KHC1omn8V/T4ylQKN6T7BNUX4
 Az+bicn812ndip9YxlVAlDNPGYDjIIa/FM83NQL2UnrFOOHg8ebr0C8QbjR76V5mpspxqa
 lCHpsKsgVaUWgs76MdPjh3cjy/CKu5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1dr4v6qn4IruHDbmov8fH0fheRl/U9KVdzrtudFX2VU=;
 b=X3D/7SaGLDyHqTBi3qOof0cllqT1F93z3Vmf26Hl9ZS1gV0Cwll6q7pGRbp1x9v4z0gDUk
 tf1M0bdT816C3hCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 54A63A3BBA;
 Thu, 15 Jul 2021 08:00:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 76/79] ALSA: mpu401: Allocate resources with device-managed
 APIs
Date: Thu, 15 Jul 2021 09:59:38 +0200
Message-Id: <20210715075941.23332-77-tiwai@suse.de>
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

This patch converts the card object management with devres as a clean
up.  The remove callback gets reduced by that.

This should give no user-visible functional changes.

Note that this converts only the mpu401 card driver.  The mpu401_uart
component is still managed with snd_device.  It's for the case where
the mpu401_uart component may be removed dynamically without the
actual device unbind.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mpu401/mpu401.c | 34 +++++-----------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
index d0b55dbb411a..3398aee33baa 100644
--- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -59,8 +59,8 @@ static int snd_mpu401_create(struct device *devptr, int dev,
 		snd_printk(KERN_ERR "the uart_enter option is obsolete; remove it\n");
 
 	*rcard = NULL;
-	err = snd_card_new(devptr, index[dev], id[dev], THIS_MODULE,
-			   0, &card);
+	err = snd_devm_card_new(devptr, index[dev], id[dev], THIS_MODULE,
+				0, &card);
 	if (err < 0)
 		return err;
 	strcpy(card->driver, "MPU-401 UART");
@@ -76,15 +76,11 @@ static int snd_mpu401_create(struct device *devptr, int dev,
 				  irq[dev], NULL);
 	if (err < 0) {
 		printk(KERN_ERR "MPU401 not detected at 0x%lx\n", port[dev]);
-		goto _err;
+		return err;
 	}
 
 	*rcard = card;
 	return 0;
-
- _err:
-	snd_card_free(card);
-	return err;
 }
 
 static int snd_mpu401_probe(struct platform_device *devptr)
@@ -105,25 +101,16 @@ static int snd_mpu401_probe(struct platform_device *devptr)
 	if (err < 0)
 		return err;
 	err = snd_card_register(card);
-	if (err < 0) {
-		snd_card_free(card);
+	if (err < 0)
 		return err;
-	}
 	platform_set_drvdata(devptr, card);
 	return 0;
 }
 
-static int snd_mpu401_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
-	return 0;
-}
-
 #define SND_MPU401_DRIVER	"snd_mpu401"
 
 static struct platform_driver snd_mpu401_driver = {
 	.probe		= snd_mpu401_probe,
-	.remove		= snd_mpu401_remove,
 	.driver		= {
 		.name	= SND_MPU401_DRIVER,
 	},
@@ -184,10 +171,8 @@ static int snd_mpu401_pnp_probe(struct pnp_dev *pnp_dev,
 		if (err < 0)
 			return err;
 		err = snd_card_register(card);
-		if (err < 0) {
-			snd_card_free(card);
+		if (err < 0)
 			return err;
-		}
 		pnp_set_drvdata(pnp_dev, card);
 		snd_mpu401_devices++;
 		++dev;
@@ -196,19 +181,10 @@ static int snd_mpu401_pnp_probe(struct pnp_dev *pnp_dev,
 	return -ENODEV;
 }
 
-static void snd_mpu401_pnp_remove(struct pnp_dev *dev)
-{
-	struct snd_card *card = (struct snd_card *) pnp_get_drvdata(dev);
-
-	snd_card_disconnect(card);
-	snd_card_free_when_closed(card);
-}
-
 static struct pnp_driver snd_mpu401_pnp_driver = {
 	.name = "mpu401",
 	.id_table = snd_mpu401_pnpids,
 	.probe = snd_mpu401_pnp_probe,
-	.remove = snd_mpu401_pnp_remove,
 };
 #else
 static struct pnp_driver snd_mpu401_pnp_driver;
-- 
2.26.2

