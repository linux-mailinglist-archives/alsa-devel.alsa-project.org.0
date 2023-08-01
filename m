Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C482876B1F8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 12:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B2973E7;
	Tue,  1 Aug 2023 12:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B2973E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690886139;
	bh=ygFvzkdllHSVTixpyWMHMZTeok33M88MJxiWjZ9DrNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cC9zJCqdricKETFKvdIZAU0he+nEZ8F3bfwhy8fdWx9bQSHhF6yfB3I+yw1tLeP6c
	 /RZKMxbZAILApoEa1t9M6/jrv8CaSIT/FX1//cHIhhsRRnRGtgdYGur97Xd2NSYfzk
	 FSO5PlBBWYM8E9pz7FzMwr7uOYGDrDkMzQN3qJok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A42CEF80087; Tue,  1 Aug 2023 12:34:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52429F8016D;
	Tue,  1 Aug 2023 12:34:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69A6EF801D5; Tue,  1 Aug 2023 12:34:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4660AF80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 12:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4660AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256
 header.s=20171124 header.b=Us+lwVnb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=F1Sz0ae4nr5z1N2NijC/jAEv5RJWJxIOfwa338xwclg=; b=Us+lwVnb/LgpA8dbty/0XeNHRu
	/ZsdCPMPAMMyQgY18YVJaUmBz7DBcJxUJTvhONLvkm4MAPTiIViAvrWQtQqe2/PYnchcoYAwcun13
	e0pxg36/GxLW7aMHGLvodGw2bLi+2F8kz/OozrgCcY7CG2e1Uag0KBAexqau2le6y10s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qQmhr-002nBv-2P; Tue, 01 Aug 2023 12:34:23 +0200
Date: Tue, 1 Aug 2023 12:34:23 +0200
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
Subject: Re: [PATCH v2 00/28] Add support for QMC HDLC, framer infrastruture
 and PEF2256 framer
Message-ID: <4eef1cf6-ace4-417f-a0ba-ec13331c8eaf@lunn.ch>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726150225.483464-1-herve.codina@bootlin.com>
Message-ID-Hash: RAX6S26S5YJGK74PH5FW4W4Y5Z6CQUF7
X-Message-ID-Hash: RAX6S26S5YJGK74PH5FW4W4Y5Z6CQUF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAX6S26S5YJGK74PH5FW4W4Y5Z6CQUF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> The generic framer has:
>  - 2 consumers (QMC HDLC drv and codec)
>  - 1 provider (PEF2256)
> 
> So, the design is the following:
>                         +------------------+           +---------+
>                         | QMC              | <- TDM -> | PEF2256 | <-> E1
>      +---------+        |  +-------------+ |           |         |
>      | CPU DAI | <-data--> | QMC channel | |           |         |
>      +---------+        |  +-------------+ |           |         |
> +--------------+        |  +-------------+ |           |         |
> | QMC HDLC drv | <-data--> | QMC channel | |           |         |
> +--------------+        |  +-------------+ |           |         |
>      ^                  +------------------+           |         |
>      |   +--------+     +-------------+                |         |
>      +-> | framer | <-> | PEF2256 drv | <- local bus ->|         |
>          |        |     |             |                +---------+
>      +-> |        |     |             |
>      |   +--------+     |  +-------+  |
>      +-------------------> | codec |  |
>                         |  +-------+  |
>                         +-------------+

Thanks for adding the framer framework. I did not look into all the
details, but the basic design looks good.

	 Andrew
