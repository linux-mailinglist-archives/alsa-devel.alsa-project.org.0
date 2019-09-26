Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31B3BF2C0
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D1FB166C;
	Thu, 26 Sep 2019 14:16:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D1FB166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569500263;
	bh=6yeMJXX+ucK+SkNBohcnmLSCR0HrEH+GNXr9xL+Am6Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxEdkuYInYEppLNkOERtYV283h3LzxZiL5fIVy71hMV5nIFPjuPBxQUbYXiLsVFQA
	 EavL+L3FVhk9UOSlq5JvbxrLpI4tU4roKNQqkbYRYupF+IP2EF9jqp930su8269Qow
	 m2x9PsyYSRSWBH+jpJEO+L6xy8TZUgOVYaBp8vSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38240F805DF;
	Thu, 26 Sep 2019 14:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E82DAF80533; Thu, 26 Sep 2019 14:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E50F80138
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E50F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="eWXYryG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5R741vgxQGNnY3a0FJGfXHo7S9OSYMQCjQ38TgD/8sR88cJf2/ZWXSNawBP/tLuQEKK2FeY+MencpRWCoSA8K+O/jeoI77bReh6QU0415lLQoaSBaqbtiYJxyOB+tb1D3S0SCDI9VHGh6KVZ4ThWBQRC23yhWW2xJsXb/IUafS/kgJHV+t2wAykWMK/LcPeWgbLecCYIJsoJpkF/KE66Y2m4N2fhsLuvLTF4C+XCZIrt4W0ysB66i4SbN7Dxlj+KRHthG63YKuO2+YBu/34m7HPB9IC+K1qurULpGDKAsaKSdXuFBXeaRGkk93LrsHsaxb3KZ/N+NyKl1Fc8BEtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nxzfhbTCmJXoE+OT7MmP1QqS9q1f4inXBKZSIqifAI=;
 b=eJDoNa8ez/TChv93Y6EGOR90ZuKxpIYG+qekfKp06KxDjq4Tf391r+ytcdCJPZN3dxqMFJ38HAOFW9+GR3N6SCh7rrGhVBMFxicBUBKGiG4Ou1Odqe3FeHitKEoEQ7gXxVpf/UDRdDg312NDAXIrBXBt/OlRZbR3H8AuZc4B794KjRFW7SkWD4tV47/sranOqzhWSKAre6NdbcYRG4p3WTNIv1te8ZByFMr2PRrk/qCyxIZhMtbGweCNPM1sClSGwvk1eboarDvI6QYyCg9mrGcRJKP5oIBJH0k1K4UT340IS6hRHo696QFNtsosV+I7E/jRtjmj6s8jg5nrXHRwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=embeddedor.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nxzfhbTCmJXoE+OT7MmP1QqS9q1f4inXBKZSIqifAI=;
 b=eWXYryG+YmlHFVuRcfGOkIFrIju9HYrdCW1pH0hKWzcfNwxOZuGL3k251HMqci9cSlH0Sv8MlZgWJLurh3i/zQuH7EX52mOR+XzAtgCynbxWu1ux9qvvYPm/fbTrbFVPDjhkt6oFUXYDxXC2apUnr6zp7OSQVPQic9okngVoek4=
Received: from DM3PR12CA0079.namprd12.prod.outlook.com (2603:10b6:0:57::23) by
 CH2PR12MB3862.namprd12.prod.outlook.com (2603:10b6:610:21::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 12:15:27 +0000
Received: from CO1NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0079.outlook.office365.com
 (2603:10b6:0:57::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 26 Sep 2019 12:15:27 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT031.mail.protection.outlook.com (10.152.80.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 12:15:26 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 26 Sep 2019 07:15:25 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Sep 2019 04:37:36 +0530
Message-ID: <1569539290-756-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(428003)(189003)(199004)(486006)(50226002)(50466002)(186003)(70206006)(26005)(7696005)(126002)(30864003)(70586007)(109986005)(86362001)(2906002)(6666004)(48376002)(51416003)(336012)(76176011)(478600001)(53416004)(356004)(47776003)(8676002)(4326008)(1671002)(305945005)(476003)(81166006)(81156014)(8936002)(14444005)(2616005)(446003)(36756003)(5660300002)(54906003)(316002)(16586007)(11346002)(426003)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3862; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a46971c4-3d4c-4c8d-d1fd-08d7427b36f7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CH2PR12MB3862; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3862:|CH2PR12MB3862:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3862218923C678CF670798E1E7860@CH2PR12MB3862.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:46;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ZcIMQ3NEVgYK6rpNe3Czj5s/6/xC9t+J3AgKXrLkBj8JIy7w3VANY3sx6CWx2QlPiliKgiXwLZX2RHB0j3Nq54pEIN42C4oY3WxHbjkjFj6XxRYlxKjpVE4STn2ZKhmLe6RIQnIHkEKufA3VVAUrr2Gdzs7utlQm/dMPu4/RP3bxRZF00eXL6jTqL+9XiwrwX2xvBxnJYTQJzMw21vyBEBqAGVl9zBBdh8WDZrMiPW380zNvacy785fJqux7qgYpQZYK/WInTfRQLvT8Cju/eUCzJzRYEoKFmyMoKIq+TJNZyGRlQhu13OS+u6HY1oNtEhDYjZ/jNT71bq6trpf+Nx/pVZ7DMsUoXyHSM2jjpaQztzJg76Ybzycia1AX8JW0ZiAQlXHgtjcCoutxvcccAVqvDGcSe4Nczdd33bwHuyU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 12:15:26.4153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a46971c4-3d4c-4c8d-d1fd-08d7427b36f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3862
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>, "Gustavo A.
 R. Silva" <gustavo@embeddedor.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 2/5] ASoC: amd: Refactoring of DAI from DMA
	driver
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

DMA driver should have only dma ops.Removed all DAI related.
Refactoring the code added new file contianing only DAI ops.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Reviewed-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
 sound/soc/amd/raven/Makefile        |   2 +
 sound/soc/amd/raven/acp3x-i2s.c     | 289 ++++++++++++++++++++++++++++++++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c | 213 ++------------------------
 sound/soc/amd/raven/acp3x.h         |  23 +++
 4 files changed, 323 insertions(+), 204 deletions(-)
 create mode 100644 sound/soc/amd/raven/acp3x-i2s.c

diff --git a/sound/soc/amd/raven/Makefile b/sound/soc/amd/raven/Makefile
index 108d1ac..f079703 100644
--- a/sound/soc/amd/raven/Makefile
+++ b/sound/soc/amd/raven/Makefile
@@ -2,5 +2,7 @@
 # Raven Ridge platform Support
 snd-pci-acp3x-objs	:= pci-acp3x.o
 snd-acp3x-pcm-dma-objs	:= acp3x-pcm-dma.o
+snd-acp3x-i2s-objs := acp3x-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-pci-acp3x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-pcm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_ACP3x)	+= snd-acp3x-i2s.o
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
new file mode 100644
index 0000000..7420928
--- /dev/null
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD ALSA SoC PCM Driver
+//
+//Copyright 2016 Advanced Micro Devices, Inc.
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <linux/dma-mapping.h>
+
+#include "acp3x.h"
+
+#define DRV_NAME "acp3x-i2s"
+
+static u64 acp_get_byte_count(struct i2s_stream_instance *rtd, int direction)
+{
+	u64 byte_count;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		byte_count = rv_readl(rtd->acp3x_base +
+				mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
+		byte_count |= rv_readl(rtd->acp3x_base +
+				mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
+	} else {
+		byte_count = rv_readl(rtd->acp3x_base +
+				mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
+		byte_count |= rv_readl(rtd->acp3x_base +
+				mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
+	}
+	return byte_count;
+}
+
+static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
+{
+
+	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+
+	case SND_SOC_DAIFMT_I2S:
+		adata->tdm_mode = false;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+			adata->tdm_mode = true;
+			break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
+		u32 rx_mask, int slots, int slot_width)
+{
+	u32 val = 0;
+	u16 slot_len;
+
+	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
+
+	switch (slot_width) {
+	case SLOT_WIDTH_8:
+		slot_len = 8;
+		break;
+	case SLOT_WIDTH_16:
+		slot_len = 16;
+		break;
+	case SLOT_WIDTH_24:
+		slot_len = 24;
+		break;
+	case SLOT_WIDTH_32:
+		slot_len = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
+	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
+	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
+	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
+
+	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
+	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
+	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
+
+	adata->tdm_fmt = val;
+	return 0;
+}
+
+static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params,
+		struct snd_soc_dai *dai)
+{
+	u32 val = 0;
+	struct i2s_stream_instance *rtd = substream->runtime->private_data;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_U8:
+	case SNDRV_PCM_FORMAT_S8:
+		rtd->xfer_resolution = 0x0;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		rtd->xfer_resolution = 0x02;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		rtd->xfer_resolution = 0x04;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		rtd->xfer_resolution = 0x05;
+		break;
+	default:
+		return -EINVAL;
+	}
+	val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
+	val = val | (rtd->xfer_resolution  << 3);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
+	else
+		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+
+	return 0;
+}
+
+static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	int ret = 0;
+	struct i2s_stream_instance *rtd = substream->runtime->private_data;
+	u32 val, period_bytes;
+
+	period_bytes = frames_to_bytes(substream->runtime,
+			substream->runtime->period_size);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		rtd->bytescount = acp_get_byte_count(rtd,
+						substream->stream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			rv_writel(period_bytes, rtd->acp3x_base +
+					mmACP_BT_TX_INTR_WATERMARK_SIZE);
+			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
+			val = val | BIT(0);
+			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
+		} else {
+			rv_writel(period_bytes, rtd->acp3x_base +
+					mmACP_BT_RX_INTR_WATERMARK_SIZE);
+			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
+			val = val | BIT(0);
+			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+		}
+		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
+			val = val & ~BIT(0);
+			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
+		} else {
+			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
+			val = val & ~BIT(0);
+			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+		}
+		rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
+	.hw_params = acp3x_i2s_hwparams,
+	.trigger   = acp3x_i2s_trigger,
+	.set_fmt = acp3x_i2s_set_fmt,
+	.set_tdm_slot = acp3x_i2s_set_tdm_slot,
+};
+
+static const struct snd_soc_component_driver acp3x_dai_component = {
+	.name           = "acp3x-i2s",
+};
+
+static struct snd_soc_dai_driver acp3x_i2s_dai = {
+	.playback = {
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			SNDRV_PCM_FMTBIT_U8 |
+			SNDRV_PCM_FMTBIT_S24_LE |
+			SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 8,
+
+		.rate_min = 8000,
+		.rate_max = 96000,
+	},
+	.capture = {
+		.rates = SNDRV_PCM_RATE_8000_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			SNDRV_PCM_FMTBIT_U8 |
+			SNDRV_PCM_FMTBIT_S24_LE |
+			SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 8000,
+		.rate_max = 48000,
+	},
+	.ops = &acp3x_i2s_dai_ops,
+};
+
+
+static int acp3x_dai_probe(struct platform_device *pdev)
+{
+	int status;
+	struct resource *res;
+	struct i2s_dev_data *adata;
+
+	if (!pdev->dev.platform_data) {
+		dev_err(&pdev->dev, "platform_data not retrieved\n");
+		return -ENODEV;
+	}
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
+			GFP_KERNEL);
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
+	}
+
+	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
+	if (IS_ERR(adata->acp3x_base))
+		return PTR_ERR(adata->acp3x_base);
+
+
+
+	adata->i2s_irq = res->start;
+	adata->play_stream = NULL;
+	adata->capture_stream = NULL;
+
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+			&acp3x_dai_component,
+			&acp3x_i2s_dai, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+		goto dev_err;
+	}
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	return 0;
+dev_err:
+	/*ignore device status and return driver probe error*/
+	return -ENODEV;
+}
+
+static int acp3x_dai_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+static struct platform_driver acp3x_dai_driver = {
+	.probe = acp3x_dai_probe,
+	.remove = acp3x_dai_remove,
+	.driver = {
+		.name = "acp3x_i2s_playcap",
+	},
+};
+
+module_platform_driver(acp3x_dai_driver);
+
+MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
+MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index bc4dfaf..67160b5 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -18,24 +18,6 @@
 
 #define DRV_NAME "acp3x-i2s-audio"
 
-struct i2s_dev_data {
-	bool tdm_mode;
-	unsigned int i2s_irq;
-	u32 tdm_fmt;
-	void __iomem *acp3x_base;
-	struct snd_pcm_substream *play_stream;
-	struct snd_pcm_substream *capture_stream;
-};
-
-struct i2s_stream_instance {
-	u16 num_pages;
-	u16 channels;
-	u32 xfer_resolution;
-	u64 bytescount;
-	dma_addr_t dma_addr;
-	void __iomem *acp3x_base;
-};
-
 static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -432,183 +414,6 @@ static struct snd_pcm_ops acp3x_dma_ops = {
 	.mmap = acp3x_dma_mmap,
 };
 
-
-static int acp3x_dai_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
-{
-
-	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
-
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		adata->tdm_mode = false;
-		break;
-	case SND_SOC_DAIFMT_DSP_A:
-		adata->tdm_mode = true;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int acp3x_dai_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
-				  u32 rx_mask, int slots, int slot_width)
-{
-	u32 val = 0;
-	u16 slot_len;
-
-	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
-
-	switch (slot_width) {
-	case SLOT_WIDTH_8:
-		slot_len = 8;
-		break;
-	case SLOT_WIDTH_16:
-		slot_len = 16;
-		break;
-	case SLOT_WIDTH_24:
-		slot_len = 24;
-		break;
-	case SLOT_WIDTH_32:
-		slot_len = 0;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
-	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
-	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
-
-	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
-
-	adata->tdm_fmt = val;
-	return 0;
-}
-
-static int acp3x_dai_i2s_hwparams(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *params,
-				  struct snd_soc_dai *dai)
-{
-	u32 val = 0;
-	struct i2s_stream_instance *rtd = substream->runtime->private_data;
-
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_U8:
-	case SNDRV_PCM_FORMAT_S8:
-		rtd->xfer_resolution = 0x0;
-		break;
-	case SNDRV_PCM_FORMAT_S16_LE:
-		rtd->xfer_resolution = 0x02;
-		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-		rtd->xfer_resolution = 0x04;
-		break;
-	case SNDRV_PCM_FORMAT_S32_LE:
-		rtd->xfer_resolution = 0x05;
-		break;
-	default:
-		return -EINVAL;
-	}
-	val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
-	val = val | (rtd->xfer_resolution  << 3);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
-	else
-		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
-
-	return 0;
-}
-
-static int acp3x_dai_i2s_trigger(struct snd_pcm_substream *substream,
-				 int cmd, struct snd_soc_dai *dai)
-{
-	int ret = 0;
-	struct i2s_stream_instance *rtd = substream->runtime->private_data;
-	u32 val, period_bytes;
-
-	period_bytes = frames_to_bytes(substream->runtime,
-				       substream->runtime->period_size);
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		rtd->bytescount = acp_get_byte_count(rtd, substream->stream);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			rv_writel(period_bytes, rtd->acp3x_base +
-				  mmACP_BT_TX_INTR_WATERMARK_SIZE);
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
-			val = val | BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
-		} else {
-			rv_writel(period_bytes, rtd->acp3x_base +
-				  mmACP_BT_RX_INTR_WATERMARK_SIZE);
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
-			val = val | BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
-		}
-		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
-			val = val & ~BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
-		} else {
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
-			val = val & ~BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
-		}
-		rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
-static struct snd_soc_dai_ops acp3x_dai_i2s_ops = {
-	.hw_params = acp3x_dai_i2s_hwparams,
-	.trigger   = acp3x_dai_i2s_trigger,
-	.set_fmt = acp3x_dai_i2s_set_fmt,
-	.set_tdm_slot = acp3x_dai_set_tdm_slot,
-};
-
-static struct snd_soc_dai_driver acp3x_i2s_dai_driver = {
-	.playback = {
-		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
-					SNDRV_PCM_FMTBIT_U8 |
-					SNDRV_PCM_FMTBIT_S24_LE |
-					SNDRV_PCM_FMTBIT_S32_LE,
-		.channels_min = 2,
-		.channels_max = 8,
-
-		.rate_min = 8000,
-		.rate_max = 96000,
-	},
-	.capture = {
-		.rates = SNDRV_PCM_RATE_8000_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
-					SNDRV_PCM_FMTBIT_U8 |
-					SNDRV_PCM_FMTBIT_S24_LE |
-					SNDRV_PCM_FMTBIT_S32_LE,
-		.channels_min = 2,
-		.channels_max = 2,
-		.rate_min = 8000,
-		.rate_max = 48000,
-	},
-	.ops = &acp3x_dai_i2s_ops,
-};
-
 static const struct snd_soc_component_driver acp3x_i2s_component = {
 	.name           = DRV_NAME,
 	.ops		= &acp3x_dma_ops,
@@ -627,17 +432,16 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	irqflags = *((unsigned int *)(pdev->dev.platform_data));
+	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
-			return -ENODEV;
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
 	}
 
-	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
-	if (!adata)
-		return -ENOMEM;
-
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
 					 resource_size(res));
 
@@ -658,9 +462,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp3x_i2s_component,
-						 &acp3x_i2s_dai_driver, 1);
+						 NULL, 0);
 	if (status) {
-		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
 		goto dev_err;
 	}
 	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
@@ -782,13 +586,14 @@ static struct platform_driver acp3x_dma_driver = {
 	.probe = acp3x_audio_probe,
 	.remove = acp3x_audio_remove,
 	.driver = {
-		.name = "acp3x_rv_i2s",
+		.name = "acp3x_rv_i2s_dma",
 		.pm = &acp3x_pm_ops,
 	},
 };
 
 module_platform_driver(acp3x_dma_driver);
 
+MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
 MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 3a27fc8..6bc38a4 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -54,6 +54,29 @@
 #define SLOT_WIDTH_24 0x18
 #define SLOT_WIDTH_32 0x20
 
+struct acp3x_platform_info {
+	u16 play_i2s_instance;
+	u16 cap_i2s_instance;
+	u16 capture_channel;
+};
+
+struct i2s_dev_data {
+	bool tdm_mode;
+	unsigned int i2s_irq;
+	u32 tdm_fmt;
+	void __iomem *acp3x_base;
+	struct snd_pcm_substream *play_stream;
+	struct snd_pcm_substream *capture_stream;
+};
+
+struct i2s_stream_instance {
+	u16 num_pages;
+	u16 channels;
+	u32 xfer_resolution;
+	u64 bytescount;
+	dma_addr_t dma_addr;
+	void __iomem *acp3x_base;
+};
 
 static inline u32 rv_readl(void __iomem *base_addr)
 {
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
