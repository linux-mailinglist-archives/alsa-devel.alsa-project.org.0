Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E40653521
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 18:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD0CC16FB;
	Wed, 21 Dec 2022 18:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD0CC16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671643694;
	bh=KsUVLKwvFwXVIbho+u2mwejuymv8sq1zOxjkd8SSEOU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dhubWPQCTiT8SitOPHPuGi0JUIMtcIUKfBZb7EZVa/GKqOT4NQ7kk3hKsbMEBOtU7
	 //8+RW2IJVzwMUphVQKISwt5fULxAcxkgNZaKRO0+dJDIDiUtnkNeUAalPnod+t5TV
	 eUQz57+eec8ljdtr6bh3HrQWm+Hqg3iqzgAQSJ8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 409DEF8053A;
	Wed, 21 Dec 2022 18:26:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2C9CF80544; Wed, 21 Dec 2022 18:26:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C634FF8053A
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 18:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C634FF8053A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=4ctHqtsN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGBwRJcAW6EtVR4lWq5S4T11n2kKJGdsKwZl0evc48M0oMGlgyEXh1SPJjIl3llgdwcrpTWKd4881V4ym9L5uijL89e/YkWY/OGuZansvENlFfWsVDtLlBLmm86T8c3/DWY0kXEr9O1rnmOYtaBsnDVP+7ffAScIrRXCaI49jLRJ1Xki0TGDuaUb7gTu1N0z7IHOwd5Acai2yRDg2OxGhhLySAXyZjjPWMahzMvEUPIWvunLukJK9RB82U3axxqxvpvHZFbQohL6mCCxAca4AhTBPJzsFTjZq7JL9W2yZzpYE9T1K6Eodnwkg/PaxOWOT/Jkj1C34A8VWs8JRLRUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l4KBL+oE/e3tAtN6J6KA2TBGDjfJusjUQrFLnvb6rs=;
 b=hrMFAO9vHg5+PtieWgsiYwsKNuMtNmpQG1mVDkwJobeto0jO0htsusXnDlQsaaRT2I9rgW30oQEOudBZualW8akd+wwVbDL45xVOk/mOGo9/+p9xFWRqvqAJj+hvX0v17u6wSEYXOZbV6oHEmt1yoNfwSs6a2XLdUi2ueOvoibQHqwV2LTxRHOcDqA+cQyfCKagXkCys8hLlwt2KPg140/EZ+05e23qaOMO0akKEA4RbpTsxOUnFlqcFTwM+0ImN+1ETzp3eTNrl79kA+XGlGa3/H+KJs1xup9Lecinc+ZLO5qOfaPnfOp7UGaeWxJAIwOQ+DonlzguO9yJp3U9tfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l4KBL+oE/e3tAtN6J6KA2TBGDjfJusjUQrFLnvb6rs=;
 b=4ctHqtsNzeFU5huuQ53x5IHvRVzjEHmZqPwCgUyU5nKjrhgAPCHzy6rNcS6n8NtarBVPmjTWPcs0v2TEQ4flssKj0D8n2T5M1y4yxLv8jL7IWl0B8ammB3BYJIgmiO7WQl4ypTTSL8ZmwRTf22oUEyqRwEXVya85KHTgGlo4fHQ=
Received: from BN9PR03CA0765.namprd03.prod.outlook.com (2603:10b6:408:13a::20)
 by SA3PR12MB7949.namprd12.prod.outlook.com (2603:10b6:806:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 17:26:35 +0000
Received: from BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::8b) by BN9PR03CA0765.outlook.office365.com
 (2603:10b6:408:13a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Wed, 21 Dec 2022 17:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT073.mail.protection.outlook.com (10.13.177.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.10 via Frontend Transport; Wed, 21 Dec 2022 17:26:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 21 Dec
 2022 11:26:34 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 21 Dec 2022 11:26:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 4/4] ASoC: amd: ps: move irq handler registration
Date: Wed, 21 Dec 2022 22:58:51 +0530
Message-ID: <20221221172855.1618766-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221172855.1618766-1-Vijendar.Mukunda@amd.com>
References: <20221221172855.1618766-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT073:EE_|SA3PR12MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 07d63ac8-4029-4171-89fd-08dae378825f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EXYKxy6BtTkriklTWoiNPRylLSu5OVjwBGGEPQmUzEKBqc/QXK9uY7RFh2ciRRMNEN01+ExAiho+RU0v4jdsot9K5vzNxc2eljG5IbuBj1qArL6P9Q1vVY/bY/6zoG1YQw6uLwfhwnGCJgxfXpdqziO74Jh6zQuf7MOrRRAqw4gPkhosWe/CJ1FUrA0cEoxkHTrwpRMSQNCD2ZQkzLHs87dJKMq+T5UVEbX5PFOSHmYCPVExN0B9FV19qEAQY9BW8QtFsXfCFToPhmpaMp+6AICqhamCwiR/8iQFXZI58ZsH7kMxiC3wjbYVj+b6/ZETwO52qpSlVqrC8fPO90E/3lfOA9aB5Q83Kx+ku3Ncu3wM5S6PfPuNvUE5FA1isWDXqCsibY1nIirxAQmrKHv+sngMqkmjSzWhJ6rLuJeCp8Vn4AWFBsrRGMLfmH4j7jlzC+gOf4ERmjQwvk9FHeNWl0qgPa5j+21cXq97q3vJF/YblGn1+P1/TxrKB932hQooTAs2AQSBVmOP31TryDnPsMRRE/CTKGaReN7UmX+dNO8YkpVMdyb/MsmgrYFkw+dXoIFbR6zy1vCpVnEHHJ6w5e1Bc1gIYNy0ID+6ASCtb21N8a2qieaK61bULnxQhfuUyCNxefI5DZ6VljanMR9tVqQUKRzFSKvMtJA/rfECvFRXYhOc85dW8jXoehmqW8yLWCQZeRa1NVnKwpYGmT99Sg3xWsCeoyViyDrp/YzijQc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(478600001)(7696005)(6666004)(2906002)(4326008)(186003)(47076005)(426003)(40460700003)(36756003)(2616005)(83380400001)(1076003)(8676002)(82310400005)(5660300002)(82740400003)(36860700001)(26005)(54906003)(8936002)(110136005)(336012)(316002)(70206006)(70586007)(356005)(86362001)(40480700001)(41300700001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 17:26:34.8757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d63ac8-4029-4171-89fd-08dae378825f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7949
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Move irq handler registration prior to platform device creation logic.
This will avoid irq handling missing scenario when platform device
raise interrrupts during it's probe sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 4553e81da164..401cfd0036be 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -286,6 +286,12 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	ret = acp63_init(adata->acp63_base, &pci->dev);
 	if (ret)
 		goto release_regions;
+	ret = devm_request_irq(&pci->dev, pci->irq, acp63_irq_handler,
+			       irqflags, "ACP_PCI_IRQ", adata);
+	if (ret) {
+		dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
+		goto de_init;
+	}
 	val = acp63_readl(adata->acp63_base + ACP_PIN_CONFIG);
 	get_acp63_device_config(val, pci, adata);
 	ret = create_acp63_platform_devs(pci, adata, addr);
@@ -293,13 +299,6 @@ static int snd_acp63_probe(struct pci_dev *pci,
 		dev_err(&pci->dev, "ACP platform devices creation failed\n");
 		goto de_init;
 	}
-	ret = devm_request_irq(&pci->dev, pci->irq, acp63_irq_handler,
-			       irqflags, "ACP_PCI_IRQ", adata);
-	if (ret) {
-		dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
-		goto de_init;
-	}
-
 	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pci->dev);
 	pm_runtime_put_noidle(&pci->dev);
-- 
2.34.1

