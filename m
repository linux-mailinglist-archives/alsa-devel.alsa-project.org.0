Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD476ADF3
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 11:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F06D820;
	Tue,  1 Aug 2023 11:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F06D820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690882495;
	bh=YMW8tAcOgTnYXC8nV6UZcXYyN3C7t3laKsHSKE2OFNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k/08NS8kzjQMPt21s121X0unfjIVnJRekEkL5j2Lp2MlM4Ei2ENsGFHgFcReUK8pk
	 xPR/q0X29gW4mzL38f1+5NZVOde5Wvv0N37QGfMPLasU2ESoTB0TIEjsXZX9RtAuK+
	 W7FVyULe/J2zW+px8ABoR4/6ePNFgYEsw1l60gcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ABC2F8016D; Tue,  1 Aug 2023 11:34:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6E9F8016D;
	Tue,  1 Aug 2023 11:34:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E9BF801D5; Tue,  1 Aug 2023 11:34:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DB18F80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 11:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DB18F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=cpjULsYI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SNYkC/g1c+YfS8ZTo9JQVhuDkdGL5+kyeQ/yUz57+AY=; b=cpjULsYII+lR9kpuqlTcGQ64zN
	YSf+oKkf8S3cxbtVU6PG3VprE3zGNQKRdFk4YRWAlLpSUWcI89OGnauzXWhFks7zwwPc6AgNlmSAM
	XSkvQCdoANl7AS3AScQk7zhRMqAUCtHM+WmJjXGc08EE+CSOX31TtFFEZBL4KJbm/B6E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qQll5-002mfV-Ob; Tue, 01 Aug 2023 11:33:39 +0200
Date: Tue, 1 Aug 2023 11:33:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
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
Subject: Re: [PATCH v2 08/28] soc: fsl: cpm1: qmc: Introduce available
 timeslots masks
Message-ID: <dd34fa03-0b34-44a4-9e70-9d9a69f95403@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-9-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-9-herve.codina@bootlin.com>
Message-ID-Hash: AC3UPFTMKIG2IVWSYG5QUBC7XB6UUNHQ
X-Message-ID-Hash: AC3UPFTMKIG2IVWSYG5QUBC7XB6UUNHQ
X-MailFrom: andrew@lunn.ch
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AC3UPFTMKIG2IVWSYG5QUBC7XB6UUNHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 26, 2023 at 05:02:04PM +0200, Herve Codina wrote:
> Available timeslots masks define timeslots available for the related
> channel. These timeslots are defined by the QMC binding.
> 
> Timeslots used are initialized to available timeslots but can be a
> subset of available timeslots.
> This prepares the dynamic timeslots management (ie. changing timeslots
> at runtime).
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/soc/fsl/qe/qmc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 2d2a9d88ba6c..21ad7e79e7bd 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -177,7 +177,9 @@ struct qmc_chan {
>  	struct qmc *qmc;
>  	void __iomem *s_param;
>  	enum qmc_mode mode;
> +	u64	tx_ts_mask_avail;
>  	u64	tx_ts_mask;
> +	u64	rx_ts_mask_avail;
>  	u64	rx_ts_mask;

Is this for E1? So there is a maximum of 32 slots? A u32 would be
sufficient i think?

	   Andrew
