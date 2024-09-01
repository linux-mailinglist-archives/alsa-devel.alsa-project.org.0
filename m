Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5139996C186
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 16:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D520386E;
	Wed,  4 Sep 2024 16:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D520386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725461932;
	bh=7/pXSxW79joSiseYS8HmEM3FxeRV8+V7Nez80v4KWYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pzos5cWO8JWcMzuNYsGlTW+nvylhgCH9rM6+Ty9ej4rzDEJB1+Wus31oZw4NjWel/
	 VbBZnEwMjins1uQrfTqRdaG3j2xKezK78nc/ruuwir2maYDBaaSLxHTEfbsZkFtkgJ
	 3//sJdDLOpqQpcp3+bsLCfRJB3vJ8nUe8qW1oIy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16C01F805FA; Wed,  4 Sep 2024 16:58:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 461BCF805E8;
	Wed,  4 Sep 2024 16:58:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AAEFF80217; Sun,  1 Sep 2024 03:16:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by alsa1.perex.cz (Postfix) with ESMTP id 06D37F80107
	for <alsa-devel@alsa-project.org>; Sun,  1 Sep 2024 03:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06D37F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256
 header.s=s110527 header.b=nVqYlVrc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Lzfe1+irGYJwXkhyIj4LhNfAhozYETplmmOeOoVgFxE=;
	b=nVqYlVrcgfW1Vyjm0RUub9Am6eCshi/K4kyNaTeUIBMttlL4ag85ujqZIXykR4
	ZjZ7MCU7NEcHKypFckWEtPyNJRHYZMqp/R4RCG0vejh/nABJ7BJKJXZ17wfH9KI9
	P4V08ZvQ3Wde2xUvGamoeJe8V4589iNqu6vDbZXGHaTh8=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXPzxzwNNmSFFBAA--.17452S3;
	Sun, 01 Sep 2024 09:16:37 +0800 (CST)
Date: Sun, 1 Sep 2024 09:16:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v7 0/2] ASoC: fsl-asoc-card: add S/PDIF controller support
Message-ID: <ZtPAc1iyGOKJtnNw@dragon>
References: <20240820112827.126380-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820112827.126380-1-elinor.montmasson@savoirfairelinux.com>
X-CM-TRANSID: Ms8vCgDXPzxzwNNmSFFBAA--.17452S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVTKZDUUUU
X-Originating-IP: [114.216.210.89]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAg9NZWbTjjJY3QAAsp
X-MailFrom: shawnguo2@yeah.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4CPUXQPZIA2WLRJL244SIIGMHDGWBJE4
X-Message-ID-Hash: 4CPUXQPZIA2WLRJL244SIIGMHDGWBJE4
X-Mailman-Approved-At: Wed, 04 Sep 2024 14:58:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CPUXQPZIA2WLRJL244SIIGMHDGWBJE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 20, 2024 at 01:28:25PM +0200, Elinor Montmasson wrote:
> Elinor Montmasson (2):
>   arm64: dts: imx8m: update spdif sound card node properties
>   ARM: dts: imx6: update spdif sound card node properties

Applied both, thanks!

