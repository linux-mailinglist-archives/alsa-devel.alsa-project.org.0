Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F9A7726C2
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A44A4E;
	Mon,  7 Aug 2023 15:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A44A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416505;
	bh=1B0PU6iKuGgTa3v8xog+pp7rzt8cgLPXM34mweDfHL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R/en7gCmvPyoGlcNnCQP4WsICCo7kKvn7xUaPrvy1dHryM4wjDq0my3uF27P7/R3N
	 ksZD837HBnLtBf1c7SKZkDYOQMlyvP2LxIzAkNEgIcYiX7Qlc/ylchcJ5oe2pg8VSo
	 iZLsgscGTjXJQ/Bgb1pCEe5Ss1OMTQ5nMtW5mQdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75CFAF80558; Mon,  7 Aug 2023 15:53:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 191BDF80558;
	Mon,  7 Aug 2023 15:53:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 631C6F8051E; Mon,  7 Aug 2023 15:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A280F8016A
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A280F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZsrKaOoD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=c6ZC+nlG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B54651FDF0;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2icgKmNFV61ZDxAVK85eTeSq6RTwbU2hfWHpU5z0lvw=;
	b=ZsrKaOoDucxfI/lywXM9/zm3h82e3bWPIJdXJxsv54ec9OK2lVqBwS2QVP5un4yBDG3jS/
	CDH5YNpA0xR9+6GZYlZOJG07VLksuI5f2EwqPYkVz8CZWoKQfJqcJkXlOX7mqI+4xboW7I
	mRRYPDsan0kqxTDdI4Aj4It2LtMtbG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2icgKmNFV61ZDxAVK85eTeSq6RTwbU2hfWHpU5z0lvw=;
	b=c6ZC+nlGXc4fjRjaRS1qlh7tfwGdol4RuqaI13dZVhQi/e2JnzYX+18tiFIX6o0O/V14Ty
	jllbft7gPvcproBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93DC813910;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SBIjIwv30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH RFC 2/6] ALSA: core: Fix potential UAF by delayed kobject
 release of card_dev
Date: Mon,  7 Aug 2023 15:52:02 +0200
Message-Id: <20230807135207.17708-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MO3BJNYVZBK6PQAYZVNRIU6P2VEDXXSD
X-Message-ID-Hash: MO3BJNYVZBK6PQAYZVNRIU6P2VEDXXSD
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

Use a new refmem allocation for the card object, and fix the potential
UAF of card object due to the race between the devres and the delayed
kobj release.  Now the devres keeps only the card object pointer, not
the card object itself, and the card object is unreferenced at both
releases.

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

