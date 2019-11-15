Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 538EBFDD27
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:14:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19EB1655;
	Fri, 15 Nov 2019 13:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19EB1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820093;
	bh=36QepS3W3Pa+okW6yDprJBZoz4MfwUvLDnASWOq50Gg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l53ym3aEs3jvUnGVY4yk1GPH4Bu5U8hwIBNOUlHIj/4ZTUDqQRzvJt/5lsimD8Bjo
	 ERp2A4pAy/gwWriYCoKX0DgzJReMVO4x1/xR7CYlz3RdBxrOYQBOTADHiR9i7X7g9y
	 LiiIS3Wm8AYsYwfhL/smh3EUZzSh7+S9aDfN+x3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE6CDF80104;
	Fri, 15 Nov 2019 13:13:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06EE5F80106; Fri, 15 Nov 2019 13:13:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740058.outbound.protection.outlook.com [40.107.74.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B047DF800FF
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B047DF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="oJPGxIAz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lswHZIX7yFUzB7C0RsP0uOTyfLHDXAHKchW2YxanMWSHfQtCxnYRGC/HMbXzWYwrCewt7pxa4xLq1GIb4ZVoBYhJ6Ez6JLp2esLG3iaDP1h4wnGWEtRZZWTSkjcmRLJm/zGmiYe3jkuCVjbbsOg9J6mDlGjrjwEWNDiElo2kd9+aAkyD2IlQFFH1IVIDByz9JQnaz7T1c5SpjLDQHvoJbdgkwdsoxxrrGiN8NymQTL/3DNA7PjcukZxZ+uB+1YUi4Qlbogv+X7igtOxs6DEl/NGaTcnlVmNoKpeyzWxyT0l+WttsmApp5+lnQAUCSvT3SbzCUkuzjJ1un7U5WJVxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJmMczzrQI5l5W0HMHE9PEja6Bb9UOVSxxN1qqmrH/E=;
 b=ZMhx6nUOp9iXdSHYXkiWC1pKKICtlK55s0lJXB0h3f3GUSa565fHU2Ld0cQIgsutD/+B+VxFC0cZZQCm1OnBnt7WhGKfbbjR6XE5H/U9Cadfe1SYF2txsbgoNAIAlndFu9QnpqWOXPZt2Zyd5XRPWvaDSFAqRVOiocEpWxsirn+4VNuIIZ64c6xdsJ5vDlT1ehMwrIkwpf8oB9zgtLJ5QC7i/VPgxLii31BzB17EYzhLWJiZYJIURMojT8OyvQmbJ4MVDp4MOh44azy1DmvGWccVYUGiUWG6TIZktnv4P4iVfY6AGVj8vE0WtNB5eGcB31nRDkgirmRgT5RUm5i4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJmMczzrQI5l5W0HMHE9PEja6Bb9UOVSxxN1qqmrH/E=;
 b=oJPGxIAzbiq3EgMFBOYeeHpSzQUWoS7bZ+9fHzoZGJ8XvbdeLGenO0RZ6YF3CIrP0R3jZMI03VkUcEYittSD+aHUsHF7ETlcAQCmDv0qTTUdHUymCTpxXtovhlbD6upIvpuB3D2ARxHgw9D90DTrJIAVgJ5piImDKT1zrxYH8ro=
Received: from DM6PR12CA0031.namprd12.prod.outlook.com (2603:10b6:5:1c0::44)
 by DM6PR12MB3114.namprd12.prod.outlook.com (2603:10b6:5:11e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Fri, 15 Nov
 2019 12:13:23 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::201) by DM6PR12CA0031.outlook.office365.com
 (2603:10b6:5:1c0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.26 via Frontend
 Transport; Fri, 15 Nov 2019 12:13:22 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 12:13:22 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 15 Nov
 2019 06:13:22 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 15 Nov 2019 06:13:12 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 15 Nov 2019 17:40:19 +0530
Message-ID: <1573819823-23731-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(428003)(199004)(189003)(76176011)(7696005)(26005)(47776003)(11346002)(51416003)(70206006)(478600001)(5660300002)(14444005)(70586007)(81156014)(8676002)(336012)(2906002)(2616005)(81166006)(50226002)(486006)(48376002)(8936002)(476003)(126002)(36756003)(446003)(86362001)(1671002)(50466002)(109986005)(426003)(186003)(4326008)(53416004)(30864003)(316002)(16586007)(54906003)(356004)(305945005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3114; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3d7902f-320e-437f-c0c2-08d769c535cc
X-MS-TrafficTypeDiagnostic: DM6PR12MB3114:|DM6PR12MB3114:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3114B4FD7A68287D0B7534C2E7700@DM6PR12MB3114.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pe5rhPI2Hl7BrMHbCEMnkdybgy5kF9NzLw2lLvnQgUYBMEK0ul7f/tMEeoQcGQx/ZhBIvk0pKsUK7F9TTssBjUK7aBKSBNudHfhZ/b36jWNhWiUa8yuYalAL9ikCs5hfF302ANqHu7ssTk5gqhd6JgpcPtKaLK14IuWp6VQWwEAFf699yzIeXdzjKRAOMwJPj55wThkVzDPrKJryV2QBq9t/gvkZSszU6i1ZDMts5c+lC4R4zmbJoAmWCbs8I0fjZ2i1LFkUQdWCM7xWOMGhqf7vumS2QwKbvnjYLGewHruY9G8cp2exE0D7rRR339Oc0A/HWUnhUre7DCG4HumgNNoZx7815gKD9IBHAtvNhSQ43PX+LLjBJCEIblkeR0NfkRjMC7Rt/WcNdppR3QMRV428cmrS5EUQnP0TLyDLn6TOq1wrzBVyZVrmHfQdBwes
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:13:22.7458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d7902f-320e-437f-c0c2-08d769c535cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3114
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH v6 2/6] ASoC: amd: Refactoring of DAI from DMA
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
So Removed all DAI related functionality.Refactoring
the PCM DMA driver code.Added new file containing only DAI ops.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/Makefile        |   2 +
 sound/soc/amd/raven/acp3x-i2s.c     | 275 +++++++++++++++++++++++++++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c | 318 ++++++++----------------------------
 sound/soc/amd/raven/acp3x.h         |  42 +++++
 4 files changed, 390 insertions(+), 247 deletions(-)
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
index 0000000..df62c17
--- /dev/null
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -0,0 +1,275 @@
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
+	struct i2s_dev_data *adata;
+
+	adata = snd_soc_dai_get_drvdata(cpu_dai);
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
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
+	struct i2s_dev_data *adata;
+	u32 val;
+	u16 slot_len;
+
+	adata = snd_soc_dai_get_drvdata(cpu_dai);
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
+	rv_writel(val | 0x2, adata->acp3x_base + mmACP_BTTDM_ITER);
+	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
+	rv_writel(val | 0x2, adata->acp3x_base + mmACP_BTTDM_IRER);
+
+	val = FRM_LEN | (slots << 15) | (slot_len << 18);
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
+	struct i2s_stream_instance *rtd;
+	u32 val;
+	u32 reg_val;
+
+	rtd = substream->runtime->private_data;
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
+		int cmd, struct snd_soc_dai *dai)
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
+	struct resource *res;
+	struct i2s_dev_data *adata;
+	int status, ret;
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
+			GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		ret = -ENOMEM;
+		goto err;
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
+		ret = -ENODEV;
+		goto dev_err;
+	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	return 0;
+dev_err:
+	iounmap(adata->acp3x_base);
+	kfree(adata);
+	return ret;
+err:
+	kfree(adata);
+	return ret;
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
index 60709e3..ffd7cd1 100644
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
 
@@ -278,11 +261,18 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
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
+	i2s_data = kzalloc(sizeof(struct i2s_stream_instance),
+						GFP_KERNEL);
 	if (!i2s_data)
 		return -EINVAL;
 
@@ -312,33 +302,18 @@ static int acp3x_dma_open(struct snd_soc_component *component,
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
 
@@ -362,12 +337,12 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
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
@@ -380,7 +355,10 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
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
@@ -402,8 +380,12 @@ static int acp3x_dma_mmap(struct snd_soc_component *component,
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
@@ -415,186 +397,9 @@ static int acp3x_dma_close(struct snd_soc_component *component,
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
@@ -609,10 +414,10 @@ static const struct snd_soc_component_driver acp3x_i2s_component = {
 
 static int acp3x_audio_probe(struct platform_device *pdev)
 {
-	int status;
 	struct resource *res;
 	struct i2s_dev_data *adata;
 	unsigned int irqflags;
+	int status, ret;
 
 	if (!pdev->dev.platform_data) {
 		dev_err(&pdev->dev, "platform_data not retrieved\n");
@@ -622,65 +427,80 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
 		return -ENODEV;
 	}
 
 	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
 	if (!adata)
 		return -ENOMEM;
-
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
 					 resource_size(res));
-
+	if (!adata->acp3x_base) {
+		ret = -ENOMEM;
+		goto base_err;
+	}
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
-		return -ENODEV;
+		ret = -ENOMEM;
+		goto io_irq;
 	}
 
 	adata->i2s_irq = res->start;
-	adata->play_stream = NULL;
-	adata->capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	/* Initialize ACP */
 	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
+	if (status) {
+		ret = -ENODEV;
+		goto io_irq;
+	}
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
+	iounmap(adata->acp3x_base);
+	kfree(adata);
 	status = acp3x_deinit(adata->acp3x_base);
 	if (status)
 		dev_err(&pdev->dev, "ACP de-init failed\n");
 	else
 		dev_info(&pdev->dev, "ACP de-initialized\n");
-	/*ignore device status and return driver probe error*/
-	return -ENODEV;
+	return ret;
+io_irq:
+	iounmap(adata->acp3x_base);
+	kfree(adata);
+	return ret;
+base_err:
+	kfree(adata);
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
@@ -693,10 +513,11 @@ static int acp3x_audio_remove(struct platform_device *pdev)
 
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
@@ -738,8 +559,9 @@ static int acp3x_resume(struct device *dev)
 
 static int acp3x_pcm_runtime_suspend(struct device *dev)
 {
+	struct i2s_dev_data *adata;
 	int status;
-	struct i2s_dev_data *adata = dev_get_drvdata(dev);
+	adata = dev_get_drvdata(dev);
 
 	status = acp3x_deinit(adata->acp3x_base);
 	if (status)
@@ -754,8 +576,9 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 
 static int acp3x_pcm_runtime_resume(struct device *dev)
 {
+	struct i2s_dev_data *adata;
 	int status;
-	struct i2s_dev_data *adata = dev_get_drvdata(dev);
+	adata = dev_get_drvdata(dev);
 
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
@@ -774,13 +597,14 @@ static struct platform_driver acp3x_dma_driver = {
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
