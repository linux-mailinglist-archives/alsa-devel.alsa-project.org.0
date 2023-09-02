Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409279058A
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 08:12:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE3C1FC;
	Sat,  2 Sep 2023 08:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE3C1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693635170;
	bh=7Ht7VNQ4Keq7ZFCScRxdxr+G46e3KdEGzQF+1u5D2Po=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QMXtDHwMWE4WQRtAfLWrKIrg1kxYHLfZywFL13mnk4c7CqxWAC6LkKYFX1cP1FpdQ
	 IK3NMnhyDvKSznrcz8NsS3UwdeYbe4ax1j2R1Npjv4q+4mjcG5arizZbk0cplPhBRq
	 QLo0Hi+DjZT51im8TvQLEtwu6jxeM5sXg05wmp7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62275F80551; Sat,  2 Sep 2023 08:11:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14CEFF80558;
	Sat,  2 Sep 2023 08:11:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA00AF8032D; Sat,  2 Sep 2023 08:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2417CF80074
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 08:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2417CF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iVjx8aRl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=poMtVKZN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 191DC1F74B;
	Sat,  2 Sep 2023 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693635079;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOFMR9IUsvsie+hyKY3JUIxrb5u8+664pYqo6FEGNkQ=;
	b=iVjx8aRlAE2Pv8+08kn/ZngiP8kMfKlW4h/2J0IetE8KnoFBDNK1X7UkCZ2RikwPUbQViy
	e5bLo5/dywaXOsXei0LSAkR9GFAWUAkMXG5H+DHfwKGxOKrEZXbr+3jmjps8SgHcjB28w7
	PNypmh4RYRmksOh28d3p76E24pED3ps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693635079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HOFMR9IUsvsie+hyKY3JUIxrb5u8+664pYqo6FEGNkQ=;
	b=poMtVKZNMLUpC+Nolrq9VOdp8geoGVCylnXaV1YDz6IoB9S2atRQ+ST0h06HIVZX8w1C6o
	oxqXqWutxxy95UAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF7AB13A18;
	Sat,  2 Sep 2023 06:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4Aq8NQbS8mTGUgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 02 Sep 2023 06:11:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/2] ALSA: sb: Fix wrong argument in commented code
Date: Sat,  2 Sep 2023 08:10:44 +0200
Message-Id: <20230902061044.19366-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230902061044.19366-1-tiwai@suse.de>
References: <20230902061044.19366-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H53YX56UFCZQIIW6N6WP3OG7OK2QY2AK
X-Message-ID-Hash: H53YX56UFCZQIIW6N6WP3OG7OK2QY2AK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H53YX56UFCZQIIW6N6WP3OG7OK2QY2AK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While rewriting the code from sockptr_t to iov_iter during the
development, I forgot to replace one place in emu8000-pcm code.  As
it's in the disabled area (with ifdef), it's never built and
overlooked.  Replace with the proper argument NULL.

Fixes: 9d0fdc602de9 ("ALSA: emu8000: Convert to generic PCM copy ops")
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Closes: https://lore.kernel.org/r/20230902053646.GK3390869@ZenIV
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index c05935c2edc4..9234d4fe8ada 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -456,7 +456,7 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 	/* convert to word unit */
 	pos = (pos << 1) + rec->loop_start[voice];
 	count <<= 1;
-	LOOP_WRITE(rec, pos, USER_SOCKPTR(NULL), count);
+	LOOP_WRITE(rec, pos, NULL, count);
 	return 0;
 }
 
-- 
2.35.3

