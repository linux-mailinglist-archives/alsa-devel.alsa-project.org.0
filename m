Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA87BE2BC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 16:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DF1E75;
	Mon,  9 Oct 2023 16:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DF1E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696861681;
	bh=ljxI79VSLdpuEWZfBxqV1cAB7oJH2+DiQSs7TZlu8+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bO8WdSQg5ixCow0IG8UXLoE87nf5YGsafXDAFw72oyf+3duQj6PJ034Zt8X4U/5Pb
	 hlovbTEgXZuHp1rI9KgrK444ar/5ufSIADu/e7BzMohHyxBbgSjLOzDMjcVfmNQeYg
	 8A2WcLefD4PbPmfJxLymYlzJk/2y4OqxkOoQrsdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37DAFF80166; Mon,  9 Oct 2023 16:26:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CCA6F80130;
	Mon,  9 Oct 2023 16:26:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4FC4F802BE; Mon,  9 Oct 2023 16:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60B97F80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 16:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B97F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ptdUM/7c
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E7FF60003;
	Mon,  9 Oct 2023 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696861598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=92a8cVu3f6Pk3ndmVwnkeBH7DnuU13PZsLWlEFgkb+8=;
	b=ptdUM/7cMSJVYbBrfF6v7pOBngBBoqD2a0R/MUuEMeanPcoDEjfHKfSoM8A8bH79+drPz+
	rV97RU0p5QyeWtYFPXNPPjzGoSwoAmb7zdtM9zta8Rt3qazcKpntePvK1epyDuMN8Yy2hm
	c/19/YApYNnYXqqPcSlzxHZDNltzGOFF0avCXI1W6tyEQLx7YzapC/yKZuEgCSulDYhE2G
	tiyCi8WMCoTIVnh6t72FOyCiEhCyW0D3+DoI+D5rSdROAfpCBAIJTfQNC5r7tEla35zU7C
	xa3pdnMAu7WiFZoTgbzZKx+vu0/qFQeygmLxg4z1lzB3Rw48ksl43ELSnmswNA==
Date: Mon, 9 Oct 2023 16:26:32 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Simon
 Horman <horms@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 10/30] net: wan: Add support for QMC HDLC
Message-ID: <20231009162632.7f11a6d9@bootlin.com>
In-Reply-To: <20231006144702.778c165e@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-11-herve.codina@bootlin.com>
	<20231006144702.778c165e@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: AKSRLKIX5PJMKWTLWK4EGYCTUPH7HHZV
X-Message-ID-Hash: AKSRLKIX5PJMKWTLWK4EGYCTUPH7HHZV
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKSRLKIX5PJMKWTLWK4EGYCTUPH7HHZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Jakub,

On Fri, 6 Oct 2023 14:47:02 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 28 Sep 2023 09:06:28 +0200 Herve Codina wrote:
> > +static int qmc_hdlc_close(struct net_device *netdev)
> > +{
> > +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> > +	struct qmc_hdlc_desc *desc;
> > +	int i;
> > +
> > +	netif_stop_queue(netdev);
> > +
> > +	qmc_chan_stop(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
> > +	qmc_chan_reset(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);  
> 
> stopping the queue looks a bit racy, a completion may come in 
> and restart the queue

Indeed, qmc_hdlc_xmit_complete() completion can restart the queue.

I will call netif_stop_queue() after calling qmc_chan_stop/reset().
This is the simple way to fix that without adding an internal flag.

Thanks for pointing that.

Best regards,
Hervé

> 
> > +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->tx_descs); i++) {
> > +		desc = &qmc_hdlc->tx_descs[i];
> > +		if (!desc->skb)
> > +			continue;
> > +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> > +				 DMA_TO_DEVICE);
> > +		kfree_skb(desc->skb);
> > +		desc->skb = NULL;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
> > +		desc = &qmc_hdlc->rx_descs[i];
> > +		if (!desc->skb)
> > +			continue;
> > +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> > +				 DMA_FROM_DEVICE);
> > +		kfree_skb(desc->skb);
> > +		desc->skb = NULL;
> > +	}
> > +
> > +	hdlc_close(netdev);  
