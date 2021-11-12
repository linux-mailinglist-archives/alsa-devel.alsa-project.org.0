Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EEA44E4A4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Nov 2021 11:33:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C94E6166A;
	Fri, 12 Nov 2021 11:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C94E6166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636713186;
	bh=kyOOt82ZT/UFMBj2twV3Rzpx6oBxpHKQbkovq9beeUw=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g4IF04uVTCERhQRNI7zpt0SeP8mRytBqKprEOC0uezVUnhq41xMkoAXLPGpy1KEbl
	 XF0UzF2mROh3xiPCz6hkoheECyVY6ilDB/FHmfHtGvDw/VYAqsjTTq6lcpCCUB7p/K
	 k8kx8P0xKRWNAqsQPqIOHyiA40ly5p3HCIGpz9cQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A27F8014D;
	Fri, 12 Nov 2021 11:31:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C501F8049E; Fri, 12 Nov 2021 11:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B13C5F800C1
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 11:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B13C5F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="h1q4PYqw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="yFugC03P"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DE93F1FD35
 for <alsa-devel@alsa-project.org>; Fri, 12 Nov 2021 10:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636713097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AJ5i41qK+PYrguAJ8hyEdgTFcmRR4PNVz8NdASkIl9I=;
 b=h1q4PYqwyK54FmGUtQYbRXv0YcwfZua5lxKTI8XZKxLVkwj8Om0c+G5z05npEw9/kboFjx
 7+NGGRK1ioC7G5jZULW+ktDNbNjkRABKxN2OMXyr48JoRrp4D4/njN3R9hgaW46OP5+k9g
 1chej3AF9pubq3ztPxWtTjTCMDQFpTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636713097;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AJ5i41qK+PYrguAJ8hyEdgTFcmRR4PNVz8NdASkIl9I=;
 b=yFugC03PUrL24rCbv4gFxsMAjF7xRd/wY4Qel7nKyCE321jE/0y6mNbrbH/OQT2dZtJt20
 nlugheA7cgQ8vMCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CD707A3B92;
 Fri, 12 Nov 2021 10:31:37 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: cmipci: Drop stale variable assignment
Date: Fri, 12 Nov 2021 11:31:37 +0100
Message-Id: <20211112103137.9504-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

Since the recent code refactoring using devres, the variable cm in
snd_cmipci_probe() is no longer referred.

Fixes: 87e082ad84a7 ("ALSA: cmipci: Allocate resources with device-managed APIs")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/cc6383a2-cafb-ffe7-0b4f-27a310a1005c@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cmipci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index ea20236f35db..9a678b5cf285 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -3218,7 +3218,6 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 {
 	static int dev;
 	struct snd_card *card;
-	struct cmipci *cm;
 	int err;
 
 	if (dev >= SNDRV_CARDS)
@@ -3229,10 +3228,9 @@ static int snd_cmipci_probe(struct pci_dev *pci,
 	}
 
 	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-				sizeof(*cm), &card);
+				sizeof(struct cmipci), &card);
 	if (err < 0)
 		return err;
-	cm = card->private_data;
 	
 	switch (pci->device) {
 	case PCI_DEVICE_ID_CMEDIA_CM8738:
-- 
2.31.1

