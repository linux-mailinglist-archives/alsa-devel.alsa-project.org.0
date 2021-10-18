Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7667431740
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 696E21939;
	Mon, 18 Oct 2021 13:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 696E21939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556442;
	bh=SYn+RGtc5qtMqOm81hbOxuF1DzlQbp2CpSrmqmfkmPY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzqSJrYAQTg8KFmccIE48v5mEak4lZdLSkBxBEGdrJC4RJWIwVaepL7WxzWivumUQ
	 JMzhV0WmJZszB7haat0KUBj1EqcsmQ6fCS7YNpyBh9nAoNQzqGTs4LNG/jP9CVx9Az
	 9QzzSe4RPo+BXo9sKhnrrn+2JDwkeMeTQ1lkjswE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC4A0F804E0;
	Mon, 18 Oct 2021 13:23:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3E0DF80543; Mon, 18 Oct 2021 13:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD412F804E0
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD412F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="nYXwQU5+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnjgXOH5iK+k8SEjO1MysWQdMXHLQzOStpqEb0Jbc1/EQAHTR5pll0b7uyrsFulLxmdlKMzyQw9xbrFDrWVPV0SdcIgJmLLuz21nqzz+h7zIX2d7AFlsSytlNJ6dhaUBs98PN9e6Bu1dJrwPQ6iUaf0WSxZOZo//svd2r7Q/ptucCIrocif5AOUIi7fyVFwdaIApHbvyUrdOZJGXPRTwFkZa4eM1lISEvHoQVJ5aGqvLcRenMRhNXE3j3KZNndkImj0SmPQg/BFkfjAQUqiUrc+VZn6dfBReX4oojL+hGkTVzAQQyK8Cy+U+oCXFdLRQIowKktHMh6d7NlrxYOSwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rFDP/8DCqKdY7EzJr3kT6tj+uUbNQ7OayWPaO28MwM=;
 b=YMW8pLB71SY1GPdV7COo7KldhY8srm24/9NLIXfV/ShcrxawcoVPt/YsuSfm3W8MLrMNilzXrkRAtSOvovfiiY5Zlui+1Rcwqks41m0wwZBGRon4Ai6pyPGftvSywU8OHcM8wky8+i7HPBpCFCQVkyXs2/0rlaMFuzGeUq3luCTtMdsiEBEBRK0AtqbxEXmwgqlZ/kgjJF+5BaObplEooJckVSG9M0MbPYuuABllpEqY9jxOrGiQ5K0j7041VSCH9Stou75QgV5NQMUPSk0Ayjul2vVKTO6nYIp9UEXmnZFr5GBo61Vbs14UMdJ7PtFjfCfK58bF3hX8TKt4ZmsWJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rFDP/8DCqKdY7EzJr3kT6tj+uUbNQ7OayWPaO28MwM=;
 b=nYXwQU5+xWaHj0p6gWoR07DOvvh7G5UHk9rg5WsdhfIix5+PXRY9AeLj+QyriiFnpujdsDAHQ9yUFs6hKKWl5MRify1Yd599J6dyyHS5fluTNswxbSzkOggnZwtL/ixSgFaW+xRzVvgqtXwwPq3PPS1YFQiKkXhHxJOj3JxDQ24=
Received: from DM5PR2001CA0004.namprd20.prod.outlook.com (2603:10b6:4:16::14)
 by BYAPR12MB4600.namprd12.prod.outlook.com (2603:10b6:a03:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 11:23:09 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::6e) by DM5PR2001CA0004.outlook.office365.com
 (2603:10b6:4:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 11:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:23:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:23:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:23:08 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:23:05 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 12/13] ASoC: amd: add YC machine driver using dmic
Date: Mon, 18 Oct 2021 16:50:43 +0530
Message-ID: <20211018112044.1705805-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ef60f3c-6988-4b77-a37d-08d99229aa17
X-MS-TrafficTypeDiagnostic: BYAPR12MB4600:
X-Microsoft-Antispam-PRVS: <BYAPR12MB4600BE552257B5B36D34AD2A97BC9@BYAPR12MB4600.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WPMhEtrSES5EyqjxD8GIOsN3Oqn6Kp93AALb78Z6evT4HJSmKQGGKD8w4Ls5Ny7CwiLvtIUYr02zeBiUfRboy+a00hzydW6bNiNZmEKwgwHpw5/ZMok/GGP1pZIsaTgbmbVUf8HurORRN3K/Bj1ugMQJbObvJGmE6A80W50kEXjco6nBfoPhJy5K7RsvrhjlLm8WAHK85R7j+o51mfyyjJxH1iBwiLCV+MjDI0ikDSTP08zS9dOvYfwNNZzDDspa+yt9eYmiZfr/x1wShXJRPWMO1l+8C1uRb8czvxZZnfH3+e1r6IE08Mx1hEsnB5XgrrhQFT1XQc+RPyw7eGBCA8+E5qRSoGY1uqTWZs0+Qa+HBrgpRNv4RfqrnOCBqNIeH4r16kqvKey01N2K+EHrabwYGkYZlaiAGKYA/6T8/GVpCublzrdenYC/IKNDb9qablN9m8NivSq7rA5ZqgpSurkTL4Qp+m0ieP+/Hz7xRVzj7shrJ3qgvkFjx8AibFbO3DGGrBE+8KzxWnRZ/D0jGA6MbppTUoNus66D0pfFkgjVsFrS3bHqbzeg40awqXyS1DcFElYbsLobaSp/n35xuCzw4rUURy/RV3B66zDudfhA//wGD0GyINwnuiFtPN9vG/YigqzQKUAHVfVEqltFbrGPNgrJT8fC04SqrCugAb225TzS/4zhVoytMDkU6ihybtRgUHz/e/tV6MGHQa4vtgIMsAiyNMSzsyTV+7D5UY0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(86362001)(356005)(26005)(82310400003)(316002)(47076005)(4326008)(426003)(2616005)(7696005)(186003)(70586007)(70206006)(336012)(6666004)(8676002)(36860700001)(508600001)(2906002)(8936002)(36756003)(54906003)(110136005)(5660300002)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:23:09.3836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef60f3c-6988-4b77-a37d-08d99229aa17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4600
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
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

Add Yellow Carp platform machine driver using dmic.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 194 ++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 sound/soc/amd/yc/acp6x-mach.c

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
new file mode 100644
index 000000000000..9a767f47b89f
--- /dev/null
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Machine driver for AMD Yellow Carp platform using DMIC
+ *
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ */
+
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/io.h>
+#include <linux/dmi.h>
+
+#include "acp6x.h"
+
+#define DRV_NAME "acp_yc_mach"
+
+SND_SOC_DAILINK_DEF(acp6x_pdm,
+		    DAILINK_COMP_ARRAY(COMP_CPU("acp_yc_pdm_dma.0")));
+
+SND_SOC_DAILINK_DEF(dmic_codec,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec.0",
+						  "dmic-hifi")));
+
+SND_SOC_DAILINK_DEF(pdm_platform,
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_yc_pdm_dma.0")));
+
+static struct snd_soc_dai_link acp6x_dai_pdm[] = {
+	{
+		.name = "acp6x-dmic-capture",
+		.stream_name = "DMIC capture",
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(acp6x_pdm, dmic_codec, pdm_platform),
+	},
+};
+
+static struct snd_soc_card acp6x_card = {
+	.name = "acp6x",
+	.owner = THIS_MODULE,
+	.dai_link = acp6x_dai_pdm,
+	.num_links = 1,
+};
+
+static const struct dmi_system_id yc_acp_quirk_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D2"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D3"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D4"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D5"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CF"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CG"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CQ"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CR"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21AW"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21AX"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21BN"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21BQ"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CH"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CJ"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CK"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21CL"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D8"),
+		}
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21D9"),
+		}
+	},
+	{}
+};
+
+static int acp6x_probe(struct platform_device *pdev)
+{
+	struct acp6x_pdm *machine = NULL;
+	struct snd_soc_card *card;
+	int ret;
+	const struct dmi_system_id *dmi_id;
+
+	dmi_id = dmi_first_match(yc_acp_quirk_table);
+	if (!dmi_id)
+		return -ENODEV;
+	card = &acp6x_card;
+	acp6x_card.dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		return dev_err_probe(&pdev->dev, ret,
+				"snd_soc_register_card(%s) failed\n",
+				card->name);
+	}
+	return 0;
+}
+
+static struct platform_driver acp6x_mach_driver = {
+	.driver = {
+		.name = "acp_yc_mach",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = acp6x_probe,
+};
+
+module_platform_driver(acp6x_mach_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.25.1

