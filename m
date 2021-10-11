Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C5428669
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F79C1671;
	Mon, 11 Oct 2021 07:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F79C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930985;
	bh=ZeCuyn/o3qNgZ2U4F85Bmy3h01ddQ3uX+oB/NelscRA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vBA9A1pmDMTcwPbWxvmTGgpYyMQtBdqlSvG1lmH/ALUzyzicm8VRu82Uqa5Jih03V
	 F+NiJhYETkVfjobYkE3ivyzHbtp8rhi7hojHGhES23mjFutJuCajt7xQbWEtCzi2sW
	 QOoayVtlVxHzchQ1S08qy0moqFL1TP959BfgC1pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53509F8051B;
	Mon, 11 Oct 2021 07:40:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12EFAF80519; Mon, 11 Oct 2021 07:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F87EF804E5
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F87EF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="uc2TnI4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMLEx6uCMSb83mGV8oHlnv8fU0v/BZ8zvpLA2nFWXQqZKATsHML0G8A9t/69FKVMclzpnFBvf0+z6a/3q4IWdA/9PgksmPIvm3OVkAX0zs13H3qnhbv+tovvSY6b9yEbOOtU1vxTx8tsN5R6Xn5KtQSfCgxP+sqcAQUZ5aMFfs088D6oEyZFp8z/1iAfefXLhQMY2KTIou2WCnwL23BQHO9BiblF0eGvIBs9icwkp5GbWwT5bsIQ7RB9p5oauwcwx8kF45raoZUEWD4LP4ECJ92LOcdBT0kfzuFmnqPbliIL0rA37VLxqocqnZgW/oyvVY/G2j4BZ6UM5VsdFVopwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjdCoqkXAPcyZVejsT9vvfyTlAqrljpNufT7T5xzD38=;
 b=QKqOmO1b97TBzwlraFMkelVLnYanuDTcb7z55jzOidN/VQa5TV5YgWP3jD8GyDBtZe7dv5bS2bRim2AHN1B3DMj+hoIIwc8AtrTVkiN0qC/XjjuFNY+2ADAFEDwL68BRf4ra9tvO+uh/l8FPtDKnADVk8L39sb75JLR7p+dQu8A9pP6mobkUkECmet3QO3zy/MZOcsntM5V9ztbkywUFVbH0limYjOT+Wrc//PdQoaN4BexCUQXntDeWs+rhVfPMpXybm9f4wu6qgCN8JHmNV+zAYkqx0lsTqE9DqxDKdHaDrzhqFY0prfOjJIWiIoEPCDmfwfwmp2MaI0D7emTi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjdCoqkXAPcyZVejsT9vvfyTlAqrljpNufT7T5xzD38=;
 b=uc2TnI4hOWNE1fZ+7VVrxSPO0jo82akuU+OhRDbJP++2NeoVnE2wSR3d1zTf9umEEFrJ9NfbNdZj5muDzIIkkyUBROo3/lE/KYDGnh9EdrCSSQpbSb9iuge8lJa137vLYNmPkc6KGZ8TLrWIjPiEKTXhUZcPXqvBoapNwnWCcWE=
Received: from MW4PR04CA0247.namprd04.prod.outlook.com (2603:10b6:303:88::12)
 by MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 05:39:47 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::df) by MW4PR04CA0247.outlook.office365.com
 (2603:10b6:303:88::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Mon, 11 Oct 2021 05:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:39:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:39:46 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:39:42 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 10/13] ASoC: amd: enable Yellow carp acp6x drivers build
Date: Mon, 11 Oct 2021 11:26:18 +0530
Message-ID: <20211011055621.13240-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 400e15aa-f2d8-41d5-3e67-08d98c79897f
X-MS-TrafficTypeDiagnostic: MW3PR12MB4347:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4347581424B839B093E16E5397B59@MW3PR12MB4347.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mp3ndbmwud4Jap7jQq/ubqc5vuDLSRQ0bElCBM5g6Bj9fhPeyT2LXUMSaITR19eRG4ROqExTHzA70HIsKoNDgimYP7K2K3/K0qNyS8Qd9z8zEQk91Avbespal1t7aDUiexgPrveGL882xHiEHjgT6Rawk/VXkMsaz7EF88H2GFIvUk0w71EGnGtJgc9oFQEkYy3eRNhM6xGx88M0cm9BAPQkgcN6dixppV+ka9FZkAhyHkfR5NbgalwNm8bvL3c6CyNckoy3VCKCAbnv+o7+EH5fOfS5q88PoeLxJDIZqcCpDMpEPlIXbkPUMttowYxiRhi5fXzxyIjl/2huRYVI/QAyucC41xcIWCg0h+eB9QDUopFoUFgYCG4KiJp9MkIUshmmNinztBQlH6yZlMyDdt/tHAWs6FEdxIe1/Jb5Br8dcs0EQCAQlj20wKQbrlUqgO3zEM6/j72noxLt0B67a0xOt2W/W+y5Czvcdp7g5JS3CQ/vM1XXAaZLTDEtkAARmKBtNG7WBgB2DhuhjChID3EdT35NYM8XjCL+AxDYVIx0+APizQ8U8tfknpJtsNnNWeXzLiNlvRkCClavKsc5wP9UWdhEu0uMzeuIdqgVrSxaMBTfBblJpH3OGRD9fds8S4dfbl1O/RaIAHWmO34ISVum70qPh06yk/islMQDLiKrJkCdqjKSbbH+NE9QIJn1LhXJrXPJivr/qcZgvOz3GjHrlUGPw0Q9SlmRignFlTGa7in5xSu+lBTtffkq7k+lsT/QDh7itgYyXSTWtV9OZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(5660300002)(70206006)(6666004)(70586007)(508600001)(2906002)(356005)(81166007)(47076005)(36860700001)(26005)(7696005)(316002)(8676002)(186003)(86362001)(8936002)(54906003)(336012)(426003)(110136005)(4326008)(36756003)(82310400003)(2616005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:39:47.3845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400e15aa-f2d8-41d5-3e67-08d98c79897f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
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

Yellow Carp ACP6x drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Vijendar Mukunda<Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig     | 6 ++++++
 sound/soc/amd/Makefile    | 1 +
 sound/soc/amd/yc/Makefile | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 sound/soc/amd/yc/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 49ff5e73e9ba..42825e8ad2ad 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -61,3 +61,9 @@ config SND_SOC_AMD_ACP5x
 
 	 By enabling this flag build will trigger for ACP PCI driver,
 	 ACP DMA driver, CPU DAI driver.
+
+config SND_SOC_AMD_ACP6x
+	tristate "AMD Audio Coprocessor-v6.x Yellow Carp support"
+	depends on X86 && PCI
+	help
+	 This option enables ACP v6.x DMIC support on AMD platform
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 07150d26f315..c5b900d3df0b 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
+obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
diff --git a/sound/soc/amd/yc/Makefile b/sound/soc/amd/yc/Makefile
new file mode 100644
index 000000000000..20f8dfe6abb4
--- /dev/null
+++ b/sound/soc/amd/yc/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Yellow Carp platform Support
+snd-pci-acp6x-objs	:= pci-acp6x.o
+snd-acp6x-pdm-dma-objs	:= acp6x-pdm-dma.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-pci-acp6x.o
+obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-acp6x-pdm-dma.o
-- 
2.25.1

