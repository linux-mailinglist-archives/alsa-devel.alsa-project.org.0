Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B8577B7FE
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 13:58:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09AD7832;
	Mon, 14 Aug 2023 13:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09AD7832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014301;
	bh=jKX6+VbjJeDIRhh7Ey7VbwUY0e6tHoKah/voBAzjDTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XXEozOkuLBOn3oFd8NXsy0QiGV4dqwi3bdJxbJmwp7WZW33gc85iy29qweY3FNwN7
	 aVf7kIt6bitdh1YWB9Dd2eYdlfSTNJVg0ulQUWwOfWWat7FPdMg6ayq/8lAUBzSbKp
	 9mAqu+pO0GYpVXI6J0UQWnusEiqiwCiiiceWGEvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03C32F80558; Mon, 14 Aug 2023 13:57:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA4EF80557;
	Mon, 14 Aug 2023 13:57:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FEDBF8056F; Mon, 14 Aug 2023 13:55:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F2DCF8025F
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F2DCF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=V9QV+xTy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9OYnNMGL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED1B02199A;
	Mon, 14 Aug 2023 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQB22YUaqqsp9Lcc9VpyXGAbecK3pOiPSKbU17qgYNI=;
	b=V9QV+xTyT5G0+dZBA/zXvJVOsxOew8RJnlA/Cd+nUJSm4kOG+/WtY7LuiO6NApubG4yB/M
	hX+MERsd0qVp0CTAl+DV9aHV9bXzV0HocuJAtBvoKtWwrLoYYzMwnBclBQYr0Hp93t0xlv
	r59MQUnWwuX39sMc0jPfzmmPoFBWnVg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQB22YUaqqsp9Lcc9VpyXGAbecK3pOiPSKbU17qgYNI=;
	b=9OYnNMGLdG5qDbG6B9FMxTf/mk7nEbquTyrzNOkI/DDsv7dkLFo+ectsH46Sb0kLM+ciAq
	SHtnVGtd37nwe2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC7B0138EE;
	Mon, 14 Aug 2023 11:55:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2P0kLUAW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:44 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 03/25] ALSA: core: Add memory copy helpers between iov_iter
 and iomem
Date: Mon, 14 Aug 2023 13:55:01 +0200
Message-Id: <20230814115523.15279-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NBGUABJXOTSFE33O2D55OGG4OPMHNKJ6
X-Message-ID-Hash: NBGUABJXOTSFE33O2D55OGG4OPMHNKJ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBGUABJXOTSFE33O2D55OGG4OPMHNKJ6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add two more helpers for copying memory between iov_iter and iomem,
which will be used by the new PCM copy ops in a few drivers.
The existing helpers became wrappers of those now.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is inverted from copy_from/to_user().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h |  5 ++++
 sound/core/memory.c | 56 ++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 53 insertions(+), 8 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ff4a0c1c93a2..f75beead79e3 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1559,6 +1559,11 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 #define pcm_dbg(pcm, fmt, args...) \
 	dev_dbg((pcm)->card->dev, fmt, ##args)
 
+/* helpers for copying between iov_iter and iomem */
+int copy_to_iter_fromio(struct iov_iter *itert, const void __iomem *src,
+			size_t count);
+int copy_from_iter_toio(void __iomem *dst, struct iov_iter *iter, size_t count);
+
 struct snd_pcm_status64 {
 	snd_pcm_state_t state;		/* stream state */
 	u8 rsvd[4];
diff --git a/sound/core/memory.c b/sound/core/memory.c
index 5d894dc32f7d..e5b54cd73ed6 100644
--- a/sound/core/memory.c
+++ b/sound/core/memory.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/uaccess.h>
 #include <sound/core.h>
+#include <sound/pcm.h>
 
 /**
  * copy_to_user_fromio - copy data from mmio-space to user-space
@@ -21,9 +22,30 @@
  * Return: Zero if successful, or non-zero on failure.
  */
 int copy_to_user_fromio(void __user *dst, const volatile void __iomem *src, size_t count)
+{
+	struct iov_iter iter;
+
+	if (import_ubuf(ITER_DEST, dst, count, &iter))
+		return -EFAULT;
+	return copy_to_iter_fromio(&iter, (const void __iomem *)src, count);
+}
+EXPORT_SYMBOL(copy_to_user_fromio);
+
+/**
+ * copy_to_iter_fromio - copy data from mmio-space to iov_iter
+ * @dst: the destination iov_iter
+ * @src: the source pointer on mmio
+ * @count: the data size to copy in bytes
+ *
+ * Copies the data from mmio-space to iov_iter.
+ *
+ * Return: Zero if successful, or non-zero on failure.
+ */
+int copy_to_iter_fromio(struct iov_iter *dst, const void __iomem *src,
+			size_t count)
 {
 #if defined(__i386__) || defined(CONFIG_SPARC32)
-	return copy_to_user(dst, (const void __force*)src, count) ? -EFAULT : 0;
+	return !copy_to_iter((const void __force *)src, count, dst) ? -EFAULT : 0;
 #else
 	char buf[256];
 	while (count) {
@@ -31,16 +53,15 @@ int copy_to_user_fromio(void __user *dst, const volatile void __iomem *src, size
 		if (c > sizeof(buf))
 			c = sizeof(buf);
 		memcpy_fromio(buf, (void __iomem *)src, c);
-		if (copy_to_user(dst, buf, c))
+		if (!copy_to_iter(buf, c, dst))
 			return -EFAULT;
 		count -= c;
-		dst += c;
 		src += c;
 	}
 	return 0;
 #endif
 }
-EXPORT_SYMBOL(copy_to_user_fromio);
+EXPORT_SYMBOL(copy_to_iter_fromio);
 
 /**
  * copy_from_user_toio - copy data from user-space to mmio-space
@@ -53,23 +74,42 @@ EXPORT_SYMBOL(copy_to_user_fromio);
  * Return: Zero if successful, or non-zero on failure.
  */
 int copy_from_user_toio(volatile void __iomem *dst, const void __user *src, size_t count)
+{
+	struct iov_iter iter;
+
+	if (import_ubuf(ITER_SOURCE, (void __user *)src, count, &iter))
+		return -EFAULT;
+	return copy_from_iter_toio((void __iomem *)dst, &iter, count);
+}
+EXPORT_SYMBOL(copy_from_user_toio);
+
+/**
+ * copy_from_iter_toio - copy data from iov_iter to mmio-space
+ * @dst: the destination pointer on mmio-space
+ * @src: the source iov_iter
+ * @count: the data size to copy in bytes
+ *
+ * Copies the data from iov_iter to mmio-space.
+ *
+ * Return: Zero if successful, or non-zero on failure.
+ */
+int copy_from_iter_toio(void __iomem *dst, struct iov_iter *src, size_t count)
 {
 #if defined(__i386__) || defined(CONFIG_SPARC32)
-	return copy_from_user((void __force *)dst, src, count) ? -EFAULT : 0;
+	return !copy_from_iter((void __force *)dst, count, src) ? -EFAULT : 0;
 #else
 	char buf[256];
 	while (count) {
 		size_t c = count;
 		if (c > sizeof(buf))
 			c = sizeof(buf);
-		if (copy_from_user(buf, src, c))
+		if (!copy_from_iter(buf, c, src))
 			return -EFAULT;
 		memcpy_toio(dst, buf, c);
 		count -= c;
 		dst += c;
-		src += c;
 	}
 	return 0;
 #endif
 }
-EXPORT_SYMBOL(copy_from_user_toio);
+EXPORT_SYMBOL(copy_from_iter_toio);
-- 
2.35.3

