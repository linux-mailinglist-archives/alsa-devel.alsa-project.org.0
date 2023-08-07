Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B58C7726A9
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1FB827;
	Mon,  7 Aug 2023 15:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1FB827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416443;
	bh=grMkiisXPdR7VJ7lbBaB1p+Jhord5C+N/3OlVGAvT40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k6gJMrNgYIflZN1/N0rBA3GLpHpnMqxRhk7eePrgLmgjG1ysRiex88XbOxgmpkGoO
	 u5dNYpLU9DpQIqHVzqAm+F4Gbnhv1zJ153g0Rvim9+lw0AsNAMUQq4JJD+DhLXP+w6
	 xLMUeRNFgyg3QS+7SF2oNqUCMx0Ra3+Nf0z7N1Ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E192F8055A; Mon,  7 Aug 2023 15:52:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D87F80558;
	Mon,  7 Aug 2023 15:52:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2EF6F80544; Mon,  7 Aug 2023 15:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61A4DF8016D
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A4DF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cwpj2d54;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JKeY7eLB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DA97321A83;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L035eWrwnWLfJM1BAPZExZXTo8cbCDl9sztkGADUWLs=;
	b=cwpj2d54m7GEyQYDqH8SxN4EE7rDFlCMbXcnUb6/6FjLT4VDpMW8USa0chrGe76zY22/EZ
	Z+M7k2RH534CuiGTxXvRFMDzw0/XP7O/I8H/LzWCz/lL6CuE/MxTZcgGLadHjvz5ZN7gHE
	y4IC3KTuMBri7ZGdhCktZ/BJyruxZQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L035eWrwnWLfJM1BAPZExZXTo8cbCDl9sztkGADUWLs=;
	b=JKeY7eLBBpBgUeJ4Mwb7rC4yjQWyLyg8dG/+TrOb3VxfMJj25Vgrn2rS0cCPoU9z0tL09i
	FmnM7VXHHI7Hn/Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B91FF13910;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aIA7LAv30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH 2/6] ALSA: core: Fix race between devres and delayed kobject
 release for card_dev
Date: Mon,  7 Aug 2023 15:52:03 +0200
Message-Id: <20230807135207.17708-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IIXCSF4A5HB6IT7VKX4MCFHXTXZIHIMV
X-Message-ID-Hash: IIXCSF4A5HB6IT7VKX4MCFHXTXZIHIMV
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use a new refmem allocation for the card object, and fix the race
between the devres and the delayed kobj release.  Now the devres keeps
only the card object pointer, not the card object itself, and the card
object is unreferenced at both releases.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 7e7c4b8d4e11..22da438faf40 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -231,7 +231,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 
 	if (extra_size < 0)
 		extra_size = 0;
-	card = kzalloc(sizeof(*card) + extra_size, GFP_KERNEL);
+	card = snd_refmem_alloc(sizeof(*card) + extra_size, NULL);
 	if (!card)
 		return -ENOMEM;
 
@@ -246,7 +246,14 @@ EXPORT_SYMBOL(snd_card_new);
 
 static void __snd_card_release(struct device *dev, void *data)
 {
-	snd_card_free(data);
+	struct snd_card **card_p = data;
+	struct snd_card *card;
+
+	if (card_p) {
+		card = *card_p;
+		snd_card_free(card);
+		snd_refmem_put(card);
+	}
 }
 
 /**
@@ -279,21 +286,22 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 		      struct snd_card **card_ret)
 {
 	struct snd_card *card;
+	struct snd_card **card_devres;
 	int err;
 
 	*card_ret = NULL;
-	card = devres_alloc(__snd_card_release, sizeof(*card) + extra_size,
-			    GFP_KERNEL);
-	if (!card)
+	card_devres = devres_alloc(__snd_card_release, sizeof(void *), GFP_KERNEL);
+	if (!card_devres)
 		return -ENOMEM;
-	card->managed = true;
-	err = snd_card_init(card, parent, idx, xid, module, extra_size);
-	if (err < 0) {
-		devres_free(card); /* in managed mode, we need to free manually */
-		return err;
-	}
+	devres_add(parent, card_devres);
 
-	devres_add(parent, card);
+	err = snd_card_new(parent, idx, xid, module, extra_size, &card);
+	if (err)
+		return err;
+
+	card->managed = true;
+	snd_refmem_get(card);
+	*card_devres = card;
 	*card_ret = card;
 	return 0;
 }
@@ -353,8 +361,7 @@ static int snd_card_init(struct snd_card *card, struct device *parent,
 		mutex_unlock(&snd_card_mutex);
 		dev_err(parent, "cannot find the slot for index %d (range 0-%i), error: %d\n",
 			 idx, snd_ecards_limit - 1, err);
-		if (!card->managed)
-			kfree(card); /* manually free here, as no destructor called */
+		snd_refmem_put(card); /* manually free here, as no destructor called */
 		return err;
 	}
 	set_bit(idx, snd_cards_lock);		/* lock it */
@@ -650,8 +657,7 @@ static int snd_card_do_free(struct snd_card *card)
 #endif
 	if (card->release_completion)
 		complete(card->release_completion);
-	if (!card->managed)
-		kfree(card);
+	snd_refmem_put(card);
 	return 0;
 }
 
-- 
2.35.3

