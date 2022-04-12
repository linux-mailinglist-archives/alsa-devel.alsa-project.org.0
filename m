Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5834FD7E0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C206918D5;
	Tue, 12 Apr 2022 12:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C206918D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759591;
	bh=//B85Fukqm0h99gHAz2PTXhd/HruhQ71/ld7/X4s70I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GLW+zY2O9oWwk9N/3Ku0EqFxPjqQNl/oPPVqutZyQXC/o/1uFwNpfm9aaJVoawgYH
	 YE0HuHN4BWdkbJumnW/i9LpSCCrKeYmbnDmRAjOAVB6fGVNE4Eu6SV9wXAQoOvOv8c
	 vsarNG+LpZRurWDw1A5Q/gKQB4BouxTOniNn43hY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4118F805C5;
	Tue, 12 Apr 2022 12:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F5CF805B2; Tue, 12 Apr 2022 12:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB96EF80528
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB96EF80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="l05bXXzS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="x6C8t+B5"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 69DEE1FD03
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkA/7AnGhP1AnWmdTMelHjwaMkwBWhF79/9Dm7ESkXM=;
 b=l05bXXzSZQlCW3qN27GDSH6X83OmiZ3U+qmEa6fSok2CPabQwLz8tkUGdDPwwsrmXS0zoK
 arx5klQ/Sj6hC2QKUSnOQ/zBNLRTuKuQjyGHgFCAf8Cx+wm0V/YaLwg+hxo4P34X7qXgAX
 KKonYlO2lNECh7RdlvllgUMZCeH81d8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkA/7AnGhP1AnWmdTMelHjwaMkwBWhF79/9Dm7ESkXM=;
 b=x6C8t+B5VmAxciFUL2cRqSQN9n/aOGOCuyjR6yp3NLLC/kB6Qs3Dm+3PLD2+ON1WNXhCrD
 uC/+EhhqlEIKJQDw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 65F12A3B87;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/39] ALSA: emu10k1x: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:09 +0200
Message-Id: <20220412102636.16000-13-tiwai@suse.de>
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

Fixes: 2b377c6b6012 ("ALSA: emu10k1x: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/emu10k1/emu10k1x.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index c49c44dc1082..89043392f3ec 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1491,8 +1491,8 @@ static int snd_emu10k1x_midi(struct emu10k1x *emu)
 	return 0;
 }
 
-static int snd_emu10k1x_probe(struct pci_dev *pci,
-			      const struct pci_device_id *pci_id)
+static int __snd_emu10k1x_probe(struct pci_dev *pci,
+				const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -1554,6 +1554,12 @@ static int snd_emu10k1x_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_emu10k1x_probe(struct pci_dev *pci,
+			      const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_emu10k1x_probe(pci, pci_id));
+}
+
 // PCI IDs
 static const struct pci_device_id snd_emu10k1x_ids[] = {
 	{ PCI_VDEVICE(CREATIVE, 0x0006), 0 },	/* Dell OEM version (EMU10K1) */
-- 
2.31.1

