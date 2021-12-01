Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30298464A52
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 10:04:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A555A216F;
	Wed,  1 Dec 2021 10:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A555A216F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638349465;
	bh=Ex671u7n4fbHtops0mrAupVFZc5JYZdYYYMQgVDj2sc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ERVhnS7tGjefcGa/IDutXGgiTEu/2rvtQbQ0TYH4SLl4gOILxC4ZJNMmuSbUgzuui
	 AKmyosXm/nEXljuyEPKyAyIltIEBQ4UwXvYWdBYMIkGRM/kjEZDCNfU6Q+BtvQRpal
	 q6v099BQUsgYMSID+3DHmVi5+9fXqP6QIdWHw8bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1119F80121;
	Wed,  1 Dec 2021 10:03:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7D1FF80246; Wed,  1 Dec 2021 10:01:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F31F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 09:59:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F31F80217
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R511e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424; MF=cuibixuan@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0Uz-4zV2_1638349134; 
Received: from VM20210331-25.tbsite.net(mailfrom:cuibixuan@linux.alibaba.com
 fp:SMTPD_---0Uz-4zV2_1638349134) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 01 Dec 2021 16:58:58 +0800
From: Bixuan Cui <cuibixuan@linux.alibaba.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -next] ALSA: oss: fix compile error when OSS_DEBUG is enabled
Date: Wed,  1 Dec 2021 16:58:54 +0800
Message-Id: <1638349134-110369-1-git-send-email-cuibixuan@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: cuibixuan@linux.alibaba.com, tiwai@suse.com
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

Fix compile error when OSS_DEBUG is enabled:
    sound/core/oss/pcm_oss.c: In function 'snd_pcm_oss_set_trigger':
    sound/core/oss/pcm_oss.c:2055:10: error: 'substream' undeclared (first
    use in this function); did you mean 'csubstream'?
      pcm_dbg(substream->pcm, "pcm_oss: trigger = 0x%x\n", trigger);
              ^

Fixes: 61efcee8608c ("ALSA: oss: Use standard printk helpers")
Signed-off-by: Bixuan Cui <cuibixuan@linux.alibaba.com>
---
 sound/core/oss/pcm_oss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 82a8187..bb37665 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2052,7 +2052,7 @@ static int snd_pcm_oss_set_trigger(struct snd_pcm_oss_file *pcm_oss_file, int tr
 	int err, cmd;
 
 #ifdef OSS_DEBUG
-	pcm_dbg(substream->pcm, "pcm_oss: trigger = 0x%x\n", trigger);
+	pr_debug("pcm_oss: trigger = 0x%x\n", trigger);
 #endif
 	
 	psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
-- 
1.8.3.1

