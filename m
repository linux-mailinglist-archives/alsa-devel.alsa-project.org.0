Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA377D2ED
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9611F1F2;
	Tue, 15 Aug 2023 21:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9611F1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692126329;
	bh=LFzLGTAShjRGxfCY6gNN0vok8Bpbq768CnWga+NEWtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UdZGvGiNsyibeXAr3jS9gbjObXxZrMqRgyjPqxU6sBtib/iexH3wcMhbf8gueDytn
	 LJ+KcPndzGrtIFwJNKu+6/GQ5f6Eh+YoSa/tFwTcmtelqnDi68DMgckes7XgjDSbmY
	 qkPxGoCXeT2QFXxUDVsp6OWUo87rA6EN146Mk7x0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C381F8057E; Tue, 15 Aug 2023 21:02:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1284F80553;
	Tue, 15 Aug 2023 21:02:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DBF6F805D7; Tue, 15 Aug 2023 21:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFE29F8055A
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE29F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HFlsEFfp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=H7+rZg0R
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 92CDB219AB;
	Tue, 15 Aug 2023 19:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692126110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AoYuahFv9jY9TJIQezpvBTUC7RKI1JDEmMCNFlRwbQU=;
	b=HFlsEFfpJhddTfmlbA88RQm9z2/PARL8ZYymbiJTyFFcGyykZJKzEnfgaQ9+2OUJ20Hjep
	8mdHAmx+90TWzwgkOVgPPRU7rp8Y538ZbnSqH399WslW2sK1+u2EXjFjVAhYZ9QxGTrTOB
	YEG9G9drermuiSry0wP7mGkUkZyQjC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126110;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AoYuahFv9jY9TJIQezpvBTUC7RKI1JDEmMCNFlRwbQU=;
	b=H7+rZg0RDu+leJTafpFZYEIXnx5iBQbYiF56ix+ByDMib7O1FgaNUGTft2AnWfym2DKlka
	y9IiK0NNiMz9YTCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B3A91390C;
	Tue, 15 Aug 2023 19:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EKtOGZ7L22QTVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v2 21/25] ASoC: dmaengine: Convert to generic PCM copy ops
Date: Tue, 15 Aug 2023 21:01:32 +0200
Message-Id: <20230815190136.8987-22-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XNPCSE4FKNGKJ5XFMUGDFZTLINS3A3JE
X-Message-ID-Hash: XNPCSE4FKNGKJ5XFMUGDFZTLINS3A3JE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNPCSE4FKNGKJ5XFMUGDFZTLINS3A3JE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the ASoC dmaenging driver code to use the new
unified PCM copy callback.  It's a straightforward conversion from
*_user() to *_iter() variants.

The process callback is still using the direct pointer as of now, but
it'll be converted in the next patch.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is adjusted accordingly.

Reviewed-by: Mark Brown <broonie@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 3b99f619e37e..f2cb75781566 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -287,10 +287,10 @@ static snd_pcm_uframes_t dmaengine_pcm_pointer(
 		return snd_dmaengine_pcm_pointer(substream);
 }
 
-static int dmaengine_copy_user(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream,
-			       int channel, unsigned long hwoff,
-			       void __user *buf, unsigned long bytes)
+static int dmaengine_copy(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  int channel, unsigned long hwoff,
+			  struct iov_iter *buf, unsigned long bytes)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
@@ -300,19 +300,20 @@ static int dmaengine_copy_user(struct snd_soc_component *component,
 	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	void *dma_ptr = runtime->dma_area + hwoff +
 			channel * (runtime->dma_bytes / runtime->channels);
+	void *ptr = (void __force *)iter_iov_addr(buf);
 
 	if (is_playback)
-		if (copy_from_user(dma_ptr, buf, bytes))
+		if (copy_from_iter(dma_ptr, bytes, buf) != bytes)
 			return -EFAULT;
 
 	if (process) {
-		int ret = process(substream, channel, hwoff, (__force void *)buf, bytes);
+		int ret = process(substream, channel, hwoff, ptr, bytes);
 		if (ret < 0)
 			return ret;
 	}
 
 	if (!is_playback)
-		if (copy_to_user(buf, dma_ptr, bytes))
+		if (copy_to_iter(dma_ptr, bytes, buf) != bytes)
 			return -EFAULT;
 
 	return 0;
@@ -337,7 +338,7 @@ static const struct snd_soc_component_driver dmaengine_pcm_component_process = {
 	.hw_params	= dmaengine_pcm_hw_params,
 	.trigger	= dmaengine_pcm_trigger,
 	.pointer	= dmaengine_pcm_pointer,
-	.copy_user	= dmaengine_copy_user,
+	.copy		= dmaengine_copy,
 	.pcm_construct	= dmaengine_pcm_new,
 };
 
-- 
2.35.3

