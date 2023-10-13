Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1DD7C918A
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 01:47:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43ED5850;
	Sat, 14 Oct 2023 01:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43ED5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697240872;
	bh=I0Ybzefpb0f46pCoW0lXoe0QVolFQKp1by7iMXMV2ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sOWiGLbk9e/7w7w/ERTeY5EZZ9yTOF8Dlw/eS3jWYk+ZtxtX864Mrp0K0xGOMgVCI
	 x6ydhaZJW4uM6Zd8c2g5NXEB1flsKs/FKB9tE7FwZVdxlj89bn024KjgvbFZvYcln4
	 b6XYLRkBIkTpJN+t4hklC1kM2PXerHyzr8bUtU5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11A5EF802BE; Sat, 14 Oct 2023 01:47:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5347EF8027B;
	Sat, 14 Oct 2023 01:47:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66FBCF802BE; Sat, 14 Oct 2023 01:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9047F8019B
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 01:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9047F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lC51rbW1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2C4ECE31C3;
	Fri, 13 Oct 2023 23:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF9EC433C7;
	Fri, 13 Oct 2023 23:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697240810;
	bh=I0Ybzefpb0f46pCoW0lXoe0QVolFQKp1by7iMXMV2ig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lC51rbW1gspwCMSFrJZZKpFXg7hwiUBH02usnJhD4v+VeActrNiPIFdHj9RlFhcIO
	 OrnL8HaWjePfytoVvVqKd/HhDiXPeYY7lk1ZxdWxEXyatr1hXgkp9n7IUYwlypwC4n
	 0M3CV7Pq+jjkV3gaxEHD0prKTp+saM5DxkDMl3AaXnHCsGYqbgbk2l/TbdBO63wZif
	 7/CkacxbI+QhT3KnrqbGwNLiScxjQskkwXtU7yvDQsgk22IKrukuEL2XzEi104Npny
	 SQbjMVZC/WNa2BVJiSItinrMu0FI0V/yIfzrTnEqNw9u6gyALZLXMsA+Y7QwuYWImc
	 jms88xG498QjA==
Date: Fri, 13 Oct 2023 16:46:47 -0700
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
 alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231013164647.7855f09a@kernel.org>
In-Reply-To: <20231011061437.64213-1-herve.codina@bootlin.com>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MIOCSZKMXIJ5BZJ4HYLSWECMCI6AVYHC
X-Message-ID-Hash: MIOCSZKMXIJ5BZJ4HYLSWECMCI6AVYHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIOCSZKMXIJ5BZJ4HYLSWECMCI6AVYHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Oct 2023 08:14:04 +0200 Herve Codina wrote:
> Compare to the previous iteration
>   https://lore.kernel.org/linux-kernel/20230928070652.330429-1-herve.codina@bootlin.com/
> This v8 series:
>  - Fixes a race condition
>  - Uses menuconfig instead of menu and hides CONFIG_GENERIC_FRAMER
>  - Performs minor changes

Which way will those patches go? Via some FSL SoC tree?
