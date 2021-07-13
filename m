Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E353C7298
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F65176C;
	Tue, 13 Jul 2021 16:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F65176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187620;
	bh=1nXVLbJizRCzbqWhJsYwntzhTvFTPeQw0VyNJjq0Xc0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYxSpulovsshQ3fGEIAePa4uj1WJkXgvDDPRs8tqBvRo5oOelmrWOl4iUm4IowdVK
	 zXjNbK95mw96LAXMvNhLvxxOWMaNfjQxzYDQvp6Dc6ppsF4uc8zuMhaSBJI/UD+96l
	 sh/mZQjizf3zpXcKrkWwjVkRzrl9kGq0ntYRYw10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AACE7F8062E;
	Tue, 13 Jul 2021 16:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3529F8052D; Tue, 13 Jul 2021 16:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A88ADF80551
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A88ADF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="i7WyzWTk"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="hyE9EUJZ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 82ECB22837
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eW8LFcUjjkXO6ltupu8MlVuWejyBsrIe+N/GJDppXF0=;
 b=i7WyzWTkNDy9EWT5e6a/lwJH96WimDfnMLJ4KnQTAN6KxWlPQTV2qtIaEzA0W8KQg/o8s+
 hznTKP4MkWm2Eqiac8VvJa87tPK8hcGWHDIHiC+/ywbHZ/3vTU4QhlL/bHn+cDgrbIXsCv
 jsOoAmEG5dDaeAcxJKbqlZ55+6api8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186582;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eW8LFcUjjkXO6ltupu8MlVuWejyBsrIe+N/GJDppXF0=;
 b=hyE9EUJZyOF9q73cShrLi0RilCp7rEKYicaLPB0w4B1AEZWQnIE0lJvOPybxrXqPeXBU1n
 c4DGrkAfRYX3k4CQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 72C4DA3B8E;
 Tue, 13 Jul 2021 14:29:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 44/51] ALSA: vx: Manage vx_core object with devres
Date: Tue, 13 Jul 2021 16:28:50 +0200
Message-Id: <20210713142857.19654-45-tiwai@suse.de>
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

The firmware data are also released automatically.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/vx/vx_core.c | 12 ++++++++++--
 sound/pci/vx222/vx222.c    |  1 -
 sound/pcmcia/vx/vxpocket.c | 21 ---------------------
 3 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/sound/drivers/vx/vx_core.c b/sound/drivers/vx/vx_core.c
index a10449af5a76..18901e5bcfcf 100644
--- a/sound/drivers/vx/vx_core.c
+++ b/sound/drivers/vx/vx_core.c
@@ -774,6 +774,11 @@ int snd_vx_resume(struct vx_core *chip)
 EXPORT_SYMBOL(snd_vx_resume);
 #endif
 
+static void snd_vx_release(struct device *dev, void *data)
+{
+	snd_vx_free_firmware(data);
+}
+
 /**
  * snd_vx_create - constructor for struct vx_core
  * @card: card instance
@@ -784,6 +789,8 @@ EXPORT_SYMBOL(snd_vx_resume);
  * this function allocates the instance and prepare for the hardware
  * initialization.
  *
+ * The object is managed via devres, and will be automatically released.
+ *
  * return the instance pointer if successful, NULL in error.
  */
 struct vx_core *snd_vx_create(struct snd_card *card,
@@ -796,8 +803,9 @@ struct vx_core *snd_vx_create(struct snd_card *card,
 	if (snd_BUG_ON(!card || !hw || !ops))
 		return NULL;
 
-	chip = kzalloc(sizeof(*chip) + extra_size, GFP_KERNEL);
-	if (! chip)
+	chip = devres_alloc(snd_vx_release, sizeof(*chip) + extra_size,
+			    GFP_KERNEL);
+	if (!chip)
 		return NULL;
 	mutex_init(&chip->lock);
 	chip->irq = -1;
diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index 04c7204cb7bc..46a80ef1d481 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -109,7 +109,6 @@ static int snd_vx222_free(struct vx_core *chip)
 	if (vx->port[0])
 		pci_release_regions(vx->pci);
 	pci_disable_device(vx->pci);
-	kfree(chip);
 	return 0;
 }
 
diff --git a/sound/pcmcia/vx/vxpocket.c b/sound/pcmcia/vx/vxpocket.c
index 0dfb6a943b60..30ac1f96c6c7 100644
--- a/sound/pcmcia/vx/vxpocket.c
+++ b/sound/pcmcia/vx/vxpocket.c
@@ -50,19 +50,6 @@ static void vxpocket_release(struct pcmcia_device *link)
 	pcmcia_disable_device(link);
 }
 
-/*
- * destructor, called from snd_card_free_when_closed()
- */
-static int snd_vxpocket_dev_free(struct snd_device *device)
-{
-	struct vx_core *chip = device->device_data;
-
-	snd_vx_free_firmware(chip);
-	kfree(chip);
-	return 0;
-}
-
-
 /*
  * Hardware information
  */
@@ -122,9 +109,6 @@ static int snd_vxpocket_new(struct snd_card *card, int ibl,
 {
 	struct vx_core *chip;
 	struct snd_vxpocket *vxp;
-	static const struct snd_device_ops ops = {
-		.dev_free =	snd_vxpocket_dev_free,
-	};
 	int err;
 
 	chip = snd_vx_create(card, &vxpocket_hw, &snd_vxpocket_ops,
@@ -132,11 +116,6 @@ static int snd_vxpocket_new(struct snd_card *card, int ibl,
 	if (!chip)
 		return -ENOMEM;
 
-	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
-	if (err < 0) {
-		kfree(chip);
-		return err;
-	}
 	chip->ibl.size = ibl;
 
 	vxp = to_vxpocket(chip);
-- 
2.26.2

