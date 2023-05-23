Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173070D69A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD31AE7F;
	Tue, 23 May 2023 10:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD31AE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684829080;
	bh=V0sTbQ+jSq37f7KzbXAB+1HEEJMn6bDuwzQ038JWlgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NFMEO92faRRG6LzIc53OUXQcq+1DfFP185R8azJ3tpstbc4bPcr5zfL6DNep+9Ra/
	 mqoFuF8nRZehT0bF+zEdTfyc3gRT/0YmJvfGwtWemBZLFhXH35tBzY/hKfbxxRSA9m
	 yq5KDEQClqieZqKdpNk+Y7P+JV2Wb82J7b0iSL88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6768FF806F7; Tue, 23 May 2023 09:56:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D2DF806F7;
	Tue, 23 May 2023 09:56:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22E8CF805AC; Tue, 23 May 2023 09:56:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A49A5F80564
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A49A5F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HkjeYC0Q;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XpHHji8S
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7CD8720410;
	Tue, 23 May 2023 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4DZ5woY6gmacraFwH4PrBR7nOGakjNJMIBScTlvDFE=;
	b=HkjeYC0QuYOlGB79i3zWQ/9nWZoV0V00HmPoZjX8OD3mqJf/3zUTw9Eb//H552FIYpcm9x
	R9FfayH9I+Xn4sSfIE6He1cX/yhBeKa/6S8syoOB8VSzThoY1S86tUrGg7Yfora7TmCj6O
	K08n5j33ogHA3gs0vajGR/5etm9bJEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4DZ5woY6gmacraFwH4PrBR7nOGakjNJMIBScTlvDFE=;
	b=XpHHji8S3+L9y7x/IwkdgDVaipr1QtJ8kmLMfx6sxcg2inXZ1uZQA0V1yFFRsC+ChRksAm
	v6YIzmrwfWxOM0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4291D13A1A;
	Tue, 23 May 2023 07:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wN89DiBxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:08 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/37] ALSA: seq: Treat snd_seq_client object directly in
 client drivers
Date: Tue, 23 May 2023 09:53:40 +0200
Message-Id: <20230523075358.9672-20-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DN5ENKMBCT6AE63MHBDE37VSNIXK2ZF3
X-Message-ID-Hash: DN5ENKMBCT6AE63MHBDE37VSNIXK2ZF3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DN5ENKMBCT6AE63MHBDE37VSNIXK2ZF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce the new helpers, snd_seq_kernel_client_get() and _put() for
kernel client drivers to treat the snd_seq_client more directly.
This allows us to reduce the exported symbols and APIs at each time we
need to access some field in future.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 15 +++++++++++++++
 sound/core/seq/seq_clientmgr.h |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 2d707afa1ef1..98e8032a32e2 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2390,6 +2390,21 @@ int snd_seq_kernel_client_write_poll(int clientid, struct file *file, poll_table
 }
 EXPORT_SYMBOL(snd_seq_kernel_client_write_poll);
 
+/* get a sequencer client object; for internal use from a kernel client */
+struct snd_seq_client *snd_seq_kernel_client_get(int id)
+{
+	return snd_seq_client_use_ptr(id);
+}
+EXPORT_SYMBOL_GPL(snd_seq_kernel_client_get);
+
+/* put a sequencer client object; for internal use from a kernel client */
+void snd_seq_kernel_client_put(struct snd_seq_client *cptr)
+{
+	if (cptr)
+		snd_seq_client_unlock(cptr);
+}
+EXPORT_SYMBOL_GPL(snd_seq_kernel_client_put);
+
 /*---------------------------------------------------------------------------*/
 
 #ifdef CONFIG_SND_PROC_FS
diff --git a/sound/core/seq/seq_clientmgr.h b/sound/core/seq/seq_clientmgr.h
index 8cdd0ee53fb1..f05704e45ab4 100644
--- a/sound/core/seq/seq_clientmgr.h
+++ b/sound/core/seq/seq_clientmgr.h
@@ -88,4 +88,8 @@ void snd_seq_client_ioctl_unlock(int clientid);
 
 extern int seq_client_load[15];
 
+/* for internal use between kernel sequencer clients */
+struct snd_seq_client *snd_seq_kernel_client_get(int client);
+void snd_seq_kernel_client_put(struct snd_seq_client *cptr);
+
 #endif
-- 
2.35.3

