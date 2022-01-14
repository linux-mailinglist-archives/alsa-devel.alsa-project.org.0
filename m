Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4648E2EB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 04:17:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA9B21FC4;
	Fri, 14 Jan 2022 04:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA9B21FC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642130265;
	bh=pxiTwDB0j8aAmnBn/0lPe3/AsV6WScBgghVGFgNW8lk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m/MHkr5eebq9dKdPuiuMaXJfkug9M2eVUol+9OHS8jN/Nl1VO/gGsNZDpsQdc5FM1
	 3Qo/zGSvC51zJ5dawrZ9WkJbxbKZsaf+zsNEw0F87ccq0WjW8t9KZtk2lG55rrnxy2
	 0x1Q14i4NUhZe4ZXJWkb+XVcakNReGPjtM7EjU5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4DF9F8032B;
	Fri, 14 Jan 2022 04:16:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0348F8030F; Fri, 14 Jan 2022 04:16:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B81FF800CE;
 Fri, 14 Jan 2022 04:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B81FF800CE
X-UUID: b7b619940c684c45b1d1379930c436c8-20220114
X-UUID: b7b619940c684c45b1d1379930c436c8-20220114
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1255384183; Fri, 14 Jan 2022 11:16:23 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Jan 2022 11:16:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 11:16:21 +0800
Message-ID: <bc5f284872c44c6fa9f5eb6bb7a49db5ff6e0794.camel@mediatek.com>
Subject: Re: [PATCH v13 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Fri, 14 Jan 2022 11:16:21 +0800
In-Reply-To: <c876eda8-1fde-6c40-117a-12dde042780d@linux.intel.com>
References: <20220113082103.27911-1-allen-kh.cheng@mediatek.com>
 <20220113082103.27911-3-allen-kh.cheng@mediatek.com>
 <c876eda8-1fde-6c40-117a-12dde042780d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

On Thu, 2022-01-13 at 12:47 -0600, Pierre-Louis Bossart wrote:
> > +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct mtk_adsp_mbox_priv *priv;
> > +	const struct mtk_adsp_mbox_cfg *cfg;
> > +	struct mbox_controller *mbox;
> > +	int ret, irq;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	mbox = &priv->mbox;
> > +	mbox->dev = dev;
> > +	mbox->ops = &mtk_adsp_mbox_chan_ops;
> > +	mbox->txdone_irq = false;
> > +	mbox->txdone_poll = true;
> > +	mbox->of_xlate = mtk_adsp_mbox_xlate;
> > +	mbox->num_chans = 1;
> > +	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans),
> > GFP_KERNEL);
> > +	if (!mbox->chans)
> > +		return -ENOMEM;
> > +
> > +	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(priv->va_mboxreg))
> > +		return PTR_ERR(priv->va_mboxreg);
> > +
> > +	priv->cfg = of_device_get_match_data(dev);
> 
> question: is any error handling needed here? some drivers do, others
> don't, but that function can return NULL.
> 

Hi Pierre,

Thanks for your question.

I prefer my previous version which check NULL from
of_device_get_match_data.

I will revert this part in the next version.

Thanks.

> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
> > +					mtk_adsp_mbox_isr,
> > IRQF_TRIGGER_NONE,
> > +					dev_name(dev), mbox->chans);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	return devm_mbox_controller_register(dev, &priv->mbox);
> > +}
> 
> 

