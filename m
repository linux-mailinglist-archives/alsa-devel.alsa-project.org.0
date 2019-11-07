Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF3F2F47
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 14:28:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4C6167D;
	Thu,  7 Nov 2019 14:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4C6167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573133339;
	bh=VFkQ3yOrzQzi8UID5A/LRgiGmxNZyvKw/wP3phocUvY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+tXd8uegd+KCk5Dw/R9XCpslo5wOZr3lz2LQYqs28JYyOuGKeiqYAGjVx7dCOHRf
	 Zy0PmPrLdNIHduY7jsUmtaZ0CdADnlPWocm6zyKjWA++DAso9hfBA0fsr1KEDr2wk7
	 ccRtdPyUl3OF6M+KPxhXGChpwgTdcY2H9X+C/cho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A57E4F80535;
	Thu,  7 Nov 2019 14:26:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80BFCF8053B; Thu,  7 Nov 2019 14:26:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 327EFF80508
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 14:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 327EFF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="NDlHUue2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4A6bXqRGKAnPbnvq5btXNMtXYAfrrUbSl2H4rbPwJjs0nLzelRszfImDFR2aH1OafkCGZ0zpW0dwNNVCsbWUDCXObgPdZCRc+EiCjV3ddZiAbpMJfN8gpTXb4XPYl8PbbDMASWrCfBefXus6286UEBXvmnDYxmJzuAEF1Oo5xrnch0i1p5lEhGkIvueYqCXDpEI87mV3RBWkUUNwji/D4hP8wNy0iHqzdN6S0vZQvoTEhQXsjNxunjsrbJ8+cOpF3/jywjuRX+OS696Zmtq20tT2vpk5Wku4e86ryzlLrXd+s8tXVXh9bcz4AKcSJ7tCIrPxhhV1YxNUzpsKpOP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBcXj0YHm8UFzIa+GW5n8FaVfzs3Za/GYacSJnhRSaA=;
 b=hu4r4VRwPIhCWyfkrxTKnbgBVE6+OXQg0HG9SPdWTiIz0F5UdJbZDYQD5srChg9ZOuyireKRIZcY9OzTFATqXGLiOdiDa7Z2JpOowB2aDIrJTvqVqO35cBVKbv5ifaU00SeRC7p8xVskgZwwYkke+VBj1opHaM1KR1v/EOhlH2XoIGHsJqgjV4SaSgfdX6UR2uMWs22wnU4dLqye1R+c/vhwCr3GbVxMvNzxZNwkulxaXdEglggPYRCAODN8/KQYk7nKbptyzZ38a5L+pqbhStTIewCLcjhcy5m+po1GWbSZNm6kuKiz/9u0gTre0g0/Gza9tw6U1mzix5aoETA2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBcXj0YHm8UFzIa+GW5n8FaVfzs3Za/GYacSJnhRSaA=;
 b=NDlHUue2wSbqE/6lva10B7JBo52TZfOYN67PeWgRg/OOV+SwXtJ8UoIEa7HUASzPu/Pculs9ihG8iqbHW7YquQYqAcV8X50Sj6NiouwVRb8r0T9NR8PmxdbUW2b4h/c5Cu/crvuTuBrdHuxgKHjq5yQ4ZzITnTM/YkhJ+v/FGbY=
Received: from BN6PR12CA0033.namprd12.prod.outlook.com (2603:10b6:405:70::19)
 by CY4PR12MB1445.namprd12.prod.outlook.com (2603:10b6:910:11::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Thu, 7 Nov
 2019 13:26:36 +0000
Received: from DM3NAM03FT030.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by BN6PR12CA0033.outlook.office365.com
 (2603:10b6:405:70::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 13:26:36 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT030.mail.protection.outlook.com (10.152.82.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2430.20 via Frontend Transport; Thu, 7 Nov 2019 13:26:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 07:26:35 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 7 Nov 2019
 07:26:35 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 7 Nov 2019 07:26:26 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 7 Nov 2019 18:54:49 +0530
Message-ID: <1573133093-28208-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(376002)(346002)(39860400002)(396003)(136003)(428003)(199004)(189003)(426003)(8936002)(11346002)(109986005)(356004)(486006)(2616005)(476003)(126002)(6666004)(1671002)(50466002)(8676002)(446003)(14444005)(36756003)(70586007)(81166006)(86362001)(47776003)(30864003)(48376002)(81156014)(50226002)(5660300002)(70206006)(186003)(2906002)(316002)(53416004)(4326008)(478600001)(336012)(76176011)(305945005)(54906003)(7696005)(26005)(51416003)(16586007)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1445; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a97f469e-9dab-4292-c975-08d763861d59
X-MS-TrafficTypeDiagnostic: CY4PR12MB1445:|CY4PR12MB1445:
X-Microsoft-Antispam-PRVS: <CY4PR12MB14453A7F969D832D52E6F277E7780@CY4PR12MB1445.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-Forefront-PRVS: 0214EB3F68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmmgYlSoNWcMZ/G+CrOP/HCBaSXHM92oeRTc+/qDiU26e4B0kaRiwLYO93yg7QVz1Lojasok7y1GVnVs9voCzfviSQDJ5WKs87+mxVLep/nksvjZBX0dayowLhqPg3tsFC7Mzi8qe7TXphlpp5GYrNu7fT7/Vx4nNCdKj1lHYl5Tx5b3/8eGLPh0RnOLv1mPVPx+oDL0Pk+/MQDd5jt4YxCRSAMiKf5i6E6Y/oO9H25Ue/nX8KJ8HMW4GhAdWuEaoRyGBuviiZUUkJoIfi+pMJ4MYjmjTgP/9ifSwzhyfStVqx5nBsW5m8RTg3KX/nwhdUjIVy4WSnzmTk8+nEOFX5Cg9Pc7iuHM22ICrCP6rrkPK//qnj1+O9/Dpw6+MoIjYhT8KPeY6lLj2ifG51KmjsqNwB3PTbc9NeduC+8x93xNpAn0fqfWsafcepEn9nMF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 13:26:36.4534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a97f469e-9dab-4292-c975-08d763861d59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1445
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Colin Ian
 King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH v3 2/6] ASoC: amd: Refactoring of DAI from DMA
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

Asoc: PCM DMA driver should only have dma ops.
So Removed all DAI related functionality.
Refactoring the PCM DMA diver code.
Added new file containing only DAI ops.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/Makefile        |   2 +
 sound/soc/amd/raven/acp3x-i2s.c     | 267 ++++++++++++++++++++++++++++++++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c | 232 ++-----------------------------
 sound/soc/amd/raven/acp3x.h         |  42 ++++++
 4 files changed, 325 insertions(+), 218 deletions(-)
 create mode 100644 sound/soc/amd/raven/acp3x-i2s.c

diff --git a/sound/soc/amd/raven/Makefile b/sound/soc/amd/raven/Makefile
index 108d1ac..8eef292 100644
--- a/sound/soc/amd/raven/Makefile
+++ b/sound/soc/amd/raven/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Raven Ridge platform Support
 snd-pci-acp3x-objs	:= pci-acp3x.o
+snd-acp3x-i2s-objs	:= acp3x-i2s.o
 snd-acp3x-pcm-dma-objs	:= acp3x-pcm-dma.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-pci-acp3x.o
+obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-pcm-dma.o
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
new file mode 100644
index 0000000..547f497
--- /dev/null
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -0,0 +1,267 @@
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
+		adata->tdm_mode = true;
+		break;
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
+	u32 val;
+	u16 slot_len;
+
+	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
+
+	/* These values are as per Hardware Spec */
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
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
+		val = val | (rtd->xfer_resolution  << 3);
+		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
+	} else {
+		val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
+		val = val | (rtd->xfer_resolution  << 3);
+		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+	}
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
+	adata->i2s_irq = res->start;
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+			&acp3x_dai_component,
+			&acp3x_i2s_dai, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+		return -ENODEV;
+	}
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	return 0;
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
index 60709e3..f5e4c7b 100644
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
@@ -279,7 +261,11 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
 	int ret = 0;
+
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+
+	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
 	struct i2s_stream_instance *i2s_data = kzalloc(sizeof(struct i2s_stream_instance),
 						       GFP_KERNEL);
@@ -312,23 +298,6 @@ static int acp3x_dma_open(struct snd_soc_component *component,
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
@@ -380,6 +349,7 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
 static int acp3x_dma_new(struct snd_soc_component *component,
 			 struct snd_soc_pcm_runtime *rtd)
 {
+	component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct device *parent = component->dev->parent;
 	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
 					      parent, MIN_BUFFER, MAX_BUFFER);
@@ -402,7 +372,9 @@ static int acp3x_dma_mmap(struct snd_soc_component *component,
 static int acp3x_dma_close(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
+	struct snd_soc_pcm_runtime *prtd = substream->private_data;
 	struct i2s_stream_instance *rtd = substream->runtime->private_data;
+	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -419,182 +391,6 @@ static int acp3x_dma_close(struct snd_soc_component *component,
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
@@ -619,6 +415,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 	irqflags = *((unsigned int *)(pdev->dev.platform_data));
+	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
@@ -626,10 +425,6 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
-	if (!adata)
-		return -ENOMEM;
-
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
 					 resource_size(res));
 
@@ -650,9 +445,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
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
@@ -774,13 +569,14 @@ static struct platform_driver acp3x_dma_driver = {
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
index 2f15fe1..72c1a23 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -51,6 +51,29 @@
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
@@ -61,3 +84,22 @@ static inline void rv_writel(u32 val, void __iomem *base_addr)
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
