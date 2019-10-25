Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE0E440A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 09:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8B61778;
	Fri, 25 Oct 2019 09:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8B61778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571987280;
	bh=m9fbHf2mSnc/GlRBYhzaKaO34Y3ZzxuXEe2sZWCmoiI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SAMr1I+hrRQlHfGfsdxsgIgvtfzdNUnpEHIvd1vmRoUfoazjogcoHRhR1l5jZxma/
	 IzjVaoJ1piozCrKZhfplnV/KAH/V2htSzB1Z17dFo8AunPdP6+tywN6GS4VOGWyv53
	 hTMzdmlZ+ImPEAOWPe5th8sCnDznSt/GXBFWhD7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFB5F80600;
	Fri, 25 Oct 2019 09:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9490EF805FE; Fri, 25 Oct 2019 09:06:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800087.outbound.protection.outlook.com [40.107.80.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBA82F805FB
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 09:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBA82F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="a9FlOTAA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Veon2RSGgejAoVGyjACkYaV84eCw2Gsb4TRbOeYh33UZjPkRl40fm9HTIzeYcI9PbyHYekm93XmxqexX9ShpuHXbIZmR9aEAwulYj2lvTtaPHd78uc5rjf8cibM5/cc6vK7X83Mer/uOCUK1gYocycDT+VQmMFj9pqovs4ZrIJv87MzazAnSpVcEjIV5LwbNYv5rPHsIPxnUX8yPgMDoOw1aRryccBVCtB+S+ijPxkACFP+IDLahMuUH5VkKELQK/nE4x1Uut0b+ozv38bYg/hUep+8ZdrtblhmC2OLTmXR5GadhWoLKMkyYGCgXniaCiV0F9WkrjJC6pHiMLLfoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXOcuAtkJ2x1NPiy4MDE9eyUfHC+MmDqWyVhlyistj0=;
 b=MrnjWed7axHbFqLxoOD9M59rpiWISqgicUWDyTfy0dnooUqeKWQNFXYy1VtqUGiljVqv3YlNPP3oiFqji214KnhiyUPsz+xSVoMo0v5tFi8Q6j9KtqC+UU1NrYzHKrTFlFUuqWVMB9ZE9+JpsZomNosYCGJtyJhuqGAgNZZsVibvdrufDVxcS0dtN+UuOl7VNwt2iags7K6snZsndl//XCX6pgzIPEJhgfi1R8CFKqR3TcGODviujFMVw5jEZqYBqgNAHXjvBTL6ZJni7O0avpN2okeYg5+Y3j0VylIBDuVPEenCsvEp/AdSu4oYEeb1OVxjtji8H9uvEdfgkBeWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXOcuAtkJ2x1NPiy4MDE9eyUfHC+MmDqWyVhlyistj0=;
 b=a9FlOTAA1VTHgWwisI6ruuZlW9A3LnDONom5ecCjiQdMkdQmQXZ1q4dY7hqDRE/yJIAbpqL9QqdZm99HoQPoDzwYPqEriwxvLt2s+mMParHMr7n14sLoM0Xs8O60g8CP8ZVzGwVp+b0yM4wxr4NIT9G+mWN5qSK+zsp54gy0J8g=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2747.namprd12.prod.outlook.com (20.176.116.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 25 Oct 2019 07:06:06 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 07:06:06 +0000
From: vishnu <vravulap@amd.com>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 2/7] ASoC: amd: Refactoring of DAI from DMA driver
Thread-Index: AQHVhZyxoEuZJxMTjUqPnFEMUM335Kdq+ogA
Date: Fri, 25 Oct 2019 07:06:05 +0000
Message-ID: <7ff2bf91-127d-3b13-54d1-4c5dddb17fd5@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <1571432760-3008-2-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 778b83ce-70b4-4894-7e27-08d75919cda7
x-ms-traffictypediagnostic: DM6PR12MB2747:|DM6PR12MB2747:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2747D3D53266BAFD9AAE4CE0E7650@DM6PR12MB2747.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:163;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(52116002)(102836004)(53546011)(71200400001)(30864003)(386003)(6506007)(486006)(26005)(71190400001)(6862004)(36756003)(229853002)(8936002)(6512007)(81156014)(4326008)(6486002)(6246003)(6436002)(256004)(14444005)(6636002)(478600001)(99286004)(66446008)(66556008)(76176011)(316002)(8676002)(31686004)(2906002)(64756008)(66476007)(31696002)(66946007)(7736002)(3846002)(186003)(54906003)(37006003)(11346002)(305945005)(2616005)(476003)(446003)(5660300002)(6116002)(66066001)(14454004)(81166006)(25786009)(579004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2747;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UP3KqbxNGcaIlTX2ubPz53mID21hKti1U7nvQN2IwlGZaerSiRZWg2pGN7ebQs5MhW+cpMSw/iBj0Mqrtf95i5xh2ZdWMBs2f2yg0sD6qhKKh5rcRSC76/GeG5Xfx411kMq3RMXAj+MNndfHibk3bzC9lQa3KrRt2MU2Bkxj8xyROzhEk4U599oPnTZokZtwqlMVdKXk26tcrOfDRTUdnAQNqoJEoJxLlYYUG5uACEhj6buidnW6EX4D58yPrqcHlGrIKJRL5LBFHZlhf3qM6fYW3PMZQ0jX7MLPeEl8mhqzNagv846UuMDtN9kHpq3DIefpnVonMYGddpgMK7ZwOk86n91SmW6OVtx/3zS4xsD9Aw4ViEvZJvgUkrxsDkcEhsOgFN9NaN3jNYmZZKR1/1HaabI1EKdgq1WaSHhu9UCacCEQBCHuT8S4Gw6sV4SG
Content-ID: <0CA2003C4D466C4C8A32DC8600BFA609@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 778b83ce-70b4-4894-7e27-08d75919cda7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 07:06:05.9642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y9fDpH7wiuibvcAUbM8b0SRjxHI/ZeXbfaLhP3xf2pFcRmOTBDdk8Hwxcp7/fNa9VuCT/uWgf3BAjstIgT7rFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2747
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mehta,
 Sanju" <Sanju.Mehta@amd.com>, Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 2/7] ASoC: amd: Refactoring of DAI from DMA
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

Hi Mark,

Any updates on this patch.

Regards,
Vishnu

On 19/10/19 2:35 AM, Ravulapati Vishnu vardhan rao wrote:
> Asoc: PCM DMA driver should only have dma ops.
> So Removed all DAI related functionality.
> Refactoring the PCM DMA diver code.
> Added new file containing only DAI ops.
> 
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/Makefile        |   2 +
>   sound/soc/amd/raven/acp3x-i2s.c     | 268 ++++++++++++++++++++++++++++++++++++
>   sound/soc/amd/raven/acp3x-pcm-dma.c | 232 ++-----------------------------
>   sound/soc/amd/raven/acp3x.h         |  42 ++++++
>   4 files changed, 326 insertions(+), 218 deletions(-)
>   create mode 100644 sound/soc/amd/raven/acp3x-i2s.c
> 
> diff --git a/sound/soc/amd/raven/Makefile b/sound/soc/amd/raven/Makefile
> index 108d1ac..8eef292 100644
> --- a/sound/soc/amd/raven/Makefile
> +++ b/sound/soc/amd/raven/Makefile
> @@ -1,6 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0+
>   # Raven Ridge platform Support
>   snd-pci-acp3x-objs	:= pci-acp3x.o
> +snd-acp3x-i2s-objs	:= acp3x-i2s.o
>   snd-acp3x-pcm-dma-objs	:= acp3x-pcm-dma.o
>   obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-pci-acp3x.o
> +obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-i2s.o
>   obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-pcm-dma.o
> diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
> new file mode 100644
> index 0000000..728e757
> --- /dev/null
> +++ b/sound/soc/amd/raven/acp3x-i2s.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// AMD ALSA SoC PCM Driver
> +//
> +//Copyright 2016 Advanced Micro Devices, Inc.
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/pm_runtime.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <linux/dma-mapping.h>
> +
> +#include "acp3x.h"
> +
> +#define DRV_NAME "acp3x-i2s"
> +
> +static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
> +{
> +
> +	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +
> +	case SND_SOC_DAIFMT_I2S:
> +		adata->tdm_mode = false;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +			adata->tdm_mode = true;
> +			break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
> +		u32 rx_mask, int slots, int slot_width)
> +{
> +	u32 val = 0;
> +	u16 slot_len;
> +
> +	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
> +
> +	switch (slot_width) {
> +	case SLOT_WIDTH_8:
> +		slot_len = 8;
> +		break;
> +	case SLOT_WIDTH_16:
> +		slot_len = 16;
> +		break;
> +	case SLOT_WIDTH_24:
> +		slot_len = 24;
> +		break;
> +	case SLOT_WIDTH_32:
> +		slot_len = 0;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
> +	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
> +	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
> +	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
> +
> +	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
> +	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
> +	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
> +
> +	adata->tdm_fmt = val;
> +	return 0;
> +}
> +
> +static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
> +		struct snd_pcm_hw_params *params,
> +		struct snd_soc_dai *dai)
> +{
> +	u32 val = 0;
> +	struct i2s_stream_instance *rtd = substream->runtime->private_data;
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_U8:
> +	case SNDRV_PCM_FORMAT_S8:
> +		rtd->xfer_resolution = 0x0;
> +		break;
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		rtd->xfer_resolution = 0x02;
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		rtd->xfer_resolution = 0x04;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		rtd->xfer_resolution = 0x05;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> +	val = val | (rtd->xfer_resolution  << 3);
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +	else
> +		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> +
> +	return 0;
> +}
> +
> +static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
> +		int cmd, struct snd_soc_dai *dai)
> +{
> +	int ret = 0;
> +	struct i2s_stream_instance *rtd = substream->runtime->private_data;
> +	u32 val, period_bytes;
> +
> +	period_bytes = frames_to_bytes(substream->runtime,
> +			substream->runtime->period_size);
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		rtd->bytescount = acp_get_byte_count(rtd,
> +						substream->stream);
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			rv_writel(period_bytes, rtd->acp3x_base +
> +					mmACP_BT_TX_INTR_WATERMARK_SIZE);
> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> +			val = val | BIT(0);
> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +		} else {
> +			rv_writel(period_bytes, rtd->acp3x_base +
> +					mmACP_BT_RX_INTR_WATERMARK_SIZE);
> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> +			val = val | BIT(0);
> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> +		}
> +		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> +			val = val & ~BIT(0);
> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +		} else {
> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> +			val = val & ~BIT(0);
> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> +		}
> +		rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
> +	.hw_params = acp3x_i2s_hwparams,
> +	.trigger   = acp3x_i2s_trigger,
> +	.set_fmt = acp3x_i2s_set_fmt,
> +	.set_tdm_slot = acp3x_i2s_set_tdm_slot,
> +};
> +
> +static const struct snd_soc_component_driver acp3x_dai_component = {
> +	.name           = "acp3x-i2s",
> +};
> +
> +static struct snd_soc_dai_driver acp3x_i2s_dai = {
> +	.playback = {
> +		.rates = SNDRV_PCM_RATE_8000_96000,
> +		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
> +			SNDRV_PCM_FMTBIT_U8 |
> +			SNDRV_PCM_FMTBIT_S24_LE |
> +			SNDRV_PCM_FMTBIT_S32_LE,
> +		.channels_min = 2,
> +		.channels_max = 8,
> +
> +		.rate_min = 8000,
> +		.rate_max = 96000,
> +	},
> +	.capture = {
> +		.rates = SNDRV_PCM_RATE_8000_48000,
> +		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
> +			SNDRV_PCM_FMTBIT_U8 |
> +			SNDRV_PCM_FMTBIT_S24_LE |
> +			SNDRV_PCM_FMTBIT_S32_LE,
> +		.channels_min = 2,
> +		.channels_max = 2,
> +		.rate_min = 8000,
> +		.rate_max = 48000,
> +	},
> +	.ops = &acp3x_i2s_dai_ops,
> +};
> +
> +
> +static int acp3x_dai_probe(struct platform_device *pdev)
> +{
> +	int status;
> +	struct resource *res;
> +	struct i2s_dev_data *adata;
> +
> +	if (!pdev->dev.platform_data) {
> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
> +		return -ENODEV;
> +	}
> +
> +	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
> +			GFP_KERNEL);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
> +			resource_size(res));
> +	if (IS_ERR(adata->acp3x_base))
> +		return PTR_ERR(adata->acp3x_base);
> +
> +
> +
> +	adata->i2s_irq = res->start;
> +	adata->play_stream = NULL;
> +	adata->capture_stream = NULL;
> +
> +	dev_set_drvdata(&pdev->dev, adata);
> +	status = devm_snd_soc_register_component(&pdev->dev,
> +			&acp3x_dai_component,
> +			&acp3x_i2s_dai, 1);
> +	if (status) {
> +		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
> +		return -ENODEV;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +	return 0;
> +}
> +
> +static int acp3x_dai_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +	return 0;
> +}
> +static struct platform_driver acp3x_dai_driver = {
> +	.probe = acp3x_dai_probe,
> +	.remove = acp3x_dai_remove,
> +	.driver = {
> +		.name = "acp3x_i2s_playcap",
> +	},
> +};
> +
> +module_platform_driver(acp3x_dai_driver);
> +
> +MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
> +MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:" DRV_NAME);
> diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
> index 60709e3..f5e4c7b 100644
> --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
> +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
> @@ -18,24 +18,6 @@
>   
>   #define DRV_NAME "acp3x-i2s-audio"
>   
> -struct i2s_dev_data {
> -	bool tdm_mode;
> -	unsigned int i2s_irq;
> -	u32 tdm_fmt;
> -	void __iomem *acp3x_base;
> -	struct snd_pcm_substream *play_stream;
> -	struct snd_pcm_substream *capture_stream;
> -};
> -
> -struct i2s_stream_instance {
> -	u16 num_pages;
> -	u16 channels;
> -	u32 xfer_resolution;
> -	u64 bytescount;
> -	dma_addr_t dma_addr;
> -	void __iomem *acp3x_base;
> -};
> -
>   static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
>   	.info = SNDRV_PCM_INFO_INTERLEAVED |
>   		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> @@ -279,7 +261,11 @@ static int acp3x_dma_open(struct snd_soc_component *component,
>   			  struct snd_pcm_substream *substream)
>   {
>   	int ret = 0;
> +
>   	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_soc_pcm_runtime *prtd = substream->private_data;
> +
> +	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
>   	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
>   	struct i2s_stream_instance *i2s_data = kzalloc(sizeof(struct i2s_stream_instance),
>   						       GFP_KERNEL);
> @@ -312,23 +298,6 @@ static int acp3x_dma_open(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> -static u64 acp_get_byte_count(struct i2s_stream_instance *rtd, int direction)
> -{
> -	u64 byte_count;
> -
> -	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> -		byte_count = rv_readl(rtd->acp3x_base +
> -				      mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
> -		byte_count |= rv_readl(rtd->acp3x_base +
> -				       mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
> -	} else {
> -		byte_count = rv_readl(rtd->acp3x_base +
> -				      mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
> -		byte_count |= rv_readl(rtd->acp3x_base +
> -				       mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
> -	}
> -	return byte_count;
> -}
>   
>   static int acp3x_dma_hw_params(struct snd_soc_component *component,
>   			       struct snd_pcm_substream *substream,
> @@ -380,6 +349,7 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
>   static int acp3x_dma_new(struct snd_soc_component *component,
>   			 struct snd_soc_pcm_runtime *rtd)
>   {
> +	component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
>   	struct device *parent = component->dev->parent;
>   	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
>   					      parent, MIN_BUFFER, MAX_BUFFER);
> @@ -402,7 +372,9 @@ static int acp3x_dma_mmap(struct snd_soc_component *component,
>   static int acp3x_dma_close(struct snd_soc_component *component,
>   			   struct snd_pcm_substream *substream)
>   {
> +	struct snd_soc_pcm_runtime *prtd = substream->private_data;
>   	struct i2s_stream_instance *rtd = substream->runtime->private_data;
> +	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
>   	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
>   
>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> @@ -419,182 +391,6 @@ static int acp3x_dma_close(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> -static int acp3x_dai_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
> -{
> -
> -	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
> -
> -	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> -	case SND_SOC_DAIFMT_I2S:
> -		adata->tdm_mode = false;
> -		break;
> -	case SND_SOC_DAIFMT_DSP_A:
> -		adata->tdm_mode = true;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int acp3x_dai_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
> -				  u32 rx_mask, int slots, int slot_width)
> -{
> -	u32 val = 0;
> -	u16 slot_len;
> -
> -	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
> -
> -	switch (slot_width) {
> -	case SLOT_WIDTH_8:
> -		slot_len = 8;
> -		break;
> -	case SLOT_WIDTH_16:
> -		slot_len = 16;
> -		break;
> -	case SLOT_WIDTH_24:
> -		slot_len = 24;
> -		break;
> -	case SLOT_WIDTH_32:
> -		slot_len = 0;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
> -	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
> -	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
> -	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
> -
> -	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
> -	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
> -	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
> -
> -	adata->tdm_fmt = val;
> -	return 0;
> -}
> -
> -static int acp3x_dai_i2s_hwparams(struct snd_pcm_substream *substream,
> -				  struct snd_pcm_hw_params *params,
> -				  struct snd_soc_dai *dai)
> -{
> -	u32 val = 0;
> -	struct i2s_stream_instance *rtd = substream->runtime->private_data;
> -
> -	switch (params_format(params)) {
> -	case SNDRV_PCM_FORMAT_U8:
> -	case SNDRV_PCM_FORMAT_S8:
> -		rtd->xfer_resolution = 0x0;
> -		break;
> -	case SNDRV_PCM_FORMAT_S16_LE:
> -		rtd->xfer_resolution = 0x02;
> -		break;
> -	case SNDRV_PCM_FORMAT_S24_LE:
> -		rtd->xfer_resolution = 0x04;
> -		break;
> -	case SNDRV_PCM_FORMAT_S32_LE:
> -		rtd->xfer_resolution = 0x05;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -	val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> -	val = val | (rtd->xfer_resolution  << 3);
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> -	else
> -		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> -
> -	return 0;
> -}
> -
> -static int acp3x_dai_i2s_trigger(struct snd_pcm_substream *substream,
> -				 int cmd, struct snd_soc_dai *dai)
> -{
> -	int ret = 0;
> -	struct i2s_stream_instance *rtd = substream->runtime->private_data;
> -	u32 val, period_bytes;
> -
> -	period_bytes = frames_to_bytes(substream->runtime,
> -				       substream->runtime->period_size);
> -	switch (cmd) {
> -	case SNDRV_PCM_TRIGGER_START:
> -	case SNDRV_PCM_TRIGGER_RESUME:
> -	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		rtd->bytescount = acp_get_byte_count(rtd, substream->stream);
> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -			rv_writel(period_bytes, rtd->acp3x_base +
> -				  mmACP_BT_TX_INTR_WATERMARK_SIZE);
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> -			val = val | BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> -		} else {
> -			rv_writel(period_bytes, rtd->acp3x_base +
> -				  mmACP_BT_RX_INTR_WATERMARK_SIZE);
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> -			val = val | BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> -		}
> -		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
> -		break;
> -	case SNDRV_PCM_TRIGGER_STOP:
> -	case SNDRV_PCM_TRIGGER_SUSPEND:
> -	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> -			val = val & ~BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> -		} else {
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> -			val = val & ~BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> -		}
> -		rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
> -		break;
> -	default:
> -		ret = -EINVAL;
> -		break;
> -	}
> -
> -	return ret;
> -}
> -
> -static struct snd_soc_dai_ops acp3x_dai_i2s_ops = {
> -	.hw_params = acp3x_dai_i2s_hwparams,
> -	.trigger   = acp3x_dai_i2s_trigger,
> -	.set_fmt = acp3x_dai_i2s_set_fmt,
> -	.set_tdm_slot = acp3x_dai_set_tdm_slot,
> -};
> -
> -static struct snd_soc_dai_driver acp3x_i2s_dai_driver = {
> -	.playback = {
> -		.rates = SNDRV_PCM_RATE_8000_96000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
> -					SNDRV_PCM_FMTBIT_U8 |
> -					SNDRV_PCM_FMTBIT_S24_LE |
> -					SNDRV_PCM_FMTBIT_S32_LE,
> -		.channels_min = 2,
> -		.channels_max = 8,
> -
> -		.rate_min = 8000,
> -		.rate_max = 96000,
> -	},
> -	.capture = {
> -		.rates = SNDRV_PCM_RATE_8000_48000,
> -		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
> -					SNDRV_PCM_FMTBIT_U8 |
> -					SNDRV_PCM_FMTBIT_S24_LE |
> -					SNDRV_PCM_FMTBIT_S32_LE,
> -		.channels_min = 2,
> -		.channels_max = 2,
> -		.rate_min = 8000,
> -		.rate_max = 48000,
> -	},
> -	.ops = &acp3x_dai_i2s_ops,
> -};
> -
>   static const struct snd_soc_component_driver acp3x_i2s_component = {
>   	.name		= DRV_NAME,
>   	.open		= acp3x_dma_open,
> @@ -619,6 +415,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   	irqflags = *((unsigned int *)(pdev->dev.platform_data));
> +	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
> @@ -626,10 +425,6 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> -	if (!adata)
> -		return -ENOMEM;
> -
>   	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
>   					 resource_size(res));
>   
> @@ -650,9 +445,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	status = devm_snd_soc_register_component(&pdev->dev,
>   						 &acp3x_i2s_component,
> -						 &acp3x_i2s_dai_driver, 1);
> +						 NULL, 0);
>   	if (status) {
> -		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
> +		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
>   		goto dev_err;
>   	}
>   	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
> @@ -774,13 +569,14 @@ static struct platform_driver acp3x_dma_driver = {
>   	.probe = acp3x_audio_probe,
>   	.remove = acp3x_audio_remove,
>   	.driver = {
> -		.name = "acp3x_rv_i2s",
> +		.name = "acp3x_rv_i2s_dma",
>   		.pm = &acp3x_pm_ops,
>   	},
>   };
>   
>   module_platform_driver(acp3x_dma_driver);
>   
> +MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
>   MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
>   MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
>   MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
> diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
> index 2f15fe1..72c1a23 100644
> --- a/sound/soc/amd/raven/acp3x.h
> +++ b/sound/soc/amd/raven/acp3x.h
> @@ -51,6 +51,29 @@
>   #define SLOT_WIDTH_24 0x18
>   #define SLOT_WIDTH_32 0x20
>   
> +struct acp3x_platform_info {
> +	u16 play_i2s_instance;
> +	u16 cap_i2s_instance;
> +	u16 capture_channel;
> +};
> +
> +struct i2s_dev_data {
> +	bool tdm_mode;
> +	unsigned int i2s_irq;
> +	u32 tdm_fmt;
> +	void __iomem *acp3x_base;
> +	struct snd_pcm_substream *play_stream;
> +	struct snd_pcm_substream *capture_stream;
> +};
> +
> +struct i2s_stream_instance {
> +	u16 num_pages;
> +	u16 channels;
> +	u32 xfer_resolution;
> +	u64 bytescount;
> +	dma_addr_t dma_addr;
> +	void __iomem *acp3x_base;
> +};
>   
>   static inline u32 rv_readl(void __iomem *base_addr)
>   {
> @@ -61,3 +84,22 @@ static inline void rv_writel(u32 val, void __iomem *base_addr)
>   {
>   	writel(val, base_addr - ACP3x_PHY_BASE_ADDRESS);
>   }
> +
> +static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
> +							int direction)
> +{
> +	u64 byte_count;
> +
> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> +		byte_count = rv_readl(rtd->acp3x_base +
> +				mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
> +		byte_count |= rv_readl(rtd->acp3x_base +
> +				mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
> +	} else {
> +		byte_count = rv_readl(rtd->acp3x_base +
> +				mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
> +		byte_count |= rv_readl(rtd->acp3x_base +
> +				mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
> +	}
> +	return byte_count;
> +}
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
