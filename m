Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3233C9A81
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED8C5171C;
	Thu, 15 Jul 2021 10:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED8C5171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626337463;
	bh=Z5jilQdlCU+ecvpcWvo7FZHN7ukKaSxot+1nMDo4rws=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZL2GNH8UXm3mkyUceiSPZPtzvjA33CXbumvODu3nsfKB+ucx6pWWC6J6kgGdmsNz2
	 w5ZN+int0U5oVRgZuOlzUfFEMOarkTPRca6rg4r7jPwFSisTaXgylew0+vtbEVqUAx
	 cl5gZDSjpemiPRkK3hgWS6PYGKQUezMLX2ZTCwOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E257F80791;
	Thu, 15 Jul 2021 10:01:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0411F80727; Thu, 15 Jul 2021 10:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 054B4F8055C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 10:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 054B4F8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="x89aarh3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ma8/nXlc"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D43F01FDE5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626336017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yW7HisTCVctoOzQXfvpnF5WdDsgPe7fCJ3Y4gwvxgII=;
 b=x89aarh3S13dhizwlgZ88Bd5zAlaqvadoXBtCZl4ulzSupA1AS+LTxyELHkFfHXPgl/IBr
 qlWAy0VIuEhDerhmWXVmKtv6NTCSFeFphseCHYrEYBnrUyjuZLXnzU74TOjOuHUHodPdsP
 1T2JOKmTESwcVYsy9By+vrRe5NtRR7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626336017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yW7HisTCVctoOzQXfvpnF5WdDsgPe7fCJ3Y4gwvxgII=;
 b=ma8/nXlcmucm02i9dMll/Xsw0LdmCsvnVT6Z838dGdf86OPjJIwPzkSug2FqWvkCOdmksq
 CXFPUNXFJNX4+wBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C9F6AA3B8F;
 Thu, 15 Jul 2021 08:00:17 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 59/79] ALSA: cmi8328: Allocate resources with
 device-managed APIs
Date: Thu, 15 Jul 2021 09:59:21 +0200
Message-Id: <20210715075941.23332-60-tiwai@suse.de>
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

This patch converts the resource management in ISA cmi8328 driver with
devres as a clean up.  Each manual resource management is converted
with the corresponding devres helper.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/cmi8328.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/sound/isa/cmi8328.c b/sound/isa/cmi8328.c
index 3b9fbb02864b..8902cfb830f7 100644
--- a/sound/isa/cmi8328.c
+++ b/sound/isa/cmi8328.c
@@ -294,8 +294,8 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	}
 	outb(val, port);
 
-	err = snd_card_new(pdev, index[ndev], id[ndev], THIS_MODULE,
-			   sizeof(struct snd_cmi8328), &card);
+	err = snd_devm_card_new(pdev, index[ndev], id[ndev], THIS_MODULE,
+				sizeof(struct snd_cmi8328), &card);
 	if (err < 0)
 		return err;
 	cmi = card->private_data;
@@ -306,18 +306,18 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	err = snd_wss_create(card, port + 4, -1, irq[ndev], dma1[ndev],
 			dma2[ndev], WSS_HW_DETECT, 0, &cmi->wss);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_wss_pcm(cmi->wss, 0);
 	if (err < 0)
-		goto error;
+		return err;
 
 	err = snd_wss_mixer(cmi->wss);
 	if (err < 0)
-		goto error;
+		return err;
 	err = snd_cmi8328_mixer(cmi->wss);
 	if (err < 0)
-		goto error;
+		return err;
 
 	if (snd_wss_timer(cmi->wss, 0) < 0)
 		snd_printk(KERN_WARNING "error initializing WSS timer\n");
@@ -371,24 +371,21 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	dev_set_drvdata(pdev, card);
 	err = snd_card_register(card);
 	if (err < 0)
-		goto error;
+		return err;
 #ifdef SUPPORT_JOYSTICK
 	if (!gameport[ndev])
 		return 0;
 	/* gameport is hardwired to 0x200 */
-	res = request_region(0x200, 8, "CMI8328 gameport");
+	res = devm_request_region(pdev, 0x200, 8, "CMI8328 gameport");
 	if (!res)
 		snd_printk(KERN_WARNING "unable to allocate gameport I/O port\n");
 	else {
 		struct gameport *gp = cmi->gameport = gameport_allocate_port();
-		if (!cmi->gameport)
-			release_and_free_resource(res);
-		else {
+		if (cmi->gameport) {
 			gameport_set_name(gp, "CMI8328 Gameport");
 			gameport_set_phys(gp, "%s/gameport0", dev_name(pdev));
 			gameport_set_dev_parent(gp, pdev);
 			gp->io = 0x200;
-			gameport_set_port_data(gp, res);
 			/* Enable gameport */
 			snd_cmi8328_cfg_write(port, CFG1,
 					CFG1_SB_DISABLE | CFG1_GAMEPORT);
@@ -397,10 +394,6 @@ static int snd_cmi8328_probe(struct device *pdev, unsigned int ndev)
 	}
 #endif
 	return 0;
-error:
-	snd_card_free(card);
-
-	return err;
 }
 
 static void snd_cmi8328_remove(struct device *pdev, unsigned int dev)
@@ -409,17 +402,13 @@ static void snd_cmi8328_remove(struct device *pdev, unsigned int dev)
 	struct snd_cmi8328 *cmi = card->private_data;
 
 #ifdef SUPPORT_JOYSTICK
-	if (cmi->gameport) {
-		struct resource *res = gameport_get_port_data(cmi->gameport);
+	if (cmi->gameport)
 		gameport_unregister_port(cmi->gameport);
-		release_and_free_resource(res);
-	}
 #endif
 	/* disable everything */
 	snd_cmi8328_cfg_write(cmi->port, CFG1, CFG1_SB_DISABLE);
 	snd_cmi8328_cfg_write(cmi->port, CFG2, 0);
 	snd_cmi8328_cfg_write(cmi->port, CFG3, 0);
-	snd_card_free(card);
 }
 
 #ifdef CONFIG_PM
-- 
2.26.2

