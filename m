Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AED5995FC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 09:31:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3D041614;
	Fri, 19 Aug 2022 09:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3D041614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660894265;
	bh=MqSi1rb4lcXs5mKYgNI9ZOJHPcqFhs81g9qEg4CLgqM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBCIdukiTNFRZ52J3uyt1x5MlT2+3618er+rVWs6k+yEmCH8TGTJBhXP4FDwNbJMe
	 OXiEhqhbkpmp1zZImu0k5vXFc91SiGiQf1k3MN8lMOr0HFWVvTL3lDzA97bUKdXHRx
	 ShiudxAati1yuNXAsw7lEz0yktK6NVmssR9PZ04E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13B9BF8016C;
	Fri, 19 Aug 2022 09:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF71CF802A0; Fri, 19 Aug 2022 09:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15571F8016C
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 09:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15571F8016C
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M8Cz44qSnzGpgt;
 Fri, 19 Aug 2022 15:28:16 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 19 Aug 2022 15:29:51 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 19 Aug
 2022 15:29:50 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next 3/3] ASoC: amd: acp: add a label to make error path more
 clean
Date: Fri, 19 Aug 2022 15:37:58 +0800
Message-ID: <20220819073758.1273160-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819073758.1273160-1-yangyingliang@huawei.com>
References: <20220819073758.1273160-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: venkataprasad.potturu@amd.com, broonie@kernel.org, Vijendar.Mukunda@amd.com
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

Move platform_device_unregister() to a new label to make code more clean.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/amd/acp/acp-pci.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 691350646f1b..ef2ce083521e 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -103,16 +103,14 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	addr = pci_resource_start(pci, 0);
 	chip->base = devm_ioremap(&pci->dev, addr, pci_resource_len(pci, 0));
 	if (!chip->base) {
-		platform_device_unregister(dmic_dev);
 		ret = -ENOMEM;
-		goto release_regions;
+		goto unregister_dmic_dev;
 	}
 
 	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * num_res, GFP_KERNEL);
 	if (!res) {
-		platform_device_unregister(dmic_dev);
 		ret = -ENOMEM;
-		goto release_regions;
+		goto unregister_dmic_dev;
 	}
 
 	for (i = 0; i < num_res; i++, res_acp++) {
@@ -139,13 +137,14 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	pdev = platform_device_register_full(&pdevinfo);
 	if (IS_ERR(pdev)) {
 		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
-		platform_device_unregister(dmic_dev);
 		ret = PTR_ERR(pdev);
-		goto release_regions;
+		goto unregister_dmic_dev;
 	}
 
 	return ret;
 
+unregister_dmic_dev:
+	platform_device_unregister(dmic_dev);
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
-- 
2.25.1

