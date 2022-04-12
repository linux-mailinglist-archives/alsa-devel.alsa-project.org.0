Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1AB4FD7E3
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66E118F1;
	Tue, 12 Apr 2022 12:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66E118F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759634;
	bh=MwyBHd5ko2CVUfdBZdKImVThC22dzsyuB2f7HuTZFeU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ah9xwRwsrTGTufr7ERezME+cIL0uSMFwTbe0ALjtB8Mxs0FNpE26QY5d6I/Ufxdmt
	 EoYEVvc5xciOlueXkFxKxpj4CUQKx0JQwCNjnmG48OkgB0mxVJA7WhRFSchujndZ5P
	 DyomCBVcXP4S7j3e3i4GgKOigbgyoT9naoMMbTFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D43CAF805D9;
	Tue, 12 Apr 2022 12:27:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69EF4F805B2; Tue, 12 Apr 2022 12:27:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC9DF80526
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC9DF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QrfAFAAA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="jBwT05GV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0C58121611
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LzHnZb/RPia00zKlb5KDq/JXdna9EYMtLb6ycagHow=;
 b=QrfAFAAA1vffYwTJCWopRjsXy6I1p9q58s5YPwBytg6Bm5ky5CV3/P8UJ9ScgTkVGiuL8J
 Ngti1yRwYIq6hwFCVSltmCHLJ7KoiA9/F+hw+3JXdbHVfcLJmb8Ij55rXioRL2blRlXxim
 ojgV4MwmfZdN1Ht79MRbeSPbZQV4bQs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759205;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5LzHnZb/RPia00zKlb5KDq/JXdna9EYMtLb6ycagHow=;
 b=jBwT05GVrd8UuI+whEP2hjjuV/uuRuryc5ERxX4UtGcHFtZ6MWYYfaDxF2tj6HX+bGq2uL
 qyllSNGmO1xi5zDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 07600A3B87;
 Tue, 12 Apr 2022 10:26:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 37/39] ALSA: rme9652: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:34 +0200
Message-Id: <20220412102636.16000-38-tiwai@suse.de>
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

Fixes: b1002b2d41c5 ("ALSA: rme9652: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 7755e19aa776..1d614fe89a6a 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2572,7 +2572,7 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 	rme9652->pci = pci;
 	err = snd_rme9652_create(card, rme9652, precise_ptr[dev]);
 	if (err)
-		return err;
+		goto error;
 
 	strcpy(card->shortname, rme9652->card_name);
 
@@ -2580,10 +2580,14 @@ static int snd_rme9652_probe(struct pci_dev *pci,
 		card->shortname, rme9652->port, rme9652->irq);
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
 
 static struct pci_driver rme9652_driver = {
-- 
2.31.1

