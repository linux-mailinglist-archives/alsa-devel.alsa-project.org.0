Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574B4A10D5B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 18:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55E80602A3;
	Tue, 14 Jan 2025 18:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55E80602A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736875079;
	bh=xsMW00AMSLBMmaXbwTDPbCkfRGgBFdLDUg45DJZXgvo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=V4LP35/s+XFOQOrY1Io2HMNBuy+AqGwu5ATV3BCA+mqU+Y9wyKpIPnT3noNeqlF8g
	 lh7zBUyzv5Mv4Qo6irD/uIFFGw2hIiK6SvLexMIogOxoLRA0w0bJYNVELvnS73J+p4
	 IiS4x5UY2y94h8e4bQ1P/S+7cgMkJitnZ3EOOiMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0319F80617; Tue, 14 Jan 2025 18:17:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC82DF8061A;
	Tue, 14 Jan 2025 18:17:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C0FFF800B8; Tue, 14 Jan 2025 18:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85B8CF80549
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 18:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B8CF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wNZrF4cR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mXh15JQM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=wNZrF4cR;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mXh15JQM
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7B7FF21158;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+05/+8JcKiDiswzaPPiUTCB200jxJJ+helAxf0CcWc=;
	b=wNZrF4cR+IwZZj45frsSTxIH8peBdHbwSEJURFfNQKXFuUzB34XEpEUqU/UFu8cm3rr1nE
	79Me59L3CL6Hpt3swodi6pPMjcl9fHrxffUzza3+c4GANEZAUA/CDEW+X8Y0mwB7/bGIbc
	pXZ1Sv83c18NrK7cAEue+9eEbgHt/ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+05/+8JcKiDiswzaPPiUTCB200jxJJ+helAxf0CcWc=;
	b=mXh15JQMQwDxY7AysLblbAOsRwKA6lNs7JQQfdo+Rcwu3wBk2eOu/GW+61uW/GDY6s4b9X
	mnUXyWwfpHMKFDCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+05/+8JcKiDiswzaPPiUTCB200jxJJ+helAxf0CcWc=;
	b=wNZrF4cR+IwZZj45frsSTxIH8peBdHbwSEJURFfNQKXFuUzB34XEpEUqU/UFu8cm3rr1nE
	79Me59L3CL6Hpt3swodi6pPMjcl9fHrxffUzza3+c4GANEZAUA/CDEW+X8Y0mwB7/bGIbc
	pXZ1Sv83c18NrK7cAEue+9eEbgHt/ME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+05/+8JcKiDiswzaPPiUTCB200jxJJ+helAxf0CcWc=;
	b=mXh15JQMQwDxY7AysLblbAOsRwKA6lNs7JQQfdo+Rcwu3wBk2eOu/GW+61uW/GDY6s4b9X
	mnUXyWwfpHMKFDCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E6681384C;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AJv0Fb6bhmdrFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 17:15:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/5] Sync UAPI asequencer.h with 6.14 kernel
Date: Tue, 14 Jan 2025 18:15:32 +0100
Message-ID: <20250114171538.2751-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114171538.2751-1-tiwai@suse.de>
References: <20250114171538.2751-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: 6W2F3RPDJ3GF7SVS2C4EUXJBRMBX7VIZ
X-Message-ID-Hash: 6W2F3RPDJ3GF7SVS2C4EUXJBRMBX7VIZ
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6W2F3RPDJ3GF7SVS2C4EUXJBRMBX7VIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are the new event types for UMP EP and FB notifications as well
as the new struct for them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/uapi/asequencer.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/sound/uapi/asequencer.h b/include/sound/uapi/asequencer.h
index bd3c7a317f24..9682795bba87 100644
--- a/include/sound/uapi/asequencer.h
+++ b/include/sound/uapi/asequencer.h
@@ -10,7 +10,7 @@
 #include <sound/asound.h>
 
 /** version of the sequencer */
-#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 4)
+#define SNDRV_SEQ_VERSION SNDRV_PROTOCOL_VERSION(1, 0, 5)
 
 /**
  * definition of sequencer event types
@@ -92,6 +92,9 @@
 #define SNDRV_SEQ_EVENT_PORT_SUBSCRIBED	66	/* ports connected */
 #define SNDRV_SEQ_EVENT_PORT_UNSUBSCRIBED 67	/* ports disconnected */
 
+#define SNDRV_SEQ_EVENT_UMP_EP_CHANGE	68	/* UMP EP info has changed */
+#define SNDRV_SEQ_EVENT_UMP_BLOCK_CHANGE 69	/* UMP block info has changed */
+
 /* 70-89:  synthesizer events - obsoleted */
 
 /** user-defined events with fixed length
@@ -253,6 +256,12 @@ struct snd_seq_ev_quote {
 	struct snd_seq_event *event;		/* quoted event */
 } __attribute__((packed));
 
+	/* UMP info change notify */
+struct snd_seq_ev_ump_notify {
+	unsigned char client;	/* Client number */
+	unsigned char block;	/* Block number (optional) */
+};
+
 union snd_seq_event_data { /* event data... */
 	struct snd_seq_ev_note note;
 	struct snd_seq_ev_ctrl control;
@@ -265,6 +274,7 @@ union snd_seq_event_data { /* event data... */
 	struct snd_seq_connect connect;
 	struct snd_seq_result result;
 	struct snd_seq_ev_quote quote;
+	struct snd_seq_ev_ump_notify ump_notify;
 };
 
 	/* sequencer event */
-- 
2.43.0

