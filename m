Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD7A10D60
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 18:18:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E199602B9;
	Tue, 14 Jan 2025 18:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E199602B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736875096;
	bh=2mVXjIwtLMCgfwxLP7yU0UbuH6WOaY4Hi5HIQP5J9Pg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PHeBFq0CB9DnOCu5cC8nl07lWFTHB6Fdyde+u6rzdFWqTVli6Hw++8yGKXd6tN/Zu
	 xauronQRCaRakxoqVDtWKxUldxcCv6AfeII9tZtFP75LIVT0lDHp5fFGtpNFcgVkwI
	 4kJKuCvupk4JyYX+GAczEKOSO7PVWr+//g09jloI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29D8BF805BE; Tue, 14 Jan 2025 18:17:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1064F80269;
	Tue, 14 Jan 2025 18:17:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 473E6F80510; Tue, 14 Jan 2025 18:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CEDEF80537
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 18:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CEDEF80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GhS3FPDk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1BfWZuKd;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GhS3FPDk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1BfWZuKd
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 997B42115A;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZng/vSB2ZbS3PzKoPfoyQMOy0lHHU9tH9fo0byiDn4=;
	b=GhS3FPDkMKuzsAB5G4Ra0aXWN9qVgjjTZ09nt5VPVY3CEASBPYftXzWvXMmEeJIa6GEy4z
	8b9pDc5qoMtSyrBzt3cQ4NKj+3qeW3NEwwbX44G1rMOZ9jAdctRBfUsd00z33TeXKPvpMc
	1/XRTs9bGiOG2bFXKPmpJ14XbllDx1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZng/vSB2ZbS3PzKoPfoyQMOy0lHHU9tH9fo0byiDn4=;
	b=1BfWZuKdrrRbUZmFbwdk6IL7VYJi/G66IQVkPHTCF8YDhnR7A4T2rt2RVhT/Fv0/LwGyij
	geT8mKgnWzwQQqAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZng/vSB2ZbS3PzKoPfoyQMOy0lHHU9tH9fo0byiDn4=;
	b=GhS3FPDkMKuzsAB5G4Ra0aXWN9qVgjjTZ09nt5VPVY3CEASBPYftXzWvXMmEeJIa6GEy4z
	8b9pDc5qoMtSyrBzt3cQ4NKj+3qeW3NEwwbX44G1rMOZ9jAdctRBfUsd00z33TeXKPvpMc
	1/XRTs9bGiOG2bFXKPmpJ14XbllDx1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZng/vSB2ZbS3PzKoPfoyQMOy0lHHU9tH9fo0byiDn4=;
	b=1BfWZuKdrrRbUZmFbwdk6IL7VYJi/G66IQVkPHTCF8YDhnR7A4T2rt2RVhT/Fv0/LwGyij
	geT8mKgnWzwQQqAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D19413AEB;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SINJHb6bhmdrFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 17:15:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/5] rawmidi: Extensions for tied device and substream
 inactive flag
Date: Tue, 14 Jan 2025 18:15:33 +0100
Message-ID: <20250114171538.2751-4-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: WOTEZWZPDRS3VDOTOLSEXWFCVH5TLYOO
X-Message-ID-Hash: WOTEZWZPDRS3VDOTOLSEXWFCVH5TLYOO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOTEZWZPDRS3VDOTOLSEXWFCVH5TLYOO/>
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
 src/rawmidi/rawmidi.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

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
index c4b45fa227f1..9bb6d744a94e 100644
--- a/src/rawmidi/rawmidi.c
+++ b/src/rawmidi/rawmidi.c
@@ -639,6 +639,22 @@ unsigned int snd_rawmidi_info_get_subdevices_avail(const snd_rawmidi_info_t *inf
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
+	if (info->tied_device > 0)
+		return info->tied_device - 1;
+	return -1;
+}
+
 /**
  * \brief set rawmidi device number
  * \param info pointer to a snd_rawmidi_info_t structure
-- 
2.43.0

