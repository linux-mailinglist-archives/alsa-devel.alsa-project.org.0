Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC7A3A3F2A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 11:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01DD318F8;
	Fri, 11 Jun 2021 11:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01DD318F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623404229;
	bh=MGet28kUg9dIvtoMz9YbxxOf47n/cFL/UVo4XNtUL00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pHsHCkg2UHWwtNPXgl1TIJahNn3by9KPQBm6hsXcx5Jy73BuhmAVxpROu7E89IGwR
	 aIrZhDcxvKAgqWFrlnPlQrgnHv1xpNFs02Gumzgk1CuFoMdoi/flGtDSFEiSCL6g7i
	 6eENvZjBo3zSraBi0LofeyQqVOsrqAiYgDwopFE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7450FF804FC;
	Fri, 11 Jun 2021 11:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B156F804ED; Fri, 11 Jun 2021 11:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B559F80276
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 11:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B559F80276
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G1bCD0Sgkz6w0y;
 Fri, 11 Jun 2021 17:29:28 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 11 Jun 2021 17:32:33 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 11 Jun
 2021 17:32:33 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <alsa-devel@alsa-project.org>
Subject: [PATCH -next 9/9] ASoC: fsl_xcvr: check return value after calling
 platform_get_resource_byname()
Date: Fri, 11 Jun 2021 17:36:26 +0800
Message-ID: <20210611093626.579176-10-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611093626.579176-1-yangyingliang@huawei.com>
References: <20210611093626.579176-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Cc: broonie@kernel.org, timur@kernel.org
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

It will cause null-ptr-deref if platform_get_resource_byname() returns NULL,
we need check the return value.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/fsl/fsl_xcvr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index df7c189d97dd..2e9061c5ed74 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1202,6 +1202,10 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 
 	rx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rxfifo");
 	tx_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "txfifo");
+	if (!rx_res || !tx_res) {
+		dev_err(dev, "Invalid resource\n");
+		return -EINVAL;
+	}
 	xcvr->dma_prms_rx.chan_name = "rx";
 	xcvr->dma_prms_tx.chan_name = "tx";
 	xcvr->dma_prms_rx.addr = rx_res->start;
-- 
2.25.1

