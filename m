Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F2524200
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 03:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A8C1A75;
	Thu, 12 May 2022 03:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A8C1A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652318691;
	bh=E8x75MnVeUiOBV7BivDq4IUUBEXuN+8A9onizLDllww=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fgV2adrcqIRLVXS3hlQ+mabRv5Jen00E56OCSnf6lpsV9mWg+xLhUaH6YaQaTcZTv
	 Xs6/VJTaPVRzO4A9Dx3QE2NyBksdPctcxr5bBa214ZNGw9sx0lxwd0Vbs91ZbqAXYf
	 vMA41oTv8xM2LPssO86LDIEHUSmGQNoBBkAaozVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F6BFF80249;
	Thu, 12 May 2022 03:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42791F80245; Thu, 12 May 2022 03:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE909F800BB;
 Thu, 12 May 2022 03:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE909F800BB
Received: from kwepemi500015.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KzDXb1pLjzfbH0;
 Thu, 12 May 2022 09:22:23 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemi500015.china.huawei.com
 (7.221.188.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 12 May
 2022 09:23:35 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
 <daniel.baluta@nxp.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <sound-open-firmware@alsa-project.org>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ASoC: SOF: amd: add missing platform_device_unregister
 in acp_pci_rn_probe
Date: Thu, 12 May 2022 09:37:28 +0800
Message-ID: <20220512013728.4128903-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500015.china.huawei.com (7.221.188.92)
X-CFilter-Loop: Reflected
Cc: zhengbin13@huawei.com, gaochao49@huawei.com
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

acp_pci_rn_probe misses a call platform_device_unregister in error path,
this patch fixes that.

Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 sound/soc/sof/amd/pci-rn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index b8910bb7f27c..d5d9bcc2c997 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -101,6 +101,7 @@ static int acp_pci_rn_probe(struct pci_dev *pci, const struct pci_device_id *pci
 	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * ARRAY_SIZE(renoir_res), GFP_KERNEL);
 	if (!res) {
 		sof_pci_remove(pci);
+		platform_device_unregister(dmic_dev);
 		return -ENOMEM;
 	}

--
2.31.1

