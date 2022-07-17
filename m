Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AAF5774E2
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 09:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68FCB1918;
	Sun, 17 Jul 2022 09:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68FCB1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658041713;
	bh=1mp7zjznDtY2bDiu5AQR1NcrSYxpNvQ8cufvuEFXF1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dh799d33sr2oeoBG0MY1r3OUWF0jZXR2XU9I0g0XvzAtQykSXg+MCouKIfOkznbDu
	 rsibGZH5VqIzbuERTBC7mtxkCfS0nyrAulN/mS54t6fB/S5oks5gXEHnGXL/B0Cj9Y
	 7BMXiXIrfoqfxluAD+SHbjyYKrPTSsfEzNxwZkgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B3E0F80564;
	Sun, 17 Jul 2022 09:06:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D3A8F800CB; Sun, 17 Jul 2022 09:06:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5205F804D8
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 09:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5205F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ptAF0xEm"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="0M+Sz2nC"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9208344A8;
 Sun, 17 Jul 2022 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658041555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZ7EkE8hMGx2fYCUAZQnWtSmYzro4b8woBAPzMUPSIM=;
 b=ptAF0xEmSmoq1Lv/qq2Pr88wb/20RlzSfZ5QqNE/21YkRS+mmUBciOra9oYGdti5lhhaPR
 iKZB7UKUQKPtuFGE6RSPmlQ1a3kZFCa7A8j9si6oa4ZPEP5tZ2bn2VOR655hX0F51y9x9M
 iFppxzOPEOSOejKZwTqrlo96BIB3HcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658041555;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZ7EkE8hMGx2fYCUAZQnWtSmYzro4b8woBAPzMUPSIM=;
 b=0M+Sz2nCmKAiGKLWpZIdo9jHgoFa4WNlQwaxp/MDRVWj8qPud7wSo09IfYVIXpzJ7rPylC
 UmHYlmRrtpOnp6Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE52A13A89;
 Sun, 17 Jul 2022 07:05:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sNuMLdO002LDawAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 17 Jul 2022 07:05:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 4/5] ALSA: core: Drop async signal support
Date: Sun, 17 Jul 2022 09:05:48 +0200
Message-Id: <20220717070549.5993-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220717070549.5993-1-tiwai@suse.de>
References: <20220717070549.5993-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Now fasync support is dropped from all ALSA interfaces, and we can
drop the fasync workaround at the card disconnection code, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/init.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/core/init.c b/sound/core/init.c
index 3ac95c66a4b5..899bfe838a91 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -432,11 +432,8 @@ static int snd_disconnect_release(struct inode *inode, struct file *file)
 	}
 	spin_unlock(&shutdown_lock);
 
-	if (likely(df)) {
-		if ((file->f_flags & FASYNC) && df->disconnected_f_op->fasync)
-			df->disconnected_f_op->fasync(-1, file, 0);
+	if (likely(df))
 		return df->disconnected_f_op->release(inode, file);
-	}
 
 	panic("%s(%p, %p) failed!", __func__, inode, file);
 }
@@ -457,11 +454,6 @@ static int snd_disconnect_mmap(struct file *file, struct vm_area_struct *vma)
 	return -ENODEV;
 }
 
-static int snd_disconnect_fasync(int fd, struct file *file, int on)
-{
-	return -ENODEV;
-}
-
 static const struct file_operations snd_shutdown_f_ops =
 {
 	.owner = 	THIS_MODULE,
@@ -475,7 +467,6 @@ static const struct file_operations snd_shutdown_f_ops =
 	.compat_ioctl = snd_disconnect_ioctl,
 #endif
 	.mmap =		snd_disconnect_mmap,
-	.fasync =	snd_disconnect_fasync
 };
 
 /**
-- 
2.35.3

