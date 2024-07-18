Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438079347F9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2024 08:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1D3E7D;
	Thu, 18 Jul 2024 08:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1D3E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721283692;
	bh=2No4049t4sTE407B4RJ2ZcdeMToJJlGnjkcILZbqhUc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tN3rJQyqliAPhnExI1z3vB6twcXRQcTctjgUr6eshav61TS+4XkAkbt4+uUeIkslA
	 K4wyiSJZCptJ/JI3oOnNpwuLxHrRIZnIQ5IM0K607sg4PE9UVrbNwTvbjRTKPw3BbT
	 SXvxWaEP3+MW6g2L2IZ93Snpox0dUGqqnlm62Onk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E923F805AF; Thu, 18 Jul 2024 08:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35BEBF80508;
	Thu, 18 Jul 2024 08:21:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F58FF8026D; Thu, 18 Jul 2024 08:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5522DF8007E;
	Thu, 18 Jul 2024 08:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5522DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=w10szYli
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxhXJU33iD0KtxcobXZi70Zx7Gfe9ybxQ7S3yA7GsJRhxz2wi8LM0Cg1zFfSV4idwiDfcSwhHxdhFr3Rw6vImH5MamgQWG8z4wrKFtj/dQ7qqEHarPFSEkLoMhEu4yxmUEK7w0TyCIAy27lGoZJeGYBzmBV2UugRw8D5RVZyh6Zzw4r0pkR1ykzcF6SnFcv6y973ZGf/Wh9TmExzDQ+Z+i7QH8RPHb8abdUWYMJpR/RTjf0KsBPs5709dEC2JkRgmsFmMMTN01+LoYEkf2KPsglU3/3nPP8ApYJDct7UkI9uYNeUNi2YlcDbQy+FyvQt8U3srOWgLcSM1cW8fOcKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNW+V+jM92g1JHhxoY/KhwoLzBT/DQntOEgttqyCegE=;
 b=oCO1F886tADl9J5kAyMbar3VXErBwjZYEH6lqNxQrX8GpL8lfgK5uSEAjzL1BFXFlWMvukRz+W+u5dgtiCfF74rGxhfVADTJFlcrEEWzYLy7c+YuJN3BWZWRgFvgA0I88ktsdFHIEu1oFnN6yeZGptKdNDj/KYv9yy/u/bpVyl5VsnvPiqa4URO2/40fhRF02ALMM/KnrcubWq7tBhPf2mkeEGrycwnbxDxzhmTlb5GZcyLQrck7UTVWs5N4FpzKaI91LrylVoqOG/TFQLQADy7/bJAphe0PYRD5OZ55XdXHP+dKb4VrH/YkvxB4XC8PZ4XHxTK78blbqt5D6URn4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNW+V+jM92g1JHhxoY/KhwoLzBT/DQntOEgttqyCegE=;
 b=w10szYli2dDpfYW/ptk3NqjbGsau9iOvgQlzgHfKIOQY2WrRWT8ucRC4dYCTnVlM8JMjy7oeSph3Lp4qXD4v4wXW+lp2DK91c5CrCgk7g95gLYBdCQiA/WXtBvrbzIkrOcAvFIr3cFwsLn6iFPfCrbd0KZyoNbYZ+DLc7+SSGSc=
Received: from CH2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:610:51::27)
 by IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 06:20:27 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::63) by CH2PR15CA0017.outlook.office365.com
 (2603:10b6:610:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Thu, 18 Jul 2024 06:20:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 06:20:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 01:20:11 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 18 Jul 2024 01:20:06 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "moderated list:SOUND -
 SOUND OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: sof: amd: fix for firmware reload failure in Vangogh
 platform
Date: Thu, 18 Jul 2024 11:50:02 +0530
Message-ID: <20240718062004.581685-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|IA0PR12MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: 06aa5489-4373-4033-cbfe-08dca6f1b72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6NyZZfMkRroofD678oCJWrwlozUXQAfxQMXd0y3ROIdI4njqPyC2fOBTyQc3?=
 =?us-ascii?Q?jmm4Ja76vQ1DRmjsN4q4n7ro2Gb9/c+oF14wdF4NbCDc5qkTn32g5oxg1KbZ?=
 =?us-ascii?Q?szUW6wwirq5p+D8lrBcc8Q6dE5LkOGNvj8cLANXlOUeNEysR7RbLJMfRXAsT?=
 =?us-ascii?Q?+Czd6NcIkfPtjRj3QOZqAVIQh3i0u3GnHkzRBZMDsY6aSYaHTo80cvq2ZOk/?=
 =?us-ascii?Q?PhO8UqWpx9XZkwTTcDtDdrez7K3+2PGMnnsfvAosIBQVBn7EI9f4ikzze/yA?=
 =?us-ascii?Q?Yas3SyyHQP+UapPkUL3w0u0k9mytYUh8pNn/cm3W8GC1MbtElXFtHjPEny3G?=
 =?us-ascii?Q?cBE96rzMUpxAe8/VtersCFlZtKKYaVcRqLY32iYNa1qpzvcdHNuXMktdt5Iv?=
 =?us-ascii?Q?ONuJd9KRoZS8xEw/0AMoC5UEQbL++EloJvV1hqdF6c8sxIf0MFqFtg3DItnD?=
 =?us-ascii?Q?gmi0qhM1C+I0UOAuKdRW3q/lfjk4GS/TxlQxF7Q+a9gWYSTlZVsOMiJiJB7s?=
 =?us-ascii?Q?G3VfkC7zlLlNfl/2Zo90n83lVNDw7pZyTsmVCGAsxCXSAt60WBJb4laJmghb?=
 =?us-ascii?Q?/y5SHPg3MLO5wpMmvlX0WGknIu1S/jihaLDGZb2SIajyOohX+XQJfsAGL1uB?=
 =?us-ascii?Q?U3TLL9t64p089ZO2AJedxVfEBpnluWgW1cuJGLOyHg8AbBknk6GdzQIiUj25?=
 =?us-ascii?Q?an1G8wercON/yx/ykGZ8zrN8Le5qDLix2v44L6ef31SOj3x662PgNxG1aylR?=
 =?us-ascii?Q?rGSPWLnkRUGMJ8qj8F2xSyGTfpo91tMsF1j/zzplm4CylaxLsYd097pcnakJ?=
 =?us-ascii?Q?GqwmJAGm4K7Hc3zQMF6YAxOApj2gaNgfG87Vzf+KHJ+Polur/oD5rxvO9wPX?=
 =?us-ascii?Q?gnNES5i7uIvI12VtLtBcoyAe8bT2ohaqnG5q63xDMXT7pb/CCjBaiM2pFwQU?=
 =?us-ascii?Q?Gv6ZdBHI5vaDAHQJC64Y6q+HoaMUA4V2k9r3oIo+wXaNBpbLR6IAhTQK9md8?=
 =?us-ascii?Q?+wZTno7hmyO+NwPa8gwOUTV8Db58oQIkjT4Nt3K8Ust4FbeLCuGOIoGKZJ0h?=
 =?us-ascii?Q?oLa3hzndCNyRy0bMdwlJ6XvnpXhHB3rMJ4L+mOvrlfoWTjDbrO9V+wcgEQq0?=
 =?us-ascii?Q?4hsayRFvJ3ufewMQXa/geRfXTyRD6Fp9tfL+R9C6ArKXbTZSHn28n0jxHNP6?=
 =?us-ascii?Q?8mj45brYJI2lJ6nvL8Aj4ItCcHs5pXiXdmdMA2ZQXUi3ze2A9h8cR63DDSN/?=
 =?us-ascii?Q?Lk/L8Bd4qYGFcFJ02gLIcmSMB1wB274ph/2IzPbb35PPRIsGkiMvN6/WRTSc?=
 =?us-ascii?Q?ll2CFunqxnaEMiW5m+vMF/B0ST9/oTKAYG8bbNh3bUfgmXstjG7p4eCD18MQ?=
 =?us-ascii?Q?ewEg4BcSFUqwq3lFbJNWzKQlR4rZ8m7laMjVxJIUdcmvsYCnTsPSYQy21DeQ?=
 =?us-ascii?Q?j4YmHKL9UJvC+6NGSgHGXDYyvgcsxFuf?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 06:20:26.8766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06aa5489-4373-4033-cbfe-08dca6f1b72d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8713
Message-ID-Hash: MJPGQ3DDKZUMIVREPZPFIBKTHCCDQJAL
X-Message-ID-Hash: MJPGQ3DDKZUMIVREPZPFIBKTHCCDQJAL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJPGQ3DDKZUMIVREPZPFIBKTHCCDQJAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Setting ACP ACLK as clock source when ACP enters D0 state causing
firmware load failure, as per design clock source should be internal
clock.

Remove acp_clkmux_sel field so that ACP will use internal clock
source when ACP enters into D0 state.

Fixes: d0dab6b76a9f ("ASoC: SOF: amd: Add sof support for vangogh platform")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/pci-vangogh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index 16eb2994fbab..eba580840100 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -34,7 +34,6 @@ static const struct sof_amd_acp_desc vangogh_chip_info = {
 	.dsp_intr_base	= ACP5X_DSP_SW_INTR_BASE,
 	.sram_pte_offset = ACP5X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP5X_AXI2DAGB_SEM_0,
-	.acp_clkmux_sel = ACP5X_CLKMUX_SEL,
 	.probe_reg_offset = ACP5X_FUTURE_REG_ACLK_0,
 };
 
-- 
2.39.2

