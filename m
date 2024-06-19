Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9090C90F22C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 17:29:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B01C4E67;
	Wed, 19 Jun 2024 17:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B01C4E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718810997;
	bh=Q+I7QMz5d2GPBZlf9ga12Rx0I8x2FTczsKdUVlPXiuY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TmTXmh5K7gDSnIo3VSdDIEqqpyQUahUwUBhpTkGpKMlwCdiwLZ86b3pVKrraFBEIA
	 I1QXjz7x3YLV8IUFKhB//aLPFTfpkJrUpwRCYrVDSGYw/bBZfbtQBoPYBCjACpeFSG
	 KWWUeIA4e0CleRXso1LQGvPLhx+zgjwqvIajCniQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 059D8F80602; Wed, 19 Jun 2024 17:29:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46548F805FF;
	Wed, 19 Jun 2024 17:29:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDE0AF805E3; Wed, 19 Jun 2024 17:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7444F8023A
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 17:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7444F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZeEovv6Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=93DIMXLJ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ZeEovv6Q;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=93DIMXLJ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BBDC21A2C;
	Wed, 19 Jun 2024 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LnqGy5ovUhK0PBDXZ0fw0CRxxl2UWlUISV4j/LbwSk=;
	b=ZeEovv6Q//DgZTvkEl3HhTv3gDCiLIAFL3eQ7xBuLwuxfceWVT4qFzNXJl9+/kZSOvN23D
	r0pr+U/gmQ4o1sqyNZcqi6t/stvoQLTi+k8hGCOORMjKcTYm1LDP5qtJYaNY8lLUqp5in9
	Z9rU0Ez/CpZsJk5TgoITaGskBOPmb9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LnqGy5ovUhK0PBDXZ0fw0CRxxl2UWlUISV4j/LbwSk=;
	b=93DIMXLJzKiV6eG82mBxKbB30sCMkSNK7+wm1eMj4kiE90yUzPVtRb9QfH2k5mb8bL88L1
	xBjN7i8nkQQZRvAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZeEovv6Q;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=93DIMXLJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LnqGy5ovUhK0PBDXZ0fw0CRxxl2UWlUISV4j/LbwSk=;
	b=ZeEovv6Q//DgZTvkEl3HhTv3gDCiLIAFL3eQ7xBuLwuxfceWVT4qFzNXJl9+/kZSOvN23D
	r0pr+U/gmQ4o1sqyNZcqi6t/stvoQLTi+k8hGCOORMjKcTYm1LDP5qtJYaNY8lLUqp5in9
	Z9rU0Ez/CpZsJk5TgoITaGskBOPmb9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LnqGy5ovUhK0PBDXZ0fw0CRxxl2UWlUISV4j/LbwSk=;
	b=93DIMXLJzKiV6eG82mBxKbB30sCMkSNK7+wm1eMj4kiE90yUzPVtRb9QfH2k5mb8bL88L1
	xBjN7i8nkQQZRvAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E367813AAA;
	Wed, 19 Jun 2024 15:28:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHUKNh75cmYRJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Jun 2024 15:28:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/4] ump: Add missing *_set variants for
 snd_ump_endpoint_info and snd_ump_block_info
Date: Wed, 19 Jun 2024 17:28:50 +0200
Message-ID: <20240619152855.6809-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619152855.6809-1-tiwai@suse.de>
References: <20240619152855.6809-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0BBDC21A2C
Message-ID-Hash: 3D7BQIIKZ4N74SG4FIXPCDBN32FIJQ6I
X-Message-ID-Hash: 3D7BQIIKZ4N74SG4FIXPCDBN32FIJQ6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3D7BQIIKZ4N74SG4FIXPCDBN32FIJQ6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The API functions to fill the data on snd_ump_endpoint_info and
snd_ump_block_info were missing.  Let's add them.

They can be used to construct a virtual UMP endpoint and block.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/ump.h     |  30 ++++-
 src/rawmidi/ump.c | 304 ++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 322 insertions(+), 12 deletions(-)

diff --git a/include/ump.h b/include/ump.h
index 1e5e053454b3..45b3ad270db7 100644
--- a/include/ump.h
+++ b/include/ump.h
@@ -77,6 +77,7 @@ size_t snd_ump_endpoint_info_sizeof(void);
 #define snd_ump_endpoint_info_alloca(ptr) __snd_alloca(ptr, snd_ump_endpoint_info)
 int snd_ump_endpoint_info_malloc(snd_ump_endpoint_info_t **info);
 void snd_ump_endpoint_info_free(snd_ump_endpoint_info_t *info);
+void snd_ump_endpoint_info_clear(snd_ump_endpoint_info_t *info);
 void snd_ump_endpoint_info_copy(snd_ump_endpoint_info_t *dst, const snd_ump_endpoint_info_t *src);
 int snd_ump_endpoint_info_get_card(const snd_ump_endpoint_info_t *info);
 int snd_ump_endpoint_info_get_device(const snd_ump_endpoint_info_t *info);
@@ -93,6 +94,20 @@ const char *snd_ump_endpoint_info_get_name(const snd_ump_endpoint_info_t *info);
 const char *snd_ump_endpoint_info_get_product_id(const snd_ump_endpoint_info_t *info);
 int snd_ump_endpoint_info(snd_ump_t *ump, snd_ump_endpoint_info_t *info);
 
+void snd_ump_endpoint_info_set_card(snd_ump_endpoint_info_t *info, unsigned int card);
+void snd_ump_endpoint_info_set_device(snd_ump_endpoint_info_t *info, unsigned int device);
+void snd_ump_endpoint_info_set_flags(snd_ump_endpoint_info_t *info, unsigned int flags);
+void snd_ump_endpoint_info_set_protocol_caps(snd_ump_endpoint_info_t *info, unsigned int caps);
+void snd_ump_endpoint_info_set_protocol(snd_ump_endpoint_info_t *info, unsigned int protocols);
+void snd_ump_endpoint_info_set_num_blocks(snd_ump_endpoint_info_t *info, unsigned int num_blocks);
+void snd_ump_endpoint_info_set_version(snd_ump_endpoint_info_t *info, unsigned int version);
+void snd_ump_endpoint_info_set_manufacturer_id(snd_ump_endpoint_info_t *info, unsigned int id);
+void snd_ump_endpoint_info_set_family_id(snd_ump_endpoint_info_t *info, unsigned int id);
+void snd_ump_endpoint_info_set_model_id(snd_ump_endpoint_info_t *info, unsigned int id);
+void snd_ump_endpoint_info_set_sw_revision(snd_ump_endpoint_info_t *info, const unsigned char *id);
+void snd_ump_endpoint_info_set_name(snd_ump_endpoint_info_t *info, const char *name);
+void snd_ump_endpoint_info_set_product_id(snd_ump_endpoint_info_t *info, const char *id);
+
 /** Bit flag for MIDI 1.0 port w/o restrict in UMP Block info flags */
 #define SND_UMP_BLOCK_IS_MIDI1		(1U << 0)
 /** Bit flag for 31.25Kbps B/W MIDI1 port in UMP Block info flags */
@@ -118,11 +133,11 @@ size_t snd_ump_block_info_sizeof(void);
 #define snd_ump_block_info_alloca(ptr) __snd_alloca(ptr, snd_ump_block_info)
 int snd_ump_block_info_malloc(snd_ump_block_info_t **info);
 void snd_ump_block_info_free(snd_ump_block_info_t *info);
+void snd_ump_block_info_clear(snd_ump_block_info_t *info);
 void snd_ump_block_info_copy(snd_ump_block_info_t *dst, const snd_ump_block_info_t *src);
 int snd_ump_block_info_get_card(const snd_ump_block_info_t *info);
 int snd_ump_block_info_get_device(const snd_ump_block_info_t *info);
 unsigned int snd_ump_block_info_get_block_id(const snd_ump_block_info_t *info);
-void snd_ump_block_info_set_block_id(snd_ump_block_info_t *info, unsigned int id);
 unsigned int snd_ump_block_info_get_active(const snd_ump_block_info_t *info);
 unsigned int snd_ump_block_info_get_flags(const snd_ump_block_info_t *info);
 unsigned int snd_ump_block_info_get_direction(const snd_ump_block_info_t *info);
@@ -134,6 +149,19 @@ unsigned int snd_ump_block_info_get_ui_hint(const snd_ump_block_info_t *info);
 const char *snd_ump_block_info_get_name(const snd_ump_block_info_t *info);
 int snd_ump_block_info(snd_ump_t *ump, snd_ump_block_info_t *info);
 
+void snd_ump_block_info_set_card(snd_ump_block_info_t *info, unsigned int card);
+void snd_ump_block_info_set_device(snd_ump_block_info_t *info, unsigned int device);
+void snd_ump_block_info_set_block_id(snd_ump_block_info_t *info, unsigned int id);
+void snd_ump_block_info_set_active(snd_ump_block_info_t *info, unsigned int active);
+void snd_ump_block_info_set_flags(snd_ump_block_info_t *info, unsigned int flags);
+void snd_ump_block_info_set_direction(snd_ump_block_info_t *info, unsigned int direction);
+void snd_ump_block_info_set_first_group(snd_ump_block_info_t *info, unsigned int first_group);
+void snd_ump_block_info_set_num_groups(snd_ump_block_info_t *info, unsigned int num_groups);
+void snd_ump_block_info_set_midi_ci_version(snd_ump_block_info_t *info, unsigned int version);
+void snd_ump_block_info_set_sysex8_streams(snd_ump_block_info_t *info, unsigned int streams);
+void snd_ump_block_info_set_ui_hint(snd_ump_block_info_t *info, unsigned int hint);
+void snd_ump_block_info_set_name(snd_ump_block_info_t *info, const char *name);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/src/rawmidi/ump.c b/src/rawmidi/ump.c
index 39c1c4a91928..6c1097a7452b 100644
--- a/src/rawmidi/ump.c
+++ b/src/rawmidi/ump.c
@@ -337,6 +337,17 @@ void snd_ump_endpoint_info_free(snd_ump_endpoint_info_t *info)
 	free(info);
 }
 
+/**
+ * \brief clears the snd_ump_endpoint_info_t structure
+ * \param info pointer to the snd_ump_endpoint_info_t structure to clear
+ *
+ * Zero-clear the snd_ump_endpoint_info_t object.
+ */
+void snd_ump_endpoint_info_clear(snd_ump_endpoint_info_t *info)
+{
+	memset(info, 0, sizeof(*info));
+}
+
 /**
  * \brief copy one snd_ump_endpoint_info_t structure to another
  * \param dst destination snd_ump_endpoint_info_t structure
@@ -478,6 +489,149 @@ const char *snd_ump_endpoint_info_get_product_id(const snd_ump_endpoint_info_t *
 	return (const char *)info->product_id;
 }
 
+/**
+ * \brief set card number of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param card the card number of the given UMP endpoint
+ */
+void snd_ump_endpoint_info_set_card(snd_ump_endpoint_info_t *info,
+				    unsigned int card)
+{
+	info->card = card;
+}
+
+/**
+ * \brief set device number of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param device the device number of the given UMP endpoint
+ */
+void snd_ump_endpoint_info_set_device(snd_ump_endpoint_info_t *info,
+				      unsigned int device)
+{
+	info->device = device;
+}
+
+/**
+ * \brief set info flags of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param flags UMP endpoint flag bits
+ */
+void snd_ump_endpoint_info_set_flags(snd_ump_endpoint_info_t *info,
+				     unsigned int flags)
+{
+	info->flags = flags;
+}
+
+/**
+ * \brief set protocol capability bits of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param caps UMP endpoint protocol capability bits
+ */
+void snd_ump_endpoint_info_set_protocol_caps(snd_ump_endpoint_info_t *info,
+					     unsigned int caps)
+{
+	info->protocol_caps = caps;
+}
+
+/**
+ * \brief set the current protocol of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param caps the UMP endpoint protocol bits
+ */
+void snd_ump_endpoint_info_set_protocol(snd_ump_endpoint_info_t *info,
+					unsigned int protocol)
+{
+	info->protocol = protocol;
+}
+
+/**
+ * \brief set the number of UMP blocks of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param blocks the number of UMP blocks
+ */
+void snd_ump_endpoint_info_set_num_blocks(snd_ump_endpoint_info_t *info,
+					  unsigned int blocks)
+{
+	info->num_blocks = blocks;
+}
+
+/**
+ * \brief set the UMP version number of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param version the UMP version number
+ */
+void snd_ump_endpoint_info_set_version(snd_ump_endpoint_info_t *info,
+				       unsigned int version)
+{
+	info->version = version;
+}
+
+/**
+ * \brief set the UMP manufacturer ID of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param id UMP manufacturer ID
+ */
+void snd_ump_endpoint_info_set_manufacturer_id(snd_ump_endpoint_info_t *info,
+					       unsigned int id)
+{
+	info->manufacturer_id = id;
+}
+
+/**
+ * \brief set the UMP family ID of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param id UMP family ID
+ */
+void snd_ump_endpoint_info_set_family_id(snd_ump_endpoint_info_t *info,
+					 unsigned int id)
+{
+	info->family_id = id;
+}
+
+/**
+ * \brief set the UMP model ID of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param id UMP model ID
+ */
+void snd_ump_endpoint_info_set_model_id(snd_ump_endpoint_info_t *info,
+					unsigned int id)
+{
+	info->model_id = id;
+}
+
+/**
+ * \brief set the UMP software revision of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param id UMP software revision in 4 bytes array
+ */
+void snd_ump_endpoint_info_set_sw_revision(snd_ump_endpoint_info_t *info,
+					   const unsigned char *id)
+{
+	memcpy(info->sw_revision, id, sizeof(info->sw_revision));
+}
+
+/**
+ * \brief set the name of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param name UMP endpoint name string
+ */
+void snd_ump_endpoint_info_set_name(snd_ump_endpoint_info_t *info,
+				    const char *name)
+{
+	snd_strlcpy((char *)info->name, name, sizeof(info->name));
+}
+
+/**
+ * \brief set the product ID string of UMP endpoint
+ * \param info pointer to a snd_ump_endpoint_info_t structure
+ * \param id UMP endpoint product ID string
+ */
+void snd_ump_endpoint_info_set_product_id(snd_ump_endpoint_info_t *info,
+					  const char *id)
+{
+	snd_strlcpy((char *)info->product_id, id, sizeof(info->product_id));
+}
+
 /**
  * \brief get endpoint information about UMP handle
  * \param ump UMP handle
@@ -526,6 +680,17 @@ void snd_ump_block_info_free(snd_ump_block_info_t *info)
 	free(info);
 }
 
+/**
+ * \brief clears the snd_ump_block_info_t structure
+ * \param info pointer to the snd_ump_block_info_t structure to clear
+ *
+ * Zero-clear the snd_ump_block_info_t object.
+ */
+void snd_ump_block_info_clear(snd_ump_block_info_t *info)
+{
+	memset(info, 0, sizeof(*info));
+}
+
 /**
  * \brief copy one snd_ump_block_info_t structure to another
  * \param dst destination snd_ump_block_info_t structure
@@ -567,17 +732,6 @@ unsigned int snd_ump_block_info_get_block_id(const snd_ump_block_info_t *info)
 	return info->block_id;
 }
 
-/**
- * \brief set UMP block ID for query
- * \param info pointer to a snd_ump_block_info_t structure
- * \param id the ID number for query
- */
-void snd_ump_block_info_set_block_id(snd_ump_block_info_t *info,
-				     unsigned int id)
-{
-	info->block_id = id;
-}
-
 /**
  * \brief get UMP block activeness
  * \param info pointer to a snd_ump_block_info_t structure
@@ -668,6 +822,134 @@ const char *snd_ump_block_info_get_name(const snd_ump_block_info_t *info)
 	return (const char *)info->name;
 }
 
+/**
+ * \brief set card number to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param card the card number
+ */
+void snd_ump_block_info_set_card(snd_ump_block_info_t *info, unsigned int card)
+{
+	info->card = card;
+}
+
+/**
+ * \brief set device number to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param device the device number
+ */
+void snd_ump_block_info_set_device(snd_ump_block_info_t *info, unsigned int device)
+{
+	info->device = device;
+}
+
+/**
+ * \brief set UMP block ID to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param id the ID number
+ *
+ * This function is mostly used for setting the block ID to query.
+ */
+void snd_ump_block_info_set_block_id(snd_ump_block_info_t *info,
+				     unsigned int id)
+{
+	info->block_id = id;
+}
+
+/**
+ * \brief set activeness to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param active 1 if the block is active or 0 if inactive
+ */
+void snd_ump_block_info_set_active(snd_ump_block_info_t *info, unsigned int active)
+{
+	info->active = !!active;
+}
+
+/**
+ * \brief set UMP block information flags to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param flags flag bits for the given UMP block
+ */
+void snd_ump_block_info_set_flags(snd_ump_block_info_t *info, unsigned int flags)
+{
+	info->flags = flags;
+}
+
+/**
+ * \brief set UMP block direction to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param direction direction of UMP block (input,output,bidirectional)
+ */
+void snd_ump_block_info_set_direction(snd_ump_block_info_t *info, unsigned int direction)
+{
+	info->direction = direction;
+}
+
+/**
+ * \brief set first UMP group to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param first_group the first UMP group ID belonging to the block
+ */
+void snd_ump_block_info_set_first_group(snd_ump_block_info_t *info,
+					unsigned int first_group)
+{
+	info->first_group = first_group;
+}
+
+/**
+ * \brief set number of UMP groups to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param num_groups the number of UMP groups belonging to the block
+ */
+void snd_ump_block_info_set_num_groups(snd_ump_block_info_t *info,
+				       unsigned int num_groups)
+{
+	info->num_groups = num_groups;
+}
+
+/**
+ * \brief set MIDI-CI version number to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param version MIDI-CI version number
+ */
+void snd_ump_block_info_set_midi_ci_version(snd_ump_block_info_t *info,
+					    unsigned int version)
+{
+	info->midi_ci_version = version;
+}
+
+/**
+ * \brief set number of supported SysEx8 streams to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param streams number of supported SysEx8 streams
+ */
+void snd_ump_block_info_set_sysex8_streams(snd_ump_block_info_t *info,
+					   unsigned int streams)
+{
+	info->sysex8_streams = streams;
+}
+
+/**
+ * \brief set UI Hint to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param hint the hint bits
+ */
+void snd_ump_block_info_set_ui_hint(snd_ump_block_info_t *info, unsigned int hint)
+{
+	info->ui_hint = hint;
+}
+
+/**
+ * \brief set the name string to snd_ump_block_info_t structure
+ * \param info pointer to a snd_ump_block_info_t structure
+ * \param name the name string of UMP block
+ */
+void snd_ump_block_info_set_name(snd_ump_block_info_t *info,
+				 const char *name)
+{
+	snd_strlcpy((char *)info->name, name, sizeof(info->name));
+}
+
 /**
  * \brief get UMP block information
  * \param ump UMP handle
-- 
2.43.0

