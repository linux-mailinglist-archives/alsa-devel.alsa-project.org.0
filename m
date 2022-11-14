Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7EA62785A
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 10:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F88C83D;
	Mon, 14 Nov 2022 09:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F88C83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668416413;
	bh=6OLld61kCMu0V4QdonYtday9/fM2EXcQuQhh4elUN/w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XYJn0HVnmMaBy4Qeqqbac8XS6yAvXjWhf8sA8fjAkwHRaiC8BauJ/G2G22qQpyV3G
	 pKd7BTODPnYWLmsn6sA1js+qlxFBi7mTFH2Kfp8HSzPa/36UJ2PuXtQef//jietONQ
	 k1fTgMhaMnOX+EtsuvHxWfl+TD8nHF+mCsuB2YW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FF02F800B6;
	Mon, 14 Nov 2022 09:59:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06CDDF80431; Mon, 14 Nov 2022 09:59:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C76B5F800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 09:59:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C76B5F800B6
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N9jp91d86zJnhw;
 Mon, 14 Nov 2022 16:56:01 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemi500024.china.huawei.com
 (7.221.188.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 14 Nov
 2022 16:59:06 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <perex@perex.cz>, <leoy@marvell.com>, <robert.jarzmik@free.fr>,
 <daniel@zonque.org>, <haojian.zhuang@gmail.com>, <broonie@kernel.org>,
 <lgirdwood@gmail.com>, <tiwai@suse.com>, <zhangfei.gao@marvell.com>,
 <zhouqiao@marvell.com>
Subject: [PATCH] ASoC: pxa: fix null-pointer dereference in filter()
Date: Mon, 14 Nov 2022 16:56:29 +0800
Message-ID: <20221114085629.1910435-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
Cc: zengheng4@huawei.com, alsa-devel@alsa-project.org, liwei391@huawei.com,
 linux-arm-kernel@lists.infradead.org
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

kasprintf() would return NULL pointer when kmalloc() fail to allocate.
Need to check the return pointer before calling strcmp().

Fixes: 7a824e214e25 ("ASoC: mmp: add audio dma support")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 sound/soc/pxa/mmp-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-pcm.c b/sound/soc/pxa/mmp-pcm.c
index 5d520e18e512..99b245e3079a 100644
--- a/sound/soc/pxa/mmp-pcm.c
+++ b/sound/soc/pxa/mmp-pcm.c
@@ -98,7 +98,7 @@ static bool filter(struct dma_chan *chan, void *param)
 
 	devname = kasprintf(GFP_KERNEL, "%s.%d", dma_data->dma_res->name,
 		dma_data->ssp_id);
-	if ((strcmp(dev_name(chan->device->dev), devname) == 0) &&
+	if (devname && (strcmp(dev_name(chan->device->dev), devname) == 0) &&
 		(chan->chan_id == dma_data->dma_res->start)) {
 		found = true;
 	}
-- 
2.25.1

