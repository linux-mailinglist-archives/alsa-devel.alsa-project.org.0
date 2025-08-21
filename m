Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF6EB2EDAD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 07:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C90E36020A;
	Thu, 21 Aug 2025 07:46:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C90E36020A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755755222;
	bh=Fe0pSRLKUxN/6GFETSVmxrgVErFelzGCziGF/H/S5VI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b/sCtJJt0QhesqMoILiFQIyOjFiAwWRKPBdj8IZ5tITzujiUJj1FTtexgnrInP58B
	 R5gRXKuy5ECT4Onurdt4e9pAg6qjnKKtYbauX+o+OkK7+IW6n2fDaUbxalwumN4hms
	 ki9LVEGweiuX1iorIRvocp5caePzPGVjn4Si7ogk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D743BF805C5; Thu, 21 Aug 2025 07:46:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F22F805C9;
	Thu, 21 Aug 2025 07:46:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44E1FF80518; Thu, 21 Aug 2025 07:46:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5C38F800ED
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 07:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5C38F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=19TZ/8A4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnGnrPHmpEIv9834bDgbI5WZI8fha9XHTgoYeFkVaCHsXxyWv2Umm4Z8HjPSi087XlVgjAohhJ1TaA7d1W9fsJv8J5BkuNV4JY/vRyaf+C3le/DwmvwgbuWV/2SI55WG1r2TIaRQf6lUm7ZluSpxXdfFMNR8aP/KlLWc/2RxADpJH1nJpfIZTP9clf10uH/wDVC4XLryUIq62RPqpO0M1FiNThAJMszbxR58fC5F6HVB1R287Yl6tvoOb+Te4lQkJrjn1WCtU6Wo5JlCcnOlQ7w7dqC4pME3zxIm+KZLdDo3JKHcozQh44e9/J49bnglmqj0DGMeJhawBYUE7jsvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fuk/0H0XSnRyrrkMOHNfWG6NzPm2JioMWFqTVL5yoTk=;
 b=VUtZLVUIGJzLwZVijpCBEeoj+4ByIh0+hDGB26Dd/F+4SyZm1wJ/Gnsa5iceiE/NehSkklv9yyYkF2+GMCwN3tV6WeQ2v52TYD7i/pIIaeWV+PaFzr6VqBApSlVVLU7IlvPLmd9bOL+hAdPopKE2Au0WAaa+Wv1tI8GeNZXJmCuw5F0yprl4rGTKG62rVkYFjgLDDnEK2KUS94nDfneeSNIAUfEhng/pguBATnPeHEHUKoUQL6xgZbiH1Jdl6FYr8S80y1Kjkpc8aj30VnkUp+54JxFhGjAMzMat45dVuRf3l0MiMGM+nggCA0UdkobhIpswcUnx+ZnqKHD3Oe7KpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fuk/0H0XSnRyrrkMOHNfWG6NzPm2JioMWFqTVL5yoTk=;
 b=19TZ/8A4NlLpvv8Uq7cRC3HgApSLUjLrUE6DoeMHXyqMsAqR/ZQblpwpi+tDCncPeHykupDgQyJF8yuxynQAiDunqrSLT62c2sBufsokMvbEExCNtNhokdB58de1AVn79LcOgFcQjLUgStW/cbzLu0BctETrV/BQVgrzM1KnuQ8=
Received: from BL0PR02CA0124.namprd02.prod.outlook.com (2603:10b6:208:35::29)
 by IA1PR12MB9739.namprd12.prod.outlook.com (2603:10b6:208:465::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 05:46:11 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::cc) by BL0PR02CA0124.outlook.office365.com
 (2603:10b6:208:35::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 05:46:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 05:46:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 00:46:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 20 Aug
 2025 22:46:10 -0700
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Aug 2025 00:46:07 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ASoC: amd: acp: Adjust pdm gain value
Date: Thu, 21 Aug 2025 11:15:47 +0530
Message-ID: <20250821054606.1279178-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|IA1PR12MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: 748fc209-ab97-464c-9c43-08dde07608db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zh33A3OBsBLS6TA1bknD1a5ImbHTwYDazg9VIzzB/zgDhserxIbSJL+K1Zf2?=
 =?us-ascii?Q?9hw0SUcCr0Ef+meYF6XzCzIm6Txm78+61D/T0K5I26s3CTyUM0Xb3ppp1No8?=
 =?us-ascii?Q?RM3+m/07YMOT4qDdx8Ps6sWhpIcrMmtzXzPxgbKDw0yffRZGELxHBKG1TOUO?=
 =?us-ascii?Q?utNGWfWh0RvpbQJHjdkqUV/gESYcrQ6YZUvQUS8CU8JxGth0+9teRZzb4oqM?=
 =?us-ascii?Q?WEQYjjsHfhjtl29533IggYM5AVpf3+XI+cmc0wHWcDSf9FvUCuZABisE112N?=
 =?us-ascii?Q?0Kf3S2zVzurgRZmKiXkwo6LjtevWpQrhdOhkHn8saY178d7vQ/I4Xjq2Cefb?=
 =?us-ascii?Q?VHY3csRcqtH9lPNFdGS9DQcrIz7FPKfE8C5pBYOAFU/NS/HLc01hcR08u77w?=
 =?us-ascii?Q?BnAtjDPXySotnY4x1+0jnTgf//MgPdK1da13WyVR1Wwa6zCzTD/WpIVLcbbr?=
 =?us-ascii?Q?D4+UnZEnjJ0ehSo/mrjpwU2OV2NLaFQNd/5dt7IQztCt0bEdCaCyvnSHPxsX?=
 =?us-ascii?Q?lE2q9XZdWgIVsB3khjnQCe0zaIOUar6pAVUiou+MSC52+F/zW0evkRjWeU8B?=
 =?us-ascii?Q?V6of0hs3G4UI8zUK1jz+hxh7PkSVCBzfZ9D6++dce7o+4rUxGn2CHxdCpOP6?=
 =?us-ascii?Q?KcZxKB+9O1cCTHWG9umyV72ArNCyATpp8oh+CQRgf97bJb7t3TkJShuCcXr6?=
 =?us-ascii?Q?JtBTUG4OUiKcOz5zLQ5G+vtDKKH89+wqordy1+gN2+9gPOZ/eJWPLJdFo0bU?=
 =?us-ascii?Q?5JPsKiXVsVqlGLJQ3ZuB8QejLrLI3T+jaT8Bj1ve9QhM/lRSI7/1Xv4t2j+9?=
 =?us-ascii?Q?Xx2MSfRHc27/RKFI4NOF9Nv8CBqOG9RcqlswRfZD906+IMdaO4kVp2YwyiqS?=
 =?us-ascii?Q?mpDa5oaGquR/KvnPFv4av/DFQahAF+etHyiVqW0djy2GOLZt3UxpvZ2VrNS3?=
 =?us-ascii?Q?rciBkTbPs3rowzvry+kgOTaLHjWS03BLsGh4hUMwRDr09IhHX4kULeEHFfIC?=
 =?us-ascii?Q?5RPdQDCy50ZmBOtPnna/5N97FsCXjUWQ7GXMc+Wrp3st+4r0lVwvaFR5f2GE?=
 =?us-ascii?Q?nTRs853cRoqE6BjhcQXdbezJkAO0kX50OY3LRYEdCZGFOopGH7fwwWNsdkbg?=
 =?us-ascii?Q?G4EJgQf7JBrqVkKFz104OARWQ/dQ22AmgKrf+TwMC6XrbCWcvHBHunkNG6qF?=
 =?us-ascii?Q?816x6eB7AHywpf7sicCo+zNoLYDy5ziLXMqAgWr8Lo0pzHDUGtb92NdOPpxv?=
 =?us-ascii?Q?cwyzgmhYIfe1u4c7szq8W4TRjZ6Ae4hpttMd/TcW/B6Igtr2gCjVDLya7Kvd?=
 =?us-ascii?Q?AU4tFi0YQdzZp8A4C77yEGJhrlQB+LLGUM1cn3w97kjFQ0ufyaSvqN/gphI1?=
 =?us-ascii?Q?Y3IwUbYAW3m+2z3U4/G8vGUV1k9gw68STzwB+GS8d89bj7gCYiYogqIPSj+w?=
 =?us-ascii?Q?Dmg0ThkcVKP6P7G/p6aBH6osPbd5EIRj+CKb4WwSBkIMkcs8Er25Dnc8GWdv?=
 =?us-ascii?Q?e+1fipb7XJsqVIcLOtQ+vwWKtz1QXycRMNdi?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 05:46:11.5441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 748fc209-ab97-464c-9c43-08dde07608db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9739
Message-ID-Hash: SOB4MIMPIXI3WFX4WSPT6YNPZZXDPIYB
X-Message-ID-Hash: SOB4MIMPIXI3WFX4WSPT6YNPZZXDPIYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOB4MIMPIXI3WFX4WSPT6YNPZZXDPIYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set pdm gain value by setting PDM_MISC_CTRL_MASK value.
To avoid low pdm gain value.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---

Changes since v1:
	- remove pdm gain adjustment using module parameter.

 sound/soc/amd/acp/amd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index cb8d97122f95..73a028e67246 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -130,7 +130,7 @@
 #define PDM_DMA_INTR_MASK       0x10000
 #define PDM_DEC_64              0x2
 #define PDM_CLK_FREQ_MASK       0x07
-#define PDM_MISC_CTRL_MASK      0x10
+#define PDM_MISC_CTRL_MASK      0x18
 #define PDM_ENABLE              0x01
 #define PDM_DISABLE             0x00
 #define DMA_EN_MASK             0x02
-- 
2.43.0

