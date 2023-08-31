Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF978EE11
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 15:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD9083A;
	Thu, 31 Aug 2023 15:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD9083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693487216;
	bh=LcGcwHnK0QENz2KedcN/+CEqINOI6BsOV9JEcl3kzA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W2wpn/P79azXa8APKIIPlUjJ49+bl/2A8ru3y/2G514AoaOjPQX6xwBFQ7+s1MksY
	 I/1HTH3wJ3ygzMuGmDfj3Mfg88I26bHBO2+MvHrW6DqRggWqPCluwpHjmxCYLysNwm
	 ORyllNdz+eGHG6/nwxBw7ZzQl2nxFC/NgcN8hckk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5619DF804DA; Thu, 31 Aug 2023 15:05:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B71D2F804DA;
	Thu, 31 Aug 2023 15:05:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9934F80155; Thu, 31 Aug 2023 15:05:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 077D5F80007
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 15:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 077D5F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=g7U1V/0R;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=r4Sp7o+l
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8446421863;
	Thu, 31 Aug 2023 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693487106;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev/KpKLXH97fC0L4v1QCNIIX5V/Ec8+Z3RmT/7ikolQ=;
	b=g7U1V/0RxAohAusJCeMPbxjZq49ns5OrWHHQJf8iymYwGartDAq4Y8CJma9ku2ESERR1p8
	E+li3XLAdfH7W05b3hRGvC2pl3iOG2gtk/CKl42VxHFljxWrOMrF3/rCnoPoDc1iB1AGAJ
	7DWnosgBJ8hlae1wOodBYqZ1sehL8Kw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693487106;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev/KpKLXH97fC0L4v1QCNIIX5V/Ec8+Z3RmT/7ikolQ=;
	b=r4Sp7o+lweIcX0CoORetYv++yJ/DqhLYiIohY3sH8EbGyU5dnTXCgAzzlmJ6WUOeaOjZM8
	BGirYL1iHaO8IXBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6146313587;
	Thu, 31 Aug 2023 13:05:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SFy4FgKQ8GSLEgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 31 Aug 2023 13:05:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/2] ASoC: Name iov_iter argument as iterator instead of
 buffer
Date: Thu, 31 Aug 2023 15:04:57 +0200
Message-Id: <20230831130457.8180-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230831130457.8180-1-tiwai@suse.de>
References: <20230831130457.8180-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RJSP3M7EDDIMGHXMUR5AN6H4HCNC6FWX
X-Message-ID-Hash: RJSP3M7EDDIMGHXMUR5AN6H4HCNC6FWX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJSP3M7EDDIMGHXMUR5AN6H4HCNC6FWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While transitioning ASoC code for iov_iter usages, I kept the argument
name as "buf" as the original code.  But, iov_iter is an iterator, and
using the name "buf" may be misleading: the crucial difference is that
iov_iter can be proceeded after the operation, hence it can't be
passed twice, while a simple "buffer" sounds as if reusable.

To make the usage clearer, rename the argument from "buf" to "iter".
There is no functional changes, just names.

Fixes: 66201cacc33d ("ASoC: component: Add generic PCM copy ops")
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/CAHk-=wje+VkXjjfVTmK-uJdG_M5=ar14QxAwK+XDiq07k_pzBg@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/soc-component.h         | 4 ++--
 sound/soc/soc-component.c             | 4 ++--
 sound/soc/soc-generic-dmaengine-pcm.c | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 17bea3144551..ceca69b46a82 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -139,7 +139,7 @@ struct snd_soc_component_driver {
 		struct snd_pcm_audio_tstamp_report *audio_tstamp_report);
 	int (*copy)(struct snd_soc_component *component,
 		    struct snd_pcm_substream *substream, int channel,
-		    unsigned long pos, struct iov_iter *buf,
+		    unsigned long pos, struct iov_iter *iter,
 		    unsigned long bytes);
 	struct page *(*page)(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
@@ -511,7 +511,7 @@ int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
 int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream);
 int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
-			       struct iov_iter *buf, unsigned long bytes);
+			       struct iov_iter *iter, unsigned long bytes);
 struct page *snd_soc_pcm_component_page(struct snd_pcm_substream *substream,
 					unsigned long offset);
 int snd_soc_pcm_component_mmap(struct snd_pcm_substream *substream,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index f18406dfa1e4..ba7c0ae82e00 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1054,7 +1054,7 @@ int snd_soc_pcm_component_sync_stop(struct snd_pcm_substream *substream)
 
 int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
-			       struct iov_iter *buf, unsigned long bytes)
+			       struct iov_iter *iter, unsigned long bytes)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_component *component;
@@ -1065,7 +1065,7 @@ int snd_soc_pcm_component_copy(struct snd_pcm_substream *substream,
 		if (component->driver->copy)
 			return soc_component_ret(component,
 				component->driver->copy(component, substream,
-					channel, pos, buf, bytes));
+					channel, pos, iter, bytes));
 
 	return -EINVAL;
 }
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 7a07fbf98e2e..d0653d775c87 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -290,7 +290,7 @@ static snd_pcm_uframes_t dmaengine_pcm_pointer(
 static int dmaengine_copy(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream,
 			  int channel, unsigned long hwoff,
-			  struct iov_iter *buf, unsigned long bytes)
+			  struct iov_iter *iter, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
@@ -302,7 +302,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 			channel * (runtime->dma_bytes / runtime->channels);
 
 	if (is_playback)
-		if (copy_from_iter(dma_ptr, bytes, buf) != bytes)
+		if (copy_from_iter(dma_ptr, bytes, iter) != bytes)
 			return -EFAULT;
 
 	if (process) {
@@ -312,7 +312,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 	}
 
 	if (!is_playback)
-		if (copy_to_iter(dma_ptr, bytes, buf) != bytes)
+		if (copy_to_iter(dma_ptr, bytes, iter) != bytes)
 			return -EFAULT;
 
 	return 0;
-- 
2.35.3

