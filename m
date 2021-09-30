Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE0E41DD27
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3873216F0;
	Thu, 30 Sep 2021 17:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3873216F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633015014;
	bh=cZCye2tQ89qrn7x5MJOXevt3SkDtXNwwGsDoFGsEQh4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESKecB0Y/SDHr2ZVZWeUU/OTROwiiWG5+pMN9mYU/kEeQFhcjWzYPTOBaxec9V365
	 yCLtMaWkcUyrWIRnd0+Z8z/wJ31FNiS6xzQgqXiDoF0atYjjYoGLJbhRiIKmhFfTTX
	 Wyk/azUELdHhTUBIDvrdbesf+/exMu2zV0pbLuB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1FEF80538;
	Thu, 30 Sep 2021 17:11:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04108F80218; Thu, 30 Sep 2021 15:27:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B459F804AD
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B459F804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="VZkyxJKR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2odFR/jfcKDeG//C5tInQ9704B/Tcv77Bgw/0lVLfHVeen7VoCXk8VGHYBTd8T+MlVTsTkw17oJ1/Fb7kzrroQtUPWmi09X20RICarEYQmCd7SN8fKKPGg8VfZcgxxFU0A/+1cI05PECjFERQdC67L/0wYTuLt3P+5Q1vjgFFebRa2DpjqfA/imuBewGs4PomeGg/FOzcr5XHBqLxyo/+Wu5NDLLLEtvqUw2cihfwmWq1XB53LTsQiDCkHlD1kzn9EOgkmti64ZWDcAhKkm3MM4mD6dvnXOZyn9tLBkDhfCytqIhTsFShdFCIPZK+CylYBno8tsoC0IvtJ+2tDO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ZSoK8bRWbL4+AMQ2UOgh37WazNqqAe3asPcE/VDcf8I=;
 b=ksDjrplj8Mbw+u9T+csmU7Qx6+04uvBtNDo6rEHRhhOXyrI1UFNNhKyEGQKpna3UbPlRUcdQ+rJfOfKNqK7hbjj6eeE5z7GOGSExFG3bPgO+Kc2m3H22uFg+RkaETZNJyRPo8p4oVwJQhHUhkE2FAlL66t2m903qRqQN+9Tle/F0UNhpD0JeEXHRwfz86fMGBKrhczr2AbONCw/fh1JPJ8BYDP27LPJJvu2tWREp0IX+N2f0VAz+mNeQKXM4xk5Um4hp8MRoUzIXkjCX6dcezpy6rW2ZqiJYslotd6Uf6/Bt3KFjEKLEt6xrnpGwKHxjC0VZ4pFrb2ecFTVmdI0Q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSoK8bRWbL4+AMQ2UOgh37WazNqqAe3asPcE/VDcf8I=;
 b=VZkyxJKRVs8m5RD0OTtgjgCsRxyji31pRwuiTGS2fD1li4gVqLlWg97AjbaXB3yUc8GywOI75l3nRdSFgYwTi8RUDsky0vfnEZH3WpPn7JLpDuOkl3CyReme/Ivfs78Rdtn9hKJo+7cXqgBm+EGuxA5HIC30uitcsTNap24UsPg=
Received: from MW2PR2101CA0009.namprd21.prod.outlook.com (2603:10b6:302:1::22)
 by MWHPR1201MB0014.namprd12.prod.outlook.com (2603:10b6:300:e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 13:27:46 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::60) by MW2PR2101CA0009.outlook.office365.com
 (2603:10b6:302:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.2 via Frontend
 Transport; Thu, 30 Sep 2021 13:27:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 13:27:45 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:27:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 06:27:43 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 30 Sep 2021 08:27:39 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 6/8] ASoC: amd: acp: Add SOF sound card support on Guybrush
 board
Date: Thu, 30 Sep 2021 18:54:16 +0530
Message-ID: <20210930132418.14077-7-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80bf047c-b7a2-4ac9-2002-08d9841616da
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0014:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0014870A9229F8ABBBEC1A3782AA9@MWHPR1201MB0014.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvOB0bEQJp4T3fXMEakSazgldEF/g8klVlxGYkPXQmlOHQOUGNsAvdaRY82HMSFFUH0Xk+6NRUG/b2kw4hD4U0YTXvXkc6AIwADmUpvxwUgX/zgnpsJrLt37Ii98p04DX74b0vfDbNlvNJUZ5v6NJcSYM2hiVnlkuawZmX0k9jmth/KQntCgHrBHcgnJ6xvksJAIADFlVlUM8s/jvqum+LYRPQUoY+XKe1vDfPIMSPZWu5P2wje4bg/I5r0QngTHNVvVYlwe79vMvtWbmymxltaYKxDTUQzF8u0vBrcExL3XMYxDKx9whxpC0rYAy1Nkpj8KH/WO39/hV3YQxkukymKNqdzEt3uNCWZMTiNICjOEUXgILxT3c2YCDkrJD2398hk4Vxeh/A7idtRtc/XPLz7rOiAOKspG6PKqbdjd6XJnZIUpJ/H0Ib+zHnvUgZwBRDh1MiL+m+X6fNVs9KF1/yGYehfr1Ab1dUe5iUJ6Zf2JJBYL3kGcC2Lihvgy1qyjX1Uuc2bB00LPGkRiCY0HbQ7NT5z0ZHa5RizASqQhvsqNHxcVEYTI6Pb3MhhSscZCkkGEiRn35in+d5invJGMNUDrUYgUwC3addoEz/AX2e0l6w8Kyw2/8IiBpxad7ueRCk+pyfNwwPs3WXv5q4PUuDUnWscwGyQ2CwKGLbbBwEWJCwKHDmOkMx/XDuC92SQiG2qs0aL19+uyjf5ovAdgb5g0UQVqMZLyX+YALSsTlxc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70206006)(8676002)(83380400001)(70586007)(186003)(81166007)(47076005)(7696005)(508600001)(86362001)(36860700001)(82310400003)(2906002)(356005)(26005)(426003)(316002)(336012)(2616005)(6666004)(8936002)(54906003)(5660300002)(36756003)(1076003)(110136005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 13:27:45.5627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bf047c-b7a2-4ac9-2002-08d9841616da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0014
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

Guybrush board has RT5682 codec and RT1019 amp connected to I2S SP
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
index aea8766d20a0..55dda516a0d0 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -39,3 +39,9 @@ config SND_SOC_AMD_LEGACY_MACH
 	select SND_SOC_AMD_MACH_COMMON
 	help
 	 This option enables legacy sound card support for ACP audio
+
+config SND_SOC_AMD_SOF_MACH
+	tristate "AMD SOF Machine Driver Support"
+	select SND_SOC_AMD_MACH_COMMON
+	help
+	 This option enables SOF sound card support for ACP audio
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
index 000000000000..9da70550ea25
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
+static struct acp_card_drvdata guybrush_sof_data = {
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
+		.name = "rn-sof-rt5682-rt1019",
+		.driver_data = (kernel_ulong_t)&guybrush_sof_data
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
+MODULE_ALIAS("platform:rn-sof-rt5682-rt1019");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

