Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A8A954275
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 09:14:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ACCD2BCE;
	Fri, 16 Aug 2024 09:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ACCD2BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723792440;
	bh=jSL9nMJYuRlFdb8sQpOSPAhBFE+rd2nbvNWdpqe+qvQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gpu1tc3hiKqHbxwQe+o3YK08bwiMqLT0ZkgQ5tWtI1oAGYAhapjf2zJIv/uTYQeeJ
	 QRf1vIenpvm1B3LtG3TTXZGQwpTVriDoW6VYCBNCSkiIDXoY794dqVMNJmrCoYrDiA
	 V8BOLBZ3Pd50UfQmBNSA3byCntXlVnSYBAJYaDWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B843DF805C2; Fri, 16 Aug 2024 09:13:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA4BEF805AD;
	Fri, 16 Aug 2024 09:13:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFFCBF80423; Fri, 16 Aug 2024 09:07:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CAF6F8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 09:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CAF6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UpXwTMji
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ8JCE/+4T9jsAPjhgD+WVyfcLYIrdCmMsciqI/ERSj8NYPjh+OpnuC7DmIWaaryFbRVDCfZfFezt1hQk8mkEUrHh0qIaOJOS28eudRboyL6F5ILdo0j4TrV6zTX+kaLDfl7X/8aDvWZjOnFkecB3HLbnoaFdoKGX6JIhUfFrTmITj5/YaI6sMTK6o6X2RoZaSYjdgIK0wRf4nAno8PW3OuLB/OqomS8WIjFas6gPPB+Z/PufFjeLX9ss0c7Ezkrh5VyeXIdHlXiYjavVebh06wAMYMNnk+ET29COM8B0XUinRndqRqnHi61H/cZw5WZsVcqnzJvBBHJVGneEmsLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjFOvJCQJsBjNYzDiMS0+9mMb+lqIJW/BRuYNKoMBbI=;
 b=jePnGp/pQLu+4eDLivOmxbep7Af/UAu05H20LzbWFkcujiJlm2FB4cuP2Ji9ZC+JPDmGvdvXqAByAn9uU8B/fkSy1Dmg9uKN0aTBt7+SBhZqKZrT52wlI4WtxElAhRiB8LkWPKBK6/JfpIB0V1U9p4/u6Y4OipcLVP9AcVITcpD+imEJdJgCrBZhh4M/XmUf3Zn8pj+LeQ9QwJjIL+hQ1ABY5l2bWs0iRlz//WRQdx4Yo6uowASAulTXMAR1Y1d3s9YVJFHzVmXG7XD2iS0ObJbag8hfnbIOEctxcOBbrbBy4V+8YB6uxbwhuoKdZNJZsXf1TzUSxe8l6TbsSFqW3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjFOvJCQJsBjNYzDiMS0+9mMb+lqIJW/BRuYNKoMBbI=;
 b=UpXwTMjioiyoVdfDBkLfXwBZcEWiYfVY5R6ez3lR/IpmJ5sy6NCMoxKmYs0o0M/nKjTLcrLblNR3RVHHt1TmyiusimPMvhspHEpp7tiJT3Ptq+ZbBP+Fn45LzL3BbqCt8LGgEM1ZTcnjLbG5OEGsHeyMcUDidTrDH7sLUH+s9eg=
Received: from BL0PR0102CA0066.prod.exchangelabs.com (2603:10b6:208:25::43) by
 PH7PR12MB5903.namprd12.prod.outlook.com (2603:10b6:510:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 07:03:46 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:25:cafe::65) by BL0PR0102CA0066.outlook.office365.com
 (2603:10b6:208:25::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Fri, 16 Aug 2024 07:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Fri, 16 Aug 2024 07:03:45 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 02:03:40 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <cristian.ciocaltea@collabora.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: SOF: amd: Fix for acp init sequence
Date: Fri, 16 Aug 2024 12:33:28 +0530
Message-ID: <20240816070328.610360-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|PH7PR12MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b2329b-3b3d-4ce5-1261-08dcbdc191f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IgG5yt2VmKsz+oIF+n3WkUyhSQ4oZNtY1FtPvLsfHK2qswxg3Q4l1xN6Y3PF?=
 =?us-ascii?Q?93MnZVMYRaJXDaHhMarC0Hlsco+L1P5U6s8QuKYgiOeCu/kMrWhzgwb0beEb?=
 =?us-ascii?Q?PJfQGlcgADtR6hb7c6IfsSbONr9+ONUmIKsaGkpKZUz678YR6MHIp2GcQHav?=
 =?us-ascii?Q?CxNuEVZgQXDacV/llHJZRPtw2FNzeWJWDoenzwjwkwDTffMWqIL2Dps5Y9SD?=
 =?us-ascii?Q?X4cTV8cZXs7MM5cMI7mq9WrqJzvMGPsJWgzLRicSvp+Aq5WicV3LBQxaKRJ1?=
 =?us-ascii?Q?RnKL7w7EFSQRIz8vVLOgrpnJ/PuciU7HXpElcGeMJFOo0Lj9rwC37tz05+cF?=
 =?us-ascii?Q?5nzf6ecfHGl/lK0M+bpfLMv+AzJPgtgn5qtCZ+CP32G+uuD7xNeIgZjgduQq?=
 =?us-ascii?Q?dWPSogQTR0R4cKcZwXL3rOIL7vRifOaNlR9zkVQQvO7WLY3N+Zo9dP7xbtHa?=
 =?us-ascii?Q?gHvJ9ylY0eQ0PwozG1sAdG+Qyx0JN5DC735h5ZsLtpaZdy72Mmq+BDSMtvC2?=
 =?us-ascii?Q?Zg9MsvQg/r941iCZn+URiG7lMQq1M+eh6XyOy8NorydLbx/IWhRaA8wQm6tH?=
 =?us-ascii?Q?KoUMnPYjbCstnGNYHjpwNY2nKyDt3oGwTEIZIkuLNejRd2VM/JOE3cYMNE9x?=
 =?us-ascii?Q?dt2/AEY0pmmpyYsJaNA01wTFRmSgZ4L9OsUOJAFH4KQ9Pg5Ov+vVASDx8l/7?=
 =?us-ascii?Q?jnwLXrdAnq9J3bvEtqOd5ibUN/azEtKr0w01Xxkb/kMZizC5dUWMnGEmqkLY?=
 =?us-ascii?Q?jl4JZ67zZp3Ize/6wLVD1woaiOBXy4FeaDq/J//sIsInHo/FNTO0q5tclb0/?=
 =?us-ascii?Q?d0fcjt4HcbbjudTa4LPjFFaEzQ/7+aL8SbIwE8IIJr8t2BmMLZhG1QZMVhyp?=
 =?us-ascii?Q?dsr5mMhdNS+GHYqLgf25HAIAFrZBdI+gRWsytFWasW2+rCIVj4gLJsaYCwZ2?=
 =?us-ascii?Q?/hoDtPqqxi1aO5d4qkCgMD1SA3KHWK+WtLoCg4Nf/N/dNL0qhSxc3ZUnpsjs?=
 =?us-ascii?Q?nxBtg3OPZ25PktSXYGQoljrVzwtq1mPp7huLiObuRMe8U5jnB44RvILtv+41?=
 =?us-ascii?Q?zWn7X2sDM5a/wiIShLVkLGOmgBNOj7bF2jTTa+DGB9Q1LBMr9eqG90zbmAfJ?=
 =?us-ascii?Q?oDwhVLrPtJmPUW+drMXnW+G5x/sT68DrOeUInxQbPdUHYEbA3R6BDh1MfGAu?=
 =?us-ascii?Q?yNkNWcZ4h87WWKyI6AqxNmIPcA+JS7VlfFfkZR4NOFRL632xV1NFuv+g52o3?=
 =?us-ascii?Q?UNheqMRPQM52oHnYzpBdMx4Xp1EXyP+Dn2myaZ5blOUyBC0iQ5sVo12ONFEx?=
 =?us-ascii?Q?VbXo5j+RFVdtnQ9ab856JJReciZxtd4xhm8BP4elJ0k5bMWW6Y1wsFRK7Th4?=
 =?us-ascii?Q?SRcKETinKw/mm9KQfEHNfrjKpjBB8pZQtvp3yvf0jQ9SLqn/ZLc9lgFhWNUp?=
 =?us-ascii?Q?v9+BRb7f4uRIB5OyFGWe2AteEmj7cv/Q?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 07:03:45.4434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35b2329b-3b3d-4ce5-1261-08dcbdc191f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5903
Message-ID-Hash: 5HI6ADSBYB3IAQMSVYQOQKPHUKJBIPLW
X-Message-ID-Hash: 5HI6ADSBYB3IAQMSVYQOQKPHUKJBIPLW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HI6ADSBYB3IAQMSVYQOQKPHUKJBIPLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When ACP is not powered on by default, acp power on sequence explicitly
invoked by programming pgfsm control mask. The existing implementation
checks the same PGFSM status mask and programs the same PGFSM control mask
in all ACP variants which breaks acp power on sequence for ACP6.0 and
ACP6.3 variants. So to fix this issue, update ACP pgfsm control mask and
status mask based on acp descriptor rev field, which will vary based on
acp variant.

Fixes: 846aef1d7cc0 ("ASoC: SOF: amd: Add Renoir ACP HW support")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 19 +++++++++++++++++--
 sound/soc/sof/amd/acp.h |  7 +++++--
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 35e56d22930f..0f6115c8b005 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -433,6 +433,7 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int base = desc->pgfsm_base;
 	unsigned int val;
+	unsigned int acp_pgfsm_status_mask, acp_pgfsm_cntl_mask;
 	int ret;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET);
@@ -440,9 +441,23 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 	if (val == ACP_POWERED_ON)
 		return 0;
 
-	if (val & ACP_PGFSM_STATUS_MASK)
+	switch (desc->rev) {
+	case 3:
+	case 5:
+		acp_pgfsm_status_mask = ACP3X_PGFSM_STATUS_MASK;
+		acp_pgfsm_cntl_mask = ACP3X_PGFSM_CNTL_POWER_ON_MASK;
+		break;
+	case 6:
+		acp_pgfsm_status_mask = ACP6X_PGFSM_STATUS_MASK;
+		acp_pgfsm_cntl_mask = ACP6X_PGFSM_CNTL_POWER_ON_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (val & acp_pgfsm_status_mask)
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + PGFSM_CONTROL_OFFSET,
-				  ACP_PGFSM_CNTL_POWER_ON_MASK);
+				  acp_pgfsm_cntl_mask);
 
 	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET, val,
 					    !val, ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index f6f0fcfeb691..321c40cc6d50 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -25,8 +25,11 @@
 #define ACP_REG_POLL_TIMEOUT_US                 2000
 #define ACP_DMA_COMPLETE_TIMEOUT_US		5000
 
-#define ACP_PGFSM_CNTL_POWER_ON_MASK		0x01
-#define ACP_PGFSM_STATUS_MASK			0x03
+#define ACP3X_PGFSM_CNTL_POWER_ON_MASK		0x01
+#define ACP3X_PGFSM_STATUS_MASK			0x03
+#define ACP6X_PGFSM_CNTL_POWER_ON_MASK		0x07
+#define ACP6X_PGFSM_STATUS_MASK			0x0F
+
 #define ACP_POWERED_ON				0x00
 #define ACP_ASSERT_RESET			0x01
 #define ACP_RELEASE_RESET			0x00
-- 
2.34.1

