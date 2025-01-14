Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B1A1026F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 09:56:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB21D602A4;
	Tue, 14 Jan 2025 09:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB21D602A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736844974;
	bh=E+uRXDsmWygqLuSW9gPpDf5RwefwpNNrlnftnG3GXAk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rGN9+mLb1TBdIrUruyB39ddte6RmO7meg5Ph0Qsf93mdW2Zd2KPzv5XNUYSsCE/YM
	 2Hsv8r/abfShugkcseeaTH54yDgsHLO6K0bmfAcKOTRVdJnTCy3kOXc7nMJ7fg8t7M
	 7xW58kuYj748H9+JMCTim5WxinCnLalWvoebrrjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86347F805E5; Tue, 14 Jan 2025 09:55:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F72F805E6;
	Tue, 14 Jan 2025 09:55:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2D3FF8055A; Tue, 14 Jan 2025 09:55:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDE4EF80269
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 09:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDE4EF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FOKZbFI1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nMHUMsTC;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=FOKZbFI1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nMHUMsTC
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ADA4D210FB;
	Tue, 14 Jan 2025 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736844919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xroNQA5wrAb1S8TigE8rff0GPjEbzdG+fQvr0bKe+zI=;
	b=FOKZbFI1anIRRo8H8S8etXfkOqFuWTskj0y4WiKPS0bpxruDFpnSL/1/9vPrG2w7PremMl
	HrhfxRjB87pEJx1xheDhqvolYtsacW9Zb+6HyGWdY48k/Lzxerj1OnCVQW9nTJVR3NN+Rq
	UcJPb+4ao22EnGgdIRZUp8RjB2Rj4qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xroNQA5wrAb1S8TigE8rff0GPjEbzdG+fQvr0bKe+zI=;
	b=nMHUMsTCN5ikDIsCLQ6pjCgzlMw2IguT7gUP56o098ALbbHYKM5R3Nk7loHS1+Fz8+Jcf9
	dpv2j6dBkwU5GCBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FOKZbFI1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nMHUMsTC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736844919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xroNQA5wrAb1S8TigE8rff0GPjEbzdG+fQvr0bKe+zI=;
	b=FOKZbFI1anIRRo8H8S8etXfkOqFuWTskj0y4WiKPS0bpxruDFpnSL/1/9vPrG2w7PremMl
	HrhfxRjB87pEJx1xheDhqvolYtsacW9Zb+6HyGWdY48k/Lzxerj1OnCVQW9nTJVR3NN+Rq
	UcJPb+4ao22EnGgdIRZUp8RjB2Rj4qc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xroNQA5wrAb1S8TigE8rff0GPjEbzdG+fQvr0bKe+zI=;
	b=nMHUMsTCN5ikDIsCLQ6pjCgzlMw2IguT7gUP56o098ALbbHYKM5R3Nk7loHS1+Fz8+Jcf9
	dpv2j6dBkwU5GCBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CA3F13A86;
	Tue, 14 Jan 2025 08:55:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iAkMIXcmhmcHbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 08:55:19 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 1/5] Sync UAPI asound.h with 6.14 kernel
Date: Tue, 14 Jan 2025 09:55:09 +0100
Message-ID: <20250114085515.11880-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114085515.11880-1-tiwai@suse.de>
References: <20250114085515.11880-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ADA4D210FB
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
Message-ID-Hash: 2AFU7C3VEILMBR4YT7O7M7RBGBBZO4BW
X-Message-ID-Hash: 2AFU7C3VEILMBR4YT7O7M7RBGBBZO4BW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AFU7C3VEILMBR4YT7O7M7RBGBBZO4BW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a small update of rawmidi API for supporting the UMP tied
device info and inactive flag.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/uapi/asound.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sound/uapi/asound.h b/include/sound/uapi/asound.h
index 533b7e46cd17..d97433c9dc26 100644
--- a/include/sound/uapi/asound.h
+++ b/include/sound/uapi/asound.h
@@ -708,7 +708,7 @@ enum {
  *  Raw MIDI section - /dev/snd/midi??
  */
 
-#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 4)
+#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 5)
 
 enum {
 	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
@@ -720,6 +720,9 @@ enum {
 #define SNDRV_RAWMIDI_INFO_INPUT		0x00000002
 #define SNDRV_RAWMIDI_INFO_DUPLEX		0x00000004
 #define SNDRV_RAWMIDI_INFO_UMP			0x00000008
+#define SNDRV_RAWMIDI_INFO_STREAM_INACTIVE	0x00000010
+
+#define SNDRV_RAWMIDI_DEVICE_UNKNOWN		-1
 
 struct snd_rawmidi_info {
 	unsigned int device;		/* RO/WR (control): device number */
@@ -732,7 +735,8 @@ struct snd_rawmidi_info {
 	unsigned char subname[32];	/* name of active or selected subdevice */
 	unsigned int subdevices_count;
 	unsigned int subdevices_avail;
-	unsigned char reserved[64];	/* reserved for future use */
+	int tied_device;		/* R: tied rawmidi device (UMP/legacy) */
+	unsigned char reserved[60];	/* reserved for future use */
 };
 
 #define SNDRV_RAWMIDI_MODE_FRAMING_MASK		(7<<0)
-- 
2.43.0

