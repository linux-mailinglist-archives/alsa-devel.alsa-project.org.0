Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810CE5A390D
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 19:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE60161E;
	Sat, 27 Aug 2022 19:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE60161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661619771;
	bh=B2E9l8xGAnjFlfpWR4CnaDLYx5WkuCCGC+b8ts6Lf88=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+cSdUSMwdiR5UIz4D8WMwUXJHLc+26jkYKkvg05SejqjHoI82zNB+P09d/sAaY6z
	 GTjIJ11ehwzrVs+6Q7G4ebe/3Unt+0NvQt/MSiaw5/tH3T3/uD4ZOpX/UZhJAZQxi5
	 sCkZfLbYSK2H8nUzaRc/PX0U5dXhbcNyVM0Y38Gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F173F80566;
	Sat, 27 Aug 2022 19:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60693F80567; Sat, 27 Aug 2022 19:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23B53F80564
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 19:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23B53F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="WJOhrhLF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So6PpzVYuvEv0bBhpOKR6/4gjiGL4c4Y7rzVBGc19SBjw+y66OFk4L9ZdxiGgO3NS4LuOq+s/pr0n8vncLwuLzJYledqUBEwh5GLD5XIE17sP1JYkcKB/KATxDScNh+JE8h974zC02wD9AcSDkHIbPz95UD/aWZ7SqQYhfeYG3CLaJnF2zFDRQpr0dL1kvFF/Sjc4yxUBpXBuRlkwXH9kwPwrnRJgAhdhm+zBVDvZtriXjvCuvPfDNPMAIGs/cXxD8sn41NEZWZG5FHOtwfl988B/md4VgL9PtrW2yW1ad1Qu3qp8SewC2KCuw68qHgFpXw7wqwJ9NapHVET4ZJHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7vhFRkqFyHu7AN+afeQ91y0G2jtowyCxHTF+C3uNNA=;
 b=M2iEjDg7USzepefFBwNPw+cfYoUVgBl6RDf1BGhKvM1lSi3mPcTp/kXsEE6S+O+WOT4OQxjFmSoJV/4MCUPjdstRPTlYF3TQobLf5BO9k/qJ8lWw0G60n2ZSYx6tDcR5E1iN6K/kKFqvLwWpKwdzl57uvy+8B0h5VVsiV5MbSn/tjGEbP5tDN2lJXefrts7IDf0Wu785dEzxoIjoLZEQIw1CkGXNiQVPdmd/FmxPh57cZZsp++wTg0R823/aZ9NjFKJ/EzgK63Etlv7l16r+lUUg43Y5WNbWzXeClaY2JG5kq23LNvxbkTTdmjIKiK9mM7mCiu+cDSR0Y3J8Xc7Rgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7vhFRkqFyHu7AN+afeQ91y0G2jtowyCxHTF+C3uNNA=;
 b=WJOhrhLF3iHYO+oPqy3i1LUfcPPvqIxuwd/IPRuBffjiO2MqcSu0C0ULo47rWRK0AofO8sNFnIMY8kHOXcNvlnvtmyigj2bFheatmEtN6Oc1DajE/geqNb5VrayyTydhF40HcfEgNZTOSfv/FyQI99/vVvmp/lAQ6HzgYt+h/BY=
Received: from BN9PR03CA0718.namprd03.prod.outlook.com (2603:10b6:408:ef::33)
 by CO6PR12MB5411.namprd12.prod.outlook.com (2603:10b6:5:356::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 17:00:24 +0000
Received: from BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::9) by BN9PR03CA0718.outlook.office365.com
 (2603:10b6:408:ef::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Sat, 27 Aug 2022 17:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT078.mail.protection.outlook.com (10.13.176.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Sat, 27 Aug 2022 17:00:22 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 12:00:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 10:00:21 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 27 Aug 2022 12:00:18 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 08/13] ASoC: amd: add acp6.2 pci driver pm ops
Date: Sat, 27 Aug 2022 22:26:52 +0530
Message-ID: <20220827165657.2343818-9-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
References: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d8d50e5-e372-4a0f-0875-08da884da11f
X-MS-TrafficTypeDiagnostic: CO6PR12MB5411:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFl+HDr8Tjfgh5kwrSq4vDAt8vxmR0rRv+6SxWZJCATrVXGa6BewLKe96pgy2ORbFsDfgqkXYwXT4x0HKvPFpXjPFQOD72vuV7oJO7oOQWQDuEguky8X9LD+GP7Jy7cUjNRI8iqwImhuBSNP62fvtwCygOozHbRDtSywyFWoAmks0lQKqv67xyy1VOUsq4Yj/C9QUbYlEAWdeF6qG9mGeDjmD5IF3g0vtIh02EuLm6ipPTCvYZgYWs0oJFY8HZMBGtPPO99gyT8lkl76fJ8Dnwi4sW79ja3ojaEkDBv9ul+wLg/8TyMLg9Xb8FDzAid9Feu24/yMejsIAPJkNPDa6IBVH9V8IQfT4FSim/yH81BWuS+LazC0U/wZBVSQ1CN1eFsgL4ILds9tdR5GlNcf+Z1X+F18Xyd3dlBFbb0/ayuBumry4/mE5f33br+MGCb980HtN+zHqi8UA90fdPzcK6qMODZQrYht2GLGT0eDOrPs0/5jZx0QLoxLjwaio6hweYfHQ8tLl8fvXRV8oyRO15TaUSl+esRsHnc+zWbwx9eehigfUWOfENZckcWP0CsYN3RCcJ7T/HWIZLYkzy6IK1Ik/q7Fb+toJZ1+pQv2I0qhmSIjAtiWCISkg74Drq+sqNRNUrZBuIbmPh8LWBX6mOb3IAbVC5Br+Q+sC5fE715ewJT81b+wMmp6Ry8mg56ZrH0Vbhpxg22OtT4sFNYSWOm6QXIDmmjq8ID9J9MedSM70s36j2rpN98Jovt80decLMfBU/axo1hbamYvIRtoAQFlKSpk5gZsKhngyfXgTt8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(36840700001)(46966006)(40470700004)(7696005)(356005)(26005)(82310400005)(426003)(47076005)(2906002)(81166007)(83380400001)(54906003)(110136005)(82740400003)(36756003)(316002)(8676002)(4326008)(70586007)(70206006)(5660300002)(41300700001)(6666004)(8936002)(36860700001)(2616005)(186003)(1076003)(336012)(86362001)(478600001)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 17:00:22.2746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d8d50e5-e372-4a0f-0875-08da884da11f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5411
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, alexander.deucher@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
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
index 589c974f9997..89ff14007e5c 100644
--- a/sound/soc/amd/ps/acp62.h
+++ b/sound/soc/amd/ps/acp62.h
@@ -51,6 +51,9 @@
 #define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
 
+/* time in ms for runtime suspend delay */
+#define ACP_SUSPEND_DELAY_MS	2000
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index e4ddd80d0dd4..075d9a23205d 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/interrupt.h>
 #include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
 
 #include "acp62.h"
 
@@ -253,6 +254,10 @@ static int snd_acp62_probe(struct pci_dev *pci,
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
@@ -268,6 +273,35 @@ static int snd_acp62_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int __maybe_unused snd_acp62_suspend(struct device *dev)
+{
+	struct acp62_dev_data *adata;
+	int ret;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp62_deinit(adata->acp62_base, dev);
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
+	ret = acp62_init(adata->acp62_base, dev);
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
@@ -281,6 +315,8 @@ static void snd_acp62_remove(struct pci_dev *pci)
 	ret = acp62_deinit(adata->acp62_base, &pci->dev);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -298,6 +334,9 @@ static struct pci_driver ps_acp62_driver  = {
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

