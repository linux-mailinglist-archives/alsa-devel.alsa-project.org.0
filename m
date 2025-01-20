Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20089A16A36
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:02:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45D4D601E7;
	Mon, 20 Jan 2025 11:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45D4D601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367372;
	bh=DjuVTQm95TumpN15cn6YMRYN+ONnrWOyJ8+3jJ15I08=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Ha0K6QHbjRJQuOkBDljY1+jYfXMx+PRXgqo60rNKQVyJlehLyjuhMWKVzhGhhwTI6
	 ggY1q1eNTt2Zs2k5is2aKB8QaOCGEwzElajMsExmSNDbxIpkT0LZUpyJ7Fx2K6/VOy
	 mgFWDEikLGSpMRkTocIortQZVbbDobZpTCUBfdV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48EE3F805B5; Mon, 20 Jan 2025 11:02:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12750F805BA;
	Mon, 20 Jan 2025 11:02:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77011F80533; Mon, 20 Jan 2025 11:02:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55DBFF80424
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55DBFF80424
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HarmM2j1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcHhvxBg1pn3y0CudbE7riCqWVmkht8O7a3ndvlzYyggyYjV+m34lcmcmcm4xPAduZ+wfpPEhQmb4CkUKB0bB4adQdeCd5kw2Vb/vQYQwjOR3eEmK6ZVPT1WFNwcXsxPE6Fstau7LueJzbo7xMRxVXjZ5yobIBlq2qWIf7gZyRCznvJDWgdn76fBlxaE6Q5ZZ2aHxh7jmWwwBkQ80ZqCmMHi7S1vHrjrSVtOKaTvu2Ede7p4c1MUMP1x/5mYs1QPjmCywhw7Dzr0wX92EPbjB8nH5IyRLlw5YgzWU3EqGdNQEGI4XLAotvaT8YBC1LCMnc2s20bKT3t2Ana2AlsM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgnsiHK0gctMavttPAPVE6NoVIpNrV/XxYP5BCVphRg=;
 b=Q2UNDnfOouiZ9r/aEBUZfFdsSGP9lBMiv9KKJPDguGZj8zF9MHiHAPXpu9IYmcVHMRLCe0VUh2ZCXVDtrGckP4pLKd7tXqonaibYdxGdUg+l/EfwnUF18nwepdLj9NdYOC9SITBjv5HmpSj2hQ1ubbFPw8rp1HzsCz3N08AXzAXxNvlI/B+dvzB3gDan9Nv3oJbXMiJQBwOujqshrxeKfIFnAihuBk2ysKuBK3XFYMJ3GIktNUkC55WYPiJ11jLSAlgM9pYhWh9vaI8TZ7EvW1EJXyaQ/m/YnQ7EHlH9bW4S8coZGrgzvPy/sj5skSXOopbgD/60PoE7ciBhZsLBdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgnsiHK0gctMavttPAPVE6NoVIpNrV/XxYP5BCVphRg=;
 b=HarmM2j17Vmw8gAVkJEol7Ztir7uewKn8154qt8PbTMFUsa5KOnqzR0k5nJZOT/7MXTfUyHkJHsdiYV+jfpHA6yaDEXKrGbZkDV8zjk3ZDBPSIvg5ZGlFBT1cV24iymBIVAVNjc4Y3sCyYQSeC5eogPqx+ZCni1eFuI7mb4kYdM=
Received: from CH2PR14CA0021.namprd14.prod.outlook.com (2603:10b6:610:60::31)
 by CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Mon, 20 Jan
 2025 10:01:46 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::f) by CH2PR14CA0021.outlook.office365.com
 (2603:10b6:610:60::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:01:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:01:46 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:01:42 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 00/23] ASoC: amd: acp70: add soundwire and acp pdm support
Date: Mon, 20 Jan 2025 15:31:07 +0530
Message-ID: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 562fbf88-42d9-46b8-81c0-08dd39397319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0jMNQLvMU+V6Q8Tz7WKmeUc4HZO/AIr5ftJ99EoSx4qKAXcM3luE+Il82Rat?=
 =?us-ascii?Q?kNIzHvNPMzako/pBMSdp+lzuUCf2q8b4T1IjsRi/y7Zp7W6RAqfm5G4i+DFC?=
 =?us-ascii?Q?FMy5qYBRSyInnfSxxNkxzFGGEM3YHAuUVbOGk+0lzpySUgWg34mYVy8TVZnu?=
 =?us-ascii?Q?EJL5bW18Ut4yoclL3xTfbvpIJYxntFXyWwRdl0m26pFJnnuS9kyBPTARvLnA?=
 =?us-ascii?Q?7fS77zFBfAj+0RxwTOx46GyOcE12sjXd08gt4q59vLPnzoJ6UFJBTFyujfsD?=
 =?us-ascii?Q?z+81cA84PnvmVazNkVtmI3HkXS9ttMlNR2DLQ5AjvzO51wf9e1SshvDwyjrh?=
 =?us-ascii?Q?W91mk0kqGUTzF0vpoXXyB9noPzcTy26riPBumpBXadGIW5oaYYj2t4p7XX7W?=
 =?us-ascii?Q?m5Po+iTCAAPTplXayiVQUNvk1QWKGJe72fD9mCOo4559YLm+iMXDKmliciEQ?=
 =?us-ascii?Q?M4VJh9aL+gYg3Vycm9i0FhP2vMIpeqXYNPzAzkIKuHS+fLEsGwfwwBkpSDf5?=
 =?us-ascii?Q?/TcLETrT4A0ZhZe9EjE2hMJK3MeQ7oaclpcZLXzzeZHCT0FNtjwNXzY5EHsh?=
 =?us-ascii?Q?hgP9Cd4UnMEkx1e8ms5zHTkjRYn6x5OaP2AosDMEvjXR335rYjvZWKG6M3DO?=
 =?us-ascii?Q?L5iDyEoblL9bMajTR/WpMvsejzohyoaH5+bfwfWBe+3pAo8awwHQuOuSQVhb?=
 =?us-ascii?Q?Rse20/WD0WwFcSdj7MF9Vb6zv7FRhno7ITT+EArdjmmA79j5fSLjCooGMoQj?=
 =?us-ascii?Q?tuM2ViIkb4S3T+JDxTxWjiLIB39OUf0O2rNoZDc3kcqdJOvheu85XxrytK+7?=
 =?us-ascii?Q?osI+9flJ9jHzil4XD1oens6LR3Zbkw+QtlZFYHs2N3a+WLRCUR6XBW4aVW9U?=
 =?us-ascii?Q?sQhyrUYhqVgbpKA6xAfhTpT5t2i8MzyfwwR6rbDjZdZ0LOaQZ+ttfOEAPdkb?=
 =?us-ascii?Q?Q8Hl2coOafUVNZx5mA4Tl0KHn/abFhq6mD5wqME1zDQow8xpf27fKEarfHQR?=
 =?us-ascii?Q?UE2bJC/6gq6c9kh8LykbFf/CfiBi5UykwtIaHGufK93F27DobEJ3fCzGkG40?=
 =?us-ascii?Q?rKhV7LZ379EVcq0oZReNrvu/OGsHL7rrJO76R91dzwZQwkdpuwsEzCHgyx0I?=
 =?us-ascii?Q?bcJJXfE/mz28K+9whZU+shbXOLjmQzX5cV3Dx/7bS3QLUtT0lDKzLv3mV3gy?=
 =?us-ascii?Q?/2Y+mV4JfK4MrKfL+2znD8sQFwz2FMUBfkQXFlV3qK3LHKESXRJ502DPWpuO?=
 =?us-ascii?Q?/kpSsrCzXbQfFhsp7Kq4iKCaZ2zQt4NKbefZS3i2iT+HuwoiWWHb7I8FtE7B?=
 =?us-ascii?Q?4rVqepurcX2OCHL7apz7OW8FmqVllsfKw7ojC6GoMs/9cUkGmXlpSV9Pu9iK?=
 =?us-ascii?Q?L9JF8pxuSFEgbYB3qncVgkF5otppO/yqxtOlM7B6bJxVms65RmmumE/40utL?=
 =?us-ascii?Q?yY9AK76vqEif4ydbjrGEphw4de9+DhIVkZ8GKdGjHWx/EwqXNdF6kPWZUHyI?=
 =?us-ascii?Q?68jI125Dj1tmzZI=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:01:46.2667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 562fbf88-42d9-46b8-81c0-08dd39397319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249
Message-ID-Hash: R2IK7TRITXBIV56IRO6FZ5WPIDZNTJSA
X-Message-ID-Hash: R2IK7TRITXBIV56IRO6FZ5WPIDZNTJSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2IK7TRITXBIV56IRO6FZ5WPIDZNTJSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series includes below changes
	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
	SoundWire IO and ACP PDM controller combination.
	- Add common driver modules for ACP7.0 and ACP7.1 platforms
	(acp pci driver, Soundwire dma driver, pdm platform driver).
	- Add SoundWire generic machine driver changes for legacy stack
	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.

Changes since v1:
	- Change the code sequence for handling SoundWire wake interrupts.
	- Add new patch to restore host wake interrupt mask
	- Add new patch to enable ACP PME during ACP init sequence.
	- Change ACP PCI driver PM ops code sequence.

Vijendar Mukunda (23):
  ASoC: amd: add register header file for ACP7.0 platform
  ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
  ASoC: amd: acp70: add acp init and de-init functions
  ASoC: amd: acp70: add logic for scanning acp child devices
  ASoC: amd: acp70: create platform devices for acp child nodes
  ASoC: amd: acp70: enable driver build for ACP7.0 platform
  ASoC: amd: acp70: add acp pdm platform driver
  ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
  ASoC: amd: acp70: add acp soundwire dma driver
  ASoC: amd: update ACP7.0 KConfig option description
  ASoC: amd: acp70: add soundwire dma driver dma ops
  ASoC: amd: acp70: add acp ip interrupt handler
  ASoC: amd: acp70: add acp pdm driver pm ops
  ASoC: amd: acp70: add pm ops support for soundwire dma driver
  ASoC: amd: acp70: add acp driver pm ops support
  ASoC: amd: acp70: enable wake capability for acp pci driver
  ASoC: amd: acp70: add soundwire wake interrupt handling
  ASoC: amd: acp70: enable soundwire host wake irq mask
  ASoC: amd: acp70: enable acp pme enable during acp init sequence
  ASoC: amd: acp70: create a device node for soundwire machine driver
  ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1
    platforms
  ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
  ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support

 include/sound/acp70_chip_offset_byte.h   | 484 +++++++++++++
 sound/soc/amd/Kconfig                    |  12 +
 sound/soc/amd/Makefile                   |   1 +
 sound/soc/amd/acp/Makefile               |   2 +-
 sound/soc/amd/acp/acp-sdw-legacy-mach.c  |  16 +
 sound/soc/amd/acp/acp-sdw-mach-common.c  |  34 +
 sound/soc/amd/acp/amd-acp70-acpi-match.c | 132 ++++
 sound/soc/amd/acp/soc_amd_sdw_common.h   |  11 +
 sound/soc/amd/acp70/Makefile             |   9 +
 sound/soc/amd/acp70/acp70-pdm-dma.c      | 463 +++++++++++++
 sound/soc/amd/acp70/acp70-sdw-dma.c      | 586 ++++++++++++++++
 sound/soc/amd/acp70/acp70.h              | 288 ++++++++
 sound/soc/amd/acp70/pci-acp70.c          | 833 +++++++++++++++++++++++
 sound/soc/amd/mach-config.h              |   1 +
 14 files changed, 2871 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/acp70_chip_offset_byte.h
 create mode 100644 sound/soc/amd/acp/amd-acp70-acpi-match.c
 create mode 100644 sound/soc/amd/acp70/Makefile
 create mode 100644 sound/soc/amd/acp70/acp70-pdm-dma.c
 create mode 100644 sound/soc/amd/acp70/acp70-sdw-dma.c
 create mode 100644 sound/soc/amd/acp70/acp70.h
 create mode 100644 sound/soc/amd/acp70/pci-acp70.c

-- 
2.34.1

