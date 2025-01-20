Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F5FA16A68
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:08:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 111D36026C;
	Mon, 20 Jan 2025 11:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 111D36026C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367708;
	bh=j0dXbttzGRbFr4b5SCpd2FdiHy5R4q2Q8BfATTD+7bI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n5uvDe6t9vCflY4lt2HGceCLuEEXbG64upwjgXmzjvDS4UR1+4WAmpTqOgY+K+hwD
	 xlpe4b5NV7mn/Gv/yFBlNA+szpF3erA8TUamk3MmFlLQm2teM8Yom1HGp6IjYDdrPu
	 cctj8OVWUqlZrSAncYifFqextqb7DdU4iHNxs0o4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E08E7F8067E; Mon, 20 Jan 2025 11:06:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC3D4F80685;
	Mon, 20 Jan 2025 11:06:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBC95F805D7; Mon, 20 Jan 2025 11:03:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95EAFF805C5
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95EAFF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=z19IzjyW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=damZrc+He06PrRzcwH57Ld+RPVORsmRWFlcLU6RlYZQWYAHeoKzy8Sru/ypWvn5JMTPStB01Rv/qDUDe0lVClL7VKAcUIMuPyqEFbvCnfxB0MGXJMPqJB343Bz/QmkHmQVIg4vqlEv7Et111E9d7nL2V9ELnEgKZhxqpM+TDcuGxai5yzVAzaajVRLlHVXlshlAlji7fVAWSnm3ck9Fppc1tJmqBHyCjVNEPHPdwyJ4MIvtqJwsR6bYCh7/aXzwUnbxN6bfu36LStXg6FQnwVNNBFTDDb8xu6rZggkAvlGQh9I/N1x6OzKT8oRzuXizEVaXuP5HavOtUfQt0D6jBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sK5GDptljTneowMvo6cqyRSLKuDUPKE+ULZeG+z5Ak=;
 b=AbgeO7H7Z235FCxAXwVxkch7XJKQdklf7Yg9kw3D85CwUv4kjQDXNDcbKB8ZGmVQqSCIBB7ul3tzcQxfqh+izIAcRyStKTTn3MeqOvlp7aqZ7I+/xiIN3S5erp02eMtZkL11PalMRGdZNLHZUXm7eA+U89V/sDFsddzIheakU2rY1voYmMvo+GtN3l7PO6JTuFf4CLidddeYVJrc2RM1iXsKx3QlDulkSwf+7L/zS1zaaKyjLVICt6RLmmuqrFKLAh0BxzTcymE1uguU9GKv7NUBqi6u7kgUWsJ+hqpb4pDMqH1oprrgl4W+bcpUgrcCWSaNZtQyNE4XZ8wbpKL18g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sK5GDptljTneowMvo6cqyRSLKuDUPKE+ULZeG+z5Ak=;
 b=z19IzjyWXpwOBXE4VNVrxRIOssBFzm/+woFt0Dt4aFLBJwtzJbyTLq3f3W8W3vu2g4l4RSuEKD6dTl8jen/xRIVByuht5JGcDQNzeIMuD3WabjrJ0MULjpzSx1dlDtSL9JQnWjjqFe7anEzgRhqYQqI7K/tTNhWkrLZLjAL2RVg=
Received: from CH0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:610:e5::15)
 by CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:51 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::b) by CH0PR03CA0250.outlook.office365.com
 (2603:10b6:610:e5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:02:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:51 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 19/23] ASoC: amd: acp70: enable acp pme enable during acp
 init sequence
Date: Mon, 20 Jan 2025 15:31:26 +0530
Message-ID: <20250120100130.3710412-20-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcbb85f-a435-4bce-a8a4-08dd393999e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Sf7L1/74GdRz+rNAQic85JkY4TDZZGFxIjZ6hcf8G9OKDMKDBo5gl/VY1FMP?=
 =?us-ascii?Q?epkjnlnXC1EgcGR9xz7ge2PBISq0FH8uaXY8ay/btwNSu51sH/OewJJZ5KRB?=
 =?us-ascii?Q?WkRZxDspbfyosQBddZ5B3oVh/uZ3byFYK2vs2mQFoEWPn0P6/B2jfM27sYDP?=
 =?us-ascii?Q?0l89rr0QD6arZQG0auskbcCnOJImgTU7/Ra5C9e4CU2sI9V65GuJoibfy5g5?=
 =?us-ascii?Q?vVJVDzHbyE8TBPh8EoZsuCn0UGBXGJgu6TUHekfa7tED7MMIkBbyXW4vPsqL?=
 =?us-ascii?Q?sqGZyAGnR3rNNy0sEAnyfPS/OKB/1unbNBYkjtJQqKoOOZffYBf2+D3oRoqQ?=
 =?us-ascii?Q?rWiF16p/G5H4L7K10/L35+CV/vFBk6mFW19Lo/8ufX7SMakxy2e/Zlyf0Z5n?=
 =?us-ascii?Q?ybY7Flh+tjbNHG/H4hofJpJFyb4YPm5vZq4QGByAZWi1urYT7rO8p4SNHXUq?=
 =?us-ascii?Q?wPjvoNW+9x1aMCgGD/WUhWttQGS0dbi3gOrbGLGpvkI0duAssKcIeGl+93rE?=
 =?us-ascii?Q?dGQLfp0Ya5B5TAZwx5O9Kwy6HmkZ7ip/VvFHPbJ8W48GG3fL7HtKA2yFOLo8?=
 =?us-ascii?Q?4QN4Zt242I93qovJ6Cql1CL/3mh0tIa/dy8heaiSqjs4JSX2Uu1BznlvGvr1?=
 =?us-ascii?Q?0n3yEMlhjSmCTFUiPmAw80QeRjijexcnrEyGcWSdPt3X2+1Qp+RoCHAH+sZv?=
 =?us-ascii?Q?JsYJp6ArDQ4pGCIlw2tPgnvU/SccdgjTMtuh8kt8T9YichYK096DYUs6ZUlt?=
 =?us-ascii?Q?IhK6RwEnNDyZx38E2X0ByLeGDsdeBV4/VoNiTKbjcsieaJn9FPqc0ekcMurq?=
 =?us-ascii?Q?y8Lo3iiFQTLVHiM3hfCXEMVPAVDeEUPwJmd3Nmj4Q9jpJW88xEE4eATds7tw?=
 =?us-ascii?Q?MeOFG4KrkKRnAyc1GfIoOHU4VX5Ww6ebI4aPCe3+0XEoAS1oCKEIU4eUnghZ?=
 =?us-ascii?Q?ctOUOLI6ABBFhtyP2hT88wzh6JkqdjNf7wPhxg8irxR5AER8bZVoDliqlDa8?=
 =?us-ascii?Q?eW5pjswMXknZNbbKUvvoV+/DSqQn5yL3nLgN7lwURv0Rwh1gMjiVzOUm7589?=
 =?us-ascii?Q?hvo1JIYaRe84e1ZkLrkRAddqKqpIDWY5tPdLduFXDK+YtkkNcAPEnBtu3+EZ?=
 =?us-ascii?Q?Eofw2CJPGwAZen2+zH0blxFMzxonaiTEcKCCkIBULI0yDd380k2/jl2226VE?=
 =?us-ascii?Q?qLPuBHMjG8c7KK8OcsdiNCjrEJhCWEANja928taxn6dK8xb9p74DQLOsszNa?=
 =?us-ascii?Q?v014FwQuPlJGsrfL4t1nC89LLmdAEGTt80qZPToHTXP50RWtGlRUoT58wjZS?=
 =?us-ascii?Q?gaFHevE+xCys315BdLjy3CRNt7V73pH2jlRxHkdcGKAeOz15omimugNvN/Yk?=
 =?us-ascii?Q?wpJkR+lND0SNl56u1aWYVz/33dCzXr5KmQXgLhFzfFyA2BBq8PAFD3Acfi29?=
 =?us-ascii?Q?vU2MZnvsI9Yt/x51hIqyQUyS9ghkH4WbyPgUDaeeqJVCvBAhWzs/RrTIo/dx?=
 =?us-ascii?Q?jPMBCJJMgQyGyNs=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:51.3293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7fcbb85f-a435-4bce-a8a4-08dd393999e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
Message-ID-Hash: O5X44OJN747S7UNMHK3NXFGXWFCIU42Q
X-Message-ID-Hash: O5X44OJN747S7UNMHK3NXFGXWFCIU42Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5X44OJN747S7UNMHK3NXFGXWFCIU42Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per design flow, set the ACP_PME_EN to 1 during acp init sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/pci-acp70.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 79b0ab96217b..e7da59a5eae5 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -97,6 +97,7 @@ static int acp70_init(void __iomem *acp_base, struct device *dev)
 	}
 	writel(0, acp_base + ACP_ZSC_DSP_CTRL);
 	acp70_enable_interrupts(acp_base);
+	writel(0x1, acp_base + ACP_PME_EN);
 	return 0;
 }
 
-- 
2.34.1

