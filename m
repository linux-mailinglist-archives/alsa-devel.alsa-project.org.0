Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC63D2385
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 14:47:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38CB716DA;
	Thu, 22 Jul 2021 14:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38CB716DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626958040;
	bh=RFBLuKxSAYo/2OrUzplpTD6x/5stZX/5LwFShQFA3pM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oHC6GHztyZ1T5p/1BFMJJJC7BvtVKVRPW5Cg5Eo48B6xsSDPc6mkq7UccRQ/E6D8Y
	 2diRrtfoQYz2WvxP9AXX1igwluxQjac4Mxj/RlFBLSRInLWvGQ10hUngcc1pZLm7aa
	 vtAJI87rK3coCcTwa90UsZPOlffk6oPYriVzlbDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85930F80256;
	Thu, 22 Jul 2021 14:45:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28334F80227; Thu, 22 Jul 2021 14:45:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 421D9F800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 14:45:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 421D9F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="IJzgoO1K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjtOCXNRbcUcp7HJxJ7GTO1hAurFJ1V0zGNP4FrJD1SOxGInC3YU9OMbvrcuthqLMDsF3evj+jMuExETqPUwH9eikBQ3dATnodqWlSUuHFbhR6YORvP5e+734001q2PMOgpyaeL7V6tVL57TwS2/5u9UajiyTy/FkfEO5DHuJfhTG0lhuZga6ILQ2AcMNUs6fI05ycT+hSWamm/DIcOFX79CEA3S5mlClSVJDnlsY/701rgUg6mC1USQ5QVwrVMl0NdHr6GHrZKIybmiDe+syKuT6ORVLbENxzscKgUFXGCqS0HTOfj+ooLZAyMDiwydxzoYSl7mD5fVQQqitb10rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2B+2gO+3FWIUbCHyNgS/idIzEyArfCTrPtelwIxok8=;
 b=ZKSNYupusF+kV7Oke4VAya206kWrsaaGIUVf3qfpukZ10AUObdkuTk3m0X6MKygRLHbyILBDyw69KbXQ0RKRDR6pERh9ZmkSN+/EdDcAVirEx69FAAcWqHAYFAXDLU6U3+4MXde6s6xOD4TF7XcGSnVRR4PG9BwWhhxoKyTLfI1WN+IesN17RwnAA6wU5DXXWyNuFpRCad7rXReFavtP1CeHrscnufFK9D2x90RyLcgm9F3BK2goGZr0lHexRW5FpY5uBBAmuHhquisIddf7l2sxg1S7JC/xm9Jdc+6O7BBKb8NOHt0Fe8jnKJ6hQ67F4JaQ8Ul89W6/yJZ8HvZiDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2B+2gO+3FWIUbCHyNgS/idIzEyArfCTrPtelwIxok8=;
 b=IJzgoO1KfbkAbt78ywGmtX5lj4It7PcDXZibfHnBpIDmcYs2C1KwFo+RESrh7ceoxX6kowAsCO0knfiw1BYP86bp6h+qErYTCwk4rZUzj8+saoNYwOcOWCBqLjlMEJSuJc+M1o01euWCqLPfCbPUaAHXzN4xhUrTymNuK8BYADE=
Received: from MW4PR04CA0180.namprd04.prod.outlook.com (2603:10b6:303:85::35)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Thu, 22 Jul
 2021 12:45:41 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::b0) by MW4PR04CA0180.outlook.office365.com
 (2603:10b6:303:85::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Thu, 22 Jul 2021 12:45:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Thu, 22 Jul 2021 12:45:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 22 Jul
 2021 07:45:40 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 22 Jul 2021 07:45:35 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: enable stop_dma_first flag for cz_dai_7219_98357
 dai link
Date: Thu, 22 Jul 2021 18:33:15 +0530
Message-ID: <20210722130328.23796-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899517cf-fec3-4b0d-303f-08d94d0e9d62
X-MS-TrafficTypeDiagnostic: DM6PR12MB4057:
X-Microsoft-Antispam-PRVS: <DM6PR12MB40573EB580B04675B80C541597E49@DM6PR12MB4057.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:949;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z05P7YnHEjtlofyUm8ksqsqpsAiuNv/936hoiCfjZ/OuQt32XOYDspzfxPWrV/jxoSEWidnR0wnsjJUxpgiRSCah1CKgBpzr5KmJQt2411her+/IwWlRure+L3w2+JK49ilyBLgfCds5LtF7GKk0joRTQLV9vqYslI9al1tsYjP9H+LVG3mHsxAo4MduplQvqSBziCYOyQ2MTs7tzYcFd/T8xoVV9ez9PvkecnTLkxgIeVxlEgi5d4o/T2Prd6GlSMDAONaD5bOtKIEvaaPNV0Ep1kJUC51R65VAIKqAPa4bKtzrpvMlJ92GpZxg3p4LAqv0FChGVtoEg/i0hmsIE5d0GylhjQJqD5mZxAFBY7WNhVer5Nc3ymJ1/XwFH1C3ctwcSy+WwGCiDnWB/SO0pEJLrQNXsV11sLYVgA8f4wwUcCvA0rYvzdO6beVDX4W6ph6re+ZWa/4I2xa8kOiPsBW7YXQvtqWwfb7Ek77IUWNVbM/JpX3N2vkAtKfM7Z5lLofnFRm8qdm4uCckTFAojA27kygw5ewG+ePG4rwLLlNGlrEkY673ANwi1KFT9dxQUHn3ak3yFFCK1U2ZT5J9F80ZtwcsuDu5iVk+hMqEuBy+iQOj/TCzKJ7ae6vwt9RyO8FL+GKYzNbTSoQ9KmQ55gdiBJBpbzvvKAyYxWe2cCAt4brkCUA5cF+JgkHcdCp4za5GxPlKqL3cxQtjZ1HKRHFUmb3cds3uYHgLEu+UIuM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(36840700001)(46966006)(82740400003)(7416002)(70206006)(70586007)(36756003)(336012)(36860700001)(426003)(81166007)(4326008)(6666004)(1076003)(186003)(7696005)(86362001)(5660300002)(2616005)(478600001)(356005)(8936002)(2906002)(47076005)(26005)(82310400003)(54906003)(8676002)(110136005)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 12:45:41.3145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899517cf-fec3-4b0d-303f-08d94d0e9d62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
Cc: Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
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

DMA driver stop sequence should be invoked first before invoking I2S
controller driver stop sequence for Stoneyridge platform.

Enable stop_dma_first flag for cz_dai_7219_98357 dai link structure.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 9449fb40a956..3c60c5f96dcb 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -525,6 +525,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.init = cz_da7219_init,
 		.dpcm_playback = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
 	},
@@ -534,6 +535,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
 	},
@@ -543,6 +545,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_playback = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
 	},
@@ -553,6 +556,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
 	},
@@ -563,6 +567,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
 	},
-- 
2.17.1

