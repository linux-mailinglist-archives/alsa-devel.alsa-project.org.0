Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C6A429E81
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 09:22:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE41D169A;
	Tue, 12 Oct 2021 09:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE41D169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634023349;
	bh=nownNL8hSuCo/N6omOzta8QZBBZ/Zbc4Fo2wZGkUdyU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKpaoADxMygrIN1FDr5VgUrV5dPHMjVxIp/SVVluFGi+PDY7itkI4tuTvvKqz3iSJ
	 KN9pmnto8fVsxJSRbcAnvmqf/uOstyB8w7qcWBgteQno4qZuCt5VvBow09RuT+RGaX
	 dpBOxKTMl5f9pUSzsrSp8oCqKuups0n7iKPH7LV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05BB9F804E7;
	Tue, 12 Oct 2021 09:21:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44CF9F804E6; Tue, 12 Oct 2021 09:21:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 235F7F804E4
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 09:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 235F7F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Mpk1ozhW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpNDFTvhFP1R9cs/PNU7oMgPYqrFfXBAtnobCno587if9LEnSG2Cjq2w8d3CgOdNyaOoUZo15+2xY3g/YM4eo9xWHQsBvHlMaxk42t2dbuJ/vNHPMIY2oNqiW0icZVueZQR+NmOlrT3XQfmYXwDPNbq43MQeHW/34oBDTsv3dwMn8tjTYGJPz5eXcyxbAm2kw4vM95IcPz+AtVoV1y1Apkvl2o0xOsPn4AkgyPEXX8824lmT4XA0rvhBrmiAsefdhrReDUxtc+JuTV1NLlW1TcQ9T/7cyXbxQOQoTt8zMxW3QFeR3Iq7bNToRXabhSDRimDdmZ8eIbj6/BXBLsJ4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj73Jlb/ixLg6H9G+XRQm+0f2JjKKTSiZSHDoCnJIaY=;
 b=dJHT4CIBeGvSrsaSMZdhQaGrVkAOOxfImpc46LKdDckFOe+Cn5yYKmZaAj7biOwXyh6tBEW/ZnzzFXhWijshTGCZgUjvP4wYqG6fvpN2C24tZbZweKMctRO+toWASyllOGBglJ/ySMOltHNx1eJX9kKqGts9WKMZXERVtZr1U9+T8R/aHFAIyEyQRoc6GoBx/mSb/5LZlpmL+0jNGBKpFDJ7hjQTKMeb5TRIFORfOf9EpxEFEwoGEMFvMi9LU3mwmxQLYeY8T7u8Nu2ZmmDpm6wZHGqJlP1MS99eg1ycYsTrnxnltD/8uaAeEirQgLtpTW6GOmYkWU7n+8keVIYN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj73Jlb/ixLg6H9G+XRQm+0f2JjKKTSiZSHDoCnJIaY=;
 b=Mpk1ozhWQ+9JkGoM4BWG4PGffxmsk63YvWFwt0biFKimyU7mcW2kV0mLKZguxtGGbiDydVCsMkAf2RAewjvCjlvStGLC290WSPbmaVQzwTTi1u36VKJarf1zE9fI+AgZdpIJ3SFPNUhFrjBXwHeT2GwZ/mq9A/Nhd2PiKMK1WJk=
Received: from MWHPR20CA0016.namprd20.prod.outlook.com (2603:10b6:300:13d::26)
 by BN7PR12MB2628.namprd12.prod.outlook.com (2603:10b6:408:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 07:21:09 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:13d:cafe::d8) by MWHPR20CA0016.outlook.office365.com
 (2603:10b6:300:13d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 07:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 07:21:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 02:21:08 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 00:21:07 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 12 Oct 2021 02:20:57 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 1/8] ASoC: amd: Add common framework to support I2S on ACP
 SOC
Date: Tue, 12 Oct 2021 12:49:32 +0530
Message-ID: <20211012071939.97002-2-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
References: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e237c21-611e-4a2b-501d-08d98d50dca3
X-MS-TrafficTypeDiagnostic: BN7PR12MB2628:
X-Microsoft-Antispam-PRVS: <BN7PR12MB26289147588A2EBF1C7F2E5082B69@BN7PR12MB2628.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rIwnwUnA14rb02H7/DcD1PiI3Qt5I/dQpJdcnnw1fkEhk5Xd4+Y0e4V/pYlEBOpRdBzGm3ooCZmfjbkC6wpG5S3RToD3178HkDALJEjoy2FhxH7CdYQKz8D0M9XR/9rPApyHz6+6uwQ9RG4NRfl1gQe4d6KAIJ66EWTM6l8Q2ktT6mtvRIO7diWhZ9vNsvhFAZlxXBNXtOxYdoihC4DO8rXIUkizOiXoSxYpMb2tOIHh5rX/OmNv6Plvtcg97rr83+3HdaAzWYLtIr2TIwvJDlzGLM5rd0l2Iuildk+yFKnr2d8kdtXuzUfqsJ2oyewWUFsu0GH0J6R7KYIK2FIV4nWfrLF+Z9cWe6FH4g9qX6StwXQNiSJwE3tuZ8cjp7cKpSjkEdnCkmeKx4qIAmWCBPMBIa1jP6n/00w3cR8mJw15Sezs7bk1eWGaiARnw3fCznm+Zjme+EzfW7ecct/lizf/2UZSCgLBhIgO/EBiqH/pdOpx6ASBmvMlzeX4WS6IXfjchPqPODKDXnZ5ZN7ZTzuylImm+9VJNhtng+6T+Y7mK9E8/3oB43IPxnbLWzU3C7GWvHcjST/X/iAcjZ9oGfCITQldqdjP5IlbV6zTzTLutTnp5iQ+VxW7ihq1m37HG/6rmGVeQwwDB2fkjFUM00/Jp7s0KhpZk58hv6E1idEZLpHtVZblj7VkWwPH6bAMGL2C3wi6/PM7JzT15jWkQ1iVb4JYrbLJ8/Y4RY1HBtw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(82310400003)(8676002)(83380400001)(186003)(86362001)(110136005)(54906003)(8936002)(2906002)(316002)(70586007)(70206006)(30864003)(36860700001)(47076005)(2616005)(1076003)(4326008)(508600001)(5660300002)(26005)(7696005)(6666004)(36756003)(426003)(336012)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:21:08.6807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e237c21-611e-4a2b-501d-08d98d50dca3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2628
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>, Alexander.Deucher@amd.com
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

We are using legacy way of exposing dais and DMA configuration that
requires separate driver modules for various ACP SOC with almost
similar hw configuration. Moreover the legacy approach requires
separate I2S and DMA module platform devices registration and need
machine specific quirk to control various I2S endpoints. Add generic
dai driver and platform driver for I2S controller on ACP hw block.
This common framework can be used by various ACP platform devices
that shares common specs.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/Kconfig                |   2 +
 sound/soc/amd/Makefile               |   1 +
 sound/soc/amd/acp/Kconfig            |  19 ++
 sound/soc/amd/acp/Makefile           |  12 +
 sound/soc/amd/acp/acp-i2s.c          | 340 +++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-platform.c     | 292 +++++++++++++++++++++++
 sound/soc/amd/acp/amd.h              | 140 +++++++++++
 sound/soc/amd/acp/chip_offset_byte.h |  76 ++++++
 8 files changed, 882 insertions(+)
 create mode 100644 sound/soc/amd/acp/Kconfig
 create mode 100644 sound/soc/amd/acp/Makefile
 create mode 100644 sound/soc/amd/acp/acp-i2s.c
 create mode 100644 sound/soc/amd/acp/acp-platform.c
 create mode 100644 sound/soc/amd/acp/amd.h
 create mode 100644 sound/soc/amd/acp/chip_offset_byte.h

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 49ff5e73e9ba..78e99cd25c37 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -61,3 +61,5 @@ config SND_SOC_AMD_ACP5x
 
 	 By enabling this flag build will trigger for ACP PCI driver,
 	 ACP DMA driver, CPU DAI driver.
+
+source "sound/soc/amd/acp/Kconfig"
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 07150d26f315..9878907c89a6 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
+obj-$(CONFIG_SND_SOC_AMD_ACP_COMMON) += acp/
diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
new file mode 100644
index 000000000000..5d782d1fc654
--- /dev/null
+++ b/sound/soc/amd/acp/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+# This file is provided under a dual BSD/GPLv2 license. When using or
+# redistributing this file, you may do so under either license.
+#
+# Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+#
+
+config SND_SOC_AMD_ACP_COMMON
+	tristate "AMD Audio ACP Common support"
+	select SND_AMD_ACP_CONFIG
+	help
+	  This option enables common modules for Audio-Coprocessor i.e. ACP
+	  IP block on AMD platforms.
+
+config SND_SOC_AMD_ACP_I2S
+	tristate
+
+config SND_SOC_AMD_ACP_PCM
+	tristate
diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
new file mode 100644
index 000000000000..b2e12659d97b
--- /dev/null
+++ b/sound/soc/amd/acp/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+# This file is provided under a dual BSD/GPLv2 license. When using or
+# redistributing this file, you may do so under either license.
+#
+# Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+
+#common acp driver
+snd-acp-pcm-objs     := acp-platform.o
+snd-acp-i2s-objs     := acp-i2s.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
+obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
new file mode 100644
index 000000000000..ce9aca8dd6f5
--- /dev/null
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -0,0 +1,340 @@
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
+ * Generic Hardware interface for ACP Audio I2S controller
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <linux/dma-mapping.h>
+
+#include "amd.h"
+
+#define DRV_NAME "acp_i2s_playcap"
+
+static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->component->dev;
+	struct acp_dev_data *adata;
+	u32 val;
+	u32 xfer_resolution;
+	u32 reg_val;
+
+	adata = snd_soc_dai_get_drvdata(dai);
+
+	/* These values are as per Hardware Spec */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_U8:
+	case SNDRV_PCM_FORMAT_S8:
+		xfer_resolution = 0x0;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		xfer_resolution = 0x02;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		xfer_resolution = 0x04;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		xfer_resolution = 0x05;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (dai->driver->id) {
+		case I2S_BT_INSTANCE:
+			reg_val = ACP_BTTDM_ITER;
+			break;
+		case I2S_SP_INSTANCE:
+			reg_val = ACP_I2STDM_ITER;
+			break;
+		default:
+			dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+			return -EINVAL;
+		}
+	} else {
+		switch (dai->driver->id) {
+		case I2S_BT_INSTANCE:
+			reg_val = ACP_BTTDM_IRER;
+			break;
+		case I2S_SP_INSTANCE:
+			reg_val = ACP_I2STDM_IRER;
+			break;
+		default:
+			dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+			return -EINVAL;
+		}
+	}
+
+	val = readl(adata->acp_base + reg_val);
+	val &= ~ACP3x_ITER_IRER_SAMP_LEN_MASK;
+	val = val | (xfer_resolution  << 3);
+	writel(val, adata->acp_base + reg_val);
+
+	return 0;
+}
+
+static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
+{
+	struct acp_stream *stream = substream->runtime->private_data;
+	struct device *dev = dai->component->dev;
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	u32 val, period_bytes, reg_val, ier_val, water_val, buf_size, buf_reg;
+
+	period_bytes = frames_to_bytes(substream->runtime, substream->runtime->period_size);
+	buf_size = frames_to_bytes(substream->runtime, substream->runtime->buffer_size);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		stream->bytescount = acp_get_byte_count(adata, stream->dai_id, substream->stream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			switch (dai->driver->id) {
+			case I2S_BT_INSTANCE:
+				water_val = ACP_BT_TX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_BTTDM_ITER;
+				ier_val = ACP_BTTDM_IER;
+				buf_reg = ACP_BT_TX_RINGBUFSIZE;
+				break;
+			case I2S_SP_INSTANCE:
+				water_val = ACP_I2S_TX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_I2STDM_ITER;
+				ier_val = ACP_I2STDM_IER;
+				buf_reg = ACP_I2S_TX_RINGBUFSIZE;
+				break;
+			default:
+				dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+				return -EINVAL;
+			}
+		} else {
+			switch (dai->driver->id) {
+			case I2S_BT_INSTANCE:
+				water_val = ACP_BT_RX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_BTTDM_IRER;
+				ier_val = ACP_BTTDM_IER;
+				buf_reg = ACP_BT_RX_RINGBUFSIZE;
+				break;
+			case I2S_SP_INSTANCE:
+				water_val = ACP_I2S_RX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_I2STDM_IRER;
+				ier_val = ACP_I2STDM_IER;
+				buf_reg = ACP_I2S_RX_RINGBUFSIZE;
+				break;
+			default:
+				dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+				return -EINVAL;
+			}
+		}
+		writel(period_bytes, adata->acp_base + water_val);
+		writel(buf_size, adata->acp_base + buf_reg);
+		val = readl(adata->acp_base + reg_val);
+		val = val | BIT(0);
+		writel(val, adata->acp_base + reg_val);
+		writel(1, adata->acp_base + ier_val);
+		return 0;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			switch (dai->driver->id) {
+			case I2S_BT_INSTANCE:
+				reg_val = ACP_BTTDM_ITER;
+				break;
+			case I2S_SP_INSTANCE:
+				reg_val = ACP_I2STDM_ITER;
+				break;
+			default:
+				dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+				return -EINVAL;
+			}
+
+		} else {
+			switch (dai->driver->id) {
+			case I2S_BT_INSTANCE:
+				reg_val = ACP_BTTDM_IRER;
+				break;
+			case I2S_SP_INSTANCE:
+				reg_val = ACP_I2STDM_IRER;
+				break;
+			default:
+				dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+				return -EINVAL;
+			}
+		}
+		val = readl(adata->acp_base + reg_val);
+		val = val & ~BIT(0);
+		writel(val, adata->acp_base + reg_val);
+
+		if (!(readl(adata->acp_base + ACP_BTTDM_ITER) & BIT(0)) &&
+		    !(readl(adata->acp_base + ACP_BTTDM_IRER) & BIT(0)))
+			writel(0, adata->acp_base + ACP_BTTDM_IER);
+		if (!(readl(adata->acp_base + ACP_I2STDM_ITER) & BIT(0)) &&
+		    !(readl(adata->acp_base + ACP_I2STDM_IRER) & BIT(0)))
+			writel(0, adata->acp_base + ACP_I2STDM_IER);
+		return 0;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->component->dev;
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_stream *stream = substream->runtime->private_data;
+	u32 reg_dma_size = 0, reg_fifo_size = 0, reg_fifo_addr = 0;
+	u32 phy_addr = 0, acp_fifo_addr = 0, ext_int_ctrl;
+	unsigned int dir = substream->stream;
+
+	switch (dai->driver->id) {
+	case I2S_SP_INSTANCE:
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						SP_PB_FIFO_ADDR_OFFSET;
+			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR;
+			reg_fifo_size = ACP_I2S_TX_FIFOSIZE;
+
+			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
+			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR);
+		} else {
+			reg_dma_size = ACP_I2S_RX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						SP_CAPT_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = ACP_I2S_RX_FIFOADDR;
+			reg_fifo_size = ACP_I2S_RX_FIFOSIZE;
+			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
+			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR);
+		}
+		break;
+	case I2S_BT_INSTANCE:
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+			reg_dma_size = ACP_BT_TX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						BT_PB_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = ACP_BT_TX_FIFOADDR;
+			reg_fifo_size = ACP_BT_TX_FIFOSIZE;
+
+			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR);
+		} else {
+			reg_dma_size = ACP_BT_RX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						BT_CAPT_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = ACP_BT_RX_FIFOADDR;
+			reg_fifo_size = ACP_BT_RX_FIFOSIZE;
+
+			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR);
+		}
+		break;
+	default:
+		dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+		return -EINVAL;
+	}
+
+	writel(DMA_SIZE, adata->acp_base + reg_dma_size);
+	writel(acp_fifo_addr, adata->acp_base + reg_fifo_addr);
+	writel(FIFO_SIZE, adata->acp_base + reg_fifo_size);
+
+	ext_int_ctrl = readl(adata->acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl |= BIT(I2S_RX_THRESHOLD) | BIT(BT_RX_THRESHOLD)
+			| BIT(I2S_TX_THRESHOLD) | BIT(BT_TX_THRESHOLD);
+
+	writel(ext_int_ctrl, adata->acp_base + ACP_EXTERNAL_INTR_CNTL);
+
+	return 0;
+}
+
+static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct acp_stream *stream = substream->runtime->private_data;
+	struct device *dev = dai->component->dev;
+	unsigned int dir = substream->stream;
+	unsigned int irq_bit = 0;
+
+	switch (dai->driver->id) {
+	case I2S_SP_INSTANCE:
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+			irq_bit = BIT(I2S_TX_THRESHOLD);
+			stream->pte_offset = ACP_SRAM_SP_PB_PTE_OFFSET;
+			stream->fifo_offset = SP_PB_FIFO_ADDR_OFFSET;
+		} else {
+			irq_bit = BIT(I2S_RX_THRESHOLD);
+			stream->pte_offset = ACP_SRAM_SP_CP_PTE_OFFSET;
+			stream->fifo_offset = SP_CAPT_FIFO_ADDR_OFFSET;
+		}
+		break;
+	case I2S_BT_INSTANCE:
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+			irq_bit = BIT(BT_TX_THRESHOLD);
+			stream->pte_offset = ACP_SRAM_BT_PB_PTE_OFFSET;
+			stream->fifo_offset = BT_PB_FIFO_ADDR_OFFSET;
+		} else {
+			irq_bit = BIT(BT_RX_THRESHOLD);
+			stream->pte_offset = ACP_SRAM_BT_CP_PTE_OFFSET;
+			stream->fifo_offset = BT_CAPT_FIFO_ADDR_OFFSET;
+		}
+		break;
+	default:
+		dev_err(dev, "Invalid dai id %x\n", dai->driver->id);
+		return -EINVAL;
+	}
+
+	/* Save runtime dai configuration in stream */
+	stream->id = dai->driver->id + dir;
+	stream->dai_id = dai->driver->id;
+	stream->irq_bit = irq_bit;
+
+	return 0;
+}
+
+const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
+	.startup = acp_i2s_startup,
+	.hw_params = acp_i2s_hwparams,
+	.prepare = acp_i2s_prepare,
+	.trigger = acp_i2s_trigger,
+};
+EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, SND_SOC_ACP_COMMON);
+
+int asoc_acp_i2s_probe(struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->component->dev;
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	unsigned int val;
+
+	if (!adata->acp_base) {
+		dev_err(dev, "I2S base is NULL\n");
+		return -EINVAL;
+	}
+
+	val = readl(adata->acp_base + ACP_I2S_PIN_CONFIG);
+	if (val != I2S_MODE) {
+		dev_err(dev, "I2S Mode not supported val %x\n", val);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(asoc_acp_i2s_probe, SND_SOC_ACP_COMMON);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS(DRV_NAME);
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
new file mode 100644
index 000000000000..e79c05276d5f
--- /dev/null
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/*
+ * Generic interface for ACP audio blck PCM component
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
+
+#include "amd.h"
+
+#define DRV_NAME "acp_i2s_dma"
+
+static const struct snd_pcm_hardware acp_pcm_hardware_playback = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 8,
+	.rates = SNDRV_PCM_RATE_8000_96000,
+	.rate_min = 8000,
+	.rate_max = 96000,
+	.buffer_bytes_max = PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE,
+	.period_bytes_min = PLAYBACK_MIN_PERIOD_SIZE,
+	.period_bytes_max = PLAYBACK_MAX_PERIOD_SIZE,
+	.periods_min = PLAYBACK_MIN_NUM_PERIODS,
+	.periods_max = PLAYBACK_MAX_NUM_PERIODS,
+};
+
+static const struct snd_pcm_hardware acp_pcm_hardware_capture = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_8000_48000,
+	.rate_min = 8000,
+	.rate_max = 48000,
+	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min = CAPTURE_MIN_NUM_PERIODS,
+	.periods_max = CAPTURE_MAX_NUM_PERIODS,
+};
+
+static irqreturn_t i2s_irq_handler(int irq, void *data)
+{
+	struct acp_dev_data *adata = data;
+	struct acp_stream *stream;
+	u16 i2s_flag = 0;
+	u32 val, i;
+
+	if (!adata)
+		return IRQ_NONE;
+
+	val = readl(adata->acp_base + ACP_EXTERNAL_INTR_STAT);
+
+	for (i = 0; i < ACP_MAX_STREAM; i++) {
+		stream = adata->stream[i];
+		if (stream && (val & stream->irq_bit)) {
+			writel(stream->irq_bit, adata->acp_base + ACP_EXTERNAL_INTR_STAT);
+			snd_pcm_period_elapsed(stream->substream);
+			i2s_flag = 1;
+			break;
+		}
+	}
+
+	if (i2s_flag)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
+}
+
+static void config_pte_for_stream(struct acp_dev_data *adata, struct acp_stream *stream)
+{
+	u32 pte_reg, pte_size, reg_val;
+
+	/* Use ATU base Group5 */
+	pte_reg = ACPAXI2AXI_ATU_BASE_ADDR_GRP_5;
+	pte_size =  ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5;
+	stream->reg_offset = 0x02000000;
+
+	/* Group Enable */
+	reg_val = ACP_SRAM_PTE_OFFSET;
+	writel(reg_val | BIT(31), adata->acp_base + pte_reg);
+	writel(PAGE_SIZE_4K_ENABLE,  adata->acp_base + pte_size);
+}
+
+static void config_acp_dma(struct acp_dev_data *adata, int cpu_id, int size)
+{
+	struct acp_stream *stream = adata->stream[cpu_id];
+	struct snd_pcm_substream *substream = stream->substream;
+	dma_addr_t addr = substream->dma_buffer.addr;
+	int num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	u32 low, high, val;
+	u16 page_idx;
+
+	val = stream->pte_offset;
+
+	for (page_idx = 0; page_idx < num_pages; page_idx++) {
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+		writel(low, adata->acp_base + ACP_SCRATCH_REG_0 + val);
+		high |= BIT(31);
+		writel(high, adata->acp_base + ACP_SCRATCH_REG_0 + val + 4);
+
+		/* Move to next physically contiguous page */
+		val += 8;
+		addr += PAGE_SIZE;
+	}
+}
+
+static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct device *dev = component->dev;
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_stream *stream;
+	int stream_id = cpu_dai->driver->id * 2 + substream->stream;
+	int ret;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->substream = substream;
+	adata->stream[stream_id] = stream;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		runtime->hw = acp_pcm_hardware_playback;
+	else
+		runtime->hw = acp_pcm_hardware_capture;
+
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(component->dev, "set integer constraint failed\n");
+		kfree(stream);
+		return ret;
+	}
+	runtime->private_data = stream;
+
+	writel(1, adata->acp_base + ACP_EXTERNAL_INTR_ENB);
+
+	return ret;
+}
+
+static int acp_dma_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct acp_dev_data *adata = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct acp_stream *stream = substream->runtime->private_data;
+	int stream_id = cpu_dai->driver->id * 2 + substream->stream;
+	u64 size = params_buffer_bytes(params);
+
+	/* Configure ACP DMA block with params */
+	config_pte_for_stream(adata, stream);
+	config_acp_dma(adata, stream_id, size);
+
+	return 0;
+}
+
+static snd_pcm_uframes_t acp_dma_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
+{
+	struct device *dev = component->dev;
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_stream *stream = substream->runtime->private_data;
+	u32 pos, buffersize;
+	u64 bytescount;
+
+	buffersize = frames_to_bytes(substream->runtime,
+				     substream->runtime->buffer_size);
+
+	bytescount = acp_get_byte_count(adata, stream->dai_id, substream->stream);
+
+	if (bytescount > stream->bytescount)
+		bytescount -= stream->bytescount;
+
+	pos = do_div(bytescount, buffersize);
+
+	return bytes_to_frames(substream->runtime, pos);
+}
+
+static int acp_dma_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
+{
+	struct device *parent = component->dev->parent;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, MIN_BUFFER, MAX_BUFFER);
+	return 0;
+}
+
+static int acp_dma_mmap(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream,
+			struct vm_area_struct *vma)
+{
+	return snd_pcm_lib_default_mmap(substream, vma);
+}
+
+static int acp_dma_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct device *dev = component->dev;
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_stream *stream;
+	int stream_id = cpu_dai->driver->id * 2 + substream->stream;
+
+	stream = adata->stream[stream_id];
+	kfree(stream);
+	adata->stream[stream_id] = NULL;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver acp_pcm_component = {
+	.name		= DRV_NAME,
+	.open		= acp_dma_open,
+	.close		= acp_dma_close,
+	.hw_params	= acp_dma_hw_params,
+	.pointer	= acp_dma_pointer,
+	.mmap		= acp_dma_mmap,
+	.pcm_construct	= acp_dma_new,
+};
+
+int acp_platform_register(struct device *dev)
+{
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct snd_soc_dai_driver;
+	unsigned int status;
+
+	status = devm_request_irq(dev, adata->i2s_irq, i2s_irq_handler,
+				  IRQF_SHARED, "ACP_I2S_IRQ", adata);
+	if (status) {
+		dev_err(dev, "ACP I2S IRQ request failed\n");
+		return status;
+	}
+
+	status = devm_snd_soc_register_component(dev, &acp_pcm_component,
+						 adata->dai_driver,
+						 adata->num_dai);
+	if (status) {
+		dev_err(dev, "Fail to register acp i2s component\n");
+		return status;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(acp_platform_register, SND_SOC_ACP_COMMON);
+
+int acp_platform_unregister(struct device *dev)
+{
+	struct acp_dev_data *adata = dev_get_drvdata(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(acp_platform_unregister, SND_SOC_ACP_COMMON);
+
+MODULE_DESCRIPTION("AMD ACP PCM Driver");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_ALIAS(DRV_NAME);
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
new file mode 100644
index 000000000000..ecb53285526c
--- /dev/null
+++ b/sound/soc/amd/acp/amd.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license. When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Author: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+ */
+
+#ifndef __AMD_ACP_H
+#define __AMD_ACP_H
+
+#include <sound/pcm.h>
+#include <sound/soc-acpi.h>
+#include "chip_offset_byte.h"
+
+#define I2S_SP_INSTANCE			0x00
+#define I2S_BT_INSTANCE			0x01
+
+#define MEM_WINDOW_START		0x4000000
+
+#define ACP_I2S_REG_START		0x1242400
+#define ACP_I2S_REG_END			0x1242810
+#define ACP3x_I2STDM_REG_START		0x1242400
+#define ACP3x_I2STDM_REG_END		0x1242410
+#define ACP3x_BT_TDM_REG_START		0x1242800
+#define ACP3x_BT_TDM_REG_END		0x1242810
+#define I2S_MODE			0x04
+#define I2S_RX_THRESHOLD		27
+#define I2S_TX_THRESHOLD		28
+#define BT_TX_THRESHOLD			26
+#define BT_RX_THRESHOLD			25
+
+#define ACP_SRAM_PTE_OFFSET		0x02052800
+
+#define ACP_SRAM_SP_PB_PTE_OFFSET	0x0
+#define ACP_SRAM_SP_CP_PTE_OFFSET	0x100
+#define ACP_SRAM_BT_PB_PTE_OFFSET	0x200
+#define ACP_SRAM_BT_CP_PTE_OFFSET	0x300
+#define PAGE_SIZE_4K_ENABLE		0x2
+
+#define I2S_SP_TX_MEM_WINDOW_START	0x4000000
+#define I2S_SP_RX_MEM_WINDOW_START	0x4020000
+#define I2S_BT_TX_MEM_WINDOW_START	0x4040000
+#define I2S_BT_RX_MEM_WINDOW_START	0x4060000
+
+#define SP_PB_FIFO_ADDR_OFFSET		0x500
+#define SP_CAPT_FIFO_ADDR_OFFSET	0x700
+#define BT_PB_FIFO_ADDR_OFFSET		0x900
+#define BT_CAPT_FIFO_ADDR_OFFSET	0xB00
+#define PLAYBACK_MIN_NUM_PERIODS	2
+#define PLAYBACK_MAX_NUM_PERIODS	8
+#define PLAYBACK_MAX_PERIOD_SIZE	8192
+#define PLAYBACK_MIN_PERIOD_SIZE	1024
+#define CAPTURE_MIN_NUM_PERIODS		2
+#define CAPTURE_MAX_NUM_PERIODS		8
+#define CAPTURE_MAX_PERIOD_SIZE		8192
+#define CAPTURE_MIN_PERIOD_SIZE		1024
+
+#define MAX_BUFFER			65536
+#define MIN_BUFFER			MAX_BUFFER
+#define FIFO_SIZE			0x100
+#define DMA_SIZE			0x40
+#define FRM_LEN				0x100
+
+#define ACP3x_ITER_IRER_SAMP_LEN_MASK	0x38
+
+#define ACP_MAX_STREAM			6
+
+struct acp_stream {
+	struct snd_pcm_substream *substream;
+	int irq_bit;
+	int dai_id;
+	int id;
+	u64 bytescount;
+	u32 reg_offset;
+	u32 pte_offset;
+	u32 fifo_offset;
+};
+
+struct acp_dev_data {
+	char *name;
+	struct device *dev;
+	void __iomem *acp_base;
+	unsigned int i2s_irq;
+
+	/* SOC specific dais */
+	struct snd_soc_dai_driver *dai_driver;
+	int num_dai;
+
+	struct acp_stream *stream[ACP_MAX_STREAM];
+};
+
+extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
+
+int asoc_acp_i2s_probe(struct snd_soc_dai *dai);
+int acp_platform_register(struct device *dev);
+int acp_platform_unregister(struct device *dev);
+
+static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int direction)
+{
+	u64 byte_count, low = 0, high = 0;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (dai_id) {
+		case I2S_BT_INSTANCE:
+			high = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
+			low = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_LOW);
+			break;
+		case I2S_SP_INSTANCE:
+			high = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH);
+			low = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_LOW);
+			break;
+		default:
+			dev_err(adata->dev, "Invalid dai id %x\n", dai_id);
+			return -EINVAL;
+		}
+	} else {
+		switch (dai_id) {
+		case I2S_BT_INSTANCE:
+			high = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
+			low = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_LOW);
+			break;
+		case I2S_SP_INSTANCE:
+			high = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH);
+			low = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_LOW);
+			break;
+		default:
+			dev_err(adata->dev, "Invalid dai id %x\n", dai_id);
+			return -EINVAL;
+		}
+	}
+	/* Get 64 bit value from two 32 bit registers */
+	byte_count = (high << 32) | low;
+
+	return byte_count;
+}
+
+#endif
diff --git a/sound/soc/amd/acp/chip_offset_byte.h b/sound/soc/amd/acp/chip_offset_byte.h
new file mode 100644
index 000000000000..c7f77e975dc7
--- /dev/null
+++ b/sound/soc/amd/acp/chip_offset_byte.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license. When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Author: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+ */
+
+#ifndef _ACP_IP_OFFSET_HEADER
+#define _ACP_IP_OFFSET_HEADER
+
+#define ACPAXI2AXI_ATU_CTRL                           0xC40
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5                0xC20
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5                0xC24
+#define ACP_EXTERNAL_INTR_ENB                         0x1800
+#define ACP_EXTERNAL_INTR_CNTL                        0x1804
+#define ACP_EXTERNAL_INTR_STAT                        0x1808
+#define ACP_I2S_PIN_CONFIG                            0x1400
+#define ACP_SCRATCH_REG_0                             0x12800
+
+/* Registers from ACP_AUDIO_BUFFERS block */
+
+#define ACP_I2S_RX_RINGBUFADDR                        0x2000
+#define ACP_I2S_RX_RINGBUFSIZE                        0x2004
+#define ACP_I2S_RX_LINKPOSITIONCNTR                   0x2008
+#define ACP_I2S_RX_FIFOADDR                           0x200C
+#define ACP_I2S_RX_FIFOSIZE                           0x2010
+#define ACP_I2S_RX_DMA_SIZE                           0x2014
+#define ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH            0x2018
+#define ACP_I2S_RX_LINEARPOSITIONCNTR_LOW             0x201C
+#define ACP_I2S_RX_INTR_WATERMARK_SIZE                0x2020
+#define ACP_I2S_TX_RINGBUFADDR                        0x2024
+#define ACP_I2S_TX_RINGBUFSIZE                        0x2028
+#define ACP_I2S_TX_LINKPOSITIONCNTR                   0x202C
+#define ACP_I2S_TX_FIFOADDR                           0x2030
+#define ACP_I2S_TX_FIFOSIZE                           0x2034
+#define ACP_I2S_TX_DMA_SIZE                           0x2038
+#define ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH            0x203C
+#define ACP_I2S_TX_LINEARPOSITIONCNTR_LOW             0x2040
+#define ACP_I2S_TX_INTR_WATERMARK_SIZE                0x2044
+#define ACP_BT_RX_RINGBUFADDR                         0x2048
+#define ACP_BT_RX_RINGBUFSIZE                         0x204C
+#define ACP_BT_RX_LINKPOSITIONCNTR                    0x2050
+#define ACP_BT_RX_FIFOADDR                            0x2054
+#define ACP_BT_RX_FIFOSIZE                            0x2058
+#define ACP_BT_RX_DMA_SIZE                            0x205C
+#define ACP_BT_RX_LINEARPOSITIONCNTR_HIGH             0x2060
+#define ACP_BT_RX_LINEARPOSITIONCNTR_LOW              0x2064
+#define ACP_BT_RX_INTR_WATERMARK_SIZE                 0x2068
+#define ACP_BT_TX_RINGBUFADDR                         0x206C
+#define ACP_BT_TX_RINGBUFSIZE                         0x2070
+#define ACP_BT_TX_LINKPOSITIONCNTR                    0x2074
+#define ACP_BT_TX_FIFOADDR                            0x2078
+#define ACP_BT_TX_FIFOSIZE                            0x207C
+#define ACP_BT_TX_DMA_SIZE                            0x2080
+#define ACP_BT_TX_LINEARPOSITIONCNTR_HIGH             0x2084
+#define ACP_BT_TX_LINEARPOSITIONCNTR_LOW              0x2088
+#define ACP_BT_TX_INTR_WATERMARK_SIZE                 0x208C
+
+#define ACP_I2STDM_IER                                0x2400
+#define ACP_I2STDM_IRER                               0x2404
+#define ACP_I2STDM_RXFRMT                             0x2408
+#define ACP_I2STDM_ITER                               0x240C
+#define ACP_I2STDM_TXFRMT                             0x2410
+
+/* Registers from ACP_BT_TDM block */
+
+#define ACP_BTTDM_IER                                 0x2800
+#define ACP_BTTDM_IRER                                0x2804
+#define ACP_BTTDM_RXFRMT                              0x2808
+#define ACP_BTTDM_ITER                                0x280C
+#define ACP_BTTDM_TXFRMT                              0x2810
+
+#endif
-- 
2.25.1

