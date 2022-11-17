Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207B62D355
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 07:13:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838EE16A0;
	Thu, 17 Nov 2022 07:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838EE16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668665637;
	bh=3KqtH/gImUYxAD5iD0P+DgGbnypiQUAhmlGg7g6zLk4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DLgU/LZw+VuSkMVoyDeNZa/S/EJD9nfmW5ZFTITc9NSfxIE2KO3OkjGuQN60xTitq
	 9AuJtGy4dAGN+dANC1NUcPH/mPeWhW/5oyd0qUcJBEb7OrH9YHH/Vp8b3gjCfy0hA0
	 Wt4O7TrD4IAGYeJk6UkHpbCqzzftYQDY76pNdOB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22BE3F804BD;
	Thu, 17 Nov 2022 07:13:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBC61F800B8; Thu, 17 Nov 2022 07:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9FFF800B8
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 07:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9FFF800B8
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NCV225hjWz15MdB;
 Thu, 17 Nov 2022 14:12:26 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 14:12:48 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <Vijendar.Mukunda@amd.com>,
 <venkataprasad.potturu@amd.com>, <Vsujithkumar.Reddy@amd.com>,
 <ckeepax@opensource.cirrus.com>, <nathan@kernel.org>, <error27@gmail.com>,
 <AjitKumar.Pandey@amd.com>, <cuigaosheng1@huawei.com>
Subject: [PATCH] ASoC: amd: acp: Fix possible UAF in acp_dma_open
Date: Thu, 17 Nov 2022 14:12:48 +0800
Message-ID: <20221117061248.3018292-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org
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

Smatch report warning as follows:

sound/soc/amd/acp/acp-platform.c:199 acp_dma_open() warn:
  '&stream->list' not removed from list

If snd_pcm_hw_constraint_integer() fails in acp_dma_open(),
stream will be freed, but stream->list will not be removed from
adata->stream_list, then list traversal may cause UAF.

Fix by removeing it from adata->stream_list before free().

Fixes: 7929985cfe36 ("ASoC: amd: acp: Initialize list to store acp_stream during pcm_open")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 sound/soc/amd/acp/acp-platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 85a81add4ef9..275e0428eec4 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -196,6 +196,9 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0) {
 		dev_err(component->dev, "set integer constraint failed\n");
+		spin_lock_irq(&adata->acp_lock);
+		list_del(&stream->list);
+		spin_unlock_irq(&adata->acp_lock);
 		kfree(stream);
 		return ret;
 	}
-- 
2.25.1

