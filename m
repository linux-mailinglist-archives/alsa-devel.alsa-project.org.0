Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2F594FFCD
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 10:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAAA822C8;
	Tue, 13 Aug 2024 10:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAAA822C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723537639;
	bh=y6sRrVgJw7sU2EYUbak61jaRDjCZaYVVDPC+7eUkx04=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h7uDtRpIJ4FzopA72/na82eSFyK4RfgObbsDlALe9VGg3Nb0hj7tVABu4Z/+SP+Ah
	 N1hF2qT2/+Y2iua+jotx3JtjdBRLzvxiTardjj/Ufp9jhekV3YmD682WwwjSJZn2Fy
	 pHG8014/HgIf2a70kQ7fNApnh8pts9nD6CedIQVo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56561F805AF; Tue, 13 Aug 2024 10:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE33CF805AE;
	Tue, 13 Aug 2024 10:26:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2D6FF8016E; Tue, 13 Aug 2024 10:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE555F8016E;
	Tue, 13 Aug 2024 10:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE555F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G6J+v/b5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgWmy3IbegshzOb3JKzfbMgGvUr1qXGPFvzdBt3tMW+kDbtbJpKCYslLG/sJ+EPZviL8ETZ0NUpdc9ffsw+KozqHLrA8Gs+ZJWUWE5Ozv0uP2Q73KSyUt3BHC/SzGvqIRTRkQu7vT5uTofP/n/RDFaEQGpWR2Cx1hp6PbsUAKKqMAf6rtlkz4/pKMAxtapQWuXRnNEMUz/M4xFiSz0YP3gNcNXb34IrkoLr1MTnkpG+jpMJVj1ji2+KYc7Cey5w3ZRYcJDB/au/sbeIK2oy3JUv5lqmH618/kfFLtI9H9g3Sm0IMvbSHE4dFaMSNiaI1sGKVT9PWU58FtwyrgUzv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6Pbe56QNxBS/cBGsiUUw5oW4rhnRgQ3Rp5tF6z9TRA=;
 b=I1GWzhHOK2RRNRJ3Kn1CKdLfT0STEpKC2tKSWa4xZPb/rxJbhPiryQYfBPnzKvxSeXHdmPDZlh9b/TsWte4czLE0ZOzTcYttpvIY++3OeRmonD2KK+OFS1EoJ4p+Ryv2B0uEb7p7EviFm9E6zeC6eBRXSpxGDhcZZ6nQj44XurrFafWNhWZCObI2ofcqnD8u0nf10eH/K6T8b7l+jnUnDWifzPXtA1iNvkrU2lWVinqKNLsLLNvc/G/5NV6pVGduNaFCVLVhhYqirv0GPTFMUJC0QAxW9jH3V2/oQ7M3v+0qwbLOr2m8656ijsLMPaOAIMTTCLDEyj3Le1KviFiVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6Pbe56QNxBS/cBGsiUUw5oW4rhnRgQ3Rp5tF6z9TRA=;
 b=G6J+v/b5qvvCroVNbHonUY0ebLrCvA5H9gysD37T33m7mRGJ6FlL6G2ZGgxovpVUvtCtGFP95Y8R8vDrFXQpxlVOIKQDG7XQ2QrJRgNtamp5FzUKRnYcYEeR3jair+YqFw4033l/8AEmzLG+aSe57/ZchEb9ldD2sVFXF470El8=
Received: from CH5PR04CA0002.namprd04.prod.outlook.com (2603:10b6:610:1f4::20)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Tue, 13 Aug
 2024 08:09:09 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::39) by CH5PR04CA0002.outlook.office365.com
 (2603:10b6:610:1f4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 08:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 08:09:08 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 03:09:02 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <sound-open-firmware@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: acp: add legacy driver support for ACP7.1 based
 platforms
Date: Tue, 13 Aug 2024 13:38:50 +0530
Message-ID: <20240813080850.3107409-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|CY5PR12MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 429ea2d8-5b2b-4988-5f7a-08dcbb6f354b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0ik/h+BkmRd6jBZrkQStcb3hGILmhS85HthD0g3OPEM6REMBKF/tXCZZuU8K?=
 =?us-ascii?Q?01NK9cG5lfuoP9rtHDtU6AjtAONkA0KMsjD0sny+6fJOWXwXQfimGFZfVtIs?=
 =?us-ascii?Q?iH0XDsBC9TyDoIYtSxo47bT3gKhrfJqrECK+44jlY0CkH7WrGZ7Tq71m7YG9?=
 =?us-ascii?Q?t1xe8SmKUepssFyNzDAWGYNirxkOwPmtYZmYAnc9skgD0XHACOQ0HrWaYdSu?=
 =?us-ascii?Q?pK/HsSFzZp3nojft43yJlELkVwQJY8GY/WnPSPiG06f5GSWnSl7ABlea9+QH?=
 =?us-ascii?Q?pQExKOtV0kJ0CL/8Jx6NW5eNxyq185HAjQ4aPiAGO65dZaHiQY6lOI38PKRC?=
 =?us-ascii?Q?OEoinqPDLv4JwwnoFkpPBiPI4FWGRQ7zNfjRqIF2otuj7bkS9+gb17JNczDd?=
 =?us-ascii?Q?gKZd29WUmJjUtddqPkg19MeNFakQMeLp16dnxoMqQd81TUSKkB31gleTY/As?=
 =?us-ascii?Q?HXgEEA9EEKU+l+D97oe4oYuCc7RqHDfa6C8IDDjLD/D6wjU36eZhQ/nnb5xR?=
 =?us-ascii?Q?X34D3hd06MYneB3RQX59uxnWvbvvjA2J0OFLfBifLsZvEIxva/8npw9Akh3D?=
 =?us-ascii?Q?G7+gv5NjP96oDU3p6n3cztN9EY++rw+kXpe9ini/PIj3CMCZ1cF/NHcRvhhY?=
 =?us-ascii?Q?y3ZeBSnYliNtuvNdQqRYJTuoVQc1qT0L6RbVjwBns/HWnuPQXB0DhlB87NBi?=
 =?us-ascii?Q?MteUN4vV8Y9+mvv+kVIHIpaGHBGIJoTYCnt6Rp7K/IyxNSo74EGt7ZMzVSL0?=
 =?us-ascii?Q?y3/nF9EcI5wpgxgxEAb3vNsNYyiULQMt0c7AEMuhO+ohCkWCl64sh5aXCQ8+?=
 =?us-ascii?Q?h3k0mPHz/fmg80Qvod6JXc82gdCK/WZYJiSJJ6rqyp/2tBQksqTt4zkvji15?=
 =?us-ascii?Q?/BnQQbr2LnOSDEuci2X0J8enqaSf1NuLRY5bVHzU1zYpPP+jkeKZIKf5HWMJ?=
 =?us-ascii?Q?+aMA926UDSt0IrHCA66hkEbimTftZH8i6MMSyvcsW8Lzawb8dt4wyuJRBUdK?=
 =?us-ascii?Q?VRuU7nLup8PIPH/lIhH36eRU0iCiBddY5r0BJgOA2slkh8R+Wtb6VOAZEl91?=
 =?us-ascii?Q?Ppp/mFIzTJ7uxW0UEVBWHdA2xxEVZ52SvK7ybRqWw2uSJbEAv09HGLt48BBc?=
 =?us-ascii?Q?YrHu8Bh8tz0Qe4l246X8RbF6AueMxoEM1lnhaKaaR35qxx3k5cX1rgPQVkRR?=
 =?us-ascii?Q?vbkMnBjlwGVXs2hpYYE7+8nDOwBglUQyiQcdQIM+n29zUK9GcH2RgAjXPzWG?=
 =?us-ascii?Q?kbJCYmp57+NzW4l5dA2P7sWzmyUtlr+zn1rSR9oEGcIJH835M9piRW6jSo5Y?=
 =?us-ascii?Q?+0gAuzrHk5p6XxPk+8TVtm+sGGXVXbUfB3in2UesXVG/7ucM8Df8+/yX9A6Z?=
 =?us-ascii?Q?HQUO2S9twEIOS2foO9PbMMPrXZ4UMBz0zVNcrl/KfZ6Rw0Tr3jhTtgCeZ66Y?=
 =?us-ascii?Q?Cr7FYPt4X2BQ9AZG+VBo90/kHjlUraBR?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 08:09:08.8726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 429ea2d8-5b2b-4988-5f7a-08dcbb6f354b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323
Message-ID-Hash: WQBY5ICHUMRQFFOFRI6ZXT32QN22WMGH
X-Message-ID-Hash: WQBY5ICHUMRQFFOFRI6ZXT32QN22WMGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQBY5ICHUMRQFFOFRI6ZXT32QN22WMGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp pci driver and machine driver changes for ACP7.1 based platforms
for legacy stack.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c |  7 ++++---
 sound/soc/amd/acp/acp-mach-common.c   |  2 +-
 sound/soc/amd/acp/acp-mach.h          |  1 +
 sound/soc/amd/acp/acp-pci.c           |  4 ++++
 sound/soc/amd/acp/acp70.c             | 12 ++++++++++--
 sound/soc/amd/acp/amd.h               |  1 +
 6 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 04bd605fdce3..3cc083fac837 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -270,6 +270,7 @@ static int acp_power_on(struct acp_chip_info *chip)
 		acp_pgfsm_ctrl_reg = ACP63_PGFSM_CONTROL;
 		break;
 	case ACP70_DEV:
+	case ACP71_DEV:
 		acp_pgfsm_stat_reg = ACP70_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP70_PGFSM_CONTROL;
 		break;
@@ -336,10 +337,9 @@ int acp_deinit(struct acp_chip_info *chip)
 	if (ret)
 		return ret;
 
-	if (chip->acp_rev != ACP70_DEV)
+	if (chip->acp_rev < ACP70_DEV)
 		writel(0, chip->base + ACP_CONTROL);
-
-	if (chip->acp_rev >= ACP70_DEV)
+	else
 		writel(0x01, chip->base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
@@ -461,6 +461,7 @@ void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
 		check_acp6x_config(chip);
 		break;
 	case ACP70_DEV:
+	case ACP71_DEV:
 		pdm_addr = ACP70_PDM_ADDR;
 		check_acp70_config(chip);
 		break;
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index a36300a4ed8a..e9ff4815c12c 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1766,7 +1766,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		} else if (drv_data->platform == ACP63) {
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
-		} else if (drv_data->platform == ACP70) {
+		} else if ((drv_data->platform == ACP70) || (drv_data->platform == ACP71)) {
 			links[i].platforms = platform_acp70_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp70_component);
 		} else {
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index a48546d8d407..93d9e3886b7e 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -56,6 +56,7 @@ enum platform_end_point {
 	REMBRANDT,
 	ACP63,
 	ACP70,
+	ACP71,
 };
 
 struct acp_mach_ops {
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index b0304b813cad..f7450a5bd103 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -95,6 +95,10 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		chip->name = "acp_asoc_acp70";
 		chip->acp_rev = ACP70_DEV;
 		break;
+	case 0x71:
+		chip->name = "acp_asoc_acp70";
+		chip->acp_rev = ACP71_DEV;
+		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
 		ret = -EINVAL;
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index a2cbdcca4313..81636faa22cd 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -147,7 +147,11 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (chip->acp_rev != ACP70_DEV) {
+	switch (chip->acp_rev) {
+	case ACP70_DEV:
+	case ACP71_DEV:
+		break;
+	default:
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
 		return -ENODEV;
 	}
@@ -178,7 +182,11 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->num_dai = ARRAY_SIZE(acp70_dai);
 	adata->rsrc = &rsrc;
 	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
-	adata->platform = ACP70;
+	if (chip->acp_rev == ACP70_DEV)
+		adata->platform = ACP70;
+	else
+		adata->platform = ACP71;
+
 	adata->flag = chip->flag;
 	acp_machine_select(adata);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index c095a34a7229..4f0cd7dd04e5 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -22,6 +22,7 @@
 #define ACP6X_DEV			6
 #define ACP63_DEV			0x63
 #define ACP70_DEV			0x70
+#define ACP71_DEV			0x71
 
 #define DMIC_INSTANCE			0x00
 #define I2S_SP_INSTANCE			0x01
-- 
2.34.1

