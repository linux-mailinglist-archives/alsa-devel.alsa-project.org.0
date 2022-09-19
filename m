Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016285BCBE3
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D8EE11;
	Mon, 19 Sep 2022 14:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D8EE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590985;
	bh=ieodO+r5ZfXHLplb6MChan+VhRLO+V3vloWyB+AcAkI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HXrUwiu1XD1GPxX8CNsZ80UVAQZho2T2zzGvVZWR4JZ4vt5kmSaa4DTJrEGP4Gmcl
	 vCJBAJlLhIjol7l7j6OpMqzTko2K10OhJqooMk5lGgCPc6ob0r0zj3s5vG6bq+Y5hD
	 fW2dDEKAMmr0RXoiFOZN03VkaKDytsIsE4dENgTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2DFDF804B4;
	Mon, 19 Sep 2022 14:35:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 647F2F800E5; Mon, 19 Sep 2022 14:35:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D5FF800E5
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D5FF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="oSyu+Boe"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Rsg3lI9f"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C657421ED1;
 Mon, 19 Sep 2022 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663590918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=99Ctn0Fwq3Uhz3GtCQL2CDiNdhsMnqx/FrPCcoV9YE4=;
 b=oSyu+BoesYL7jQjqXCxVvDlOL5sQrxrRlo+tSDUrG3lGIpp+o9CJ6DzZB8HsQpYH1fyx+q
 vOuDWNNRH5mEblRAhsn1FFUZJBfDstePwkUY1FdcSwF9c1kJgjpYzp5ao6kY8jFtlgOrgz
 WQCvj3yUz+l/ZHgzJQsni5ZDia3eTvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663590918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=99Ctn0Fwq3Uhz3GtCQL2CDiNdhsMnqx/FrPCcoV9YE4=;
 b=Rsg3lI9f2JLbFXQgUoT3LmFUPp2UGMTcn3h2RQTPnL8oDrV5Q5gb4gHD2sQrs/h6Igdikw
 RRf7z9LxOpqWsCCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2AB313A96;
 Mon, 19 Sep 2022 12:35:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C/nwJgZiKGNULQAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 19 Sep 2022 12:35:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Fix double-free at snd_card_new()
Date: Mon, 19 Sep 2022 14:35:16 +0200
Message-Id: <20220919123516.28222-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rondreis <linhaoguo86@gmail.com>
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

During the code change to add the support for devres-managed card
instance, we put an explicit kfree(card) call at the error path in
snd_card_new().  This is needed for the early error path before the
card is initialized with the device, but is rather superfluous and
causes a double-free at the error path after the card instance is
initialized, as the destructor of the card object already contains a
kfree() call.

This patch fixes the double-free situation by removing the superfluous
kfree().  Meanwhile we need to call kfree() explicitly for the early
error path, so it's added there instead.

Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
Reported-by: Rondreis <linhaoguo86@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/CAB7eexL1zBnB636hwS27d-LdPYZ_R1-5fJS_h=ZbCWYU=UPWJg@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 193dae361fac..5377f94eb211 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -178,10 +178,8 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 		return -ENOMEM;
 
 	err = snd_card_init(card, parent, idx, xid, module, extra_size);
-	if (err < 0) {
-		kfree(card);
-		return err;
-	}
+	if (err < 0)
+		return err; /* card is freed by error handler */
 
 	*card_ret = card;
 	return 0;
@@ -233,7 +231,7 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 	card->managed = true;
 	err = snd_card_init(card, parent, idx, xid, module, extra_size);
 	if (err < 0) {
-		devres_free(card);
+		devres_free(card); /* in managed mode, we need to free manually */
 		return err;
 	}
 
@@ -297,6 +295,8 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 		mutex_unlock(&snd_card_mutex);
 		dev_err(parent, "cannot find the slot for index %d (range 0-%i), error: %d\n",
 			 idx, snd_ecards_limit - 1, err);
+		if (!card->managed)
+			kfree(card); /* manually free here, as no destructor called */
 		return err;
 	}
 	set_bit(idx, snd_cards_lock);		/* lock it */
-- 
2.35.3

