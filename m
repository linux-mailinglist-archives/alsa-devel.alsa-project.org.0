Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6757767EA56
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 17:04:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998E8E78;
	Fri, 27 Jan 2023 17:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998E8E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674835450;
	bh=bnv2+Y5FPs9j4EMja6sKtZoMgQ63puCGBJDGYxrXWg0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MdnT9ZVQQ1FaSUaITfE1kmz3Ksllk7iA497qZOJUeg8cTcMDSN+EDnfdeKExCrAVH
	 vShZ3ps22AE3/fV3UrlhiP+zByClmu0TIycFCv/aGd6YkdsGM1Qve1J9FOmT9XN5iq
	 sTHxHucgI1LnYt0i4zvh6Q3XsYjV7ImKxym7XiQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 012EBF80552;
	Fri, 27 Jan 2023 17:02:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 655B7F80548; Fri, 27 Jan 2023 17:02:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71368F80431
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 17:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71368F80431
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=08bA5TIc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyXhilHyBMEK+PMlePu0c2y/5rtMWqT3TXDBCPQ+jsAesGFlAfQfMy/QEnMXGN7xxI701mY/ZlW3gh6UZtvJzsRwP8YiaPxy7EWi4kDiA0vz2VhidFPorpTZ4hEv9AjqFCEBrhqUdwhTC5XVd4DWEKPa2oox2PPYApFeimKEZYUcFA04mBDLiY95mugO6pU5kco2Lch7BiVJiioI/ETddDsnGtbqANOpnG7vpF6htxZ+Lq+YIUvr1IQS6q8te3OSLYWXbO6UfFXm4yjSatDJtI+ZUDI/dI6CYRU9yFyxtVFLcFZchzD+L/u5Y1ICkXnlJLBQWZm38BbRz2jp5jS8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ee4fX0leAMmk7Ip4HBtExrw5NQnPEsGXZ8xp7vWklk=;
 b=N6q5X04M0rDpOFJgdle+MQM1rfsnEZlgv9wwGQwCLBVCqrYS2aUSHN3nV55EKXQW/eH7ljpsQrCvbzyzQ2U8ELIdxl/ofEewThPNzl3ETBID56P7udDelyq6zou1fHcXWqJFQTItW/h6x8GyBh45y0Hb0iIeQZZKic0mguxHo6YgaEhs4B+08m3T74GIny68CyXJkKXThQClJuor/YGEyBAn2wZxppE8utbhpidYDH985yobZzIOYXCTwDVYd+yigvJE3aSPTd7+vvbjFXp3eh4KMT3nGMWSXvAfHRU9840n9Hhu6b1Od9uiKYlxx9U7zx8nMMgMhozJE2si91GeIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ee4fX0leAMmk7Ip4HBtExrw5NQnPEsGXZ8xp7vWklk=;
 b=08bA5TIcUEY/mLJaY57IoP+kfm+dYL5gEV+k0Als/WVD/zHIneQEZJpHCQhimjkXR3qNOMBRJYA0MH9cFc69kZ3UhfZSsOzd7YlD8h8x3xs9l3813F7NjfO95mnJKAB9dWF6JVt4pyLzTe8yzngbOm7oh4CxNSKSpzxjZK8Hy9M=
Received: from MW4PR03CA0154.namprd03.prod.outlook.com (2603:10b6:303:8d::9)
 by DS7PR12MB8201.namprd12.prod.outlook.com (2603:10b6:8:e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 16:02:17 +0000
Received: from CO1PEPF00001A5F.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::91) by MW4PR03CA0154.outlook.office365.com
 (2603:10b6:303:8d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Fri, 27 Jan 2023 16:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A5F.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.10 via Frontend Transport; Fri, 27 Jan 2023 16:02:17 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 27 Jan
 2023 10:02:14 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Jaroslav Kysela <jkysela@redhat.com>, Mukunda Vijendar
 <Vijendar.Mukunda@amd.com>, Saba Kareem Syed <Syed.SabaKareem@amd.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/6] ASoC: amd: renoir: Add a module parameter to influence
 pdm_gain
Date: Fri, 27 Jan 2023 10:01:31 -0600
Message-ID: <20230127160134.2658-5-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A5F:EE_|DS7PR12MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: a0763530-192e-47e5-1b17-08db007fdd0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZdCy9UDx83dpl6QH3U1YZDqnYHixQ8ZXh419/r8BPSkUMBElm29NXbfWd4mUljCeebakN7tDwKz43CNwmcgkfzZZXmb7YVkKo+idngBYJ3r1lOjbqG75gRcCRE1gG+f6mxcQ+V4P03QX6tEF+rduMMjFL6i14BPRf8LBTPY3HtylbIv99d/N6DYL8S1X3qQf0PNwKYr4LlF1nOuOfOYboeBeFCvWyB2sJczCDUWsrZSSemhxfxe3zNcBDV4/Xb9rf6lrihDw+tFCE1tgUnxRgVm7c7M9TBQ2YCg8S5641EJ0cl6kLFdl3luTKAdKYg658+BznVdan7Jv2DdocGJDmIaCMIALg1MSi/xBxvJ+PCIlCJP8Bg3QboMfLKqjfdqUO1QPXw5oE11slS+enqU0o+YRkqGKwNLn61Z6SPMJcqKVvFZL3NR4ufAbLH298I7NQzavoTUo2Urez3fWXyYX6Dz+CiQLyhHv7p+bk+nkyE0uBoxyHEOC2W9HXHmQuR7HcLgBjd4NNT9Y5M0PfLGmzou8GR318b9idymUavCnnQk99kqPxSTRNcqCdgd2C9tFp0UPtlkGkUT1l811DewOb2FfEZ63mf18g6NjCLsXTclYfkhvggvbdLMIihwP/w3sRpyHHJ6/mj9vY/T0PjbB9Dw4pk+VYGYTBYTElbucQRl1VenYZyLu2ssjQgzv5FuxSidr0jEWsuFzsyzLZ4GXqV8hkQK66Tk0EAzLxJ56sk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(26005)(36860700001)(356005)(83380400001)(478600001)(54906003)(8676002)(2616005)(70586007)(47076005)(70206006)(1076003)(110136005)(426003)(36756003)(7696005)(41300700001)(2906002)(82740400003)(81166007)(5660300002)(86362001)(186003)(40480700001)(316002)(6666004)(336012)(40460700003)(44832011)(8936002)(82310400005)(4326008)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 16:02:17.0768 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0763530-192e-47e5-1b17-08db007fdd0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00001A5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8201
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
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 7 ++++++-
 sound/soc/amd/renoir/rn_acp3x.h      | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 7203c6488df0e..74b70bc4b52fd 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -6,6 +6,7 @@
 
 #include <linux/platform_device.h>
 #include <linux/module.h>
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
@@ -17,6 +18,10 @@
 
 #define DRV_NAME "acp_rn_pdm_dma"
 
+static int pdm_gain = 3;
+module_param(pdm_gain, int, 0644);
+MODULE_PARM_DESC(pdm_gain, "Gain control (0-3)");
+
 static const struct snd_pcm_hardware acp_pdm_hardware_capture = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -80,7 +85,7 @@ static void enable_pdm_clock(void __iomem *acp_base)
 
 	rn_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
 	pdm_ctrl = rn_readl(acp_base + ACP_WOV_MISC_CTRL);
-	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
+	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, pdm_gain);
 	rn_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);
 }
 
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index c174f84650d24..7d0f4e6a2834d 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -34,7 +34,7 @@
 #define ACP_ERROR_STAT 29
 #define PDM_DECIMATION_FACTOR 0x2
 #define ACP_PDM_CLK_FREQ_MASK 0x07
-#define ACP_WOV_MISC_CTRL_MASK 0x18
+#define ACP_WOV_GAIN_CONTROL	GENMASK(4, 3)
 #define ACP_PDM_ENABLE 0x01
 #define ACP_PDM_DISABLE 0x00
 #define ACP_PDM_DMA_EN_STATUS 0x02
-- 
2.34.1

