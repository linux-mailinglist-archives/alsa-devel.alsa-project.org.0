Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A81803CB932
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 341AC1695;
	Fri, 16 Jul 2021 16:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 341AC1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447363;
	bh=NCqLwD0uap5+mnaady5EPea7baP/7TELyKMSEi8WsUM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBBJ9/9m8iEXP+gbw6E6MaiJ9NEIs/9j2kubNX2JjwBGzNjE/kOiGdDz34kPt5Vp9
	 dki2FAGgD7oKoC1n8KD8HZdVbHg36vVfDPs1E5vfg3Nop0j672rVyffgvoOFx+9VE8
	 23NtkohfT3VA2k3FR8MOMU/6bslm4K/5STU+3EqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 676B1F804E0;
	Fri, 16 Jul 2021 16:53:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5CFBF80508; Fri, 16 Jul 2021 16:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2088.outbound.protection.outlook.com [40.107.96.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A0E9F804FD
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A0E9F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="T40xxWET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RH5IDugglfCg9qgGQeE+1csjzJx1ClP3L/oebj5Yb0KqSrvdul5avASz3MAc5o8tJQoc9offGmQ0EEfSQRtMnJu9cqLZWqf1Urr08WUyNkTaLVNfzGg+dEgubLjdGCS2PsNXrqZQ3QR2AtA+/BEy7c1FGCjo3DxU01L0D6Nh5aNd/65Bbri9z4ls0HWEIhZJIQ/xQfgzvPgDNgaQ0tnW9jl1uZsaa3XR8sf7XaGuhpAw5EwlLM/eOALjlvYWj+ZiB2TdYFAwzxK4KhbYQ0K1/qpOg/PFyw2AGlc3GJ2LYxte6UrhocGPPj91hmu6JouQRkrpXyKM0z7ztQtLmx4FgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIEGq7GOqNrhdOZBVId9pbgE2iYD2FJkpgL23qCVSfo=;
 b=LWCUxmAOJ4pBn6ctBowxuBAXbNLyoxHGzmJVuohKEpq0yfVuAHgnKXI+yaGvpTRZV8dHl+6Fwt7A/eYUXAxFMJPi56+yKRuyQB8Ml9US0AAXZ1s4ZibF0bZg5WzyrU1/ZhIRD6V+WwKCCyXXnydRoYxKrZb02twedmoye91126BDp6GTeykfgU30AweNfJD2xliEnHyidZH957EMLScxcojnhbGlrFQDGfR9J6NR0Up6DScBetSfFyLYIcnBJLlHF8y89eVEgn/Tz9NvWRaxYxnJ/dfG1kbEy6WI9K1dZX0i8QGBZRo+VjR53huJJ6PJElo/IYNa21q20FrqNkVE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIEGq7GOqNrhdOZBVId9pbgE2iYD2FJkpgL23qCVSfo=;
 b=T40xxWETth5K0OVZES1WJBsxDw7aYgl/329Fp55yPeCmFo7XNuDJt4TiUfrsaz5d7X1aau0TDzS4esWAXqm2yb6gmhJFJ316vBfvvf7txzzOWAdvLrE8h6mdQksbuRrP8bcDd0LNeIEl4a61n8kYpprg1+RI/eMDeqMPkFQmfkQ=
Received: from DS7PR03CA0054.namprd03.prod.outlook.com (2603:10b6:5:3b5::29)
 by DM6PR12MB4826.namprd12.prod.outlook.com (2603:10b6:5:1fd::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 14:53:34 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::f1) by DS7PR03CA0054.outlook.office365.com
 (2603:10b6:5:3b5::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Fri, 16 Jul 2021 14:53:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:53:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:53:32 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:53:24 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 10/12] ASoC: amd: add vangogh pci driver pm ops
Date: Fri, 16 Jul 2021 20:38:07 +0530
Message-ID: <20210716150809.21450-11-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b6ec38-44aa-48dd-7c41-08d948697c0c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4826:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4826F68A111E63A183DD484A97119@DM6PR12MB4826.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dF8uKY5PqPkm0o1r2IpH13wpHZCGEu7GS3iVHV/VNDMDvo/VWRA+4KRQCJ3phHkQZBt8TK8O0jYkyF/W3pP9VhD76ASOMALxkMEey8SC7VbV8h+fnr7sQ3NCX+li0sMLv5UcygIZmaOKKIBk7Z7tQaH+GLK3VOw9ilZTrCr2pK8H3MoqRw9/cDhBazbitb4aiRBIrGkC5kehbv6sbGiwbhPQGGYNEe9BkBYtOqPrsyjeO4nBhIWrXkDRT4yf7QcKJZtArnRySKRsNey/oF0ddw3mNWu4TpKx4bd3W1c0ZGdC7lyriODb8f/GNVdzEtTkQcNDFF135rIIhOgbCeqP2QxFUrWX9Q/hyeQAsqfXRn+qzmaZzkpTBG5BLdyHBRX0uGlBoeYoLXOBFfzWq8k5BRabv5/iuIBc5uP1+P42ihaQPvPSLVQ+qCNhId8s+eZw+rj2drPfYv1Ckz5Rk0dhafUK/EdnKE7z177Gn74so4dkU1+R8h6NQN1uJOBUva/Ntj5P8CkE1J1ZHEKzPIo/siTB2Z13sikdDA9s3Q7ZzH2zRSwrMcB8vGi0Vd5Ct7MnbpmtMxgiu6u/ZXQFhbgA+UqNH/Ke/6kRX7/6/lGVD4TFF+uMKkUD1PqdmM+CeHANEmp7gi1Um1bfxkVkmAYvIFVKVBVhIRU2dXwCvHDIMBtthBrrWdeewmjnFizp3o4EjQGnI+0tIzeeK7S79Ew15TR0EMO+SQ8qIYh7lVRk4f0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(36840700001)(46966006)(86362001)(82740400003)(36860700001)(7696005)(54906003)(47076005)(26005)(426003)(186003)(5660300002)(70206006)(316002)(110136005)(1076003)(2616005)(2906002)(70586007)(4326008)(36756003)(81166007)(44832011)(83380400001)(356005)(82310400003)(478600001)(8936002)(8676002)(336012)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:53:33.8545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b6ec38-44aa-48dd-7c41-08d948697c0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4826
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

Add Vangogh acp pci driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 -> v2: use PM related Macros
---
 sound/soc/amd/vangogh/pci-acp5x.c | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index 3cc15a15b745..844614c758d9 100644
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
@@ -243,6 +248,41 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int snd_acp5x_suspend(struct device *dev)
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
+static int snd_acp5x_resume(struct device *dev)
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
@@ -256,6 +296,8 @@ static void snd_acp5x_remove(struct pci_dev *pci)
 	ret = acp5x_deinit(adata->acp5x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -273,6 +315,9 @@ static struct pci_driver acp5x_driver  = {
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

