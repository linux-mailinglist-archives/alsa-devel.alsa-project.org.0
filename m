Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97249428660
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 238D71612;
	Mon, 11 Oct 2021 07:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 238D71612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930928;
	bh=EFOD2znPIv7NA2mhHm+282CtCT5vO4mKqAYHakew7Ww=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EstkT4nv8QcuHaBDI1SrK8zZdrsowp0MFfhQz0ZN5nwH6azsUyzBt50uXimKeNV2M
	 X9pjFve7tNXhtBdnvL97lGNqXVyZu7gnrUbb1kIqH7Qj4Tk1q4tdw8IlIuYHKlnHyC
	 2HtBv9GdXoUqLyBJcTtR44/VlyPAzNBQroNXVw7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCF7F804FC;
	Mon, 11 Oct 2021 07:40:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E144AF804FB; Mon, 11 Oct 2021 07:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE302F80511
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE302F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="xXQiDOWw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaNrJ0dp/PjOCE1h/Hvkibrsma82Je82fOwMv+/Q63FEImcffWPBl/PysylB8luTubXSLnFJEKVy00Tq/Azk4CI+wkRLUhhVdAyMGt2KLlpaboxY8nES1Z4CWNatZ5ZRqg8KNObhDs1Sij8HQgNt6SyxuQ6PjzqWOCOruMQGeGGQL2gxloGl2rsJWdheam9M/E1tBVMy6k6NK7oiUmwhTJj1wSETis2RRolVNaUvUOVNC00YSGowXB4RVhEDu977MEd+47BCUPZWJuyCO8ZCi3j0RNMpLXtPYz1LA29dlYDjjnvyVsNG9ZSLtcwWw1morwiLsRUWujPEz/z14fjpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUbQ5dk9Qx+qM+XaWzj3zlKoSYxHMJUP5TBqiIb7xRs=;
 b=JWIxf8/WTpL3HZtDox6xy5eQV/EXbYOSnyIa1f0EfovOnn/8Hunw0Wh6FHXJVak6i3JI5HKM17QHlfrrW0eD9tUQ12XjrITgHTCMFtMF06cIyTiG6AiNWfbaOU4SCk5FBW13F9Ye5YTk2nq1SfWUVNUciUAXzRCinTJKgzhLnrJXeZdGIr+w7Nw6YWWjqdZxn0VaG95z8UROLSUJakXzcJ7/2HkZHglG6yHYaH7PKwogRsfDZ6v7gGjpqxwdo9OWWn0Q3RfgzptKF28tv2gLS7AKrthViRE3x+PEKFKfb9qFtoe4TUiKjMOQ4DkmPSzBpDpzZvUxRvWCpFooHMzbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUbQ5dk9Qx+qM+XaWzj3zlKoSYxHMJUP5TBqiIb7xRs=;
 b=xXQiDOWwsjW2ody3+Ph2ADfK+PTQivUxu43n+gC5m5keBnQR+Xh64k/Oa3Akz9oNtbqS9s3keMlCu22tydUSoloVGlwv/ErN9Yu+vD31rvB/8Y2vbnA0JZazu4AQqc3d6y6TOmCndvo6uVW0Zv/LfAAQcgJPGeDi47SinJbtIp8=
Received: from CO2PR07CA0077.namprd07.prod.outlook.com (2603:10b6:100::45) by
 SN6PR12MB2784.namprd12.prod.outlook.com (2603:10b6:805:68::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.24; Mon, 11 Oct 2021 05:39:31 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::5c) by CO2PR07CA0077.outlook.office365.com
 (2603:10b6:100::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:39:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:39:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:39:29 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:39:26 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 08/13] ASoC: amd: add acp6x pci driver pm ops
Date: Mon, 11 Oct 2021 11:26:16 +0530
Message-ID: <20211011055621.13240-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7892f5a-8492-4fb1-ea30-08d98c797fde
X-MS-TrafficTypeDiagnostic: SN6PR12MB2784:
X-Microsoft-Antispam-PRVS: <SN6PR12MB278438CD79069B60C79E926B97B59@SN6PR12MB2784.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PVLVCy4PV+qXEteEr/Jb8G5DZtcDz5KvJz+61j2kx/zTRgE0wmcfqQfL+Qf58+46ItOYPZw20coPYPPtGHWQ8gr7utjwqUvmzqNbNb3ArS9uVhvafjZCTpDXKjFPEqDuVH9HpRC2qidq5s4WP/CxZD/cZCGYncXeTYmDu77y0NfQh+G3yTUA71XcI/3q/d9VlgF95X/CZeLtHS8zsvncL/LveVG3JZSbqbw5ZDiZFuJNImcVIrSBb1RQY0oKJVrGFGwtMx8thUIFZcjNArcBhv4Qzt1snBBVaz8wVjdhFG1pJ+gcvRvXx9yYDCgpiELm4ghzJAuP2WGulDlF/vSNHZ275fF445u2zw40FTQTGV46em74RpwsIPpWd1uVCkI8GqurHQA/nbH7jHtWYogMyIOlaay6+pJNRWKp7Ezv+fxveQsTva192Xip/tT1nMsHVJ8kYUrMAEswx9fKhAix3dWOcJZ3LzAa2rtDKBkcg6dIX1zxOoukTMYOL5pv1BbtjlKeK53UHYtDMxZtsy8xwWlbVWGCQGTBJsqK3gK02Sb72fFB9ZE56DNJXOS+qfCu8yZzweMbGvDjPzo3HnZnn6QBtfYPIRMJ6ngK7F8v977NLLEs5BHhYJo75gFV4CtNbi1+HAK0Vkp7emD/AaE4bQH0PMABf3jBDX0mXrC69UIiiJC9EhNC5zkarpmfAREA8CbYCNYhappkeTY+RqdPxFZdDWxTsS3BRyFe+Q90/NJmqLx2H5G9lp0/KTm4yzTQ8Obs4n6SXL3cmzGa/wbb+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(356005)(2616005)(86362001)(83380400001)(336012)(426003)(6666004)(4326008)(81166007)(508600001)(70586007)(70206006)(82310400003)(2906002)(36860700001)(1076003)(186003)(36756003)(26005)(316002)(47076005)(8676002)(8936002)(5660300002)(110136005)(54906003)(7696005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:39:31.2435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7892f5a-8492-4fb1-ea30-08d98c797fde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2784
Cc: Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 open list <linux-kernel@vger.kernel.org>
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

Add acp6x pci driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x.h     |  3 +++
 sound/soc/amd/yc/pci-acp6x.c | 40 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index 3f83de229409..b0d3f6a9d0ce 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -52,6 +52,9 @@
 #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
 
+/* time in ms for runtime suspend delay */
+#define ACP_SUSPEND_DELAY_MS	2000
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 86b33f401e12..5f07db987cca 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
 
 #include "acp6x.h"
 
@@ -245,6 +246,11 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 		dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
 		goto unregister_devs;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_allow(&pci->dev);
+
 	return 0;
 unregister_devs:
 	for (--index; index >= 0; index--)
@@ -260,6 +266,35 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int __maybe_unused snd_acp6x_suspend(struct device *dev)
+{
+	struct acp6x_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp6x_deinit(adata->acp6x_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	return ret;
+}
+
+static int __maybe_unused snd_acp6x_resume(struct device *dev)
+{
+	struct acp6x_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp6x_init(adata->acp6x_base);
+	if (ret)
+		dev_err(dev, "ACP init failed\n");
+	return ret;
+}
+
+static const struct dev_pm_ops acp6x_pm = {
+	SET_RUNTIME_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(snd_acp6x_suspend, snd_acp6x_resume)
+};
+
 static void snd_acp6x_remove(struct pci_dev *pci)
 {
 	struct acp6x_dev_data *adata;
@@ -273,6 +308,8 @@ static void snd_acp6x_remove(struct pci_dev *pci)
 	ret = acp6x_deinit(adata->acp6x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -290,6 +327,9 @@ static struct pci_driver yc_acp6x_driver  = {
 	.id_table = snd_acp6x_ids,
 	.probe = snd_acp6x_probe,
 	.remove = snd_acp6x_remove,
+	.driver = {
+		.pm = &acp6x_pm,
+	}
 };
 
 module_pci_driver(yc_acp6x_driver);
-- 
2.25.1

