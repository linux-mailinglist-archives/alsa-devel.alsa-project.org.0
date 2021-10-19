Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DF432F13
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:13:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F3616AD;
	Tue, 19 Oct 2021 09:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F3616AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634627591;
	bh=0BtAhseZLmXKPaHKD4lqKFOvmvpiQ9gpeG7Pqkz/9bg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EgMacYoTq5DUwDDWdnXLUvZmG5rzHNaRAyIOT52PQonPhJJGiSKskWZ2tiFFi+rJM
	 Pz2HyyoXTvsw6yMDflokJBNOu9zQj456bkJVI1BFFDZhtzATzozad5IbdnwtyTCJV/
	 nWSFRupc9pMOnnnofP7PaUnrz8+u/OZFLSjAJy1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ABE0F804FF;
	Tue, 19 Oct 2021 09:12:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16184F804FE; Tue, 19 Oct 2021 09:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2D92F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D92F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="0iQx6oK+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7sdESwIi1+A/y9UoxiqyuDmLuDQvzEbF/OA9MUqfYJ1vSfNNMmZp8m9ZU16glt1I58/Likjbtcjy/VNZZxql4+cpwIUcQ+rFRU+gGiXlqAaYiUsGbsZN0tOqgfLv4u/BWieZTFJkKcunYrkw3pfREG00xn3QH6SdBI+0x76wzM08Rhc2vbRJeA4WI2eHa6jEK+oiNe3br7IQEkJu8cTohLjyHvXXYaO7ozFpTgdlEol/2WzQ4rO3xlWQTaCruSHoQpH6P8pn3/oAhx/ZKuuQ13kDh1bkIbTjyFUPJif+SGWnvt8pEWoR///YJ8/QeFecD+YdNApYD/hX8y4zBUWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr7H4HVEE2ArKZraMY7FjqWU5X3+5bGa82+8DYdAfEs=;
 b=AI67IBNMVaMGJ8m3JDKsxxN5422EYeTzOKQsiZIQECVES1yofrhYmk15WqgRebJ2Rx31E3Bnk8ItPBlfE0eprNgbeae+lPgkTZLxyaC0GCA6sktt5xtsI65UdaAPM8WSYZSHRes9TLqZ70uSOlB35Ka1ZtoBmVVM9G5Pf9C5C+Op8R7DBGhKFqiQjssQNKiaOR5qI3gRQlxyGHeXVwBogXPuMGvxTMu9FVQkuJ7I/JzOzrWanz7C85U8p1VvXmr6qJRNKJrqrkbpkzMqejxHRuK1VXB5vTCIbwd6ukZTZbQrlOCZa8DOFJP5cxvti7monXMz8mduHuRSCakopHrrVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr7H4HVEE2ArKZraMY7FjqWU5X3+5bGa82+8DYdAfEs=;
 b=0iQx6oK+A2EPemw1k6Um23SkhnQR9ZxMQw7jzE8aqKrb+y4K91lxewaXWVxqE7+VsLxLqulVZ463lrHblWa3f1M+IECmsJK+pBRxD+BUlCLLwhZKuzbOD7im7KmfAEYFM5kBtOgr30XXz+oTrWeLC21btx8k/M9ZwT1pkpTVo8w=
Received: from DS7PR06CA0027.namprd06.prod.outlook.com (2603:10b6:8:54::6) by
 DM6PR12MB3226.namprd12.prod.outlook.com (2603:10b6:5:186::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17; Tue, 19 Oct 2021 07:11:30 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::d6) by DS7PR06CA0027.outlook.office365.com
 (2603:10b6:8:54::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 07:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:11:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 02:11:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 02:11:28 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Tue, 19 Oct 2021 02:11:24 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 5/8] ASoC: amd: acp: Add legacy sound card support for
 Chrome audio
Date: Tue, 19 Oct 2021 12:39:35 +0530
Message-ID: <20211019070938.5076-6-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019070938.5076-1-AjitKumar.Pandey@amd.com>
References: <20211019070938.5076-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9df87d33-744f-4d60-34b3-08d992cfac7d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3226:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3226CE3D86D923983E319D4382BD9@DM6PR12MB3226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +/wO2O6qfbCD7zQsSNw1opsbHp+e0LXeYSkK8IePCTXBAhpV2RtdIo9I2xbdjzM6iwoUIT0RjftqBmj1wzrXxEpt89pZwyQoJEz/UhENSEO1pvSh1WAVbz/d7k2mLN6bjsiR1xO50H7BI5v7nGxnHkox5ykVdV+lBqMkCrE2ko1TsbdI9NG6jFkDB7Cc1ainQvoohJIBn7KUwc3DITQw6l7DW/C0FXZTbRnszk1VJaTAwNAaMdq4d6za8mjHQh5TiZDX/sNmjBihY9dvSE8GgRxMAsQQUxSpe1y9QSyqwu0Y4MKgOxBOstAzVoWykCllljgY2+vEIuVQhuTV6c2vus8roqWTvuH2CoNSAIIKzUYqflPV2FuRr8VKHw3BCx2WJmYX90rXYDlfZ208mRwUwF46A71D607VjKrvtmu9bMJvxdjvYFW2bsToXmjO6KDTuFJgfjebNjq+79ZOfjokLGYM8VoK9mog73OargZOd52s4x0MAv8JJeFFqXpI2puz/Q8Yo3qWp4PTMzKSMGfDX1JR/yq8k68VCMYFXe9nuCU8xyGAk9wGe0/rxa+0LfEqn1cfrth3VV+WIujiH6ZKTSirdg2WwVAojiOpxrS4DgDUiwRtPundfi+8IuPCGMqVaJprwiXQDVrwjp5NqMwN7+lREEJZGTb6+FADXSJfKFk7besyJwmLVj53jQk9pun+PicPt6wNx9WJKQz24H7vgsmFRvjRwqbghMscbsPAffc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(1076003)(82310400003)(36860700001)(47076005)(426003)(5660300002)(36756003)(8676002)(54906003)(356005)(2906002)(86362001)(316002)(70206006)(70586007)(2616005)(4326008)(186003)(26005)(81166007)(7696005)(508600001)(83380400001)(8936002)(110136005)(336012)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:11:29.8598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df87d33-744f-4d60-34b3-08d992cfac7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3226
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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
index 7ce43e393643..d8d49d04fe41 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -35,3 +35,9 @@ config SND_SOC_AMD_MACH_COMMON
 	depends on X86 && PCI && I2C
 	help
 	  This option enables common Machine driver module for ACP.
+
+config SND_SOC_AMD_LEGACY_MACH
+	tristate "AMD Legacy Machine Driver Support"
+	select SND_SOC_AMD_MACH_COMMON
+	help
+	  This option enables legacy sound card support for ACP audio.
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

