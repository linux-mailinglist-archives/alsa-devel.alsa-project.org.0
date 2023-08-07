Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5490D7726C7
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D6EDDEF;
	Mon,  7 Aug 2023 15:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D6EDDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416526;
	bh=SUDghj9Oqx0ofdNnKrx0JNxVpCVDc4i/Sbmh/T7pKG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k1hv0yCk6Avbe4p6RKOadYkO0LHnJa1vMB+SX59wZlLmuyjha21O5ZGazLdChOHZm
	 fU5dxgwWa57isENTUYLrVyK04PRSqbOeGYWY7jwlTV9zXfnSxUz73QT3ZEjvP/B45u
	 t20AI8b6BoPe7lqRYJoT7E1BINgAQeLBBLNrnJUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B239F805BA; Mon,  7 Aug 2023 15:53:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 146AEF805BB;
	Mon,  7 Aug 2023 15:53:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4F64F8016D; Mon,  7 Aug 2023 15:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BB32F80535
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BB32F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iYKh8pO2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=W4kw11c/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6C7171FDF4;
	Mon,  7 Aug 2023 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHyRNooG5ngGjy65JnuP96SKT9Scua7aqQ1HTrWTV9Y=;
	b=iYKh8pO2EnvO8mxaJO2J60KhmAdz3GCR3fk8sksSM2q9d/lyoe8k9SYvH6j9yho+KSv1FS
	AYY3w4tAllNu/4Tv7xAf0dvqkbUG1gVXAWZ08DOlLDNRqdgvmvzFJE48HhVUQ/0GXWOYE7
	DnxG/D5M05wsB+5IUZyATQPuE6B0PqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHyRNooG5ngGjy65JnuP96SKT9Scua7aqQ1HTrWTV9Y=;
	b=W4kw11c/h4Hh2Da/oEUTKMd+qCd9QIhHD0dvmbBCE3i6ZhX/H2zoEwvQUEJ/OXkbjrOavi
	CqzJXUBSEbsZMfBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 324BE13A6F;
	Mon,  7 Aug 2023 13:52:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KMJfCwz30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH RFC 5/6] ALSA: control: Reference card by ctl_dev
Date: Mon,  7 Aug 2023 15:52:06 +0200
Message-Id: <20230807135207.17708-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YNKGXORRLSQDATKHROMKPD37LZ2UG57C
X-Message-ID-Hash: YNKGXORRLSQDATKHROMKPD37LZ2UG57C
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

Add the reference to the card object at control device
initialization.  This fixes the potential UAF by the delayed kobj
release.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 5b9340f5cb8c..7ac077b57709 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -2395,7 +2395,7 @@ int snd_ctl_create(struct snd_card *card)
 	if (snd_BUG_ON(card->number < 0 || card->number >= SNDRV_CARDS))
 		return -ENXIO;
 
-	snd_device_initialize(&card->ctl_dev, card, NULL);
+	snd_device_initialize(&card->ctl_dev, card, card);
 	dev_set_name(&card->ctl_dev, "controlC%d", card->number);
 
 	err = snd_device_new(card, SNDRV_DEV_CONTROL, card, &ops);
-- 
2.35.3

