Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3183FDE2
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 06:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079D9822;
	Mon, 29 Jan 2024 06:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079D9822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706507788;
	bh=c8pyGPpBIPuuzo3IuY/HnWAHT2Hq/EMvv52T1XmEyBE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rtp2X2AC8EEhFgIYiuItYKa7bzaYekguzDlIteUcDVJYYL58b3mAfkNnQb5SujGYs
	 jlyWIj4xeL+ZjKlGWQE5AHZHa4T+tm4NwxKwT48WWux+gN7mXOmei/tT191LIbI5HC
	 MszbOaqcavpd1WmKRanPBQEgEvGc5io8L7wbSmpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCDFBF805CB; Mon, 29 Jan 2024 06:55:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C930CF805C4;
	Mon, 29 Jan 2024 06:55:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C00CF80563; Mon, 29 Jan 2024 06:53:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6466CF80053
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 06:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6466CF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=33I6XGB+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeuHcihMKcgJvwLvZAY8u+Q3QRX1eEKaFeY/D1tXPidK2FBDOs6Rn6WfbjjL1g19dab/85nseYhKeKum7x8Vd/IJ1rCu8l4J3lXavHi5ij5IYqusQOGYgTDgGSpbiZSjMSIKeOo6rT8u5VxLNiRnry9lmVg0g1qojmewvBhx07rUYj6yB38TLin2tXv4rk93txs6gDm7hjUc1+MNcx8qR0uLKH5L9bqkLORn+aq0evW1br1dKACrXZJAR4+I38jv15ZktgnKj/xU5gTIaYyqrL0qoCV2OjLUDyeXJ/zQ9cnrSuEad0njfp8R7ApBkEF3AZpasoEoLWLVhl5Ms0qrwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOhMtVCesN+ur8N0oWmzRRCxIH3/QbXj3Wrd5lQ7D7M=;
 b=FzAW2OSaR4zhBF1FdX6+eSCgmOhTC+JOeIzzy8m8UzCHlo8cQUhBhJ/gRVFPkG54Yg/vJ1lPDP6+s0DPP1gxQaPn2M8qZ8D+X0bLMHSGZrHjeMRt495QBpdDbWtrb+lPmh8VUVxf5UPnFKPP+765pXYVlLkMSfncSFv/0w3c9Z+FtdVtMRvH/rhHNQ09U9r4hN/SCQxHEM+NULxtygmlb/c7BebvLfVo+ouE1x5y9/1QfJtAODpAHUbkQ6F2tYLiN0URivURCZge6bxecfUxAghhoRi52NB2QPCOYXpMiC3+rRB44QQakzdNr8eTWp+chiKFs55ZJ5K+MVTzaRcQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOhMtVCesN+ur8N0oWmzRRCxIH3/QbXj3Wrd5lQ7D7M=;
 b=33I6XGB+T7uaDUsHYM9Dq2c/6eJJECPJcTUZQXKKoFwRd/1ehyr2BCX18AtT0BsNSsIDFmTycVnDXhYDlqTAwdSsUh3LU2Zpr55wXTFFBB6xa1zfBiw6jqg7DmsMd32ZDFTeMqRwExqGmW6L0C8GJRewuyW8ONpU3RugBIBe3pI=
Received: from BN9PR03CA0050.namprd03.prod.outlook.com (2603:10b6:408:fb::25)
 by CH0PR12MB5140.namprd12.prod.outlook.com (2603:10b6:610:bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:52:13 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::d9) by BN9PR03CA0050.outlook.office365.com
 (2603:10b6:408:fb::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 05:52:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:52:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:52:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sun, 28 Jan
 2024 21:52:12 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:52:07 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Marian
 Postevca" <posteuca@mutex.one>, open list <linux-kernel@vger.kernel.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>
Subject: [PATCH V4 01/13] ASoC/soundwire: implement generic api for scanning
 amd soundwire controller
Date: Mon, 29 Jan 2024 11:21:35 +0530
Message-ID: <20240129055147.1493853-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CH0PR12MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f692b7-0f1d-4345-b875-08dc208e70c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x6S/pDkqiaB1PPDr5mUKhHYkNSprnySwxqn+QepG6IAWOUluciCUgRC+zjVS36paUKmQ/rsM76v/VK51Bt5c4gCHALxNXoXWv429t3pBRoZJjw/QlAACkjXDiSRm71YC2GM+PG2RTa7kYFhLRGj8bOpDiIkfrxpuEfdQM5NlJhPYPZX3jzHXdNhmBptqyl23AcZNC9Bh8YLUfDlMkLd9p9moa/4VZTtZQB/G0G0QMedQlc9UWezwTFfYnJOnVh6F7WdtoTvQKbocg+JyZaqNlStY6gOVlTI88DoJP4nF+ZOfG28ntXxjlq+BGvv5MbpZa+XCqDcWxmwAMjPjMXZfK334FWKZsoySVQoBoXsPKBA/qOD3iUN5sc2xXRZhYNLStNYXveM5UKW8XmI7rqB6QF2iLJIQxDWUlMqtUamYe8aRrkG8FHKgnURsezs1DVgRnGwFrPeRHm7bd1WL2OxDXEBXICuBgf9iRsSzFFi/I2MxtdToRgY3+vxpKaX30LawML0ThSlhRbdYnxXQ8yFRZdOwGs7t1jtfrU89LRIiZCtB4/gtcKsnKY9bacb5x0u1NkfcMTISM9lWzZbiRLt3LldQEWZ8cb6xgXDgACdPmgE4DJTh0GZBgXk8A3pbgz5sfQdFYa2oblBMqnkp7c2mC73QJ53XHWouc14lHucDFpz7bedYgwRrWecmVENoabbI/KVHOtreNu0PqBKks71KWchK7ktBBTQLVUNlU9q1MF5T2vIu1uAd+ZnCgnKI+y2RSB3fvAP24PFzaoMs2E29sD2LQRJWRnwfFGkGNTrN5xA=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(426003)(336012)(1076003)(26005)(83380400001)(6666004)(7696005)(2616005)(36860700001)(47076005)(5660300002)(7416002)(8676002)(4326008)(8936002)(41300700001)(2906002)(478600001)(316002)(54906003)(110136005)(70206006)(70586007)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(40460700003)(41533002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:52:12.8487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 07f692b7-0f1d-4345-b875-08dc208e70c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5140
Message-ID-Hash: 3COCQM7PIEVTTNM52TZ7BDHLESOHC3E6
X-Message-ID-Hash: 3COCQM7PIEVTTNM52TZ7BDHLESOHC3E6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3COCQM7PIEVTTNM52TZ7BDHLESOHC3E6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Implement generic function for scanning SoundWire controller.
Same function will be used for legacy and sof stack for AMD platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 include/linux/soundwire/sdw_amd.h | 15 ++++++++
 sound/soc/amd/acp/Kconfig         |  7 ++++
 sound/soc/amd/acp/Makefile        |  2 +
 sound/soc/amd/acp/amd-sdw-acpi.c  | 62 +++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 sound/soc/amd/acp/amd-sdw-acpi.c

diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index ceecad74aef9..41dd64941cef 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -6,6 +6,7 @@
 #ifndef __SDW_AMD_H
 #define __SDW_AMD_H
 
+#include <linux/acpi.h>
 #include <linux/soundwire/sdw.h>
 
 /* AMD pm_runtime quirk definitions */
@@ -106,4 +107,18 @@ struct amd_sdw_manager {
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
 };
+
+/**
+ * struct sdw_amd_acpi_info - Soundwire AMD information found in ACPI tables
+ * @handle: ACPI controller handle
+ * @count: maximum no of soundwire manager links supported on AMD platform.
+ * @link_mask: bit-wise mask listing links enabled by BIOS menu
+ */
+struct sdw_amd_acpi_info {
+	acpi_handle handle;
+	int count;
+	u32 link_mask;
+};
+
+int amd_sdw_scan_controller(struct sdw_amd_acpi_info *info);
 #endif
diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 84c963241dc5..b3105ba9c3a3 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -101,6 +101,13 @@ config SND_SOC_AMD_MACH_COMMON
 	help
 	  This option enables common Machine driver module for ACP.
 
+config SND_AMD_SOUNDWIRE_ACPI
+	tristate "AMD SoundWire ACPI Support"
+	depends on ACPI
+	help
+	  This options enables ACPI helper functions for SoundWire
+	  interface for AMD platforms.
+
 config SND_SOC_AMD_LEGACY_MACH
 	tristate "AMD Legacy Machine Driver Support"
 	depends on X86 && PCI && I2C
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index ff5f7893b81e..1fd581a2aa33 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -10,6 +10,7 @@ snd-acp-i2s-objs     := acp-i2s.o
 snd-acp-pdm-objs     := acp-pdm.o
 snd-acp-legacy-common-objs   := acp-legacy-common.o
 snd-acp-pci-objs     := acp-pci.o
+snd-amd-sdw-acpi-objs := amd-sdw-acpi.o
 
 #platform specific driver
 snd-acp-renoir-objs     := acp-renoir.o
@@ -33,6 +34,7 @@ obj-$(CONFIG_SND_AMD_ASOC_REMBRANDT) += snd-acp-rembrandt.o
 obj-$(CONFIG_SND_AMD_ASOC_ACP63) += snd-acp63.o
 obj-$(CONFIG_SND_AMD_ASOC_ACP70) += snd-acp70.o
 
+obj-$(CONFIG_SND_AMD_SOUNDWIRE_ACPI) += snd-amd-sdw-acpi.o
 obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
 obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
 obj-$(CONFIG_SND_SOC_AMD_SOF_MACH) += snd-acp-sof-mach.o
diff --git a/sound/soc/amd/acp/amd-sdw-acpi.c b/sound/soc/amd/acp/amd-sdw-acpi.c
new file mode 100644
index 000000000000..babd841d3296
--- /dev/null
+++ b/sound/soc/amd/acp/amd-sdw-acpi.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2023 Advanced Micro Devices, Inc. All rights reserved.
+//
+// Authors: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
+
+/*
+ * SDW AMD ACPI scan helper function
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/fwnode.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw_amd.h>
+#include <linux/string.h>
+
+int amd_sdw_scan_controller(struct sdw_amd_acpi_info *info)
+{
+	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
+	u32 sdw_bitmap = 0;
+	u8 count = 0;
+	int ret;
+
+	if (!adev)
+		return -EINVAL;
+
+	/* Found controller, find links supported */
+	ret = fwnode_property_read_u32_array(acpi_fwnode_handle(adev),
+					     "mipi-sdw-manager-list", &sdw_bitmap, 1);
+	if (ret) {
+		dev_err(&adev->dev,
+			"Failed to read mipi-sdw-manager-list: %d\n", ret);
+		return -EINVAL;
+	}
+	count = hweight32(sdw_bitmap);
+	/* Check count is within bounds */
+	if (count > info->count) {
+		dev_err(&adev->dev, "Manager count %d exceeds max %d\n",
+			count, info->count);
+		return -EINVAL;
+	}
+
+	if (!count) {
+		dev_dbg(&adev->dev, "No SoundWire Managers detected\n");
+		return -EINVAL;
+	}
+	dev_dbg(&adev->dev, "ACPI reports %d SoundWire Manager devices\n", count);
+	info->link_mask = sdw_bitmap;
+	return 0;
+}
+EXPORT_SYMBOL_NS(amd_sdw_scan_controller, SND_AMD_SOUNDWIRE_ACPI);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("AMD SoundWire ACPI helpers");
-- 
2.34.1

