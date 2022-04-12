Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37D4FD357
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:33:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E053E175C;
	Tue, 12 Apr 2022 11:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E053E175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649756010;
	bh=QITigztYz6ZcYz5mACqVvjfRh+8Oc1SZapKmMNtErcc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ijDieEY/CACBo7d+cdSSyxY7eA5MkpzQr2OaMOEnRe3XMMpkTqfUR8iQ4kNGnSSeX
	 AoOteZBkzHiYFF648Y2V+zf1P1FRLED5HEJMWtMzZzIoeL9FWF3BPPRKrh06NLUwHN
	 C3QTsuPqlLlptTxeedcTak9sNyyUXMKPYnrMpLoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 241C4F804FD;
	Tue, 12 Apr 2022 11:31:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B30FF8032B; Tue, 12 Apr 2022 11:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6342EF80134
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 11:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6342EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QSnYWNGO"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ei2JXXMH"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C24EA210EC;
 Tue, 12 Apr 2022 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649755902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYGohI/5bFagDxlQUsCcCU5EjtwoUAZhILIOZBfRbL8=;
 b=QSnYWNGOctbS6toChgIEGFo06EC8EAJIsdYWwMcEb6wWJ2mUL2t1/PwrtTT5T8Pqddw4qW
 hK6QmicRXn1oM2erFxALAgN3o2dAPDONpl9clq6spq1BJGL1y7qrxU+lPnyH+Xrn9tJ6MT
 r4sPwwn17QDh5G1FPtQpF6kIkk4FJOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649755902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYGohI/5bFagDxlQUsCcCU5EjtwoUAZhILIOZBfRbL8=;
 b=ei2JXXMHDWi48J07v69nSeXqw6lRvMn438lXQYZyPFXP9V/ujGwCnp1BGeMG6NHiTHhPxQ
 UFA1bdmNNiU/GpCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B83E1A3B8A;
 Tue, 12 Apr 2022 09:31:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: echoaudio: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 11:31:41 +0200
Message-Id: <20220412093141.8008-3-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412093141.8008-1-tiwai@suse.de>
References: <20220412093141.8008-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Zheyu Ma <zheyuma97@gmail.com>
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

Fixes: 9c211bf392bb ("ALSA: echoaudio: Allocate resources with device-managed APIs")
Reported-and-tested-by: Zheyu Ma <zheyuma97@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CAMhUBjm2AdyEZ_-EgexdNDN7SvY4f89=4=FwAL+c0Mg0O+X50A@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/echoaudio/echoaudio.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 25b012ef5c3e..c70c3ac4e99a 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -1970,8 +1970,8 @@ static int snd_echo_create(struct snd_card *card,
 }
 
 /* constructor */
-static int snd_echo_probe(struct pci_dev *pci,
-			  const struct pci_device_id *pci_id)
+static int __snd_echo_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -2139,6 +2139,11 @@ static int snd_echo_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_echo_probe(struct pci_dev *pci,
+			  const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_echo_probe(pci, pci_id));
+}
 
 
 #if defined(CONFIG_PM_SLEEP)
-- 
2.31.1

