Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C27726AD
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 15:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563E1850;
	Mon,  7 Aug 2023 15:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563E1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691416449;
	bh=pCwotDHo8J//t0I9amkQXyyXOeD9Az44LtlBiSUQkko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nTixpYbR9Cw4vmjW5YPE8Z9xegnmHwI4/4F/2Tv8RY6XRT7TtyL31SpluB1bDeoY9
	 RtTjZqAWLTIlI0bhcwYXT/5Wihx9uZonsw1iiasTrriLUI66AM0E8s79l5C0fNpi5B
	 APZwka8MXXlcI0KIlg8QfY2jHM50eRhpi0dzAEzE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E6DF80580; Mon,  7 Aug 2023 15:52:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CC6CF80570;
	Mon,  7 Aug 2023 15:52:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C42D1F8051E; Mon,  7 Aug 2023 15:52:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 119E0F8016B
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 15:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 119E0F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yuA7e7/k;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9jh44YiJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8FF7B21A82;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691416331;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ihh3dfYzJeKo3w4F9JU7CpkqrYRVR8vLank7cmWooFo=;
	b=yuA7e7/k9BPVHT2FHp3a4zY24qZGWJgEdPQjl2Zne3BSQWEjk13nu0wc01deyIKk3KMSXc
	Fx8xN7bRqe8DZbKnq/2zpCPMBrIl4w0YpF6Opdok0WIllSwE1pbrs4Z5wC9tGlP3HNp3hp
	74Tdm+HSf/0qMkC+RorwtkItdF5zdDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691416331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ihh3dfYzJeKo3w4F9JU7CpkqrYRVR8vLank7cmWooFo=;
	b=9jh44YiJijSeWezq5UkvwPvFVj4+30TUsxEZ9Qu90Oi/qOH6QhZUI2Fg8v2dZNVsHGcybB
	aOkBrFEMVBAzc2Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7005D13A6F;
	Mon,  7 Aug 2023 13:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CFyGGgv30GS3JwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 07 Aug 2023 13:52:11 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [PATCH RFC 1/6] ALSA: core: Introduced referenced memory allocator
Date: Mon,  7 Aug 2023 15:52:01 +0200
Message-Id: <20230807135207.17708-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230807135207.17708-1-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GWI254DU7BMLBYNRCJSQPFRBJFDBF6NS
X-Message-ID-Hash: GWI254DU7BMLBYNRCJSQPFRBJFDBF6NS
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce simple helpers to allocate memory with a refcount.  The
refcount can be chained to the parent, so that it assures to keep the
parent memory until all children are released.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h |  5 ++++
 sound/core/init.c    | 58 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/include/sound/core.h b/include/sound/core.h
index f6e0dd648b80..6fccec08a12f 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -75,6 +75,11 @@ struct snd_device {
 
 #define snd_device(n) list_entry(n, struct snd_device, list)
 
+/* referenced memory allocation */
+void *snd_refmem_alloc(size_t bytes, void *parent);
+void *snd_refmem_get(void *p);
+void snd_refmem_put(void *p);
+
 /* main structure for soundcard */
 
 struct snd_card {
diff --git a/sound/core/init.c b/sound/core/init.c
index baef2688d0cf..7e7c4b8d4e11 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -111,6 +111,64 @@ static int get_slot_from_bitmask(int mask, int (*check)(struct module *, int),
 	return mask; /* unchanged */
 }
 
+/*
+ * referenced memory allocation
+ */
+
+struct snd_refmem {
+	struct kref kref;
+	void *parent;
+	char data[];
+};
+
+#define to_refmem(p)	container_of(p, struct snd_refmem, data)
+
+void *snd_refmem_alloc(size_t bytes, void *parent)
+{
+	struct snd_refmem *ref;
+
+	ref = kzalloc(bytes + sizeof(*ref), GFP_KERNEL);
+	if (!ref)
+		return NULL;
+	kref_init(&ref->kref);
+	ref->parent = parent;
+	snd_refmem_get(parent);
+	return ref->data;
+}
+EXPORT_SYMBOL_GPL(snd_refmem_alloc);
+
+void *snd_refmem_get(void *p)
+{
+	struct snd_refmem *ref;
+
+	if (!p)
+		return NULL;
+	ref = to_refmem(p);
+	kref_get(&ref->kref);
+	return p;
+}
+EXPORT_SYMBOL_GPL(snd_refmem_get);
+
+static void snd_refmem_release(struct kref *kref)
+{
+	struct snd_refmem *ref = container_of(kref, struct snd_refmem, kref);
+	void *parent = ref->parent;
+
+	kfree(ref);
+	snd_refmem_put(parent);
+}
+
+void snd_refmem_put(void *p)
+{
+	struct snd_refmem *ref;
+
+	if (!p)
+		return;
+	ref = to_refmem(p);
+	kref_put(&ref->kref, snd_refmem_release);
+}
+EXPORT_SYMBOL_GPL(snd_refmem_put);
+
 /* the default release callback set in snd_device_initialize() below;
  * this is just NOP for now, as almost all jobs are already done in
  * dev_free callback of snd_device chain instead.
-- 
2.35.3

