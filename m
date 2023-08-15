Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8977D2F6
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC913E72;
	Tue, 15 Aug 2023 21:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC913E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692126478;
	bh=ZUFhXIGFmuADaKYeEPvnngyEKXNpWGY8Udr/I3VoVFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ojrznfnGcUTNl9HrDdWHFYZXl0kqOth54/wyuS0Zc6xnoVVYWcIm3y0jj1YjLnkIX
	 5deQPzy97OEBlTYAbho5FO9V6AtrOjNprEGPvsdkpDG3R9XL9j8PU29PXhrzq1/W6N
	 nEfGcHuAWZ8+DYnqjEVKpq4MqWjSqbc2T5RQ1ma0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C914F8063C; Tue, 15 Aug 2023 21:03:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0F3F805A8;
	Tue, 15 Aug 2023 21:03:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4525F8061D; Tue, 15 Aug 2023 21:02:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 328B2F80290
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 328B2F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dWpc/5WW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JWMviMul
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D64E1F8CC;
	Tue, 15 Aug 2023 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692126108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UCVs2lrJV8zC/zCpUs0xKreUnK1an8pHd+lADqQDEu8=;
	b=dWpc/5WWLuNXxLGjXvAzH+6PaF/36QRVNCyebWMMP2mSbiNuAR3AA25ZLZHn1k20i4AT7P
	yytqCE4pJc12oVHaC/dKyiCokCEX7qiHBt49kNIp6RHVSy5rZ6YyBuOqR0gxaASuibiPSJ
	yXdl10kRkhEjZzmEDS6iOZagxEnrUSo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UCVs2lrJV8zC/zCpUs0xKreUnK1an8pHd+lADqQDEu8=;
	b=JWMviMul9KnRRD4eXpKDVm1dN9Obgd77w/S0ARyhavGWB9611pmDlqEtmNeUR40y9jjoZI
	oFDg5VZ+elu5PQCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F260A1353E;
	Tue, 15 Aug 2023 19:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IJo4OpvL22QTVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 06/25] ALSA: emu8000: Convert to generic PCM copy ops
Date: Tue, 15 Aug 2023 21:01:17 +0200
Message-Id: <20230815190136.8987-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TA5TDV7PXPHQAXI6DHI7EZLMW24EPHS7
X-Message-ID-Hash: TA5TDV7PXPHQAXI6DHI7EZLMW24EPHS7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TA5TDV7PXPHQAXI6DHI7EZLMW24EPHS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the SB Emu8000 driver code to use the new unified
PCM copy callback.  The conversion is a bit complicated because of
many open code in emu8000_pcm.c.  GET_VAL() and LOOP_WRITE() macros
were rewritten / simplified with copy_from_iter().  As
copy_from_iter() updates the internal offset value, we can drop the
corresponding part, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000_pcm.c | 74 +++++++++-----------------------------
 1 file changed, 16 insertions(+), 58 deletions(-)

diff --git a/sound/isa/sb/emu8000_pcm.c b/sound/isa/sb/emu8000_pcm.c
index c8afc4347c54..c05935c2edc4 100644
--- a/sound/isa/sb/emu8000_pcm.c
+++ b/sound/isa/sb/emu8000_pcm.c
@@ -409,39 +409,25 @@ do { \
 		return -EAGAIN;\
 } while (0)
 
-enum {
-	COPY_USER, COPY_KERNEL, FILL_SILENCE,
-};
-
-#define GET_VAL(sval, buf, mode)					\
+#define GET_VAL(sval, iter)						\
 	do {								\
-		switch (mode) {						\
-		case FILL_SILENCE:					\
+		if (!iter)						\
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
+		else if (copy_from_iter(&sval, 2, iter) != 2)		\
+			return -EFAULT;					\
 	} while (0)
 
 #ifdef USE_NONINTERLEAVE
 
-#define LOOP_WRITE(rec, offset, _buf, count, mode)		\
+#define LOOP_WRITE(rec, offset, iter, count)			\
 	do {							\
 		struct snd_emu8000 *emu = (rec)->emu;		\
-		unsigned short *buf = (__force unsigned short *)(_buf); \
 		snd_emu8000_write_wait(emu, 1);			\
 		EMU8000_SMALW_WRITE(emu, offset);		\
 		while (count > 0) {				\
 			unsigned short sval;			\
 			CHECK_SCHEDULER();			\
-			GET_VAL(sval, buf, mode);		\
+			GET_VAL(sval, iter);			\
 			EMU8000_SMLD_WRITE(emu, sval);		\
 			count--;				\
 		}						\
@@ -450,27 +436,14 @@ enum {
 /* copy one channel block */
 static int emu8k_pcm_copy(struct snd_pcm_substream *subs,
 			  int voice, unsigned long pos,
-			  void __user *src, unsigned long count)
+			  struct iov_iter *src, unsigned long count)
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
 
@@ -483,16 +456,15 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 	/* convert to word unit */
 	pos = (pos << 1) + rec->loop_start[voice];
 	count <<= 1;
-	LOOP_WRITE(rec, pos, NULL, count, FILL_SILENCE);
+	LOOP_WRITE(rec, pos, USER_SOCKPTR(NULL), count);
 	return 0;
 }
 
 #else /* interleave */
 
-#define LOOP_WRITE(rec, pos, _buf, count, mode)				\
+#define LOOP_WRITE(rec, pos, iter, count)				\
 	do {								\
 		struct snd_emu8000 *emu = rec->emu;			\
-		unsigned short *buf = (__force unsigned short *)(_buf);	\
 		snd_emu8000_write_wait(emu, 1);				\
 		EMU8000_SMALW_WRITE(emu, pos + rec->loop_start[0]);	\
 		if (rec->voices > 1)					\
@@ -500,11 +472,11 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 		while (count > 0) {					\
 			unsigned short sval;				\
 			CHECK_SCHEDULER();				\
-			GET_VAL(sval, buf, mode);			\
+			GET_VAL(sval, iter);				\
 			EMU8000_SMLD_WRITE(emu, sval);			\
 			if (rec->voices > 1) {				\
 				CHECK_SCHEDULER();			\
-				GET_VAL(sval, buf, mode);		\
+				GET_VAL(sval, iter);			\
 				EMU8000_SMRD_WRITE(emu, sval);		\
 			}						\
 			count--;					\
@@ -518,27 +490,14 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
  */
 static int emu8k_pcm_copy(struct snd_pcm_substream *subs,
 			  int voice, unsigned long pos,
-			  void __user *src, unsigned long count)
+			  struct iov_iter *src, unsigned long count)
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
 
@@ -550,7 +509,7 @@ static int emu8k_pcm_silence(struct snd_pcm_substream *subs,
 	/* convert to frames */
 	pos = bytes_to_frames(subs->runtime, pos);
 	count = bytes_to_frames(subs->runtime, count);
-	LOOP_WRITE(rec, pos, NULL, count, FILL_SILENCE);
+	LOOP_WRITE(rec, pos, NULL, count);
 	return 0;
 }
 #endif
@@ -666,8 +625,7 @@ static const struct snd_pcm_ops emu8k_pcm_ops = {
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

