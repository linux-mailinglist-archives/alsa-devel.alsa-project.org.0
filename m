Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE12B3CF6CD
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 11:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8C41682;
	Tue, 20 Jul 2021 11:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8C41682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626773314;
	bh=YmcrEGndW8VjDL4QxftrC6khjsJM6w5FBFs64HKxWDs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tHXoff3i4/x18ytmyITEUVprpw7pNzGRiDbR/UBg4ZXzrsfnBvkXgtIf0DkFDQa/T
	 zj+WTAsaHLx6VKBRGuXgSVnNbmCci8wB401sV45phqKN+CtmeCiw/2qPU072VerV5z
	 laXV6kCVdjlF4TagbWvzc5zqHYK0ccuqiSNdGAuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27960F80104;
	Tue, 20 Jul 2021 11:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69762F80256; Tue, 20 Jul 2021 11:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40303F8020D
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 11:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40303F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="mQR9Moka"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Nmh3gqdu"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 349B11FDE4
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626773254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VWSMnmQSJPOyfeZokzcdIB+YqXCRAnLOmlcubJwtiME=;
 b=mQR9MokalxkrHpaOzJ9/yNfqSzowy9WVZD0ywhZb+q9TMi/FC+aEqpzFploArIL9+Ra4Bh
 1JilEoOr8r8x7TVVIDIhWKQhhglihgsucVPBZjeNo8/KDGrl5q5aE474htUTa8R8w7r0CR
 bWUTqw4YMIxhjb2wRZdSfH4BgkNGZOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626773254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VWSMnmQSJPOyfeZokzcdIB+YqXCRAnLOmlcubJwtiME=;
 b=Nmh3gqduLJFFU0FrYs5UZPe4IOqduZeXcuWsWq5KzhzNe02wIrAZkEuQ/MtQk/RzxTsB1u
 0pPjd+3riIuFluBw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 24C34A3B85;
 Tue, 20 Jul 2021 09:27:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Fix mmap without buffer preallocation
Date: Tue, 20 Jul 2021 11:27:32 +0200
Message-Id: <20210720092732.12412-1-tiwai@suse.de>
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

The recent rewrite of the memory allocation helpers also changed the
page extraction to a common helper, snd_sgbuf_get_page().  But this
assumes implicitly that the buffer was allocated via the standard
helper (usually via preallocation), and didn't consider the case of
the manual buffer handling.

This patch fixes it and also covers the manual buffer management.

Fixes: 37af81c5998f ("ALSA: core: Abstract memory alloc helpers")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6919d2943b9d..6a2971a7e6a1 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3675,6 +3675,8 @@ static vm_fault_t snd_pcm_mmap_data_fault(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	if (substream->ops->page)
 		page = substream->ops->page(substream, offset);
+	else if (!snd_pcm_get_dma_buf(substream))
+		page = virt_to_page(runtime->dma_area + offset);
 	else
 		page = snd_sgbuf_get_page(snd_pcm_get_dma_buf(substream), offset);
 	if (!page)
-- 
2.26.2

