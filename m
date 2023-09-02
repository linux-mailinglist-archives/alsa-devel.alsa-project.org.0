Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34959790589
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 08:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DEA8203;
	Sat,  2 Sep 2023 08:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DEA8203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693635155;
	bh=Q+h8IrjcBiP0V8a2rLvYQrFoUABVRhYY4wbXJP6aZ6s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NuL3EvcaLhnuaX6wgC021AVuQos8/8swhvMTrDsQc6lkustA7nrBpi2AUv0LTIbfS
	 uZfoCBNO7B06B4IYGjroaqxkmbEtszlsFs0aHY4RNB1w0gZ3I+jxXkUhn8IMnnDyDX
	 KtMbir4TnXq/bBezH2p4w09QT/R1jQDbwzvLCBrU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55AE6F80537; Sat,  2 Sep 2023 08:11:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E040F8025F;
	Sat,  2 Sep 2023 08:11:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC97F804DA; Sat,  2 Sep 2023 08:11:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 74F17F800F5
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 08:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F17F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ar221e/w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uUvxiMMK
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DC38B1F45F;
	Sat,  2 Sep 2023 06:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693635078;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=uJN5skSgqO36GV5GT+zFtouE3vjHITi6azy/wCQ7+UU=;
	b=ar221e/wn9iQdWW6YBo3db8ajXaPMcZfqT+eFXKK6J0MwhUQlsGyUQ4KG3KsHVauTmiTwt
	t1yYvpLAwGXFHMvz1vS4E2OcjW+ouiK9dGHWkBUxhD6lPzTMB+CmIx6zRPdhvfVvDgH6gr
	9fj2PdFVpQrhVehooBUGVtHk5DhMjrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693635078;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=uJN5skSgqO36GV5GT+zFtouE3vjHITi6azy/wCQ7+UU=;
	b=uUvxiMMKWDXaqUmggL0MVt7TV8vC2KKzaD2e4XlAc9K/5jEV1bvSOg9hR+YdY3dv6ojv85
	C7cpQ2Nhqm28mUAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC88413440;
	Sat,  2 Sep 2023 06:11:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id abzeLAbS8mTGUgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sat, 02 Sep 2023 06:11:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 1/2] ALSA: pcm: Fix error checks of default read/write copy
 ops
Date: Sat,  2 Sep 2023 08:10:43 +0200
Message-Id: <20230902061044.19366-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SFUEXIP642SG265CGHK2SWNPT4MANR43
X-Message-ID-Hash: SFUEXIP642SG265CGHK2SWNPT4MANR43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFUEXIP642SG265CGHK2SWNPT4MANR43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

copy_from/to_iter() returns the actually copied bytes, and the more
correct check should be to compare with the given bytes, instead of
zero-check.

Fixes: cf393babb37a ("ALSA: pcm: Add copy ops with iov_iter")
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Closes: https://lore.kernel.org/r/20230902053044.GJ3390869@ZenIV
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_lib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 4859fb1caec9..a11cd7d6295f 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1992,8 +1992,8 @@ static int default_write_copy(struct snd_pcm_substream *substream,
 			      int channel, unsigned long hwoff,
 			      struct iov_iter *iter, unsigned long bytes)
 {
-	if (!copy_from_iter(get_dma_ptr(substream->runtime, channel, hwoff),
-			    bytes, iter))
+	if (copy_from_iter(get_dma_ptr(substream->runtime, channel, hwoff),
+			   bytes, iter) != bytes)
 		return -EFAULT;
 	return 0;
 }
@@ -2025,8 +2025,8 @@ static int default_read_copy(struct snd_pcm_substream *substream,
 			     int channel, unsigned long hwoff,
 			     struct iov_iter *iter, unsigned long bytes)
 {
-	if (!copy_to_iter(get_dma_ptr(substream->runtime, channel, hwoff),
-			  bytes, iter))
+	if (copy_to_iter(get_dma_ptr(substream->runtime, channel, hwoff),
+			 bytes, iter) != bytes)
 		return -EFAULT;
 	return 0;
 }
-- 
2.35.3

