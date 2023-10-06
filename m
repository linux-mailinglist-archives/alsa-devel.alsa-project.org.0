Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C57BC191
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 23:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2A551EB;
	Fri,  6 Oct 2023 23:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2A551EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696628923;
	bh=7ShH9lM/jTtdIpDBd5tkXIdLZJ6EOzXUhDKKnj55xPo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ST3+PzaDCx6JRwSsbslXjqjqsJHrNdLmxZ26yCPmzM1/0NaR1cbdvTopEfPbf7LW/
	 A9JX40FPO8WVHBm7zLsUzerwPQONz77k6DSzlUWpb2r1SZB4tP4+OQzob7Ip8MOAKZ
	 MSR5aprsHn6OGEP0ImOeC5Lqf6I9btnaLEIylqPw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 348B2F8055A; Fri,  6 Oct 2023 23:47:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A5CDF80310;
	Fri,  6 Oct 2023 23:47:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 493C8F8047D; Fri,  6 Oct 2023 23:47:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43352F80166
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 23:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43352F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UIB5D7QU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CD072B82A90;
	Fri,  6 Oct 2023 21:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B17AC433C7;
	Fri,  6 Oct 2023 21:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696628829;
	bh=7ShH9lM/jTtdIpDBd5tkXIdLZJ6EOzXUhDKKnj55xPo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UIB5D7QUgappiPLI6dOoUHSxvt5YAjXDxSa8MYt3/cAFv/c5IHJYHnYTPpU858ZTu
	 ClL/Cf8dYmT/K2AsekQJqM/9c+T/Lu+ejjHS7ojVK3HC8q8o9i3501u//0M0XEEIUA
	 kQhpB665WwNyXG+96GLLJwQmYMwetRfLQ0qkrS4cswc44g/UYawosmoi4NMFiFOe4q
	 duYX45Tg97UhJ6fdrukD6yY2MmoCfaH9XlYzON02quQybVLTyXOqpCIZOPLdLN7pvz
	 WNUh6/12mNBI+Q820T8snzNGUsqfrHG91QPyG1E9MvoRh77CxpA+aVQH87ZXbvLdOH
	 hY2YnF6sVQk4Q==
Date: Fri, 6 Oct 2023 14:47:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
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
Message-ID: <20231006144702.778c165e@kernel.org>
In-Reply-To: <20230928070652.330429-11-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-11-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VIJL7GT2B5XJFAGO7ETCW5VLV5CVCBKB
X-Message-ID-Hash: VIJL7GT2B5XJFAGO7ETCW5VLV5CVCBKB
X-MailFrom: kuba@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIJL7GT2B5XJFAGO7ETCW5VLV5CVCBKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Sep 2023 09:06:28 +0200 Herve Codina wrote:
> +static int qmc_hdlc_close(struct net_device *netdev)
> +{
> +	struct qmc_hdlc *qmc_hdlc = netdev_to_qmc_hdlc(netdev);
> +	struct qmc_hdlc_desc *desc;
> +	int i;
> +
> +	netif_stop_queue(netdev);
> +
> +	qmc_chan_stop(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);
> +	qmc_chan_reset(qmc_hdlc->qmc_chan, QMC_CHAN_ALL);

stopping the queue looks a bit racy, a completion may come in 
and restart the queue

> +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->tx_descs); i++) {
> +		desc = &qmc_hdlc->tx_descs[i];
> +		if (!desc->skb)
> +			continue;
> +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> +				 DMA_TO_DEVICE);
> +		kfree_skb(desc->skb);
> +		desc->skb = NULL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(qmc_hdlc->rx_descs); i++) {
> +		desc = &qmc_hdlc->rx_descs[i];
> +		if (!desc->skb)
> +			continue;
> +		dma_unmap_single(qmc_hdlc->dev, desc->dma_addr, desc->dma_size,
> +				 DMA_FROM_DEVICE);
> +		kfree_skb(desc->skb);
> +		desc->skb = NULL;
> +	}
> +
> +	hdlc_close(netdev);
