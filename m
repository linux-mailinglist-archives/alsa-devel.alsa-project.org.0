Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2C4FD83E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF7E1916;
	Tue, 12 Apr 2022 12:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF7E1916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759741;
	bh=3/tBqllMumUMNvb0OQSAOSRZ0nicJpO2rrUWHSPxtO4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6QyOL829PDCsh9om86ISFYnJllgD2rabZZDR0YdYJTK3mSjTkmuSfA8mLeRg6r9c
	 /Y+W5+fLz9O8Lozsb718vjUHhwe3IFIoU0aN0MeEIbv+ng8nBMWXkL+0y7bxDQ5s9h
	 w6PQPFXP6VBN05EdISeGfFsUB9ipfg5UeYnQomrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9853FF805F5;
	Tue, 12 Apr 2022 12:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B02C2F805D5; Tue, 12 Apr 2022 12:27:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D9CDF80535
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D9CDF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Nk3h4inh"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="hTN3Ilyw"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8D8421FD0B
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxQ8QNdZr+AhJ2KjuuBfUnCTq6S8w0MU9hTosNC5+54=;
 b=Nk3h4inhhptucaVsT30wDs+pckJUntkB1oNUjldm16tQ0PeJz1eEy4QHmVTMkO+29PG+HW
 z6Slx7qBGZ5JYjiHN0iSbDj2fc8cBLt2FOt+wqGZ0CocJQX1pnucx5sUZKMc23abGdXKBa
 EZuMOMHwMRnnxd1cLpMCXHcHyDdv3wM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxQ8QNdZr+AhJ2KjuuBfUnCTq6S8w0MU9hTosNC5+54=;
 b=hTN3IlywRrPizyEaZqCBGV3lYA46MTXHJaxNGFVFXluLXxVoWZ52RNpZMudqGQGl8AO3tz
 erRbKvui2lnU85Cg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8986EA3B87;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 21/39] ALSA: riptide: Fix the missing snd_card_free() call at
 probe error
Date: Tue, 12 Apr 2022 12:26:18 +0200
Message-Id: <20220412102636.16000-22-tiwai@suse.de>
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

Fixes: 546c201a891e ("ALSA: riptide: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/riptide/riptide.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/pci/riptide/riptide.c b/sound/pci/riptide/riptide.c
index 5a987c683c41..b37c877c2c16 100644
--- a/sound/pci/riptide/riptide.c
+++ b/sound/pci/riptide/riptide.c
@@ -2023,7 +2023,7 @@ static void snd_riptide_joystick_remove(struct pci_dev *pci)
 #endif
 
 static int
-snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+__snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -2124,6 +2124,12 @@ snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	return 0;
 }
 
+static int
+snd_card_riptide_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_card_riptide_probe(pci, pci_id));
+}
+
 static struct pci_driver driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_riptide_ids,
-- 
2.31.1

