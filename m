Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35E575F69
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 12:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C6D1890;
	Fri, 15 Jul 2022 12:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C6D1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657881131;
	bh=1mp7zjznDtY2bDiu5AQR1NcrSYxpNvQ8cufvuEFXF1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FddwwvFkTK0t3DXdZsspAQMURKSKy2BTYNSBkCNE/hjWFkIFKdF5HgF5+xz/sW67c
	 BEbWo7koqF8lPYbW7XyMXMIfW3JITkt0S5gkNtLHh1Zf2sans+kD1Q//hXMtjCW6Lv
	 K+KZWM66N716ZQAmhjZeXZTXaPmCAK9qZ5rvfuBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9159F80563;
	Fri, 15 Jul 2022 12:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACD15F8055C; Fri, 15 Jul 2022 12:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B951F8015B
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B951F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="VQMNUdS6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="L8phx62L"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A0DFA1FB8D;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657880978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZ7EkE8hMGx2fYCUAZQnWtSmYzro4b8woBAPzMUPSIM=;
 b=VQMNUdS6FaPmvDB7qWXmOCv0mApTkaY7ddGR5mZzWAJAc6S2Wy1Cs4HE6OU4o11Nd6IKMX
 rftM4ZbpX7knS43izoq9knE4c+63/yW9Cwmm9EWy5Iqov99CLBkBr0lqdstSSMy5Ve7/gK
 xZS2dUYPW3/xI+2evBIRG5Lb6nFPNVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657880978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZ7EkE8hMGx2fYCUAZQnWtSmYzro4b8woBAPzMUPSIM=;
 b=L8phx62LVdkz+hil2gfsGyawH59R69K3W/p7lKNinavBHSgjhtiXOm0UmaUQ5J83Y8zUUF
 xje3GopuXl9bLtCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 847F213AC3;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iCalH5JB0WI+WwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 10:29:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ALSA: core: Drop async signal support
Date: Fri, 15 Jul 2022 12:29:34 +0200
Message-Id: <20220715102935.4695-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220715102935.4695-1-tiwai@suse.de>
References: <20220715102935.4695-1-tiwai@suse.de>
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

