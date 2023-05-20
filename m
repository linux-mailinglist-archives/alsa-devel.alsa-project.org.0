Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1970A607
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 09:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333E7825;
	Sat, 20 May 2023 09:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333E7825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684566260;
	bh=I8gpMvWlH3OKVLXmeJtrV/2sgDBCwMYDQ1hKpWCuAbc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=suGPkowWpZ9KoxQAosP/JPVX5tY3h/O8GUufb8d16HO/AnL+nrc1UQhD6f61JsMEN
	 4teWoJwJGJoo/WwaBbUS+7/m2+gQMcBq+XMcEjUaiox0QXthSd4swJgMBxvv5ws9aW
	 btYJB7WCm/gexE0yFFs89rW8jsaTzUZ5+qNNcnOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68A22F8055B; Sat, 20 May 2023 09:02:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB12F80564;
	Sat, 20 May 2023 09:02:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7A31F80548; Sat, 20 May 2023 09:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A98FF8053D
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 09:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A98FF8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qdRrpym4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GMvjEz7S
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 49585220C9;
	Sat, 20 May 2023 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684566026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTt0DxRtIddr9JNNnFKqgFbm1+90y+GMnDDHmAmodPY=;
	b=qdRrpym4W6YYd2YDrxAb+qK31iNnlRJVdtkPczbbgo//dutJZJFWdLpSs3/Jb9AwgUoitn
	HQCNrNKIogpXIYAhBb/ANUsyKM1LztOGi+BOHc1CkdD6A16/9pnaJUrTRtE5mt9fsfToTW
	AkSYGZIqsfThMnM1jh8UMcJBYbqU1bY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684566026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTt0DxRtIddr9JNNnFKqgFbm1+90y+GMnDDHmAmodPY=;
	b=GMvjEz7SW9Ru/2N+zN+Jaefyn1guTikZsVlzR9/6VOgmRZRaJYN5yGET+EjmeTzA6eT+vx
	170oiUBOzhniicDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D7AC139F5;
	Sat, 20 May 2023 07:00:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CAROCgpwaGTwGwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 20 May 2023 07:00:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 6/8] ump: Add helpers for handling SysEx data
Date: Sat, 20 May 2023 09:00:19 +0200
Message-Id: <20230520070021.1301-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230520070021.1301-1-tiwai@suse.de>
References: <20230520070021.1301-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BKCXWJXK5ATM7OGQ7PEIAIYABXFXJZBI
X-Message-ID-Hash: BKCXWJXK5ATM7OGQ7PEIAIYABXFXJZBI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKCXWJXK5ATM7OGQ7PEIAIYABXFXJZBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Yet a few more helpers for handling SysEx data with UMP packets.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/ump_msg.h | 27 +++++++++++++++
 src/rawmidi/ump.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/include/ump_msg.h b/include/ump_msg.h
index 1b7f70667054..4ccce546f8d5 100644
--- a/include/ump_msg.h
+++ b/include/ump_msg.h
@@ -500,6 +500,14 @@ enum {
 	SND_UMP_MSG_RESET		= 0xff,
 };
 
+/** MIDI 2.0 SysEx / Data Status; same values for both 7-bit and 8-bit SysEx */
+enum {
+	SND_UMP_SYSEX_STATUS_SINGLE	= 0,
+	SND_UMP_SYSEX_STATUS_START	= 1,
+	SND_UMP_SYSEX_STATUS_CONTINUE	= 2,
+	SND_UMP_SYSEX_STATUS_END	= 3,
+};
+
 /**
  * \brief get UMP status (4bit) from 32bit UMP message header
  */
@@ -564,6 +572,25 @@ static inline uint8_t snd_ump_msg_group(const uint32_t *ump)
 	return snd_ump_msg_hdr_group(*ump);
 }
 
+/**
+ * \brief get UMP sysex message status
+ */
+static inline uint8_t snd_ump_sysex_msg_status(const uint32_t *ump)
+{
+	return (*ump >> 20) & 0xf;
+}
+
+/**
+ * \brief get UMP sysex message length
+ */
+static inline uint8_t snd_ump_sysex_msg_length(const uint32_t *ump)
+{
+	return (*ump >> 16) & 0xf;
+}
+
+int snd_ump_msg_sysex_expand(const uint32_t *ump, uint8_t *buf, size_t maxlen,
+			     size_t *filled);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/src/rawmidi/ump.c b/src/rawmidi/ump.c
index 5da79459f618..2482884f2661 100644
--- a/src/rawmidi/ump.c
+++ b/src/rawmidi/ump.c
@@ -614,3 +614,89 @@ int snd_ump_block_info(snd_ump_t *ump, snd_ump_block_info_t *info)
 {
 	return _snd_rawmidi_ump_block_info(ump->rawmidi, info);
 }
+
+/*
+ * UMP sysex helpers
+ */
+static int expand_sysex_data(const uint32_t *data, uint8_t *buf,
+			     size_t maxlen, unsigned char bytes, int offset)
+{
+	int size = 0;
+
+	for (; bytes; bytes--, size++) {
+		if (!maxlen)
+			break;
+		buf[size] = (*data >> offset) & 0x7f;
+		if (!offset) {
+			offset = 24;
+			data++;
+		} else {
+			offset -= 8;
+		}
+	}
+
+	return size;
+}
+
+static int expand_sysex7(const uint32_t *ump, uint8_t *buf, size_t maxlen,
+			 size_t *filled)
+{
+	unsigned char status;
+	unsigned char bytes;
+
+	*filled = 0;
+	if (!maxlen)
+		return 0;
+
+	status = snd_ump_sysex_msg_status(ump);
+	bytes = snd_ump_sysex_msg_length(ump);
+	if (bytes > 6)
+		return 0; // invalid - skip
+
+	*filled = expand_sysex_data(ump, buf, maxlen, bytes, 8);
+	return (status == SND_UMP_SYSEX_STATUS_SINGLE ||
+		status == SND_UMP_SYSEX_STATUS_END);
+}
+
+static int expand_sysex8(const uint32_t *ump, uint8_t *buf, size_t maxlen,
+			  size_t *filled)
+{
+	unsigned char status;
+	unsigned char bytes;
+
+	*filled = 0;
+	if (!maxlen)
+		return 0;
+
+	status = snd_ump_sysex_msg_status(ump);
+	if (status > SND_UMP_SYSEX_STATUS_END)
+		return 0; // unsupported, skip
+	bytes = snd_ump_sysex_msg_length(ump);
+	if (!bytes || bytes > 14)
+		return 0; // skip
+
+	*filled = expand_sysex_data(ump, buf, maxlen, bytes - 1, 0);
+	return (status == SND_UMP_SYSEX_STATUS_SINGLE ||
+		status == SND_UMP_SYSEX_STATUS_END);
+}
+
+/**
+ * \brief fill sysex byte from a UMP packet
+ * \param ump UMP packet pointer
+ * \param buf buffer point to fill sysex bytes
+ * \param maxlen max buffer size in bytes
+ * \param filled the size of filled sysex bytes on the buffer
+ * \return 1 if the sysex finished, otherwise 0
+ */
+int snd_ump_msg_sysex_expand(const uint32_t *ump, uint8_t *buf, size_t maxlen,
+			     size_t *filled)
+{
+	switch (snd_ump_msg_type(ump)) {
+	case SND_UMP_MSG_TYPE_DATA:
+		return expand_sysex7(ump, buf, maxlen, filled);
+	case SND_UMP_MSG_TYPE_EXTENDED_DATA:
+		return expand_sysex8(ump, buf, maxlen, filled);
+	default:
+		return -EINVAL;
+	}
+}
-- 
2.35.3

