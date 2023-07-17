Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0A755BAA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 08:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A11884A;
	Mon, 17 Jul 2023 08:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A11884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689575342;
	bh=iAQTkKzR55U5582Tf7h4gRFimkhyFNQG7s3NhTRy15Q=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rzv6r/7G5dB2PHGpbDMsvwZOBEaGIk8saScniRrodM2mXwmAwMuEvGwv3GQGwksTE
	 4AONLUZOv+IvS/Rcko28uwQ4ju1UwHUouQAqY2cdpCuuXa1NHlxeeQCz19p5VSObJG
	 Z+fSCPJlzaNMPM9uyRZInMdXnP/8krLY8jGqRLgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B98EF8032D; Mon, 17 Jul 2023 08:27:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28114F8032D;
	Mon, 17 Jul 2023 08:27:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11967F80494; Mon, 17 Jul 2023 08:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3C47F8032D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 08:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C47F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tQYvJYs3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CFgZX3e4
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50B8D21980;
	Mon, 17 Jul 2023 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689575158; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=mL0YLAesr46J5kgFrJEnakHuf/hYyTjPspSykidrhuI=;
	b=tQYvJYs3U8b+zctG7Tnk/67JlzkFRmO4V3OnC0XjwCrZR0iGF3A46nydFNT2xUZHTor7by
	Md3o1/b0+QTzalWcg6tER64K3B1Q2+5q8q98uVVZI3gMg1YbXTyf0xDPWRi0c5vgAB1rGs
	Y/29kS50XBNA9Dd+O1d6Ov0e0lo/3eo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689575158;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=mL0YLAesr46J5kgFrJEnakHuf/hYyTjPspSykidrhuI=;
	b=CFgZX3e43oXFj8HSQP6GJT1QPnWbVbyB/JUZXVf0Vv0+yIR2Aec3YU78M3nHuSwJF4uLtf
	c6qLsEYFXwgIjaBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32BA213276;
	Mon, 17 Jul 2023 06:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id b3txC/betGREawAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 17 Jul 2023 06:25:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: seq: Fix memory leak at error path in
 snd_seq_create_port()
Date: Mon, 17 Jul 2023 08:25:55 +0200
Message-Id: <20230717062555.31592-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LKY2CJQ7CDRXLWLN757IEEGLDAY5BZUQ
X-Message-ID-Hash: LKY2CJQ7CDRXLWLN757IEEGLDAY5BZUQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKY2CJQ7CDRXLWLN757IEEGLDAY5BZUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We forgot to release a newly allocated item at the error path in
snd_seq_create_port().  This patch fixes it.

Fixes: 7c3f0d3d3a11 ("ALSA: seq: Check the conflicting port at port creation")
Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000098ed3a0600965f89@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: only patch meta data correction

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

