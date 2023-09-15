Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD87A18DB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F243DF0;
	Fri, 15 Sep 2023 10:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F243DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766628;
	bh=PSubVxXW2EPWPwy1gKjpYf1FsB135Ht5CFf7aujRm3o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XvNMKEWFBH+F+JPHHydRFJ4SIgorjzBodL0kKLHFz8aiBPCTzinPQa5fLcJVecEbM
	 Yho2yF1dvMvt9WcBgnLzXHsJmskI61+0btWQPSLEtR4lExgC5fC/esMje8LYG4ElLA
	 /EdlbZImkjddhZI5JVW4uhpTTBPk9G4iNTEC5g64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76DF4F805AD; Fri, 15 Sep 2023 10:28:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8763BF80425;
	Fri, 15 Sep 2023 10:28:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E60F80558; Fri, 15 Sep 2023 10:28:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C23F4F8047D
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C23F4F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=y9qMR22u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KNY9lMTr
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 678D51F894;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5JwLWuoAKKGGnfDoLoFMjWCyEp3gguRQwgT3d1N1+I=;
	b=y9qMR22u0W2B5hqjdsCKT4XaRfwyrPM+OGaamNmZFzL0fjW2mAVP4tyfDkHgdG92RKNxuR
	hQEEJq2GZCNMRVkpjpPfyXYAA93eR4RlNZfCj2XNh86jVYqEg9dOGjx7SpozN2G83Vs0Ao
	oAwni8r21Fo1zIw9Lb4W3lu1+5jNrfk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R5JwLWuoAKKGGnfDoLoFMjWCyEp3gguRQwgT3d1N1+I=;
	b=KNY9lMTr4RucUpSP4ns6EqfnmP22bjXyRpTd2dzAB1bVmXsHHojOYS1jT/PkS30KJZUENV
	vGZcdsfWHDUqTTBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47AC61358A;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KNd8EJcVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/13] ALSA: es1688: Fix -Wformat-truncation warning
Date: Fri, 15 Sep 2023 10:27:56 +0200
Message-Id: <20230915082802.28684-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JETVUYRNOMH6O4DIBEIXBMBGLCACTVAI
X-Message-ID-Hash: JETVUYRNOMH6O4DIBEIXBMBGLCACTVAI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JETVUYRNOMH6O4DIBEIXBMBGLCACTVAI/>
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
 sound/isa/es1688/es1688.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index f935b56eeec7..97728bf45474 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -130,9 +130,9 @@ static int snd_es1688_probe(struct snd_card *card, unsigned int n)
 
 	strscpy(card->driver, "ES1688", sizeof(card->driver));
 	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
-	snprintf(card->longname, sizeof(card->longname),
-		"%s at 0x%lx, irq %i, dma %i", chip->pcm->name, chip->port,
-		 chip->irq, chip->dma8);
+	scnprintf(card->longname, sizeof(card->longname),
+		  "%s at 0x%lx, irq %i, dma %i", chip->pcm->name, chip->port,
+		  chip->irq, chip->dma8);
 
 	if (fm_port[n] == SNDRV_AUTO_PORT)
 		fm_port[n] = port[n];	/* share the same port */
-- 
2.35.3

