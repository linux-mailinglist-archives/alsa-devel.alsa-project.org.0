Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDE24FD746
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B5E17FD;
	Tue, 12 Apr 2022 12:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B5E17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759306;
	bh=MZrEiqx27iFiln3jWfLnhnErBpRM/W+IsCNj+AU8+pk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBh4noh2FPWvQz0m6WKTS8REPKVQPyNckaaHz8pvGznnjgm3Ah+XNqGoJ/F1/qzeG
	 Bm6mmcmC+nOIBfy+Z1F4kK6nQL/rSG4EOM1jHHpZggbbrTgw5vBBgVrXyyD1LKGx3u
	 JNAIw3rZHep9x8c+5tpwq3PQK61m4Wzgzg1LWZIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8F5F8054A;
	Tue, 12 Apr 2022 12:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239C4F80548; Tue, 12 Apr 2022 12:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5944F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5944F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="DtRZFw5m"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="NawHa88n"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 4C9F21F869
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2UaeZ2JIwkwxcxwzADrycEE5VWLOUR74ly2547YINY=;
 b=DtRZFw5mVQk/c/P1xEdbkXMDyoHMtVSbty2WjiN5T29yIwQh/hWAyqdDVkSP2LOomZLcyV
 IdU/sk+pO2bzgqxrw/GUAhEB31Ia04BKblT5RaIsEGG0sFMyJ9sfddzJOjlT2bj3xfwPyv
 Kdil6+/A4a+xnE2QkpUm4QtxZmcRtd0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v2UaeZ2JIwkwxcxwzADrycEE5VWLOUR74ly2547YINY=;
 b=NawHa88nV3+Hb+T/r0Q6+fb6+esxCGp8CLH9c9xltxC2kQVDrIF5vrbTGHwqd2KKYp2LcS
 A1jFFKo03n627QDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 47FC3A3B83;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/39] ALSA: als4000: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:02 +0200
Message-Id: <20220412102636.16000-6-tiwai@suse.de>
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

This patch fixes it by calling snd_card_free() on the error from the
probe callback using a new helper function.

Fixes: 0e175f665960 ("ALSA: als4000: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als4000.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index 535eccd124be..f33aeb692a11 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -806,8 +806,8 @@ static void snd_card_als4000_free( struct snd_card *card )
 	snd_als4000_free_gameport(acard);
 }
 
-static int snd_card_als4000_probe(struct pci_dev *pci,
-				  const struct pci_device_id *pci_id)
+static int __snd_card_als4000_probe(struct pci_dev *pci,
+				    const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -930,6 +930,12 @@ static int snd_card_als4000_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_card_als4000_probe(struct pci_dev *pci,
+				  const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_card_als4000_probe(pci, pci_id));
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int snd_als4000_suspend(struct device *dev)
 {
-- 
2.31.1

