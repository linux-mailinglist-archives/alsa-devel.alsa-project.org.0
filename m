Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 359824FD8C2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB3B017C6;
	Tue, 12 Apr 2022 12:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB3B017C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759876;
	bh=AEyH57MTvawtOAsuxfkiQnYX2LLzgkZJ+rZekPT2MEY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mSC3wL+NEFbqBnw3TM1PnGkikGh58Q6zfgdFB9SLhaE6+B2Ok3ntXVsDOHKRnTKzX
	 uIIEVQKnR6SPlvzzATFqi9Ywj8G544ieqCvwR8xwPFKMJ+4vIBHp0/4jrZsiIzmA9C
	 +K02mcBX4pT/KNg9Zq2d4r9tJwS4uc6ctM1Tf8+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77563F80134;
	Tue, 12 Apr 2022 12:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D6ECF805FD; Tue, 12 Apr 2022 12:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA1EEF80544
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA1EEF80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="BalL5WZU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="2R7rtcF0"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id ED1981FD14
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RY+tXWqTR+Y2vaa7wS1mAczc6CBJykwGe9+uumAbI7Q=;
 b=BalL5WZUz7kyXNdB0it+eEdJZfT6j8LJbk8dm4/EW3TE+4q7L4psfLbPKkuLCbdb1tB7LR
 YtrODhs8qbWsrB/XN7UXJMskNAHmDQxbq8SyZFMcBUeVHPpKmXUkCQB/K0sHz/YIjYHgul
 avCbJfk3uUPZdFjrpfw9OWxlj8aYUAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RY+tXWqTR+Y2vaa7wS1mAczc6CBJykwGe9+uumAbI7Q=;
 b=2R7rtcF0Jt907YRNiVyOFU/vXXKeN0FsA0cg/lnY1OadkKV2bifbdL3SmhlygK1sv8+qRX
 YODR7uKbY5fYUvAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id DCB9AA3B87;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 34/39] ALSA: oxygen: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:31 +0200
Message-Id: <20220412102636.16000-35-tiwai@suse.de>
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

Fixes: 596ae97ab0ce ("ALSA: oxygen: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/oxygen/oxygen_lib.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index 4fb3f2484fdb..92ffe9dc20c5 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -576,7 +576,7 @@ static void oxygen_card_free(struct snd_card *card)
 	mutex_destroy(&chip->mutex);
 }
 
-int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
+static int __oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 		     struct module *owner,
 		     const struct pci_device_id *ids,
 		     int (*get_model)(struct oxygen *chip,
@@ -701,6 +701,16 @@ int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
 	pci_set_drvdata(pci, card);
 	return 0;
 }
+
+int oxygen_pci_probe(struct pci_dev *pci, int index, char *id,
+		     struct module *owner,
+		     const struct pci_device_id *ids,
+		     int (*get_model)(struct oxygen *chip,
+				      const struct pci_device_id *id))
+{
+	return snd_card_free_on_error(&pci->dev,
+				      __oxygen_pci_probe(pci, index, id, owner, ids, get_model));
+}
 EXPORT_SYMBOL(oxygen_pci_probe);
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.31.1

