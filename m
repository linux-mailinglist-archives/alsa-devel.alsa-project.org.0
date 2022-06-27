Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B855B5C1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 05:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CE61163A;
	Mon, 27 Jun 2022 05:45:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CE61163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656301590;
	bh=VsSkjuTW0qkOUdCKfS9NkKRevQzyFh2KK3vbxaTclRo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i02vuBqLHKk/tgX1u9RHah7m+ptLTZPwbmx1tBpzsY8USw8PJgVWY6xRFtQDc8IUU
	 ETa5qamGq5nUxgtxxvYarMFPlXqhO9I+x/faDqd8Kgr5+wLjP7IOv1rQTQUC3mkYkq
	 5m6mWvWKWYKWtLByzNODUI9nJZBs30JWsLDqfj2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D784EF8012F;
	Mon, 27 Jun 2022 05:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B23F8028B; Mon, 27 Jun 2022 05:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D284AF80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 05:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D284AF80128
X-UUID: 5064477c997c454198d19c9dfe5b21a7-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:a934aced-345c-4c12-9513-9c7afa99f14a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:501192ea-f7af-4e69-92ee-0fd74a0c286c,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 5064477c997c454198d19c9dfe5b21a7-20220627
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 15901680; Mon, 27 Jun 2022 11:45:14 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 27 Jun 2022 11:45:13 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 11:45:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 11:45:12 +0800
Message-ID: <d89fc641de1c73bbb9680db8a19c6c361bd71682.camel@mediatek.com>
Subject: Re: [PATCH v8 2/8] ASoC: mediatek: mt8186: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 27 Jun 2022 11:45:12 +0800
In-Reply-To: <c8b888fc-dff9-c278-da10-6883c4277289@wanadoo.fr>
References: <20220625190852.29130-1-jiaxin.yu@mediatek.com>
 <20220625190852.29130-3-jiaxin.yu@mediatek.com>
 <c8b888fc-dff9-c278-da10-6883c4277289@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Sun, 2022-06-26 at 10:33 +0200, Christophe JAILLET wrote:
> Le 25/06/2022 à 21:08, Jiaxin Yu a écrit :
> > Add mt8186 platform and affiliated driver.
> > 
> > Signed-off-by: Jiaxin Yu <
> > jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   sound/soc/mediatek/Kconfig                    |   12 +
> >   sound/soc/mediatek/Makefile                   |    1 +
> >   sound/soc/mediatek/mt8186/Makefile            |   19 +
> >   sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
> >   .../soc/mediatek/mt8186/mt8186-afe-control.c  |  255 ++
> >   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3011
> > +++++++++++++++++
> >   6 files changed, 3533 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/Makefile
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> 
> [...]
> 
> > +	MT8186_DAI_HOSTLESS_SRC_AAUDIO,
> > +	MT8186_DAI_HOSTLESS_SRC_1,	/* just an exmpale */
> 
> example?
Yes, it's a typo. In fact, I should remove this description.
> 
> > +	MT8186_DAI_HOSTLESS_SRC_BARGEIN,
> > +	MT8186_DAI_HOSTLESS_UL1,
> 
> [...]
> 
> > +#define MTK_SPK_I2S_0_STR "MTK_SPK_I2S_0"
> > +#define MTK_SPK_I2S_1_STR "MTK_SPK_I2S_1"
> > +#define MTK_SPK_I2S_2_STR "MTK_SPK_I2S_2"
> > +#define MTK_SPK_I2S_3_STR "MTK_SPK_I2S_3"
> 
> Out of curiosity, why no 4?
> Or, if related to mtk_spk_i2s_type below, why  6, 7, 8 and 9?

Because the MT8186 don't have I2S4 hardware, so we continued to use the
hardware name and skipped the number 4.
However, the MT8186 does not have I2S 5/6/7/8/9, I will remove these.

> 
> > +#define MTK_SPK_I2S_5_STR "MTK_SPK_I2S_5"
> > +#define MTK_SPK_I2S_6_STR "MTK_SPK_I2S_6"
> > +#define MTK_SPK_I2S_7_STR "MTK_SPK_I2S_7"
> > +#define MTK_SPK_I2S_8_STR "MTK_SPK_I2S_8"
> > +#define MTK_SPK_I2S_9_STR "MTK_SPK_I2S_9"
> > +
> 
> [...]
> 
> > +
> > +enum mtk_spk_i2s_type {
> > +	MTK_SPK_I2S_TYPE_INVALID = -1,
> > +	MTK_SPK_I2S_0,
> > +	MTK_SPK_I2S_1,
> > +	MTK_SPK_I2S_2,
> > +	MTK_SPK_I2S_3,
> > +	MTK_SPK_I2S_5,
> > +	MTK_SPK_I2S_TYPE_NUM
> > +};
> 
> [...]
> 
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
> 
> There is a mt8186_deinit_clock() call in the remove function.
> Should this also be called in the error handling path below?
> Or should a devm_add_action_or_reset() be used to ease error
> handling?
> 

Yes, mt8186_deinit_clock() is required in the error handling path.
I prefer to use devm_add_action_or_reset(), thank you for your comment.

> > +
> > +	/* init memif */
> > +	afe->memif_32bit_supported = 0;
> > +	afe->memif_size = MT8186_MEMIF_NUM;
> > +	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe-
> > >memif),
> > +				  GFP_KERNEL);
> > +
> 
> Nit: no need for an empty line here.
> 

Got it.

> > +	if (!afe->memif)
> > +		return -ENOMEM;
> > +
> 
> [...]
> 
> > +
> > +	return 0;
> > +
> > +err_pm_disable:
> > +	pm_runtime_put_noidle(dev);
> > +	pm_runtime_set_suspended(dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
> > +{
> > +	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
> > +
> > +	if (!pm_runtime_status_suspended(&pdev->dev))
> > +		mt8186_afe_runtime_suspend(&pdev->dev);
> 
> Out of curiosity, is it normal to have some pm_runtime related code
> here 
> that does not look the same as the one in the error handling of the
> probe?
> (I don't know much about pm, but usually, .remove() functions and
> error 
> handling in the probe look quite close)
> 

As I understand it, the .probe() function is like below:

    1. allocate resources and initialize them
    2. devm_pm_runtime_enable(dev);
    3. pm_runtime_resume_and_get(dev); /* execute the runtime_resume
callback */
    4. do regmap init that must power on the regulator and clock
    5. pm_runtime_put_sync(dev); /* execute the runtime_suspend
callback */

So the error handling is to process the errors from step 4/5. If the
.probe() executes normally, the dev is in runtime suspend status. And
we used devm_pm_runtime_enbale(), so maybe we don't need to do anything
to the pm_runtime_xxx in the .remove() callback?

Does this condition never established?
	if (!pm_runtime_status_suspended(&pdev->dev))
                mt8186_afe_runtime_suspend(&pdev->dev);

> > +
> > +	mt8186_deinit_clock(afe);
> > +
> > +	return 0;
> > +}
> > +
> 
> [...]

