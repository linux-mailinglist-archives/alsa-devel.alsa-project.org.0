Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F3806D67
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 12:08:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3856868;
	Wed,  6 Dec 2023 12:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3856868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701860890;
	bh=m3rIVD5/BzICZUEmamiqnthboLOx+WQ6eNq/uZlxYF4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YWO12mInNQvhsCZbDl+0dsN7XyCPKs8YYATgCN95KXGMo7YqAqwjTg1MvzBK6yKZ8
	 6IK+QC76socwU+bEJ2IKZoMsnedGwoMKw95LFAUmzcjqQK6CvbleCuE19FHZGQKxdh
	 pmVz5+AYbFwEZn/5CSXYAvVJRYhXlp6vgmu/H04g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D81F0F805C1; Wed,  6 Dec 2023 12:07:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 190D3F802BE;
	Wed,  6 Dec 2023 12:07:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF492F8028D; Wed,  6 Dec 2023 12:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5522FF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 12:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5522FF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0ut6qrfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYBO8g7jsSmIaogZOcPfqinVprJ3n7RgEJvgh/J4hZnFaoAPPjd4Zu1ydJ0NBMaSFujzUhW1Bhn8PGEq4gx3iTZ/temRblfOTgutrHcfeADHuhNEGC2tEiaDc5msep3U77rHOGko010coj3cOTUzHIjUp7r0mzZvZYaCqEh6Jck/+3LxOhOmpKK3pHzsvi2WPDhLMTQj1B3iBxHgsY3S4898JuuiHOsKZvKTk1H61MKJStIawW4nA/VmMbqc69+i5kAM/1H1a2VyarS4D4+5u03cFnijZ7SnWBGJd8ZNqgP4dPZnzQIeF7eHDodPDtJfKYBkgjNQUNCklCdthzoLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDzqPMYcps4a5DY8Cx/RAjQce+aHfYvgoNfcQ9tTXso=;
 b=QH1JeDt/Fb6GMxY/OScwSsqchPK0d6Cs4P2uBJnvdshPM13eaE4lcNtKkeDCuDgB2VZBFJFHiZrlBMtRKuk8K1Z+blI0cykPLLB0mwNF5QBTGu43GmaSdBzox3iRAN/fwcvgMCnLjw7+Cv2mvVScbFj/2SE1XotRxd10Pd0XWFfubO4j/hOw1OrSiO1f526ligCmmfBxaMlEYS6emK/5nauAtbxhCW6ooEreq27VHidYoe7xZ4OrTcXAuk8cKut7xq1T12TfG3ExM8GLdc/QOXN9bvdlB4qV/xAxooD/CZha724gTFzpqFTgHRZUHUuNrgeTYSVYu5v/Jg83cs9HWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDzqPMYcps4a5DY8Cx/RAjQce+aHfYvgoNfcQ9tTXso=;
 b=0ut6qrfaftULwPcN2U5mnENcmkbFAZgipioA0chWWfQN5R1bSgTp0e3MXUJ80hASiSrqVFD/h91yyKsmCO54pIAxjwW+fjGxSfje3Qje13nTlkPIumhqd8O+CjG2QrswSSpEGbN0SoHN21RTz4rANTVaGlxg5Y4SinoCrG0L4ZE=
Received: from MW4PR04CA0268.namprd04.prod.outlook.com (2603:10b6:303:88::33)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 11:07:24 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:88:cafe::61) by MW4PR04CA0268.outlook.office365.com
 (2603:10b6:303:88::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 11:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Wed, 6 Dec 2023 11:07:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:07:21 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 6 Dec 2023 05:07:17 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Alper Nebi Yasak" <alpernebiyasak@gmail.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/7] ASoC: amd: acp: Add i2s bt support for nau8821-max card
Date: Wed, 6 Dec 2023 16:36:16 +0530
Message-ID: <20231206110620.1695591-5-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
References: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 51056e00-2072-4e11-3e08-08dbf64b867c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rhMxQ0QtPtQ2115wPR4j4wYnLt16j9vj8Ul9CTMFdYMUrViY0BQNZ5b2NATduODLN9kUBO/3q7r3xqqHmO//4zkUpshUnlud3mDqriG3boMf4w6Z/rGGNdjhFgTDC9rIp2Wvarqy/PeEnaak64XYABBt5slVl6Z+6zxV9ZQTAwG3dR9rc1l4dAPdhBWBnUDNHV1Adg8hSquEJL3vUh/zf/pkpwM/ZTVHFt4XBoelFCocaj8SuyoUiyOjbOOMAbkY0O19CbBXC1cM+d92+JAhZjeUUywLU+4LuIa9VsGY8/R11/Ar+eKotNTSuAKY9vucs/EnGAMCY0ELUBcEFAy9Hb9MgrAcNdFGP9WbCFuj+OMfDY3osDXkpNKopari2NUjb7FPadTfs8alZcy+TNvjNaLCnm41Uv4mwMOsX6tj7oUzHo1c/B29EldO8gLEel24hOFtlKqp1HAwNDRvJid3hdYfPxNQycW2yMlBegud1ObYo0gf/FI4c+65+1OUHsMB7Sn4Lx7mDehZ3vuDS9qgOESwJYpTFE0vnBYZF6yelvpXDX36kAtGLap4dtwRN+lGOr1fBfmxUrIcjbWeFi3Ryq9EQN5noaHl+MFARNPyGY755h9H3eEtTJrf9O8JbYZBcx00Jho7+cFEopcCd/58WIlxFFRphIS5jkj6SLMWGo2J3uQqQOsEszuoR35FFu3Cv31m/jHNjc2l4jebbJHwE0YfGmCmrHNgZw9KDMEyw1nnUKzB44GOEnkDegCX5OuHT9PsbJls/m0wncUD0K0hPA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(2906002)(5660300002)(36756003)(41300700001)(86362001)(4326008)(8936002)(8676002)(316002)(110136005)(70586007)(54906003)(70206006)(40480700001)(36860700001)(47076005)(82740400003)(356005)(81166007)(478600001)(1076003)(40460700003)(7696005)(426003)(83380400001)(336012)(26005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:07:24.0607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51056e00-2072-4e11-3e08-08dbf64b867c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707
Message-ID-Hash: VHXBF4UWU7IQKNLBZ3P7SMGP3RCHXXZN
X-Message-ID-Hash: VHXBF4UWU7IQKNLBZ3P7SMGP3RCHXXZN
X-MailFrom: venkataprasad.potturu@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHXBF4UWU7IQKNLBZ3P7SMGP3RCHXXZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add i2s bt support for sof-nau8821-max sound card.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-sof-mach.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 5223033a122f..2a9fd3275e42 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license. When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2021 Advanced Micro Devices, Inc.
+// Copyright(c) 2021, 2023 Advanced Micro Devices, Inc.
 //
 // Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
 //
@@ -86,9 +86,11 @@ static struct acp_card_drvdata sof_rt5682s_hs_rt1019_data = {
 static struct acp_card_drvdata sof_nau8821_max98388_data = {
 	.hs_cpu_id = I2S_SP,
 	.amp_cpu_id = I2S_HS,
+	.bt_cpu_id = I2S_BT,
 	.dmic_cpu_id = NONE,
 	.hs_codec_id = NAU8821,
 	.amp_codec_id = MAX98388,
+	.bt_codec_id = NONE,
 	.dmic_codec_id = NONE,
 	.soc_mclk = true,
 	.tdm_mode = false,
-- 
2.25.1

