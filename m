Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9197B83FDF0
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 07:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14AC8822;
	Mon, 29 Jan 2024 07:00:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14AC8822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706508034;
	bh=ymemvslKkhYGpyHpqh6Q/7RrSZIdxNF0MnFMcoOfCNo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rIX8kXPb/hs2YU24L2V8g2f1IEkTnb4vGyyR1AOuviaziZ17WXflL+jr0xFcyr4F2
	 xgvX7EVVvQ8RTwsAnMdZQbAmKP1em+KbaRrFBjsDMZuRzEVZkGvYiJdTCOWhFp2EGG
	 mrUacumYk6AYGCNsbQNMfaB0CPRmMzubqSPcV8ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47ADFF80687; Mon, 29 Jan 2024 06:59:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8200CF80694;
	Mon, 29 Jan 2024 06:58:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80EB1F80431; Mon, 29 Jan 2024 06:54:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0378F80053;
	Mon, 29 Jan 2024 06:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0378F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YYPgcgI3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SI8lIiM5vd//EAqcCZjvt75JNAE1dJsoPv8qI9STLXlQ0Z7hxIM6FshhJIVHYWzgrrhhsM6V8CIUpZHF6HMIks083TNQFyXN722DIUQgBpOTmHSYukw7A2rLbYXvTf7Tnj+bgRgQSWnyVJc+ya1cB+SJ/fNvNCEUM9W/Z1zT6zKueX6g9uUCsmo0TEH9IdGoFW/nY3BF/6LPC/qpPakUxWydihFq5V2Ec3w7z3gzyzz9JVdnnhLSAfOCj9me4owFmpkWEquyMqPXozuZcbF1TfryLBJxpyov9woVq1HJMf2VGqaY6YD6Z52L7IkfTQmpQM8ZbxWvaoHlw/93/dM05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtvoCZz8VSf1VRSZDCxvonKGlPrjlVR/2Z+SSopunkg=;
 b=blBaEFITrneo/5p9cptYrETyI1lSDI9RBT/GCZpV2Tr84lQ26NJW+aHthiOApOvXPKvaJl4DaaeteWeGSEkueAgozJCPN56h77y+rXMckM58FduJm3rjlj/6ci7+EqjjPsuHBaz1ZwXdHar5W9V5G/AUb/TeIxLBeeUcUo9RMu7hU95bllSeiPsWsLqBlau77d6iAnJV4MJQ95icbsshPKSiaK7txZhj3dsq4NYQFmMpSUmm2Kta/h2+VxyGAUpH9nkoREkeK522eUROlCUZCnhi4zltuCrXCpdRzT6WvjkaLV1vkbUgiBng6QBbvcBJc5/2tenU1kVM+FPnkihv3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtvoCZz8VSf1VRSZDCxvonKGlPrjlVR/2Z+SSopunkg=;
 b=YYPgcgI3Ugjnx4BB/J8fO1fzsBUFFpzTrYQJxsFaQb/iCc03NuG5qKq+f5ZDpiSRbgC0ZGkEUFDpdi/U6lFWpT/4OrYadKBFq5FbV6e/6gv9/rz4lzDqakqgbx0V8tXOsfqDN0oneotPPSvd1epZ3I0zFQ3RlBzWCrnUw8YTohI=
Received: from BN9PR03CA0665.namprd03.prod.outlook.com (2603:10b6:408:10e::10)
 by SA1PR12MB7102.namprd12.prod.outlook.com (2603:10b6:806:29f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:53:43 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::dd) by BN9PR03CA0665.outlook.office365.com
 (2603:10b6:408:10e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 05:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:53:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:53:42 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:53:37 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Mastan Katragadda <Mastan.Katragadda@amd.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V4 11/13] ASoC: SOF: amd: update descriptor fields for acp6.3
 based platform
Date: Mon, 29 Jan 2024 11:21:45 +0530
Message-ID: <20240129055147.1493853-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SA1PR12MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 01188fc5-154b-4345-5537-08dc208ea655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i0BqCi4CthJIJnyNUhX2L5zI3jC/Bb1dikFaJlVN2AWGXjzH4+igHHet7eiVr9PBUDSychpSTXLEZUSWBpSgR06HwzBKezzssWUhRRp0iTA3/mP97/a8sze2oaaN0CRXK3MkoTWhvYw9nCsDMOcITGpfoqjrfbHoBvuMP4wAQWCJRUu/J5e5tIndD/Sie6XSivqKBGtznc5CnIaV4R2EL/iwlTKtyKbsrk907zSdHkWSG+rz1htrMlnl42zedD3Hko3FdotrThbCdDErY0gtmxzPMIr7n4c94ui2LndjshLuewNkj2wt/NH2p4jHgL6galYAe5SrJoYUeTeXRX5tbV2ETwLQOj8Xk7uORYJkel/5yAoW0UnN3Wse6oO9zLk3ApEfdcCUdl1kp360NNp38fwWPY9WY3AgAagf9jZdMZ6QWv8R+nAyFZVgjjomwmP4ddClXK5vqmDuBzdfOtSP9mNOoSCiNWuGBHu8cQhklAK6YyjXmlGnqNx3LWrjMZLUOVFup+sOoMbWPB0uKLOgvgwMyVSdzZIgjML/ItZ9hyO8JKRmjCf+U3+qy5zyKlQvzQX9037ipNatalP0eVl9YpTIKRWoaPdO5bRol46KgUhuyoV1j0rrKB0rlsOt4wh2AwHWOgXY5QyeB/OCjcqt7oKOl0J9iUqD4m2H3uNP8O+lLxwP/54vgNtPHxMlY7iAHPZZma0WUFYjWe4lfVYjYk8ZKquTvGbnKrySkC4AD5D5i2O25wb9roLXtlZ8qSgtewkyjY9PfPavjfa5PucHEBN0ZTd8l1qwiYCQJBAiJOTFdhh3DzRB+Z1UAtlwmGFN
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(230273577357003)(230173577357003)(82310400011)(451199024)(186009)(1800799012)(64100799003)(40470700004)(36840700001)(46966006)(86362001)(110136005)(70586007)(70206006)(36860700001)(54906003)(316002)(478600001)(81166007)(82740400003)(356005)(1076003)(6666004)(2616005)(7696005)(8676002)(4326008)(8936002)(5660300002)(26005)(426003)(336012)(83380400001)(15650500001)(40460700003)(40480700001)(36756003)(2906002)(47076005)(7416002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:53:42.7354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01188fc5-154b-4345-5537-08dc208ea655
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7102
Message-ID-Hash: DMLAEUUOO5CTV4VFSKK4N5TN3V655RET
X-Message-ID-Hash: DMLAEUUOO5CTV4VFSKK4N5TN3V655RET
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMLAEUUOO5CTV4VFSKK4N5TN3V655RET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update acp descriptor fields for acp6.3 version based platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h | 3 +++
 sound/soc/sof/amd/acp.h            | 2 ++
 sound/soc/sof/amd/pci-acp63.c      | 7 +++++++
 3 files changed, 12 insertions(+)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 7ba6492b8e99..c1bdc028a61a 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -65,7 +65,10 @@
 /* Registers from ACP_INTR block */
 #define ACP3X_EXT_INTR_STAT			0x1808
 #define ACP5X_EXT_INTR_STAT			0x1808
+#define ACP6X_EXTERNAL_INTR_ENB			0x1A00
+#define ACP6X_EXTERNAL_INTR_CNTL		0x1A04
 #define ACP6X_EXT_INTR_STAT                     0x1A0C
+#define ACP6X_EXT_INTR_STAT1			0x1A10
 
 #define ACP3X_DSP_SW_INTR_BASE			0x1814
 #define ACP5X_DSP_SW_INTR_BASE			0x1814
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 2058dae32659..e94713d7ff1d 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -96,8 +96,10 @@
 #define ACP_ERROR_IRQ_MASK			BIT(29)
 #define ACP_SDW0_IRQ_MASK			BIT(21)
 #define ACP_SDW1_IRQ_MASK			BIT(2)
+#define SDW_ACPI_ADDR_ACP63			5
 #define ACP_DEFAULT_SRAM_LENGTH			0x00080000
 #define ACP_SRAM_PAGE_COUNT			128
+#define ACP6X_SDW_MAX_MANAGER_COUNT		2
 
 enum clock_source {
 	ACP_CLOCK_96M = 0,
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index bceb94ac80a9..eeaa12cceb23 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -31,12 +31,19 @@ static const struct sof_amd_acp_desc acp63_chip_info = {
 	.rev		= 6,
 	.host_bridge_id = HOST_BRIDGE_ACP63,
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
+	.ext_intr_enb = ACP6X_EXTERNAL_INTR_ENB,
+	.ext_intr_cntl = ACP6X_EXTERNAL_INTR_CNTL,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
+	.ext_intr_stat1	= ACP6X_EXT_INTR_STAT1,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
 	.fusion_dsp_offset = ACP6X_DSP_FUSION_RUNSTALL,
 	.probe_reg_offset = ACP6X_FUTURE_REG_ACLK_0,
+	.sdw_max_link_count = ACP6X_SDW_MAX_MANAGER_COUNT,
+	.sdw_acpi_dev_addr = SDW_ACPI_ADDR_ACP63,
+	.reg_start_addr = ACP6x_REG_START,
+	.reg_end_addr = ACP6x_REG_END,
 };
 
 static const struct sof_dev_desc acp63_desc = {
-- 
2.34.1

