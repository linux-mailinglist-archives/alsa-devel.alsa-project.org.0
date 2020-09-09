Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62965262F70
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 16:00:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4DF616D0;
	Wed,  9 Sep 2020 15:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4DF616D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599660004;
	bh=Z0H5Hi0FFAc4DYYdhT+B7VAvXfyMGbm+vI5QzAbWAH4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kPvWbCUOBc5Ub3vO1UiPAj567uYNSDuyjOiI+3CHUYAk2fkG9d1YOuV92YjutWfwU
	 fkhvFb/v7kWvJokHdLijcil3nhMyAGdgdopAwNPHUXntBX+PtP3u0qyvkkDwT3WZvq
	 inJMzQhwqKL5SS3FfR9xafpwzBdbpuOWq2/osHgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1F32F800E9;
	Wed,  9 Sep 2020 15:58:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F843F80256; Wed,  9 Sep 2020 15:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3594DF800E9
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 15:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3594DF800E9
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 94AA83FBFB2294DE67E2;
 Wed,  9 Sep 2020 21:58:05 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 21:57:58 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <yuehaibing@huawei.com>
Subject: [PATCH 04/19] ALSA: pcm: Remove unused inline function snd_mask_sizeof
Date: Wed, 9 Sep 2020 21:57:44 +0800
Message-ID: <20200909135744.33464-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

There is no caller in tree, so can remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 include/sound/pcm_params.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index 36f94735d23d..ba184f49f7e1 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -23,11 +23,6 @@ int snd_pcm_hw_param_value(const struct snd_pcm_hw_params *params,
 #define MASK_OFS(i)	((i) >> 5)
 #define MASK_BIT(i)	(1U << ((i) & 31))
 
-static inline size_t snd_mask_sizeof(void)
-{
-	return sizeof(struct snd_mask);
-}
-
 static inline void snd_mask_none(struct snd_mask *mask)
 {
 	memset(mask, 0, sizeof(*mask));
-- 
2.17.1


