Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D080741DD24
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:16:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B7DC16F2;
	Thu, 30 Sep 2021 17:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B7DC16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014995;
	bh=tbbDsE5JbM0gQi1PcuL8prxqKMVQ8jKbXNTAUe9MqwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6DD/qu0jWtjIA/Xbw928B+qUgHLjCPQrOIy/hUx6NL4uOL3ljcXlrwvWscROJbX3
	 9HVuvG9RCw+iFVnJimQYFWkBNo9fnaxgi86p1/zFERNWuoyKU1mKBHlafpTN1rC07P
	 mjzI99oIbHMdv0ZS3SoxQ6V77vAvVIDbqX1gTH48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7DFEF80534;
	Thu, 30 Sep 2021 17:11:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A56BCF804AD; Thu, 30 Sep 2021 15:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2074.outbound.protection.outlook.com [40.107.102.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3EF9F80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3EF9F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Dglub/VU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3RbJrgwBWPd+MV3STzVEc/bPwIAq0MGg8Sc9FpgtIL6YtKSee8PfGpW5202h4akR9iIHauIZjw/xHPXnVXfGppmZ2BR4gQHUCCRwU6wih53ajZvRZ/w3+qUV+cnoEhRQdwq/lNcVvtCmjh9wQjO5WqREH/vr0WIX5cM9m2bP73G+fkv84Nucwz9ZHfaZGy++RExQVT8svoDTmYESVlcRXJj2QCKvInyZICKR+XTH4DG/q20CNpbvvqjaZMsp52L3ha9J6r8E9Fn6yO9ZVT2nfg7v8A3IyPAPWaQLp1uB9MQS0HYxsE5/9o1YNxSY7al9z1NvRqGDR4yfghth0+MlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PnqSKg26VzDvRzqAoRy8R01kG3MV7iGDE4g2ck6AtPU=;
 b=UgwlWj/4m6qAkAh43SgjKf31VyPOBT+1NQhPN4Bm9PIMBdVSYeDxyN9JYfDiLLXE7GHX9NNfXuRM0kbSScUbT9OeuEziULq3NoHht3N82Hyoz5XvK8Ihn9Yur0GGmaBmLDrZ9+kxmVv0zxX8zqtcZ8drOkn3nWittuVLvQeRtquRcp8XtRwlmpeg0kz5+KzgqSEM3d0h80gWazCGn66jkO+JcyNJTEmGfO3KDjW4KKgMPu5uirNSij71gNYBbQRCzjIpTpW7lNAjF3MYaJoqLlEcUJ6vnM3iRs2ldEVOjo7H7Ifamo5u5gMSFwC/EN77dXPqnBsTjxrs+Q9/p+RvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnqSKg26VzDvRzqAoRy8R01kG3MV7iGDE4g2ck6AtPU=;
 b=Dglub/VU8JIbH/6lkLssg601FIEukD2JOYXDCf0fO2hpDdQIpQDICNYnmYTnJMQZQTCwp4CLG6sT+zq09sWdfp5G6QWbIvlRSZaMHRuwATYPqnYw9i13CE22b6YsgHOOe9SLA5c9c/FuzOxtyuvC+NLng9XM6TRdv7oQiAOncHg=
Received: from BN0PR04CA0140.namprd04.prod.outlook.com (2603:10b6:408:ed::25)
 by MN2PR12MB3870.namprd12.prod.outlook.com (2603:10b6:208:166::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 13:27:30 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::98) by BN0PR04CA0140.outlook.office365.com
 (2603:10b6:408:ed::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 13:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 13:27:30 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:27:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 06:27:28 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 30 Sep 2021 08:27:25 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 5/8] ASoC: amd: acp: Add legacy sound card support for
 Guybrush board
Date: Thu, 30 Sep 2021 18:54:15 +0530
Message-ID: <20210930132418.14077-6-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab160141-1e23-477f-c7d4-08d984160d86
X-MS-TrafficTypeDiagnostic: MN2PR12MB3870:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3870C8825F156AA3EE9D96E682AA9@MN2PR12MB3870.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kgMTk9RRCB7Tga3U/XgkFf/p3D1s4Ucoxi3R+2NX5UGkXwWC5cfWomIWRh0DTWmE4YgROx5hg08TpPRsvh7aDLGqmS6H5r2Jm9af1QmAI2m/w46xgkYngzsGA35gL3/ttgf9XViZeIzeJiOpBcHpfNJTdNOHQfv2sorPisc1KHSmOE2/Sgnu3zdcXz9Zvz4j2l+dGXXhZ7KYKiYUvZt4oFVg4PIU5JM+T9H0LlvSe7r9y/6ZKUXzr5DM5g7HmlZzkbmIRhNDQb/r2UWi/o/xEKeE40xnCP6jD8W96FmRG7fxs0pO22ZjpFgnYfANDJz5Z8w6wxN4p8h+1NPGV8AihJnV98V4HNaxbR20dwnj2xynM6WVbGTQNtlWip0xXIUunKIPkCZ/AFlOxsPUfg7uU5rNF4WndMp/HRus5y3ox9ditm+ZmLBwAQv7MXWyAsho9YfWFgv3rz01fuR8t1nSdzoPULXv2pjDpgRXerqYX9Bmx004sPvsuO/++zCi72jmm4JfvAX2Yg6r4Linx2SMy/nMNguO8B+xcBf/l9uYECdmMuYL7eNxK5fzROPOJ9GimZzggZLhlTgqcD/llpTdjHZ3UV/peoLCeyvDd3eJ2I7V4T1KTwt78BbFktQpEem0qx49+MeczfZNfGcUoAuVU0yvERwWdjyuZLtgZEfJhMSvFBhmpCziHfPXGQFssV1vho6m/0UyLyczAS4GQnX4fEvSDr3MmURCgh+mt8psufc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70586007)(2616005)(36756003)(86362001)(8676002)(2906002)(336012)(70206006)(508600001)(47076005)(8936002)(26005)(1076003)(316002)(110136005)(54906003)(36860700001)(426003)(7696005)(81166007)(5660300002)(6666004)(4326008)(356005)(83380400001)(82310400003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 13:27:30.0065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab160141-1e23-477f-c7d4-08d984160d86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3870
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Renoir based Guybrush board has RT5682 as primary headset codec and
RT1019 Amp device connected to I2SSP ACP i2s controller. Add driver
to register legacy sound card devices on guybrush board.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig           |   6 ++
 sound/soc/amd/acp/Makefile          |   2 +
 sound/soc/amd/acp/acp-legacy-mach.c | 104 ++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-legacy-mach.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 1ad811707a68..aea8766d20a0 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -33,3 +33,9 @@ config SND_SOC_AMD_MACH_COMMON
 	depends on X86 && PCI && I2C
 	help
 	 This option enables common Machine driver module for ACP
+
+config SND_SOC_AMD_LEGACY_MACH
+	tristate "AMD Legacy Machine Driver Support"
+	select SND_SOC_AMD_MACH_COMMON
+	help
+	 This option enables legacy sound card support for ACP audio
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index a477a18272bf..aef6f981c770 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -13,6 +13,7 @@ snd-acp-renoir-objs     := acp-renoir.o
 
 #machine specific driver
 snd-acp-mach-objs     := acp-mach-common.o
+snd-acp-legacy-mach-objs     := acp-legacy-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
@@ -20,3 +21,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
 obj-$(CONFIG_SND_AMD_ASOC_RENOIR) += snd-acp-renoir.o
 
 obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
+obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
new file mode 100644
index 000000000000..8313f371f249
--- /dev/null
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+//
+
+/*
+ * Machine Driver Legacy Support for ACP HW block
+ */
+
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include <linux/module.h>
+
+#include "acp-mach.h"
+
+static struct acp_card_drvdata guybrush_data = {
+	.hs_cpu_id = I2S_SP,
+	.amp_cpu_id = I2S_SP,
+	.dmic_cpu_id = NONE,
+	.hs_codec_id = RT5682,
+	.amp_codec_id = RT1019,
+	.dmic_codec_id = NONE,
+};
+
+static const struct snd_kcontrol_new acp_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Spk"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+
+};
+
+static const struct snd_soc_dapm_widget acp_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static int acp_asoc_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = NULL;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	if (!pdev->id_entry)
+		return -EINVAL;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->name = pdev->id_entry->name;
+	card->dapm_widgets = acp_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(acp_widgets);
+	card->controls = acp_controls;
+	card->num_controls = ARRAY_SIZE(acp_controls);
+	card->drvdata = (struct acp_card_drvdata *)pdev->id_entry->driver_data;
+
+	acp_legacy_dai_links_create(card);
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev,
+				"devm_snd_soc_register_card(%s) failed: %d\n",
+				card->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id board_ids[] = {
+	{
+		.name = "rn-rt5682-rt1019",
+		.driver_data = (kernel_ulong_t)&guybrush_data,
+	},
+	{ }
+};
+static struct platform_driver acp_asoc_audio = {
+	.driver = {
+		.name = "acp_mach",
+	},
+	.probe = acp_asoc_probe,
+	.id_table = board_ids,
+};
+
+module_platform_driver(acp_asoc_audio);
+
+MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
+MODULE_DESCRIPTION("ACP chrome audio support");
+MODULE_ALIAS("platform:rn-rt5682-rt1019");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

