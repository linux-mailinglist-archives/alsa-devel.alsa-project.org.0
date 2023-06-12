Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2559A72BA43
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 10:22:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D0285D;
	Mon, 12 Jun 2023 10:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D0285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686558135;
	bh=62HujU82XDvn+hPxvk1sigRnNBvmL2O6FFIz8kViT8M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ruVkxwRlDVnR2PV5Y5idhvYqhzEZhoQniDMWDe18wi8r+QBaBtPOMLCQC9GtZGEsO
	 evG0Fr7v3xuQ2lzcX/BTC3HIxdeJQucNG5e0eLE6L90uHXAzoVN2EDYtvpMIYlUC6f
	 3d6lpY9+fetG/hphAXfABFEx3Rvb5ij1JZT+Ac4I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F410F80579; Mon, 12 Jun 2023 10:20:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0CB7F80580;
	Mon, 12 Jun 2023 10:20:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40948F80579; Mon, 12 Jun 2023 10:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C917F8055B
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C917F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZVXdSZiv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Eb3pDuJz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8902120489;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686558000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VqIiY4EF7PU5vD6EyyauFm/FSYQ/AI/a0/lmpJOjJnU=;
	b=ZVXdSZivvYsS6QDgq7B+iz5c3yJ7oZpXZXMdNGNhV9liLLk1mrIkGJVi/MiChj/YJ99S8K
	hc/QAnK1a01b62ZsCPf8dIQhsuDgT3qymEB5a5nwXtX31hBhdQvyBWnSv4uYjHVebf0uUM
	R8B5adAq9l2jgZAT/IHgKxwmfZ0AfWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686558000;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VqIiY4EF7PU5vD6EyyauFm/FSYQ/AI/a0/lmpJOjJnU=;
	b=Eb3pDuJzilFwBtrC42v3KGbK6SWwc0voNIO0F+gtR5Pnf1ab+5WLeuvgT4zee4BiVHcx/k
	IeF5LlYfmVWnSJDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D39E13A67;
	Mon, 12 Jun 2023 08:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gJ+8GTDVhmT5cwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 08:20:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 3/3] seq: Add UMP 1.1 features
Date: Mon, 12 Jun 2023 10:19:48 +0200
Message-Id: <20230612081948.18346-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230612081948.18346-1-tiwai@suse.de>
References: <20230612081948.18346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BCTKIZDUF6B24JEN6EC2UNKX4SCZJTZ3
X-Message-ID-Hash: BCTKIZDUF6B24JEN6EC2UNKX4SCZJTZ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BCTKIZDUF6B24JEN6EC2UNKX4SCZJTZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add APIs for groupless message filtering.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/seq.h                   |  3 +++
 include/sound/uapi/asequencer.h |  5 ++++-
 src/Versions.in                 |  2 ++
 src/seq/seq.c                   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/include/seq.h b/include/seq.h
index 7faf4367df3d..68934037cb88 100644
--- a/include/seq.h
+++ b/include/seq.h
@@ -159,6 +159,7 @@ int snd_seq_client_info_get_event_lost(const snd_seq_client_info_t *info);
 int snd_seq_client_info_get_midi_version(const snd_seq_client_info_t *info);
 int snd_seq_client_info_get_ump_group_enabled(const snd_seq_client_info_t *info,
 					      int group);
+int snd_seq_client_info_get_ump_groupless_enabled(const snd_seq_client_info_t *info);
 int snd_seq_client_info_get_ump_conversion(const snd_seq_client_info_t *info);
 void snd_seq_client_info_set_client(snd_seq_client_info_t *info, int client);
 void snd_seq_client_info_set_name(snd_seq_client_info_t *info, const char *name);
@@ -168,6 +169,8 @@ void snd_seq_client_info_set_event_filter(snd_seq_client_info_t *info, unsigned
 void snd_seq_client_info_set_midi_version(snd_seq_client_info_t *info, int midi_version);
 void snd_seq_client_info_set_ump_group_enabled(snd_seq_client_info_t *info,
 					       int group, int enable);
+void snd_seq_client_info_set_ump_groupless_enabled(snd_seq_client_info_t *info,
+						   int enable);
 void snd_seq_client_info_set_ump_conversion(snd_seq_client_info_t *info, int enable);
 
 void snd_seq_client_info_event_filter_clear(snd_seq_client_info_t *info);
diff --git a/include/sound/uapi/asequencer.h b/include/sound/uapi/asequencer.h
index 3653a3f33778..b913f31daa2d 100644
--- a/include/sound/uapi/asequencer.h
+++ b/include/sound/uapi/asequencer.h
@@ -378,7 +378,10 @@ struct snd_seq_client_info {
 	int card;			/* RO: card number[kernel] */
 	int pid;			/* RO: pid[user] */
 	unsigned int midi_version;	/* MIDI version */
-	unsigned int group_filter;	/* UMP group filter bitmap */
+	unsigned int group_filter;	/* UMP group filter bitmap
+					 * (bit 0 = groupless messages,
+					 *  bit 1-16 = messages for groups 1-16)
+					 */
 	char reserved[48];		/* for future use */
 };
 
diff --git a/src/Versions.in b/src/Versions.in
index 0c2837305039..c8ac1c8277a3 100644
--- a/src/Versions.in
+++ b/src/Versions.in
@@ -159,9 +159,11 @@ ALSA_1.2.10 {
     @SYMBOL_PREFIX@snd_seq_ump_*;
     @SYMBOL_PREFIX@snd_seq_client_info_get_midi_version;
     @SYMBOL_PREFIX@snd_seq_seq_client_info_get_ump_group_enabled;
+    @SYMBOL_PREFIX@snd_seq_client_info_get_ump_groupless_enabled;
     @SYMBOL_PREFIX@snd_seq_seq_client_get_ump_conversion;
     @SYMBOL_PREFIX@snd_seq_client_info_set_midi_version;
     @SYMBOL_PREFIX@snd_seq_seq_client_info_set_ump_group_enabled;
+    @SYMBOL_PREFIX@snd_seq_client_info_set_ump_groupless_enabled;
     @SYMBOL_PREFIX@snd_seq_seq_client_set_ump_conversion;
     @SYMBOL_PREFIX@snd_seq_get_ump_endpoint_info;
     @SYMBOL_PREFIX@snd_seq_get_ump_block_info;
diff --git a/src/seq/seq.c b/src/seq/seq.c
index 65ccaaed5896..9d3a18d3ea99 100644
--- a/src/seq/seq.c
+++ b/src/seq/seq.c
@@ -1763,6 +1763,21 @@ int snd_seq_client_info_get_ump_group_enabled(const snd_seq_client_info_t *info,
 	return !(info->group_filter & (1U << group));
 }
 
+#define UMP_GROUPLESS_FILTER	(1U << 0)
+
+/**
+ * \brief Get the UMP groupless message handling status
+ * \param info client_info container
+ * \return 1 if UMP groupless messages is processed, 0 if filtered/disabled
+ *
+ * \sa snd_seq_get_client_info()
+ */
+int snd_seq_client_info_get_ump_groupless_enabled(const snd_seq_client_info_t *info)
+{
+	assert(info);
+	return !(info->group_filter & UMP_GROUPLESS_FILTER);
+}
+
 /**
  * \brief Get the automatic conversion mode for UMP
  * \param info client_info container
@@ -1850,6 +1865,23 @@ void snd_seq_client_info_set_ump_group_enabled(snd_seq_client_info_t *info,
 		info->group_filter |= (1U << group);
 }
 
+/**
+ * \brief Enable/disable the UMP groupless message handling
+ * \param info client_info container
+ * \param enable enable the UMP groupless messages
+ *
+ * \sa snd_seq_set_client_info(), snd_seq_client_info_get_ump_groupless_enabled()
+ */
+void snd_seq_client_info_set_ump_groupless_enabled(snd_seq_client_info_t *info,
+						   int enable)
+{
+	assert(info);
+	if (enable)
+		info->group_filter &= ~UMP_GROUPLESS_FILTER;
+	else
+		info->group_filter |= UMP_GROUPLESS_FILTER;
+}
+
 /**
  * \brief Set the automatic conversion mode for UMP
  * \param info client_info container
-- 
2.35.3

