Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE4939368
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962B7EB1;
	Mon, 22 Jul 2024 19:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962B7EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671166;
	bh=KacJJTJ0Z7R/qqyVvxTxi/Vhrkx8zz0OGgiNHmrPvWA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nefAqLjc6wMMrDGGRTLOkbk9C4VSXoUIcTzMX96vVITM/RaHGDTMesUTjNSSz4oaC
	 xFmB1pyJ1B9TrSkaFsnEFo9Ip/ih+juroJPjaKIZhBE4H8kkwrfd4i6/KJipTB04EB
	 5gVKP6vIEtMoFbvfuGtf3pJjskLO8+BC1EJqPTrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77732F806BF; Mon, 22 Jul 2024 19:57:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E46FBF806BB;
	Mon, 22 Jul 2024 19:57:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C707F801F5; Mon, 22 Jul 2024 19:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFA9CF80588
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA9CF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XNf0tZee;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=C2+GC2AQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=XNf0tZee;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=C2+GC2AQ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF09F1FB8B;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jEXV13AQg8gaEfYy91n+uLzHY3Ta6hAdJxw1d55xA=;
	b=XNf0tZeeXh7Rpoz1Xy36FihwTSQvA8CuHlmhhTxXPuv5l0309JrwHLPGI0nQCBVFdBgf9J
	lWDOxgxg6XorHlxDPwJ0pwpIvJ5ERaFiM+PU+19YnjG4hVBib9d3w42v3TqL+dDIDKEpzN
	sIGQCy+85BxkpL4TnCIjzTdsPIoJp1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jEXV13AQg8gaEfYy91n+uLzHY3Ta6hAdJxw1d55xA=;
	b=C2+GC2AQxMG5l5SkJOaEieGleaTPgNc59sZdtXzUs7uFx/sbJR7cpjd6NknhonXVbC97g7
	BG5quGG/Ze1O9CBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jEXV13AQg8gaEfYy91n+uLzHY3Ta6hAdJxw1d55xA=;
	b=XNf0tZeeXh7Rpoz1Xy36FihwTSQvA8CuHlmhhTxXPuv5l0309JrwHLPGI0nQCBVFdBgf9J
	lWDOxgxg6XorHlxDPwJ0pwpIvJ5ERaFiM+PU+19YnjG4hVBib9d3w42v3TqL+dDIDKEpzN
	sIGQCy+85BxkpL4TnCIjzTdsPIoJp1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=52jEXV13AQg8gaEfYy91n+uLzHY3Ta6hAdJxw1d55xA=;
	b=C2+GC2AQxMG5l5SkJOaEieGleaTPgNc59sZdtXzUs7uFx/sbJR7cpjd6NknhonXVbC97g7
	BG5quGG/Ze1O9CBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A2097138A7;
	Mon, 22 Jul 2024 17:51:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MAdSJjGcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 07/10] configure: Drop unused conditionals
Date: Mon, 22 Jul 2024 19:52:11 +0200
Message-ID: <20240722175215.8223-8-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.40 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: NSIM7A4V7RWONGHZRIBJZMSJJDNB7LGP
X-Message-ID-Hash: NSIM7A4V7RWONGHZRIBJZMSJJDNB7LGP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSIM7A4V7RWONGHZRIBJZMSJJDNB7LGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since the required alsa-lib version was bumped and the relevant code
cleanup, some conditionals are no longer referred.  Drop them.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 configure.ac | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/configure.ac b/configure.ac
index 4803fe471c57..bc33fecd72e1 100644
--- a/configure.ac
+++ b/configure.ac
@@ -47,17 +47,6 @@ AC_CHECK_HEADERS([samplerate.h], [have_samplerate="yes"], [have_samplerate="no"]
   [#include <samplerate.h>])
 
 AC_CHECK_LIB([asound], [snd_seq_client_info_get_card], [HAVE_SEQ_CLIENT_INFO_GET_CARD="yes"])
-if test "$HAVE_SEQ_CLIENT_INFO_GET_CARD" = "yes" ; then
-    AC_DEFINE([HAVE_SEQ_CLIENT_INFO_GET_CARD], 1, [alsa-lib supports snd_seq_client_info_get_card])
-fi
-AC_CHECK_LIB([asound], [snd_seq_client_info_get_pid], [HAVE_SEQ_CLIENT_INFO_GET_PID="yes"])
-if test "$HAVE_SEQ_CLIENT_INFO_GET_PID" = "yes" ; then
-    AC_DEFINE([HAVE_SEQ_CLIENT_INFO_GET_PID], 1, [alsa-lib supports snd_seq_client_info_get_pid])
-fi
-AC_CHECK_LIB([asound], [snd_seq_client_info_get_midi_version], [HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION="yes"])
-if test "$HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION" = "yes" -a "$have_rawmidi" = "yes"; then
-    AC_DEFINE([HAVE_SEQ_CLIENT_INFO_GET_MIDI_VERSION], 1, [alsa-lib supports snd_seq_client_info_get_midi_version])
-fi
 AC_CHECK_LIB([atopology], [snd_tplg_save], [have_topology="yes"], [have_topology="no"])
 
 #
-- 
2.43.0

