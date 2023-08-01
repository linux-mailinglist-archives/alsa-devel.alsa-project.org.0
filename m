Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4776B05B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4A7832;
	Tue,  1 Aug 2023 12:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4A7832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690884442;
	bh=eQTgs8FKuiZydJQj7DwowISPc1txqUQxrQBIsCOYi5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=adMyb+hg0Kxg5mluy6wUjC1dLr/wYiIn+LcOghAN0UObsFtgT7s+8Zor1gFRagKDL
	 qP0AxljzoZKvEHjLpVd/73ar3TrkOvR3d4OFtHDcnEmE/WA/eNLFulaD8l4sR0mBxm
	 WCPLlmWdD8eT42EZIQqTLnnSHoJRu2REioU+V9Sw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54F82F80553; Tue,  1 Aug 2023 12:05:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14206F80548;
	Tue,  1 Aug 2023 12:05:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B508EF80549; Tue,  1 Aug 2023 12:05:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 547AAF8015B
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 547AAF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=fTXrG7XZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q+X3WCccFUeGIsOhlOlB9RAX5Dw3QmtY3X/0JwwsmSw=; b=fTXrG7XZDYijp/oK67zpTYJNOu
	21yO8JAjmKqbe8n1C0lJBnSmyu+tcZDut3qwcSQel0tKTpDPKkBHbDcFCIZo1VBYP8/F3qFY3SwVv
	Q+ozdrXiyFR8IEKG9XCcyFO4FcBraXRaKk7I1X5jRn2zbGKvoOdmDzyV70LYCS5xZxr4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qQmFX-002mrF-NH; Tue, 01 Aug 2023 12:05:07 +0200
Date: Tue, 1 Aug 2023 12:05:07 +0200
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
Subject: Re: [PATCH v2 21/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <1f5fbf0a-90fe-491a-91c6-31fefd4b786f@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-22-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-22-herve.codina@bootlin.com>
Message-ID-Hash: DYRZ4Y4XPU7ZPGSQBK4TMEHG7HZLQMTU
X-Message-ID-Hash: DYRZ4Y4XPU7ZPGSQBK4TMEHG7HZLQMTU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DYRZ4Y4XPU7ZPGSQBK4TMEHG7HZLQMTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> +  clocks:
> +    items:
> +      - description: Master clock
> +      - description: Receive System Clock
> +      - description: Transmit System Clock
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +      - const: sclkr
> +      - const: sclkx

Nit pick, but "Receive System Clock", but "sclkr'. Maybe "System Clock
Receive" so you have the same word order?

	 Andrew
