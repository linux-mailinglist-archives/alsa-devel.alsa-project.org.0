Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAF709394
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830B66C0;
	Fri, 19 May 2023 11:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830B66C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684489064;
	bh=VT9aJ8QR9SXycXsCnSYYb57PjuYpWA/FvRPaMcEeLDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jJT7CljVqYXrhicE44Iu4exPKJZwEM+aKDTf4hGdgyHZK6GrFRVoVBbeD7G7gql+o
	 fqT2t6dOihWOOQik6rEeaemAwgoQzHaf0zxfTNgy0+jRPBN27+mYJdzcghNRv86nmV
	 5VgXl6nUWBVQ8C0niGV0HdNmpgixXzVcFdJa8mUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25828F805B1; Fri, 19 May 2023 11:32:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BA73F805C1;
	Fri, 19 May 2023 11:32:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 145D6F8060C; Fri, 19 May 2023 11:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F2F4F8055A
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F2F4F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wVRD7iSa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZF+ghNd+
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 489561FE49;
	Fri, 19 May 2023 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684488700;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jFwvQhPbaTE9XDubVl2nxiKqr9SWq2+eRDsG198Imk=;
	b=wVRD7iSaEAGMIsem0FvTs+skpMfBorqD+6Dj7LuL4mo50B0hq1HEZLoXpS+m4DlcdS8fyk
	UDXmIiO+80HVJDiA0+8dO1FRHo0xLsOdJszd5WOCyl0zDXyUXgPJnh0Ssbl+hyg16AwlLW
	emq2ohuID6r+vadRtDITcrynRMW9yrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684488700;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7jFwvQhPbaTE9XDubVl2nxiKqr9SWq2+eRDsG198Imk=;
	b=ZF+ghNd+/0Nl37TJVFjtLOga+jxT8+MYTPfl4IQ5ozptbtFupQvwIOtQfh2vQRVuuLjwHE
	1/TsnCk8Ib6rBvAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2214713A12;
	Fri, 19 May 2023 09:31:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UBBcB/xBZ2RXJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 19 May 2023 09:31:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 17/36] ALSA: seq: Add snd_seq_expand_var_event_at() helper
Date: Fri, 19 May 2023 11:30:55 +0200
Message-Id: <20230519093114.28813-18-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230519093114.28813-1-tiwai@suse.de>
References: <20230519093114.28813-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CD4QCZRPZFGWSPYWUP4IO64Q2F6HNKYW
X-Message-ID-Hash: CD4QCZRPZFGWSPYWUP4IO64Q2F6HNKYW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CD4QCZRPZFGWSPYWUP4IO64Q2F6HNKYW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Create a new variant of snd_seq_expand_var_event() for expanding the
data starting from the given byte offset.  It'll be used by the new
UMP sequencer code later.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/seq_kernel.h  |  2 +
 sound/core/seq/seq_memory.c | 86 +++++++++++++++++++++++++++++--------
 2 files changed, 69 insertions(+), 19 deletions(-)

diff --git a/include/sound/seq_kernel.h b/include/sound/seq_kernel.h
index 658911926f3a..527e7f8ad661 100644
--- a/include/sound/seq_kernel.h
+++ b/include/sound/seq_kernel.h
@@ -70,6 +70,8 @@ int snd_seq_kernel_client_ctl(int client, unsigned int cmd, void *arg);
 typedef int (*snd_seq_dump_func_t)(void *ptr, void *buf, int count);
 int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char *buf,
 			     int in_kernel, int size_aligned);
+int snd_seq_expand_var_event_at(const struct snd_seq_event *event, int count,
+				char *buf, int offset);
 int snd_seq_dump_var_event(const struct snd_seq_event *event,
 			   snd_seq_dump_func_t func, void *private_data);
 
diff --git a/sound/core/seq/seq_memory.c b/sound/core/seq/seq_memory.c
index c8d26bce69ff..a8d2db439f86 100644
--- a/sound/core/seq/seq_memory.c
+++ b/sound/core/seq/seq_memory.c
@@ -63,8 +63,9 @@ static int get_var_len(const struct snd_seq_event *event)
 	return event->data.ext.len & ~SNDRV_SEQ_EXT_MASK;
 }
 
-int snd_seq_dump_var_event(const struct snd_seq_event *event,
-			   snd_seq_dump_func_t func, void *private_data)
+static int dump_var_event(const struct snd_seq_event *event,
+			  snd_seq_dump_func_t func, void *private_data,
+			  int offset, int maxlen)
 {
 	int len, err;
 	struct snd_seq_event_cell *cell;
@@ -72,10 +73,16 @@ int snd_seq_dump_var_event(const struct snd_seq_event *event,
 	len = get_var_len(event);
 	if (len <= 0)
 		return len;
+	if (len <= offset)
+		return 0;
+	if (maxlen && len > offset + maxlen)
+		len = offset + maxlen;
 
 	if (event->data.ext.len & SNDRV_SEQ_EXT_USRPTR) {
 		char buf[32];
 		char __user *curptr = (char __force __user *)event->data.ext.ptr;
+		curptr += offset;
+		len -= offset;
 		while (len > 0) {
 			int size = sizeof(buf);
 			if (len < size)
@@ -91,20 +98,35 @@ int snd_seq_dump_var_event(const struct snd_seq_event *event,
 		return 0;
 	}
 	if (!(event->data.ext.len & SNDRV_SEQ_EXT_CHAINED))
-		return func(private_data, event->data.ext.ptr, len);
+		return func(private_data, event->data.ext.ptr + offset,
+			    len - offset);
 
 	cell = (struct snd_seq_event_cell *)event->data.ext.ptr;
 	for (; len > 0 && cell; cell = cell->next) {
 		int size = sizeof(struct snd_seq_event);
+		char *curptr = (char *)&cell->event;
+
+		if (offset >= size) {
+			offset -= size;
+			len -= size;
+			continue;
+		}
 		if (len < size)
 			size = len;
-		err = func(private_data, &cell->event, size);
+		err = func(private_data, curptr + offset, size - offset);
 		if (err < 0)
 			return err;
+		offset = 0;
 		len -= size;
 	}
 	return 0;
 }
+
+int snd_seq_dump_var_event(const struct snd_seq_event *event,
+			   snd_seq_dump_func_t func, void *private_data)
+{
+	return dump_var_event(event, func, private_data, 0, 0);
+}
 EXPORT_SYMBOL(snd_seq_dump_var_event);
 
 
@@ -132,11 +154,27 @@ static int seq_copy_in_user(void *ptr, void *src, int size)
 	return 0;
 }
 
+static int expand_var_event(const struct snd_seq_event *event,
+			    int offset, int size, char *buf, bool in_kernel)
+{
+	if (event->data.ext.len & SNDRV_SEQ_EXT_USRPTR) {
+		if (! in_kernel)
+			return -EINVAL;
+		if (copy_from_user(buf,
+				   (char __force __user *)event->data.ext.ptr + offset,
+				   size))
+			return -EFAULT;
+		return 0;
+	}
+	return dump_var_event(event,
+			     in_kernel ? seq_copy_in_kernel : seq_copy_in_user,
+			     &buf, offset, size);
+}
+
 int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char *buf,
 			     int in_kernel, int size_aligned)
 {
-	int len, newlen;
-	int err;
+	int len, newlen, err;
 
 	len = get_var_len(event);
 	if (len < 0)
@@ -146,25 +184,35 @@ int snd_seq_expand_var_event(const struct snd_seq_event *event, int count, char
 		newlen = roundup(len, size_aligned);
 	if (count < newlen)
 		return -EAGAIN;
-
-	if (event->data.ext.len & SNDRV_SEQ_EXT_USRPTR) {
-		if (! in_kernel)
-			return -EINVAL;
-		if (copy_from_user(buf, (void __force __user *)event->data.ext.ptr, len))
-			return -EFAULT;
-	} else {
-		err = snd_seq_dump_var_event(event,
-					     in_kernel ? seq_copy_in_kernel : seq_copy_in_user,
-					     &buf);
-		if (err < 0)
-			return err;
-	}
+	err = expand_var_event(event, 0, len, buf, in_kernel);
+	if (err < 0)
+		return err;
 	if (len != newlen)
 		memset(buf + len, 0, newlen - len);
 	return newlen;
 }
 EXPORT_SYMBOL(snd_seq_expand_var_event);
 
+int snd_seq_expand_var_event_at(const struct snd_seq_event *event, int count,
+				char *buf, int offset)
+{
+	int len, err;
+
+	len = get_var_len(event);
+	if (len < 0)
+		return len;
+	if (len <= offset)
+		return 0;
+	len -= offset;
+	if (len > count)
+		len = count;
+	err = expand_var_event(event, offset, count, buf, true);
+	if (err < 0)
+		return err;
+	return len;
+}
+EXPORT_SYMBOL_GPL(snd_seq_expand_var_event_at);
+
 /*
  * release this cell, free extended data if available
  */
-- 
2.35.3

