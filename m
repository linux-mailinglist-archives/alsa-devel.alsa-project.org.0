Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F9A2E09F0
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 13:09:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A1DE16F9;
	Tue, 22 Dec 2020 13:08:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A1DE16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608638959;
	bh=2Saoby6jaKvRQqWryliTLLlT0VcnNCSYPtiVa9cl7hU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e7ATSWpIbDfNHKgVq3b6qeQibYeTBwIRemeg9bUra2ARz0U0r+n9YO41J9u7JGA90
	 sfsNu1k7/Ed2NEiPRlXAc4WcG/j5bFN9plUDLcnXzdUFyCQbc6VQv6jXoLzOfTchYU
	 rZp8b7zhG7h0qSVHkeTmTSc9Ez+CtmHMVF1E0wmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C818DF80232;
	Tue, 22 Dec 2020 13:07:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 507A1F8021D; Tue, 22 Dec 2020 13:07:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9DA4F800BC
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 13:07:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9DA4F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="YabiQDGY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0wRfAAVSYrueR0Z2pFbyz/GnhSYXJSbo6c93vgN5T9g7v6oZUtyDzTwezAjjSCix9QmVYqjBP6b0sYk3ET8iFHzE2Tb/oZviz4Q4ny4fwtJiG02lkAZUI2/cK6jwuc4nZk/+HOx0d+xjWuaSxog2hY8VBNesviaYIVI5E8G0tO8972tpgFfa+XyBCENkrOLbvlTwHbG40lb7KHyNBvJZQZqm9yOVhxR0oli87cTzJTlTOXvqq9sklExgoIKvpbIbW6jbd0pOIJm/Psmk2zR8B0QPeIVTNeFB8MrznrOwlx5NJEfp7iNjjX8QhA/9pPQUcnlCg2XtceKUFg5fsmX2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XS8GcIQUwIwhTvf6JcQ8VV94yjtp3TFatrbuqvn9cIg=;
 b=lhCj0Tb7DosA8DsHjyB0WBFzpAAc5AEuWxPC3G/iYcO//jZ/GtqTNm9JGJXr5jfxhTU2V0+QooU3V22nT9zka6xbTkdxhSiDyH4p0tPOQ9vPUG3lF8uV1CxIuidbocHNahrJLieCQJnlKo97/vxB5545tT+Vkwle/yxDPmQTxnNMjTNGl8YPnHdp0IDIL3mT3N8dPU2+zmDeg02hfgiMlswXWWiHFEd4LkkkcBBjMZqeCHkVXwoGpfX97/O6CLNntR79C1gJIFYPqqpgoCEu+A4M9riJwjXyuzKxY+efmv8Ko2v2lJdNNCCrU3Hrw9QFA5jEVo1nXSSxqdHriRmyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XS8GcIQUwIwhTvf6JcQ8VV94yjtp3TFatrbuqvn9cIg=;
 b=YabiQDGY6+Zcm5k4k+T5BqR/pcMich17gvgdhBAGUTg56EtzNQT2P0kzO6weocVvIJGEzuL9rH/G06+uVoWKMKacy/WmAJH2+QOH0+2GzVi5T5tQUCFim/5EG2m90/kv0ladY0NUbyW6yxAxwJ9B8kniHJo8nx1irLQnh6LsZhY=
Received: from BN1PR10CA0024.namprd10.prod.outlook.com (2603:10b6:408:e0::29)
 by CY4PR12MB1799.namprd12.prod.outlook.com (2603:10b6:903:11c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Tue, 22 Dec
 2020 12:07:19 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::48) by BN1PR10CA0024.outlook.office365.com
 (2603:10b6:408:e0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 22 Dec 2020 12:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; gmail.com; dkim=none (message not
 signed) header.d=none;gmail.com; dmarc=fail action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3676.25 via Frontend Transport; Tue, 22 Dec 2020 12:07:17 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 22 Dec
 2020 06:07:16 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1979.3
 via Frontend Transport; Tue, 22 Dec 2020 06:07:13 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH] ASoC: amd:Replacing MSI with Legacy IRQ model
Date: Tue, 22 Dec 2020 17:29:18 +0530
Message-ID: <20201222115929.11222-1-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 166cabef-dc8a-4eaa-c75d-08d8a672207a
X-MS-TrafficTypeDiagnostic: CY4PR12MB1799:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1799560966B1F0AA53F84B7BE7DF0@CY4PR12MB1799.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m9Ut5QIfmMhi5THJidDsqJSs1M0YdkjkFFi1reqLOywvPW5h+vf+cKkwWu9WncR5b6EwAPU0aHs+H3Ob5oWvP6wNp8NcmZXGUUW6M0x8Qcv+MGhDJIS9jqeUojHOkIYfUjI2q6k4ZFEF1K1VavVL7PQVdtzuAeMYtxXONsq0fAtMvq6IRU72XQvKl7JzrlFBmaSgCE1SSyw0AXe548O5/lPgVgrh2PmFK2ZRBQgDNc5BXK550HgbbH5LpecSUY2wwuLsAihCHJdxJtYkl+St0zsPfwOoLHn9+n63EKnzPOQyR0wXjL3b9oB8RZ4IaqMBe0g8wUqXPpZfVMbJiUH/EH+fs5+hh6icJuc3bHdO0i7ogLbf7H9hno6LEYoLaykkgpbUAXrXWbq0n2jCMGUEYDva4wLcTAdGEunMvABsPLXisUG0imQ8Mb900LV3HNygB/Ck2ChwprTMbNq21Q9zEfyDk3Y+qrD+KC8dJmOEMJE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(336012)(2906002)(70206006)(4326008)(186003)(109986005)(54906003)(81166007)(356005)(2616005)(26005)(478600001)(47076004)(83380400001)(82740400003)(8936002)(426003)(316002)(82310400003)(70586007)(36756003)(5660300002)(7696005)(1076003)(86362001)(8676002)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 12:07:17.3885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 166cabef-dc8a-4eaa-c75d-08d8a672207a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1799
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Dan Carpenter <dan.carpenter@oracle.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

When we try to play and capture simultaneously we see that
interrupts are genrated but our handler is not being acknowledged,
After investigating further more in detail on this issue we found
that IRQ delivery via MSI from the ACP IP is unreliable and so sometimes
interrupt generated will not be acknowledged so MSI model shouldn't be used
and using legacy IRQs will resolve interrupt handling issue.

This patch replaces MSI interrupt handling with legacy IRQ model.

Issue can be reproduced easily by running below python script:

import subprocess
import time
import threading

def do2():
  cmd = 'aplay -f dat -D hw:2,1 /dev/zero -d 1'
    subprocess.call(cmd, stdin=subprocess.PIPE,
			stderr=subprocess.PIPE, shell=True)
    print('Play Done')

def run():
	for i in range(1000):
		do2()

def do(i):
    cmd = 'arecord -f dat -D hw:2,2 /dev/null -d 1'
    subprocess.call(cmd, stdout=subprocess.PIPE,
			stderr=subprocess.PIPE, shell=True)
    print(datetime.datetime.now(), i)

t = threading.Thread(target=run)
t.start()
for i in range(1000):
	do(i)

t.join()

After applying this patch issue is resolved.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/pci-acp3x.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 8c138e490f0c..d3536fd6a124 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -140,21 +140,14 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		goto release_regions;
 	}
 
-	/* check for msi interrupt support */
-	ret = pci_enable_msi(pci);
-	if (ret)
-		/* msi is not enabled */
-		irqflags = IRQF_SHARED;
-	else
-		/* msi is enabled */
-		irqflags = 0;
+	irqflags = IRQF_SHARED;
 
 	addr = pci_resource_start(pci, 0);
 	adata->acp3x_base = devm_ioremap(&pci->dev, addr,
 					pci_resource_len(pci, 0));
 	if (!adata->acp3x_base) {
 		ret = -ENOMEM;
-		goto disable_msi;
+		goto release_regions;
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
@@ -162,7 +155,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	adata->pme_en = rv_readl(adata->acp3x_base + mmACP_PME_EN);
 	ret = acp3x_init(adata);
 	if (ret)
-		goto disable_msi;
+		goto release_regions;
 
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
@@ -251,8 +244,6 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 de_init:
 	if (acp3x_deinit(adata->acp3x_base))
 		dev_err(&pci->dev, "ACP de-init failed\n");
-disable_msi:
-	pci_disable_msi(pci);
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -311,7 +302,6 @@ static void snd_acp3x_remove(struct pci_dev *pci)
 		dev_err(&pci->dev, "ACP de-init failed\n");
 	pm_runtime_forbid(&pci->dev);
 	pm_runtime_get_noresume(&pci->dev);
-	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
-- 
2.17.1

