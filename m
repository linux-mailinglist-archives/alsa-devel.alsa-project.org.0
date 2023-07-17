Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 408F6755B94
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 08:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A8F4AE9;
	Mon, 17 Jul 2023 08:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A8F4AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689575168;
	bh=cBxE5r5ufyomHmLvhfpGG9Llldi6vwv4V5FE7W9nM1w=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V1Pnjh7mc4pLHhPmVpn3Og6+GKDJlUjjUPsTgwPf5CWq0cMXd42jcgEmk23f0mFWH
	 kryJM/lzp5F2EbJgRxN7uRrer/klUelRy+RxMj3kbz7PI2ar9OCGY0MK2ji71xzB91
	 XBIsTagYnykvVMe6Je7gj8JitchcR2XWDNFfSwn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52024F80520; Mon, 17 Jul 2023 08:24:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19838F8032D;
	Mon, 17 Jul 2023 08:24:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68080F8047D; Mon, 17 Jul 2023 08:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67505F800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 08:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67505F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tRjG0Cws;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Mw24bowY
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BB56D21984;
	Mon, 17 Jul 2023 06:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689574914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=b2fr8VUpQYJrueEYlb+A+fNLOnvZ8Sv9Hz1XVjw8dUI=;
	b=tRjG0Cws+X1Wl6VfumoalCKgY452XKSaehXljsInqPFReFkwR19HNIyrHXp62qcLPhzn0V
	IH59LswTvZsTFGAk+J4A2LVijcs6ZiJNzfyRv7nfjlLl1i7WvQqVRHldWJ5hrg98WoyLCi
	oTAdKfpGqhLXNvBVZSVRHjRwhRPDFI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689574914;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=b2fr8VUpQYJrueEYlb+A+fNLOnvZ8Sv9Hz1XVjw8dUI=;
	b=Mw24bowYhEsSesW8mluHTHggAvKCljICZlFQ1EVJeCHYUGgpGP6nATR2/G06qViN9f/8Pl
	mn/0LgWjkf2MiUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98CB713276;
	Mon, 17 Jul 2023 06:21:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OJvKIwLetGStaQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 17 Jul 2023 06:21:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: seq: Fix memory leak at error path in
 snd_seq_create_port()
Date: Mon, 17 Jul 2023 08:21:51 +0200
Message-Id: <20230717062151.12597-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FO4AXBG2AJVWY7AQD3ZXHUUTVGDRAEAQ
X-Message-ID-Hash: FO4AXBG2AJVWY7AQD3ZXHUUTVGDRAEAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO4AXBG2AJVWY7AQD3ZXHUUTVGDRAEAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We forgot to release a newly allocated item at the error path in
snd_seq_create_port().  This patch fixes it.

Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000098ed3a0600965f89@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ports.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 9b80f8275026..f3f14ff0f80f 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -149,6 +149,7 @@ int snd_seq_create_port(struct snd_seq_client *client, int port,
 	write_lock_irq(&client->ports_lock);
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->addr.port == port) {
+			kfree(new_port);
 			num = -EBUSY;
 			goto unlock;
 		}
-- 
2.35.3

