Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A95C48DDDB
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 19:48:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CAA2075;
	Thu, 13 Jan 2022 19:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CAA2075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642099720;
	bh=szWIdMEQGwG7a5XPFaaKP+mai32KTKLbDqKzV+LlJXU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F8ZYbf+kS+Sj/WMOD+oXS4R+arBq1qO63/cNbYzf69tkTzRZrCUpaTWU2LNr8rG6p
	 D1NQHA3Zeu6DV9B0KqRW4Ym6w0hfxQN8FdlCaLklZh5MnZzm81fGMJrkiC8d1O+ERn
	 gOnOz3ZWk8n5gMiFfCg9SAx/E/dwcglBzzGHOQ1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99523F80141;
	Thu, 13 Jan 2022 19:47:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB63CF8013F; Thu, 13 Jan 2022 19:47:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF2BF80054;
 Thu, 13 Jan 2022 19:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF2BF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YeiLJ/q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642099648; x=1673635648;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=szWIdMEQGwG7a5XPFaaKP+mai32KTKLbDqKzV+LlJXU=;
 b=YeiLJ/q1EescFwFEaiO44jZ32tqO7bQB3/cfQR/stxuAm5inRtzOsdWX
 U7w5IOFDjjXFRgdrtsKYLgwKdwoUrAVfQJKjxr+8GD1hEBcPos2gtVgK2
 WWwWcYjU8smaDSWLrSZNcoP1NLlkT3HpDKifuR/DtZWmcGVcsf6Ytfzhq
 10zSKbEiphtbrZZGBVo8kGBfapsFptVI0fbmRe5SQzzAWbgNgZS6xenIS
 oLbJ6nR5AYzxy8mDBYM+eNM9t4tXd4L8qOevqmbvaeHq3YNgmAy/qnSVl
 BtdKhGhBkISjEZwAxFBRQ9iLZrbcXN00UU/lyQS3rPOGu5coj7Gy4NIYn g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="224070353"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="224070353"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:47:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="620702034"
Received: from ypchen-mobl.amr.corp.intel.com (HELO [10.212.66.70])
 ([10.212.66.70])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 10:47:20 -0800
Subject: Re: [PATCH v13 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220113082103.27911-1-allen-kh.cheng@mediatek.com>
 <20220113082103.27911-3-allen-kh.cheng@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c876eda8-1fde-6c40-117a-12dde042780d@linux.intel.com>
Date: Thu, 13 Jan 2022 12:47:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113082103.27911-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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



> +static int mtk_adsp_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_adsp_mbox_priv *priv;
> +	const struct mtk_adsp_mbox_cfg *cfg;
> +	struct mbox_controller *mbox;
> +	int ret, irq;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	mbox = &priv->mbox;
> +	mbox->dev = dev;
> +	mbox->ops = &mtk_adsp_mbox_chan_ops;
> +	mbox->txdone_irq = false;
> +	mbox->txdone_poll = true;
> +	mbox->of_xlate = mtk_adsp_mbox_xlate;
> +	mbox->num_chans = 1;
> +	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
> +	if (!mbox->chans)
> +		return -ENOMEM;
> +
> +	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->va_mboxreg))
> +		return PTR_ERR(priv->va_mboxreg);
> +
> +	priv->cfg = of_device_get_match_data(dev);

question: is any error handling needed here? some drivers do, others
don't, but that function can return NULL.

> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
> +					mtk_adsp_mbox_isr, IRQF_TRIGGER_NONE,
> +					dev_name(dev), mbox->chans);
> +	if (ret < 0)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	return devm_mbox_controller_register(dev, &priv->mbox);
> +}

