Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95322C75790
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:52:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2620560241;
	Thu, 20 Nov 2025 17:52:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2620560241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657551;
	bh=KQGld46iLHxFZT5YGAMlNSWKcDmmWBb596j9BJ9Bff4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i5chWiVqXtN+3uw8EBhqiUf8czaAMNDW7Ub3/fC4DPLQaRtbdoe6d+YAZu7LXRYI2
	 DRf8Xc6Yc806Gmy+e3FA9vrbLM8L4IwH4tHOd4hazpUXYem0VbgKl+bD4+0eN/e5jY
	 QDL6/+P2QDD1o3UN/5gydLxrnEu/RLxj24rbTfMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A29CEF8061C; Thu, 20 Nov 2025 17:51:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAFBF80610;
	Thu, 20 Nov 2025 17:51:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70836F8001E; Thu, 20 Nov 2025 10:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82574F8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82574F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=PCLpejV1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EecPyh1FEyu1aF1UNhUoGmfTzHniQzAWHtoQ803qAy6bwgK2QEkqwZ5IuCyYXhg5dEr1tRTggCNphF/aU6plAwQhoGN2r6uqeFPXTDDAj8ey7RhHT+07zSCYk0wun4sqG7OYjdOnbBzmV22xqH5neVoxDEn+JGLaksgL/GusZ7BbOQjACu27skTmldy2E5PN6yRmlJKEtut81D1Ryo9WsyQg/KslxD9RD9lohfqnUQWofgdEjHC+ZEGf+FS7kuNpV+WRyLN//niGYXXhvXsjFY06Iaf/5APaxjpe76F/f+yuWpeB1GbKTvnQxT8I1cvi/r0Zw4bqZk3Dli0x9/ooOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riW3uclwYsh0j/82vdrwquNahBLIirzDwuORJXZs4w0=;
 b=Npg0Qg4ogduwCvM/JPsrjbBodGbNPHmgy3j0Ops3LC2ZVrUyzzrC4lLCb0Nu405rJG6lo/Tw6bE0ovPUnVCMI1G+GbLN230jwp/wBmctMAGBftYihfogh02uAceg/Ez83cZ3Zxrn96rMHfW5D91QZmPWITIpK7us4diSzpLXdUpAaDUTBi+W9bxEeFRqnPqJ3K4ql4FqAnJhz7DJtFuAvjTYyuaTkI/UUn2aC74XYX7negrWXVGUuzFlWoTTiN6kEuHxoPIqfOJEypJPdPRQhDH3qY4MsY3ETFNsXgjKRfjlMjJiMUj664URgSGjbSMCux1JlqfK0ZD5s4tljNgy8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riW3uclwYsh0j/82vdrwquNahBLIirzDwuORJXZs4w0=;
 b=PCLpejV14vYa2rHp3ytyBkCIc0xKmP/2D3yfvEFIa0XVvxnPAC03mCr+cInhAggtnfLUy5uKL3MhZPnT+nxYPHY7BwGsnFQDA66VSDO8uLHkMg5HqYKxEMeNcVKj+5OU7iPQyUEPfbnDR5qfG/sKkLL+hOu+0ypyPKde/96wWHI=
Received: from CH2PR14CA0026.namprd14.prod.outlook.com (2603:10b6:610:60::36)
 by SA2PR10MB4444.namprd10.prod.outlook.com (2603:10b6:806:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:21:31 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::e6) by CH2PR14CA0026.outlook.office365.com
 (2603:10b6:610:60::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:21:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:21:30 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:26 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:21:26 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c33383883;
	Thu, 20 Nov 2025 03:21:21 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <ckeepax@opensource.cirrus.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <navada@ti.com>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 3/8] ASoC: tas2783A: update default init writes
Date: Thu, 20 Nov 2025 14:50:45 +0530
Message-ID: <20251120092050.1218-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251120092050.1218-1-niranjan.hy@ti.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|SA2PR10MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdd1d60-271e-4cf4-dbac-08de2816309d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SfSg7JFy/sb9katHyaafPt1naFoHNTp8gDXhoG8BCBXL629AqddequWRk70S?=
 =?us-ascii?Q?K+9XrLsv54ON5IVUBkN5jEOcEuYJYWwZU+caZi79Q4M3cSboOcFmhKmCii8P?=
 =?us-ascii?Q?tXhhpKBsKFGEk4e48GmTCr2h2PCMO9RpNISa0/5+rtvKpj+i8cLtS69tZqdJ?=
 =?us-ascii?Q?wzbFQK0fsntK+Q91RDG33siEFY5RNZdiELgRKZn0jptOLdMxSBHggviC22dY?=
 =?us-ascii?Q?NjMZLRtKvYk+VmVLVF3ks/qtOZF1MRIPkm1EtecRnFbg+WffTLv3w50DW9Fp?=
 =?us-ascii?Q?Wn5IHlMEB/ymwXgIA85rbH0IQHi1G6Di6ZCV9eckg8Xorwm12NuyeEsZFe8M?=
 =?us-ascii?Q?jjtcsXm5uPCH/DJkt3WMNCXOaxg0SfxqNybLQDqMDKTIXp26gHdFhoaobw17?=
 =?us-ascii?Q?ZBsMOERbYbpHkt3k3S+r2FqBoMFqDg81noIMt1djRAlC1B9o4XIPvjVmVDij?=
 =?us-ascii?Q?axf8p2tzEjHZ3nCbNIODc+843rJoD6hrDpI9TOueBENcrzvk4FcRONGcmULj?=
 =?us-ascii?Q?cOvLkD6rzZn+AMVHMZTOyURD5+QP7PsZHVJ11x8ATwmAbWSL0qMSjcMyh0nR?=
 =?us-ascii?Q?zGCFMQAYtM6YYc9eL0Ru3hcZeiUIQoP0ZZo6TgLnXRDgi2UclnWJs2Qsb1ul?=
 =?us-ascii?Q?iaqKqiATLD0FMAgCyPaHvC9Pqtk6TIKPpfX+MS96cCuNGC1FX1dlXC3dQ1bi?=
 =?us-ascii?Q?6zUsNfK9qAmgAHO8N7Ku+yHOim4IX8+M7Na7MaW0ShySPFHBMUPbul2BwzqT?=
 =?us-ascii?Q?3CpheSzBmkKJmxu1GeNcs8SaG6LT4SB935EfL2MwPLibWLwNZvEpZ2VrplyN?=
 =?us-ascii?Q?0WLkLQQH9vDkd8DcJPRkeZ5XXxs4/w9rGA6Y6tQ8szzyUCFIl//2EXiRzxOq?=
 =?us-ascii?Q?3qt5dLDcRtWo6I0VvegLfE/z4LRMhseE3oGTB+iyp0SYizLGgMBjjg9prCDT?=
 =?us-ascii?Q?Igug4hS8fSomF+KNPFWAamyQNbqyTyubqbxD1TXToJ/eFuxKbHcy56UzqLFh?=
 =?us-ascii?Q?mt1vK4FkKxjcApOXbZ2uTHnPG0r9ohoRpiRV2K1h0hOkwRbPuj34rCHOIylQ?=
 =?us-ascii?Q?uz4I5iyPoo6AuAxxk884a08tLSx0uEGxNfBKKJEQauO1+hbiaBIUjuStnI37?=
 =?us-ascii?Q?0BuKS8V0yq8zPDPqSSjRsFf5XAUBwJYmq0W59zlv+zObj/B55B9JKatKb4uc?=
 =?us-ascii?Q?5hTlPdbUEToerZlP5rPNfTkcK6kV+rEldL7mTXTQxGbiCYpi6aArBoxBM7oC?=
 =?us-ascii?Q?crYW0bJUt3na4qxsadzWl6U0S5lxW8ZdaAIJnN0RYpy4By7svRTFrzWrWDpV?=
 =?us-ascii?Q?PeXAgEGgDolcWMKFjX0MgWcLr8DAEXY3/DYeARciQCdsBB29dhAiO4LFcdWW?=
 =?us-ascii?Q?OkEOccHU9PRXy+4yRN1nOwzkaWon3FWrT1/2J2ozNEhXU7CciZx6x42GI6Q7?=
 =?us-ascii?Q?Pul7ZLND9g4IcxD4s1fFVsxwftWl7xIc+AZl/W2tEG7V9SqSGXuB4Wdgi48l?=
 =?us-ascii?Q?+9vh4Q+I/ZhwjU7kLuRyHTXK0/ys5xHPmEInop8/8gCy6CEcyDNaJkultHyT?=
 =?us-ascii?Q?SvRhXxHdZ1cCSkYnJ0U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:21:30.2548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bdd1d60-271e-4cf4-dbac-08de2816309d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4444
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QXPZ6ECOYEVRKZU2SIDVL6VDXMSNAY2Z
X-Message-ID-Hash: QXPZ6ECOYEVRKZU2SIDVL6VDXMSNAY2Z
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXPZ6ECOYEVRKZU2SIDVL6VDXMSNAY2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  Remove unwanted initialistaion writes to the
device which will now be part of the either firmware
or acpi table.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 54 +---------------------------------
 1 file changed, 1 insertion(+), 53 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 6a0644670..bfa925dd6 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -297,7 +297,7 @@ static const struct reg_default tas2783_reg_default[] = {
 };
 
 static const struct reg_sequence tas2783_init_seq[] = {
-	REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0x00), 0x04),
+	REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0x00), 0x01),
 	REG_SEQ0(0x00800418, 0x00),
 	REG_SEQ0(0x00800419, 0x00),
 	REG_SEQ0(0x0080041a, 0x00),
@@ -307,60 +307,19 @@ static const struct reg_sequence tas2783_init_seq[] = {
 	REG_SEQ0(0x0080042a, 0x00),
 	REG_SEQ0(0x0080042b, 0x00),
 	REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x1, 0x00), 0x00),
-	REG_SEQ0(0x0080005c, 0xD9),
-	REG_SEQ0(0x00800082, 0x20),
-	REG_SEQ0(0x008000a1, 0x00),
-	REG_SEQ0(0x00800097, 0xc8),
-	REG_SEQ0(0x00800099, 0x20),
-	REG_SEQ0(0x008000c7, 0xaa),
-	REG_SEQ0(0x008000b5, 0x74),
-	REG_SEQ0(0x00800082, 0x20),
-	REG_SEQ0(0x00807e8d, 0x0d),
-	REG_SEQ0(0x00807eb9, 0x53),
-	REG_SEQ0(0x00807ebe, 0x42),
-	REG_SEQ0(0x00807ec5, 0x37),
-	REG_SEQ0(0x00800066, 0x92),
-	REG_SEQ0(0x00800003, 0x28),
 	REG_SEQ0(0x00800004, 0x21),
 	REG_SEQ0(0x00800005, 0x41),
 	REG_SEQ0(0x00800006, 0x00),
 	REG_SEQ0(0x00800007, 0x20),
-	REG_SEQ0(0x0080000c, 0x10),
-	REG_SEQ0(0x00800013, 0x08),
 	REG_SEQ0(0x00800015, 0x00),
-	REG_SEQ0(0x00800017, 0x80),
-	REG_SEQ0(0x0080001a, 0x00),
-	REG_SEQ0(0x0080001b, 0x22),
-	REG_SEQ0(0x0080001c, 0x36),
-	REG_SEQ0(0x0080001d, 0x01),
-	REG_SEQ0(0x0080001f, 0x00),
-	REG_SEQ0(0x00800020, 0x2e),
-	REG_SEQ0(0x00800034, 0x06),
-	REG_SEQ0(0x00800035, 0xb9),
 	REG_SEQ0(0x00800036, 0xad),
 	REG_SEQ0(0x00800037, 0xa8),
-	REG_SEQ0(0x00800038, 0x00),
-	REG_SEQ0(0x0080003b, 0xfc),
-	REG_SEQ0(0x0080003d, 0xdd),
-	REG_SEQ0(0x00800040, 0xf6),
-	REG_SEQ0(0x00800041, 0x14),
-	REG_SEQ0(0x0080005c, 0x19),
-	REG_SEQ0(0x0080005d, 0x80),
-	REG_SEQ0(0x00800063, 0x48),
-	REG_SEQ0(0x00800065, 0x08),
-	REG_SEQ0(0x00800067, 0x00),
-	REG_SEQ0(0x0080006a, 0x12),
 	REG_SEQ0(0x0080006b, 0x7b),
 	REG_SEQ0(0x0080006c, 0x00),
 	REG_SEQ0(0x0080006d, 0x00),
 	REG_SEQ0(0x0080006e, 0x1a),
 	REG_SEQ0(0x0080006f, 0x00),
-	REG_SEQ0(0x00800070, 0x96),
 	REG_SEQ0(0x00800071, 0x02),
-	REG_SEQ0(0x00800073, 0x08),
-	REG_SEQ0(0x00800075, 0xe0),
-	REG_SEQ0(0x0080007a, 0x60),
-	REG_SEQ0(0x008000bd, 0x00),
 	REG_SEQ0(0x008000be, 0x00),
 	REG_SEQ0(0x008000bf, 0x00),
 	REG_SEQ0(0x008000c0, 0x00),
@@ -368,17 +327,6 @@ static const struct reg_sequence tas2783_init_seq[] = {
 	REG_SEQ0(0x008000c2, 0x00),
 	REG_SEQ0(0x008000c3, 0x00),
 	REG_SEQ0(0x008000c4, 0x00),
-	REG_SEQ0(0x008000c5, 0x00),
-	REG_SEQ0(0x00800008, 0x49),
-	REG_SEQ0(0x00800009, 0x02),
-	REG_SEQ0(0x0080000a, 0x1a),
-	REG_SEQ0(0x0080000d, 0x93),
-	REG_SEQ0(0x0080000e, 0x82),
-	REG_SEQ0(0x0080000f, 0x42),
-	REG_SEQ0(0x00800010, 0x84),
-	REG_SEQ0(0x00800014, 0x0a),
-	REG_SEQ0(0x00800016, 0x00),
-	REG_SEQ0(0x00800060, 0x21),
 };
 
 static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
-- 
2.25.1

