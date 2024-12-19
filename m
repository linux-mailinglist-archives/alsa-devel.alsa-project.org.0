Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DDD9F7440
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 959E360215;
	Thu, 19 Dec 2024 06:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 959E360215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587519;
	bh=c9YvyFJkz3gTqlIZHxwSK2i5sTITHXxeQLvjejBo3Ik=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WN7+NRNay7nIyP2FfPm/9ZABuJslC7PVAQNw58ft5Owf9293zQTqycs5qi6fTTBEk
	 1jB8aU/weT4koyYT3rp3i0gR3AoeyLboSFYEn3F2ee9mpYcc+E8rWK+M5V/SPoUzN+
	 63dKIbpsTdLm2hItTgvz2VjMoxcu+506X2aSfSB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97DD5F8014C; Thu, 19 Dec 2024 06:51:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 747CFF805C1;
	Thu, 19 Dec 2024 06:51:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81133F80553; Thu, 19 Dec 2024 06:50:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77D7AF80038
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D7AF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qdWtRVi+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOkPrKUtsL/kUi1QRaCjND854+Xk5Aa51pc9nC0Jz0ETP3FCB4UE2vMEZ9EYjUKZXeee2h4tQ9vJCabTttfYff0vXfU9Vhdhym7yhUjGM+kPIoODwT1fhW6Kr8BaixLY5QCE8/SkyOcwGrQIDXdJIvTbCO92ifasbTUwTxIo9FJl8jE4ltsDJqzs0IM08IbRWyjtW1KmsNmFHKNgv2f3IQfuiZP94MIVZeNsIuNcGfDfDJGplG8zR9/t5w0IOl9MsPyphO9YYNQWgJAUmYvff2D9g3EpEKoXxMDR5Vq1oEUftkLMy/mopu/F45B9fYgYFrBDEKiJNt8p8hz3U24B/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06PzbGeFxjPdP9S9uHtftoDnsB0BrW9qa1Ho/2JaLFY=;
 b=RzVGZCL34/D5A7zwGiXqWhVeMXK+qpzE2Y8WcBpTeBtX4DasBgY1tffih/Za/EF10DwJWMFQQn80T5hcIJcHiEGJ8AIcpmVAujJORJ7nNUWHwTOwJ028nFbeduXoQRcmqSPfXaxZAbuTbFNDdLKNYlQlvkkEyHVPYfdd7uqw+QGzIm1RDN6+WLu9bEQGp5oqqvoFj85c/s4170nZkQJOk/yQlWMpg/6QoiNldVD/uMcH2ji+Su8CaAeCuV0I7/7zPYdcO7grYsyTb+VikNNyc8bs+HCmOleACWRWTEEg8k1xQbvNlWYc+NOxvcyDxR579BrnPoR3QzXG/lYQXehEAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06PzbGeFxjPdP9S9uHtftoDnsB0BrW9qa1Ho/2JaLFY=;
 b=qdWtRVi+Te1hVd7tUlisZNYWK4wBRi0xol7Csg20ik5nEfJt5GRdSSlbq5ZBC6gt+asOrMWkBe1O6kj8WajVJMF4fejwqNxfIp5t4a6/fd5u18kRR/YrUC4896nZpOa0NeOqd+bUyg3IxFv/zON/RUmU/T4ZXaxWKT6s9kezL98=
Received: from CH2PR02CA0027.namprd02.prod.outlook.com (2603:10b6:610:4e::37)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:50:45 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::e7) by CH2PR02CA0027.outlook.office365.com
 (2603:10b6:610:4e::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 05:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:50:45 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:50:20 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 06/21] ASoC: amd: acp70: enable driver build for ACP7.0
 platform
Date: Thu, 19 Dec 2024 11:18:42 +0530
Message-ID: <20241219054857.2070420-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|DM6PR12MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 013be76f-c70a-47df-72c5-08dd1ff114de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2sAFofwdRNHYlZXck9wv+o4oA10nNfdTGt07trMRqbaG/WnrZ3dfbIhvAQLK?=
 =?us-ascii?Q?TVTEe5/2oGlv08+F/7RHWDuvTLQ/pDvpd4+9kK/xUpLVg0xs6Vc2a1zMOW3j?=
 =?us-ascii?Q?I88y9XIOfUoVbnNH9XxChaw4zyS3AA8babjcA1QnsJ80T5XkxEZNv0n1k+w7?=
 =?us-ascii?Q?o6KqszAAc4fuUvSB0IdF031/8Al6sAI1dVT39Za5iEoWHtOKGTFykMrTyDrC?=
 =?us-ascii?Q?1aeRiPGZznoKHDYI94LN5ht/EypaUXhZbmmWaWXIb3vV3qRuS9/BwPj6xJ2J?=
 =?us-ascii?Q?grS4BWZ+OyQQc/YJsGFOE2JRej5dJWA2ghE1u79DESAkwYGdIBUcVZ9SxYup?=
 =?us-ascii?Q?F62LFG82pLNuIr146wzJZYq5/4neBrkBQzr49fKJpKV7gdWn5WOpvPO3ARED?=
 =?us-ascii?Q?HEbffn/4091gXkRLUuqOneQ1lJ3G44Rc14nvdVRRCQCR4UQH6kvJflV6bh3R?=
 =?us-ascii?Q?jrgfWJazW4sZzsmFdDtcMU7c95Xyt+L0vtIr5BoRnBoh67n/miPsTNsFf2VI?=
 =?us-ascii?Q?EIi9TxFpxEDwcTYvSe7Bjnkyj9IjHqMBCj4P6IT+EeccvusMZ/DhF7iU55DL?=
 =?us-ascii?Q?wdDaCvgngxbecCZEEH/Su7CCNdKor7rgoJdvPlZ/yVIpFwNdqD+fgZDCZmnu?=
 =?us-ascii?Q?XnGZZMXRqe053sDycdqtpMbpRUcTJkSpUVIv/Ve8dw92UrT8TDlT4qTV2n4k?=
 =?us-ascii?Q?eW0vAA4LWrQGWkqJMJm8Y1NT/S5Oa4ckeqNzLLxTS30BY/E78ZOpURtpoZ/3?=
 =?us-ascii?Q?dpVSN89Fz1vba35soGFTjU4uF8HqN3EoQaTGj23uzOGbWN51F4cSqigZminK?=
 =?us-ascii?Q?6Jk7V8PyZw73ZmXDwYzMYUIldenI+mX8+OWWZsB7psE2hh9Eh08rh3ASH4k9?=
 =?us-ascii?Q?SYcSfo3uJ/04hiOYp1MzA1+Nst0mk73fVNcyJXepgQ0NQA+mR6u5rKiqRER4?=
 =?us-ascii?Q?P9+refydRyOne66zRBR4PFQXRdpznVlLTNUSSPPNvjKjDOCb6soFXUDxFZoq?=
 =?us-ascii?Q?DGN69KuvTsL1FoMNtSUQhntrs1E3J0WcwKSvFwCWOsS+KXejuwgTJ19crtIZ?=
 =?us-ascii?Q?Qo/LH2WCCt1nFnxjrmnlkVUVzU7ynLTsubrhaNCU9Lse2K8bFQBzpVmK5DR5?=
 =?us-ascii?Q?fagi+aP6SSYKxn3pImqbLYtFZ29ORt/wHcHrKsqXMaeJyyRQqvPepVBsErv3?=
 =?us-ascii?Q?99wovV+KaZ7pXqxT4sAB49Id/VrlG0g+pPOJIO1WqlQBS03/Vi56H0rTRg9e?=
 =?us-ascii?Q?ktohQia9RpFQ9fBueCj71MpwrLRPKNPRrcfD+Lc1Rw16T+QCzL/7No2+7ZA7?=
 =?us-ascii?Q?UZ5sn107H7JHh0e5AqIWhDkTUuwwkTFQ96JGJGICmYoXxn8b1bFTBYvx0Vtx?=
 =?us-ascii?Q?bjnVvdlCBWi0UUeEmU8Zym+2y3tFqH3dAUFd5urQZw3wAUJnbl61i4UsAzdi?=
 =?us-ascii?Q?0LSjGbNDytRvrpo3rGHoe5rhPLgRTMjkxN6S73gszFZUPAsTxiIiopAx5WOh?=
 =?us-ascii?Q?lJqtfUIALez1e4U=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:50:45.3399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 013be76f-c70a-47df-72c5-08dd1ff114de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4388
Message-ID-Hash: WOPHZJJRQKTARBQTLZSZOCJXLAEEK6RS
X-Message-ID-Hash: WOPHZJJRQKTARBQTLZSZOCJXLAEEK6RS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOPHZJJRQKTARBQTLZSZOCJXLAEEK6RS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Config options for ACP7.0 platform and Make file to trigger ACP7.0
driver build.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig        | 10 ++++++++++
 sound/soc/amd/Makefile       |  1 +
 sound/soc/amd/acp70/Makefile |  5 +++++
 3 files changed, 16 insertions(+)
 create mode 100644 sound/soc/amd/acp70/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index c7590d4989bb..9d8114909eb5 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -184,4 +184,14 @@ config SND_SOC_AMD_PS_MACH
           Say m if you have such a device.
           If unsure select "N".
 
+config SND_SOC_AMD_ACP70
+	tristate "AMD Audio Coprocessor-v7.0 SoundWire support"
+	select SND_SOC_AMD_SOUNDWIRE_LINK_BASELINE
+	depends on X86 && PCI && ACPI
+	help
+	  This option enables Audio Coprocessor i.e ACP v7.0 support.
+	  By enabling this flag build will be triggered for ACP PCI driver.
+	  Say m if you have such a device.
+	  If unsure select "N".
+
 endif
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 4f89d962cce2..d71f74f957ff 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -19,3 +19,4 @@ obj-$(CONFIG_SND_AMD_ACP_CONFIG) += acp/
 obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
 obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += rpl/
 obj-$(CONFIG_SND_SOC_AMD_PS) += ps/
+obj-$(CONFIG_SND_SOC_AMD_ACP70) += acp70/
diff --git a/sound/soc/amd/acp70/Makefile b/sound/soc/amd/acp70/Makefile
new file mode 100644
index 000000000000..5e553de6c772
--- /dev/null
+++ b/sound/soc/amd/acp70/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# ACP 7.0 platform Support
+snd-pci-acp70-y := pci-acp70.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-pci-acp70.o
-- 
2.34.1

