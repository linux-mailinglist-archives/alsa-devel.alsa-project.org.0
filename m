Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EF0A10279
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 09:57:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F82602A6;
	Tue, 14 Jan 2025 09:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F82602A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736845023;
	bh=DpDO1A7glR+eet6qQhVkG46DUPB2U6xJLKY2xPZAlR8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=q99PLkUnuN5x/N0vAjEh9VfinKQYeDEbzuYliwPl/dtNG1TqfnPlEA0LrfEnj7WYC
	 K0+MU0ZYwkv9lzIps11xbCjQaZiU2BXAi9XM9uj0TNlIcDcw586N7O+rf6yO1tYiYt
	 8MvxO2uyZRZOXO7uhd2gfwI7Ywv4CAmtPm4+S5gg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B084F80639; Tue, 14 Jan 2025 09:55:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 044A5F80551;
	Tue, 14 Jan 2025 09:55:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E63BCF80537; Tue, 14 Jan 2025 09:55:23 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C32FF80549
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 09:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C32FF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pZTAQybv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uhIHkt8n;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=pZTAQybv;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uhIHkt8n
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 043EA1F441;
	Tue, 14 Jan 2025 08:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736844920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNykDQ74/9OV8joVFdH5zYMkPinW5O5JYVy+VBEo+NQ=;
	b=pZTAQybvBmcs6oItPm43k3FcCOfuVKtQwIuIWNmVmVBPVXOYLPqopJxBT9lhQjS+l96/kj
	RFFKfGvczNB3ikb9tVOU6Xv/sid68jN5YQO2iW9id9TIAW13cqyiQZFa4LMPTUJP8OOG+D
	v2nDxM9DGmtkFp7qR+mhHrv5tXtBIW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNykDQ74/9OV8joVFdH5zYMkPinW5O5JYVy+VBEo+NQ=;
	b=uhIHkt8nQpb+EApaIOmU3nLeqdVwPSGtxsRinVjhC3r3fj8ZOVvqjOlwhiIH/eLjDGjtX4
	x0K14E3MezdLNECA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pZTAQybv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uhIHkt8n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736844920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNykDQ74/9OV8joVFdH5zYMkPinW5O5JYVy+VBEo+NQ=;
	b=pZTAQybvBmcs6oItPm43k3FcCOfuVKtQwIuIWNmVmVBPVXOYLPqopJxBT9lhQjS+l96/kj
	RFFKfGvczNB3ikb9tVOU6Xv/sid68jN5YQO2iW9id9TIAW13cqyiQZFa4LMPTUJP8OOG+D
	v2nDxM9DGmtkFp7qR+mhHrv5tXtBIW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844920;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNykDQ74/9OV8joVFdH5zYMkPinW5O5JYVy+VBEo+NQ=;
	b=uhIHkt8nQpb+EApaIOmU3nLeqdVwPSGtxsRinVjhC3r3fj8ZOVvqjOlwhiIH/eLjDGjtX4
	x0K14E3MezdLNECA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DCBA813A98;
	Tue, 14 Jan 2025 08:55:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6O2VNHcmhmcHbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 08:55:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 3/5] rawmidi: Extensions for tied device and
 substream inactive flag
Date: Tue, 14 Jan 2025 09:55:11 +0100
Message-ID: <20250114085515.11880-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114085515.11880-1-tiwai@suse.de>
References: <20250114085515.11880-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 043EA1F441
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: HW4VGCLJSMYJ5UD7KEHWFPG2GUFY6RXA
X-Message-ID-Hash: HW4VGCLJSMYJ5UD7KEHWFPG2GUFY6RXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HW4VGCLJSMYJ5UD7KEHWFPG2GUFY6RXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is the enhancements of rawmidi API for the new feature added in
6.14 kernel: the indication of a tied device and the inactive flag for
the selected substream.

The new function is added for obtaining the tied device,
snd_rawmidi_info_get_tied_device().

And the new bit flag is defined for indicating the inactive
substream, SNDRV_RAWMIDI_INFO_STREAM_INACTIVE, which is exposed via
snd_rawmidi_info_get_flags().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/rawmidi.h     |  2 ++
 src/rawmidi/rawmidi.c | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/rawmidi.h b/include/rawmidi.h
index 2630d1e67572..af734b21db60 100644
--- a/include/rawmidi.h
+++ b/include/rawmidi.h
@@ -95,6 +95,7 @@ typedef enum _snd_rawmidi_read_mode {
 
 /** rawmidi info bit flags */
 #define SND_RAWMIDI_INFO_UMP			0x00000008	/* rawmidi is UMP */
+#define SNDRV_RAWMIDI_INFO_STREAM_INACTIVE	0x00000010	/* the selected substream is inactive */
 
 int snd_rawmidi_open(snd_rawmidi_t **in_rmidi, snd_rawmidi_t **out_rmidi,
 		     const char *name, int mode);
@@ -124,6 +125,7 @@ const char *snd_rawmidi_info_get_name(const snd_rawmidi_info_t *obj);
 const char *snd_rawmidi_info_get_subdevice_name(const snd_rawmidi_info_t *obj);
 unsigned int snd_rawmidi_info_get_subdevices_count(const snd_rawmidi_info_t *obj);
 unsigned int snd_rawmidi_info_get_subdevices_avail(const snd_rawmidi_info_t *obj);
+int snd_rawmidi_info_get_tied_device(const snd_rawmidi_info_t *obj);
 void snd_rawmidi_info_set_device(snd_rawmidi_info_t *obj, unsigned int val);
 void snd_rawmidi_info_set_subdevice(snd_rawmidi_info_t *obj, unsigned int val);
 void snd_rawmidi_info_set_stream(snd_rawmidi_info_t *obj, snd_rawmidi_stream_t val);
diff --git a/src/rawmidi/rawmidi.c b/src/rawmidi/rawmidi.c
index c4b45fa227f1..017b01c24b2b 100644
--- a/src/rawmidi/rawmidi.c
+++ b/src/rawmidi/rawmidi.c
@@ -639,6 +639,20 @@ unsigned int snd_rawmidi_info_get_subdevices_avail(const snd_rawmidi_info_t *inf
 	return info->subdevices_avail;
 }
 
+/**
+ * \brief get the tied device number for the given rawmidi device
+ * \param info pointer to a snd_rawmidi_info_t structure
+ * \return the device number for the tied device, or -1 if untied / unknown.
+ *
+ * This function is useful for UMP rawmidi devices where each of them may
+ * have the mirroring legacy rawmidi device. Those are shown as "tied".
+ */
+int snd_rawmidi_info_get_tied_device(const snd_rawmidi_info_t *info)
+{
+	assert(info);
+	return info->tied_device;
+}
+
 /**
  * \brief set rawmidi device number
  * \param info pointer to a snd_rawmidi_info_t structure
@@ -680,9 +694,15 @@ void snd_rawmidi_info_set_stream(snd_rawmidi_info_t *info, snd_rawmidi_stream_t
  */
 int snd_rawmidi_info(snd_rawmidi_t *rawmidi, snd_rawmidi_info_t * info)
 {
+	int ret;
 	assert(rawmidi);
 	assert(info);
-	return rawmidi->ops->info(rawmidi, info);
+	ret = rawmidi->ops->info(rawmidi, info);
+	if (ret)
+		return ret;
+	if (rawmidi->version < SNDRV_PROTOCOL_VERSION(2, 0, 5))
+		info->tied_device = -1;
+	return 0;
 }
 
 /**
-- 
2.43.0

