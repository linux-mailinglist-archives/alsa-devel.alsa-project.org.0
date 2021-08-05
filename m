Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E653E0E44
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 08:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 171B6169F;
	Thu,  5 Aug 2021 08:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 171B6169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628144577;
	bh=wH8+kwaaWstm14133N0/0wtLclcrL0iSedMIZJ6wyk4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eOVvSJoNw2B4kbTkrckfAQ+yokGSu7SZZui1H+DW0vZgvXPNrNtqLbNJ9+mQwn8AM
	 B7DgvdS8wDBSFV9+Lim9kjE3mNMlm8Qk2cOLkizHMcbRQBuxnZBPQU5ZGO2zKNJwOv
	 5REbkcKb1fA6ylg3tnfKT6Hc2GawkvXv1PK58aTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF42AF804E4;
	Thu,  5 Aug 2021 08:22:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DBFFF804E3; Thu,  5 Aug 2021 08:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 040E8F804CB
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 08:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040E8F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="2XwZWdQd"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZFEWK6ZX"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 247781FE2A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 06:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628144509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bo5ShIPOM8A3r5LNTmHdwu5YYIRvqHOxK5IomOaXrRU=;
 b=2XwZWdQdxwhMJz8lqUt6KqrWnZGsfcsixRFgyTzyMHBYqPWZbalyGpEkzcCbqSzpA5mt8U
 sOzlthY525Qzdsmwd6SXfr0E7YV1fF3LcHu7Ab29syno7cfLHP+Mv2PIDRZPw85/B660Jd
 b1BBJY/swaSVAQ2dr/R5hiooNaVa2Bw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628144509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=bo5ShIPOM8A3r5LNTmHdwu5YYIRvqHOxK5IomOaXrRU=;
 b=ZFEWK6ZX+CdOQ94cIogappQejKtUyM2YlMEuH9HCGPuL5plqHp560rm3eYMzzxL8NuM3F1
 2IMOiNZH9LDeCgDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 0F2A0A3B91;
 Thu,  5 Aug 2021 06:21:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: es1688: Avoid devres management for es1688 object
 creation
Date: Thu,  5 Aug 2021 08:21:48 +0200
Message-Id: <20210805062148.30951-1-tiwai@suse.de>
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

The recent refactoring of es1688 object creation with the use of
devres caused a problem with the non-PnP probe of GUS driver, as it
tries to probe multiple times with different parameters  That is, this
object needs the immediate resource release and the devres doesn't fit
for it.

This patch reverts partially the commit for restoring the classic
resource management for es1688 object.

Fixes: 1bb11c1c7f6e ("ALSA: es1688: Allocate resources with device-managed APIs")
Reported-by: kernel test robot <oliver.sang@intel.com>
Link: https://lore.kernel.org/r/20210805032513.GA30485@xsang-OptiPlex-9020
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/es1688.h        |  1 +
 sound/isa/es1688/es1688_lib.c | 29 ++++++++++++++++++++---------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/sound/es1688.h b/include/sound/es1688.h
index da577bbf9cc7..099569c31fbb 100644
--- a/include/sound/es1688.h
+++ b/include/sound/es1688.h
@@ -18,6 +18,7 @@
 
 struct snd_es1688 {
 	unsigned long port;		/* port of ESS chip */
+	struct resource *res_port;
 	unsigned long mpu_port;		/* MPU-401 port of ESS chip */
 	int irq;			/* IRQ number of ESS chip */
 	int mpu_irq;			/* MPU IRQ */
diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index 9cd66b236cef..8554cb2263c1 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -580,6 +580,13 @@ static int snd_es1688_free(struct snd_es1688 *chip)
 {
 	if (chip->hardware != ES1688_HW_UNDEF)
 		snd_es1688_init(chip, 0);
+	release_and_free_resource(chip->res_port);
+	if (chip->irq >= 0)
+		free_irq(chip->irq, (void *) chip);
+	if (chip->dma8 >= 0) {
+		disable_dma(chip->dma8);
+		free_dma(chip->dma8);
+	}
 	return 0;
 }
 
@@ -617,25 +624,26 @@ int snd_es1688_create(struct snd_card *card,
 	chip->dma8 = -1;
 	chip->hardware = ES1688_HW_UNDEF;
 	
-	if (!devm_request_region(card->dev, port + 4, 12, "ES1688")) {
+	chip->res_port = request_region(port + 4, 12, "ES1688");
+	if (chip->res_port == NULL) {
 		snd_printk(KERN_ERR "es1688: can't grab port 0x%lx\n", port + 4);
-		return -EBUSY;
+		err = -EBUSY;
+		goto exit;
 	}
 
-	err = devm_request_irq(card->dev, irq, snd_es1688_interrupt, 0,
-			       "ES1688", (void *) chip);
+	err = request_irq(irq, snd_es1688_interrupt, 0, "ES1688", (void *) chip);
 	if (err < 0) {
 		snd_printk(KERN_ERR "es1688: can't grab IRQ %d\n", irq);
-		return err;
+		goto exit;
 	}
 
 	chip->irq = irq;
 	card->sync_irq = chip->irq;
-	err = snd_devm_request_dma(card->dev, dma8, "ES1688");
+	err = request_dma(dma8, "ES1688");
 
 	if (err < 0) {
 		snd_printk(KERN_ERR "es1688: can't grab DMA8 %d\n", dma8);
-		return err;
+		goto exit;
 	}
 	chip->dma8 = dma8;
 
@@ -651,14 +659,17 @@ int snd_es1688_create(struct snd_card *card,
 
 	err = snd_es1688_probe(chip);
 	if (err < 0)
-		return err;
+		goto exit;
 
 	err = snd_es1688_init(chip, 1);
 	if (err < 0)
-		return err;
+		goto exit;
 
 	/* Register device */
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
+exit:
+	if (err)
+		snd_es1688_free(chip);
 	return err;
 }
 
-- 
2.26.2

