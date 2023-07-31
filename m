Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6749E769B52
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C097847;
	Mon, 31 Jul 2023 17:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C097847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818759;
	bh=Z8Rq3Ls9Ad2exk/+8Q2mwFv6eWDvV7OkgT2WRmwzDJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iYyYn4Drc0hDM+JddIH4fHNLzH6YZEaxe1UxQbdV14u5Far+m8saACIpYJiyGfII8
	 u/vdKbMTeonJ2LmR3/o0S+5yjvgKC1leJUujjKuCjIUqA5gfXXbFKpcJvU2vcuVj1R
	 N+zGmC034KlTg4L7x86YFTIfWrcg68kpfmo4waFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C05BFF80163; Mon, 31 Jul 2023 17:48:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AD4F80153;
	Mon, 31 Jul 2023 17:48:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60327F80609; Mon, 31 Jul 2023 17:48:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 985DFF80425
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 985DFF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=M6DbWL7L;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wCzomZcG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 01C9D221C8;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVVGhyhsigm22Di+pWMOrt7D7tzqxersZrKbBjPmmMQ=;
	b=M6DbWL7LwWGxZcMXQzO8NnjIlB6TFFFYl/WdtBQe85ifO5SmbFA79wzI2BiHJuhyFzsBiH
	DFXhTmVTOd7R2j5gDatHX6l7u3dOMahlutK/jsvrt6OHwctfKkJ+kkMYv6357JBZfEIsid
	eGhUfvRWbbK/RH6KkFM+77iqE2wTfhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GVVGhyhsigm22Di+pWMOrt7D7tzqxersZrKbBjPmmMQ=;
	b=wCzomZcGleE0dhQN7VT/GGDerqYp7B/bK9kSBV8hwy1XPVIzciG4B/aPOuT7CR8rUqEi56
	RD0PGEt0/pxqRyDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6D781322C;
	Mon, 31 Jul 2023 15:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GJ6nM4vXx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 02/24] ALSA: core: Add memory copy helpers between sockptr and
 iomem
Date: Mon, 31 Jul 2023 17:46:56 +0200
Message-Id: <20230731154718.31048-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TY4E3Y46MUZVZXUKQTNEVNK4GZAC6ADO
X-Message-ID-Hash: TY4E3Y46MUZVZXUKQTNEVNK4GZAC6ADO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TY4E3Y46MUZVZXUKQTNEVNK4GZAC6ADO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add two more helpers for copying memory between sockptr and iomem,
which will be used by the new PCM copy ops in a few drivers.
It's just bridging to the existing helpers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h |  4 ++++
 sound/core/memory.c | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 04b935200d0e..9b7054f0cea0 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1559,6 +1559,10 @@ static inline u64 pcm_format_to_bits(snd_pcm_format_t pcm_format)
 #define pcm_dbg(pcm, fmt, args...) \
 	dev_dbg((pcm)->card->dev, fmt, ##args)
 
+/* helpers for copying between sockptr and iomem */
+int copy_to_sockptr_fromio(sockptr_t dst, const void __iomem *src, size_t count);
+int copy_from_sockptr_toio(void __iomem *dst, sockptr_t src, size_t count);
+
 struct snd_pcm_status64 {
 	snd_pcm_state_t state;		/* stream state */
 	u8 rsvd[4];
diff --git a/sound/core/memory.c b/sound/core/memory.c
index 5d894dc32f7d..ff4a9e0064a2 100644
--- a/sound/core/memory.c
+++ b/sound/core/memory.c
@@ -9,6 +9,7 @@
 #include <linux/io.h>
 #include <linux/uaccess.h>
 #include <sound/core.h>
+#include <sound/pcm.h>
 
 /**
  * copy_to_user_fromio - copy data from mmio-space to user-space
@@ -73,3 +74,41 @@ int copy_from_user_toio(volatile void __iomem *dst, const void __user *src, size
 #endif
 }
 EXPORT_SYMBOL(copy_from_user_toio);
+
+/**
+ * copy_to_sockptr_fromio - copy data from mmio-space to sockptr
+ * @dst: the destination pointer
+ * @src: the source pointer on mmio
+ * @count: the data size to copy in bytes
+ *
+ * Copies the data from mmio-space to the generic pointer address
+ *
+ * Return: Zero if successful, or -EFAULT on failure
+ */
+int copy_to_sockptr_fromio(sockptr_t dst, const void __iomem *src, size_t count)
+{
+	if (!sockptr_is_kernel(dst))
+		return copy_to_user_fromio(dst.user, src, count);
+	memcpy_fromio(dst.kernel, src, count);
+	return 0;
+}
+EXPORT_SYMBOL(copy_to_sockptr_fromio);
+
+/**
+ * copy_from_sockptr_toio - copy data from sockptr to mmio-space
+ * @dst: the destination pointer on mmio-space
+ * @src: the source pointer
+ * @count: the data size to copy in bytes
+ *
+ * Copies the data from the generic pointer address to mmio-space.
+ *
+ * Return: Zero if successful, or -EFAULT on failure
+ */
+int copy_from_sockptr_toio(void __iomem *dst, sockptr_t src, size_t count)
+{
+	if (!sockptr_is_kernel(src))
+		return copy_from_user_toio(dst, src.user, count);
+	memcpy_toio(dst, src.kernel, count);
+	return 0;
+}
+EXPORT_SYMBOL(copy_from_sockptr_toio);
-- 
2.35.3

