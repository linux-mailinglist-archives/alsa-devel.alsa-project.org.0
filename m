Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D656727D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 17:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 742111701;
	Tue,  5 Jul 2022 17:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 742111701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657034677;
	bh=Io8zrVjhED0qAg9AMoG1vEwMVeRz5SqDVgFX2iyQpVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XEBvoD70rN2Vss1TkgDaXL1j+rOBWv3FPL+1LLHE/zLkfmSbfhDZa4kaijp0v0+jw
	 X6fTS+cDoHQ/rxyi/QzPCeg8mqma/gVVXlsxoWJOknxx2Ea4uXV1izO8mmlxMbBVRM
	 G7V2OH0akB25fsLf0v7Gbux3nb05Yz5h9FfWFOr8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F32F80515;
	Tue,  5 Jul 2022 17:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B28DBF804B2; Tue,  5 Jul 2022 17:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9DB5F80212
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 17:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9DB5F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Z1xqsJpN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="+mVM49J7"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A23822278A;
 Tue,  5 Jul 2022 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657034619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QMmScBH3bMPlASwfGsG2TNe+Sxw8X/tqyKF5BJmi0Vo=;
 b=Z1xqsJpNEZSbqUEm13C+QOpEyBxtFGbrwbQ+0cvwGJ7mQkcL6py6AWvroSgy/SAvM6XObk
 h0lM82ZGgkUZ/HYEFGIj7reKJH96qwABz9ELXx71cdk1B8TGGvjf48OEZneY0WhQx9XnjP
 GdB7R+QzDdgvT/mKtHxIem6Cp6YM/A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657034619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QMmScBH3bMPlASwfGsG2TNe+Sxw8X/tqyKF5BJmi0Vo=;
 b=+mVM49J7i3YC4Hfgk4xyHaGJc3yprqQ4Tb/2UztcivOoLuRe9/lU+r0fOdkNCRcyraCGuD
 nN/YV4SemIfTkeAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88C9413A79;
 Tue,  5 Jul 2022 15:23:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JlSkIHtXxGJMGQAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 05 Jul 2022 15:23:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: cs46xx: Fix missing snd_card_free() call at probe error
Date: Tue,  5 Jul 2022 17:23:36 +0200
Message-Id: <20220705152336.350-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jan Engelhardt <jengelh@inai.de>
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

Fixes: 5bff69b3645d ("ALSA: cs46xx: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Reported-and-tested-by: Jan Engelhardt <jengelh@inai.de>
Link: https://lore.kernel.org/r/p2p1s96o-746-74p4-s95-61qo1p7782pn@vanv.qr
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx.c b/sound/pci/cs46xx/cs46xx.c
index bd60308769ff..8634004a606b 100644
--- a/sound/pci/cs46xx/cs46xx.c
+++ b/sound/pci/cs46xx/cs46xx.c
@@ -74,36 +74,36 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 	err = snd_cs46xx_create(card, pci,
 				external_amp[dev], thinkpad[dev]);
 	if (err < 0)
-		return err;
+		goto error;
 	card->private_data = chip;
 	chip->accept_valid = mmap_valid[dev];
 	err = snd_cs46xx_pcm(chip, 0);
 	if (err < 0)
-		return err;
+		goto error;
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	err = snd_cs46xx_pcm_rear(chip, 1);
 	if (err < 0)
-		return err;
+		goto error;
 	err = snd_cs46xx_pcm_iec958(chip, 2);
 	if (err < 0)
-		return err;
+		goto error;
 #endif
 	err = snd_cs46xx_mixer(chip, 2);
 	if (err < 0)
-		return err;
+		goto error;
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	if (chip->nr_ac97_codecs ==2) {
 		err = snd_cs46xx_pcm_center_lfe(chip, 3);
 		if (err < 0)
-			return err;
+			goto error;
 	}
 #endif
 	err = snd_cs46xx_midi(chip, 0);
 	if (err < 0)
-		return err;
+		goto error;
 	err = snd_cs46xx_start_dsp(chip);
 	if (err < 0)
-		return err;
+		goto error;
 
 	snd_cs46xx_gameport(chip);
 
@@ -117,11 +117,15 @@ static int snd_card_cs46xx_probe(struct pci_dev *pci,
 
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
 
 static struct pci_driver cs46xx_driver = {
-- 
2.35.3

