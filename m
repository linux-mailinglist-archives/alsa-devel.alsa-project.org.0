Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E493935E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 19:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8533DFA;
	Mon, 22 Jul 2024 19:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8533DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721671052;
	bh=PXWwNdLivNmL3loxTjcdIVhsQSSWJ5vEvlVrMr7Xrcw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mLXbGfOBAVvtIM6Is3JkLVPOlugWQHBhamFczv9iG9FBOISTKu4WZHZzScL2M+q+v
	 xidyf8uuUEAvDNPiM80R5ghPCXFmgssCrWwbrfBllHplGBBQqsCBH8duhK8wCD9l41
	 LI4gHRS5u6IlwiDlVQqJ8Eaz1KyTwVTD8fme7AuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 754E0F805AE; Mon, 22 Jul 2024 19:57:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5620AF805B0;
	Mon, 22 Jul 2024 19:57:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 366A0F8059F; Mon, 22 Jul 2024 19:52:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C5D41F8019B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 19:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5D41F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YXD+h0dr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZmZHmXYY;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=YXD+h0dr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZmZHmXYY
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D921E1FB7F;
	Mon, 22 Jul 2024 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBuSHLceP67P+Iz3lEuhgQRdYv1BwF/lU+d2DtFYWcM=;
	b=YXD+h0drxm8fqaHdxmdwFnEPYtQZx3y0EsW7GiFj5N+nVkZBtH7PkE3+kAxDldDg6Elhpv
	daupB9KiVYF6TZT1u+MHTh1IzJfvf8fIXbiHt4Tue+V/VDhhdQKJ8FB0LZkRCpoLzxorfY
	abX3470uK1ZsovMZJSdkZVz/DldwLnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBuSHLceP67P+Iz3lEuhgQRdYv1BwF/lU+d2DtFYWcM=;
	b=ZmZHmXYYr0cuq5r2JukwbJF5+x4ujGnSxt8UrrtdwzCZKlPz7Dw4lZ4mqZRF7TuMY15lTD
	KUcT00GRpgoPMgBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YXD+h0dr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZmZHmXYY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1721670704; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBuSHLceP67P+Iz3lEuhgQRdYv1BwF/lU+d2DtFYWcM=;
	b=YXD+h0drxm8fqaHdxmdwFnEPYtQZx3y0EsW7GiFj5N+nVkZBtH7PkE3+kAxDldDg6Elhpv
	daupB9KiVYF6TZT1u+MHTh1IzJfvf8fIXbiHt4Tue+V/VDhhdQKJ8FB0LZkRCpoLzxorfY
	abX3470uK1ZsovMZJSdkZVz/DldwLnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721670704;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBuSHLceP67P+Iz3lEuhgQRdYv1BwF/lU+d2DtFYWcM=;
	b=ZmZHmXYYr0cuq5r2JukwbJF5+x4ujGnSxt8UrrtdwzCZKlPz7Dw4lZ4mqZRF7TuMY15lTD
	KUcT00GRpgoPMgBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9C001398E;
	Mon, 22 Jul 2024 17:51:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CFYzKDCcnmbyBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 22 Jul 2024 17:51:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 01/10] configure: Requires the latest ALSA-lib
 release 1.2.12
Date: Mon, 22 Jul 2024 19:52:05 +0200
Message-ID: <20240722175215.8223-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722175215.8223-1-tiwai@suse.de>
References: <20240722175215.8223-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.19 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: D921E1FB7F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Bar: /
Message-ID-Hash: AXPIXXPD77ZMIEETW7K3H2LPTNL2PRQQ
X-Message-ID-Hash: AXPIXXPD77ZMIEETW7K3H2LPTNL2PRQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXPIXXPD77ZMIEETW7K3H2LPTNL2PRQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

New features such as MIDI 2.0 should be always enabled for the
builds.  Update the dependency to alsa-lib 1.2.12.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 708380cf31dc..4803fe471c57 100644
--- a/configure.ac
+++ b/configure.ac
@@ -21,7 +21,7 @@ AC_PROG_SED
 AC_DISABLE_STATIC
 AM_PROG_LIBTOOL
 PKG_PROG_PKG_CONFIG
-AM_PATH_ALSA(1.2.5)
+AM_PATH_ALSA(1.2.12)
 if test "x$enable_alsatest" = "xyes"; then
 AC_CHECK_FUNC([snd_ctl_elem_add_enumerated],
 	      , [AC_ERROR([No user enum control support in alsa-lib])])
-- 
2.43.0

