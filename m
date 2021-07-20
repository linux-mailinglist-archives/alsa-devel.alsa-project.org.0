Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA93CFF77
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B713169C;
	Tue, 20 Jul 2021 18:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B713169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798652;
	bh=ZoqcccUjXRLihhm8ZtvbuModgJjbMqyuICo5H/r7WC4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HhZGFoTO9dgvtPVDJnWFbcWRsdkcvcyDt/GMRlqyTrEfa7/QqAZLTKOi0zMxhC9/k
	 7aelfjMHGT+1Dl9tSs1XCb0n04+zT5rP0Us4L84G557JZIjvFLnxvRMC0ENkK0MoQH
	 3KvqGdFtm3wG9AKS5jgQTW+jjAeKKGHQQ+hqjpL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 440A0F80218;
	Tue, 20 Jul 2021 18:29:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35DAAF8020D; Tue, 20 Jul 2021 18:28:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C579F800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C579F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xlsN8CO6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Dg0Hq+RH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 803C31FE41
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626798518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pYnGUM8illnxbS2e1Y7siEgiDiQj9XieDn5Rtnz8D9s=;
 b=xlsN8CO6vAiHiYy5MvYPcL0r3+tQKuUoN2DlRSQ3jSBG4QZVOjo6QFhPmguIl6vrEozqOg
 3PsUZmjcFvhMBjIQq3AlvKiyrXUu0+ZRmJqAHtjlfQ5HHv0sKf0cKb2lFilOj8e155WQec
 lDkxm9BLdChEQcWHVUHesW6N5iaKG5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626798518;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pYnGUM8illnxbS2e1Y7siEgiDiQj9XieDn5Rtnz8D9s=;
 b=Dg0Hq+RHIHebGoEdIF168nivcOEmoDjIvXxXj1QwGypAFhJs3I6KQtD8xWKdkcS1BADv7W
 2U/nqnIwgZZSdDBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6F87EA3B84;
 Tue, 20 Jul 2021 16:28:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: sc6000: Assign vport directly on card's private_data
Date: Tue, 20 Jul 2021 18:28:37 +0200
Message-Id: <20210720162837.6026-1-tiwai@suse.de>
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

sc6000 driver tries to allocate an extra pointer for keeping the vport
address and point it over card->private_data.  But, this indirect
access is utterly superfluous, and we can keep the vport address
directly in card->private_data instead.  This will simply the code and
avoid confusion.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sc6000.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/isa/sc6000.c b/sound/isa/sc6000.c
index 44c05b55fc15..d92e56cb0490 100644
--- a/sound/isa/sc6000.c
+++ b/sound/isa/sc6000.c
@@ -531,10 +531,10 @@ static int snd_sc6000_match(struct device *devptr, unsigned int dev)
 
 static void snd_sc6000_free(struct snd_card *card)
 {
-	char __iomem **vport = card->private_data;
+	char __iomem *vport = card->private_data;
 
-	if (*vport)
-		sc6000_setup_board(*vport, 0);
+	if (vport)
+		sc6000_setup_board(vport, 0);
 }
 
 static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
@@ -547,16 +547,14 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 	struct snd_card *card;
 	struct snd_wss *chip;
 	struct snd_opl3 *opl3;
-	char __iomem **vport;
+	char __iomem *vport;
 	char __iomem *vmss_port;
 
-
 	err = snd_devm_card_new(devptr, index[dev], id[dev], THIS_MODULE,
-				sizeof(*vport), &card);
+				0, &card);
 	if (err < 0)
 		return err;
 
-	vport = card->private_data;
 	if (xirq == SNDRV_AUTO_IRQ) {
 		xirq = snd_legacy_find_free_irq(possible_irqs);
 		if (xirq < 0) {
@@ -578,12 +576,13 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 			   "I/O port region is already in use.\n");
 		return -EBUSY;
 	}
-	*vport = devm_ioport_map(devptr, port[dev], 0x10);
-	if (*vport == NULL) {
+	vport = devm_ioport_map(devptr, port[dev], 0x10);
+	if (!vport) {
 		snd_printk(KERN_ERR PFX
 			   "I/O port cannot be iomapped.\n");
 		return -EBUSY;
 	}
+	card->private_data = vport;
 
 	/* to make it marked as used */
 	if (!devm_request_region(devptr, mss_port[dev], 4, DRV_NAME)) {
@@ -602,7 +601,7 @@ static int snd_sc6000_probe(struct device *devptr, unsigned int dev)
 		   port[dev], xirq, xdma,
 		   mpu_irq[dev] == SNDRV_AUTO_IRQ ? 0 : mpu_irq[dev]);
 
-	err = sc6000_init_board(*vport, vmss_port, dev);
+	err = sc6000_init_board(vport, vmss_port, dev);
 	if (err < 0)
 		return err;
 	card->private_free = snd_sc6000_free;
-- 
2.26.2

