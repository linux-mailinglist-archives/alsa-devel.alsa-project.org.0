Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E313AE1AA3
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jun 2025 14:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1F4601D6;
	Fri, 20 Jun 2025 14:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1F4601D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750421492;
	bh=YqVoR5uuAywnWw4eUOOZ14GsFpp3MT//oKZng2EbceI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhBqOdYo6EPP6AOGecwjYiUYYovVkvfqkQOi6X890cgI/DQ/CnulvjJCxd1DgMjX3
	 q9nq3f+CmW3dDzxQo55FahCNDTZgvpMY468EBhEr/8+PN6VOJ7riEQ3SWcINvmqp8w
	 CD2EccvSaYvfag5Wr71yweT1BHsaniOlKMDq00Aw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56A7EF80638; Fri, 20 Jun 2025 14:10:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01506F80638;
	Fri, 20 Jun 2025 14:10:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B518CF805ED; Fri, 20 Jun 2025 14:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E479DF805E4;
	Fri, 20 Jun 2025 14:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E479DF805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SReD+QQ3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RudmLtyPGAjBO22C7Em/HcJuty4aZs5zUnPCoauj6wKoon7/2gLIPJqnrP1UmpIuPbKOgQ4NdQ7tbJagf+cQOQrcEWglbXG2yBlotLhQtoDU7jlZu7zmDIqbFdGQSo/GmB/vzo6wj/Oqkwv3y+7P7nj4r06iuM+FhX7ciPebXjqQi14bepNExcEUOQYVbdZcGDENB2jTqXvXFoqaEODY3K23DA8qou3KKYyjBg0qGHNHUr3QVYlLVnI2KUjYE0ZEARWpFNg7RBoyAu5t6zPQTb3JVMKsdOLWVEHOgYrmoaQH/HamUCWzg7qrqYfp9Wr578n8ZLCBTV33m3EhOGJ/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq4ZSvWOmcQlnycmyVYqXJK6HheVQhCr5C0POVFc3zc=;
 b=T9/UHNrpS982/Sp17ntbEGQbfc1+ubmiihSPjvXoI0apMRdUY/WFptErWqfyW2xnoWduWMe85pzZUUhcQRWF0o3XBRrDPWxfwP0HEtsnoCC2CDHifkg1DEFgFhm6wmUczraY2zBNFMIUbXK8FjeMQHoHfB0X1qd/pZuZgLMqXFaPKg3UQHI2Y3gQLHA3GNHA4VFa4GZcg92kY7Exy9rCdg9o5WHR4OV3+Fwo3ENOiAdnHDBg528IaBRdC67ZuRqHa62lPIPx2SMqUZJIpli/Zm6GzuXg0YT/S6jBzB1M6BJdZE8BCY/7r0y3W/EwXKOAgLmmvp0ZbBPKWbW4+eRPFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq4ZSvWOmcQlnycmyVYqXJK6HheVQhCr5C0POVFc3zc=;
 b=SReD+QQ3kcDt4LJNQsi8EFuvrsKhN88ItnViiaiKCkLnxWmpameuxjOgA0alfRqqf+QjlalQ8+/yHTCzwM5IbD0PAUEnEpPc3MQA+0de38/havK7Ha9tyFJFPr/63U8FuphGX7/5Wg7h7gzTd1DV7Pu4sIPUQ5HxS3Iwi5IrYkM=
Received: from BYAPR07CA0032.namprd07.prod.outlook.com (2603:10b6:a02:bc::45)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 12:10:10 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::ab) by BYAPR07CA0032.outlook.office365.com
 (2603:10b6:a02:bc::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Fri,
 20 Jun 2025 12:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Fri, 20 Jun 2025 12:10:10 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 07:10:02 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/2] ASoC: SOF: amd: add alternate machines for ACP7.0 and
 ACP7.1 platforms
Date: Fri, 20 Jun 2025 17:38:43 +0530
Message-ID: <20250620120942.1168827-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
References: <20250620120942.1168827-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a3988e8-25a7-4cbd-c292-08ddaff36778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?86uEwqu9tV/Ck69McCBzCuc2PgSStVnovqF7Phu1r/xcDtOBl6t7Ohn6Ot/2?=
 =?us-ascii?Q?lXO2jynP/dvLFJ3OJGCvoHdvFlBXoyL0aQDWwQoazW+yYmQN9avIVY9zTFVj?=
 =?us-ascii?Q?LmxuX1uTgybd+DaJqyvNZMuM7OfUn9ob3YsM4Yriq0CV1+tDZd0ERKxS2MF/?=
 =?us-ascii?Q?ZqKO+09/dS2TKMWiyhpYOY2/EwS8lhm/n1w51Tf/2jCjAdeneDPch3uyoDBs?=
 =?us-ascii?Q?WtpZGroZbHFO6l+J4hk3FOKZ1WW9mnTPf36iHepFWEM/E1gYdLhzyj2f5lrl?=
 =?us-ascii?Q?SKH2X+KLvLXA6Yomma+SwmYHJDUt1XfIhPqixwi9hSt9ecUm2auAXpkTTJ/+?=
 =?us-ascii?Q?/S1GcDUw1CjqQsW9B7pQcoKgu9AIkBKbeXesF+Z4YhTr/NBMQ+bAzM39mHvz?=
 =?us-ascii?Q?3M0eFplqvFiZPfaHeGc6fjdbotGUtoK8q6hotob2w3sUvg+DqETfRtk2omUq?=
 =?us-ascii?Q?O/URQPGeIRW/31MymQzKT+sCDnK37jYABISsx7gOm+yqhyfBsWL6+j7M0wXM?=
 =?us-ascii?Q?Ck77h0dF+xLCa0LQkZAtCE+ntHF+O0EwC0rM2sdkWEO6YogNKtoXCzz1dtOm?=
 =?us-ascii?Q?1RVV3PnUCoi9ilMCUFdm431lKLMNCWm6lG4WbYFRSyjttR6mXTDe9GX3+GTA?=
 =?us-ascii?Q?QVDYJZHNohUcZCg3A2DeAQjDvx4fcFQ1xabVSAG2gF/IcsKoO5OHydte42rR?=
 =?us-ascii?Q?rZnaSOSYudB/QCaIUv9EenXz4Y2XHGOIeMFGAzcfbg128C0jJLY2v0t+Irk7?=
 =?us-ascii?Q?J9OopivWy+UlYVX/hMohjG34/LLDe3LNnM5hCdfiCLSYPvIOs3IkOOUvNCyi?=
 =?us-ascii?Q?pXg65naEtROmn4GBdaZCTC2cIrA3sK1lg9KSkxkWqYzM/yb9eAYOBd4uwwEv?=
 =?us-ascii?Q?JVUL4ep8Fr4zJN3kIgYhw/KxrqNybwoj3ZeZ7ZhxanA2GE/7RP8AhsF+TjSo?=
 =?us-ascii?Q?PkWHORkZwdd0hF+BFi850pLBAmwKVhzAiDwjPFvnO1ajzpngbjaoybdNmW3G?=
 =?us-ascii?Q?a351GVer9Uba15olPdmkgbIw5wPEC8++qgAGFzG5aY0soXLPrvoSMzjE05sR?=
 =?us-ascii?Q?rzFI1QK4jj1G5UbvbdvV7HlESBEmrC7uwE3zB9BacVvEckXX038P8y1IKxjs?=
 =?us-ascii?Q?pOqP3vvsCpKsp5Kywcp+YrcpWj2U0J83qZrO28DFeJBLyNI25/meQzPu/Y9e?=
 =?us-ascii?Q?ktQ1IPC7r6kJPKTgVZOGxC9uCRedQHP4SLNgb9gf0GrOsZ2NsuloVQv01paK?=
 =?us-ascii?Q?HezXPP/h4VuttbutrILg0gxAxReZv4SHHYy9plOWIh6X/xu7Rad4Poafm3Yp?=
 =?us-ascii?Q?r7IunOtajdk5eGb084kCBQzhUqOl+1fdEDRNEwZSotex8jgoOmXcpkZpA77P?=
 =?us-ascii?Q?BnQWGDe7faApOthT4pN9Sv8rLoFaPHm4ixsLlsi6V5CKI9aUttZyeAQjX3QA?=
 =?us-ascii?Q?i8LGgiTpp9/rOlXd1Fi8lr/IjpRk/AYZKCiFrLSFCZtmcohDB1nNhSS2Dz1T?=
 =?us-ascii?Q?eDhJ6+d9hBJK8hOtvitJ03GC6FnfbR4ZVsMa?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 12:10:10.3007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a3988e8-25a7-4cbd-c292-08ddaff36778
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
Message-ID-Hash: A57MRZD3VLGTA5U4CE43LSG2MZVI5QCG
X-Message-ID-Hash: A57MRZD3VLGTA5U4CE43LSG2MZVI5QCG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A57MRZD3VLGTA5U4CE43LSG2MZVI5QCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire machines as alternate machines for ACP7.0 and ACP7.1
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/pci-acp70.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
index c4db21668252..51d36d43c42b 100644
--- a/sound/soc/sof/amd/pci-acp70.c
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -48,6 +48,7 @@ static const struct sof_amd_acp_desc acp70_chip_info = {
 
 static const struct sof_dev_desc acp70_desc = {
 	.machines		= snd_soc_acpi_amd_acp70_sof_machines,
+	.alt_machines           = snd_soc_acpi_amd_acp70_sof_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
-- 
2.45.2

