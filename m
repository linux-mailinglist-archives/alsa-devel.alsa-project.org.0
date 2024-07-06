Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946892918F
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2024 09:46:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D39C3F54;
	Sat,  6 Jul 2024 09:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D39C3F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720251978;
	bh=+TDC+jSyLd3VvBm9rpggztCVQ2zEigPAgZKKinH2UJE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mT9wWvAM2x2oIP3h2NnXvdc4KLEB9H5vPNUlhemsY/mCiJOBfsXO8EAb0GYyNa552
	 Cxj5KnavjVNAV8Ss3MoeHSveWipHECXdbWAM8MWtEzJVow0TKDWWwaTfexNGuk8XgV
	 kaYP735/7jcgd8SFnTEnvSssS8UKejEVvBnfZFnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04A97F80589; Sat,  6 Jul 2024 09:45:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E886AF805AE;
	Sat,  6 Jul 2024 09:45:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F8DDF80508; Sat,  6 Jul 2024 09:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD02CF8014C
	for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2024 09:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD02CF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=hZgwdmCz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IkhEDCrR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=hZgwdmCz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=IkhEDCrR
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9DD2E1F80E;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51sz6ZyXGAZRWYBQOVTmB2dfKX8jPgSH4LF1j9sfPyM=;
	b=hZgwdmCz77i6TPvd/RaojjIzr18cf4oNtwn/dcbXjVWDRxzL5hLM3obUrkajmvqRLyAJde
	DsKnArkZLkJFrswNJPHD75Lr8X+32maQ/cDwwD8+nmNzcTUQbA/jxUbrM1zFahtEXEosdg
	Ijg3P8JxCt79OIvYLs6Teqahou/kQlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51sz6ZyXGAZRWYBQOVTmB2dfKX8jPgSH4LF1j9sfPyM=;
	b=IkhEDCrR33IbyiBLwHCQId3AN7ulqjZcmgo22pOCJcp/7YEC7NpAkgysPbcqyatzaKae+l
	YYoK7YKwZtetOtCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hZgwdmCz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IkhEDCrR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51sz6ZyXGAZRWYBQOVTmB2dfKX8jPgSH4LF1j9sfPyM=;
	b=hZgwdmCz77i6TPvd/RaojjIzr18cf4oNtwn/dcbXjVWDRxzL5hLM3obUrkajmvqRLyAJde
	DsKnArkZLkJFrswNJPHD75Lr8X+32maQ/cDwwD8+nmNzcTUQbA/jxUbrM1zFahtEXEosdg
	Ijg3P8JxCt79OIvYLs6Teqahou/kQlo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=51sz6ZyXGAZRWYBQOVTmB2dfKX8jPgSH4LF1j9sfPyM=;
	b=IkhEDCrR33IbyiBLwHCQId3AN7ulqjZcmgo22pOCJcp/7YEC7NpAkgysPbcqyatzaKae+l
	YYoK7YKwZtetOtCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76F1413A82;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +CCtG031iGZRDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jul 2024 07:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 3/5] .gitignore: Add aplaymidi2 and arecordmidi2
Date: Sat,  6 Jul 2024 09:42:29 +0200
Message-ID: <20240706074232.6364-3-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706074232.6364-1-tiwai@suse.de>
References: <20240706074232.6364-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9DD2E1F80E
X-Spamd-Result: default: False [-1.91 / 50.00];
	BAYES_HAM(-1.90)[94.43%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: NZOMW6D7WZ5L5GC77H2QNK7K4IVHN5RW
X-Message-ID-Hash: NZOMW6D7WZ5L5GC77H2QNK7K4IVHN5RW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZOMW6D7WZ5L5GC77H2QNK7K4IVHN5RW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index b61e1df34b11..7a5817f253d7 100644
--- a/.gitignore
+++ b/.gitignore
@@ -48,6 +48,8 @@ iecset/iecset
 seq/aconnect/aconnect
 seq/aplaymidi/aplaymidi
 seq/aplaymidi/arecordmidi
+seq/aplaymidi2/aplaymidi2
+seq/aplaymidi2/arecordmidi2
 seq/aseqdump/aseqdump
 seq/aseqsend/aseqsend
 seq/aseqnet/aseqnet
-- 
2.43.0

