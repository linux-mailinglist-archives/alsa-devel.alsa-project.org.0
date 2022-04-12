Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62ED24FD7D1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBA9E18DA;
	Tue, 12 Apr 2022 12:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBA9E18DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759496;
	bh=wt5i+6ngVKDf1/j4vI4hwO2ClBULbczvYOduUjX+uDs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZJ4x3wu0hKuQ5eD9PkWw63gko8kqplqk5OugpeXNi0GfOyj378N2tuvK2SWsyo/w
	 7thwQJGQ8HsXfifm31MkUdtOy3r8SuQknlOSu6u1zGzWU7p5Aw4t9vnoRM+RBrOk6N
	 yY0kj4qHJZN7Zo6sZArHVoleul1ZhJTO9g9dwqSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA18EF805B4;
	Tue, 12 Apr 2022 12:27:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 633FEF804FC; Tue, 12 Apr 2022 12:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EFC3F80511
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EFC3F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="DRpOAF16"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8QzbT7hU"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CA9452160D
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocpSU+8MDLeDPndsCcDNujpYgL7ApkdjISDUQpECLRA=;
 b=DRpOAF16HgrJTUBG2jPUX2H5ao/88SmelPFkPvsMyoaN5e70fzhnUIWCMcyxUzDew1Yt9x
 a8lRV/T3F7oZdTsLUz14ZaygvFBViyRqCYTw3iKFClDI4Vf98mEyLnbPlmB8mbT7kisuHc
 zfVTEFiShUTNqGxlriiLs4esDm/09EA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ocpSU+8MDLeDPndsCcDNujpYgL7ApkdjISDUQpECLRA=;
 b=8QzbT7hUpTHzIb5wG88RT2PPvgVjd3ebV1KDdbaVrIZ8+88I0nPuA07tYG0xNea1suT3g5
 WdrjrlqK/ix+yDCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B98BFA3B87;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 30/39] ALSA: als300: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:27 +0200
Message-Id: <20220412102636.16000-31-tiwai@suse.de>
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

Fixes: 21a9314cf93b ("ALSA: als300: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als300.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index b86565dcdbe4..c70aff060120 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -708,7 +708,7 @@ static int snd_als300_probe(struct pci_dev *pci,
 
 	err = snd_als300_create(card, pci, chip_type);
 	if (err < 0)
-		return err;
+		goto error;
 
 	strcpy(card->driver, "ALS300");
 	if (chip->chip_type == DEVICE_ALS300_PLUS)
@@ -723,11 +723,15 @@ static int snd_als300_probe(struct pci_dev *pci,
 
 	err = snd_card_register(card);
 	if (err < 0)
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
 
 static struct pci_driver als300_driver = {
-- 
2.31.1

