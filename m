Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A917229B7
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 16:49:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DEB6825;
	Mon,  5 Jun 2023 16:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DEB6825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685976562;
	bh=ucOenpIhyQHtU9opD7HRjyaONgF+MW9jjdFBjCHmeN8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZE+NwXg+iMM+2/YtnroSE32PGx4r8TL6bes+A2CJirMuBzJ9ibBqAOy+gI3RHWTyv
	 xHeI/zod4XwTlMMK8Rgu2MNKBCRe59qRTFYcPmxkjXtYi+YqaxNNly5PzNPikl89ai
	 6d8x7czQC5qr9vMf0R9UsOVb3jgRkUTtPhsIPI/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BD90F8016C; Mon,  5 Jun 2023 16:48:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B31DDF8016C;
	Mon,  5 Jun 2023 16:48:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD222F80254; Mon,  5 Jun 2023 16:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62D13F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 16:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62D13F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G+PDZBYW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=U+kg53V/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7CDB21B67;
	Mon,  5 Jun 2023 14:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685976481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSgax4rMLB5Ej1iWw2VeveKyp/v9Eyqcam0xxdkZvQM=;
	b=G+PDZBYWeRdlvSpQjHBJT4CR08Q/+ZocPYt6ua7F9HCRF2I2SIoTRd/xr+CYjbRyMxCQFj
	dcH1hTp36W1R7qBKQUNzKokaYitLvzN/PPwSJXM5XW/IKdrm8G+GF1iVzt0/kaIPTYorsD
	8zXqPq7/Ayw6hS78WJmzYCyhvLZNiD8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685976481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSgax4rMLB5Ej1iWw2VeveKyp/v9Eyqcam0xxdkZvQM=;
	b=U+kg53V/Y8mj2MPY+dMEbzVwkNO0GwcOXYrqGpvdFdGpceou1HwzRENdp+nXib2c1QJGit
	LRnEMC59KjHbFIDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4B2113A3C;
	Mon,  5 Jun 2023 14:48:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AOsJM6H1fWQMXwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 14:48:01 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: seq: Avoid confusion of aligned read size
Date: Mon,  5 Jun 2023 16:47:58 +0200
Message-Id: <20230605144758.6677-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230605144758.6677-1-tiwai@suse.de>
References: <20230605144758.6677-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GEDWO6A55H23IHMSZZ7GFOKHYWUPXVRZ
X-Message-ID-Hash: GEDWO6A55H23IHMSZZ7GFOKHYWUPXVRZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEDWO6A55H23IHMSZZ7GFOKHYWUPXVRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the read event packet size in snd_seq_read() is defined by
client->midi_version value that is guaranteed to be zero if UMP isn't
enabled.  But the static analyzer doesn't know of the fact, and it
still suspects as if it were leading to a potential overflow.

Add the more explicit check of CONFIG_SND_SEQ_UMP to determine the
aligned_size value for avoiding the confusion.

Fixes: 46397622a3fa ("ALSA: seq: Add UMP support")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202305261415.NY0vapZK-lkp@intel.com/
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 948ae45e0cc3..e3f9ea67d019 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -451,7 +451,7 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
 	err = 0;
 	snd_seq_fifo_lock(fifo);
 
-	if (client->midi_version > 0)
+	if (IS_ENABLED(CONFIG_SND_SEQ_UMP) && client->midi_version > 0)
 		aligned_size = sizeof(struct snd_seq_ump_event);
 	else
 		aligned_size = sizeof(struct snd_seq_event);
-- 
2.35.3

