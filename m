Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8408C4293C7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 17:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD9616A8;
	Mon, 11 Oct 2021 17:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD9616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633967313;
	bh=uYPq5L7x5FL5c2c3q0EwYexxyvfmPXiwrMgR1iRVwfM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lrq6zdSmkhQ68aTDqKeFdHZAc8x9y+3iJHH+XAJ3Lu79kBaU+OxLwnEbFTTYB9NmR
	 mmAImzsnGdxjc3QgvK+eizWEvacBiKdeUBuDHExEUVRVx77gcbOCIDvgH/EgSHVV6e
	 DUWw2WFEE+ePFE9dAW0z8Axx8BexYozj4YS1eUNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B830F804FD;
	Mon, 11 Oct 2021 17:46:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 743A3F80507; Mon, 11 Oct 2021 17:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BC71F8028D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 17:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC71F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Z4ZP+S/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZNu6xjsZdMZ2jjUH1v6H6pisy3mgtVFwMGncsJY6/ilau8xCm87ou4AGh6rl+n4ODB4cl1CChrTQA7gazY0VlgnI2eu/xtRHyoxB0d0SKG9XmAEhfigS5+mJh9Aihz0/M23+Hyt4JqF5yy3JVe6wE+5UNf6JBCPP8MjWDFwm3HBz+hD1pclhUYh5saoW0fxNJ7GzGxs92ioxsVOcQQRfN80mMDVAfRDP4Bjn2mjOhG/bHnxky72YLJNui+IOEOQpk8rZ5zFOw/9BKCnzCPKZRR7fq3kSuWdceYe114kP+W2xd4BY7B17zpWWWoKVuSwQpCEa5pRpMajZzPjdi1WIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gs1deK7+YQhONz7SLz8hGEY3e0IU+L4eJ75C0l+90Hk=;
 b=EhOIIGuXvakarP2OumwBy6XJhrYiMy91TgOnBvXUSJHyiyCjjTZ1arwcZSzf+UpyKj5SukM/mZjmTX+NvjcMzmY518OGdE7mWHQ74ZMqsPPyJtSokNZFIXJiEbJldF0bS3iarh9QNOGejwKr+CIYu86mwW+2xHBOBBCi2kJ7xTHbZMw6DxlOhEVmhacufr/hkO17HSYWozJW9I1INU4PhsWmdrPHYvDmyG8LeMwt80GyrkvfPuXb02vmC+pWNI3JrsD8tjVQ0FPz00fP6xtZoHlzDtyC7dapSYaZVl+wOj7h8Bk2MyMB+Pfe5XCM0F4mjeaH31lxk/7bkaI3JTGOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gs1deK7+YQhONz7SLz8hGEY3e0IU+L4eJ75C0l+90Hk=;
 b=Z4ZP+S/9r032998DZkjREXZD3UboBrdc8gDutvW281tl+iNMO6H69gLMeJ8bN+uXnDl6DeKvkk5JQcBsqKE+bzyygJFFOI4U9BZEkWID3fFsPvHlMG8DhBmuaJIONe2ats1f0djBOOYCIfPmuTSjvKt4txpJ/CyDS8LOBjGIDtI=
Received: from BN0PR03CA0019.namprd03.prod.outlook.com (2603:10b6:408:e6::24)
 by SA0PR12MB4526.namprd12.prod.outlook.com (2603:10b6:806:98::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 15:46:35 +0000
Received: from BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::97) by BN0PR03CA0019.outlook.office365.com
 (2603:10b6:408:e6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 15:46:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT028.mail.protection.outlook.com (10.13.176.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 15:46:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:46:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 08:46:34 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 10:46:30 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 5/8] ASoC: amd: acp: Add legacy sound card support for
 Chrome audio
Date: Mon, 11 Oct 2021 21:14:49 +0530
Message-ID: <20211011154452.76849-6-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
References: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0c8b890-b329-4625-5406-08d98cce4e44
X-MS-TrafficTypeDiagnostic: SA0PR12MB4526:
X-Microsoft-Antispam-PRVS: <SA0PR12MB452656FEAF1251DE7CAB5AFE82B59@SA0PR12MB4526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byk5AL9IXH1Z1oEUnx4Ly5VfMEAv13B5Lfpr0K8n05G5Y0nCxRoqgQsY365sJDcMuo6lZBLV17UiyVsPAnHjDsaTZ3csNhNKx5Fv1gH/FzqLCrSrEcFes519Mjx81IerFlG9JHy9IAfAyUhWWzx1QTd5QMAY0ofgDLDLKSYybfKB5LZvIFxwpGfvbqrqBhsaTCzqvCE7kZnFK4OW791dVStctg1z2Cl8Ndd9yliJFUB/WW7HNqQYeE5NfXIQant3GCQq97fgTCXWym3cYGcDtI1Y5bP3gJxUKbVdO1Ofms+/eMf9VZKbF5qH9ySPsNUle3BF3e7b0GK+UhcPSDr7CDGm8I9VO0h/2auxR97W74BenicLbv9cuNEG8J8vyB6JWhWPyLKI44Hw+fYH5//D1JamCEQqVK5zA55UzpGxcXjFZVl3kKV3s0xeEEnXDm4mjcdwEqGzgdXW7df/7d36WB1WDzWCem5lIsx7XL2E6TCQTPdIt9YAUTt0qN153pP0VQpC/CNIhgmIbseVr0Szx+nM0/tpzl2Vyx7ogSibDQYir0F2h60KK8ZoZcy+6qatShE6Jrh2u41mQ5f+eQRzXWK28f7qu1sqtM9tRI+n3YK2oSGTW12mvbcP/wSqi8a2oTusTRqed81QOImgaD4GW5n625IgujDvvoQTTlIZSx/aqlTDQJ1YuQx2Spt3qxFKreftdqlVSyB7SeNpmRi17suF9D7mZsKXqyyylVRw/Mg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(82310400003)(336012)(8936002)(5660300002)(8676002)(316002)(2616005)(1076003)(81166007)(47076005)(356005)(6666004)(110136005)(7696005)(426003)(54906003)(83380400001)(36756003)(508600001)(70206006)(26005)(2906002)(70586007)(186003)(86362001)(36860700001)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:46:35.3079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c8b890-b329-4625-5406-08d98cce4e44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4526
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

Renoir based Chrome board has RT5682 as primary headset codec and
RT1019 amp device connected to I2SSP ACP i2s controller. Add driver
to register legacy sound card devices on Chrome board.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig           |   6 ++
 sound/soc/amd/acp/Makefile          |   2 +
 sound/soc/amd/acp/acp-legacy-mach.c | 104 ++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-legacy-mach.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 5cb7115662d2..2b9440372346 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -34,3 +34,9 @@ config SND_SOC_AMD_MACH_COMMON
 	depends on X86 && PCI && I2C
 	help
 	  This option enables common Machine driver module for ACP.
+
+config SND_SOC_AMD_LEGACY_MACH
+	tristate "AMD Legacy Machine Driver Support"
+	select SND_SOC_AMD_MACH_COMMON
+	help
+	 This option enables legacy sound card support for ACP audio.
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
index 000000000000..de0f8024e2fb
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
+static struct acp_card_drvdata rt5682_rt1019_data = {
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
+		.name = "rn_rt5682_rt1019",
+		.driver_data = (kernel_ulong_t)&rt5682_rt1019_data,
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
+MODULE_ALIAS("platform:rn_rt5682_rt1019");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

