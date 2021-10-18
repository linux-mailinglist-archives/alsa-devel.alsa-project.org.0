Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B458431736
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7695192C;
	Mon, 18 Oct 2021 13:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7695192C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556356;
	bh=jSq5uZQ7v7egtlryAPTa/r59KOLus+creyKVg4Zdouc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iNuOSElBZSW+5imHuog678WU/z+/J/nbfj1QNVzTpXfIAg8IAQsKqREgu6lFq9scF
	 QQXl2dugQ7AU7l5+ntY61nXZ7qs3LuykAT5+wJNTbiQlw08ftaeKfKpku7EbPm62Ux
	 1RSvS+26hRKCgkOosg+JBGQIxfSIVNWd9Oepe0wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA753F8052E;
	Mon, 18 Oct 2021 13:22:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9CF2F8052D; Mon, 18 Oct 2021 13:22:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0E37F80525
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E37F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="i/JByE8p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjyS9KmqCHiTYCzjfmySTUmti7EHqavZH8kpoG01cLyXP/ijZBGAjOZ9wjSUWASSfOsem7brR4K4vjoFzc9ri5BLcivXDcuzgX8dXVExoE/281Tl4sO8dzL1TZDRfdpe2nZuLaXS4goBiwln4NAlOQbiuqzDNU0GSv1M+cGQvOBTVU5skcRdggE10ZLGCBhOVpCKH9UY94k4Sl79QWejKWQlXZ3sqMlWDMmtcZVs8IbkRr+ZIPkPZIre88zkTz/74HUPW/bHTi2kGtIXuGfKzKEK/XYBWI2MSJaKnB6Xgf5Fo24/ryd5FMRU3kQHqfBnLhYURb+QJskp754/B+UzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLfKii4PNOqf2E3URkOyHKAxmrPMX+PQJPAwJQzoF28=;
 b=OSix9KL/sq+tknuFLuBT8arjbL2hVHTuBOFY2e9cek7zaW2zdeuhfgnmieAkntd8irICt3ERowEf3r+VlAcWJmCV9KFLHs5O6AMvXuoIh3oEcTodAmyTp8EyQbHDuePYidS0FhVYZ1bIRCaV0nxXBMhbfp47s6W8JffUyZJw5tQRlnejqWIRDaT8QIQmtPFjculT9qX0V+BwaFP9K0H2l9l60SEPV+k4Kq0lnEM3I/wr2zgs5afn9Kx5I9i8Ap3LZ2WuXIJReYAoKicgw74tlBItzm9UUkXo2ai1UpYWaF4yNbENaXngNyowqbxQ/WfE/7dr+9Muw0f7Izb0ZPuiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLfKii4PNOqf2E3URkOyHKAxmrPMX+PQJPAwJQzoF28=;
 b=i/JByE8pnSEPZ6ptNWXRpIhmS0HTP8CPK17uHS/oZF/TLaYT8nt1YYKe3MEK3VaCJn6rk6HWoxirerpZ60MyrsK984IV7OeVAp5kCmkaNOFZgJxb0nx07cHx58l51MxM4W0iLnZQgn9NH7u15RZuprfXupAiGjPOC8WhIwvPK7Q=
Received: from DM3PR12CA0118.namprd12.prod.outlook.com (2603:10b6:0:51::14) by
 BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 11:22:37 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:51:cafe::b) by DM3PR12CA0118.outlook.office365.com
 (2603:10b6:0:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 11:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:22:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:35 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:22:31 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 08/13] ASoC: amd: add acp6x pci driver pm ops
Date: Mon, 18 Oct 2021 16:50:39 +0530
Message-ID: <20211018112044.1705805-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93d2fd50-be21-4f30-a7b4-08d992299660
X-MS-TrafficTypeDiagnostic: BY5PR12MB4180:
X-Microsoft-Antispam-PRVS: <BY5PR12MB418059DFC69B793B1FB2CCA497BC9@BY5PR12MB4180.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4XIfBDERUXGSR/T9Ul5z05++r7bf66zGAFvGqwu1J/XiDzxjrOPn4isfCGCGgoG4olCY4If/wv+32e4CoK0RjtRApDPAl+hM5DpVOAmaz5ltBL3bUDI//IRmn5UayzzRq2QgY68Cb/7qN/b+4RnmVfml7ZjCSyUfiqRQyiXIr2pjdednNdVuPMXfh2JC0JGTUEkYusUcqLphLyJGgMFYyXL70N4zpo5wWs3DU8gAp+fpR/dudtUwoC1lTdkLK2LUa8S/QwnF3OtLff0R79Y34nna8TwHdGnLKfw62hXwJedWPt7Nlw28OqqzRmBZBdaLAbAzQyRodDws3Ygpl8P4SgHK18cKwGb6ottqXhw47C0W+C+e71HH/J2UAiffiZiU/QToUAZOHMxloHs4Civ/ZVKLVwBmoHA5YMS+yHbri5Rzjzl/5gajsD8HgkANSdS4etgB7asM+QlSi1qM1GvvB1Rc0JNlgjHJLLUIBdaq5ivTxeH/QkX3zDZARMS3jf/veVtek2hqSP//Im6WVIMnvyQOrhwvCgVg14i1dkDlTEEnw9T8u7yrssilZS/lpN+v04a0ZuXZQRRuY/3ZHKiNTSV0pu4acyfqmJFWth+iH6WIPb07ZnGIdCIeBY7PaA/OsvSPyR6y1nfdNTMYigvlPeRsh1xddrKYGjjenC9aslRXDYVKTV9ul1deEO774OvQ4y48cAyxskrNjZCg5TcGjgw854Xlsi9E7KrdWCEFY50Gz/3h2P2ilVcMplNqV5ut+sQ3n9o0veMDd7nGPYBdQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(186003)(316002)(426003)(8936002)(47076005)(508600001)(356005)(86362001)(54906003)(1076003)(83380400001)(110136005)(82310400003)(70586007)(36860700001)(4326008)(7696005)(36756003)(70206006)(5660300002)(26005)(336012)(2616005)(81166007)(2906002)(8676002)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:22:36.3027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d2fd50-be21-4f30-a7b4-08d992299660
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
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
index baf875c603fa..cf02c542cf88 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
 
 #include "acp6x.h"
 
@@ -240,6 +241,11 @@ static int snd_acp6x_probe(struct pci_dev *pci,
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
@@ -255,6 +261,35 @@ static int snd_acp6x_probe(struct pci_dev *pci,
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
@@ -268,6 +303,8 @@ static void snd_acp6x_remove(struct pci_dev *pci)
 	ret = acp6x_deinit(adata->acp6x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -285,6 +322,9 @@ static struct pci_driver yc_acp6x_driver  = {
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

