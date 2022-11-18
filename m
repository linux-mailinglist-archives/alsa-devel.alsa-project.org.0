Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E076F62EC47
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 04:02:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F5E16C0;
	Fri, 18 Nov 2022 04:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F5E16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668740521;
	bh=1ThU/66mpZiXADR5MB9PjH7eDhWgTHyHJMA/YvJh9M8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eZ851fYCu0Du6cLIQDNhJvXeMDurCu27qmvVSoRsb8aVzBQiyNVwCFcxeXYCJTLsn
	 9geWBRc0D4SVowTIQmSEaiwiw4F65GhrivsjtbUTJqS6eBtjyzRpKr7sRsUhqZhleQ
	 8tjSOBGD6AKsP03hayF7w6oTKm726tkDc3TgkM68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 350EFF8016E;
	Fri, 18 Nov 2022 04:01:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49F70F801D8; Fri, 18 Nov 2022 04:01:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C449F800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 04:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C449F800FD
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ND1k06kSbzHw1B;
 Fri, 18 Nov 2022 11:00:24 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 11:00:56 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <Vijendar.Mukunda@amd.com>,
 <venkataprasad.potturu@amd.com>, <Vsujithkumar.Reddy@amd.com>,
 <error27@gmail.com>, <cuigaosheng1@huawei.com>, <AjitKumar.Pandey@amd.com>,
 <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: amd: acp: Fix possible UAF in acp_dma_open
Date: Fri, 18 Nov 2022 11:00:56 +0800
Message-ID: <20221118030056.3135960-1-cuigaosheng1@huawei.com>
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

Fix by adding the newly allocated stream to the list once it's fully
initialised.

Fixes: 7929985cfe36 ("ASoC: amd: acp: Initialize list to store acp_stream during pcm_open")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
v2:
- Fix by adding the newly allocated stream to the list once it's fully initialised.
v1:
- Fix by removeing it from adata->stream_list before free().
 sound/soc/amd/acp/acp-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 85a81add4ef9..447612a7a762 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -184,10 +184,6 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 
 	stream->substream = substream;
 
-	spin_lock_irq(&adata->acp_lock);
-	list_add_tail(&stream->list, &adata->stream_list);
-	spin_unlock_irq(&adata->acp_lock);
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		runtime->hw = acp_pcm_hardware_playback;
 	else
@@ -203,6 +199,10 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 
 	writel(1, ACP_EXTERNAL_INTR_ENB(adata));
 
+	spin_lock_irq(&adata->acp_lock);
+	list_add_tail(&stream->list, &adata->stream_list);
+	spin_unlock_irq(&adata->acp_lock);
+
 	return ret;
 }
 
-- 
2.25.1

