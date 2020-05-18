Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4BB1D8012
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF4121778;
	Mon, 18 May 2020 19:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF4121778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822840;
	bh=vPHcBjWx5jCYCSZlKeoRREhR0Lh72r/mEPfCYNMUMTI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cflz7u/aK1oK0tWstY1iB5PJPs8m0xI4XjxMZDpIrl93AiRvGj23kiwTMVWAWMhF9
	 vVO1LlRNdEvypgVq5WRHMPk2XFY60AUe0y1zbvKoRW7HgpqqCPSdjzS7i3co5EYBGA
	 Bt7zWQmX0SLdO6DVG0tMSdfNbmNmlUj+yd45/8lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3D94F8034A;
	Mon, 18 May 2020 19:17:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D13CF80305; Mon, 18 May 2020 19:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700082.outbound.protection.outlook.com [40.107.70.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3A15F802F7
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A15F802F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="P8BV3vWy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoElOcIWypVGeEOjJS4fwZq2XqRNwm0vNtnsBKzmmjMCskZRiyOEp95W+aQLft+i15zJtka+SsqUYtRT+J6QWyJgGGiXg5kxXEDSSGg5vDoYgDn1/nySzi/ibBUMHR/6+yXRNc63zIeS/T6dCCHTGhfjaVi0uZPlSK/VwobNsAuvZtz8Owr8wlHc/NNva7GTuwcTDoFFvlumHhtKbhP0d3FlqR4NIu5REKKNqsMnRY+p6WInUDD/dK0ZJvK38cW/Q2We4RPh0HCYhW9+5mzcWF/rdhcTZzhHrkfJbOWFZlI6jtjZhPplX9RUxpHirqM8dbrsPWHgVQ92Un/9zdaCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTTcCFfbezOXrUqZP6U2nn2C0Ry/t/Y0qP0a+k5bXT8=;
 b=fXq4k6NZ7G6K+g9Lnw8Mo/vumph9HJlPBpvUwGjig+7T2UGnkxvKSDqiOgGF0rBArLfuLaEHs3kD0izUV642hppQllADk9esbe3fHzstHe+Yvxpfohk9cDz62vFc1ZmwLVjiR+5aZyksyHXRj3M5sQ5Sa4VZOzpkjkcWd/K+N2dyGptauNgwkn2PeH4DJFRRQyI1iZz3rHazUt61Ex6rzLJWkMT6ZT5PKGYBsEBAatDtwEMUTZDiL0Bv6MmUiZRw/c+im1k9Fyd3VtvnCcjbcsURiQWw6KyaI0XamUdUwY0uwU+4r71LqQTlADxGaK7PSb+WgxU222bLaCQamIXvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTTcCFfbezOXrUqZP6U2nn2C0Ry/t/Y0qP0a+k5bXT8=;
 b=P8BV3vWy1B16pWaLZKuD43451Tb+qq7Z7gL198YKQabiu/8N8aBk2NOTsbAIlcWEgUZYLdSbvXMpNvwZsIR8o9qrJkwFUvPwR+N68Xu9wnJ3MeyofcS3GjPNYRDFZO79hpftP8acZD5reAftXAkSHUUSVLwiYqv+dpq9vvvDHxA=
Received: from MWHPR15CA0048.namprd15.prod.outlook.com (2603:10b6:300:ad::34)
 by MWHPR12MB1823.namprd12.prod.outlook.com (2603:10b6:300:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 17:17:34 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ad:cafe::56) by MWHPR15CA0048.outlook.office365.com
 (2603:10b6:300:ad::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:34 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:31 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:31 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:29 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 13/14] ASoC: amd: RN machine driver using dmic
Date: Tue, 19 May 2020 01:17:03 +0800
Message-ID: <20200518171704.24999-14-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(478600001)(36756003)(110136005)(336012)(316002)(47076004)(6666004)(4326008)(2616005)(426003)(8936002)(70206006)(70586007)(2906002)(186003)(26005)(7696005)(356005)(81166007)(86362001)(54906003)(5660300002)(8676002)(82740400003)(82310400002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc7a7b2b-1384-4dbe-1537-08d7fb4f59d1
X-MS-TrafficTypeDiagnostic: MWHPR12MB1823:
X-Microsoft-Antispam-PRVS: <MWHPR12MB182395047BF7D48D52D6E98B97B80@MWHPR12MB1823.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xPL0/jChMEx1oCC0Vwk70XB0/IpMBKNNgWhTQ7Bi2NKCECCbXYeKG1qUy+JatlIGhQaxcymaNUvQrjFskuzQONRcmDBQQudM7nfwE/SJ8Z/dIyxVU7UynrFg78xPLu9RHPNKE+iMEYasI5Ixw+mlD1PAv7WzEsUDcJm/avUSNJTDgNSzRGDqyLslD5hj9Eip5UgQCPYHGN26qSy4Rc9RQE/DR7uGV+O6NGNFkdPtT3459eFsKgFHPPT5uRM0BUAmkV46eYRcaFqZHIzMmoIj/pApmtnzIJ8YOGxYqPmDqEutzGcViJMSTdzV2F7Q7YPhI0KK9lF17B2nb02NMHm6wp9MIQRVd3KnRwi01MfDmRCaHpt+8yEMjfHHa+DeBkbXqbvulhra/B7+QC5RxHget9Y47pORHuv9Qbv45wwF30tL4xQHnbcQnXl8g+e4nfWxkxVE+t4uvZiaJJll/35o7Ep6lV/iLbFIdDKVKC4N32zfTh+MDQmsOaelrj3eIwW87yzane22tsLZq7WmHQ+8Ng==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:32.2448 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7a7b2b-1384-4dbe-1537-08d7fb4f59d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1823
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

This patch adds Renoir Machine driver for dmic support.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
Removed redundant code.
 sound/soc/amd/renoir/acp3x-rn.c | 77 +++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 sound/soc/amd/renoir/acp3x-rn.c

diff --git a/sound/soc/amd/renoir/acp3x-rn.c b/sound/soc/amd/renoir/acp3x-rn.c
new file mode 100644
index 000000000000..306134b89a82
--- /dev/null
+++ b/sound/soc/amd/renoir/acp3x-rn.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Machine driver for AMD Renoir platform using DMIC
+//
+//Copyright 2020 Advanced Micro Devices, Inc.
+
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/io.h>
+
+#include "rn_acp3x.h"
+
+#define DRV_NAME "acp_pdm_mach"
+
+SND_SOC_DAILINK_DEF(acp_pdm,
+		    DAILINK_COMP_ARRAY(COMP_CPU("acp_rn_pdm_dma.0")));
+
+SND_SOC_DAILINK_DEF(dmic_codec,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec.0",
+						  "dmic-hifi")));
+
+SND_SOC_DAILINK_DEF(platform,
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_rn_pdm_dma.0")));
+
+static struct snd_soc_dai_link acp_dai_pdm[] = {
+	{
+		.name = "acp3x-dmic-capture",
+		.stream_name = "DMIC capture",
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(acp_pdm, dmic_codec, platform),
+	},
+};
+
+static struct snd_soc_card acp_card = {
+	.name = "acp",
+	.owner = THIS_MODULE,
+	.dai_link = acp_dai_pdm,
+	.num_links = 1,
+};
+
+static int acp_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct acp_pdm *machine = NULL;
+	struct snd_soc_card *card;
+
+	card = &acp_card;
+	acp_card.dev = &pdev->dev;
+
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"snd_soc_register_card(%s) failed: %d\n",
+			acp_card.name, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static struct platform_driver acp_mach_driver = {
+	.driver = {
+		.name = "acp_pdm_mach",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = acp_probe,
+};
+
+module_platform_driver(acp_mach_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.26.2

