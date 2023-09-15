Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A57A1A22
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC48820;
	Fri, 15 Sep 2023 11:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC48820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694769313;
	bh=U1p/37ZtlSumjUNc0HKmXGvNpuA442R6sstWMQxrNt0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tQqGWhHIG1AXrc3KZWFP2jFojP6TySMORJVzR6ovyixest1ShCWRo4J8GecdK2Hgr
	 dn2/33l9Y2+iVRRYuSZ603eNRSUtnDsloeDen4tiYTR80ZnHb0LPoslvc//NT/wuub
	 ctKlHWpkuVsmmRVzf+LcE+hInMJJCWhzd3MAFTN8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B564CF8057A; Fri, 15 Sep 2023 11:13:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24DB5F80567;
	Fri, 15 Sep 2023 11:13:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FFBCF80431; Fri, 15 Sep 2023 11:13:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 67E2BF80425
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E2BF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=deW/ujMd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MP4JjCZ2
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EBD9C1F899;
	Fri, 15 Sep 2023 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694769195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkK8LaUckJY43a8lRktBCRgEtKmXzGa/MN2c3P21F2g=;
	b=deW/ujMdNFKf6OpiZB1vwgD//ER0dulQzHSp13/pd0kWnPbJQtrbIkggLQekEj4EMt14i/
	hEYZSpdITWeoZ7UG9GJmToPxkB9neMrH6w06yCLzjvN1pnj1fVXMVjh/6KXar2KjsiJt8x
	yQqEiT8J2t6LTBvTAqNyJSx6XaKVGU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694769195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkK8LaUckJY43a8lRktBCRgEtKmXzGa/MN2c3P21F2g=;
	b=MP4JjCZ2oqCVO/kmebSh+UGphj5qCi/zJWEOmlD8vdKu2YJNzCTNiffRhhE6AuJgqPJ+X2
	/8Tp4JwpGfwjJ2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C33C31358A;
	Fri, 15 Sep 2023 09:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iD7ELisgBGWcWQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 09:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: cs4231: Fix -Wformat-truncation warning for
 longname string
Date: Fri, 15 Sep 2023 11:13:12 +0200
Message-Id: <20230915091313.5988-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915091313.5988-1-tiwai@suse.de>
References: <20230915091313.5988-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IQNXEQVAB6WCYIKGMOJAUADRFK2OAEPO
X-Message-ID-Hash: IQNXEQVAB6WCYIKGMOJAUADRFK2OAEPO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQNXEQVAB6WCYIKGMOJAUADRFK2OAEPO/>
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
 sound/isa/cs423x/cs4231.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/isa/cs423x/cs4231.c b/sound/isa/cs423x/cs4231.c
index 1e8923385366..c87be4be6df1 100644
--- a/sound/isa/cs423x/cs4231.c
+++ b/sound/isa/cs423x/cs4231.c
@@ -98,13 +98,13 @@ static int snd_cs4231_probe(struct device *dev, unsigned int n)
 	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
 
 	if (dma2[n] < 0)
-		snprintf(card->longname, sizeof(card->longname),
-			 "%s at 0x%lx, irq %d, dma %d",
-			 chip->pcm->name, chip->port, irq[n], dma1[n]);
+		scnprintf(card->longname, sizeof(card->longname),
+			  "%s at 0x%lx, irq %d, dma %d",
+			  chip->pcm->name, chip->port, irq[n], dma1[n]);
 	else
-		snprintf(card->longname, sizeof(card->longname),
-			 "%s at 0x%lx, irq %d, dma %d&%d",
-			 chip->pcm->name, chip->port, irq[n], dma1[n], dma2[n]);
+		scnprintf(card->longname, sizeof(card->longname),
+			  "%s at 0x%lx, irq %d, dma %d&%d",
+			  chip->pcm->name, chip->port, irq[n], dma1[n], dma2[n]);
 
 	error = snd_wss_mixer(chip);
 	if (error < 0)
-- 
2.35.3

