Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C912A4293C9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 17:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2B0169F;
	Mon, 11 Oct 2021 17:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2B0169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633967325;
	bh=DG65+iOSaPW2xSX+Es6LIqTGugOvvFl3xuTJxb3N8yw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHWFZuEwdzD1Fuhj8VVXEbd2186kYyCM0coVbA0x1a6sqXUFl8bfrJIeCR00Langd
	 idFIO9Qc4NfTAu4/2zw2+WHgSW5s0oCEZcQ0SGr4TgITBfKVLG1LdxV8c1y8sjbRfV
	 HCFWDGRKPkBHoLdBJGOTO1dfH/u72DLs7LVRMai0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F4BF80290;
	Mon, 11 Oct 2021 17:47:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88E52F804E6; Mon, 11 Oct 2021 17:47:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98BA8F8025B
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 17:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98BA8F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="az+DBoe3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXu+FpxUzTe7XbcM1c+HH2+X+XIEI4Yhnk8YeYvzz2YSPcSxOMFM3o693zbc+LjJveD3gn5H6p4TlXeIIBNEao/LdsTEy30sgpG6i0ExR4ZfI2VD3LTe1tthVs6XxfKNt26abPs5opi8ZAFfu/SMYftVrdsT6L3CrqC+B/1HwBYRI9Udehfz9RXq295soAtCrrUNxSpEgZ3TGR/AKStYaozjVMGSHLcns2U4kyu3Ue0e+z5l8AFb1qLkcmbNNu07wunRfTZhYo+IZXdfsRFEEwxIQH0gP1j6uWsX0SlCuVZJfohmLG5HxgrGrTXgqr15w7EzglBeJnvZSv4cQNuoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODAVjAVsD1mJuYxXiEeCcvzCQv6rKMVDDadJUSgfXFU=;
 b=d4hWx5MjT3Va3LAlCbXqmNqV/n5HPSDRkau/2f+2IWEbmgU1m5Cg6dB5O9Sde1PBh/b4l3/jNzV0CAr5A0JTXseSEV+1cOkXs3SVCoUaYYH/mkwzAENjR2WHfqrlqaapcAR63CQPsw1EvL0EqQ/oZjrffFfInSxJrxuHawW7WJt55NsplWasOMSoiAEdG1MPT2X9o1F/O8kmpMFkD4mmXQCGMQbtmPAZ21+R3/E8HkrR7dTkMtoPXvIWhmYeVw5K8L+YwQ2MROpfdbSeBnMR/1ndawQncSNReVJEaeYUeGiIh2dcGmUY+CrFxdOT8SzVvkgKVBjXOwYi7bRG/FP7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODAVjAVsD1mJuYxXiEeCcvzCQv6rKMVDDadJUSgfXFU=;
 b=az+DBoe3b0zZngIthn8rciJEw0jX8tCgf/ZmEFGuA+WKobUfnC2bdMrN1cJKx/S/GedUyMv6mRb88FdKKMiU2GcVTPwuu0loUl10drQmY/5tUb90US4qES3/MaHLFLNZWxTtWhWzIqYrWem/wTpkdQ90DdTX6qedLbJNZN2EDik=
Received: from BN6PR13CA0057.namprd13.prod.outlook.com (2603:10b6:404:11::19)
 by DM5PR1201MB2506.namprd12.prod.outlook.com (2603:10b6:3:e7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 15:46:52 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::4d) by BN6PR13CA0057.outlook.office365.com
 (2603:10b6:404:11::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend
 Transport; Mon, 11 Oct 2021 15:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 15:46:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:46:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:46:50 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 10:46:46 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 6/8] ASoC: amd: acp: Add SOF audio support on Chrome board
Date: Mon, 11 Oct 2021 21:14:50 +0530
Message-ID: <20211011154452.76849-7-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
References: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b1090b5-0da2-4b1c-18d5-08d98cce581d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2506:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2506681CBDF485302312492582B59@DM5PR1201MB2506.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atXdS6W7AZsQfAIzs3mzfF9qdBaIa4eodm9ulS7ZO0P7v4CDIC4xUDsxWSYdPlSCwAb1dzP0wbzIHRlWZT/f9OTMOSAVbCQkASdfJOyBQBTNoWMcVoDBAoiK7FfQACYi0GFJ1fNw+mJLstg6O5vwgeY8T7bUwyo5fJpu8Cs9ZPsTX1Qjlh1buSSzuLySIT+QWmi+sQNVgFYg7Rfl4+jnnfEtKoXIrX0c5dx7yDyldE6jX42uGN1Ah5EamJMRHz70U5AOvafYh/VGF8iz0Tpu8Bl8cZDD6UnTxVKXUYDVZrlSIHfjM2fcdG06mq2sUAX2q8+JNzl88uS9KVgkd2BDyOCc9IQauaqo0wNbH0iW7EDg/fFcZIkfvMTCKeoW7+wTGb8/4Q1YKWeOGXM199cooErackfWAalPiyGk6iWytCY0fE5B1NZtExpmHWRU8W72MizhXH26ULHV9nHEiWbUMCByOmoI4NBTyRevd44jfNqXwCHpD9VAGlihjUNAXDIo1aKrW5dSOtzo3nHVIN8XgAMOPRt1gGtxf5kqf+SzZ0bRoOYW66VTlNYCRHe4I2k8nR+e8gTgbNVkhW0p1i/zSSPUUvQR2DEA/OeSqL/Us5stlJKKjjbFtZCUmxiQka3fXQnGYoR5nFtV/Pxv/6MiBq7igw5BMHl9wRRAElCCusbGzJfHX4Em3i9Qy/145MemsQThmKhUSwLxoeb33jwTx65NxAGNMZ7T1zYYDBB4lNk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(81166007)(8676002)(316002)(47076005)(4326008)(82310400003)(26005)(83380400001)(110136005)(54906003)(1076003)(36756003)(186003)(356005)(8936002)(426003)(508600001)(5660300002)(70586007)(2906002)(2616005)(6666004)(7696005)(36860700001)(336012)(86362001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:46:51.8289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1090b5-0da2-4b1c-18d5-08d98cce581d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2506
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

Chrome board has RT5682 codec and RT1019 amp connected to I2S SP
controller on ACP hw. Also it support DMIC capture endpoints with
inbuilt pdm controller on ACP hw block. Add driver module to create
backend dai links for sof dsp core. We pass driver data with audio
end points configuration to register sound cards and create device
nodes for all audio endpoints.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig        |   6 ++
 sound/soc/amd/acp/Makefile       |   2 +
 sound/soc/amd/acp/acp-sof-mach.c | 103 +++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 sound/soc/amd/acp/acp-sof-mach.c

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 2b9440372346..d170672927ef 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -40,3 +40,9 @@ config SND_SOC_AMD_LEGACY_MACH
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	 This option enables legacy sound card support for ACP audio.
+
+config SND_SOC_AMD_SOF_MACH
+	tristate "AMD SOF Machine Driver Support"
+	select SND_SOC_AMD_MACH_COMMON
+	help
+	  This option enables SOF sound card support for ACP audio.
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
index aef6f981c770..16c144c2965c 100644
--- a/sound/soc/amd/acp/Makefile
+++ b/sound/soc/amd/acp/Makefile
@@ -14,6 +14,7 @@ snd-acp-renoir-objs     := acp-renoir.o
 #machine specific driver
 snd-acp-mach-objs     := acp-mach-common.o
 snd-acp-legacy-mach-objs     := acp-legacy-mach.o
+snd-acp-sof-mach-objs     := acp-sof-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
 obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
@@ -22,3 +23,4 @@ obj-$(CONFIG_SND_AMD_ASOC_RENOIR) += snd-acp-renoir.o
 
 obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
 obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
+obj-$(CONFIG_SND_SOC_AMD_SOF_MACH) += snd-acp-sof-mach.o
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
new file mode 100644
index 000000000000..e143aa24afb3
--- /dev/null
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -0,0 +1,103 @@
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
+ * SOF Machine Driver Support for ACP HW block
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
+static struct acp_card_drvdata sof_rt5682_rt1019_data = {
+	.hs_cpu_id = I2S_SP,
+	.amp_cpu_id = I2S_SP,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = RT5682,
+	.amp_codec_id = RT1019,
+	.dmic_codec_id = DMIC,
+};
+
+static const struct snd_kcontrol_new acp_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Spk"),
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
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
+static int acp_sof_probe(struct platform_device *pdev)
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
+	acp_sofdsp_dai_links_create(card);
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
+		.name = "rt5682-rt1019",
+		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data
+	},
+	{ }
+};
+static struct platform_driver acp_asoc_audio = {
+	.driver = {
+		.name = "sof_mach",
+	},
+	.probe = acp_sof_probe,
+	.id_table = board_ids,
+};
+
+module_platform_driver(acp_asoc_audio);
+
+MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
+MODULE_DESCRIPTION("ACP chrome SOF audio support");
+MODULE_ALIAS("platform:rt5682-rt1019");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

