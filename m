Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1D7A1A21
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:15:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEC12A4C;
	Fri, 15 Sep 2023 11:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEC12A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694769307;
	bh=/lGnA7rI8koibJpRsndQr7RurpifjtLMCupZNYo29+w=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gwN60U4ndA0sNHleADKw9YyhYK9wDKJLMsmhdIlzV2+kmyAasNhjcw9DgyKRbLu/0
	 gwPvlqHJOT4C7a7przXszqW2kgWBm2emuKWYZZlJjQE6jvMsqbxhHg41UgU8EKVa5H
	 +2shHgYeda39wG/Ko8znE/0xNrwjET8gFedaNyWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0F65F8055B; Fri, 15 Sep 2023 11:13:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C774F8055B;
	Fri, 15 Sep 2023 11:13:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D74CF8047D; Fri, 15 Sep 2023 11:13:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 59300F80431
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59300F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=h7mSoMzY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gezIRnJ7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BF08E21870;
	Fri, 15 Sep 2023 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694769195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JNB/QN+tf2i0Tl/Ol2jUJbw4CqfNUZ15IK9TH78YPDo=;
	b=h7mSoMzYCmg+z/TVQ0y6k9yUq5X3QtMJ4ngAIHPIYD2rhoqvhXA97dbv3hgedQo5FZ/BO0
	UIR20bHe2k9DAe8673mER4gWBk714V0ZYBqzD7YftSr24/XyqELsRxeoy4pxwC3xTMhDkH
	rYwzzUzfB0KmGjN1XjcJqHUY6V6X41I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694769195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JNB/QN+tf2i0Tl/Ol2jUJbw4CqfNUZ15IK9TH78YPDo=;
	b=gezIRnJ7Z08rOTFXu49KGVAZjwZMl8pjYt7lKicqG/lAFqrChQolEwQBSAPhLrexe8KS/G
	137HkX/aNoeJiECQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A430313A34;
	Fri, 15 Sep 2023 09:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6NIsJysgBGWcWQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 09:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: ad1848: Fix -Wformat-truncation warning for
 longname string
Date: Fri, 15 Sep 2023 11:13:11 +0200
Message-Id: <20230915091313.5988-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915091313.5988-1-tiwai@suse.de>
References: <20230915091313.5988-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LNP6IDWE2DSRBESRZ4TSAGOETW66TSQI
X-Message-ID-Hash: LNP6IDWE2DSRBESRZ4TSAGOETW66TSQI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNP6IDWE2DSRBESRZ4TSAGOETW66TSQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The filling of card->longname can be gracefully truncated, as it's
only informative.  Use scnprintf() and suppress the superfluous
compile warning with -Wformat-truncation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/ad1848/ad1848.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/isa/ad1848/ad1848.c b/sound/isa/ad1848/ad1848.c
index c471ac2aa450..401d8df28d87 100644
--- a/sound/isa/ad1848/ad1848.c
+++ b/sound/isa/ad1848/ad1848.c
@@ -96,13 +96,13 @@ static int snd_ad1848_probe(struct device *dev, unsigned int n)
 	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
 
 	if (!thinkpad[n])
-		snprintf(card->longname, sizeof(card->longname),
-			 "%s at 0x%lx, irq %d, dma %d",
-			 chip->pcm->name, chip->port, irq[n], dma1[n]);
+		scnprintf(card->longname, sizeof(card->longname),
+			  "%s at 0x%lx, irq %d, dma %d",
+			  chip->pcm->name, chip->port, irq[n], dma1[n]);
 	else
-		snprintf(card->longname, sizeof(card->longname),
-			 "%s at 0x%lx, irq %d, dma %d [Thinkpad]",
-			 chip->pcm->name, chip->port, irq[n], dma1[n]);
+		scnprintf(card->longname, sizeof(card->longname),
+			  "%s at 0x%lx, irq %d, dma %d [Thinkpad]",
+			  chip->pcm->name, chip->port, irq[n], dma1[n]);
 
 	error = snd_card_register(card);
 	if (error < 0)
-- 
2.35.3

