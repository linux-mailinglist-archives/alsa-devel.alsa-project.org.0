Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C73C889F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 18:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678F01694;
	Wed, 14 Jul 2021 18:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678F01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626280003;
	bh=i2wXXkbg9vk8CW7avwvJsWqAXKc4hHySeDBwA/WCZXw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C09xbp0joeW9cSSO3CKWA5I2cX67+N/p2EvRTTXT9u9QzO+tq/C5fLzP4+aelgfHF
	 SmByF/agMQxJby51VLZs1V8E9cHzXMBZh6utmdqHF4kvlnwT0zcM+s2+HUjdWoKLT+
	 guclMwyEihrAaS/pfHQctYR7SrUDJbp4WpteGt/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FFB5F804DF;
	Wed, 14 Jul 2021 18:24:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90C1EF8013C; Wed, 14 Jul 2021 18:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A2C5F8013C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 18:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A2C5F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="2Mu9yqCh"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="bB4E0SbZ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 06A9D1FD7C;
 Wed, 14 Jul 2021 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626279866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+tYYGdB0H+UO8zZ0dbgxkh2l2/D6HiM8oaHivGXcMA=;
 b=2Mu9yqChcf8+ueaC5HgfihK/Ycj92VqAFHmQdoqu8DS5o/FF8rocRzeuS/RjiZxnjSy0Ts
 jJX2T0qH8iVaFzU53X+5yLIAeqU+kcvPao+FI9QLJuDnPUm6zpHjIr8oB7bsUd/hYkJN2A
 Z4EXR9ohAW5rAW68bXoDzsIqx8fNIog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626279866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+tYYGdB0H+UO8zZ0dbgxkh2l2/D6HiM8oaHivGXcMA=;
 b=bB4E0SbZp2yWLEk1k8ZLdC7UnhwfpK2JCxkC2fdt9r6fcx5f9MdZGP4IPIW2MlRmpAeDut
 L3bkOsn+Nlz4XHCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 017A7A3B89;
 Wed, 14 Jul 2021 16:24:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: compress: Initialize mutex in snd_compress_new()
Date: Wed, 14 Jul 2021 18:24:24 +0200
Message-Id: <20210714162424.4412-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210714162424.4412-1-tiwai@suse.de>
References: <20210714162424.4412-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
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

Currently the snd_compr.lock mutex isn't initialized in the API
functions although the lock is used many places in other code in
compress offload API.  It's because the object was expected to be
initialized via snd_compress_register(), but this was never used by
ASoC, which is the only user.  Instead, ASoC initializes the mutex by
itself, and this is error-prone.

This patch moves the mutex initialization into the more appropriate
place, snd_compress_new(), for avoiding the missing init.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/compress_offload.c | 1 +
 sound/soc/soc-compress.c      | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index ed5546ae300a..de514ec8c83d 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1177,6 +1177,7 @@ int snd_compress_new(struct snd_card *card, int device,
 	compr->card = card;
 	compr->device = device;
 	compr->direction = dirn;
+	mutex_init(&compr->lock);
 
 	snd_compress_set_id(compr, id);
 
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index b4f59350a5a8..36060800e9bd 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -604,7 +604,6 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		break;
 	}
 
-	mutex_init(&compr->lock);
 	ret = snd_compress_new(rtd->card->snd_card, num, direction,
 				new_name, compr);
 	if (ret < 0) {
-- 
2.26.2

