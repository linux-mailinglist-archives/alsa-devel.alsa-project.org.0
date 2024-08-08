Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC06994C439
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6271982C;
	Thu,  8 Aug 2024 20:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6271982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723141339;
	bh=ieV+xBrhkWPYSpApUkwfDqYXotPUkyJV9b3CxxMkmO0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EfK01hKxkAN9djqGQsMtYK4H5GWUVkNQ1QPfCMosLQDPYfTvqrz4MlgIIpN1PxpRK
	 L+Uu7K+gxRRPd4KMyveL2F+LEkxweYddsunJtOLpqnjfPg3dV/Ab83kFnuwQZomM9O
	 tD/j1WERTnLv5ANOzxESh+oluClg+QUvVPL/yJq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D759F80624; Thu,  8 Aug 2024 20:21:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE79F80641;
	Thu,  8 Aug 2024 20:21:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 372F3F8047C; Thu,  8 Aug 2024 18:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC40BF8023A;
	Thu,  8 Aug 2024 18:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC40BF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OCrpH4/A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjmS/UFaOceB5L6ZHCj6bHCvTxdlPI9ci6UePPxOih4V25mmXRCOX+49ebm6wJgPtxYfjt3CB9lfFPKIXX5uipAniJo6NQTmDLO6OHlZvJNmKCs0cgJ2It0BEHIV6p6sLRNhN82ybOWYg4bPpKpfzLZz24VsMpe6vMe86/U5uqcCs9NkzpAmj9nsxk2qgP4oad6MtG5yv+6NCLPFAdJ7k1wwLI8fro5eafU4cCEN2RVcs9RxPaR5x/kNZxCx/slZukuTqajyemxmwYF8eW3VIea9XB/bO+kX1iSc9uKRxdD+OV4xNFJH/ZNzGs68Zw9jGWEoYP3/QkYR20wisNmsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxkBInJSWtS/+2b8sbBeUAK9a3OMWSIdNo6kSvk5wFo=;
 b=u5+vkpNroakhWx/Wd2qOTowxrtrSpKIJwfR4XTHs0Lc11rzs9pTOn0IaMrjFiu17pkiun5WGA6XHcSHtiG1MjoJwNXbi4OjDO7QZoXAm0RM8LsMZNv2SdLnqzYnm8K36NSyHqKphUxi0pg3EAuppWOFSKWOn1O5JNt7NXgC1LCDUGtZWPB9tUtZec0A/wqgDlsnp11kCVLraR3LSG52rYQmmPYhmGngV1qFG2P6c0/t0pLibkSFbBS8tSartbcQ5/iYYAWcnFJAqrlf1Inv6ibc9Ns2QaOsG33NkHItCzJCy3Srs6VUMRbNd+klZjSYuri4cCAj3x1IgOHFvveV60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxkBInJSWtS/+2b8sbBeUAK9a3OMWSIdNo6kSvk5wFo=;
 b=OCrpH4/ASmQAHPAJY8tTmPW610YCulAdKtYqVRlfdFZoxFUyojoyK9u2HQXQb1mK0MTTgOupu4fUFhyNvkDTSCnArIQB5sBz+r1j6qSvhI6gsdu3pQl+cY9QnQtK/ypqHUSW9w7YbZ35Q3i3AILHyej2k7Yp2FV0U3NgCcG7200=
Received: from CH0PR03CA0403.namprd03.prod.outlook.com (2603:10b6:610:11b::13)
 by DM4PR12MB7574.namprd12.prod.outlook.com (2603:10b6:8:10e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 16:58:50 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::58) by CH0PR03CA0403.outlook.office365.com
 (2603:10b6:610:11b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30 via Frontend
 Transport; Thu, 8 Aug 2024 16:58:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 16:58:49 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:58:43 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<pierre-louis.bossart@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<lgirdwood@gmail.com>, <kai.vehmanen@linux.intel.com>,
	<daniel.baluta@nxp.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<cristian.ciocaltea@collabora.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND 7/8] ASoC: SOF: amd: remove unused variable from
 sof_amd_acp_desc structure
Date: Thu, 8 Aug 2024 22:27:52 +0530
Message-ID: <20240808165753.3414464-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
References: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|DM4PR12MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: b2344d57-62ec-45b3-01b2-08dcb7cb6010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PW49MkeFRxOCZsl+rYLoWMTS0J+jxm2NvqJPsBRIq7zwz/kB1PpTlEOSorM+?=
 =?us-ascii?Q?+T9Pivs/NJmUFq3DGu9EcryXti4fvAcQj09r+TgN04LxBBIpGa9J9igq3oTX?=
 =?us-ascii?Q?VkUC2UtB11ev/e1tjUmisaADYoqc1MtP/QOz+fyzNgkojbELp3gtPgrMNQfV?=
 =?us-ascii?Q?9NV+CEDRpAUphCPae8BNLJtVUzNoFiTwF+cyfTm54/2YUYX48m18dFQgV5Wc?=
 =?us-ascii?Q?gJchxOCmvC+nfTWwsx4WlWZCvSvl78qB5oWnWRhb6eZCx/aipFCkfDbvI2TE?=
 =?us-ascii?Q?zb6yA668OxUoE3FcgeaU1hstmAKoW2+DTLN+AXuRpJUgwKaMX56eSvjiWIif?=
 =?us-ascii?Q?L/CA1bHEHhU3jYGsyxwKV39zQrfwF18cWTDnaC0p++URb7Giu+Q/747xWVX6?=
 =?us-ascii?Q?fc8UV9Nss80ROSOX5lAEiM94mn8d/8ubq2AE1XkDc+akttjysaDvkdXHflhN?=
 =?us-ascii?Q?3djrrbcgzm7zrgY1MNHKt86FhnmNNq3Yku1pQQdxJNwSrUYxrhA3JVUYwt7V?=
 =?us-ascii?Q?BlffYPrvMHa6zbofyNUKc284FBJzICgOpqmNnjLukVozRjTPhUmuTAEntVSD?=
 =?us-ascii?Q?2DVj68uQz2nC+g7/T52XwIHed8f1PnK2Yqb2/ZsnkU9FelfYb+rbXe8cjbOL?=
 =?us-ascii?Q?DoeMAJhzZYu7waEEIcODYC/NupNpnJgGl0+aMNyuV4uACUAeUY8RQKyi/zQh?=
 =?us-ascii?Q?SYs1KTVEDz6Zj3trTPxzuxvGYYksmFpnAe7el3XC8Y8jStUE+no3vYmLasqq?=
 =?us-ascii?Q?+ryyXzInD5k1KB8PyhlVaAEh1g7eTaEE+Dp98IYQz9krAO8dG7FfLtMOk3Xb?=
 =?us-ascii?Q?I4uj7l8+mT4L5GPw6jZIGL3/LFt2LCFasqEJX2nPhCa3q98vZUg2JNOww4Br?=
 =?us-ascii?Q?LJlNPZw65YMtWV0KfteyGTb9gtsC/vcyyMYhwbLhLVIejsDQaEnkFd6lKgsR?=
 =?us-ascii?Q?5vArj4lI5hS06mFob067evqi/nb/oDod3SY6vz7tPevhW3akZznyAx7Yi3Dg?=
 =?us-ascii?Q?MX9BlSP2WYeRUl7kEN4jEQjTQsLK4hFfKoFQeXW8/BnAMiiHjgInfyzduVeb?=
 =?us-ascii?Q?wFEFJMoK2bOwjGG3sbs9Y20LBTDDdASzA/TUYRgE9+LsDGjKXsoPD7/uBN49?=
 =?us-ascii?Q?hO0Qc2hbxxe2804X6jp6ubjmKL8fcU//4MoKSldw05CfY1Nvmm9hLa9nCHRH?=
 =?us-ascii?Q?xYJpEwWdOa9lPCRNLxjhnsd95jMCPF1J/UI2e/REdU74DnmitaoQtnRF6lB9?=
 =?us-ascii?Q?CMUBjSb7eCRyZsrSQgBr5j2uIw+zi58WwmNlPyEZpSegETVBkj2Ku/kEjB2r?=
 =?us-ascii?Q?5nddLdhqY98BQPuxmjig6GbSrulJmVmlZvDCuvG3TiR3AI/k0MY9eWsKA8Sc?=
 =?us-ascii?Q?YbY+vZ4oA/xv1TBw6iUra/EhahXOhb/e1sgCJiIoq0ZrRolrhZkSfqEk2s6a?=
 =?us-ascii?Q?9dFG1TUt5jHDjvgVIXg18husdSvK3o33?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:58:49.6736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b2344d57-62ec-45b3-01b2-08dcb7cb6010
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7574
Message-ID-Hash: W6DR2JGTJMZXGTL653L7Q42FB3BWXSBD
X-Message-ID-Hash: W6DR2JGTJMZXGTL653L7Q42FB3BWXSBD
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W6DR2JGTJMZXGTL653L7Q42FB3BWXSBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused structure member 'rev' from sof_amd_acp_desc structure.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.h         | 1 -
 sound/soc/sof/amd/pci-acp63.c   | 1 -
 sound/soc/sof/amd/pci-rmb.c     | 1 -
 sound/soc/sof/amd/pci-rn.c      | 1 -
 sound/soc/sof/amd/pci-vangogh.c | 1 -
 5 files changed, 5 deletions(-)

diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 321c40cc6d50..11def07efc0f 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -190,7 +190,6 @@ struct acp_dsp_stream {
 };
 
 struct sof_amd_acp_desc {
-	unsigned int rev;
 	const char *name;
 	unsigned int host_bridge_id;
 	u32 pgfsm_base;
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index e90658ba2bd7..b54ed61b79ed 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -28,7 +28,6 @@
 #define ACP6x_REG_END			0x125C000
 
 static const struct sof_amd_acp_desc acp63_chip_info = {
-	.rev		= 6,
 	.host_bridge_id = HOST_BRIDGE_ACP63,
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
 	.ext_intr_enb = ACP6X_EXTERNAL_INTR_ENB,
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index a366f904e6f3..c45256bf4fda 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -28,7 +28,6 @@
 #define ACP6X_FUTURE_REG_ACLK_0	0x1854
 
 static const struct sof_amd_acp_desc rembrandt_chip_info = {
-	.rev		= 6,
 	.host_bridge_id = HOST_BRIDGE_RMB,
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 2b7c53470ce8..386a0f1e7ee0 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -28,7 +28,6 @@
 #define ACP3X_FUTURE_REG_ACLK_0	0x1860
 
 static const struct sof_amd_acp_desc renoir_chip_info = {
-	.rev		= 3,
 	.host_bridge_id = HOST_BRIDGE_CZN,
 	.pgfsm_base	= ACP3X_PGFSM_BASE,
 	.ext_intr_stat	= ACP3X_EXT_INTR_STAT,
diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index eba580840100..cb845f81795e 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -26,7 +26,6 @@
 #define ACP5X_FUTURE_REG_ACLK_0 0x1864
 
 static const struct sof_amd_acp_desc vangogh_chip_info = {
-	.rev		= 5,
 	.name		= "vangogh",
 	.host_bridge_id = HOST_BRIDGE_VGH,
 	.pgfsm_base	= ACP5X_PGFSM_BASE,
-- 
2.34.1

