Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B1F929195
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jul 2024 09:47:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F30714E8;
	Sat,  6 Jul 2024 09:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F30714E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720252045;
	bh=z1sximtOxEql/sQW6cyI5na33cauJ8UaPU3ne9B7JBw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nS0IzgLtiSnKe+P7ijFrlN2BPyrvEJIe+cUhtd3gDwzb7omBGQnlGvfcpcIW5eyL4
	 cA2t5B8TedomAr5r0auxiNMJiYEyz8i4mYgHwmED2/LYXtI8Y0sXHjFDHvLwh/VY5c
	 IP+xuw/tuXmRQgFAIK5mSqN+LxYF8JX8rv1khi24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98AA7F805A1; Sat,  6 Jul 2024 09:45:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A86F8F80636;
	Sat,  6 Jul 2024 09:45:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D066FF8014C; Sat,  6 Jul 2024 09:44:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D53EF80301
	for <alsa-devel@alsa-project.org>; Sat,  6 Jul 2024 09:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D53EF80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=q28uTP0R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iWGgh23+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=q28uTP0R;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iWGgh23+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6FCE21A5A;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5k1S2jNYdelkOuiI1PFEudxF5ceVrh3wcMIgj/IqBqc=;
	b=q28uTP0Rcfu6YOMz1oS9mR9I1mlOa0nOdtqxrWlTVrp/wjE9qDJ0+kSplofsLz6xxlIpcb
	8B2GaMTAY+4zHvivwsZSPuHJFkUyLRSF5J9p+6WczEYYCRg4NrrZQDZ0Ve8jUheyN8kkxv
	Fzl7aypcrl1braZLfRWPr6j0UD1vMz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5k1S2jNYdelkOuiI1PFEudxF5ceVrh3wcMIgj/IqBqc=;
	b=iWGgh23+vsx7CQkMyzIt1YEGql7b1DKYylFous8HeAOkNfnfdfs3kb83flGPLSETs+Y2sQ
	u4E3iQXXr49vPfBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q28uTP0R;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iWGgh23+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1720251725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5k1S2jNYdelkOuiI1PFEudxF5ceVrh3wcMIgj/IqBqc=;
	b=q28uTP0Rcfu6YOMz1oS9mR9I1mlOa0nOdtqxrWlTVrp/wjE9qDJ0+kSplofsLz6xxlIpcb
	8B2GaMTAY+4zHvivwsZSPuHJFkUyLRSF5J9p+6WczEYYCRg4NrrZQDZ0Ve8jUheyN8kkxv
	Fzl7aypcrl1braZLfRWPr6j0UD1vMz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720251725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5k1S2jNYdelkOuiI1PFEudxF5ceVrh3wcMIgj/IqBqc=;
	b=iWGgh23+vsx7CQkMyzIt1YEGql7b1DKYylFous8HeAOkNfnfdfs3kb83flGPLSETs+Y2sQ
	u4E3iQXXr49vPfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A26E112FF6;
	Sat,  6 Jul 2024 07:42:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8JleJk31iGZRDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 06 Jul 2024 07:42:05 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 4/5] .gitignore: Add stale files for topology
 builds
Date: Sat,  6 Jul 2024 09:42:30 +0200
Message-ID: <20240706074232.6364-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706074232.6364-1-tiwai@suse.de>
References: <20240706074232.6364-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.21 / 50.00];
	BAYES_HAM(-2.20)[96.18%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D6FCE21A5A
Message-ID-Hash: C4QLT326XLAFWZ6RPBFBO4EV5FPZQ3QF
X-Message-ID-Hash: C4QLT326XLAFWZ6RPBFBO4EV5FPZQ3QF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4QLT326XLAFWZ6RPBFBO4EV5FPZQ3QF/>
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
index 7a5817f253d7..1763f60a8376 100644
--- a/.gitignore
+++ b/.gitignore
@@ -29,6 +29,8 @@ ABOUT-NLS
 *.o
 *~
 .deps
+.libs
+.dirstamp
 
 alsactl/alsactl
 alsactl/alsactl_init.7
-- 
2.43.0

