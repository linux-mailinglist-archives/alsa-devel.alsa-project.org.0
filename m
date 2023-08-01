Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988A76B541
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 14:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7DFD210;
	Tue,  1 Aug 2023 14:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7DFD210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690894575;
	bh=6piI5+jLQqmUPGf4e2pKrr8nmCqt0tsAVNhm0IOtOmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JhTOEetidxhkcc3g8VPZnD74XRTrJvUi1zsJMOWE5vAQtdc+IlyUX4PtkiGEXMcHZ
	 1g11GWe92RS/gZcXMVIFuomu6Y0ZxUApk5klMa3G6g6b1HpT+J2IvyY272tDEBGQb+
	 kVlR0cMulkjhqW6KMdqcodd1eE6qERskbgYp51YU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8674F8053B; Tue,  1 Aug 2023 14:55:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06CFBF80149;
	Tue,  1 Aug 2023 14:55:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 344AFF801D5; Tue,  1 Aug 2023 14:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96BCBF8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 14:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BCBF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=t7s75b7D;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=L/+EhMg6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BBEB01FD7C;
	Tue,  1 Aug 2023 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690894486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+eWlQeeVC2euHUSOeWbcjmCz76Xb9mTKJnw2WhwjLg=;
	b=t7s75b7DrHPYfkCXw7FDYSyFbZ+eFfBMn15m7OYOVuSyyLrlrCbVEtuSsgMFKIyIvv5Ho5
	CXs2jrmvNmzRG22y9IPvSJeuTYeoARHIdanewOkoZNAj1zOai/qIhM0+qzi/l1cfU0dgBj
	nlIvHEHnHQqn+SrpvAfOym8rWB7ZtPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690894486;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1+eWlQeeVC2euHUSOeWbcjmCz76Xb9mTKJnw2WhwjLg=;
	b=L/+EhMg6JTslMiA7SDZmOv5ox9H011tP9374Q3zbVOlIKn4lUfyKLSfdapnaVSEAMmM1w9
	gR5xSz+JTBsoWoDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 600F1139BD;
	Tue,  1 Aug 2023 12:54:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sr9XFpYAyWQSNAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 01 Aug 2023 12:54:46 +0000
Date: Tue, 01 Aug 2023 14:54:45 +0200
Message-ID: <87leeugbxm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
In-Reply-To: <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
	<b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
	<87h6pjj2ui.wl-tiwai@suse.de>
	<a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GWAS2EBPDZFQBIJVSPDNGT5GODRFR2BD
X-Message-ID-Hash: GWAS2EBPDZFQBIJVSPDNGT5GODRFR2BD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWAS2EBPDZFQBIJVSPDNGT5GODRFR2BD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 21:40:20 +0200,
Mark Brown wrote:
> 
> On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > It really feels like we ought to rename, or add an alias for, the type
> > > if we're going to start using it more widely - it's not helping to make
> > > the code clearer.
> 
> > That was my very first impression, too, but I changed my mind after
> > seeing the already used code.  An alias might work, either typedef or
> > define genptr_t or such as sockptr_t.  But we'll need to copy the
> > bunch of helper functions, too...
> 
> I would predict that if the type becomes more widely used that'll happen
> eventually and the longer it's left the more work it'll be.

That's true.  The question is how more widely it'll be used, then.

Is something like below what you had in mind, too?


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] Introduce uniptr_t as replacement of sockptr_t

Although sockptr_t is used already in several places as a "universal"
pointer, it's still too confusing as if were related with network
stuff.

Make a more generic type, uniptr_t, that does exactly as same as
sockptr_t for a wider use.  sockptr_t becomes now alias to uniptr_t.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/linux/sockptr.h | 124 +++++-----------------------------------
 include/linux/uniptr.h  | 117 +++++++++++++++++++++++++++++++++++++
 2 files changed, 132 insertions(+), 109 deletions(-)
 create mode 100644 include/linux/uniptr.h

diff --git a/include/linux/sockptr.h b/include/linux/sockptr.h
index bae5e2369b4f..dc803989a4d6 100644
--- a/include/linux/sockptr.h
+++ b/include/linux/sockptr.h
@@ -1,118 +1,24 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2020 Christoph Hellwig.
- *
- * Support for "universal" pointers that can point to either kernel or userspace
- * memory.
+ * Aliases for the old sockptr_t and its helpers for the new uniptr_t
  */
 #ifndef _LINUX_SOCKPTR_H
 #define _LINUX_SOCKPTR_H
 
-#include <linux/slab.h>
-#include <linux/uaccess.h>
+#include <linux/uniptr.h>
 
-typedef struct {
-	union {
-		void		*kernel;
-		void __user	*user;
-	};
-	bool		is_kernel : 1;
-} sockptr_t;
-
-static inline bool sockptr_is_kernel(sockptr_t sockptr)
-{
-	return sockptr.is_kernel;
-}
-
-static inline sockptr_t KERNEL_SOCKPTR(void *p)
-{
-	return (sockptr_t) { .kernel = p, .is_kernel = true };
-}
-
-static inline sockptr_t USER_SOCKPTR(void __user *p)
-{
-	return (sockptr_t) { .user = p };
-}
-
-static inline bool sockptr_is_null(sockptr_t sockptr)
-{
-	if (sockptr_is_kernel(sockptr))
-		return !sockptr.kernel;
-	return !sockptr.user;
-}
-
-static inline int copy_from_sockptr_offset(void *dst, sockptr_t src,
-		size_t offset, size_t size)
-{
-	if (!sockptr_is_kernel(src))
-		return copy_from_user(dst, src.user + offset, size);
-	memcpy(dst, src.kernel + offset, size);
-	return 0;
-}
-
-static inline int copy_from_sockptr(void *dst, sockptr_t src, size_t size)
-{
-	return copy_from_sockptr_offset(dst, src, 0, size);
-}
-
-static inline int copy_to_sockptr_offset(sockptr_t dst, size_t offset,
-		const void *src, size_t size)
-{
-	if (!sockptr_is_kernel(dst))
-		return copy_to_user(dst.user + offset, src, size);
-	memcpy(dst.kernel + offset, src, size);
-	return 0;
-}
-
-static inline int copy_to_sockptr(sockptr_t dst, const void *src, size_t size)
-{
-	return copy_to_sockptr_offset(dst, 0, src, size);
-}
-
-static inline void *memdup_sockptr(sockptr_t src, size_t len)
-{
-	void *p = kmalloc_track_caller(len, GFP_USER | __GFP_NOWARN);
-
-	if (!p)
-		return ERR_PTR(-ENOMEM);
-	if (copy_from_sockptr(p, src, len)) {
-		kfree(p);
-		return ERR_PTR(-EFAULT);
-	}
-	return p;
-}
-
-static inline void *memdup_sockptr_nul(sockptr_t src, size_t len)
-{
-	char *p = kmalloc_track_caller(len + 1, GFP_KERNEL);
-
-	if (!p)
-		return ERR_PTR(-ENOMEM);
-	if (copy_from_sockptr(p, src, len)) {
-		kfree(p);
-		return ERR_PTR(-EFAULT);
-	}
-	p[len] = '\0';
-	return p;
-}
-
-static inline long strncpy_from_sockptr(char *dst, sockptr_t src, size_t count)
-{
-	if (sockptr_is_kernel(src)) {
-		size_t len = min(strnlen(src.kernel, count - 1) + 1, count);
-
-		memcpy(dst, src.kernel, len);
-		return len;
-	}
-	return strncpy_from_user(dst, src.user, count);
-}
-
-static inline int check_zeroed_sockptr(sockptr_t src, size_t offset,
-				       size_t size)
-{
-	if (!sockptr_is_kernel(src))
-		return check_zeroed_user(src.user + offset, size);
-	return memchr_inv(src.kernel + offset, 0, size) == NULL;
-}
+#define sockptr_t		uniptr_t
+#define sockptr_is_kernel	uniptr_is_kernel
+#define KERNEL_SOCKPTR		KERNEL_UNIPTR
+#define USER_SOCKPTR		USER_UNIPTR
+#define sockptr_is_null		uniptr_is_null
+#define copy_from_sockptr_offset copy_from_uniptr_offset
+#define copy_from_sockptr	copy_from_uniptr
+#define copy_to_sockptr_offset	copy_to_uniptr_offset
+#define copy_to_sockptr		copy_to_uniptr
+#define memdup_sockptr		memdup_uniptr
+#define memdup_sockptr_nul	memdup_uniptr_nul
+#define strncpy_from_sockptr	strncpy_from_uniptr
+#define check_zeroed_sockptr	check_zeroed_uniptr
 
 #endif /* _LINUX_SOCKPTR_H */
diff --git a/include/linux/uniptr.h b/include/linux/uniptr.h
new file mode 100644
index 000000000000..3ca9fc8eab4e
--- /dev/null
+++ b/include/linux/uniptr.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 Christoph Hellwig.
+ *
+ * Support for "universal" pointers that can point to either kernel or userspace
+ * memory.
+ */
+#ifndef _LINUX_UNIPTR_H
+#define _LINUX_UNIPTR_H
+
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+typedef struct {
+	union {
+		void		*kernel;
+		void __user	*user;
+	};
+	bool		is_kernel : 1;
+} uniptr_t;
+
+static inline bool uniptr_is_kernel(uniptr_t uniptr)
+{
+	return uniptr.is_kernel;
+}
+
+static inline uniptr_t KERNEL_UNIPTR(void *p)
+{
+	return (uniptr_t) { .kernel = p, .is_kernel = true };
+}
+
+static inline uniptr_t USER_UNIPTR(void __user *p)
+{
+	return (uniptr_t) { .user = p };
+}
+
+static inline bool uniptr_is_null(uniptr_t uniptr)
+{
+	if (uniptr_is_kernel(uniptr))
+		return !uniptr.kernel;
+	return !uniptr.user;
+}
+
+static inline int copy_from_uniptr_offset(void *dst, uniptr_t src,
+					  size_t offset, size_t size)
+{
+	if (!uniptr_is_kernel(src))
+		return copy_from_user(dst, src.user + offset, size);
+	memcpy(dst, src.kernel + offset, size);
+	return 0;
+}
+
+static inline int copy_from_uniptr(void *dst, uniptr_t src, size_t size)
+{
+	return copy_from_uniptr_offset(dst, src, 0, size);
+}
+
+static inline int copy_to_uniptr_offset(uniptr_t dst, size_t offset,
+					const void *src, size_t size)
+{
+	if (!uniptr_is_kernel(dst))
+		return copy_to_user(dst.user + offset, src, size);
+	memcpy(dst.kernel + offset, src, size);
+	return 0;
+}
+
+static inline int copy_to_uniptr(uniptr_t dst, const void *src, size_t size)
+{
+	return copy_to_uniptr_offset(dst, 0, src, size);
+}
+
+static inline void *memdup_uniptr(uniptr_t src, size_t len)
+{
+	void *p = kmalloc_track_caller(len, GFP_USER | __GFP_NOWARN);
+
+	if (!p)
+		return ERR_PTR(-ENOMEM);
+	if (copy_from_uniptr(p, src, len)) {
+		kfree(p);
+		return ERR_PTR(-EFAULT);
+	}
+	return p;
+}
+
+static inline void *memdup_uniptr_nul(uniptr_t src, size_t len)
+{
+	char *p = kmalloc_track_caller(len + 1, GFP_KERNEL);
+
+	if (!p)
+		return ERR_PTR(-ENOMEM);
+	if (copy_from_uniptr(p, src, len)) {
+		kfree(p);
+		return ERR_PTR(-EFAULT);
+	}
+	p[len] = '\0';
+	return p;
+}
+
+static inline long strncpy_from_uniptr(char *dst, uniptr_t src, size_t count)
+{
+	if (uniptr_is_kernel(src)) {
+		size_t len = min(strnlen(src.kernel, count - 1) + 1, count);
+
+		memcpy(dst, src.kernel, len);
+		return len;
+	}
+	return strncpy_from_user(dst, src.user, count);
+}
+
+static inline int check_zeroed_uniptr(uniptr_t src, size_t offset, size_t size)
+{
+	if (!uniptr_is_kernel(src))
+		return check_zeroed_user(src.user + offset, size);
+	return memchr_inv(src.kernel + offset, 0, size) == NULL;
+}
+
+#endif /* _LINUX_UNIPTR_H */
-- 
2.35.3


