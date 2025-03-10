Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7BA591A5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:48:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F29C60730;
	Mon, 10 Mar 2025 11:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F29C60730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603699;
	bh=Pc1mMlh2fbmaBba8lP+Nizv5jYeSfS8h7q4e3SVJNmg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jc95j1HvROkuHBoNo+uAPe0arQxUIYmrR0sLKLMeG47iOqfC7mdPNIN7KakzkqceB
	 N0amr8fri7svNvD6KsqGZVPgrnS2sgw7tg8yD1lbSp+d8kliJdh/M8XzunOuBs/G3s
	 PjrQnl9BQxJHU4zsUVUDag51ro68BI7OO2DaVr+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3B52F80537; Mon, 10 Mar 2025 11:46:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98A8EF804F2;
	Mon, 10 Mar 2025 11:46:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C96DBF80630; Mon, 10 Mar 2025 11:46:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9458AF80580
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9458AF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BsrAsCS7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eij9oOQzj6qUQ7I7m3jksyidHf+MuWZyVyuoa9qXVnsHG2e2PJbQ8RqN9w6Is9hV7pTzLmLBa5uPE4csYIPEza41m1b33AJlfW7rSOxcWK6PuibCDwOJ1KI0upySbSS0xfwG0z1ao1xqdfX99J7e5m32DXmD09aYEuErHDMqhccLDivgbNcXeD6ANZp16Wdv4DDeybFpM9dvQR3bXz3iY+NudqEL4VKmj6N9UUNqWsD/pfL6Lv0U6IEpjZZS0P7HnMv/wMFdUbsYt0kmiAU02+R8J7ErGwDuC643p+qtAn2b+M5B5VdDmU/K1kXOP/qIRGrgC4vfcx8drmXiMG6b4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITyTcF+NL4gjM86N/NYQlAav2jxfwe1qBibV/n8E+1Q=;
 b=J/EzkO9WQT5y1+WCjEcgLcuGCWaKblNbsgPCIZ4l7x3D9gorJigG8EnTrhGCSgGiRCAaB583lcLBXhmmdbT7YA/Es/Op+1ohSuIC7NW8jmlBvJ+K1TKlnOv5qfJmHEyg+xhgHUkVonW7EaTfguGORFT36s+6nhhl07OeRaZgBdrmhydnpNuDHhsRepJSbTmX88fVA08vq3beB6RWoYUErv8aqDJdhsZUSERjqZqyntJnwGdRl0Ga8apQoEZhWVHoTzxOuBqNdR8yPRFeiXST66yDM5VrOP/qufL7afmX5rl8pTyTQR87ph8xdebJCw5dXN9eVTsxyJG+/Mo3pnAV+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITyTcF+NL4gjM86N/NYQlAav2jxfwe1qBibV/n8E+1Q=;
 b=BsrAsCS7n0u5bFt9+aWyWqGuXR8tPLM7GDRbja3phJPlDgJSr02V6scnxDobWYcsI7FzSs2yrmugM1NfzJCZBQ5dzDul+sMyxGXjZmm0dUIzJ3BYb97D5UIBLwO8VO3teCZmj7OxTJncGYv4+HIygtO3T16Ijg15W8FPYgdOsPc=
Received: from PH7P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::30)
 by CH1PPFDB1826343.namprd12.prod.outlook.com (2603:10b6:61f:fc00::628) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:46:41 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:510:338:cafe::78) by PH7P223CA0029.outlook.office365.com
 (2603:10b6:510:338::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.23 via Frontend Transport; Mon,
 10 Mar 2025 10:46:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:46:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:46:39 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:46:35 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH
	<gregkh@linuxfoundation.org>, Muhammad Usama Anjum
	<usama.anjum@collabora.com>, Murad Masimov <m.masimov@maxima.ru>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/14] ASoC: amd: acp: Refactor acp machine select
Date: Mon, 10 Mar 2025 16:15:52 +0530
Message-ID: <20250310104601.7325-6-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|CH1PPFDB1826343:EE_
X-MS-Office365-Filtering-Correlation-Id: 85533d0a-8433-4c77-5f37-08dd5fc0d77b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1Gyp/9eEe2shpGIlqHrnr9CIC4D078hUVTFcmk/NldxOWC5DFCZHww+ABdbj?=
 =?us-ascii?Q?XoToS4k2TbCVZWKHPUwadLGml1ZpSBWOMnczxAw0T9v+NyReFbD17x+K8U36?=
 =?us-ascii?Q?4VSi9/i6asU8126taTuoM5GAd9/r6kzDVnwU1j3P1bSeZr9i2fTFcs2NqMhV?=
 =?us-ascii?Q?lzwlcwz9+ZHma0/0oD/TmRQs9wgp9xlEsLiUcndTSfA9mqkYTZSPyFpaZI1d?=
 =?us-ascii?Q?3e9DEzVIi8zGUQn9CXKVvhim/XLfXF87j8lT5HjHvs3pGkSHS4nhOdiOVKbO?=
 =?us-ascii?Q?KeY2ZosNXtdsE5NrbvlMkGqr9cLgHr7MgTgVVN9/Qvs04+xI7U0UsimP1DcY?=
 =?us-ascii?Q?GYKDaClSDUnKFdOI5MElri2jva6navSq42K9x1HrRLvQPtWY3Vz4xwAdAUfY?=
 =?us-ascii?Q?VF9+F8hMewc6HzvCK+3Qgp9i4hJK8cIcofJLAiZPXecsddNd4qXgBWUVseGt?=
 =?us-ascii?Q?b5veSb2b5qKbS5KIIebknJN2i07yrXPogoHY9Vuj6ORsRvxeLtr2FnsIuUq+?=
 =?us-ascii?Q?8g1kmHKH6XjaNIyVYP4+aeDYZbZl0Kv7Fb9v06CjG7nmjzl7notatVjrML7X?=
 =?us-ascii?Q?mdQI5gdygyXxytdbIhkpMA8tAhAZqfiWNxtu7rUI3FL69d6xmw3oNMgr0Uj+?=
 =?us-ascii?Q?DOmCRXK4rY+4aiShEsu68Omdr7xjp02dhe6XSETXlq4GZr8WDoIRF6F9xZyc?=
 =?us-ascii?Q?k42Ps2+tphXW6VCDKd9ujxP8j+873vwpr9qlvl6u5kSh6582Zr3RwiHh60Tc?=
 =?us-ascii?Q?/lXSgWS8op4ihjLpSCPfT94IlZ5oPeZxOWFWlsLY+IdDyjbsEy+WLnX6eQaj?=
 =?us-ascii?Q?PozSUngZoMnOoiEkmMqLlC/lQS3bxA59mwdK09nOp//3GYD7icdWxX/057Bb?=
 =?us-ascii?Q?KXAnYzv2nHIA3+k7S2ZmadSIDoPfHBTgzg7PmTfU80cBCPifdhtF6rpzoGYh?=
 =?us-ascii?Q?C/OuQ9peM5JsWE1/bM1jYqaOJrikqqB4D85988E633+dec5tqG/MUucjozuX?=
 =?us-ascii?Q?c9zQ9Jnxiw3H0/ke+Z4lahYEmh6APdaHnmB1txusd6HWCyaQF/8lGubSd5O8?=
 =?us-ascii?Q?+CmT90eBlnkhWYBGlNcPhBlwvM8uCL4A2O9nInmCWHuDVgUp2rKz5g6Q7Lns?=
 =?us-ascii?Q?hsYSEW++8tV3Ydz2MHgGy9IfCBiwwv/DMcB3Yidd508TWH3FxdQV021KYHJy?=
 =?us-ascii?Q?8hP4vcYx6e8tIdQ3bTEXj65rrX5xTl92C87oTiQvL3wydVXU3r24ebEVRe2u?=
 =?us-ascii?Q?sHutdnrzYuAIRRrgVmcs+nCiLpmirGmXyeDFk6NRTM0xL1oDUvFi0hjloWI9?=
 =?us-ascii?Q?DJrssFPAvJ3+6ntP0WTOyLkIADHquFGJr1XiypzGT7oGQfplqfo6lD7sMj2k?=
 =?us-ascii?Q?zNoVDfirF86i89mFnjGC5SK2r99Q05cXYKfOLl5L05zpMmGB+riSQk+o8BTl?=
 =?us-ascii?Q?2VpnAbKjLR1qXrnRhWQmRoFuSrEm5075sd5I4oQmSWwcSCLjp0fVHbUVHChD?=
 =?us-ascii?Q?JOjRwO3fBZMXOfg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:46:40.8461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 85533d0a-8433-4c77-5f37-08dd5fc0d77b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDB1826343
Message-ID-Hash: WBAF4V3DIXE673U4MFCOFXZS53AFWFLY
X-Message-ID-Hash: WBAF4V3DIXE673U4MFCOFXZS53AFWFLY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBAF4V3DIXE673U4MFCOFXZS53AFWFLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor and move acp machine select function from acp platform
driver to acp pci driver and assign platform specific acpi machines
to chip->machines.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 28 +++++++++
 sound/soc/amd/acp/acp-pci.c           |  7 +++
 sound/soc/amd/acp/acp-platform.c      | 28 ---------
 sound/soc/amd/acp/acp-rembrandt.c     | 32 -----------
 sound/soc/amd/acp/acp-renoir.c        | 42 --------------
 sound/soc/amd/acp/acp63.c             | 10 ----
 sound/soc/amd/acp/acp70.c             | 10 ----
 sound/soc/amd/acp/amd.h               | 81 ++++++++++++++++++++++++++-
 8 files changed, 114 insertions(+), 124 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index f87a2da8c641..886615798b93 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -16,6 +16,8 @@
 #include <linux/pci.h>
 #include <linux/export.h>
 
+#include "../mach-config.h"
+
 #define ACP_RENOIR_PDM_ADDR	0x02
 #define ACP_REMBRANDT_PDM_ADDR	0x03
 #define ACP63_PDM_ADDR		0x02
@@ -350,6 +352,32 @@ int acp_deinit(struct acp_chip_info *chip)
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_deinit, "SND_SOC_ACP_COMMON");
+int acp_machine_select(struct acp_chip_info *chip)
+{
+	struct snd_soc_acpi_mach *mach;
+	int size, platform;
+
+	if (chip->flag == FLAG_AMD_LEGACY_ONLY_DMIC) {
+		platform = chip->acp_rev;
+		chip->mach_dev = platform_device_register_data(chip->dev, "acp-pdm-mach",
+							       PLATFORM_DEVID_NONE, &platform,
+							       sizeof(platform));
+	} else {
+		size = sizeof(*chip->machines);
+		mach = snd_soc_acpi_find_machine(chip->machines);
+		if (!mach) {
+			dev_err(chip->dev, "warning: No matching ASoC machine driver found\n");
+			return -EINVAL;
+		}
+		mach->mach_params.subsystem_rev = chip->acp_rev;
+		chip->mach_dev = platform_device_register_data(chip->dev, mach->drv_name,
+							       PLATFORM_DEVID_NONE, mach, size);
+	}
+	if (IS_ERR(chip->mach_dev))
+		dev_warn(chip->dev, "Unable to register Machine device\n");
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(acp_machine_select, "SND_SOC_ACP_COMMON");
 
 static void check_acp3x_config(struct acp_chip_info *chip)
 {
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 9030db1c1780..fc2925931f7c 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -127,19 +127,23 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	case 0x01:
 		chip->name = "acp_asoc_renoir";
 		chip->acp_hw_ops_init = acp31_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_acp_machines;
 		break;
 	case 0x6f:
 		chip->name = "acp_asoc_rembrandt";
 		chip->acp_hw_ops_init = acp6x_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_rmb_acp_machines;
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
 		chip->acp_hw_ops_init = acp63_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_acp63_acp_machines;
 		break;
 	case 0x70:
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
 		chip->acp_hw_ops_init = acp70_hw_ops_init;
+		chip->machines = snd_soc_acpi_amd_acp70_acp_machines;
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
@@ -175,6 +179,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	chip->chip_pdev = chip->acp_plat_dev;
 	chip->dev = &chip->acp_plat_dev->dev;
 
+	acp_machine_select(chip);
 skip_pdev_creation:
 	dev_set_drvdata(&pci->dev, chip);
 	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
@@ -242,6 +247,8 @@ static void acp_pci_remove(struct pci_dev *pci)
 		platform_device_unregister(chip->dmic_codec_dev);
 	if (chip->acp_plat_dev)
 		platform_device_unregister(chip->acp_plat_dev);
+	if (chip->mach_dev)
+		platform_device_unregister(chip->mach_dev);
 
 	ret = acp_hw_deinit(chip);
 	if (ret)
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index aa330aeeb301..7d6abff28b23 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -21,7 +21,6 @@
 #include <linux/dma-mapping.h>
 
 #include "amd.h"
-#include "../mach-config.h"
 #include "acp-mach.h"
 
 #define DRV_NAME "acp_i2s_dma"
@@ -108,33 +107,6 @@ static const struct snd_pcm_hardware acp6x_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
-int acp_machine_select(struct acp_dev_data *adata)
-{
-	struct snd_soc_acpi_mach *mach;
-	int size, platform;
-
-	if (adata->flag == FLAG_AMD_LEGACY_ONLY_DMIC) {
-		platform = adata->acp_rev;
-		adata->mach_dev = platform_device_register_data(adata->dev, "acp-pdm-mach",
-								PLATFORM_DEVID_NONE, &platform,
-								sizeof(platform));
-	} else {
-		size = sizeof(*adata->machines);
-		mach = snd_soc_acpi_find_machine(adata->machines);
-		if (!mach) {
-			dev_err(adata->dev, "warning: No matching ASoC machine driver found\n");
-			return -EINVAL;
-		}
-		mach->mach_params.subsystem_rev = adata->acp_rev;
-		adata->mach_dev = platform_device_register_data(adata->dev, mach->drv_name,
-								PLATFORM_DEVID_NONE, mach, size);
-	}
-	if (IS_ERR(adata->mach_dev))
-		dev_warn(adata->dev, "Unable to register Machine device\n");
-	return 0;
-}
-EXPORT_SYMBOL_NS_GPL(acp_machine_select, "SND_SOC_ACP_COMMON");
-
 static irqreturn_t i2s_irq_handler(int irq, void *data)
 {
 	struct acp_dev_data *adata = data;
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index e727754a8231..eb09878c0d5c 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -44,36 +44,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x03802800,
 };
 
-static struct snd_soc_acpi_codecs amp_rt1019 = {
-	.num_codecs = 1,
-	.codecs = {"10EC1019"}
-};
-
-static struct snd_soc_acpi_codecs amp_max = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[] = {
-	{
-		.id = "10508825",
-		.drv_name = "rmb-nau8825-max",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_max,
-	},
-	{
-		.id = "AMDI0007",
-		.drv_name = "rembrandt-acp",
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "rmb-rt5682s-rt1019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{},
-};
-
 static struct snd_soc_dai_driver acp_rmb_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -230,8 +200,6 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
-	adata->machines = snd_soc_acpi_amd_rmb_acp_machines;
-	acp_machine_select(adata);
 
 	dev_set_drvdata(dev, adata);
 
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index ca2b74283d8f..2b47c6bfc9e7 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -36,45 +36,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x02052800,
 };
 
-static struct snd_soc_acpi_codecs amp_rt1019 = {
-	.num_codecs = 1,
-	.codecs = {"10EC1019"}
-};
-
-static struct snd_soc_acpi_codecs amp_max = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
-	{
-		.id = "10EC5682",
-		.drv_name = "acp3xalc56821019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "acp3xalc5682sm98360",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_max,
-	},
-	{
-		.id = "RTL5682",
-		.drv_name = "acp3xalc5682s1019",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &amp_rt1019,
-	},
-	{
-		.id = "AMDI1019",
-		.drv_name = "renoir-acp",
-	},
-	{
-		.id = "ESSX8336",
-		.drv_name = "acp3x-es83xx",
-	},
-	{},
-};
 
 static struct snd_soc_dai_driver acp_renoir_dai[] = {
 {
@@ -188,9 +149,6 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 
-	adata->machines = snd_soc_acpi_amd_acp_machines;
-	acp_machine_select(adata);
-
 	dev_set_drvdata(dev, adata);
 	acp_enable_interrupts(adata);
 	acp_platform_register(dev);
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 4187a8968de7..76a26b82e3ad 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -62,14 +62,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x03802800,
 };
 
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[] = {
-	{
-		.id = "AMDI0052",
-		.drv_name = "acp63-acp",
-	},
-	{},
-};
-
 static struct snd_soc_dai_driver acp63_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -259,8 +251,6 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
-	adata->machines = snd_soc_acpi_amd_acp63_acp_machines;
-	acp_machine_select(adata);
 	dev_set_drvdata(dev, adata);
 
 	if (chip->is_i2s_config && rsrc.soc_mclk) {
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index ef3f6504bc7f..4ed446990cdb 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -40,14 +40,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x03800000,
 };
 
-static struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
-	{
-		.id = "AMDI0029",
-		.drv_name = "acp70-acp",
-	},
-	{},
-};
-
 static struct snd_soc_dai_driver acp70_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -187,10 +179,8 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp70_dai;
 	adata->num_dai = ARRAY_SIZE(acp70_dai);
 	adata->rsrc = &rsrc;
-	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
-	acp_machine_select(adata);
 
 	dev_set_drvdata(dev, adata);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index f08c4dfe6b2f..4d6a71cff17d 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -149,6 +149,8 @@ struct acp_chip_info {
 	struct platform_device *chip_pdev;
 	struct platform_device *dmic_codec_dev;
 	struct platform_device *acp_plat_dev;
+	struct platform_device *mach_dev;
+	struct snd_soc_acpi_mach *machines;
 	u32 addr;
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
@@ -195,7 +197,6 @@ struct acp_dev_data {
 	struct list_head stream_list;
 	spinlock_t acp_lock;
 
-	struct snd_soc_acpi_mach *machines;
 	struct platform_device *mach_dev;
 
 	u32 bclk_div;
@@ -245,13 +246,89 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct snd_soc_acpi_codecs amp_rt1019 = {
+	.num_codecs = 1,
+	.codecs = {"10EC1019"}
+};
+
+struct snd_soc_acpi_codecs amp_max = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
+	{
+		.id = "10EC5682",
+		.drv_name = "acp3xalc56821019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682sm98360",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "acp3xalc5682s1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{
+		.id = "AMDI1019",
+		.drv_name = "renoir-acp",
+	},
+	{
+		.id = "ESSX8336",
+		.drv_name = "acp3x-es83xx",
+	},
+	{},
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[] = {
+	{
+		.id = "10508825",
+		.drv_name = "rmb-nau8825-max",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+	},
+	{
+		.id = "AMDI0007",
+		.drv_name = "rembrandt-acp",
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "rmb-rt5682s-rt1019",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+	},
+	{},
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[] = {
+	{
+		.id = "AMDI0052",
+		.drv_name = "acp63-acp",
+	},
+	{},
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
+	{
+		.id = "AMDI0029",
+		.drv_name = "acp70-acp",
+	},
+	{},
+};
+
 extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
 extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
 
 int acp_platform_register(struct device *dev);
 int acp_platform_unregister(struct device *dev);
 
-int acp_machine_select(struct acp_dev_data *adata);
+int acp_machine_select(struct acp_chip_info *chip);
 
 int acp_init(struct acp_chip_info *chip);
 int acp_deinit(struct acp_chip_info *chip);
-- 
2.39.2

