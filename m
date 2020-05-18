Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBA21D8004
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B09A175A;
	Mon, 18 May 2020 19:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B09A175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822654;
	bh=6JSXewECgA+aZm24vbvGPei8khwqxmjPmDl+VipwPQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UM2A73wtpQtV9qntSFaQHUV0B/7EEzfKIV/tFTGmZRBbYTZc89AESn9KLAm+SCi4Y
	 SKsWGZZ4Zue+nZYpcjF9BL490/nOviIjeMY9dyq0/kz5zzvrv2OnatdqqL30wu6Gn+
	 CDtnhPRfu78zlDtZ+Sh4ZByIdswfZw84RK5mEAec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F40F80303;
	Mon, 18 May 2020 19:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02317F802DF; Mon, 18 May 2020 19:17:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59314F80299
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59314F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="RdPtADLZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpbMvP2VtJfIEgjRb4C4t6F1pJ5787KiozILjelU2FqmmbBY15IZeBxhxiYzHsUp1wDox+3muhDXN14dcwzkGKOEFvxlI8v/F/cdR72zZdhaUEAYYjegocplWgIvyh3K0PyN1mAA7nmCQFEFFekTn1uk0dObujIxudU+10289CKaw21XvETa5waLja7zV6dGMZpqz6fNjcO1TyRNxoVxA2PoEVlTzCVOuSi5qSoIvNYaSWCp4Stl2zFSGDLBUbDQxpjsMHE569T/b8c/mZHJrXz4l2p5uMVuG8sxkrw2s0SSan0qVw8VPUQWPls/0i6SE9utd78XbwrhyLruucPWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM6UszcnvUBCpNEatuNDYLApj4MY9YvCj1wgKkMYf+w=;
 b=lvRiJvvUQWRAYocJir+xBipIjvF/dhdclg6FAr/7Jobm+RLmpGwiIY31SxeuynRnWZQ+lBQlmVqIYVEpGACcjO0yU8YJ/+dKVP9jg1XfLQSc18N75yxu7Qfi/nUBEuK04K58EJex27VbvwHgYcMr0vih2BP1bVCvbAlOt7u3C149YE/R2i4425lzMDhRIpYi2yxXiYe7Qs88uJj6pPyQJkYIsD2763gaLXxrHTU1yAx9q1NMzpgO5Hx9wRnksKVGaWAiUxEfGjn4qQNQXsg4nnpdEIYXKMABsJ+AxTBzgUFLjpFH8LUOik+B9B7okOsuhnLF8dU8GU9+peGyCEumYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YM6UszcnvUBCpNEatuNDYLApj4MY9YvCj1wgKkMYf+w=;
 b=RdPtADLZ/Zqdi/yymms4wafFi2W2U99rUbYP37woRJuLfaRHIDqY7iqhr+HIOaDCwA8D5PT5VKm3UUsiCv6duD75F7eMHT0ePwnzX/1bUrPGh6yE0haRAgSocQPnkvQ/6/tyjJ91in0DMOrHou1gQ8n9lJefz7aX7iV0QvmnRo8=
Received: from MWHPR1401CA0010.namprd14.prod.outlook.com
 (2603:10b6:301:4b::20) by MWHPR1201MB0174.namprd12.prod.outlook.com
 (2603:10b6:301:55::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 17:17:25 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::ac) by MWHPR1401CA0010.outlook.office365.com
 (2603:10b6:301:4b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Mon, 18 May 2020 17:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:24 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:23 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:22 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Date: Tue, 19 May 2020 01:16:59 +0800
Message-ID: <20200518171704.24999-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(36756003)(2616005)(26005)(8676002)(70206006)(70586007)(426003)(2906002)(336012)(478600001)(6666004)(4326008)(82740400003)(86362001)(47076004)(5660300002)(7696005)(54906003)(110136005)(316002)(8936002)(1076003)(81166007)(356005)(82310400002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2a4aada-21d7-4ecc-7c87-08d7fb4f556f
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0174:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB017456BA92AD87D4F401128C97B80@MWHPR1201MB0174.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1cUb33BjH8Q960UqZtYzakYwhAqnjybKFraM/qTpuj/PHLpuzXGNQEcb7xgZZ2x+9mm1FhcpsOBhAXXs8DJqrGLP6OqZnwz4laekXuZA46/ApUpBCHIbzdlgK9bzSwJrEqs+2yEaHFYQPJ/XeA0k50E1bqlWRBtevR9ZOaR+CPHJT24Or9mQCxExVdwk1XeS1e+yBzRX1DOg6AX4BUb5eTzuqD2SCmkoe18BU4wLXenrxf/k9m74dYcfQqXa6/mxFNZIsTB6+XYk5VtbrKAKmUf5+4qWbhsqY14jXjfN9uWnOdbopEqyVX1ftpOpBPRQ1P9gaZUagO2e69wqhso7L4djboUFeHsky9E9w2Cp8drvOdnOSjzUhy6DapeNU1TgzE2UxY9M76ZEi0wBSVNhdENRzhHMEj2r1I+m/TM0C67bgbfjJaFWLBPozkCHLFCCRR2iQBSpE9wwon8gCclLj6CdJAcRP5+FoQK/AB0pi5nBQkSHmX41Q/bDtQZXGmcOAw+OAUuaYCHtzMbjJoBsLQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:24.8963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a4aada-21d7-4ecc-7c87-08d7fb4f556f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0174
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Add Renoir ACP Pci driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
Changed PCI driver PM runtime sequence
 sound/soc/amd/renoir/rn-pci-acp3x.c | 46 +++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 362409ef0d85..71bfae644372 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 
 #include "rn_acp3x.h"
 
@@ -233,6 +234,10 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 		ret = PTR_ERR(adata->pdev);
 		goto unregister_devs;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_allow(&pci->dev);
 	return 0;
 
 unregister_devs:
@@ -250,6 +255,42 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int snd_rn_acp_suspend(struct device *dev)
+{
+	int ret;
+	struct acp_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = rn_acp_deinit(adata->acp_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_dbg(dev, "ACP de-initialized\n");
+
+	return 0;
+}
+
+static int snd_rn_acp_resume(struct device *dev)
+{
+	int ret;
+	struct acp_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = rn_acp_init(adata->acp_base);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops rn_acp_pm = {
+	.runtime_suspend = snd_rn_acp_suspend,
+	.runtime_resume =  snd_rn_acp_resume,
+	.suspend = snd_rn_acp_suspend,
+	.resume =	snd_rn_acp_resume,
+};
+
 static void snd_rn_acp_remove(struct pci_dev *pci)
 {
 	struct acp_dev_data *adata;
@@ -260,6 +301,8 @@ static void snd_rn_acp_remove(struct pci_dev *pci)
 	ret = rn_acp_deinit(adata->acp_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -278,6 +321,9 @@ static struct pci_driver rn_acp_driver  = {
 	.id_table = snd_rn_acp_ids,
 	.probe = snd_rn_acp_probe,
 	.remove = snd_rn_acp_remove,
+	.driver = {
+		.pm = &rn_acp_pm,
+	}
 };
 
 module_pci_driver(rn_acp_driver);
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index a4f654cf2df0..6e1888167fb3 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -40,6 +40,8 @@
 #define TWO_CH 0x02
 #define DELAY_US 5
 #define ACP_COUNTER 20000
+/* time in ms for runtime suspend delay */
+#define ACP_SUSPEND_DELAY_MS	2000
 
 #define ACP_SRAM_PTE_OFFSET	0x02050000
 #define PAGE_SIZE_4K_ENABLE     0x2
-- 
2.26.2

