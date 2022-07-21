Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E5957D09C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 18:03:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A06818AA;
	Thu, 21 Jul 2022 18:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A06818AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658419399;
	bh=z7ZciXQ4NQEV3Qs5DA9KMUR2j/IxVAohXJ+9neNh+sI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h70iIWu8RlrZ5jhbkTQjb97IV30quTtGVBBqmLRSTwKF2sCzuRLc4MbQgghmkbnGL
	 r/hWnBvR4x/SF47jcDihUvOPxn0lSckPG1nWB+l18zS266sTUV/wxVjWD6POTPT/hB
	 ddFp1ev0E0vOuDJt+OQbnFd7/VMs1ESfoOdnMg68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42409F805C0;
	Thu, 21 Jul 2022 17:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA37F8016D; Thu, 21 Jul 2022 08:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09E45F80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 08:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09E45F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="SpIc64ZR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oU0ODAGZtgNn/dUOxYUXD5HM7xMcpX0LL8Tg8C7Jr5gBH/+uA7pzSmxYVyJ8GwDEEsAcsEYFCGhty8DN6rb/lkmqK6cXLBbsrP06d9yBzE8JTP5nWHYnREdQsvAsyjLndgTMz+haaonFbSvtINuIl/BG8fzDAlbMMUJdsLCOEboPcPT9pY6NC9FbnHPTrUhficVWRX8amIh86MfDZIZUcvteEnn09YbajbgYjFQaHLw0NLKtGBUIMBeOVy3d0B/g04vocr+L40bSPy0Q+pV6Q+qSccwq803+JHrEuBdvw+VmIjJa4hHIPTN/dXypPshcSOz4IyCcUd3GM89FdlkU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxJ95R0gtb6wG7CRuUumvgM3vBK/Ab/DY0A5D7mg8tk=;
 b=bsb/LEUE4/Tmtm8mg/gD8r0PhUl/3mc3KfmaKZaAkLc99LWGbVk7I10w2MuW85Cm1AvhBKLLQRVw8PERe3ouoJaLHBHBjFETLmoCimvRw6M7cbrQsuRxUr6u7pTJXM8s37tbqvuYgDHHzI4BKKBr+5DRWzNpcsZg7RzYvJ0P0i+7heriVJLCdV0xYwEEkpsjKHEmXFN/XrQb3cY6gl6qa9uby2iJOZHT3RtzDza/YBSRpjY7jQ0OcGVthQuAnB1aocZANIyhKiZqkBe//LPaR/etUynBugBePPc79vLsngAr1NMRHYihnW84udAr4TBSjn1rx7m4nfCk8F95uuDzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxJ95R0gtb6wG7CRuUumvgM3vBK/Ab/DY0A5D7mg8tk=;
 b=SpIc64ZROzCAH/9HzDS4YWkPil+aaK0UCzFR/BO8n5htwJIm5EXeJ4lsvjq7/Z2fuVdrdvmxgkxF9ww4TeesP5pGSj25GlsGA+8fiy7Fhhd+5ZawGtIs1sDF5SDdPAsC9fNYsl/Uwj/IrWNBq2JmIOrbThbDVC5xYMxvIDljlbI=
Received: from MW4PR04CA0357.namprd04.prod.outlook.com (2603:10b6:303:8a::32)
 by BYAPR12MB2837.namprd12.prod.outlook.com (2603:10b6:a03:68::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Thu, 21 Jul
 2022 06:12:55 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::c8) by MW4PR04CA0357.outlook.office365.com
 (2603:10b6:303:8a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 21 Jul 2022 06:12:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 06:12:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 21 Jul
 2022 01:12:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 21 Jul
 2022 01:12:53 -0500
Received: from amd-Z97X-UD7-TH.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 21 Jul 2022 01:12:44 -0500
From: syed sabakareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 4/5] ASoC: amd: add RPL Platform pci driver pm-ops
Date: Thu, 21 Jul 2022 11:40:01 +0530
Message-ID: <20220721061035.91139-4-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
References: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5409a17-2f51-43b2-d5d9-08da6ae00d0a
X-MS-TrafficTypeDiagnostic: BYAPR12MB2837:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NA3m9DoxIXL8W0dFHbnAXikDs8y344cd5iyt+Mi9vk8+Lha9YBGjdyncimV5fl+Jncaxzq6VUk8S84Ovk6wogUYfDYrkfCIPDImS7ejHaUhV4BQ9NbQr9haYWnAijNlPugyJy88pTDm2f5/rujd9HRAMDNXLc9BmFXb1s3T66cLS4+T57ZGrICdarjwp7AgUiBakb47neRCaZMHzUIKPw+Zu0bt9K3pZeF0+F2QbfpQmkQsT39Ygki4ftnUZshYcO/0uwYsyg487UM4LmwzZbL0iRT0f+gCVkx/K5Q27SwEtCd7opOgkbVdltKvENS4QN4+HJt732ElkvRMOVBMyEioNmGt3R7SdAA4zditm8ExrZcLLJswluGkO+vADOTGaYgHNt0c6WI4JvI+Jz5xLQAMTy+HuX5chon0y/rFRK8vbBOiYgHIInhjSwX95mWenxpd8iGvu64yKayHYpXuLJBxikJGXZQDqa3n+KHNAWiuTJ36Ib38NXaRoT+lJzLYHKDxfugRGSDalpyB/T3lHy45hu9BFRZf7N71nwbTZbK0WHpuSqhmZuv80IU9+NagZtvAxH5073l4sTHEYeSy7sXkvrkggi8QQ3MNn/3jtuEW4imGmcsqRDGOsVe50/tI1at6rs4GbRPAGxHifp3hijqAw5hLqgn9SxbImmvXsJCW2/25hP0MMhuDBVhHYHx5Q9TG4V+kKnocN+ipAi9dFn5nRtWE+RN/qXbVNYMBAUDXsZJ8OZlvbqlH8XJPJUF5/pGlbmOc3DJ/ntjhbEWOnd/b65DefuFZonD0hR5smkcYOlEqjgA3pAb2Yuh1vZ7w6w6956AohXKOlyKRJnLX19w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(40470700004)(6666004)(83380400001)(70586007)(86362001)(70206006)(4326008)(82310400005)(40460700003)(36860700001)(2906002)(356005)(81166007)(82740400003)(5660300002)(36756003)(7696005)(478600001)(26005)(8936002)(1076003)(8676002)(2616005)(316002)(40480700001)(110136005)(41300700001)(47076005)(336012)(426003)(54906003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 06:12:54.8660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5409a17-2f51-43b2-d5d9-08da6ae00d0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2837
X-Mailman-Approved-At: Thu, 21 Jul 2022 17:58:02 +0200
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

Add RPL Platform ACP PCI driver pm ops.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/rpl/rpl-pci-acp6x.c | 40 +++++++++++++++++++++++++++++++
 sound/soc/amd/rpl/rpl_acp6x.h     | 15 ++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/sound/soc/amd/rpl/rpl-pci-acp6x.c b/sound/soc/amd/rpl/rpl-pci-acp6x.c
index 71ae90a00f36..a8e548ed991b 100644
--- a/sound/soc/amd/rpl/rpl-pci-acp6x.c
+++ b/sound/soc/amd/rpl/rpl-pci-acp6x.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "rpl_acp6x.h"
 
@@ -144,6 +145,11 @@ static int snd_rpl_probe(struct pci_dev *pci,
 	ret = rpl_init(adata->acp6x_base);
 	if (ret)
 		goto release_regions;
+	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_allow(&pci->dev);
+
 	return 0;
 release_regions:
 	pci_release_regions(pci);
@@ -153,6 +159,35 @@ static int snd_rpl_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int __maybe_unused snd_rpl_suspend(struct device *dev)
+{
+	struct rpl_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	ret = rpl_deinit(adata->acp6x_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	return ret;
+}
+
+static int __maybe_unused snd_rpl_resume(struct device *dev)
+{
+	struct rpl_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	ret = rpl_init(adata->acp6x_base);
+	if (ret)
+		dev_err(dev, "ACP init failed\n");
+	return ret;
+}
+
+static const struct dev_pm_ops rpl_pm = {
+	SET_RUNTIME_PM_OPS(snd_rpl_suspend, snd_rpl_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(snd_rpl_suspend, snd_rpl_resume)
+};
+
 static void snd_rpl_remove(struct pci_dev *pci)
 {
 	struct rpl_dev_data *adata;
@@ -162,6 +197,8 @@ static void snd_rpl_remove(struct pci_dev *pci)
 	ret = rpl_deinit(adata->acp6x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -179,6 +216,9 @@ static struct pci_driver rpl_acp6x_driver  = {
 	.id_table = snd_rpl_ids,
 	.probe = snd_rpl_probe,
 	.remove = snd_rpl_remove,
+	.driver = {
+		.pm = &rpl_pm,
+	}
 };
 
 module_pci_driver(rpl_acp6x_driver);
diff --git a/sound/soc/amd/rpl/rpl_acp6x.h b/sound/soc/amd/rpl/rpl_acp6x.h
index 5de19d5c892e..f5816a33632e 100644
--- a/sound/soc/amd/rpl/rpl_acp6x.h
+++ b/sound/soc/amd/rpl/rpl_acp6x.h
@@ -10,6 +10,21 @@
 #define ACP_DEVICE_ID 0x15E2
 #define ACP6x_PHY_BASE_ADDRESS 0x1240000
 
+#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK   0x00010001
+#define ACP_PGFSM_CNTL_POWER_ON_MASK    1
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0
+#define ACP_PGFSM_STATUS_MASK           3
+#define ACP_POWERED_ON                  0
+#define ACP_POWER_ON_IN_PROGRESS        1
+#define ACP_POWERED_OFF                 2
+#define ACP_POWER_OFF_IN_PROGRESS       3
+
+#define DELAY_US        5
+#define ACP_COUNTER     20000
+
+/* time in ms for runtime suspend delay */
+#define ACP_SUSPEND_DELAY_MS    2000
+
 static inline u32 rpl_acp_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
-- 
2.25.1

