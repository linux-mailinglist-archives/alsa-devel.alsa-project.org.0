Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FCD764F85
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 11:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607D9844;
	Thu, 27 Jul 2023 11:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607D9844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690449820;
	bh=brE446l0NnbsBdNTMz1eRg2anjy9QOxiUBOilEyPeeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jDTlDWX271X8OPkH1juq22gAhNvwhx1mDBdcLMSmzscwLhg3QRk3nEJH9+9XHxFth
	 cTVMLBQFUb+nHncrwpAqpbksg72oXfVvquShdT469QyByF7WhP8IlyKxmcGbJ4rPUb
	 mqcBu94r/Iq0xWoxhu4CQmRb8yJ41M786X5zVAbc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 279DAF8019B; Thu, 27 Jul 2023 11:22:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B098CF80163;
	Thu, 27 Jul 2023 11:22:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 642CCF8019B; Thu, 27 Jul 2023 11:22:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CB20F80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 11:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CB20F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YRHlRDEe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD68E61DE1;
	Thu, 27 Jul 2023 09:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5763DC433C7;
	Thu, 27 Jul 2023 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690449738;
	bh=brE446l0NnbsBdNTMz1eRg2anjy9QOxiUBOilEyPeeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YRHlRDEeh2LbCOuSCaecwWzcjh/d/VRacQTDWyJZtGVeSclDSuaWppMwW2Jwuabcz
	 j5H7GBDTiQkLArSUNoX7MVpsKX2Jx4U81JMF9wSXoAGyrU/kkr9qOadAHd7qFHtqXe
	 lEuJpA10KIyKZn+bcTrj2P56hBcPXOsombqB+jeAX8sEO+SUUW1IBVCbkYO/j8vZmJ
	 MKJ3XXz6A0l3S/S3CuGJyywmVXvgaHYFDFetAI+ylH2b/wCW/iE/B/E4CklyuK25pG
	 U3/MVc260hsoEO5Fn78tyPIrcubBH49N5rNivS/jrIZsL6vBuu7n2qVTMKCFErFDvn
	 8kVC0m+MhinKQ==
Date: Thu, 27 Jul 2023 10:22:09 +0100
From: Lee Jones <lee@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 22/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Message-ID: <20230727092209.GA8175@google.com>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-23-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230726150225.483464-23-herve.codina@bootlin.com>
Message-ID-Hash: XKNVHFDBDZZAN2BNP47REW6JJYIONDPJ
X-Message-ID-Hash: XKNVHFDBDZZAN2BNP47REW6JJYIONDPJ
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKNVHFDBDZZAN2BNP47REW6JJYIONDPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Jul 2023, Herve Codina wrote:

> The loop searching for a matching device based on its compatible
> string is aborted when a matching disabled device is found.
> This abort avoid to add devices as soon as one disabled device
> is found.
> 
> Continue searching for an other device instead of aborting on the
> first disabled one fixes the issue.
> 
> Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/mfd/mfd-core.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
> index 0ed7c0d7784e..bcc26e64639a 100644
> --- a/drivers/mfd/mfd-core.c
> +++ b/drivers/mfd/mfd-core.c
> @@ -146,6 +146,7 @@ static int mfd_add_device(struct device *parent, int id,
>  	struct platform_device *pdev;
>  	struct device_node *np = NULL;
>  	struct mfd_of_node_entry *of_entry, *tmp;
> +	bool disabled;
>  	int ret = -ENOMEM;
>  	int platform_id;
>  	int r;
> @@ -181,13 +182,13 @@ static int mfd_add_device(struct device *parent, int id,
>  		goto fail_res;
>  
>  	if (IS_ENABLED(CONFIG_OF) && parent->of_node && cell->of_compatible) {
> +		disabled = false;

This does not appear to reside in a loop.

Why not set it to false on declaration?

>  		for_each_child_of_node(parent->of_node, np) {
>  			if (of_device_is_compatible(np, cell->of_compatible)) {
> -				/* Ignore 'disabled' devices error free */
> +				/* Skip 'disabled' devices */
>  				if (!of_device_is_available(np)) {
> -					of_node_put(np);

Doesn't this result in a resource leak?

> -					ret = 0;
> -					goto fail_alias;
> +					disabled = true;
> +					continue;
>  				}
>  
>  				ret = mfd_match_of_node_to_dev(pdev, np, cell);
> @@ -197,10 +198,17 @@ static int mfd_add_device(struct device *parent, int id,
>  				if (ret)
>  					goto fail_alias;
>  
> -				break;
> +				goto match;
>  			}
>  		}
>  
> +		if (disabled) {
> +			/* Ignore 'disabled' devices error free */
> +			ret = 0;
> +			goto fail_alias;
> +		}
> +
> +match:
>  		if (!pdev->dev.of_node)
>  			pr_warn("%s: Failed to locate of_node [id: %d]\n",
>  				cell->name, platform_id);
> -- 
> 2.41.0
> 

-- 
Lee Jones [李琼斯]
