Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6918A4FD8DA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:38:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E95718A0;
	Tue, 12 Apr 2022 12:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E95718A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759895;
	bh=8jYI0Gkx1Yn1CXTFDdfwh0QVY/c8OF5rp1hDk4UTAfg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AM9yeXkyv8MnFip9vWk3e81tiRuE9sSX+gYDgPK5qmM9uh9fJKYf1uOeVtCdv1sbT
	 j8nNUokawzOWTW/gzgraqebGWPutVI4frocgT5y18xTyZppQ1fQ+gq10jrhGgva231
	 0jKaySaGw6ZsSbqOrRHJGwx3YqCubQ09+eCaX5Bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B131F80616;
	Tue, 12 Apr 2022 12:27:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C833F8053B; Tue, 12 Apr 2022 12:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B3B5F8053B
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B3B5F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="mD5VYwoF"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="SgyDoGHr"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CE8BE1FD13
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNCIGc1sJeHlIJHS+R/Ew+Y+LPENgWBoxqnO2oUY00E=;
 b=mD5VYwoFsugmMhNKGN6qaIgMYBjMUTYFZLSJ4jT0P+xtsxr1CWy4U552OW70BS8fg03fHl
 mYhvfYX7LJdSyYF3hB7sA9fKAlWxy6rcMJRwm/KTAvEVQClFhBYz9IzJtIPKKbCYW66Lu+
 qEybnjbn+eg+EEOuUdHmymMtM9JnQno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNCIGc1sJeHlIJHS+R/Ew+Y+LPENgWBoxqnO2oUY00E=;
 b=SgyDoGHr9bOm9reS8OJZ3AK1/0pR8rRaFkH4zW1CZgHOkL3WnMRVqJS2oYxT2PaO5BBRPO
 WuPWLdJrRt7OMfBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C8745A3B82;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 31/39] ALSA: aw2: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:28 +0200
Message-Id: <20220412102636.16000-32-tiwai@suse.de>
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

Fixes: 33631012cd06 ("ALSA: aw2: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/aw2/aw2-alsa.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/pci/aw2/aw2-alsa.c b/sound/pci/aw2/aw2-alsa.c
index d56f126d6fdd..29a4bcdec237 100644
--- a/sound/pci/aw2/aw2-alsa.c
+++ b/sound/pci/aw2/aw2-alsa.c
@@ -275,7 +275,7 @@ static int snd_aw2_probe(struct pci_dev *pci,
 	/* (3) Create main component */
 	err = snd_aw2_create(card, pci);
 	if (err < 0)
-		return err;
+		goto error;
 
 	/* initialize mutex */
 	mutex_init(&chip->mtx);
@@ -294,13 +294,17 @@ static int snd_aw2_probe(struct pci_dev *pci,
 	/* (6) Register card instance */
 	err = snd_card_register(card);
 	if (err < 0)
-		return err;
+		goto error;
 
 	/* (7) Set PCI driver data */
 	pci_set_drvdata(pci, card);
 
 	dev++;
 	return 0;
+
+ error:
+	snd_card_free(card);
+	return err;
 }
 
 /* open callback */
-- 
2.31.1

