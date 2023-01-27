Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B8367EA5A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:04:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 360EB86F;
	Fri, 27 Jan 2023 17:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 360EB86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674835462;
	bh=9eQJCtdV2ve4spHd2hRYLyKQtjlya5noi8LV2jRhzOA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dffoqZsBWTk0pwoy1VJZkBpiwp2UjJcvNuyJ39P6GiEXJ6N2mI6TWl3RT1RWLmOe3
	 btUVpyR4aqb/ZZq9lHETVnn9KVrjTcpPlJT32pBGltX/Lp86ztDyDwo8FMB4o+B7DD
	 O+Ran9MgCNOXnqodsOqqdur4dDd7f69wUs22WcaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CD4F804C2;
	Fri, 27 Jan 2023 17:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0866F80551; Fri, 27 Jan 2023 17:02:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABFF6F8007C
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABFF6F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yNugh+Q0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lop66OF2MAxhTvnObTyeujo54VGsS2Pjh4cQz8O/8FTlaTy2Bi1/q9VDmbJePk5FT13rQdGXkawwCOTCrNuiFp5jGliLaHa7ObPeivJBDwl9qyx/4qLutYWE895y8csuN8DNK8gTb5I8ljvRF0wXzrFI1go/noED0jPz1gHPqNBtJ/rQSCCIq54zSQexGe+Hk9b9gT2r9SgRMmhCtLrNe8t+d1vsmHrA3TGmOIwDxWIgksYZTTKaG3eH+fSPbWm3vpjG8ULFPJr/ukT5EwdXSlY590oAzJnVkTag0CJR0gyCp28PPoh5rFJiY6J8RDW/rk3mIV866A61hmwdhQZU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tV1DJFhQHc3Sk0Mp1OHbmTkDJQRA51X7839sOaF5sG8=;
 b=I+0oS2+9TZab4PX4BHcfx68dOlt5tz1Lz3kmAfhmF6NQrCmmzDZ7Z4XB0sKRfMGWK5eirviUWvvrLZsrG7p3i778Dnc/VCJrutelMBoMQW+3rHtL0BeUEctH846bZEeOdgg3ePrJh8dCXckT/FWCHIiqcvoXHdlachhleL1twqZJSVZPSSSCANXV/A1Fzpdi7SiEZcPW8zxx1XUQDvY5OPojmg1j1KtDQ/DeGrj5hwDVKFyh5wbz/47iizRYa4laZ9Z9qpI7Y05oFyQQcCCUm3bbteHmANg8BNL0zBdJ6KtH7yOT2xpsR9obNe8U2dWKqKfLPbZ2e5XbNgiHxejGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tV1DJFhQHc3Sk0Mp1OHbmTkDJQRA51X7839sOaF5sG8=;
 b=yNugh+Q0NmVAnV2pia4dC2wqQiKKlUAe8AYGfmYu2LrGovtPBNrgdKDiYkm+uvkGfd7J124Fn3c7I8w229dhAxX9jaJjYJzNV34CEBI7gFHflbEguuU62hyl68wZDa9HNIJn4JMaGaKrVJSlqOFNKI8mzyDmV5eLmoa+uxfx8Xc=
Received: from MW4PR03CA0174.namprd03.prod.outlook.com (2603:10b6:303:8d::29)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 16:02:14 +0000
Received: from CO1PEPF00001A5F.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::78) by MW4PR03CA0174.outlook.office365.com
 (2603:10b6:303:8d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.25 via Frontend
 Transport; Fri, 27 Jan 2023 16:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A5F.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Fri, 27 Jan 2023 16:02:13 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 10:02:12 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Jaroslav Kysela <jkysela@redhat.com>, Mukunda Vijendar
 <Vijendar.Mukunda@amd.com>, Saba Kareem Syed <Syed.SabaKareem@amd.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/6] ASoC: amd: yc: Add a module parameter to influence
 pdm_gain
Date: Fri, 27 Jan 2023 10:01:29 -0600
Message-ID: <20230127160134.2658-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230127160134.2658-1-mario.limonciello@amd.com>
References: <20230127160134.2658-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A5F:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5a7630-2f56-4d9c-b9b5-08db007fdb23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jg/NiHWa9bLqbLSoVGppd3MVWmSHvcg2vIeHohqgN/4JMn6JubaLjJGyKtZK0ByX61Z2b9qMWvPkGPjNrEQN3qisJxdL888RMs9Vs8rBZuj0qkuNpMkABWp0x8wEfqJLvHsqDPbASNo4jVIBPqhoZmOWWm9ihr0+gFQlonn9xrvrqHbV8rpyNfZMDofPJeLt3nnl8qC0zjrqQBb3nANqX5kpU5C3xHt3KqI9YEPsC9cdpb2vRL/U796Td78o3Y5SVbMctJBxT4IBlKw0QXmwV+Wm0ylVC/AEVL7rWJX8nkOJ+HhYfB/STBfogugMT3X6l4c93ex5kdukcVvCxD05V0qtPbm5dfGlJbfKqiPxYG89bX4pSj+TDsuL/xMM//1ARej5ZCJbTWlmXT8USp/Gc/tRMYJ+nAdBk+sUkI1PSJBOXqUemEoMRqT6Ox6p1qhNkSvgnUxbIybAs4KjngGjMTjTnQroofRiKnNMOeFRJf16LePniXzPQiNmsu7Bz7YZGtG/AM02078T5JczvyagmhD16Ny0VO9GP7XVhA5ARfixY3aoM2bVp8lR5Xw+aT5mx4fd6QL5Iv63E01YkFNLNoQNJk9AmSlWXDVxE8DZas/sP8kam65VVRw1kAEmIWtqpJ+Q/iiuG3ZETpL4S75THV+wTJifiD5OPvAOT4R/yalNI89LCeggkvrojSh+KlaxJp52zlDr9FzqI7AWSlXCnTuvK15NPUcHvo83xtm7OdA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199018)(36840700001)(46966006)(40470700004)(70206006)(5660300002)(8936002)(44832011)(2906002)(6666004)(41300700001)(4326008)(70586007)(8676002)(82310400005)(54906003)(316002)(110136005)(186003)(16526019)(26005)(36756003)(2616005)(1076003)(7696005)(478600001)(40460700003)(81166007)(47076005)(426003)(83380400001)(36860700001)(336012)(82740400003)(86362001)(40480700001)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 16:02:13.8892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5a7630-2f56-4d9c-b9b5-08db007fdb23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00001A5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343
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
Cc: alsa-devel@alsa-project.org,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson@lenovo.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In case of regressions for any users that the new pdm_gain value is
too high and for additional debugging, introduce a module parameter
that would let them configure it.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 7 ++++++-
 sound/soc/amd/yc/acp6x.h         | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index acecd6a4ec4b1..3d6a765c5011c 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -7,6 +7,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/module.h>
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <sound/pcm_params.h>
@@ -18,6 +19,10 @@
 
 #define DRV_NAME "acp_yc_pdm_dma"
 
+static int pdm_gain = 3;
+module_param(pdm_gain, int, 0644);
+MODULE_PARM_DESC(pdm_gain, "Gain control (0-3)");
+
 static const struct snd_pcm_hardware acp6x_pdm_hardware_capture = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -55,7 +60,7 @@ static void acp6x_enable_pdm_clock(void __iomem *acp_base)
 
 	acp6x_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
 	pdm_ctrl = acp6x_readl(acp_base + ACP_WOV_MISC_CTRL);
-	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
+	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, pdm_gain);
 	acp6x_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);
 }
 
diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index 846ca10e24d3f..036207568c048 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -31,7 +31,7 @@
 #define ACP_ERROR_STAT	29
 #define PDM_DECIMATION_FACTOR	2
 #define ACP_PDM_CLK_FREQ_MASK	7
-#define ACP_WOV_MISC_CTRL_MASK	0x18
+#define ACP_WOV_GAIN_CONTROL	GENMASK(4, 3)
 #define ACP_PDM_ENABLE		1
 #define ACP_PDM_DISABLE		0
 #define ACP_PDM_DMA_EN_STATUS	2
-- 
2.34.1

