Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B47726C0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:55:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47032857;
	Mon,  7 Aug 2023 15:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47032857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416499;
	bh=F5UBGA3uNyhZW/Snbi6YieWUBFm+/c1lKKGicfqt0zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HIUc5Ai9ahGo1KpzZ4nxI9pSGLis/vZbtMJKrm2wec1ps8KhjEhrpbyNarKwTjNGv
	 ay4Kq++YcjtvQH2AWrbjH0AinLDNmziwkznI5V2BhGODqeGhxoI4sfB75hkR3lsDmK
	 8J7tN8l/nb6tOT6JyVe5RmU/bLws0o40MWsEeu8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AA99F8016B; Mon,  7 Aug 2023 15:53:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8828F8016D;
	Mon,  7 Aug 2023 15:53:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2BAEF8051E; Mon,  7 Aug 2023 15:53:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 312C4F80534
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 312C4F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BR35uX5Y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Xe80AthX
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A2AF721A84;
	Mon,  7 Aug 2023 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeejrhn4dqDZnwj0CNviEVNLWOu4ithaovGao1w8l9E=;
	b=BR35uX5YXGQ8J80QqgK5q/x99pkswlYyfzG9rB3L8jXXyX587m0EbMry8F1y71haFJwlN6
	hXNitoIYmA7Q/nyTHiMsBsZpZe8h3/0XAB/VKHugtY2iI/1x3uPMthswq+QxsjcDGZHVxS
	WiloGmwppOMyL48V73vJuSpahOdzFLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeejrhn4dqDZnwj0CNviEVNLWOu4ithaovGao1w8l9E=;
	b=Xe80AthXLpNhXF2A3AxTVq5mA9Qe4mWxlMSIgKeCoxVU0AmqAyUl/OvRluYgFLMg+DPHh3
	UyNDphozMjFsMAAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F2DA13910;
	Mon,  7 Aug 2023 13:52:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GGM4Ggz30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:12 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH RFC 6/6] ALSA: compress: Reference card by the device
Date: Mon,  7 Aug 2023 15:52:07 +0200
Message-Id: <20230807135207.17708-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HFNJGOGYD7BKKWNX2UQBZ2E47JXXKSGY
X-Message-ID-Hash: HFNJGOGYD7BKKWNX2UQBZ2E47JXXKSGY
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

Add the reference to the card object at compress device
initialization.  This fixes the potential UAF by the delayed kobj
release.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index d91fa8925cde..971f6d9f5906 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1189,7 +1189,7 @@ int snd_compress_new(struct snd_card *card, int device,
 
 	snd_compress_set_id(compr, id);
 
-	snd_device_initialize(&compr->dev, card, NULL);
+	snd_device_initialize(&compr->dev, card, card);
 	dev_set_name(&compr->dev, "comprC%iD%i", card->number, device);
 
 	ret = snd_device_new(card, SNDRV_DEV_COMPRESS, compr, &ops);
-- 
2.35.3

