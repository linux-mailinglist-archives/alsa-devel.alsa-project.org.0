Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD3170937B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324007F8;
	Fri, 19 May 2023 11:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324007F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489043;
	bh=uFWyqsJVpMUYOwmLnOLOa3Yeoxxh3jo84sWCkILC/Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MgxxjpNHJbDUDXV5PslpT+7Im5fFHK22YdrFL2mYZrByb4hzqqriduJYiEPF3Nyft
	 bCgL3PzPF+2PUdxZFKKDcmW/BOhV7AWiwcTMi1lm5gRRFhLsUf9UPuLMBYzN73aYME
	 GcFiImFuOZixRqHVTtVa68lquIPe9vlygNYuzlmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38F9DF80642; Fri, 19 May 2023 11:32:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F067F805BD;
	Fri, 19 May 2023 11:32:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB6EEF8060B; Fri, 19 May 2023 11:32:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1247F8055C
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1247F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oxtSs/AL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cIMkAkUH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B53F31FE3F;
	Fri, 19 May 2023 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NcafucgcxTqZeZeiPExPE8Xrdw3TdNFdLqfYPg++GvE=;
	b=oxtSs/ALtpLVgWEWNJuz2y20qkf0gtOtYz7XyvX3qPIIpPP3AOfGyL1+s0PKmKZcTFKrKk
	yqGtk5N9sW2qKKpAZ+1KYTINr4sSY1oOiZwCLVcKTVl+aD3baa9ORRGT47ItXTgk022Pyl
	+WI3vjzfgYprHuGdpcu50HpnvOaycUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488699;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NcafucgcxTqZeZeiPExPE8Xrdw3TdNFdLqfYPg++GvE=;
	b=cIMkAkUHAE0x/CPu6ovTjm4Z2Q9mv6qQEw/bLMwiPzgnuuU+hck8W+P74ITEqoo2UjxaO7
	PkM6owc0jQY6VUBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 956B213A12;
	Fri, 19 May 2023 09:31:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ELyhI/tBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 16/36] ALSA: seq: Clear padded bytes at expanding events
Date: Fri, 19 May 2023 11:30:54 +0200
Message-Id: <20230519093114.28813-17-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2NTQ4O2HNJJHU437AVK4YNVSFUFWVLB6
X-Message-ID-Hash: 2NTQ4O2HNJJHU437AVK4YNVSFUFWVLB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NTQ4O2HNJJHU437AVK4YNVSFUFWVLB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There can be a small memory hole that may not be cleared at expanding
an event with the variable length type.  Make sure to clear it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_memory.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index 47ef6bc30c0e..c8d26bce69ff 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -152,12 +152,16 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
 			return -EINVAL;
 		if (copy_from_user(buf, (void __force __user *)event->data.ext.ptr, len))
 			return -EFAULT;
-		return newlen;
+	} else {
+		err = snd_seq_dump_var_event(event,
+					     in_kernel ? seq_copy_in_kernel : seq_copy_in_user,
+					     &buf);
+		if (err < 0)
+			return err;
 	}
-	err = snd_seq_dump_var_event(event,
-				     in_kernel ? seq_copy_in_kernel : seq_copy_in_user,
-				     &buf);
-	return err < 0 ? err : newlen;
+	if (len != newlen)
+		memset(buf + len, 0, newlen - len);
+	return newlen;
 }
 EXPORT_SYMBOL(snd_seq_expand_var_event);
 
-- 
2.35.3

