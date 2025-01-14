Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F8A10D55
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 18:17:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2CD60298;
	Tue, 14 Jan 2025 18:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2CD60298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736875043;
	bh=9yqytV9B9G/EMZsQ/JdJldSH/fHuhjdkrCC3LnCSHPM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eVFvZNC4Vc5elrVDbIo9ylbhVONjdZi7wce+uxUeFmRvLxd1UNMig1tnrLIDcmwOB
	 LUMzY3sMGpHeIomnKDt/g1e2A1nhkg9kTAhgpe6NF5ABheUZGeYNDrv3WTBb92ttMz
	 leEZXjno96qu3RQtkR2sA8vPwFLLdomwoPziI+DA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D60F805E3; Tue, 14 Jan 2025 18:16:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2D2AF805E1;
	Tue, 14 Jan 2025 18:16:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 362E8F80510; Tue, 14 Jan 2025 18:15:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C699CF8055A
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 18:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C699CF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NeZNMdfY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9QYkC9Fz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=NeZNMdfY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9QYkC9Fz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E20831F393;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/9k0DlFohVDJP6FTuliDNQyWkGOf+T6Jl4c/IazWEE=;
	b=NeZNMdfYQQczB1l1iFOABM24LHztDj18TQTqfmHw0VftVI/FfRL4Iwh5ba6+MNduBnUyMO
	CKFHJAJl6xiKBjeU4mPcRF4Qw7X4043BNDBjC1lMH4jUJ69+azcjpzd4+necm3SwO80YYU
	1fSVKcrA3TemwHgcqWDRZXQ5MMnj+O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/9k0DlFohVDJP6FTuliDNQyWkGOf+T6Jl4c/IazWEE=;
	b=9QYkC9FzRH6wqlYMzC58T/8FlPSkL/hN/XL66l5ctXuVKWfX5wyB2hIDxd60hen5caHrC3
	hHGj1QO5PJqfNuBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NeZNMdfY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9QYkC9Fz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/9k0DlFohVDJP6FTuliDNQyWkGOf+T6Jl4c/IazWEE=;
	b=NeZNMdfYQQczB1l1iFOABM24LHztDj18TQTqfmHw0VftVI/FfRL4Iwh5ba6+MNduBnUyMO
	CKFHJAJl6xiKBjeU4mPcRF4Qw7X4043BNDBjC1lMH4jUJ69+azcjpzd4+necm3SwO80YYU
	1fSVKcrA3TemwHgcqWDRZXQ5MMnj+O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/9k0DlFohVDJP6FTuliDNQyWkGOf+T6Jl4c/IazWEE=;
	b=9QYkC9FzRH6wqlYMzC58T/8FlPSkL/hN/XL66l5ctXuVKWfX5wyB2hIDxd60hen5caHrC3
	hHGj1QO5PJqfNuBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE4FC13AEB;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCdYLb6bhmdrFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 17:15:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/5] seq: Define new events for UMP EP/FB change
 notifications
Date: Tue, 14 Jan 2025 18:15:35 +0100
Message-ID: <20250114171538.2751-6-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114171538.2751-1-tiwai@suse.de>
References: <20250114171538.2751-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E20831F393
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 7RNSJSJV72CUTP75KRPA5HOMKSVSCXBJ
X-Message-ID-Hash: 7RNSJSJV72CUTP75KRPA5HOMKSVSCXBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RNSJSJV72CUTP75KRPA5HOMKSVSCXBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two new sequencer event types are added for notifications of UMP info
changes: SND_SEQ_EVENT_UMP_EP_CHANGE (68) and
SND_SEQ_EVENT_UMP_BLOCK_CHANGE (69).

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/local.h     |  1 +
 include/seq_event.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/include/local.h b/include/local.h
index 512e44555361..2b38ce647243 100644
--- a/include/local.h
+++ b/include/local.h
@@ -208,6 +208,7 @@
 #define snd_seq_result		sndrv_seq_result
 #define snd_seq_queue_skew	sndrv_seq_queue_skew
 #define snd_seq_ev_queue_control	sndrv_seq_ev_queue_control
+#define snd_seq_ev_ump_notify	sndrv_seq_ev_ump_notify
 #define snd_seq_client_t	sndrv_seq_client_t
 #define snd_seq_client_type_t	sndrv_seq_client_type_t
 
diff --git a/include/seq_event.h b/include/seq_event.h
index 0b59202f6e62..da542b106a48 100644
--- a/include/seq_event.h
+++ b/include/seq_event.h
@@ -135,6 +135,11 @@ enum snd_seq_event_type {
 	/** Ports disconnected; event data type = #snd_seq_connect_t */
 	SND_SEQ_EVENT_PORT_UNSUBSCRIBED,
 
+	/** UMP Endpoint info has changed; event data type = #snd_seq_ev_ump_notify_t */
+	SND_SEQ_EVENT_UMP_EP_CHANGE,
+	/** UMP Block info has changed; event data type = #snd_seq_ev_ump_notify_t */
+	SND_SEQ_EVENT_UMP_BLOCK_CHANGE,
+
 	/** user-defined event; event data type = any (fixed size) */
 	SND_SEQ_EVENT_USR0 = 90,
 	/** user-defined event; event data type = any (fixed size) */
@@ -294,6 +299,12 @@ typedef struct snd_seq_ev_queue_control {
 	} param;				/**< data value union */
 } snd_seq_ev_queue_control_t;
 
+/** UMP info change notify */
+typedef struct snd_seq_ev_ump_notify {
+	unsigned char client;	/**< Client number */
+	unsigned char block;	/**< Block number (optional) */
+} snd_seq_ev_ump_notify_t;
+
 /** Sequencer event data */
 typedef union snd_seq_event_data {
 	snd_seq_ev_note_t note;		/**< note information */
@@ -306,6 +317,7 @@ typedef union snd_seq_event_data {
 	snd_seq_addr_t addr;		/**< address */
 	snd_seq_connect_t connect;	/**< connect information */
 	snd_seq_result_t result;	/**< operation result code */
+	snd_seq_ev_ump_notify_t ump_notify; /**< UMP info change notification */
 } snd_seq_event_data_t;
 
 /** Sequencer event */
-- 
2.43.0

