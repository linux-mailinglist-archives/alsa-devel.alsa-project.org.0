Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2F994A911
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 15:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8AE14F2;
	Wed,  7 Aug 2024 15:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8AE14F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723038788;
	bh=wF5+HSnvXStHmGQ2QisgUGm3i3ZW72sa5vndpW0Z14c=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hgT97PW9xADK1YN2UslixvW/FsKmxc1uqqFG/ZN0b3Jz4P8zFDAtYLYVPMouXPSLd
	 V45S0GYGMyVa4TtWL2i8UIxrCN0JOJosRnP9KXS3HPbrR6yqJLQl2ImIRxWn5bEWua
	 TWSwhoFiG9XHTLYFlaf8wHQVFL/Z4bNpxDrdIYhE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AB1EF805B4; Wed,  7 Aug 2024 15:52:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA1BF805AF;
	Wed,  7 Aug 2024 15:52:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5662F80236; Wed,  7 Aug 2024 15:51:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBDD8F80236
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 15:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDD8F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eQOdFdkn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LnXDtCfQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=eQOdFdkn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=LnXDtCfQ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A44761F891;
	Wed,  7 Aug 2024 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723038670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SyaTNIr/yDIdUcgGhROYphYbmddCy74l8DNfB+Q27kY=;
	b=eQOdFdknF9iLMfgORg6PC/wM55K4c81Pon6uhLfS2jRD2z9pGxrB4pkTZKcu4lp85S/Q9H
	g8i7femRR6CKJKr4yYnnVPaD0FY2jKz7DZ+m3eQOE3to3InHy/PTDtbGMHXEbNyCsRb6VO
	mATDK9rSvZHuxAEIoJMTlve5jwX+2Dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723038670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SyaTNIr/yDIdUcgGhROYphYbmddCy74l8DNfB+Q27kY=;
	b=LnXDtCfQOBmXlgAsdDW9YNHMJacA5OH2HRCe2Rs3FEx2lPp6eC1yJ2tRvUfW62YmV/tZHB
	s5AQBeEt5+upevAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eQOdFdkn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LnXDtCfQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1723038670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SyaTNIr/yDIdUcgGhROYphYbmddCy74l8DNfB+Q27kY=;
	b=eQOdFdknF9iLMfgORg6PC/wM55K4c81Pon6uhLfS2jRD2z9pGxrB4pkTZKcu4lp85S/Q9H
	g8i7femRR6CKJKr4yYnnVPaD0FY2jKz7DZ+m3eQOE3to3InHy/PTDtbGMHXEbNyCsRb6VO
	mATDK9rSvZHuxAEIoJMTlve5jwX+2Dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723038670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SyaTNIr/yDIdUcgGhROYphYbmddCy74l8DNfB+Q27kY=;
	b=LnXDtCfQOBmXlgAsdDW9YNHMJacA5OH2HRCe2Rs3FEx2lPp6eC1yJ2tRvUfW62YmV/tZHB
	s5AQBeEt5+upevAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B0E213A7D;
	Wed,  7 Aug 2024 13:51:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id L1WXIM57s2byWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:51:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] seq: Add snd_seq_{get|set}_ump_is_midi1() API
 functions
Date: Wed,  7 Aug 2024 15:51:47 +0200
Message-ID: <20240807135148.18291-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A44761F891
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: EIMWKFABHBJDMWI23IQ46YGSKSQDYV4T
X-Message-ID-Hash: EIMWKFABHBJDMWI23IQ46YGSKSQDYV4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIMWKFABHBJDMWI23IQ46YGSKSQDYV4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Implement the API function calls corresponding to the new sequencer
port flag bit that has been added recently to the kernel.
A UMP MIDI 2.0 device allow to have an optional MIDI 1.0 port while
speaking in MIDI 2.0 protocol for other UMP Groups.  The new seq port
flag indicates that.

This is rather a minor difference, and since ALSA sequencer core
covers the all conversions, usually you don't have to worry about it
at all.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/seq.h                   |  2 ++
 include/sound/uapi/asequencer.h |  2 ++
 src/Versions.in.in              |  2 ++
 src/seq/seq.c                   | 29 +++++++++++++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/include/seq.h b/include/seq.h
index 4f03df438288..2eee95a643b4 100644
--- a/include/seq.h
+++ b/include/seq.h
@@ -318,6 +318,7 @@ int snd_seq_port_info_get_timestamp_real(const snd_seq_port_info_t *info);
 int snd_seq_port_info_get_timestamp_queue(const snd_seq_port_info_t *info);
 int snd_seq_port_info_get_direction(const snd_seq_port_info_t *info);
 int snd_seq_port_info_get_ump_group(const snd_seq_port_info_t *info);
+int snd_seq_port_info_get_ump_is_midi1(const snd_seq_port_info_t *info);
 
 void snd_seq_port_info_set_client(snd_seq_port_info_t *info, int client);
 void snd_seq_port_info_set_port(snd_seq_port_info_t *info, int port);
@@ -334,6 +335,7 @@ void snd_seq_port_info_set_timestamp_real(snd_seq_port_info_t *info, int realtim
 void snd_seq_port_info_set_timestamp_queue(snd_seq_port_info_t *info, int queue);
 void snd_seq_port_info_set_direction(snd_seq_port_info_t *info, int direction);
 void snd_seq_port_info_set_ump_group(snd_seq_port_info_t *info, int ump_group);
+void snd_seq_port_info_set_ump_is_midi1(snd_seq_port_info_t *info, int is_midi1);
 
 int snd_seq_create_port(snd_seq_t *handle, snd_seq_port_info_t *info);
 int snd_seq_delete_port(snd_seq_t *handle, int port);
diff --git a/include/sound/uapi/asequencer.h b/include/sound/uapi/asequencer.h
index 923dfdddfc76..b3e9df5894af 100644
--- a/include/sound/uapi/asequencer.h
+++ b/include/sound/uapi/asequencer.h
@@ -477,6 +477,8 @@ struct snd_seq_remove_events {
 #define SNDRV_SEQ_PORT_FLG_TIMESTAMP	(1<<1)
 #define SNDRV_SEQ_PORT_FLG_TIME_REAL	(1<<2)
 
+#define SNDRV_SEQ_PORT_FLG_IS_MIDI1	(1<<3)	/* Keep MIDI 1.0 protocol */
+
 /* port direction */
 #define SNDRV_SEQ_PORT_DIR_UNKNOWN	0
 #define SNDRV_SEQ_PORT_DIR_INPUT	1
diff --git a/src/Versions.in.in b/src/Versions.in.in
index 90849277c983..298e610c2099 100644
--- a/src/Versions.in.in
+++ b/src/Versions.in.in
@@ -209,6 +209,8 @@ ALSA_1.2.13 {
     @SYMBOL_PREFIX@snd_seq_queue_tempo_get_tempo_base;
     @SYMBOL_PREFIX@snd_seq_queue_tempo_set_tempo_base;
     @SYMBOL_PREFIX@snd_seq_has_tempo_base;
+    @SYMBOL_PREFIX@snd_seq_port_info_get_ump_is_midi1;
+    @SYMBOL_PREFIX@snd_seq_port_info_set_ump_is_midi1;
 #endif
 #ifdef HAVE_RAWMIDI_SYMS
     @SYMBOL_PREFIX@snd_ump_endpoint_info_clear;
diff --git a/src/seq/seq.c b/src/seq/seq.c
index d0ecedf0838f..347ff45544fa 100644
--- a/src/seq/seq.c
+++ b/src/seq/seq.c
@@ -2431,6 +2431,19 @@ int snd_seq_port_info_get_ump_group(const snd_seq_port_info_t *info)
 	return info->ump_group;
 }
 
+/**
+ * \brief Get the status of the optional MIDI 1.0 port in MIDI 2.0 UMP Endpoint
+ * \param info port_info container
+ * \return 1 if it's an optional MIDI 1.0 port in MIDI 2.0 UMP Endpoint
+ *
+ * \sa snd_seq_get_port_info(), snd_seq_port_info_set_ump_is_midi1()
+ */
+int snd_seq_port_info_get_ump_is_midi1(const snd_seq_port_info_t *info)
+{
+	assert(info);
+	return !!(info->flags & SNDRV_SEQ_PORT_FLG_IS_MIDI1);
+}
+
 /**
  * \brief Set the client id of a port_info container
  * \param info port_info container
@@ -2635,6 +2648,22 @@ void snd_seq_port_info_set_ump_group(snd_seq_port_info_t *info, int ump_group)
 	info->ump_group = ump_group;
 }
 
+/**
+ * \brief Set the optional MIDI 1.0 port in MIDI 2.0 UMP Endpoint
+ * \param info port_info container
+ * \param is_midi1 non-zero for MIDI 1.0 port in MIDI 2.0 EP
+ *
+ * \sa snd_seq_get_port_info(), snd_seq_port_info_get_ump_is_midi1()
+ */
+void snd_seq_port_info_set_ump_is_midi1(snd_seq_port_info_t *info, int is_midi1)
+{
+	assert(info);
+	if (is_midi1)
+		info->flags |= SNDRV_SEQ_PORT_FLG_IS_MIDI1;
+	else
+		info->flags &= ~SNDRV_SEQ_PORT_FLG_IS_MIDI1;
+}
+
 /**
  * \brief create a sequencer port on the current client
  * \param seq sequencer handle
-- 
2.43.0

