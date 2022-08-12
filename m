Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C64859109B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 14:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3760115C2;
	Fri, 12 Aug 2022 14:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3760115C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660306373;
	bh=4kAFvJMWreh7jExLFeVPTNY7WaXl2Xkl4dfIAZGJafs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCeoXd3BTF0bXWc2SAggu0a5BgsTzltwFk4BMbdORcTVliOPf4dcSueTnf2i9l/oJ
	 tVQXJ0WzWJt5gv5zyCe+nffp2BMxV583OuILdFuOAAzfpLqN9cFIC9fHz1DyQxg7nE
	 gcVepPmWZskLTheT2aWgzwREQL3/kekDz8O4N/iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1F0F80558;
	Fri, 12 Aug 2022 14:11:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C81C1F80552; Fri, 12 Aug 2022 14:11:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AE80F8014B
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 14:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AE80F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="PQ6EtbLj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTVpFCRgdFLVpkMvkR0L6cCxBWZ8SWB+s4vAy9EvPiGUVoN/hNyVSvvlPCVU9YQiX3ec4b4VgD8hFRSi3xSEINsvemmFYkwqhqesJyS275+D3HMgWh/4p/Xh1ayvHw5VaOpUP98KgmirE0X4Qmrryc8gdY42d4+wAq52sjX6HBhgOowSvpO0PoJHZgo8LwvOGnR9ZPmi94EVYrozdBmNP4uidF4a5wbL9zUKqdTRn837KaBVEKr3u/MQmTjEBtwSz5RxuHGNc/pAf0fwvovNhRELLzJzgo1AkxYXPmLmLxjlAyUAbvbIEPCUpugY88uOBwTj9BS61m0YhgT/1Zk6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CA1Yk9LXmzX4mx3grgeehka0wrIAgPUspgTor/nGRrY=;
 b=liK+84bYKmh83c6so1Bqo2wL5i3DK8fCu7KAFGAi2PkJmrSLEINPIz1WM/KNUhWDUtVeaoFnANonhH+rjg2kJLO6vVVEZPBBHlp7T6Mz2cDnMHlg4laC/Gxye5iYs1HCnlNP/VhxEOWOszZW3wmERh/+ShX5Ru5byQnaw/5/LZTYyr2KzTiFyb3koZPhbfp83CeU9XZHK6LDqEhDF67gdNdQ9Plgukf232LN1UT6ALOaiDvLO4Gt4LdCtsLVlGwNAris34iu4wsXgZceA5JU3ZTfecZGxjdBySCLg+iD+aS7BmEIgGvFM6x3YN7fW3BZvstpgkVgNqj+CeJ7pbev1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CA1Yk9LXmzX4mx3grgeehka0wrIAgPUspgTor/nGRrY=;
 b=PQ6EtbLjTlS0VPguof6w1DraDuhIGNQzDkYFSP9ZD2nPwjqLxM9qNqQrCOBE36/4UEQX1c1aWpoTGi81M5zKkM9/3o+WsYo16GUHDAOAh0g/X6POSBS3klrIqa/7PRaI32kFVwDrCj5TQvrfbFwi7gSwzerKKNI3yW0MjgBASXE=
Received: from DM6PR10CA0021.namprd10.prod.outlook.com (2603:10b6:5:60::34) by
 BYAPR12MB2597.namprd12.prod.outlook.com (2603:10b6:a03:6e::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.17; Fri, 12 Aug 2022 12:11:17 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::94) by DM6PR10CA0021.outlook.office365.com
 (2603:10b6:5:60::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.15 via Frontend
 Transport; Fri, 12 Aug 2022 12:11:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 12:11:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:10:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:10:14 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 12 Aug 2022 07:10:11 -0500
From: Syed Saba kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 08/13] ASoC: amd: add acp6.2 pci driver pm ops
Date: Fri, 12 Aug 2022 17:37:26 +0530
Message-ID: <20220812120731.788052-9-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4433f9d-a1b0-49a0-6e9d-08da7c5bc23f
X-MS-TrafficTypeDiagnostic: BYAPR12MB2597:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbMBM+0TGfsJht4duJsgPki0+Z5+nSjnw17753Eb3+r68JoG+Hk/UuJCzh7LLZCuz9J/hyMHXXAP87536u6uqgh2TmE9Q0yW6GuthqkVSR62ICqtkhfZwk9f7kVJ/EbGrQaocSbairbkqNJ5u8l2oHDho+Nv1oT3NXEQBM9Noy41u1ClsVq97c9MWZ54+udI2s/dHMJo6VugDCAAbFBJRJRS7i7Xi30o1/YEKPWQEHcCVLyf/mm45qgH4bD85hoJdPKaLwJZxitTeCqox62fE4I8JpGcLvE5R/SKDxBCwICp+JOVbleIXc4GZq3rxv4pVUilFygcMLLSkO4bBzVLYMlaDdQJCV3OVnfZYiyEAL4JVbnFLTow/OHfoGqCP8Fp1V4YJiEsCeNbWzIxH0cvUG6gis1jT7ntwqb7OvAQ1sn3J/KbU3wY0Y7qqQW3HbTP2ZERHjP/EIyFKdYVQ8wI6guDhxbPe6IefmLAOlTNLpUf/CETMdqDBVY+cqOr1mVPAQbpnumudPCGFFQjGdb89DWJF3l9yBBiJmyBuj8kshIfu1Kdd9MvuxKH6CMsDpP3THD9lLdu8tw4D1guJgubCuht8Xg97DiLeyRH/IYaxphz3bwdmSoFmH3jetwijeLImpZx5XSmXKq/qNeRrRye3GF95Vykeef+q9BSmaPShaMxQiTJ/78DXlA5hTWMoagcihE0CGSGCUn4wxGTbTpe+xJgCs/Wq+ojgDwV+24x1vr5aThLEP9Cav3mco9R3EbWlA8+avnYpcjxm6lyifMFsWoMGfnfW0PaexEK9zmN0T0BtlrdCGlX2itPOihyoPsHI22plMgdMHQK8+ul7SaqgA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(40470700004)(70206006)(316002)(5660300002)(4326008)(478600001)(40460700003)(54906003)(110136005)(82310400005)(8676002)(86362001)(40480700001)(36756003)(70586007)(2906002)(8936002)(36860700001)(83380400001)(82740400003)(81166007)(47076005)(356005)(6666004)(41300700001)(7696005)(426003)(336012)(1076003)(186003)(26005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 12:11:16.8057 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4433f9d-a1b0-49a0-6e9d-08da7c5bc23f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2597
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, Syed Saba kareem <Syed.SabaKareem@amd.com>
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

Add acp6.2 pci driver pm ops.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp62.h  |  3 +++
 sound/soc/amd/ps/pci-ps.c | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
index 525e8bd225a2..c5b99e0b81fc 100644
--- a/sound/soc/amd/ps/acp62.h
+++ b/sound/soc/amd/ps/acp62.h
@@ -52,6 +52,9 @@
 #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
 
+/* time in ms for runtime suspend delay */
+#define ACP_SUSPEND_DELAY_MS	2000
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 4140fb42a7f7..7e2f68d9fc2c 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/interrupt.h>
 #include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
 
 #include "acp62.h"
 
@@ -258,6 +259,10 @@ static int snd_acp62_probe(struct pci_dev *pci,
 		}
 		break;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_allow(&pci->dev);
 	return 0;
 unregister_devs:
 	for (--index; index >= 0; index--)
@@ -273,6 +278,35 @@ static int snd_acp62_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int __maybe_unused snd_acp62_suspend(struct device *dev)
+{
+	struct acp62_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp62_deinit(adata->acp62_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	return ret;
+}
+
+static int __maybe_unused snd_acp62_resume(struct device *dev)
+{
+	struct acp62_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp62_init(adata->acp62_base);
+	if (ret)
+		dev_err(dev, "ACP init failed\n");
+	return ret;
+}
+
+static const struct dev_pm_ops acp62_pm_ops = {
+	SET_RUNTIME_PM_OPS(snd_acp62_suspend, snd_acp62_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(snd_acp62_suspend, snd_acp62_resume)
+};
+
 static void snd_acp62_remove(struct pci_dev *pci)
 {
 	struct acp62_dev_data *adata;
@@ -286,6 +320,8 @@ static void snd_acp62_remove(struct pci_dev *pci)
 	ret = acp62_deinit(adata->acp62_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -303,6 +339,9 @@ static struct pci_driver ps_acp62_driver  = {
 	.id_table = snd_acp62_ids,
 	.probe = snd_acp62_probe,
 	.remove = snd_acp62_remove,
+	.driver = {
+		.pm = &acp62_pm_ops,
+	}
 };
 
 module_pci_driver(ps_acp62_driver);
-- 
2.25.1

