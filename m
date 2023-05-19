Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC9709365
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F393850;
	Fri, 19 May 2023 11:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F393850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489016;
	bh=Ofz0it+STKe5D8nVBmCtOaABmkYZ+geGDS3qoiQAhKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OJpfeR5NwuOwJ8RDXZ0mMfarwWfF+ssY3e1JVgu9L4YrBgVJkcqfsppQMPk6sZihR
	 gqm0EXTDG+sKfeuPe6vaDjm+dN9F9ws1TGN+SKIo4i7HE6TYeOJxUE4iCLHr70sFuE
	 B2GRGjQH9I75n/JRjsuE0ThmTj/UFqlEIpX7tk38=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D809AF8063D; Fri, 19 May 2023 11:32:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98F83F805AC;
	Fri, 19 May 2023 11:32:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFBF0F80605; Fri, 19 May 2023 11:32:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4330EF80564
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4330EF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=q9TNsrmW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=z0SPz73a
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF6211FE4B;
	Fri, 19 May 2023 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtUBn64TCPUL2NIYTOf1vmSRVo+5qn88GJVMSzzNLZI=;
	b=q9TNsrmWsdCHjDwkrpA+p5dUpGzXPbOBWcWsz/Rqg+vVOV0B1qVcn1KoggxC1duFFYKMDC
	Sze+35i89kP1Xi6R5ND6fk90BLdHaiRRYkvOHC6qvx616EgNIASPfYvi++DeDUmfgdKrJ3
	bmtWP0Mv19mJdIhRFHTd/5ZE1ifonSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xtUBn64TCPUL2NIYTOf1vmSRVo+5qn88GJVMSzzNLZI=;
	b=z0SPz73a2RxbdU1dzaMht1HPJB3CSz13K6b72hJWOtsaSpqMaKGq7AhiGUypI4rbbkevt7
	OWd3KTDNz/nSDtDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AE34F13A12;
	Fri, 19 May 2023 09:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UI9gKfxBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 18/36] ALSA: seq: Treat snd_seq_client object directly in
 client drivers
Date: Fri, 19 May 2023 11:30:56 +0200
Message-Id: <20230519093114.28813-19-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6CZOXC7Z7H2O5M4YDBD3FGZLMCYFQIO2
X-Message-ID-Hash: 6CZOXC7Z7H2O5M4YDBD3FGZLMCYFQIO2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6CZOXC7Z7H2O5M4YDBD3FGZLMCYFQIO2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce the new helpers, snd_seq_kernel_client_get() and _put() for
kernel client drivers to treat the snd_seq_client more directly.
This allows us to reduce the exported symbols and APIs at each time we
need to access some field in future.

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

