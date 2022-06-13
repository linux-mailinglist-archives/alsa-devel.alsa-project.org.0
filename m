Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20E5480EA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 09:55:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA3317C8;
	Mon, 13 Jun 2022 09:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA3317C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655106940;
	bh=qyt1e7EqctHnZwsy2hl951D7qQi9UvVp4k9kksGsYMU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZw78kcl3QQeyJDcQwqiGlTa+7uMqx5aiE9wCaRgGc/7jP0Lgwta2e7V2zOej4AKJ
	 /HyHjdD2uAzpZmd54Myhm+DULO+rhohLHuyrJS2P5Zm71DkCPE4lrgsqH/lBe4Fvto
	 1MYxJw0w4NUtRVajGKSQBmK9Mit4jfwV+xiTyP24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1559F804CC;
	Mon, 13 Jun 2022 09:54:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AAD6F804C1; Mon, 13 Jun 2022 09:54:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 423CCF80139
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 09:54:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 423CCF80139
X-UUID: 5f16042692ac4a78b9ba373adbacb1f5-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:b5225f0a-1662-4306-80f5-5038238cb691, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:a9685dc6-12ba-4305-bfdf-9aefbdc32516,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 5f16042692ac4a78b9ba373adbacb1f5-20220613
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1524609858; Mon, 13 Jun 2022 15:54:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 13 Jun 2022 15:54:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jun 2022 15:54:20 +0800
Message-ID: <3554b05232b0342e6fa789dced4a99ce7e8dcfe7.camel@mediatek.com>
Subject: Re: [PATCH v7 2/8] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>
Date: Mon, 13 Jun 2022 15:54:20 +0800
In-Reply-To: <af063ee7-fcd2-c3c8-8889-8d5a34baeb3c@collabora.com>
References: <20220610082724.29256-1-jiaxin.yu@mediatek.com>
 <20220610082724.29256-3-jiaxin.yu@mediatek.com>
 <af063ee7-fcd2-c3c8-8889-8d5a34baeb3c@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 2022-06-10 at 12:02 +0200, AngeloGioacchino Del Regno wrote:
> Il 10/06/22 10:27, Jiaxin Yu ha scritto:
> > Add mt8186 platform and affiliated driver.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   sound/soc/mediatek/Kconfig                    |   12 +
> >   sound/soc/mediatek/Makefile                   |    1 +
> >   sound/soc/mediatek/mt8186/Makefile            |   19 +
> >   sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
> >   .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
> >   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3009
> > +++++++++++++++++
> >   6 files changed, 3537 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/Makefile
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
..snip..
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > new file mode 100644
> > index 000000000000..aaba8627d9e1
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> > @@ -0,0 +1,3009 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Mediatek ALSA SoC AFE platform driver for 8186
> > +//
> > +// Copyright (c) 2022 MediaTek Inc.
> > +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > +#include <sound/soc.h>
> > +
> > +#include "../common/mtk-afe-platform-driver.h"
> > +#include "../common/mtk-afe-fe-dai.h"
> > +
> > +#include "mt8186-afe-common.h"
> > +#include "mt8186-afe-clk.h"
> > +#include "mt8186-afe-gpio.h"
> > +#include "mt8186-interconnection.h"
> > +
> 
> ..snip..
> 
> > +
> > +static int mt8186_fe_hw_free(struct snd_pcm_substream *substream,
> > +			     struct snd_soc_dai *dai)
> > +{
> > +	int ret;
> > +
> > +	ret = mtk_afe_fe_hw_free(substream, dai);
> > +	if (ret)
> > +		goto exit;
> > +
> > +	/* wait for some platform related operation */
> 
> This comment says that we should wait for "some platform related
> operation":
> it's not describing what kind of operation we would wait for... and
> we are
> not waiting for anything at all and just returning.
> 
> Are you implementing this wait mechanism?
> ...otherwise, there's no need for that goto at all.
> 

This is a reserved place for development, but there is no need to do
anything in the end. So we can remove this line.

> > +exit:
> > +	return ret;
> > +}
> > +
> > +static int mt8186_fe_trigger(struct snd_pcm_substream *substream,
> > int cmd,
> > +			     struct snd_soc_dai *dai)
> > +{
> > +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +	struct snd_pcm_runtime * const runtime = substream->runtime;
> > +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	int id = asoc_rtd_to_cpu(rtd, 0)->id;
> > +	struct mtk_base_afe_memif *memif = &afe->memif[id];
> > +	int irq_id = memif->irq_usage;
> > +	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
> > +	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
> > +	unsigned int counter = runtime->period_size;
> 
> You're assigning a value to 'counter' here and you may or may not use
> it,
> because if we look down there...
> 
> > +	unsigned int rate = runtime->rate;
> > +	int fs;
> > +	int ret;
> > +
> > +	dev_dbg(afe->dev, "%s(), %s cmd %d, irq_id %d\n",
> > +		__func__, memif->data->name, cmd, irq_id);
> > +
> > +	switch (cmd) {
> > +	case SNDRV_PCM_TRIGGER_START:
> > +	case SNDRV_PCM_TRIGGER_RESUME:
> > +		ret = mtk_memif_set_enable(afe, id);
> > +		if (ret) {
> > +			dev_err(afe->dev, "%s(), error, id %d, memif
> > enable, ret %d\n",
> > +				__func__, id, ret);
> > +			return ret;
> > +		}
> > +
> > +		/*
> > +		 * for small latency record
> > +		 * ul memif need read some data before irq enable
> > +		 */
> > +		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
> > +		    ((runtime->period_size * 1000) / rate <= 10))
> > +			udelay(300);
> > +
> > +		/* set irq counter */
> > +		if (afe_priv->irq_cnt[id] > 0)
> > +			counter = afe_priv->irq_cnt[id];
> 
> ...you're reassigning the counter if irq_cnt > 0, so you can as well
> avoid a
> reassignment if you simply do it like
> 
> 		if (afe_priv->irq_cnt[id] > 0)
> 			counter = afe_priv->irq_cnt[id];
> 		else
> 			counter = runtime->period_size;
> 

Agree with you.

> > +
> > +		regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
> > +				   irq_data->irq_cnt_maskbit
> > +				   << irq_data->irq_cnt_shift,
> > +				   counter << irq_data->irq_cnt_shift);
> > +
> > +		/* set irq fs */
> > +		fs = afe->irq_fs(substream, runtime->rate);
> > +		if (fs < 0)
> > +			return -EINVAL;
> > +
> > +		regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
> > +				   irq_data->irq_fs_maskbit
> > +				   << irq_data->irq_fs_shift,
> > +				   fs << irq_data->irq_fs_shift);
> > +
> > +		/* enable interrupt */
> > +		if (runtime->stop_threshold != ~(0U))
> > +			regmap_update_bits(afe->regmap,
> > +					   irq_data->irq_en_reg,
> > +					   1 << irq_data->irq_en_shift,
> > +					   1 << irq_data-
> > >irq_en_shift);
> > +		return 0;
> > +	case SNDRV_PCM_TRIGGER_STOP:
> > +	case SNDRV_PCM_TRIGGER_SUSPEND:
> > +		if (afe_priv->xrun_assert[id] > 0) {
> > +			if (substream->stream ==
> > SNDRV_PCM_STREAM_CAPTURE) {
> > +				int avail =
> > snd_pcm_capture_avail(runtime);
> > +
> > +				if (avail >= runtime->buffer_size) {
> > +					dev_err(afe->dev, "%s(), id %d,
> > xrun assert\n",
> > +						__func__, id);
> 
> You're printing an error here, but not returning an error state
> related to
> this one at the end of this case... why?
> 
> (if this is intended, add a comment in the code explaining the
> reason)
> 

Here is a debug log about xrun when capture. There is no processing
here because ALSA will help with it. We just want to know the id
information.

> > +				}
> > +			}
> > +		} > +
> > +		ret = mtk_memif_set_disable(afe, id);
> > +		if (ret)
> > +			dev_err(afe->dev, "%s(), error, id %d, memif
> > enable, ret %d\n",
> > +				__func__, id, ret);
> > +
> > +		/* disable interrupt */
> > +		if (runtime->stop_threshold != ~(0U))
> > +			regmap_update_bits(afe->regmap,
> > +					   irq_data->irq_en_reg,
> > +					   1 << irq_data->irq_en_shift,
> > +					   0 << irq_data-
> > >irq_en_shift);
> > +
> > +		/* clear pending IRQ */
> > +		regmap_write(afe->regmap, irq_data->irq_clr_reg,
> > +			     1 << irq_data->irq_clr_shift);
> > +		return ret;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> 
> ..snip..
> 
> > +
> > +static int mt8186_irq_cnt1_set(struct snd_kcontrol *kcontrol,
> > +			       struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *cmpnt =
> > snd_soc_kcontrol_component(kcontrol);
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	int memif_num = MT8186_PRIMARY_MEMIF;
> > +	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
> > +	int irq_id = memif->irq_usage;
> > +	int irq_cnt = afe_priv->irq_cnt[memif_num];
> > +
> > +	dev_dbg(afe->dev, "%s(), irq_id %d, irq_cnt = %d, value =
> > %ld\n",
> > +		__func__, irq_id, irq_cnt, ucontrol-
> > >value.integer.value[0]);
> > +
> > +	if (irq_cnt == ucontrol->value.integer.value[0])
> > +		return 0;
> > +
> > +	irq_cnt = ucontrol->value.integer.value[0];
> > +	afe_priv->irq_cnt[memif_num] = irq_cnt;
> > +
> > +	if (pm_runtime_status_suspended(afe->dev) || irq_id < 0) {
> > +		dev_info(afe->dev, "%s(), suspended || irq_id %d, not
> > set\n",
> > +			 __func__, irq_id);
> 
> This should probably be a dev_dbg, as that's not supposed to normally
> happen.
> Besides, since the expected flow for this function is to write to
> registers,
> I think that for readability purposes it's best to invert this
> conditional:
> 
> 	if (!pm_runtime_status_suspended(afe->dev) && irq_id >= 0) {
> 		.....
> 	} else {
> 		dev_dbg(.....)
> 	}
> 

Got it.

> > +	} else {
> > +		struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
> > +		const struct mtk_base_irq_data *irq_data = irqs-
> > >irq_data;
> > +
> > +		regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
> > +				   irq_data->irq_cnt_maskbit
> > +				   << irq_data->irq_cnt_shift,
> > +				   irq_cnt << irq_data->irq_cnt_shift);
> > +	}
> > +
> > +	return 1;
> > +}
> > +
> > +static int mt8186_irq_cnt2_get(struct snd_kcontrol *kcontrol,
> > +			       struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *cmpnt =
> > snd_soc_kcontrol_component(kcontrol);
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +
> > +	ucontrol->value.integer.value[0] =
> > +		afe_priv->irq_cnt[MT8186_RECORD_MEMIF];
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt8186_irq_cnt2_set(struct snd_kcontrol *kcontrol,
> > +			       struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *cmpnt =
> > snd_soc_kcontrol_component(kcontrol);
> > +	struct mtk_base_afe *afe =
> > snd_soc_component_get_drvdata(cmpnt);
> > +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> > +	int memif_num = MT8186_RECORD_MEMIF;
> > +	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
> > +	int irq_id = memif->irq_usage;
> > +	int irq_cnt = afe_priv->irq_cnt[memif_num];
> > +
> > +	dev_dbg(afe->dev, "%s(), irq_id %d, irq_cnt = %d, value =
> > %ld\n",
> > +		__func__, irq_id, irq_cnt, ucontrol-
> > >value.integer.value[0]);
> > +
> > +	if (irq_cnt == ucontrol->value.integer.value[0])
> > +		return 0;
> > +
> > +	irq_cnt = ucontrol->value.integer.value[0];
> > +	afe_priv->irq_cnt[memif_num] = irq_cnt;
> > +
> > +	if (pm_runtime_status_suspended(afe->dev) || irq_id < 0) {
> > +		dev_info(afe->dev, "%s(), suspended || irq_id %d, not
> > set\n",
> > +			 __func__, irq_id);
> 
> same here.
> 

Got it.

> > +static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
> > +{
> > +	struct mtk_base_afe *afe;
> > +	struct mt8186_afe_private *afe_priv;
> > +	struct resource *res;
> > +	struct reset_control *rstc;
> > +	struct device *dev = &pdev->dev;
> > +	int i, ret, irq_id;
> > +
> > +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> > +	if (ret)
> > +		return ret;
> > +
> > +	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
> > +	if (!afe)
> > +		return -ENOMEM;
> > +	platform_set_drvdata(pdev, afe);
> > +
> > +	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv),
> > GFP_KERNEL);
> > +	if (!afe->platform_priv)
> > +		return -ENOMEM;
> > +
> > +	afe_priv = afe->platform_priv;
> > +	afe->dev = &pdev->dev;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(afe->base_addr))
> > +		return PTR_ERR(afe->base_addr);
> > +
> > +	/* init audio related clock */
> > +	ret = mt8186_init_clock(afe);
> > +	if (ret) {
> > +		dev_err(dev, "init clock error, ret %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* init memif */
> > +	afe->memif_32bit_supported = 0;
> > +	afe->memif_size = MT8186_MEMIF_NUM;
> > +	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe-
> > >memif),
> > +				  GFP_KERNEL);
> > +
> > +	if (!afe->memif)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < afe->memif_size; i++) {
> > +		afe->memif[i].data = &memif_data[i];
> > +		afe->memif[i].irq_usage = memif_irq_usage[i];
> > +		afe->memif[i].const_irq = 1;
> > +	}
> > +
> > +	mutex_init(&afe->irq_alloc_lock);	/* needed when dynamic irq
> > */
> > +
> > +	/* init irq */
> > +	afe->irqs_size = MT8186_IRQ_NUM;
> > +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe-
> > >irqs),
> > +				 GFP_KERNEL);
> > +
> > +	if (!afe->irqs)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < afe->irqs_size; i++)
> > +		afe->irqs[i].irq_data = &irq_data[i];
> > +
> > +	/* request irq */
> > +	irq_id = platform_get_irq(pdev, 0);
> > +	if (irq_id <= 0)
> > +		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
> > +				     "no irq found");
> > +
> > +	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
> > +			       IRQF_TRIGGER_NONE,
> > +			       "Afe_ISR_Handle", (void *)afe);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "could not request_irq
> > for Afe_ISR_Handle\n");
> > +
> > +	ret = enable_irq_wake(irq_id);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "enable_irq_wake %d\n",
> > irq_id);
> > +
> > +	/* init sub_dais */
> > +	INIT_LIST_HEAD(&afe->sub_dais);
> > +
> > +	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
> > +		ret = dai_register_cbs[i](afe);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "dai register i
> > %d fail\n", i);
> > +	}
> > +
> > +	/* init dai_driver and component_driver */
> > +	ret = mtk_afe_combine_sub_dai(afe);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "mtk_afe_combine_sub_dai
> > fail\n");
> > +
> > +	/* reset controller to reset audio regs before regmap cache */
> > +	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
> > +	if (IS_ERR(rstc))
> > +		return dev_err_probe(dev, PTR_ERR(rstc), "could not get
> > audiosys reset\n");
> > +
> > +	ret = reset_control_reset(rstc);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to trigger audio
> > reset\n");
> > +
> > +	/* enable clock for regcache get default value from hw */
> > +	afe_priv->pm_runtime_bypass_reg_ctl = true;
> 
> 
> > +	pm_runtime_enable(dev);
> 
> What about....
> 
> 	ret = devm_pm_runtime_enable(dev);
> 	if (ret)
> 		return ret;
> 
> 	ret = pm_runtime_resume_and_get(dev);
> 	if (ret)
> 		return dev_err_probe(dev, ret, "failed to resume
> device\n");
> 

Yes, pm_runime_resume_and_get() will do error when
pm_runtime_get_sync().

> > +	ret = pm_runtime_get_sync(dev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to resume device: %d\n", ret);
> > +		goto err_pm_disable;
> > +	}
> > +
> > +	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
> > +					    &mt8186_afe_regmap_config);
> > +	if (IS_ERR(afe->regmap)) {
> > +		ret = PTR_ERR(afe->regmap);
> > +		goto err_pm_disable;
> > +	}
> > +
> > +	/* others */
> > +	afe->mtk_afe_hardware = &mt8186_afe_hardware;
> > +	afe->memif_fs = mt8186_memif_fs;
> > +	afe->irq_fs = mt8186_irq_fs;
> > +	afe->get_dai_fs = mt8186_get_dai_fs;
> > +	afe->get_memif_pbuf_size = mt8186_get_memif_pbuf_size;
> > +
> > +	afe->runtime_resume = mt8186_afe_runtime_resume;
> > +	afe->runtime_suspend = mt8186_afe_runtime_suspend;
> > +
> > +	/* register platform */
> > +	dev_info(dev, "%s(), devm_snd_soc_register_component\n",
> > __func__);
> 
> This should be dev_dbg().
> 
Got it.
> > +
> > +	ret = devm_snd_soc_register_component(dev,
> > +					      &mt8186_afe_component,
> > +					      afe->dai_drivers,
> > +					      afe->num_dai_drivers);
> > +	if (ret) {
> > +		dev_err(dev, "err_dai_component\n");
> > +		goto err_pm_disable;
> > +	}
> > +
> > +	ret = pm_runtime_put_sync(dev);
> > +	if (ret) {
> > +		pm_runtime_get_noresume(dev);
> > +		dev_err(dev, "failed to suspend device: %d\n", ret);
> > +		goto err_pm_disable;
> > +	}
> > +	afe_priv->pm_runtime_bypass_reg_ctl = false;
> > +
> > +	regcache_cache_only(afe->regmap, true);
> > +	regcache_mark_dirty(afe->regmap);
> > +
> > +	return 0;
> > +
> > +err_pm_disable:
> > +	pm_runtime_put_noidle(dev);
> > +	pm_runtime_set_suspended(dev);
> > +	pm_runtime_disable(dev);
> 
> ...and then, since we're using devm_pm_runtime_enable, this call to
> pm_runtime_disable() can be removed.
> 

Yes, we can remove this 4 lines if we use devm_pm_runtime_enable() and
pm_runime_resume_and_get().

> > +
> > +	return ret;
> > +}
> > +
> > +static int mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
> > +{
> > +	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
> > +
> > +	pm_runtime_disable(&pdev->dev);
> 
> Here too.
> 

Got it.
> 
> Regards,
> Angelo

