Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A2F3C72A1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF661783;
	Tue, 13 Jul 2021 16:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF661783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626187786;
	bh=BcouPs2oiOXfISqCuhU9v3hJt1yTHbZsJ/KJv8DjMYQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tn8JBdCUF5gfkqw/YkmgDMS+lW4Kngee5tR7QUtIY2WID6ePPvNLyMl1nlchLAVyp
	 4h+s8LRv7oM57j0ieuxA4i39EFDYQadaFitEcWGV6IKw5diJLnQxqgBxJLMEHfmveu
	 FZiTo4utwTY7MZaRliYiUfUN78iES/ECnjh/wV40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10528F80676;
	Tue, 13 Jul 2021 16:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12419F805AA; Tue, 13 Jul 2021 16:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5351F80520
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5351F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0AIwgpnS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FU+WUh3t"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9B44C201DA
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626186584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBwQBJBGsn4PeR2I3zEBE2ni2A8jQnZMXEn2wo06JxI=;
 b=0AIwgpnSXh4uvx6ZWpo/vYA4o4xsO2wgGE9nDg8u7AnVou1zqKQDJ4P4mNGKKrpQylRFc3
 ptA3aF2kVpSQRQPNcXVgW5iegZbgPHsX58/UL53Q11RIsu1ASTxHwZYwDgmW2C3Gzmzpc9
 vBPBZ+MuhK+Y38NDh60MBohRLJSmzlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626186584;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBwQBJBGsn4PeR2I3zEBE2ni2A8jQnZMXEn2wo06JxI=;
 b=FU+WUh3tpxJ1EUBeNH95ypsLFlE+QcTfMYUH1WA3PoDAyBzwiYxKaZ51OYZUtvzAaDR5bT
 iNPZi3x0A+kyRrAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 88A63A3B92;
 Tue, 13 Jul 2021 14:29:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 48/51] ALSA: virmidi: Allocate resources with device-managed
 APIs
Date: Tue, 13 Jul 2021 16:28:54 +0200
Message-Id: <20210713142857.19654-49-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713142857.19654-1-tiwai@suse.de>
References: <20210713142857.19654-1-tiwai@suse.de>
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

This patch converts the card object management with devres as a clean
up.  The remove callback gets reduced by that.

This should give no user-visible functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/virmidi.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/sound/drivers/virmidi.c b/sound/drivers/virmidi.c
index 4206d93ab47e..7f7eed6faaae 100644
--- a/sound/drivers/virmidi.c
+++ b/sound/drivers/virmidi.c
@@ -75,8 +75,8 @@ static int snd_virmidi_probe(struct platform_device *devptr)
 	int idx, err;
 	int dev = devptr->id;
 
-	err = snd_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(struct snd_card_virmidi), &card);
+	err = snd_devm_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(struct snd_card_virmidi), &card);
 	if (err < 0)
 		return err;
 	vmidi = card->private_data;
@@ -94,7 +94,7 @@ static int snd_virmidi_probe(struct platform_device *devptr)
 
 		err = snd_virmidi_new(card, idx, &rmidi);
 		if (err < 0)
-			goto __nodev;
+			return err;
 		rdev = rmidi->private_data;
 		vmidi->midi[idx] = rmidi;
 		strcpy(rmidi->name, "Virtual Raw MIDI");
@@ -106,18 +106,10 @@ static int snd_virmidi_probe(struct platform_device *devptr)
 	sprintf(card->longname, "Virtual MIDI Card %i", dev + 1);
 
 	err = snd_card_register(card);
-	if (!err) {
-		platform_set_drvdata(devptr, card);
-		return 0;
-	}
-__nodev:
-	snd_card_free(card);
-	return err;
-}
+	if (err)
+		return err;
 
-static int snd_virmidi_remove(struct platform_device *devptr)
-{
-	snd_card_free(platform_get_drvdata(devptr));
+	platform_set_drvdata(devptr, card);
 	return 0;
 }
 
@@ -125,7 +117,6 @@ static int snd_virmidi_remove(struct platform_device *devptr)
 
 static struct platform_driver snd_virmidi_driver = {
 	.probe		= snd_virmidi_probe,
-	.remove		= snd_virmidi_remove,
 	.driver		= {
 		.name	= SND_VIRMIDI_DRIVER,
 	},
-- 
2.26.2

