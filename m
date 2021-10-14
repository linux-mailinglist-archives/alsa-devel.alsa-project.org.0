Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2122A42D36A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 09:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F53D1674;
	Thu, 14 Oct 2021 09:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F53D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634195992;
	bh=VdkGuMEQ2xJyiKdDTxOFZzC4hAeMNKKNYzfv1Z/j/Is=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eeo4ZyhE4rTGnPAQj/dsR7uRjfNNh1BCLCbQbAU6fuLRaGYTvREKZWAsivXkeOS/q
	 IEV6/a8hN69qDbahLx7LUO1mifyCGu39lMh8X1zK5hm20qX4QKDMQJiUOWkcPE/EeJ
	 DgKGHx42OncKcNKqCo2L7vkDnIUdbLZfTm0eTVLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A03F804AF;
	Thu, 14 Oct 2021 09:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB860F8032D; Thu, 14 Oct 2021 09:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A424DF80302
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 09:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A424DF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="NIfoH+jd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kU2e8k4QxMUjkAOCzdZq4Z+RUDh+whpcDdSik4aNo0dblI/DSrn9l7slMd89JqiijLzfJ7G+ocbSjTzU8vD81l7SuUgUinI78PMKWj5l+2UVywSaSgW7FKmAxeMJUMnwEI6HVzu/HVAWv/ayTK+HVZBZyrENnYDldpsw5lfAm75E2Hl/kIlXZoxY3lICR9e4EMISl6z/I4A/bA7JzVTrhzQRc/hQbj6J2uUKHTboDq/tzdGMPkrn0dH2Z8Hq+GwZbimEM1nNL/LuwfsftKV+NV5bB/5wfbHqUvI3s0H6mHZEfE8voLLNcQWE3O4+dV+zqOG75ZNtTKNA+i5lYJFPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aT+Y6v6NPJ4rbs8YMdRE/3JOMouhciknac1v9KHIV6k=;
 b=Q4+heO/lsgYolIH+OFa4vEAZXc8FcnQJtF+YEOXGrR8lsJRr99hc5qFjpXXch3GGIsHePYrYlnr/DYt113meIkQH1d91Ym5Jwb+wbhsMC/KMM5fc5waMN75aymAGnCnhTyBtyDxwxowYlNmMK6Sylp0UsleNHIC0srqMIVFLwNd/RPzptc2n+bR/OpsdHnIA1Msk7yFqyUwOlX9EYyiSZIm1QoUxYVBVCDik4YAAGfW1YTwjY1rq39FHRRhd5IsvQ6O/KwjxQbaBcE63Zof9ot4o9rx/2/5dU8hUURzsyekJnmu/vq6Lrak8ahWpV8gaU/JsGFwEKgDxRTChegAFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT+Y6v6NPJ4rbs8YMdRE/3JOMouhciknac1v9KHIV6k=;
 b=NIfoH+jdP5LT3LofoZRSjsbUDF2GC6WSZ2TTrgI/yYkCTpJAaNXE+3rE+oeXiYNG4EfLr+PGVTkMvcGqzeMxd6VeYom2Jw2glvbdDH44xftjJ1fV7HOEwfAXWhoNPXgLTMSbbfWxHh+5kWX51pQY4FAnZJqTjQGM2cT7aP+/USU=
Received: from BN6PR19CA0050.namprd19.prod.outlook.com (2603:10b6:404:e3::12)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 07:18:06 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:e3:cafe::e0) by BN6PR19CA0050.outlook.office365.com
 (2603:10b6:404:e3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 07:18:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 07:18:05 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 02:18:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 00:18:05 -0700
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8
 via Frontend Transport; Thu, 14 Oct 2021 02:18:01 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 3/3] ASoC: amd: enable vangogh platform machine driver build
Date: Thu, 14 Oct 2021 12:47:10 +0530
Message-ID: <20211014071714.836410-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014071714.836410-1-Vijendar.Mukunda@amd.com>
References: <20211014071714.836410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8948bae-e121-4b43-c6a3-08d98ee2c470
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45500C3E993C1B1DFC90F88597B89@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UgcvA+/93g6AhbKJ2izLir6ip8/W8bVhpUdrTGbus5cHTWbOMTRWlE0FiTp5ffmFO/S8H9BPS0DE1V1EBinxi+McZcptKZjnWM8DMvyxz7ilXEtT1MEQWlCQLLij9HL5meOTlw+lgQylB3CnCMeDCXngRxAQHwQfF4x/ME9mWvvL64BnvNFkBJct+h0rdlOMwESxz2MYm9oa5VLoSrepLiig+Umn6o+qRF5aoEvhAJj+3J4ONmXnSgLqcuKtzBTi5hHgn2+vFppBb3/awsCgb291ceTD9/tLmeFYLCXzRngODhGWqoPfMWsjOWpzHg11j9yVgUAC2n2njbccXm1y+DNxnR5uYQOxFfgMtriJtui3/9uBub6qqxlxWgHN+jPWeeylNqW0TvTnpJccBrHugmLQLaN2pa+DNwEirRQ5Lmz3eon0kdLZQsJ+C6r8PnGuhBPzNULlxNM1jBVxoj0u8YBAW24hztAK8x2XGWUPQApDDQME6BH/9FUmmNq/96nKAfCJ2/wWDod6nXNPiMYeap5e1+UFBB3sfcvitX0QKX69KrcOHRsfbvU1US5sGUw3qREunU60kKx9ya4Xr1iGj0Gdp5opEPixADQQs7UJEGDP5bfQcAtKz8o+j4XjF8ux/w/XBHI6cHK0kFjA+FhqSyanY1RNiXiprsx8A+frUvAcocYiBUpwoVazjNOlTF024GNK7JCBveTdhWld6+1VLP+MkHfP3Ti+cdzmBm2xxHA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(1076003)(54906003)(508600001)(7696005)(5660300002)(110136005)(186003)(86362001)(356005)(6666004)(426003)(336012)(83380400001)(316002)(81166007)(8676002)(82310400003)(2616005)(70206006)(8936002)(70586007)(47076005)(36860700001)(2906002)(36756003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 07:18:05.8504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8948bae-e121-4b43-c6a3-08d98ee2c470
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com
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

Enable vangogh platform machine driver build.

Signed-off-by: VIjendar Mukunda <Vijendar.Mukunda@amd.com>
---
changes since v1:
     - fixed Kconfig indentation issue.

 sound/soc/amd/Kconfig          | 11 +++++++++++
 sound/soc/amd/vangogh/Makefile |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 49ff5e73e9ba..ef431eae8879 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -61,3 +61,14 @@ config SND_SOC_AMD_ACP5x
 
 	 By enabling this flag build will trigger for ACP PCI driver,
 	 ACP DMA driver, CPU DAI driver.
+
+config SND_SOC_AMD_VANGOGH_MACH
+	tristate "AMD Vangogh support for NAU8821 CS35L41"
+	select SND_SOC_NAU8821
+	select SND_SOC_CS35L41_SPI
+	depends on SND_SOC_AMD_ACP5x && I2C
+	help
+	  This option enables machine driver for Vangogh platform
+	  using NAU8821 and CS35L41 codecs.
+	  Say m if you have such a device.
+	  If unsure select "N".
diff --git a/sound/soc/amd/vangogh/Makefile b/sound/soc/amd/vangogh/Makefile
index 3353f93dc610..c9e53e04e247 100644
--- a/sound/soc/amd/vangogh/Makefile
+++ b/sound/soc/amd/vangogh/Makefile
@@ -3,7 +3,9 @@
 snd-pci-acp5x-objs	:= pci-acp5x.o
 snd-acp5x-i2s-objs	:= acp5x-i2s.o
 snd-acp5x-pcm-dma-objs	:= acp5x-pcm-dma.o
+snd-soc-acp5x-mach-objs := acp5x-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-pci-acp5x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP5x)	+= snd-acp5x-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-acp5x-pcm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_VANGOGH_MACH)   += snd-soc-acp5x-mach.o
-- 
2.25.1

