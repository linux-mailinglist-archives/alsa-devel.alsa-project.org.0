Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B874FD785
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E081867;
	Tue, 12 Apr 2022 12:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E081867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759366;
	bh=WDQaYDlUURN1OSjGBJ58GzJyqLJ18Shgceopwe1h6z0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zcgph1WMQse5YXvSfQ/SNBnBk33YsGh7m2yE9W1ksANMxgpbpD/FNjWzOaG+7+X6P
	 1D56v/jyeS9gWMi3ZlaYfYWmZnkE2uODGrc6WWZdIdjC7VeNsW1Vq5UwP/Jmp28cOJ
	 phZL5YzAJjFc9wn8Timir3qr2QysZDwXiunaXwKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5655F8055C;
	Tue, 12 Apr 2022 12:27:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08467F80245; Tue, 12 Apr 2022 12:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED55EF80245
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED55EF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yxJ7gNss"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="X3n7aQ+9"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5A9D11FCFD
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXkaw4IR7n8jzFGw1i9wNYypWy9VxVCqQwfKbf1rWrA=;
 b=yxJ7gNsshpdSH7rv5i5U80tT+PWEWk9D0pEmLCtNH6sMyWHWvYv8iBGo7y+arcLrosWI09
 GIz5LulX/ggs2Wjx7pw/YDwqPjKiw6hMshDZwyiI7H1Yrh15n5gHeGJ+cvl2eWJl0j3J7X
 Zclk6z/pFIzK3uq0FEnQ+ZUXxRLMMSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXkaw4IR7n8jzFGw1i9wNYypWy9VxVCqQwfKbf1rWrA=;
 b=X3n7aQ+9Rqq7VMLSFKq/gvQxnsUaHmNpx3bIbtiyKPlhbTRUERjsSLVYqtJsMncCYj1FAa
 b3vNBLXRk3y/k2Ag==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 4B252A3B87;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/39] ALSA: atiixp: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:03 +0200
Message-Id: <20220412102636.16000-7-tiwai@suse.de>
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

Fixes: 86bde74dbf09 ("ALSA: atiixp: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/atiixp.c       | 10 ++++++++--
 sound/pci/atiixp_modem.c | 10 ++++++++--
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/pci/atiixp.c b/sound/pci/atiixp.c
index b8e035d5930d..43d01f1847ed 100644
--- a/sound/pci/atiixp.c
+++ b/sound/pci/atiixp.c
@@ -1572,8 +1572,8 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 }
 
 
-static int snd_atiixp_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
+static int __snd_atiixp_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct atiixp *chip;
@@ -1623,6 +1623,12 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_atiixp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_atiixp_probe(pci, pci_id));
+}
+
 static struct pci_driver atiixp_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
diff --git a/sound/pci/atiixp_modem.c b/sound/pci/atiixp_modem.c
index 178dce8ef1e9..8864c4c3c7e1 100644
--- a/sound/pci/atiixp_modem.c
+++ b/sound/pci/atiixp_modem.c
@@ -1201,8 +1201,8 @@ static int snd_atiixp_init(struct snd_card *card, struct pci_dev *pci)
 }
 
 
-static int snd_atiixp_probe(struct pci_dev *pci,
-			    const struct pci_device_id *pci_id)
+static int __snd_atiixp_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
 {
 	struct snd_card *card;
 	struct atiixp_modem *chip;
@@ -1247,6 +1247,12 @@ static int snd_atiixp_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_atiixp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_atiixp_probe(pci, pci_id));
+}
+
 static struct pci_driver atiixp_modem_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_atiixp_ids,
-- 
2.31.1

