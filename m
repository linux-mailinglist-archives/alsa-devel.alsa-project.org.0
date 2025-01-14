Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAD7A10D59
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2025 18:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320BE602AE;
	Tue, 14 Jan 2025 18:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320BE602AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736875061;
	bh=PIlfRnx4RBB1YQaPAcV6lclyA8pWck5Sh4Oaa1kB9Es=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J7EVeVc8Xs90Hg6le4sIwt7PNa3+BAY69e92Mf9qFyYBLyeaii5/6+1ID6cIuY72P
	 k6r0GF3w+3SH8ToqzXr95hAuGNOXg4hW+RpfRSNHIZnXjwp421LRTUcI/RWf2//Jr3
	 /ISP3DiTSMceMCWwl1cvF3tEj21iJ1OJlNHQgBDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F85FF80510; Tue, 14 Jan 2025 18:17:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E889F80603;
	Tue, 14 Jan 2025 18:17:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4227BF80269; Tue, 14 Jan 2025 18:16:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C34BBF800B8
	for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2025 18:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C34BBF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GG+nVw21;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8jV2OUu8;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=GG+nVw21;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8jV2OUu8
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37E7921157;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=GBDjOkYKEQcWNuacu+IFkovQaJVAhh026v6MeoJLIH0=;
	b=GG+nVw211B8unIuBQXheDgBQ00RqeOxxCYwvfR5bO227Rhs5iYISvlGx5XWW9gZEonp5Qg
	hytwRlTI4kCfHrUJ8KZUwQldmuVPz+T0btTz/8OcThaTmiE1DAIMW+IxVCa1jlWk46GoXJ
	4QxoRhX1Crc6qmNjFGid21QyhkJkKGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=GBDjOkYKEQcWNuacu+IFkovQaJVAhh026v6MeoJLIH0=;
	b=8jV2OUu8pas14PDXiQY+auaO3ytwXaEXiTDVAhNjCdhmbYDYrJRJp3bbA1ySAjKg9Zu65u
	+8NEaLZQadQrfgCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1736874942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=GBDjOkYKEQcWNuacu+IFkovQaJVAhh026v6MeoJLIH0=;
	b=GG+nVw211B8unIuBQXheDgBQ00RqeOxxCYwvfR5bO227Rhs5iYISvlGx5XWW9gZEonp5Qg
	hytwRlTI4kCfHrUJ8KZUwQldmuVPz+T0btTz/8OcThaTmiE1DAIMW+IxVCa1jlWk46GoXJ
	4QxoRhX1Crc6qmNjFGid21QyhkJkKGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736874942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=GBDjOkYKEQcWNuacu+IFkovQaJVAhh026v6MeoJLIH0=;
	b=8jV2OUu8pas14PDXiQY+auaO3ytwXaEXiTDVAhNjCdhmbYDYrJRJp3bbA1ySAjKg9Zu65u
	+8NEaLZQadQrfgCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FC8B1384C;
	Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wiicBr6bhmdrFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 17:15:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/5] Updates for rawmidi / sequencer
Date: Tue, 14 Jan 2025 18:15:30 +0100
Message-ID: <20250114171538.2751-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: XK3ML7YJZOCJLAM5F627WK5GEA7XUZVK
X-Message-ID-Hash: XK3ML7YJZOCJLAM5F627WK5GEA7XUZVK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XK3ML7YJZOCJLAM5F627WK5GEA7XUZVK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The kernel 6.14 will receive a few small enhancements for rawmidi
and sequencer APIs, and this patch set covers those.

v1->v2: sync with the latest rawmidi API change to pass 0 to
	tied_device as default

v1: https://lore.kernel.org/20250114085515.11880-1-tiwai@suse.de

Takashi

===

Takashi Iwai (5):
  Sync UAPI asound.h with 6.14 kernel
  Sync UAPI asequencer.h with 6.14 kernel
  rawmidi: Extensions for tied device and substream inactive flag
  rawmidi: Make rawmidi flag bits doxygen-style comments
  seq: Define new events for UMP EP/FB change notifications

 include/local.h                 |  1 +
 include/rawmidi.h               |  4 +++-
 include/seq_event.h             | 12 ++++++++++++
 include/sound/uapi/asequencer.h | 12 +++++++++++-
 include/sound/uapi/asound.h     |  8 ++++++--
 src/rawmidi/rawmidi.c           | 16 ++++++++++++++++
 6 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.43.0

