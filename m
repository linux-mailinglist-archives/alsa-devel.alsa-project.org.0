Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE57093C3
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27677F4;
	Fri, 19 May 2023 11:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27677F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489123;
	bh=YBfjH6uHSMTanJEXk6hEDpCx3Sv0QAFNdmt4KcYO+So=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rxdg9tX/qeJvuy170UXN3ubXF+9SlpGIFMQyzWSocA11KHAPBiVjaiAzeJnp5NK2B
	 y4+8LlsXLvg3fH8sBnDLi18Z6PGkzxy0lUwgyl2QLvyXkK5gRCHiaOtzKCszOf7jbk
	 JyPBqxN8avLv5dNATRoiaVy6MoxjCTsFExmLaYzc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1DF5F80691; Fri, 19 May 2023 11:32:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42980F8068D;
	Fri, 19 May 2023 11:32:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19F49F80615; Fri, 19 May 2023 11:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7046F80570
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7046F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QNm8rZ2P;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qKZIgBBQ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B1A31FE4C;
	Fri, 19 May 2023 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488701;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNu4INTiqZysz/iiZYgdyxnQy+P+Ne7nzIkpF9dq+QA=;
	b=QNm8rZ2Pb2sVW+oXMxUN0zkeUxnsHsb4veMvsJ+sRkxqhs6ieSOVHdG77nJ/drepofz3vA
	erXwIzpYQfhlif/m7iThJ7erF0YuI8H8k/9dyBMwGU7lWlalV+Fz6DNaF21SJJ0f7FOK4J
	eAqS2KJ+dltqg19J+Ojys3Y5bPpbt58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNu4INTiqZysz/iiZYgdyxnQy+P+Ne7nzIkpF9dq+QA=;
	b=qKZIgBBQ0i7DDYYHZUyouzgSD0vT4UC0l6ivaBfDbcAXuDlp3+5g53ehPT8c422V8w1hxW
	3P6suyuvuAk8rzAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 34CFD13A12;
	Fri, 19 May 2023 09:31:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IE3NC/1BZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 19/36] ALSA: seq: Drop dead code for the old broadcast support
Date: Fri, 19 May 2023 11:30:57 +0200
Message-Id: <20230519093114.28813-20-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OAUIURU4CA4JLZJSV52RIC45URXMHBQH
X-Message-ID-Hash: OAUIURU4CA4JLZJSV52RIC45URXMHBQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAUIURU4CA4JLZJSV52RIC45URXMHBQH/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The broadcast and multicast supports have been never enabled.
Let's drop the dead code.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 105 +--------------------------------
 1 file changed, 1 insertion(+), 104 deletions(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 98e8032a32e2..019af1343325 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -711,93 +711,6 @@ static int deliver_to_subscribers(struct snd_seq_client *client,
 	return (result < 0) ? result : num_ev;
 }
 
-
-#ifdef SUPPORT_BROADCAST 
-/*
- * broadcast to all ports:
- */
-static int port_broadcast_event(struct snd_seq_client *client,
-				struct snd_seq_event *event,
-				int atomic, int hop)
-{
-	int num_ev = 0, err, result = 0;
-	struct snd_seq_client *dest_client;
-	struct snd_seq_client_port *port;
-
-	dest_client = get_event_dest_client(event, SNDRV_SEQ_FILTER_BROADCAST);
-	if (dest_client == NULL)
-		return 0; /* no matching destination */
-
-	read_lock(&dest_client->ports_lock);
-	list_for_each_entry(port, &dest_client->ports_list_head, list) {
-		event->dest.port = port->addr.port;
-		/* pass NULL as source client to avoid error bounce */
-		err = snd_seq_deliver_single_event(NULL, event,
-						   SNDRV_SEQ_FILTER_BROADCAST,
-						   atomic, hop);
-		if (err < 0) {
-			/* save first error that occurs and continue */
-			if (!result)
-				result = err;
-			continue;
-		}
-		num_ev++;
-	}
-	read_unlock(&dest_client->ports_lock);
-	snd_seq_client_unlock(dest_client);
-	event->dest.port = SNDRV_SEQ_ADDRESS_BROADCAST; /* restore */
-	return (result < 0) ? result : num_ev;
-}
-
-/*
- * send the event to all clients:
- * if destination port is also ADDRESS_BROADCAST, deliver to all ports.
- */
-static int broadcast_event(struct snd_seq_client *client,
-			   struct snd_seq_event *event, int atomic, int hop)
-{
-	int err, result = 0, num_ev = 0;
-	int dest;
-	struct snd_seq_addr addr;
-
-	addr = event->dest; /* save */
-
-	for (dest = 0; dest < SNDRV_SEQ_MAX_CLIENTS; dest++) {
-		/* don't send to itself */
-		if (dest == client->number)
-			continue;
-		event->dest.client = dest;
-		event->dest.port = addr.port;
-		if (addr.port == SNDRV_SEQ_ADDRESS_BROADCAST)
-			err = port_broadcast_event(client, event, atomic, hop);
-		else
-			/* pass NULL as source client to avoid error bounce */
-			err = snd_seq_deliver_single_event(NULL, event,
-							   SNDRV_SEQ_FILTER_BROADCAST,
-							   atomic, hop);
-		if (err < 0) {
-			/* save first error that occurs and continue */
-			if (!result)
-				result = err;
-			continue;
-		}
-		num_ev += err;
-	}
-	event->dest = addr; /* restore */
-	return (result < 0) ? result : num_ev;
-}
-
-
-/* multicast - not supported yet */
-static int multicast_event(struct snd_seq_client *client, struct snd_seq_event *event,
-			   int atomic, int hop)
-{
-	pr_debug("ALSA: seq: multicast not supported yet.\n");
-	return 0; /* ignored */
-}
-#endif /* SUPPORT_BROADCAST */
-
-
 /* deliver an event to the destination port(s).
  * if the event is to subscribers or broadcast, the event is dispatched
  * to multiple targets.
@@ -826,15 +739,6 @@ static int snd_seq_deliver_event(struct snd_seq_client *client, struct snd_seq_e
 	if (event->queue == SNDRV_SEQ_ADDRESS_SUBSCRIBERS ||
 	    event->dest.client == SNDRV_SEQ_ADDRESS_SUBSCRIBERS)
 		result = deliver_to_subscribers(client, event, atomic, hop);
-#ifdef SUPPORT_BROADCAST
-	else if (event->queue == SNDRV_SEQ_ADDRESS_BROADCAST ||
-		 event->dest.client == SNDRV_SEQ_ADDRESS_BROADCAST)
-		result = broadcast_event(client, event, atomic, hop);
-	else if (event->dest.client >= SNDRV_SEQ_MAX_CLIENTS)
-		result = multicast_event(client, event, atomic, hop);
-	else if (event->dest.port == SNDRV_SEQ_ADDRESS_BROADCAST)
-		result = port_broadcast_event(client, event, atomic, hop);
-#endif
 	else
 		result = snd_seq_deliver_single_event(client, event, 0, atomic, hop);
 
@@ -936,14 +840,7 @@ static int snd_seq_client_enqueue_event(struct snd_seq_client *client,
 	if (event->queue == SNDRV_SEQ_ADDRESS_SUBSCRIBERS) {
 		event->dest.client = SNDRV_SEQ_ADDRESS_SUBSCRIBERS;
 		event->queue = SNDRV_SEQ_QUEUE_DIRECT;
-	} else
-#ifdef SUPPORT_BROADCAST
-		if (event->queue == SNDRV_SEQ_ADDRESS_BROADCAST) {
-			event->dest.client = SNDRV_SEQ_ADDRESS_BROADCAST;
-			event->queue = SNDRV_SEQ_QUEUE_DIRECT;
-		}
-#endif
-	if (event->dest.client == SNDRV_SEQ_ADDRESS_SUBSCRIBERS) {
+	} else if (event->dest.client == SNDRV_SEQ_ADDRESS_SUBSCRIBERS) {
 		/* check presence of source port */
 		struct snd_seq_client_port *src_port = snd_seq_port_use_ptr(client, event->source.port);
 		if (src_port == NULL)
-- 
2.35.3

