Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEBF3CFF44
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 109B6169C;
	Tue, 20 Jul 2021 18:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 109B6169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798343;
	bh=ECKZl09woiJOLqCPMRwG68W3nKKChFnmxyCFPWRQwaQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DqzXbwDNjUmO4uZZ7JM7avt/NiKvaRc9t/nqVMoAd7eJX1uUghtcgRF/yTKvSFGDf
	 IE1cROZGQfXjn9Pldvo2NtXeSexgQZvZKU++hJNvhZzqLeB53HM1eq7VLWFWsVUQvf
	 xkS5pT5oPmPHFGCiy557buRNMTfTpqkXYr/wpB9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB974F80527;
	Tue, 20 Jul 2021 18:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27693F80524; Tue, 20 Jul 2021 18:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE40BF804CF
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE40BF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ZufyGcAG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQiNO4lyntc7hbp3YRKv+3sCVCSI02n0GhODIwalMCXjy7KHVe307RyCq/zVR6sJQmeoQooX3/S5PYhHCIPdrle0c2zL9+kVuFokMOzs/S33cqHzT5uoT7ooQp5Putz0MJD+vjl1n5MDFecEpIylYDUUKxb6HKVS293FEUFc0uIPwvdxnUfzfiHqavHUyIa/02I6y679W5Dyjsd52K5zztxWY2q9rOpoaiS0/vFlaQVH8kV10/KOACuDuG64zBUH1lDMpw4WgwipvpSOrPfjIy21YZ1UBEUKpMbSykVWEqANAnILgh/jXZTmTP6s0puxrq1QPf9Wp7GjZ+i6183fgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XobA1l++vrxesg4ZMRqffclUjEnXwpXU4R6ua2fJh5k=;
 b=fjHD9jw8lREUuqtwbOpDdJD0/2KW1iT2vaaXGTMWdzObyTEcjtInH7RalJD/3s2d5ZGEE7KLe9Jd47mLhUYZrVFq3zDN0xjdtOPt4ubm9VLZbg9ByUSa3qyUlRjJNDBkvIGRWWpc+7BiAwGUt0yMesvJfeIk49+ECRLSOEp1LW+nJMxd+aEjYcFM1AOkiQKiZ7MptCRLJBYrbF4LJABp2C4jIGj4pdzcpGlRmuhbZqZzDNAGxfDYG9CbMop6WUsuQlz7p+dAQBCTYpY7EzdL/hNjg4U+MqFi5UV5ZXZ8fqTnf81uDSZLZWNExhROM1TLVYuFmHqXmKycctakZXv6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XobA1l++vrxesg4ZMRqffclUjEnXwpXU4R6ua2fJh5k=;
 b=ZufyGcAGhok9ffM2tygpbNUU4mdrS0mAJoWTPwDTJqRaEOTEF7aJ/zWe5OoyGmS38pfIQgzd83cwYIRYVGyimyyOXQq1z72LR1NGlVxrRCrMWROd7k0xza1xRdka3NamWNoaumNhr2jUzr8nh0OUC2dWx+GoGDu6kghc1BGun1k=
Received: from MW4PR04CA0193.namprd04.prod.outlook.com (2603:10b6:303:86::18)
 by MWHPR12MB1488.namprd12.prod.outlook.com (2603:10b6:301:f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 16:21:46 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::14) by MW4PR04CA0193.outlook.office365.com
 (2603:10b6:303:86::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend
 Transport; Tue, 20 Jul 2021 16:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:21:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:21:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 09:21:45 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:21:41 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 10/12] ASoC: amd: add vangogh pci driver pm ops
Date: Tue, 20 Jul 2021 22:07:30 +0530
Message-ID: <20210720163732.23003-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ada2f880-510d-4287-7bf2-08d94b9a7843
X-MS-TrafficTypeDiagnostic: MWHPR12MB1488:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1488EEB3428367AE2A7057E497E29@MWHPR12MB1488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wgVsedyyt60S8NnJlH9fBL51/Y3FObhy0s94zutJQYhHszcEUnvPoisF/ltzDpw7TkmNIxG2b0D+mjnt1UIMQJ6LFN7rrNaZNsHFMqQBlayej51m2q6ODwL6sCwntaJVSYuX/c8M+VU7BcpNV6J90NF3wI7yauai2tWVkIZzprvfko5bsV4cKz6DQ7NiBEzgePZ9A7/mOHBSb5H+PPcx7JkUCXeMIdpEum0h0l0ckjEEl/LknKjWVhzZE2z8wYJ4foL4unrvzJpO3i94OrGaZQM5eyBwWj7Ul0Chi98t0zC5f/BFnVLCmxZfPxagmbaZgHBWZ3xbOGUuYxKvUpr5TVWUo3eQOewhtVdwhw0VaS071svJVlk1wi8yo85Kxmbhvbp6QfB9NtCVY6IdlDLXp+9EEHbfIa4E9fS2wClAKwhuCp44B0LJGGwT9lC23pQPSC0drv5vIgbw7hgRiX7wwIPmxaAeh4locEDvzGOko00TSKvWM2MOlDsiPP2jbTehrYhTfFp6hEsaB2YLt6148rJkJ742tuN5mY2EQxjdDbTC2F6CTkDHP4ASDlzZkn7+iMXGLV48d17bpEKkJTfvryrUx/g/92Q3NNXb6q/wrmDPA/9Nq3uFlUAzC2151Rv1XJNAdrzWdo6fr8qh8N7dQXqUZGHzwDvBX02/n13lRZSoA3YKC9PB8KvyZiEPxXNJYo4XI/ARa3jWb9JCU+rYuUCTU04L5w+rupalBNrPsbA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(7696005)(82310400003)(2906002)(356005)(5660300002)(47076005)(426003)(186003)(70586007)(2616005)(4326008)(36756003)(8676002)(6666004)(83380400001)(110136005)(54906003)(8936002)(336012)(36860700001)(1076003)(86362001)(70206006)(316002)(81166007)(508600001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:21:46.2652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ada2f880-510d-4287-7bf2-08d94b9a7843
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1488
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

Add Vangogh acp pci driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/pci-acp5x.c | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index 25b42a37ad3a..a57b762d9f2e 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 
 #include "acp5x.h"
 
@@ -226,6 +227,10 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	default:
 		dev_info(&pci->dev, "ACP audio mode : %d\n", val);
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_allow(&pci->dev);
 	return 0;
 
 unregister_devs:
@@ -242,6 +247,41 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int __maybe_unused snd_acp5x_suspend(struct device *dev)
+{
+	int ret;
+	struct acp5x_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp5x_deinit(adata->acp5x_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_dbg(dev, "ACP de-initialized\n");
+
+	return ret;
+}
+
+static int __maybe_unused snd_acp5x_resume(struct device *dev)
+{
+	int ret;
+	struct acp5x_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp5x_init(adata->acp5x_base);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops acp5x_pm = {
+	SET_RUNTIME_PM_OPS(snd_acp5x_suspend,
+			   snd_acp5x_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(snd_acp5x_suspend, snd_acp5x_resume)
+};
+
 static void snd_acp5x_remove(struct pci_dev *pci)
 {
 	struct acp5x_dev_data *adata;
@@ -255,6 +295,8 @@ static void snd_acp5x_remove(struct pci_dev *pci)
 	ret = acp5x_deinit(adata->acp5x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -272,6 +314,9 @@ static struct pci_driver acp5x_driver  = {
 	.id_table = snd_acp5x_ids,
 	.probe = snd_acp5x_probe,
 	.remove = snd_acp5x_remove,
+	.driver = {
+		.pm = &acp5x_pm,
+	}
 };
 
 module_pci_driver(acp5x_driver);
-- 
2.17.1

