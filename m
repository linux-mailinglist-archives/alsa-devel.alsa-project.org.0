Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB7A591BD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:50:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E93766078B;
	Mon, 10 Mar 2025 11:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E93766078B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603826;
	bh=s/WWly/cpJgatNifk//WogQG6KSitOadda8QrMtizTI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NR7yq6vVakJ97itWeEjh9XEaQT+emcYHngg89OPvr0nABJOM6D+gU0Yba1aFzQA6r
	 I/ty05IQGya6hMXEFFR3OR7X8alIgrymY//diktOzOqf40aGoYFBTF6McpR2RJjMzk
	 gbMc6/KMHoy88pcFEOG2xTHaHxchsaLzklfPAwCU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A3E1F80605; Mon, 10 Mar 2025 11:47:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73195F8061C;
	Mon, 10 Mar 2025 11:47:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EE8AF80614; Mon, 10 Mar 2025 11:47:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81DAAF80611
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81DAAF80611
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MkG8YhKv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6pBRga1R/JnYz7sJwjWzflYArto51TEdYTpUeOF/NuM7d4mEcspJ+BcfF1MjfHx/Ez55mXpowuxn8Qs3S6ZluD+UgQLDErcFG9ziMFeAl7cpYpgEcAygElITQucZ238a/2Y7AT+U05+IpoS2O9XbfnSOCqule3WnarDcWoykbJ1e4N2Sdd6hFMsGdRr3+Fzrli+V/MVU99Ogcpe71GO1va+kRFSuFbIwdh720F6AQhmnss+ziU81hq0x2Ieqiq3Ixtj8qlSo1mI2cnWoXtG/QqhB6fQFcPOnRGWw5BoxjkZm+EMS6sEbbrt6YgBwFjj/glv1CvZIyEIqdkgystKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cxku/x04YNAtj5oGksTfSQh8MST8poCFvW+sEpK4tTE=;
 b=yxHzT26nm7wOazEVFjlAzUwmVsFV3pkB85jr1kDvYKnPcmOsKPlhSC37LQHf6Y53ISJgTaGGAS5mSkRJ6mCcdWHMGozUQfAodwU6UbG34biKLrPpVyOOa+wWymkVMVRw6WX55wYoMKp+H5OhSv1xo8SeBbWmzPjEbsZ2NmCYgJ3znGH4IV9zyEisr01tX77zOEh38AHoEw8OWOkuEHtdz2pPD7b3HBxkndo+1b9MRlNDDzApCvhJlJYB798BuM2Igkfv9vv0IsJCtho0nHoXiK4hs/hKuppindmWJx4gjmH8fwmRPQse3W4w6AHbtlsch7LlMml7uie03iEUw/R+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cxku/x04YNAtj5oGksTfSQh8MST8poCFvW+sEpK4tTE=;
 b=MkG8YhKvP/ru6Z62HXRtdzNTWXxxohJVQ6IdIVmFXSitUwirWvkFh8zl+7S2DknpJheviD73Yf3aRBEF01h4FmPRh0FL5dPgtO81mWH54RCuQJWDI6C9Sv2a9qVToXkBa3cXcdtPnKoMAtCKuVerFC5ublF6GXhrSx4PIYIOHZ8=
Received: from MW3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:303:2b::16)
 by MW4PR12MB7382.namprd12.prod.outlook.com (2603:10b6:303:222::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:47:39 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:2b:cafe::f9) by MW3PR05CA0011.outlook.office365.com
 (2603:10b6:303:2b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.18 via Frontend Transport; Mon,
 10 Mar 2025 10:47:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:47:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:37 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:47:33 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Greg KH
	<gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 12/14] ASoC: amd: acp: Refactor rembrant platform resource
 structure
Date: Mon, 10 Mar 2025 16:15:59 +0530
Message-ID: <20250310104601.7325-13-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|MW4PR12MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2a7a88-877c-4ccf-fd96-08dd5fc0fa34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gryN309kbCkKC2cpr8xyEhRyy1DvUrb1U3a2moaBiQlH8oZDCF3SxfG16ErI?=
 =?us-ascii?Q?OyKbQLfqnesk4imx9yzXTQ0TF5ZQoIGs3U7x0MvE28e5jx1zLAZpsp/OjNXJ?=
 =?us-ascii?Q?AA5VE4n5BwynTTw16UdeYMKOeynfcBgcWkIhLApx17S549seqLjDVg6OUExF?=
 =?us-ascii?Q?vEbSrLek1G115lfm9lDSdFOttfWFzFHtqHp2J6MKSG2AJ6ZSLg4vWJ92+eXJ?=
 =?us-ascii?Q?4LfAVy2if5O04uHKk4SQjGUuF66QWyzmQcSGcypZFel5MoFtCBPKJUO2bPt2?=
 =?us-ascii?Q?WB+xf078Wc+g98VBYkbDYxnc8BWcNIXGIkJas6+/UGdYUdG7Oj1c0cCr0owf?=
 =?us-ascii?Q?UzFWauQfyIOb9yiIP145qvWEa/vkqdXucVhXTLoMIibFqPbMVJq6xYp7Qdh7?=
 =?us-ascii?Q?3GGsMUQkeq/iKQN1wMYP5Ac1NE9GF0nVI5pQ8v/JnCmg2J4iXyQ/P1i8RCTe?=
 =?us-ascii?Q?XgCIWJ1LIHyoXiCiBlXvwH7LmrcZfdnaGUff/U1PcQEjcn17C2DoohKNDSRv?=
 =?us-ascii?Q?PUldX5MaaqtH0G43OdnasyQAM8lPLjzd8igc6REuIMjaDyzGLijT0BtYMeRh?=
 =?us-ascii?Q?dfubfc9ADqxI/0Y5YfY3p7KuKl7wFStckWTvj9ACsrREVwI6uP3pq7ijsZaf?=
 =?us-ascii?Q?Hbjlp8AOu7WEfS30bpG+IeLOfyEylS7cfC6XzvaqV92RgrbJVHxBIcEwQ/bH?=
 =?us-ascii?Q?ao8r+yjhHZHuoPISpB4Mo0ytX9UWvo9vp8eczyfjlGougRHhI+CcVuVHLru8?=
 =?us-ascii?Q?5zABG0+m/0oTVRXPY91KkCRa6wAn/Y1dduamNZGRkyTDdn2MFD2ZRjwrY61C?=
 =?us-ascii?Q?bqjM6kwbVJRD3jzffBAV031uJnevv/u90DwlytuHx0QuEES3Rj/YR0wT9W3c?=
 =?us-ascii?Q?iTwHfXvyu0Ez8jMFho5WA6ywFEu+iVAfb9JGMkXxFoJtfD2wBRMmzUapzlKK?=
 =?us-ascii?Q?0oZInMhht2Hwdv2o6wBZ7VjCucGzWT2BFArZ0/0xE7/rkmJ3zMMWjtQIBSD4?=
 =?us-ascii?Q?/kL7jFcIVcBVjd06UXjQ0zeEtn74bqNEKEZu3sRNqP8s7j2/hJ4Xd4dky9DW?=
 =?us-ascii?Q?zW7mGPVhxjUwUHEmV87qLpVNUdVu6BW8IwUq+HgqyUs3t3WnlZeY6VQHfHDD?=
 =?us-ascii?Q?AXFh4Zot/dhFqBoq/Nv67v2OHUJ1jKWYn14Thf+vyrX2vIrGsDh5Dpu6dFaR?=
 =?us-ascii?Q?JaKmAkpwVXHxt9UuUVcByISlPX/Bs451E+U+u+IbjM24fKlA2IejKFf9QU+I?=
 =?us-ascii?Q?oyhUz2XhgCssBfXC5DpiOOeF7KETfw4dQKjrYJzd36JMMSaNzepIALOMPiK+?=
 =?us-ascii?Q?f43hFuRc53zlQiZm1/c9Q0UJSpbTNip7nFVA/YUgQD4siG94qPvKYoO53FfX?=
 =?us-ascii?Q?HsEmUtEeQXlLOcXaMsJ/Jw2MYDtaiP0iSQz2tct1dyGX/dnQf/2I4Yf0IcJi?=
 =?us-ascii?Q?WegU5JJol2xmz9u4n+CduCTzLYYqnlR4J4cgw46Pu1tkZzHS9499tkK67GFe?=
 =?us-ascii?Q?t7DmBeXKKMVSXkg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:47:39.1051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb2a7a88-877c-4ccf-fd96-08dd5fc0fa34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7382
Message-ID-Hash: DA2LPJSZV62MJ6HJD64BUAGXGCSCM5E2
X-Message-ID-Hash: DA2LPJSZV62MJ6HJD64BUAGXGCSCM5E2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DA2LPJSZV62MJ6HJD64BUAGXGCSCM5E2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor rembrandt platform resource private structure to amd.h
header fle.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c       |  1 +
 sound/soc/amd/acp/acp-rembrandt.c | 13 +------------
 sound/soc/amd/acp/amd.h           | 10 ++++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 91c6476c7371..cf4794cc2f54 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -140,6 +140,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		break;
 	case 0x6f:
 		chip->name = "acp_asoc_rembrandt";
+		chip->rsrc = &rmb_rsrc;
 		chip->acp_hw_ops_init = acp6x_hw_ops_init;
 		chip->machines = snd_soc_acpi_amd_rmb_acp_machines;
 		break;
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index dfb18d5cdc7a..21614e2e1b6c 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -34,16 +34,6 @@
 #define MP1_C2PMSG_85 0x3B10A54
 #define MP1_C2PMSG_93 0x3B10A74
 
-static struct acp_resource rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x03802800,
-};
-
 static struct snd_soc_dai_driver acp_rmb_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -171,11 +161,10 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	}
 
 	chip->dev = dev;
-	chip->rsrc = &rsrc;
 	chip->dai_driver = acp_rmb_dai;
 	chip->num_dai = ARRAY_SIZE(acp_rmb_dai);
 
-	if (chip->is_i2s_config && rsrc.soc_mclk) {
+	if (chip->is_i2s_config && chip->rsrc->soc_mclk) {
 		ret = acp6x_master_clock_generate(dev);
 		if (ret)
 			return ret;
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 5f1d513148f3..67bc6b84564e 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -238,6 +238,16 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct acp_resource rmb_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x12800,
+	.sram_pte_offset = 0x03802800,
+};
+
 struct acp_resource acp63_rsrc = {
 	.offset = 0,
 	.no_of_ctrls = 2,
-- 
2.39.2

