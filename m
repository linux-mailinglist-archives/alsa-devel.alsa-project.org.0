Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03E42DC21
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 16:54:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEDA166B;
	Thu, 14 Oct 2021 16:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEDA166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634223291;
	bh=mrGQ1FueGh348kN1BPYD+wjwk05DbiIX8BY/7p4RCgI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fi4Xbx3caYonE/bqli4t274oJpgAIz6ro6GkicI3JXt/yLAvtxowWd+qHbtxkCBEK
	 496Ctdex7F7Cqyypxn7GCMDRaYRU9UmuO75xkxNhfQWGRGd8OW8nMfpoVMsOX+Nfq4
	 LeCeLhETazlK13VM7KSMCwFhi5gc6ePq5xgS2cQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8CF5F801F7;
	Thu, 14 Oct 2021 16:53:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07DC4F80212; Thu, 14 Oct 2021 16:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEA41F801D5
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 16:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA41F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Xk+WXdCq"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="ZjcAZnU/"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id B1E4821A88
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634223204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tKnPGt352QjWovmOa8bLCRx8xrhGVxrO3cSS8544cmA=;
 b=Xk+WXdCqBc1sZLEDCs6UPUekNjfh2ZwlEF/A5gcX/hXfelJb7vPPk9NHRE9CdL2vsAJfC2
 B9GcYfqIt+emOf6JUNoYqXTtic+4B5m6JWeB1ZstooeAqSzkhhuVxr2pNZQGgJ4xh9A7/1
 XAqLqioEQ762WfT6xXz9ZTfCT2I3lv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634223204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tKnPGt352QjWovmOa8bLCRx8xrhGVxrO3cSS8544cmA=;
 b=ZjcAZnU/7fAQMjD9U+zgb7nmyljjljRTjDzSyaQt8okE/CjshpnHpBSFDXj9JG7EIazMCE
 +sU+pHRuLpJu9qCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A1738A3B85;
 Thu, 14 Oct 2021 14:53:24 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Unify snd_pcm_delay() and snd_pcm_hwsync()
Date: Thu, 14 Oct 2021 16:53:23 +0200
Message-Id: <20211014145323.26506-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Both snd_pcm_delay() and snd_pcm_hwsync() do the almost same thing.
The only difference is that the former calculate the delay, so unify
them as a code cleanup, and treat NULL delay argument only for hwsync
operation.

Also, the patch does a slight code refactoring in snd_pcm_delay().
The initialization of the delay value is done in the caller side now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 46c643db18eb..627b201b6084 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2932,32 +2932,24 @@ static snd_pcm_sframes_t snd_pcm_forward(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int snd_pcm_hwsync(struct snd_pcm_substream *substream)
-{
-	int err;
-
-	snd_pcm_stream_lock_irq(substream);
-	err = do_pcm_hwsync(substream);
-	snd_pcm_stream_unlock_irq(substream);
-	return err;
-}
-		
 static int snd_pcm_delay(struct snd_pcm_substream *substream,
 			 snd_pcm_sframes_t *delay)
 {
 	int err;
-	snd_pcm_sframes_t n = 0;
 
 	snd_pcm_stream_lock_irq(substream);
 	err = do_pcm_hwsync(substream);
-	if (!err)
-		n = snd_pcm_calc_delay(substream);
+	if (delay && !err)
+		*delay = snd_pcm_calc_delay(substream);
 	snd_pcm_stream_unlock_irq(substream);
-	if (!err)
-		*delay = n;
 	return err;
 }
 		
+static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
+{
+	return snd_pcm_delay(substream, NULL);
+}
+
 static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 			    struct snd_pcm_sync_ptr __user *_sync_ptr)
 {
@@ -3275,7 +3267,7 @@ static int snd_pcm_common_ioctl(struct file *file,
 		return snd_pcm_hwsync(substream);
 	case SNDRV_PCM_IOCTL_DELAY:
 	{
-		snd_pcm_sframes_t delay;
+		snd_pcm_sframes_t delay = 0;
 		snd_pcm_sframes_t __user *res = arg;
 		int err;
 
-- 
2.31.1

