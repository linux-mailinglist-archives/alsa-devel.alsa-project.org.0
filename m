Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA570D676
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:00:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A1BCA4C;
	Tue, 23 May 2023 09:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A1BCA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828825;
	bh=yBsVux825mRojnBmf7SlCALNmsxCmgJfQPi1hDtPuSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aTK+dn6yhTnJEFr6Kuwda1l+8VOXcFdhzm4RVrOjz7MZhO7DeRsekyMiQyKA9wztt
	 S8U84YgSk9OAGFNXiqrngEhN8TdRybXd3Lz8ijPSzuziWpNQUpYVFDPEkgd484gnii
	 GYLVnwsap8rycuer8sOtIjhTXg9kjKNXChHcS1EA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9907F80681; Tue, 23 May 2023 09:55:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B8EF80673;
	Tue, 23 May 2023 09:55:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7238F80638; Tue, 23 May 2023 09:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC610F8055A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC610F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EUqXzLC0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=aUmxVBbe
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB467219EE;
	Tue, 23 May 2023 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duuZwN1C9IUQLQQEAFsw/JZ4JxAL3kzU5sIEEpm2/Z8=;
	b=EUqXzLC0QgGY2mNYInw54Hs0O9Ti2wyrYx1zPwp5ZJnHqF7bq+RQGr7r0NWYKth1JsXRlD
	Wmtn2Z/18DlKT50ZVuq0ujLJUSnIhKh/49QV6wy0BDW3yFy9hM6ny2TUPXp9H5VszRR15o
	jDSAAdpo2ZeNse13KJMYTKQLbcpIVnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duuZwN1C9IUQLQQEAFsw/JZ4JxAL3kzU5sIEEpm2/Z8=;
	b=aUmxVBbexQ+QEfvys+3GiVCD2BcAxLFBuvh/IvWCESBt9h97lPmuHSZGjM9gPOTWbmhYsD
	Pyh6xWc+EdLd5QAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FF0913588;
	Tue, 23 May 2023 07:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6AueHSBxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/37] ALSA: seq: Drop dead code for the old broadcast
 support
Date: Tue, 23 May 2023 09:53:41 +0200
Message-Id: <20230523075358.9672-21-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OUYQEZ5IR7L6EWADBTTJFO6X2ID66E57
X-Message-ID-Hash: OUYQEZ5IR7L6EWADBTTJFO6X2ID66E57
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUYQEZ5IR7L6EWADBTTJFO6X2ID66E57/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The broadcast and multicast supports have been never enabled.
Let's drop the dead code.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
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

