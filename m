Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B977A1141BF
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 14:41:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F3C1670;
	Thu,  5 Dec 2019 14:41:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F3C1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575553312;
	bh=aeqvQlMNsxUexT8fjLlb3ccmV/i5ON4bW2Lr7Mw+kSs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GhJ3y0SCUBvKF7del5+rMVHS6DY4gEPrY2igg3gUZDTlQQMYdmTcI4aStESJlhU7T
	 krVks4YC0ZaEQl9FdNB77UxFaZYg0W9ePBBCQ90swXERGq5W8P39gGxPaRW0UP6hA0
	 AgDVkge80exYlQuH1oC/gYtAuX0t0anIJIV9tKZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19987F8023E;
	Thu,  5 Dec 2019 14:39:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0608F8023E; Thu,  5 Dec 2019 14:39:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5275F8010F
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 14:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5275F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="RlFBEMeF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVyIqIUx6u6esg9TreGgR+xCTFHyjFWYK5D9freKw/ggROs3IxF83SJ2oeowz83fo4Pa5VACytatVorPvxwpC4aYeTWEQHeHF/AdM/HHviOhIMEFpZT7gVGk5ZBFKsx/QCIOVOgdLr1q5NDLvWQWdFpQJDSe+jTSHHy1Xm+qJmQvHkVzk4wttuiBcU3jAxXAVN2nsVeSNwbDxN8FTAq/kPTr/XQFSai96ykz4fgrJghaIzBrJtQ9xTe7aoaA911rsDo7eWFAWE2Ov4Tu+6iCs3tMyp28AfpuQo4OaOCvkIdsSP6VepiY2IaAetXyVKjfanQKTlAmLnVx0PZF1Bkyfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2ztPtfKQDr+/yquFNETtjZMu1Cu4ImeaUKgVZGhZbw=;
 b=M/INHhODrMQS1wxw8pZ3gp0OseCWJRwh/If/U3MVggxvZDXBLpKmAiFBAvPrQlOobRK3IH83UQCrlazJjytM3xdznp5Esf6Om0amVDywRUOJIp8bJAC12TvKfX0Co7z4zRO8ryMbTIEcsutFOjBAhk1bmV0/G3bgixF8qFIZ4tjRbJK5wcQgld4s5utkm0G4ZViB1D+qCCHpLj56jRwphcEjxAR98EtWHac0ZsMs/dm9NwVGqnVSjlJYqM28l8Qe082chgyKL78AD07rGQoCo0tb0IOKDGSgRWXXISsnvU50bQlDMtcyl6/3uCFhZOvfrMcdrWQca1FFUyBxvJMQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2ztPtfKQDr+/yquFNETtjZMu1Cu4ImeaUKgVZGhZbw=;
 b=RlFBEMeFfAU8hDDByyeOXsZQ/1AD1908JGsZa6Na9uBrHrv6mL7BrXg1vcsFm64bgfYHSTwF9ZJE1wYQ0GxWv+yYtgnZZ+fhuB2S2nlCcy7vgGGrtU7SreH1CleO4soTyADHezIzqfljOHAoa8lyOUacnNbVtQUBUjvOpThzMew=
Received: from BN6PR12CA0048.namprd12.prod.outlook.com (2603:10b6:405:70::34)
 by DM6PR12MB2700.namprd12.prod.outlook.com (2603:10b6:5:4d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Thu, 5 Dec
 2019 13:39:22 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::202) by BN6PR12CA0048.outlook.office365.com
 (2603:10b6:405:70::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2516.13 via Frontend
 Transport; Thu, 5 Dec 2019 13:39:22 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 5 Dec 2019 13:39:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 07:39:21 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 07:39:20 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 5 Dec 2019 07:39:16 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 5 Dec 2019 19:07:27 +0530
Message-ID: <1575553053-18344-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(428003)(199004)(189003)(86362001)(336012)(70586007)(50466002)(4326008)(2906002)(76176011)(186003)(2616005)(356004)(478600001)(6666004)(109986005)(36756003)(5660300002)(16586007)(81166006)(81156014)(26005)(7416002)(14444005)(50226002)(30864003)(426003)(11346002)(48376002)(7696005)(54906003)(70206006)(305945005)(8936002)(51416003)(8676002)(316002)(53416004)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2700; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83273e2d-3f41-4f0b-2b16-08d779888949
X-MS-TrafficTypeDiagnostic: DM6PR12MB2700:|DM6PR12MB2700:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2700ECDB48EF5CE26C379A98E75C0@DM6PR12MB2700.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-Forefront-PRVS: 02426D11FE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtKPXibuJOtZuneSmuZ0Gx4rdbtkHzJAAFNXrJcjNzJxlfW5GLHGLzYp0kROVUsTHmfgKClwvpXoHCiKXtmKX9EtJfditjMJseG9xNcdz+N9OiODoev20kZ7XeQl9kctCT//ZrmwZVNwyv6x9PyyT/y33UdFCPp/Yi8kVf0hZ/P7m9WzMDChlShgHVcvMpp71sPCtn2tZw/9VHaEbRLsaCeERnHIAwR2oQWFZNqupSsouNhftV2FmUT5SBa07OBavGmi0+Nat023dqB3/cfgUskA/MBW1wKcxz7Mme2BQJraXEyEOP+RxrFmpeHLdswUc7j2fzkHNAEG/mXnX0EWHLLftO4ZCLIAnag4BRSdE2FmQ/f4KJPWEgdp4lqNe1y3gOh7VsEvBp9S5Yl8Nz0iwgDHwNsXdFrWsQZtjb4fVZonRvFC/WuHancxz0lwh0FyLqnADNMrxWjpIpJJ18mdAtPTxshiH7G7N3ZUCnAdok8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 13:39:22.0400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83273e2d-3f41-4f0b-2b16-08d779888949
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2700
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, "Gustavo
 A. R. Silva" <gustavo@embeddedor.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 pierre-louis.bossart@linux.intel.com, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v14 2/7] ASoC: amd: Refactoring of DAI from DMA
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

ASoC: PCM DMA driver should only have dma ops.
So Removed all DAI related functionality.Refactoring
the PCM DMA diver code.Added new file containing only DAI ops

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/Makefile        |   2 +
 sound/soc/amd/raven/acp3x-i2s.c     | 262 +++++++++++++++++++++++++++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c | 302 +++++++-----------------------------
 sound/soc/amd/raven/acp3x.h         |  43 +++++
 4 files changed, 364 insertions(+), 245 deletions(-)
 create mode 100644 sound/soc/amd/raven/acp3x-i2s.c

diff --git a/sound/soc/amd/raven/Makefile b/sound/soc/amd/raven/Makefile
index 108d1ac..62c22b6 100644
--- a/sound/soc/amd/raven/Makefile
+++ b/sound/soc/amd/raven/Makefile
@@ -2,5 +2,7 @@
 # Raven Ridge platform Support
 snd-pci-acp3x-objs	:= pci-acp3x.o
 snd-acp3x-pcm-dma-objs	:= acp3x-pcm-dma.o
+snd-acp3x-i2s-objs	:= acp3x-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-pci-acp3x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-pcm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-i2s.o
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
new file mode 100644
index 0000000..cdc1c61
--- /dev/null
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -0,0 +1,262 @@
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
+static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
+					unsigned int fmt)
+{
+	struct i2s_dev_data *adata;
+	int mode;
+
+	adata = snd_soc_dai_get_drvdata(cpu_dai);
+	mode = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+	switch (mode) {
+	case SND_SOC_DAIFMT_I2S:
+		adata->tdm_mode = false;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		adata->tdm_mode = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
+		u32 tx_mask, u32 rx_mask, int slots, int slot_width)
+{
+	struct i2s_dev_data *adata;
+	u32 val, reg_val, frmt_val, frm_len;
+	u16 slot_len;
+
+	adata = snd_soc_dai_get_drvdata(cpu_dai);
+
+	/* These values are as per Hardware Spec */
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
+	/* Enable I2S/BT channels TDM, respective TX/RX frame lengths.*/
+
+	frm_len = FRM_LEN | (slots << 15) | (slot_len << 18);
+	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+		reg_val = mmACP_BTTDM_ITER;
+		frmt_val = mmACP_BTTDM_TXFRMT;
+	} else {
+		reg_val = mmACP_BTTDM_IRER;
+		frmt_val = mmACP_BTTDM_RXFRMT;
+	}
+	val = rv_readl(adata->acp3x_base + reg_val);
+	rv_writel(val | 0x2, adata->acp3x_base + reg_val);
+	rv_writel(frm_len, adata->acp3x_base + frmt_val);
+	adata->tdm_fmt = frm_len;
+	return 0;
+}
+
+static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct i2s_stream_instance *rtd;
+	u32 val;
+	u32 reg_val;
+
+	rtd = substream->runtime->private_data;
+
+	/* These values are as per Hardware Spec */
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
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		reg_val = mmACP_BTTDM_ITER;
+	else
+		reg_val = mmACP_BTTDM_IRER;
+
+	val = rv_readl(rtd->acp3x_base + reg_val);
+	val = val | (rtd->xfer_resolution  << 3);
+	rv_writel(val, rtd->acp3x_base + reg_val);
+	return 0;
+}
+
+static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
+				int cmd, struct snd_soc_dai *dai)
+{
+	struct i2s_stream_instance *rtd;
+	u32 val, period_bytes;
+	int ret, reg_val;
+
+	rtd = substream->runtime->private_data;
+	period_bytes = frames_to_bytes(substream->runtime,
+			substream->runtime->period_size);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		rtd->bytescount = acp_get_byte_count(rtd,
+						substream->stream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			reg_val = mmACP_BTTDM_ITER;
+			rv_writel(period_bytes, rtd->acp3x_base +
+					mmACP_BT_TX_INTR_WATERMARK_SIZE);
+		} else {
+			reg_val = mmACP_BTTDM_IRER;
+			rv_writel(period_bytes, rtd->acp3x_base +
+					mmACP_BT_RX_INTR_WATERMARK_SIZE);
+		}
+		val = rv_readl(rtd->acp3x_base + reg_val);
+		val = val | BIT(0);
+		rv_writel(val, rtd->acp3x_base + reg_val);
+		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			reg_val = mmACP_BTTDM_ITER;
+		else
+			reg_val = mmACP_BTTDM_IRER;
+
+		val = rv_readl(rtd->acp3x_base + reg_val);
+		val = val & ~BIT(0);
+		rv_writel(val, rtd->acp3x_base + reg_val);
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
+	.trigger = acp3x_i2s_trigger,
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
+			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+			SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 8,
+		.rate_min = 8000,
+		.rate_max = 96000,
+	},
+	.capture = {
+		.rates = SNDRV_PCM_RATE_8000_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+			SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 8000,
+		.rate_max = 48000,
+	},
+	.ops = &acp3x_i2s_dai_ops,
+};
+
+static int acp3x_dai_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct i2s_dev_data *adata;
+	int ret;
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
+			GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENOMEM;
+	}
+	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
+						resource_size(res));
+	if (IS_ERR(adata->acp3x_base))
+		return PTR_ERR(adata->acp3x_base);
+
+	adata->i2s_irq = res->start;
+	dev_set_drvdata(&pdev->dev, adata);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+			&acp3x_dai_component, &acp3x_i2s_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int acp3x_dai_remove(struct platform_device *pdev)
+{
+	/* As we use devm_ memory alloc there is nothing TBD here */
+
+	return 0;
+}
+
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
index 60709e3..3150516 100644
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
@@ -178,10 +160,11 @@ static int acp3x_deinit(void __iomem *acp3x_base)
 
 static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 {
+	struct i2s_dev_data *rv_i2s_data;
 	u16 play_flag, cap_flag;
 	u32 val;
-	struct i2s_dev_data *rv_i2s_data = dev_id;
 
+	rv_i2s_data = dev_id;
 	if (!rv_i2s_data)
 		return IRQ_NONE;
 
@@ -278,11 +261,17 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 static int acp3x_dma_open(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
-	int ret = 0;
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
-	struct i2s_stream_instance *i2s_data = kzalloc(sizeof(struct i2s_stream_instance),
-						       GFP_KERNEL);
+	struct snd_pcm_runtime *runtime;
+	struct snd_soc_pcm_runtime *prtd;
+	struct i2s_dev_data *adata;
+	struct i2s_stream_instance *i2s_data;
+	int ret;
+
+	runtime = substream->runtime;
+	prtd = substream->private_data;
+	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
+	adata = dev_get_drvdata(component->dev);
+	i2s_data = kzalloc(sizeof(*i2s_data), GFP_KERNEL);
 	if (!i2s_data)
 		return -EINVAL;
 
@@ -312,33 +301,18 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 	return 0;
 }
 
-static u64 acp_get_byte_count(struct i2s_stream_instance *rtd, int direction)
-{
-	u64 byte_count;
-
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		byte_count = rv_readl(rtd->acp3x_base +
-				      mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				       mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
-	} else {
-		byte_count = rv_readl(rtd->acp3x_base +
-				      mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				       mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
-	}
-	return byte_count;
-}
 
 static int acp3x_dma_hw_params(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
+	struct snd_pcm_runtime *runtime;
+	struct i2s_stream_instance *rtd;
 	int status;
 	u64 size;
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct i2s_stream_instance *rtd = runtime->private_data;
 
+	runtime = substream->runtime;
+	rtd = substream->private_data;
 	if (!rtd)
 		return -EINVAL;
 
@@ -362,12 +336,12 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
 					   struct snd_pcm_substream *substream)
 {
-	u32 pos = 0;
-	u32 buffersize = 0;
-	u64 bytescount = 0;
-	struct i2s_stream_instance *rtd =
-		substream->runtime->private_data;
+	struct i2s_stream_instance *rtd;
+	u32 pos;
+	u32 buffersize;
+	u64 bytescount;
 
+	rtd = substream->runtime->private_data;
 	buffersize = frames_to_bytes(substream->runtime,
 				     substream->runtime->buffer_size);
 	bytescount = acp_get_byte_count(rtd, substream->stream);
@@ -380,7 +354,10 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
 static int acp3x_dma_new(struct snd_soc_component *component,
 			 struct snd_soc_pcm_runtime *rtd)
 {
-	struct device *parent = component->dev->parent;
+	struct device *parent;
+
+	component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
+	parent = component->dev->parent;
 	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
 					      parent, MIN_BUFFER, MAX_BUFFER);
 	return 0;
@@ -402,8 +379,12 @@ static int acp3x_dma_mmap(struct snd_soc_component *component,
 static int acp3x_dma_close(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-	struct i2s_stream_instance *rtd = substream->runtime->private_data;
-	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
+	struct snd_soc_pcm_runtime *prtd;
+	struct i2s_dev_data *adata;
+
+	prtd = substream->private_data;
+	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
+	adata = dev_get_drvdata(component->dev);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		adata->play_stream = NULL;
@@ -415,186 +396,9 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 	 */
 	if (!adata->play_stream && !adata->capture_stream)
 		rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
-	kfree(rtd);
 	return 0;
 }
 
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
 	.name		= DRV_NAME,
 	.open		= acp3x_dma_open,
@@ -609,10 +413,10 @@ static const struct snd_soc_component_driver acp3x_i2s_component = {
 
 static int acp3x_audio_probe(struct platform_device *pdev)
 {
-	int status;
 	struct resource *res;
 	struct i2s_dev_data *adata;
 	unsigned int irqflags;
+	int status, ret;
 
 	if (!pdev->dev.platform_data) {
 		dev_err(&pdev->dev, "platform_data not retrieved\n");
@@ -622,7 +426,7 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
 		return -ENODEV;
 	}
 
@@ -632,6 +436,8 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
 					 resource_size(res));
+	if (!adata->acp3x_base)
+		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
@@ -640,52 +446,54 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	}
 
 	adata->i2s_irq = res->start;
-	adata->play_stream = NULL;
-	adata->capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	/* Initialize ACP */
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
 		return -ENODEV;
+
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp3x_i2s_component,
-						 &acp3x_i2s_dai_driver, 1);
+						 NULL, 0);
 	if (status) {
-		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
+		ret = -ENODEV;
 		goto dev_err;
 	}
 	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
 				  irqflags, "ACP3x_I2S_IRQ", adata);
 	if (status) {
 		dev_err(&pdev->dev, "ACP3x I2S IRQ request failed\n");
+		ret = -ENODEV;
 		goto dev_err;
 	}
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	return 0;
+
 dev_err:
 	status = acp3x_deinit(adata->acp3x_base);
 	if (status)
 		dev_err(&pdev->dev, "ACP de-init failed\n");
 	else
-		dev_info(&pdev->dev, "ACP de-initialized\n");
-	/*ignore device status and return driver probe error*/
-	return -ENODEV;
+		dev_dbg(&pdev->dev, "ACP de-initialized\n");
+	return ret;
 }
 
 static int acp3x_audio_remove(struct platform_device *pdev)
 {
+	struct i2s_dev_data *adata;
 	int ret;
-	struct i2s_dev_data *adata = dev_get_drvdata(&pdev->dev);
 
+	adata = dev_get_drvdata(&pdev->dev);
 	ret = acp3x_deinit(adata->acp3x_base);
 	if (ret)
 		dev_err(&pdev->dev, "ACP de-init failed\n");
 	else
-		dev_info(&pdev->dev, "ACP de-initialized\n");
+		dev_dbg(&pdev->dev, "ACP de-initialized\n");
 
 	pm_runtime_disable(&pdev->dev);
 	return 0;
@@ -693,10 +501,11 @@ static int acp3x_audio_remove(struct platform_device *pdev)
 
 static int acp3x_resume(struct device *dev)
 {
+	struct i2s_dev_data *adata;
 	int status;
 	u32 val;
-	struct i2s_dev_data *adata = dev_get_drvdata(dev);
 
+	adata = dev_get_drvdata(dev);
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
 		return -ENODEV;
@@ -738,14 +547,15 @@ static int acp3x_resume(struct device *dev)
 
 static int acp3x_pcm_runtime_suspend(struct device *dev)
 {
+	struct i2s_dev_data *adata;
 	int status;
-	struct i2s_dev_data *adata = dev_get_drvdata(dev);
+	adata = dev_get_drvdata(dev);
 
 	status = acp3x_deinit(adata->acp3x_base);
 	if (status)
 		dev_err(dev, "ACP de-init failed\n");
 	else
-		dev_info(dev, "ACP de-initialized\n");
+		dev_dbg(dev, "ACP de-initialized\n");
 
 	rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 
@@ -754,8 +564,9 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 
 static int acp3x_pcm_runtime_resume(struct device *dev)
 {
+	struct i2s_dev_data *adata;
 	int status;
-	struct i2s_dev_data *adata = dev_get_drvdata(dev);
+	adata = dev_get_drvdata(dev);
 
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
@@ -774,13 +585,14 @@ static struct platform_driver acp3x_dma_driver = {
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
index 2f15fe1..a6c6d63 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -51,6 +51,30 @@
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
+	u32 substream_type;
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
@@ -61,3 +85,22 @@ static inline void rv_writel(u32 val, void __iomem *base_addr)
 {
 	writel(val, base_addr - ACP3x_PHY_BASE_ADDRESS);
 }
+
+static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
+							int direction)
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
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
