Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C99C6E48
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2024 12:54:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124D0210D;
	Wed, 13 Nov 2024 12:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124D0210D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731498863;
	bh=UCiXsXvW+4wFXi37PcpEqtEtWafu07eWSuEbxmEcPSQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HGf4GGL3np3b0pdHehGTN0ZIm+NwCB1Ud/GI1tPIpCmGP58VXc6YKCSRQZQa90pzf
	 xjb4ZU56zRg5pmeS9YH7VMVA3AR3SR7L2XpE4QoYLVvPhziiB36VWvW62J+SL2FS7F
	 7MpJT3SY+veULQO6Vz80JkJgROPSxaa/TnH9qSgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 562EDF80638; Wed, 13 Nov 2024 12:53:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 359DFF80631;
	Wed, 13 Nov 2024 12:53:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C04F805D5; Wed, 13 Nov 2024 12:53:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 720A7F805BE
	for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2024 12:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 720A7F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WHls3LHt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfat5eY5VYelA+KZgVTTU7nD3nPh+f1nOpv56etgmwkfSpG/UB2lR8MtNxDgwh5oMnW+WRiUnJAItoc/gvu/HgvClP4HIYmtXwng1bMPa/EBrSeLxl0AAhbHkGo9WMenNwAEEGPhCej8WwHywCoK7QhOoWNzV7aCtr/uOkYWmvy7EeycBlzilnyW1fnsGrrCF4unZdlxsm5blnojLAXBBdYLfWu80HsOU55uU4FP38rmJhNspQcL8BvcP+XmSSIcEmccGfEyz0W2BOIcpahXDL0Re7BFbYfMDa7jl0UTOdGWjSM65SLmw1nCoY1YqT9qfdrZKXQPa+9RKOtCz69n0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZbyXS8g1vxaU/IBT2PE/QFCSozcpKS5slo1uqhzppw=;
 b=sboyOy95OWoXlvw1HZqI1V1cDsJoyqjcMUgSpMEdO/9vRQPb0FxddXiW66s3hnnH2PrArYswWMS9EMfvFCxqHM7/8PaH33eagoOxgaoyoENoo/ec0Ic6rOFfJVcSv3Wii8tjNuVHJeRn7uZNcPZ+SZ+GzFtekHXaQ+uKTLZJm0aMapsdn6i/T/7inuui5Tjspn3eMWF65t7pky4RfcAo/b0Ceujm4p5PUvC8sR2urT+p18ItTPMCBbhqxYqklcnneUBGu9QaerHfa0dSVG2PYIhFNSOUn2UggGFvuY32mzLLWgqt05C+kwbu96wFpUoEKjAC39dM/kSe5kNVZQQIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZbyXS8g1vxaU/IBT2PE/QFCSozcpKS5slo1uqhzppw=;
 b=WHls3LHtXAxADXBOTglwD2PC32d1kRvMaUUXXjpdZqvD+Dnz7dUjvmgn4v2ZyGGusEgzz/jQpYGPzptEZJybAbKlROrmEYSJLmF57ghCD47h5tf/qLGPjwQzZ8F2wkLPtQgYylSx5Jsi7querkRN2TpvVs6zYWOLB44Qqn2PBLk=
Received: from SJ2PR07CA0009.namprd07.prod.outlook.com (2603:10b6:a03:505::6)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 11:52:54 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::5f) by SJ2PR07CA0009.outlook.office365.com
 (2603:10b6:a03:505::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Wed, 13 Nov 2024 11:52:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 11:52:53 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 05:52:49 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/6] ASoC: amd: ps: add soundwire machines for acp6.3 platform
Date: Wed, 13 Nov 2024 17:22:20 +0530
Message-ID: <20241113115223.3274868-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
References: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 608f27af-b8df-4800-acf2-08dd03d9b511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wLQTaegggFrzOjugLxmJP5MTn31X7dnsZWdPS+pavxrUTvirs7/iY8ysAjwg?=
 =?us-ascii?Q?CkAAm41dgTuZFPuLRxPFRsLAIdIQBV/l73HMuUUWeQ1CzjuLrx7xjvM4mzmE?=
 =?us-ascii?Q?aC2dVFTZW/2+6ahZr3e3pQjX7NrVVH1sfXPaRd56qOflIKu2wqJqL+cyePoX?=
 =?us-ascii?Q?34oxkSO2tXuq8+dstshJgk4RmrM6fdHTnLGWkUnidkNRXSbm5zU65u5svB6H?=
 =?us-ascii?Q?4pBEBnXKY5txVjB+rPk8o1LvTbIgFw9ugKPhjXBQiRoEl32gCyxo5ofFs3t/?=
 =?us-ascii?Q?/8eW/4h4lakyjmPvP+hmUxDlaAVQgNk99NrbXrj8T60n1TJBs99V0fgxSlED?=
 =?us-ascii?Q?Cec99RPa/SHw1iEfGabPNU1QzLgW3iRy/snQ6yVmdm6UlbHSrduokqO35HBM?=
 =?us-ascii?Q?vkrNT1mFb0cgs7IG7pF3EGe9Jco4PnD/B1qoyZXaD4NKR+CJ7pX/qQzZ1Ir6?=
 =?us-ascii?Q?dO09+Pu5ze5lwYgZoT36v5BpYaWV9lNtuqvGU+cnsw1tXHf7mfCiYwk3ydh7?=
 =?us-ascii?Q?1eXiNgGMRQu47qT//dICet8t4nnSCPMuZKCDmCZWgAU+dQ5AHIdjvkHoBxue?=
 =?us-ascii?Q?zSkUtv8jBukj5B8t8A6L+DVVruAcwyFlp+iLll28Wj4kfDJKyvdN8t4Z/Yiz?=
 =?us-ascii?Q?0d5qvJfKbN3w1T9Vv83fSDkPGzcxM8UjiNUqjZR2gtn6RYW5QSGB2OXFKKS1?=
 =?us-ascii?Q?7TUZ5xOJy9d/hMaSASfReBpQujG5pSpcWRSKF3kbY9yBWFba287luIaZpjkO?=
 =?us-ascii?Q?03pzOJMtwLnqUe6vQQaGi+AVPWiblIgtnvH7kod6tfDCPxp1lSuIwb0TX+Pr?=
 =?us-ascii?Q?4vTHwG2wU8ViQSlPhdUsjCr2ePcT9Lqbw114F/kniTLU5pwCXtpj6QveK+qb?=
 =?us-ascii?Q?kTScNHO8ZQC05rzdEcud5C+ZiXVDCtbwI4cJN4T9RYcIMJCicSoIwpRZCp+a?=
 =?us-ascii?Q?sEMwGTUeWt02WrhjX9DSHRkTN/L14raTXIUzHFbYERQHtOnr/ugRj35NjhOH?=
 =?us-ascii?Q?Ozum5oKZzz320JAd5num42klfF5PWCrZLS4z63kZSuj4Wp4MJLPM7LlMrigg?=
 =?us-ascii?Q?NGEyG/2yKHK+c73PAu6cadJA+H3YVKHit/tSjqjUxjIO51ocuQMOK0dWfh1L?=
 =?us-ascii?Q?3mPcIfIhp6AaUwtwJqFZtlGiuxshXdwXZAlaVqZ701v5WEXz2ekagjeQQ3K4?=
 =?us-ascii?Q?eloMcCtpOCWWUczRyYF7hFN2x5KhGmssOy4NLO5RUdrSzBZm64MK+Qji0BJ2?=
 =?us-ascii?Q?L6J9O0fsXGzt+MbZUL30E0W8dfK4K7uks0Uol02nBYVIH+VTJwiN9yFlyJox?=
 =?us-ascii?Q?jDzxhiGDERpxGRE8JURZPimOuyVt47jDvz18qtk1h4QW3WT+8bhN9Kd7aOa7?=
 =?us-ascii?Q?uIQr5MOaEkRdRWL7OA7G/srLldfl5O9k0c8Bt6mJDYgcGbcOJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 11:52:53.5380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 608f27af-b8df-4800-acf2-08dd03d9b511
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808
Message-ID-Hash: 76QLIQEXA3WH7NBUE4FKWT2MFISFEZQH
X-Message-ID-Hash: 76QLIQEXA3WH7NBUE4FKWT2MFISFEZQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76QLIQEXA3WH7NBUE4FKWT2MFISFEZQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire machines for acp 6.3 platform for legacy(No DSP)
stack.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 4365499c8f82..a7583844f5b4 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -598,6 +598,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
 		dev_err(&pci->dev, "ACP platform devices creation failed\n");
 		goto de_init;
 	}
+	adata->machines = snd_soc_acpi_amd_acp63_sdw_machines;
 	ret = acp63_machine_register(&pci->dev);
 	if (ret) {
 		dev_err(&pci->dev, "ACP machine register failed\n");
-- 
2.34.1

