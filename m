Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9E3769B56
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0FD084D;
	Mon, 31 Jul 2023 17:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0FD084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818778;
	bh=VvHOBTkJO8p+2F8/LYGnNrobtkWQRLeqdvJvIUsi4xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vpTeBQh3oFDgQFelNWmmZCWcdiHTMfuJKA253edXu2l3LQ754GJwTCq7AyumLba3u
	 sMJaqqEsDFIVYN5VkR0lSoLWwsNPH8z3nKhyelspFjibEXnjyJo3icanzM3tK1Rr/H
	 Zm4SUTDP/8fCxRnAo8pmAEtHRHq0sAstkz9cA1sE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B471F8061C; Mon, 31 Jul 2023 17:48:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C7FEF8055C;
	Mon, 31 Jul 2023 17:48:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 245BDF80612; Mon, 31 Jul 2023 17:48:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 854BCF80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 854BCF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Uu80SKvF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a3cxvrFp
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 62702221CF;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=huTJf2uf0zf87I+FdS82mnMeiH9LrVaaUyhEm9M0+GA=;
	b=Uu80SKvFy4bMvnCbuZyR4L0z50IkwFtfgMDQd+yNN60udXdITOWH6JG4qZKpUqMW4i7qYC
	RUBVn4aWudjuR8I9Rtf/3KmJ3teyJrbBIcm20WvJPDKg+CyoPJ9i1Vf3KVh83Vi0ip73pd
	emMXng4UvhIF8HyWxl+p/BWXe+cOVts=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=huTJf2uf0zf87I+FdS82mnMeiH9LrVaaUyhEm9M0+GA=;
	b=a3cxvrFp6+owD516/yeE7GcmjBWnrVKdG6WP5oir7p0AvUh7NKx/NBA+/EzI++gb3GMiHh
	DG0JhslXDoWi2mAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 464C2138EE;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iI1cEIzXx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 05/24] ALSA: emu8000: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:46:59 +0200
Message-Id: <20230731154718.31048-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T2DUOLVPNR32FOELCFLPHQWF6BINJ7J7
X-Message-ID-Hash: T2DUOLVPNR32FOELCFLPHQWF6BINJ7J7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2DUOLVPNR32FOELCFLPHQWF6BINJ7J7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the SB Emu8000 driver code to use the new unified
PCM copy callback.  The conversion is a bit complicated because of
many open code in emu8000_pcm.c.  GET_VAL() and LOOP_WRITE() macros
were rewritten / simplified with copy_from_sockptr_offset().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000_pcm.c | 79 ++++++++++----------------------------
 1 file changed, 21 insertions(+), 58 deletions(-)

diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index c8afc4347c54..31a5e5fa278d 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -409,40 +409,28 @@ do { \
 		return -EAGAIN;\
 } while (0)
 
-enum {
-	COPY_USER, COPY_KERNEL, FILL_SILENCE,
-};
-
-#define GET_VAL(sval, buf, mode)					\
+#define GET_VAL(sval, buf, offset)					\
 	do {								\
-		switch (mode) {						\
-		case FILL_SILENCE:					\
+		if (sockptr_is_null(buf))				\
 			sval = 0;					\
-			break;						\
-		case COPY_KERNEL:					\
-			sval = *buf++;					\
-			break;						\
-		default:						\
-			if (get_user(sval, (unsigned short __user *)buf)) \
-				return -EFAULT;				\
-			buf++;						\
-			break;						\
-		}							\
+		else if (copy_from_sockptr_offset(&sval, buf, offset, 2)) \
+			return -EFAULT;					\
 	} while (0)
 
 #ifdef USE_NONINTERLEAVE
 
-#define LOOP_WRITE(rec, offset, _buf, count, mode)		\
+#define LOOP_WRITE(rec, offset, buf, count)			\
 	do {							\
 		struct snd_emu8000 *emu = (rec)->emu;		\
-		unsigned short *buf = (__force unsigned short *)(_buf); \
+		unsigned int offset = 0;			\
 		snd_emu8000_write_wait(emu, 1);			\
 		EMU8000_SMALW_WRITE(emu, offset);		\
 		while (count > 0) {				\
 			unsigned short sval;			\
 			CHECK_SCHEDULER();			\
-			GET_VAL(sval, buf, mode);		\
+			GET_VAL(sval, buf, offset);		\
 			EMU8000_SMLD_WRITE(emu, sval);		\
+			offset += 2;				\
 			count--;				\
 		}						\
 	} while (0)
@@ -450,27 +438,14 @@ enum {
 /* copy one channel block */
 static int emu8k_pcm_copy(struct snd_pcm_substream *subs,
 			  int voice, unsigned long pos,
-			  void __user *src, unsigned long count)
+			  sockptr_t src, unsigned long count)
 {
 	struct snd_emu8k_pcm *rec = subs->runtime->private_data;
 
 	/* convert to word unit */
 	pos = (pos << 1) + rec->loop_start[voice];
 	count <<= 1;
-	LOOP_WRITE(rec, pos, src, count, COPY_USER);
-	return 0;
-}
-
-static int emu8k_pcm_copy_kernel(struct snd_pcm_substream *subs,
-				 int voice, unsigned long pos,
-				 void *src, unsigned long count)
-{
-	struct snd_emu8k_pcm *rec = subs->runtime->private_data;
-
-	/* convert to word unit */
-	pos = (pos << 1) + rec->loop_start[voice];
-	count <<= 1;
-	LOOP_WRITE(rec, pos, src, count, COPY_KERNEL);
+	LOOP_WRITE(rec, pos, src, count);
 	return 0;
 }
 
@@ -483,16 +458,16 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 	/* convert to word unit */
 	pos = (pos << 1) + rec->loop_start[voice];
 	count <<= 1;
-	LOOP_WRITE(rec, pos, NULL, count, FILL_SILENCE);
+	LOOP_WRITE(rec, pos, USER_SOCKPTR(NULL), count);
 	return 0;
 }
 
 #else /* interleave */
 
-#define LOOP_WRITE(rec, pos, _buf, count, mode)				\
+#define LOOP_WRITE(rec, pos, buf, count)				\
 	do {								\
 		struct snd_emu8000 *emu = rec->emu;			\
-		unsigned short *buf = (__force unsigned short *)(_buf);	\
+		unsigned int offset = 0;				\
 		snd_emu8000_write_wait(emu, 1);				\
 		EMU8000_SMALW_WRITE(emu, pos + rec->loop_start[0]);	\
 		if (rec->voices > 1)					\
@@ -500,12 +475,14 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 		while (count > 0) {					\
 			unsigned short sval;				\
 			CHECK_SCHEDULER();				\
-			GET_VAL(sval, buf, mode);			\
+			GET_VAL(sval, buf, offset);			\
 			EMU8000_SMLD_WRITE(emu, sval);			\
+			offset += 2;					\
 			if (rec->voices > 1) {				\
 				CHECK_SCHEDULER();			\
-				GET_VAL(sval, buf, mode);		\
+				GET_VAL(sval, buf, offset);		\
 				EMU8000_SMRD_WRITE(emu, sval);		\
+				offset += 2;				\
 			}						\
 			count--;					\
 		}							\
@@ -518,27 +495,14 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
  */
 static int emu8k_pcm_copy(struct snd_pcm_substream *subs,
 			  int voice, unsigned long pos,
-			  void __user *src, unsigned long count)
+			  sockptr_t src, unsigned long count)
 {
 	struct snd_emu8k_pcm *rec = subs->runtime->private_data;
 
 	/* convert to frames */
 	pos = bytes_to_frames(subs->runtime, pos);
 	count = bytes_to_frames(subs->runtime, count);
-	LOOP_WRITE(rec, pos, src, count, COPY_USER);
-	return 0;
-}
-
-static int emu8k_pcm_copy_kernel(struct snd_pcm_substream *subs,
-				 int voice, unsigned long pos,
-				 void *src, unsigned long count)
-{
-	struct snd_emu8k_pcm *rec = subs->runtime->private_data;
-
-	/* convert to frames */
-	pos = bytes_to_frames(subs->runtime, pos);
-	count = bytes_to_frames(subs->runtime, count);
-	LOOP_WRITE(rec, pos, src, count, COPY_KERNEL);
+	LOOP_WRITE(rec, pos, src, count);
 	return 0;
 }
 
@@ -550,7 +514,7 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 	/* convert to frames */
 	pos = bytes_to_frames(subs->runtime, pos);
 	count = bytes_to_frames(subs->runtime, count);
-	LOOP_WRITE(rec, pos, NULL, count, FILL_SILENCE);
+	LOOP_WRITE(rec, pos, USER_SOCKPTR(NULL), count);
 	return 0;
 }
 #endif
@@ -666,8 +630,7 @@ static const struct snd_pcm_ops emu8k_pcm_ops = {
 	.prepare =	emu8k_pcm_prepare,
 	.trigger =	emu8k_pcm_trigger,
 	.pointer =	emu8k_pcm_pointer,
-	.copy_user =	emu8k_pcm_copy,
-	.copy_kernel =	emu8k_pcm_copy_kernel,
+	.copy =		emu8k_pcm_copy,
 	.fill_silence =	emu8k_pcm_silence,
 };
 
-- 
2.35.3

