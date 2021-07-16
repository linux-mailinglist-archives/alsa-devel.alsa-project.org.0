Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD83CB740
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 14:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFE911692;
	Fri, 16 Jul 2021 14:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFE911692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626437678;
	bh=qU0yxfkh6BqiFkhbHalAHiUBDV/KgwH88Ttiu3XCjl8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N3/Ux9uP3FUQB7A8ufjVh3vStWt7DHPq0VYf4lcg2UfLDIpGlgXxeuhyaFxw8O/sz
	 Rs0DN+Fx5OvIoHQpuhvZyWHMSq7ACdv9WJgboitenf7uIqREIxOxXWFgQU8pkb7Q6s
	 Ys4DacU8CxcfDQseQT8Z5sWRnKPrpVjC/iZM4cOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9886F802E0;
	Fri, 16 Jul 2021 14:13:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33781F8026D; Fri, 16 Jul 2021 14:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C31FF80254
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 14:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C31FF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="NaDX8oUX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQj26NLWMml1HAf/rY0XFozCdPrfZacBONuHdOXajNpqoeiD4vDD1dLdFTqfzs4eYEMzJRsaJ4AWoz3k+theN4Oq31hTm7/NUWL0jDHzai0ptVyB/oM8fvPvekNpp1cEjCUgJh633JufdrenD4kHHGpI9AQHKFPeiCUQK02YjfLqHQ3eMVfr0XEy+mGV2QqoTIqyarWsEy/Q2vNc19XpeBJOzR39gXFJsbn4yqCemzf3itw7QlSiOiWFp28mx8ao0DjJvgQ+QbkDiGMuroML6WEWVPJ4ndUnRIGOV1KYjS5nAIaYnVLnH5UTIYKxyMI+Bgfs2nlUPUib5uex8lBHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/37BxLM1lJhqQptDhmGzO1FQuWPqqTduxYBkwiDlBC0=;
 b=d85B4knnq2QPdhNFnpnZzjCwjuXS6KddjB5/yGokReKwzdV+GYVd77OPvlc/g2MpuihuUOYkhxcHWdQywGgeuCz8qBABtjhfkrxHi3LyycqQ3WKKShpNAWx2/gvkLL4OYIKd13yTbIDUPFN+BkrM/4YI60zzzmfSj3mPq1hdKT8xFmsmS/BurelY67LdJ43c3zTy4F7Utk/kn35Q6FH4phbEVkQ+A+g+OjL4v9YpBtGEPQ1+06ITjT7jZOvwBnAFBznHbk+7fRhN9N7k4V3GZ6xafNAbXoEZ+K48DRjsbGMiqYu2T0HG6CStcJ+v+rsbDvPFx3Q7eLmLCpFqqT7QUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/37BxLM1lJhqQptDhmGzO1FQuWPqqTduxYBkwiDlBC0=;
 b=NaDX8oUXwjbpjHzTghflQRrTYXKySB//2ED6u9TFWZLZ/9LjaePeJhLlDAth/IhN2cON8A9PM5DlyI56G2yabc5dhY9pleA77V4aQamBSCU1XQJthzGx7jxCgtXRAt0Gbah2ksC+WqB/8oOKFnaD1G5J961ITxVcR3soF5CA1Tg=
Received: from CO2PR18CA0043.namprd18.prod.outlook.com (2603:10b6:104:2::11)
 by BN6PR12MB1217.namprd12.prod.outlook.com (2603:10b6:404:20::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 12:13:00 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::e0) by CO2PR18CA0043.outlook.office365.com
 (2603:10b6:104:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 12:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 12:13:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 07:12:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 07:12:58 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 07:12:48 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] ASoC: amd: reverse stop sequence for stoneyridge platform
Date: Fri, 16 Jul 2021 18:00:13 +0530
Message-ID: <20210716123015.15697-2-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716123015.15697-1-vijendar.mukunda@amd.com>
References: <20210716123015.15697-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 596177fa-1e8c-45c3-cb46-08d948530de6
X-MS-TrafficTypeDiagnostic: BN6PR12MB1217:
X-Microsoft-Antispam-PRVS: <BN6PR12MB12170AFED7590D1A2ECA4DDB97119@BN6PR12MB1217.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0suPSnrbCLrXladIvfloKTBm2LY1S+SXe+f5CGzceg6eMXjNkKKq+81BnLMeJbpPXHXE5OaQVp7Ph3F4ky+npHiAab2+7z2HHfeiZn+3F85Q0KMzSziRaunx5p4gcexEjIu4Q6BtIVagJ3xdL79rI7U40U3TcgaHOlsSHwTiqFohg4kUpPgna0fEbkTfRCFWWHadZm8pOiNhYVc4fvA1Lk3t+jGRYubqL77fFzwCPAVu9QD4dxUB77EUlH5oG9UeY6B9aEeB1KqMWhti4hNTSsPNokSXRqSJIHRzY/XgK0r7VWit1Mca02ydcme9JiuN7/Ycu4AyidzghwTjPlDLlB8JwTSSxy5wAD8bVsfvANArTk56GMFYtu8KjVNhlwHUmuxEy8zs4dz/NLiGE5lX7HYWhNQe1VjlTBqABb5puPCdL8oXyA2BWl1L36iKxbpZY4VzHn5bnyDfLRcj50+fdnl6iCSbS4x/yGxdpCDgj45KLJ4weChsGrIwDfZEorGfCv7GNLX+SkYX/z4P4+2loHGWSzne2EBGj8lUC65Txeqw70X8c+DQJrKL0H2MiB6PNgrcj3ONRC8xrmd3h+BxtwknGVZ9W9dMnlEJ4AKhkVvkWWdfCwKO8Wbay4sSt9EVS9khOoC/kUpn4nJENaq3FXbV/hF0lC6oPUDE2rYltScPEmTaz/fjekBcuSnqoquudjuZCbfrk5aTtLyyzd4nu5QiwGD6JX15GAJWFqVmGZI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(36840700001)(478600001)(36756003)(36860700001)(82310400003)(426003)(316002)(4326008)(7696005)(2616005)(186003)(26005)(336012)(86362001)(5660300002)(110136005)(356005)(6666004)(82740400003)(70586007)(54906003)(8676002)(47076005)(2906002)(1076003)(81166007)(7416002)(44832011)(8936002)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 12:13:00.0711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 596177fa-1e8c-45c3-cb46-08d948530de6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1217
Cc: Sunil-kumar.Dommati@amd.com, amistry@google.com, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 nartemiev@google.com
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

For Stoneyridge platform, it is required to invoke DMA driver stop
first rather than invoking DWC I2S controller stop.

Enable dai_link structure stop_dma_fist flag to reverse the stop
sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 84e3906abd4f..9449fb40a956 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -576,6 +576,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.init = cz_rt5682_init,
 		.dpcm_playback = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
 	},
@@ -585,6 +586,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
 	},
@@ -594,6 +596,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_playback = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
 	},
@@ -604,6 +607,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
 	},
@@ -614,6 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
 	},
-- 
2.17.1

