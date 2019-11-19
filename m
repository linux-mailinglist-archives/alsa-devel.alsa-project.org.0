Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753F102615
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 15:12:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 057831679;
	Tue, 19 Nov 2019 15:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 057831679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574172757;
	bh=qNOx63h01ua2k9zruquW+a61YDQ5PZrxyTYvRhOOWcE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XAE9YQIFOvnL5YETdToxZ/wY1GYYDjOXQzyWOIbp/8rVnhO7ME9s/vBcIweisDcYf
	 lBXGdn5OoVeDMwR5Vk+4vD5qQJwubhYBzo0FGZn9YR+MWv9J/MDDzJpNcnh5syRcmd
	 QcjEuNdMrjZpmNY6lFuP1/lmgjEz4DhaSaO3Og4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95BFDF80148;
	Tue, 19 Nov 2019 15:10:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD253F80147; Tue, 19 Nov 2019 15:10:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-bn3nam01on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe41::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41B09F80139
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 15:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41B09F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="2KrU5bGo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afzpd+S7dLX5iMcP+KqPkoCvNNQJ6jSxEBcK0u4MwYLteoH0YIJ5jCMdHytf2Y1GClzYR14Iiqdghe2A0qqCFTsJnoSWsBqn7+ClYdjeGG6ZY28Y5g/pMUipip05IYvjsdSDr0gCuwcmQk7OcRzaJxJ+DFlq382axVMnF8+8DK2m9jB4gpFtek4cNpjW8tm3C7U0wD9movrqct8JNLf5+I8XvizBrmdMRcjZNKpM8DBQYFPLIrQSnq1oBgQwo3revz0iIv/OqxKViwHiPHNuCEwx1QgMvEC+Wipu1651aJ5G6++JBc1sO2WRIGc9ow1xk1UhnjmZ9rVr3OmPVWPmpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVDY9GBmzaaXyaflGq534l81z+DTELCb30YtOfShzMg=;
 b=KJJGx5vb5xDYVb+YkjmZPqRcmsUUAnevYpRVaG0b9XTg4amrUjf4sHxRuCh9fdnY0bVh9Mzj0T4tJ3CZTP9c3XfMZhQ6FutVVIFfclbO7r+JTJBUUW04R75NinqhOIBsuoON0EjhkCp7QaTXZuwgxnWRGe9PAf1eHaD9V/1sZXlmyRlxsN6oKoszsj/nrKxwawa84yv0+2RgyxLwq0Z48sT8NolSFYRnXCuFrpQO8VG83QzdLMivfCMxGMNwd0NACeiZv5TVGhz7jyo2B/E4WExWjmmpSQos57Z0xmm+QQpmvJ5OkVZKQFhcA2Ikmge6VQLvAQLMZXPy/98Sk/GIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVDY9GBmzaaXyaflGq534l81z+DTELCb30YtOfShzMg=;
 b=2KrU5bGoAn7c6IBgYKYt1Qihd+1OUTBEUoreuKjkx6TCAGoy2lwNYEY8W1uwebTr3yvYRUxTRLxp9gRC891cG1My8cVDt3PSBQrhO67/W7ynxP0zo35xTkAd0lPTKPLvp0aVJeeZb+o0boMzVmxfzHETIJslSCNNcEtkZavuV6Y=
Received: from SN1PR12CA0053.namprd12.prod.outlook.com (2603:10b6:802:20::24)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.30; Tue, 19 Nov
 2019 14:10:06 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::206) by SN1PR12CA0053.outlook.office365.com
 (2603:10b6:802:20::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Tue, 19 Nov 2019 14:10:05 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Tue, 19 Nov 2019 14:10:05 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 19 Nov
 2019 08:09:53 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 19 Nov 2019 08:09:49 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 19 Nov 2019 19:38:24 +0530
Message-ID: <1574172508-26546-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574172508-26546-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574172508-26546-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(428003)(199004)(189003)(426003)(478600001)(8676002)(54906003)(50226002)(36756003)(6666004)(356004)(30864003)(1671002)(47776003)(48376002)(14444005)(50466002)(5660300002)(305945005)(186003)(8936002)(26005)(70586007)(53416004)(446003)(109986005)(81166006)(81156014)(126002)(476003)(486006)(2616005)(336012)(11346002)(4326008)(16586007)(316002)(86362001)(51416003)(76176011)(2906002)(7696005)(70206006)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4230; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2204bf4d-399c-42ab-94b9-08d76cfa2d6a
X-MS-TrafficTypeDiagnostic: CH2PR12MB4230:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4230645B70EBD91F59BEA695E74C0@CH2PR12MB4230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-Forefront-PRVS: 022649CC2C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VBPlz4QC3fisx5/8FVnDDYdq6IGCjs+BOHLb8q2GYRJfFxrZERKSwejyaAxWvfSXhTX0oeFvvWh/CsHy+dbXpjY14OXki+/rM+HQu+0EAqG75/nmuJ3Dg8elCSXu/SA5y2OJH4hZvtu/F3EbBew9HqniwIu8RtuDRFj7g4c9OC/FnHt8fi9H/ED1Gxuhwah8MZDoOGLWMcp/u5AyVdHPUlL7vygrYN4YAY1qkHz/llsjCZjswrV8PmVFSzLufJb1DklzbpYwUGA4iZdsIekIQpR7Vpy3sf3cZy65KqmbK7J9WUfT4JR8V/F8XMX9K+i/+vz9L1g7JsOOp4MW9nSDgCkIHoHqqJIr+x9db/1zyDMEsgWMFDXqPCGRH7Wd825dH7vg/meJ8hJieemyaObnCBobWyzFsVrDmW1ylnjvItziRhoKCqvqZ/X0MfhP0YUO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 14:10:05.4957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2204bf4d-399c-42ab-94b9-08d76cfa2d6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com, Colin
 Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH v10 2/6] ASoC: amd: Refactoring of DAI from DMA
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
 sound/soc/amd/raven/acp3x-i2s.c     | 266 +++++++++++++++++++++++++++++++
 sound/soc/amd/raven/acp3x-pcm-dma.c | 305 +++++++-----------------------------
 sound/soc/amd/raven/acp3x.h         |  42 +++++
 4 files changed, 369 insertions(+), 246 deletions(-)
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
index 0000000..390d07a
--- /dev/null
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -0,0 +1,266 @@
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
+	int status;
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
+
+	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
+			resource_size(res));
+	if (IS_ERR(adata->acp3x_base))
+		return PTR_ERR(adata->acp3x_base);
+
+	adata->i2s_irq = res->start;
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+			&acp3x_dai_component, &acp3x_i2s_dai, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+		return -ENODEV;
+	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
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
index 60709e3..0202737 100644
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
-	return 0;
-}
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
 	return 0;
 }
 
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
@@ -622,7 +427,7 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
 		return -ENODEV;
 	}
 
@@ -632,60 +437,64 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
 					 resource_size(res));
+	if (!adata->acp3x_base)
+		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
-		return -ENODEV;
+		return -ENOMEM;
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
@@ -693,10 +502,11 @@ static int acp3x_audio_remove(struct platform_device *pdev)
 
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
@@ -738,14 +548,15 @@ static int acp3x_resume(struct device *dev)
 
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
 
@@ -754,8 +565,9 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 
 static int acp3x_pcm_runtime_resume(struct device *dev)
 {
+	struct i2s_dev_data *adata;
 	int status;
-	struct i2s_dev_data *adata = dev_get_drvdata(dev);
+	adata = dev_get_drvdata(dev);
 
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
@@ -774,13 +586,14 @@ static struct platform_driver acp3x_dma_driver = {
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
