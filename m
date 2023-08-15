Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F077D2D9
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6FF82B;
	Tue, 15 Aug 2023 21:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6FF82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692126228;
	bh=Uo9RpRrq+tqE4aFp6WNuHO0ow2NiLxasnDduIp+UAqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YpzfsFmVroy50H8Ib+0jkP2IgVKmdChQIaXatJgqyqldW0rsT/8f3LXBH5PU9UrSE
	 hwwLdyf0qq822s84VOMRHBoSvRU68kE+Mw2E+zw+plT+XrbyN0xmolThdnkl5QH2dN
	 cY5ReeRpxTiz2emWuck72S5uGWZTsxOyuVxAoqbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 523C0F8057A; Tue, 15 Aug 2023 21:02:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49086F8057B;
	Tue, 15 Aug 2023 21:02:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B766F80579; Tue, 15 Aug 2023 21:02:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3576EF8016D
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3576EF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=U0X1AgYf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+TU5ZXj5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54254211C2;
	Tue, 15 Aug 2023 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692126107;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jL1kZwcY6dMGheLY8VT1W4i0RrpIBAIOY7mmAx3IYPo=;
	b=U0X1AgYfraeXpvSANmhqdI7y2OkQ2UGIwcVOzfcm/4PdYBALruX+lRci8AHZZJT5xfnCiw
	Rq/leeZlmplImx0Gfb4IuCNEf1HduS/gLJSTJV3ws+ITLCn5hyV0hdxvDEnSgXDCertqKd
	RDAGtXlAcYho/A2L3BMbJrOlxtTgXeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126107;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jL1kZwcY6dMGheLY8VT1W4i0RrpIBAIOY7mmAx3IYPo=;
	b=+TU5ZXj5De1Bwf8O1Mw0fmUPyyUx62ZWZTkuT1FEmBwy51vPvohgM1zBdg9+Njv67ADUf6
	3Jg43Eu1NUlI1FAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32F511390C;
	Tue, 15 Aug 2023 19:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0PykC5vL22QTVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH v2 01/25] iov_iter: Export import_ubuf()
Date: Tue, 15 Aug 2023 21:01:12 +0200
Message-Id: <20230815190136.8987-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IMCCN2QZIONWTFJY2JJH6QYOXCRVXC7N
X-Message-ID-Hash: IMCCN2QZIONWTFJY2JJH6QYOXCRVXC7N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMCCN2QZIONWTFJY2JJH6QYOXCRVXC7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Export import_ubuf() to be used in sound subsystem for generic memory
handling as Linus suggested.  It's used for constructing an iov_iter
of a single segment user-space copy for PCM data.

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Link: https://lore.kernel.org/r/CAHk-=wh-mUL6mp4chAc6E_UjwpPLyCPRCJK+iB4ZMD2BqjwGHA@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 lib/iov_iter.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index e4dc809d1075..3743bbcbbb89 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1544,6 +1544,7 @@ int import_ubuf(int rw, void __user *buf, size_t len, struct iov_iter *i)
 	iov_iter_ubuf(i, rw, buf, len);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(import_ubuf);
 
 /**
  * iov_iter_restore() - Restore a &struct iov_iter to the same state as when
-- 
2.35.3

