Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9A27DE9D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 04:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4221802;
	Wed, 30 Sep 2020 04:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4221802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601434499;
	bh=ks3hcNYPkjInzSb3Jn16bL9Vd4dMso4ZdNkNq8kCoEI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ByfQspRXTlYa/d//LNEYhXJkkvWQmg/XxEb3LVkemKnnbfM0RZdtT1X3d02sWs4Sy
	 1LRTW/7fbVa62no43k7UMPFVH/6QAoU05b9DjDc3rMImTKCa74RFPmAtlwh7nDp+5k
	 YBU2I/NR3m+Z5u6bd++9E76uw6WSnOAPNl6cGIt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F3DF80228;
	Wed, 30 Sep 2020 04:53:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23524F801F9; Wed, 30 Sep 2020 04:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BBB4F800DF
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 04:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BBB4F800DF
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 528F488803FECC4F942A;
 Wed, 30 Sep 2020 10:53:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 30 Sep 2020 10:52:53 +0800
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
To: <daniel@zonque.org>, <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>, 
 <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH] ASoC: pxa: remove unnecessary assignment to variable ret
Date: Wed, 30 Sep 2020 10:52:40 +0800
Message-ID: <20200930025240.93345-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jingxiangfeng@huawei.com
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

ret is always zero here in this code path. So remove this assignment.

Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 sound/arm/pxa2xx-ac97.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index ea8e233150c8..813e608dca82 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -210,7 +210,6 @@ static int pxa2xx_ac97_pcm_new(struct snd_card *card)
 		goto out;
 
 	pxa2xx_ac97_pcm = pcm;
-	ret = 0;
 
  out:
 	return ret;
-- 
2.17.1

