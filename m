Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7A0777CA2
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 17:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EC83823;
	Thu, 10 Aug 2023 17:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EC83823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691682564;
	bh=IhSS+Gzq9OcK1ql5cyEbAn3ygO8llggcsc2KQLqvMkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ogg9FQNuSoUP6yDUq1yDW/IwQRDYlyIfnBj9Qq1WYV9a/7ChPF7fkSibpwMK/VFsL
	 Mljs3x9ZFpq5C5Du+hjk/dZG9E4WFuMx0ruErQdW0ZWME+NdQKOdvU3Eb7CF2CfIs0
	 dK0wh0QPdZXjgbeaJ5YY8NllmWwSFbHIx6TRbzeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F53FF80166; Thu, 10 Aug 2023 17:48:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70445F80166;
	Thu, 10 Aug 2023 17:48:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A462F8016E; Thu, 10 Aug 2023 17:48:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EE76F800EE
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 17:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE76F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HKVJBPVI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86E78638B8;
	Thu, 10 Aug 2023 15:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C91C433C7;
	Thu, 10 Aug 2023 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691682480;
	bh=IhSS+Gzq9OcK1ql5cyEbAn3ygO8llggcsc2KQLqvMkQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HKVJBPVILtGjaC3mXfV61EVcGPf6DXaqle9TFghct4pX5yjDFaMFifWcgHnrtNkZX
	 uu4crxxP79VILE2yvP8vZF1+6OnXPjZh+P03ynl7KcwkhiIK4A0GGfNpJuHWMClxEM
	 gF1EhHXmuYlAoiqNfthZPiWy6pTBeDKmoayE0/7uIin6fDsKDxEYodpYlustac55bi
	 kTAgiWH6fJRR/Emv6fJkjLX9krk9TbhSzrZDyL917VRz1CcFgJD0KqnS8BYI8Kj+7n
	 BII24XVDFE5B3Y/CpH1l5HWyBVYR6TeXUIqucIVz4+3EJuMsvoSoyvW0/3OodMlpsM
	 OgjGTfouHcUlw==
Date: Thu, 10 Aug 2023 08:47:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 00/28] Add support for QMC HDLC, framer infrastruture
 and PEF2256 framer
Message-ID: <20230810084758.2adbfeb8@kernel.org>
In-Reply-To: <20230809132757.2470544-1-herve.codina@bootlin.com>
References: <20230809132757.2470544-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UQOAQVPFUK4VNP7LQJ7ER7ZD7PRK5KFB
X-Message-ID-Hash: UQOAQVPFUK4VNP7LQJ7ER7ZD7PRK5KFB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQOAQVPFUK4VNP7LQJ7ER7ZD7PRK5KFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed,  9 Aug 2023 15:27:27 +0200 Herve Codina wrote:
> The series contains the full story and detailed modifications.
> If needed, the series can be split and/or commmits can be squashed.
> Let me know.

Are there any dependencies in one of the -next trees?
As it the series doesn't seem to build on top of net-next 
with allmodconfig.
