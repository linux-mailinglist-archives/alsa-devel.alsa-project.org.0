Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6171A10D67
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 18:18:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C500602AF;
	Tue, 14 Jan 2025 18:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C500602AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736875112;
	bh=JrULSCRH8/SVpf1J9tRdhrc8RZcAfnYFASXtYC36OzI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=E9twMHdNpHb08A2ADsk9BRTV8ZMIOI7ZKopL6zDpaahPtUJjGE7WiNVnJrqPJwht8
	 vUpRllAPhKDcbLIElhmtbpv8H+oRWHKiU/btL6CkB723oWm3at0gqZ1nuXAjDY7ESU
	 mp4JzQ6jPrvEIw3vfk7Y+8pZhMFBQPkL1l7fW+gY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92A25F80671; Tue, 14 Jan 2025 18:17:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA539F8065E;
	Tue, 14 Jan 2025 18:17:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19572F80027; Tue, 14 Jan 2025 18:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC5BBF80551
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 18:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC5BBF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AA6Z1L07;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QZNA7hKF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=AA6Z1L07;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QZNA7hKF
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B98221F391;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppRC7AdQdMOeaVbYfkWsSwfRCZRAT88gl/oV7OLNH8Q=;
	b=AA6Z1L07tgqA1Rsb0BvNPfF1wCHL6/GI6loIlS7TApxwZjo0cG5AsH0QU/piDwfark1sOR
	bmlJi3IhcUVwVe+fnmrkZbq4hDGfIL6m1iaCK0/fmxmyc5olu458iJiTA9MY1Vc26xcYuK
	FOY9zE9GWCA0/Y4fmrQjb0TQMi/vhu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppRC7AdQdMOeaVbYfkWsSwfRCZRAT88gl/oV7OLNH8Q=;
	b=QZNA7hKFK1Ri6hPejQj8mGJTa+XrGQzTV79V80fmDIIbJcfrJXbgkQGZnH9xQq+FYmAjmb
	GEOp5mOJ/o2RyBDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppRC7AdQdMOeaVbYfkWsSwfRCZRAT88gl/oV7OLNH8Q=;
	b=AA6Z1L07tgqA1Rsb0BvNPfF1wCHL6/GI6loIlS7TApxwZjo0cG5AsH0QU/piDwfark1sOR
	bmlJi3IhcUVwVe+fnmrkZbq4hDGfIL6m1iaCK0/fmxmyc5olu458iJiTA9MY1Vc26xcYuK
	FOY9zE9GWCA0/Y4fmrQjb0TQMi/vhu0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppRC7AdQdMOeaVbYfkWsSwfRCZRAT88gl/oV7OLNH8Q=;
	b=QZNA7hKFK1Ri6hPejQj8mGJTa+XrGQzTV79V80fmDIIbJcfrJXbgkQGZnH9xQq+FYmAjmb
	GEOp5mOJ/o2RyBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9ED351384C;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UKyIJb6bhmdrFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 17:15:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/5] rawmidi: Make rawmidi flag bits doxygen-style comments
Date: Tue, 14 Jan 2025 18:15:34 +0100
Message-ID: <20250114171538.2751-5-tiwai@suse.de>
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
Message-ID-Hash: IDNSTFBLCKOHNOAEYFR32OCZFZTWTPQY
X-Message-ID-Hash: IDNSTFBLCKOHNOAEYFR32OCZFZTWTPQY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDNSTFBLCKOHNOAEYFR32OCZFZTWTPQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We forgot to put the markers in rawmidi info bit flags.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/rawmidi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/rawmidi.h b/include/rawmidi.h
index af734b21db60..713258f2cd80 100644
--- a/include/rawmidi.h
+++ b/include/rawmidi.h
@@ -94,8 +94,8 @@ typedef enum _snd_rawmidi_read_mode {
 } snd_rawmidi_read_mode_t;
 
 /** rawmidi info bit flags */
-#define SND_RAWMIDI_INFO_UMP			0x00000008	/* rawmidi is UMP */
-#define SNDRV_RAWMIDI_INFO_STREAM_INACTIVE	0x00000010	/* the selected substream is inactive */
+#define SND_RAWMIDI_INFO_UMP			0x00000008	/**< rawmidi is UMP */
+#define SNDRV_RAWMIDI_INFO_STREAM_INACTIVE	0x00000010	/**< the selected substream is inactive */
 
 int snd_rawmidi_open(snd_rawmidi_t **in_rmidi, snd_rawmidi_t **out_rmidi,
 		     const char *name, int mode);
-- 
2.43.0

