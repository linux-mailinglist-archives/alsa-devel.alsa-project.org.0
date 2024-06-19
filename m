Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C490F22A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 17:29:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB391F4;
	Wed, 19 Jun 2024 17:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB391F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718810979;
	bh=/CP89v/oyIOkIYfjLv/ePA04URYRSfQkYQR6vHnLkRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UYwqw/+gInAw2G9KG1NH+LdcrV8e4sw3FyWd+ZsX6QMz9UBnfxGXnhX7ObqZRnSgx
	 /kn8Rz38xSh6hfdXRMcBHVXJFC29s0VcBW9G5acAV5ILlUbZq2RmssYpfH+SEjDab+
	 LlUSvBrUl1+I+myS2xbNRik/UoLCB1dcF6Y1ai10=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEA63F805DF; Wed, 19 Jun 2024 17:28:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB8BF805E1;
	Wed, 19 Jun 2024 17:28:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5611F804D6; Wed, 19 Jun 2024 17:28:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C58F5F8010C
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 17:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C58F5F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mQ71kAoL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cwbJFZJk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=mQ71kAoL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cwbJFZJk
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 795E621A43;
	Wed, 19 Jun 2024 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5v6wbIkt4sfaU0VL2iwZ4JkEGTp7LHrCqCzSVGvcLY=;
	b=mQ71kAoLBiZzo84fZJpd6CsC0NcbnKyf9EANq6IzmaNu2WituKEFvdk9dsssf3S5QaM9zl
	zPHFS8IFuHwvkL4KZARiA6cZuMPdKF7VKjxC2/Xh2PcLjnlZ1XAAA1GPjeZXH4hjLQFg3B
	sbO2SbFlxc9tsdQOY+viwYhP2Y8hbwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5v6wbIkt4sfaU0VL2iwZ4JkEGTp7LHrCqCzSVGvcLY=;
	b=cwbJFZJk2oRiybupTJu5er/PFSqEsrXjBdiAaPMTtErlw6BdNxrLhO7TppNsKw1s5N7/ZR
	sZb0/m4xuuYQfVCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718810911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5v6wbIkt4sfaU0VL2iwZ4JkEGTp7LHrCqCzSVGvcLY=;
	b=mQ71kAoLBiZzo84fZJpd6CsC0NcbnKyf9EANq6IzmaNu2WituKEFvdk9dsssf3S5QaM9zl
	zPHFS8IFuHwvkL4KZARiA6cZuMPdKF7VKjxC2/Xh2PcLjnlZ1XAAA1GPjeZXH4hjLQFg3B
	sbO2SbFlxc9tsdQOY+viwYhP2Y8hbwA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718810911;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5v6wbIkt4sfaU0VL2iwZ4JkEGTp7LHrCqCzSVGvcLY=;
	b=cwbJFZJk2oRiybupTJu5er/PFSqEsrXjBdiAaPMTtErlw6BdNxrLhO7TppNsKw1s5N7/ZR
	sZb0/m4xuuYQfVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5362113668;
	Wed, 19 Jun 2024 15:28:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6K1CEx/5cmYRJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Jun 2024 15:28:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 4/4] Add test/seq-ump-example to .gitignore
Date: Wed, 19 Jun 2024 17:28:53 +0200
Message-ID: <20240619152855.6809-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240619152855.6809-1-tiwai@suse.de>
References: <20240619152855.6809-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.62 / 50.00];
	BAYES_HAM(-1.82)[93.96%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: JTWZMD5XNPV2IECUWKZ2GH3BWALRNCEJ
X-Message-ID-Hash: JTWZMD5XNPV2IECUWKZ2GH3BWALRNCEJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JTWZMD5XNPV2IECUWKZ2GH3BWALRNCEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index a74b5195a7d9..947eba45c685 100644
--- a/.gitignore
+++ b/.gitignore
@@ -65,6 +65,7 @@ test/playmidi1
 test/queue_timer
 test/rawmidi
 test/seq
+test/seq-ump-example
 test/timer
 test/lsb/config
 test/lsb/midi_event
-- 
2.43.0

