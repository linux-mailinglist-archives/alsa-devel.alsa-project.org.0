Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5950FE9A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 15:15:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE9A18A5;
	Tue, 26 Apr 2022 15:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE9A18A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650978899;
	bh=UeSmnHYBeMkecXy/3ymIHrVaUbGHb8H2qlDlte/V/Xw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dVByAmrteqSI2I85bxh6RPHFWE/xXpYuycydNkivzvP29zlm9saituApGP//K9VZV
	 YXriQ+7Z5WvTRRgq+HnT+2uLnycLsIu9MvdYGD13+3dhqhsK6A0sJ70qJ1wMiwdFSM
	 FEzYntmulyvde1cvgisJ41iMmLE26b0fLyEHaZ3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03BCF804FE;
	Tue, 26 Apr 2022 15:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17813F8025C; Tue, 26 Apr 2022 15:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E44F80152;
 Tue, 26 Apr 2022 15:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E44F80152
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Knj4X1RnfzhYlG;
 Tue, 26 Apr 2022 21:13:32 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 21:13:49 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 21:13:48 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <sound-open-firmware@alsa-project.org>
Subject: [PATCH -next] ASoC: SOF: sof-pci-dev: fix missing
 pci_release_regions() on error in sof_pci_probe()
Date: Tue, 26 Apr 2022 21:25:39 +0800
Message-ID: <20220426132539.416676-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 rander.wang@intel.com, peter.ujfalusi@linux.intel.com
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

Fix the missing pci_release_regions() before return
from sof_pci_probe() in the error handling case.

Fixes: 4bfbbb76e82e ("ASOC: SOF: pci: add ipc_type override for Intel IPC4 tests")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/sof/sof-pci-dev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index cd90da7c92c2..3b0978b02f9f 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -217,12 +217,14 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 			 desc->ipc_default, sof_pci_ipc_type);
 		if (sof_pci_ipc_type >= SOF_IPC_TYPE_COUNT) {
 			dev_err(dev, "invalid request value %d\n", sof_pci_ipc_type);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 		if (!(BIT(sof_pci_ipc_type) & desc->ipc_supported_mask)) {
 			dev_err(dev, "invalid request value %d, supported mask is %#x\n",
 				sof_pci_ipc_type, desc->ipc_supported_mask);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 		sof_pdata->ipc_type = sof_pci_ipc_type;
 	}
@@ -291,6 +293,8 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	/* call sof helper for DSP hardware probe */
 	ret = snd_sof_device_probe(dev, sof_pdata);
+
+out:
 	if (ret)
 		pci_release_regions(pci);
 
-- 
2.25.1

