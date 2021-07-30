Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 470DE3DB59E
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 11:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D42D019FD;
	Fri, 30 Jul 2021 11:03:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D42D019FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627635882;
	bh=CUtfXi60lJCmO6YC3kSYUWEyykXCiUxQ5Ay0gCwdDiU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tmkVZIjReGHLu5uxu/rmVaqtyb7L5w37kEnz8y/garCORb6BGNh0vV7CZlCbmPIqm
	 QZqKdihw1iGCNHkTaBTIOgfu78nnWn+qQGjUZ7733s5lv/ftnHwEiA5N8cPdX3l1aX
	 YAcktaUvNuXbx+A6yDuTs+9ZcAEDa+d3ztpQJC90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E9ADF8025A;
	Fri, 30 Jul 2021 11:03:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D870F80253; Fri, 30 Jul 2021 11:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34755F8019B
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 11:03:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 1088CA003F;
 Fri, 30 Jul 2021 11:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 1088CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1627635785; bh=esDYRbz6AalQmhVyKPdaKQ9dA13PxErSDR/m1A34si4=;
 h=From:To:Cc:Subject:Date:From;
 b=mz/iHq08wy95u48V76l+wfaHKNNSArXTzG7wJLw5dBUY8qeHOhp+NbN2IdufWHeR8
 I0AsKi+DC4IiZJfDxshMX+00y38/jWwaSsfVVKCFOr9v/9sOI76VkbiJEiv1TsGS75
 Ll2xSAjqJOOmM2bHb/zBavL6scknnh33BDKRDdcM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 30 Jul 2021 11:03:00 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: pcm - fix mmap capability check for the snd-dummy driver
Date: Fri, 30 Jul 2021 11:02:54 +0200
Message-Id: <20210730090254.612478-1-perex@perex.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, stable@vger.kernel.org
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

The snd-dummy driver (fake_buffer configuration) uses the ops->page
callback for the mmap operations. Allow mmap for this case, too.

Cc: <stable@vger.kernel.org>
Fixes: c4824ae7db41 ("ALSA: pcm: Fix mmap capability check")
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/core/pcm_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6a2971a7e6a1..09c0e2a6489c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -246,7 +246,7 @@ static bool hw_support_mmap(struct snd_pcm_substream *substream)
 	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
 		return false;
 
-	if (substream->ops->mmap)
+	if (substream->ops->mmap || substream->ops->page)
 		return true;
 
 	switch (substream->dma_buffer.dev.type) {
-- 
2.31.1
