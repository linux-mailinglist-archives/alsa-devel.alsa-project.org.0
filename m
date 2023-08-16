Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F677E5FD
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE47844;
	Wed, 16 Aug 2023 18:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE47844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201964;
	bh=OKPiTg6FwlFvX2rrJjBEWEffWo3+Mp5JCRJsN7Npf0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oGjUiXLYlFj5NhybMC3xPpzzrnjeO63aqfOWALFQ/oAZC5moq3l+LzHrp0TyPkHCc
	 nrXzf+INzXVEmiAyzsgf92pG9nEkjKLioFLSJYpjJGpfV9QpGXWquiPqJtr7AV6Ypk
	 LTyibRCq4tNjSYbi8INFiNlgLm5XOShzZk+piMRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ECEDF805C2; Wed, 16 Aug 2023 18:03:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5AC6F805C1;
	Wed, 16 Aug 2023 18:03:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29799F805AA; Wed, 16 Aug 2023 18:03:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B9FDF80536
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B9FDF80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=gthfc1Xy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1/xNzTev
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5C3B2218FA;
	Wed, 16 Aug 2023 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77O/JPDg7vKWbPqXtZBxgbM5y4SSc9UJZ+CrN6/1FI0=;
	b=gthfc1XyFb+znSHF9qSHog3mWBsmrvZhH0EQWfUxu8M6t2IAyyj7z3a3p5fNoChdpiokkb
	QYKeO4LBiVwEbYQpE6E23VH0ISpu6W/qy11jRttJ5+h/MeQ7U3gXm/qqNe6XUnKe8WJPZR
	gTEYWjjhovX5qcKXFX8060vHK8pq+Bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77O/JPDg7vKWbPqXtZBxgbM5y4SSc9UJZ+CrN6/1FI0=;
	b=1/xNzTev7iz8ldWMFb/ITZVHnClVT8QMzwJvY4FyRK1XhLN7JDNfzz+tGFTo/ERCTh7atN
	RNFu78wT309+hvDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F2AE133F2;
	Wed, 16 Aug 2023 16:02:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6HuSDjDz3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 9/9] ALSA: core: Drop snd_device_initialize()
Date: Wed, 16 Aug 2023 18:02:52 +0200
Message-Id: <20230816160252.23396-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230816160252.23396-1-tiwai@suse.de>
References: <20230816160252.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NSIU6CULE67Y6TFNFOYUHSHBFODKWM4Z
X-Message-ID-Hash: NSIU6CULE67Y6TFNFOYUHSHBFODKWM4Z
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSIU6CULE67Y6TFNFOYUHSHBFODKWM4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now all users of snd_device_intialize() are gone, let's drop it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  1 -
 sound/core/init.c    | 23 -----------------------
 2 files changed, 24 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index f3f6b720a278..dfef0c9d4b9f 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -240,7 +240,6 @@ extern struct dentry *sound_debugfs_root;
 void snd_request_card(int card);
 
 int snd_device_alloc(struct device **dev_p, struct snd_card *card);
-void snd_device_initialize(struct device *dev, struct snd_card *card);
 
 int snd_register_device(int type, struct snd_card *card, int dev,
 			const struct file_operations *f_ops,
diff --git a/sound/core/init.c b/sound/core/init.c
index a4de9f00d90f..d61bde1225f2 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -111,29 +111,6 @@ static int get_slot_from_bitmask(int mask, int (*check)(struct module *, int),
 	return mask; /* unchanged */
 }
 
-/* the default release callback set in snd_device_initialize() below;
- * this is just NOP for now, as almost all jobs are already done in
- * dev_free callback of snd_device chain instead.
- */
-static void default_release(struct device *dev)
-{
-}
-
-/**
- * snd_device_initialize - Initialize struct device for sound devices
- * @dev: device to initialize
- * @card: card to assign, optional
- */
-void snd_device_initialize(struct device *dev, struct snd_card *card)
-{
-	device_initialize(dev);
-	if (card)
-		dev->parent = &card->card_dev;
-	dev->class = &sound_class;
-	dev->release = default_release;
-}
-EXPORT_SYMBOL_GPL(snd_device_initialize);
-
 /* the default release callback set in snd_device_alloc() */
 static void default_release_alloc(struct device *dev)
 {
-- 
2.35.3

