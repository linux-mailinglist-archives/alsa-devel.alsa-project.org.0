Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBB4FD8BB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2826180F;
	Tue, 12 Apr 2022 12:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2826180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759864;
	bh=j2v8F0SfN/wZ0CO8fZNzJt7yVqMP4UlNtfzaamOO7no=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rdd0EbhsfNqH9X24WHncQ1BO+1GlTSGHmo5X6mYr05rcZnjpP0R166xeM4imfGJUJ
	 vpO9WjFf8U/D8bMX79hM0xTT1balD44UOkkTXCzRLqnuUbx0S8v5cdq2kQcPUjyore
	 Ou0HpI5oWArQzl/kELSeCvnmDBve2TerH1V5bCrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9CFFF80615;
	Tue, 12 Apr 2022 12:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E67C6F805F8; Tue, 12 Apr 2022 12:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 343CBF8053D
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 343CBF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Q60ORTkY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="T+uaEgr+"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 06D401FD15
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SdSI5JhtHeo8YU8jGIafeQwmfoYHnxwsVXLg5Zr3uBM=;
 b=Q60ORTkYZ7xeb6yikcNgZ07Jp+4YmfwF77wzHkTdPKVV/E4xExOe+AYVIYHsOMNcGf2AaT
 f76jpla2ErkmaT96FnanhTU99xf5UUnP4ajUwT/+RQh0Tl4W1eBkpUgbAlAyOb9cm3X07k
 0y402u53ZUQEahCBeIeEZH9a6Lqk86Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759205;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SdSI5JhtHeo8YU8jGIafeQwmfoYHnxwsVXLg5Zr3uBM=;
 b=T+uaEgr+/GDXOb1oXj2CW0oIUa8RmrXDZPjq4iNJBSzKvXR/hVXpmF9hvlOID8J2zB+q0v
 zMQITbU2oN+FYnDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id EB178A3B82;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 35/39] ALSA: hdsp: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:32 +0200
Message-Id: <20220412102636.16000-36-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412102636.16000-1-tiwai@suse.de>
References: <20220412102636.16000-1-tiwai@suse.de>
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

The previous cleanup with devres may lead to the incorrect release
orders at the probe error handling due to the devres's nature.  Until
we register the card, snd_card_free() has to be called at first for
releasing the stuff properly when the driver tries to manage and
release the stuff via card->private_free().

This patch fixes it by calling snd_card_free() manually on the error
from the probe callback.

Fixes: d136b8e54f92 ("ALSA: hdsp: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 96c12dfb24cf..3db641318d3a 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -5444,17 +5444,21 @@ static int snd_hdsp_probe(struct pci_dev *pci,
 	hdsp->pci = pci;
 	err = snd_hdsp_create(card, hdsp);
 	if (err)
-		return err;
+		goto error;
 
 	strcpy(card->shortname, "Hammerfall DSP");
 	sprintf(card->longname, "%s at 0x%lx, irq %d", hdsp->card_name,
 		hdsp->port, hdsp->irq);
 	err = snd_card_register(card);
 	if (err)
-		return err;
+		goto error;
 	pci_set_drvdata(pci, card);
 	dev++;
 	return 0;
+
+ error:
+	snd_card_free(card);
+	return err;
 }
 
 static struct pci_driver hdsp_driver = {
-- 
2.31.1

