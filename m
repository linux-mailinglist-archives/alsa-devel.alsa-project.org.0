Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C13752B8
	for <lists+alsa-devel@lfdr.de>; Thu,  6 May 2021 13:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E6B85D;
	Thu,  6 May 2021 12:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E6B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620298840;
	bh=XovzBBE5bxjJpbmHka0ns+XrAU6Uo91b8+OTbGwixMs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WQHW9602jn70qDoqx125o8rLNvNiObmFwEa7JTuxPqbx8OHy4wa4r3K4ffGihK1em
	 3lffLAFXsqIHhIYai2VnmOFmt8B7Pev//vhYRmtTVApFzqwUUu5VWUXNa6rY/dC8JH
	 RI8gS112VE9OJta9h7YQ0DZDUh+7F0jzA4yrGp30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A43F80108;
	Thu,  6 May 2021 12:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B27BF80108; Thu,  6 May 2021 12:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6397AF80108
 for <alsa-devel@alsa-project.org>; Thu,  6 May 2021 12:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6397AF80108
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0UXyJL8X_1620298736; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UXyJL8X_1620298736) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 06 May 2021 18:59:02 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: oder_chiou@realtek.com
Subject: [PATCH] ASoC: rt286: Remove redundant assignment to d_len_code
Date: Thu,  6 May 2021 18:58:55 +0800
Message-Id: <1620298735-31708-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

Variable d_len_code is set to zero, but this value is never read as
it is overwritten or not used later on, hence it is a redundant
assignment and can be removed.

Clean up the following clang-analyzer warning:

sound/soc/codecs/rt286.c:728:2: warning: Value stored to 'd_len_code' is
never read [clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/rt286.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 802f485..caa7208 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -725,7 +725,6 @@ static int rt286_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	d_len_code = 0;
 	switch (params_width(params)) {
 	/* bit 6:4 Bits per Sample */
 	case 16:
-- 
1.8.3.1

