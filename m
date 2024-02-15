Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD72857135
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 00:13:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9AB6B6A;
	Fri, 16 Feb 2024 00:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9AB6B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708038795;
	bh=Eb/9YuG1ExOw9aKA1oqZbr3X02sG3sH9UxVJp/eMEdU=;
	h=In-Reply-To:References:Subject:From:To:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=s+VhluU6VdYMZYUPEtLXPMGKzt9tUsg0vy1FaXcswOYbTKCPzAGsunL+0MdDdotx7
	 XRSdj4Dk9n30w5S3tZLZF/1FhtP/GLYshroetCS2xqnCyntg+gvk5mjjkz2ydfd/UW
	 JrnjCpEHvLWkxhVWzvcgnAqkhSg2p4jfHyGHNC7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 551FCF805A1; Fri, 16 Feb 2024 00:12:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49779F805A1;
	Fri, 16 Feb 2024 00:12:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E4F6F80238; Fri, 16 Feb 2024 00:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76A67F8015B
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 00:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A67F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VKWARMnY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AAF86CE291F;
	Thu, 15 Feb 2024 23:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FE2C433C7;
	Thu, 15 Feb 2024 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708038734;
	bh=Eb/9YuG1ExOw9aKA1oqZbr3X02sG3sH9UxVJp/eMEdU=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=VKWARMnYNviJPXiOtKuoccPiteYKCHSVFRLfobnKgCAmFe3rC2z0Wd3jsy6VvnDNO
	 LU9halfyBb8j8Gtgt3x3Yl2qjLDsAaN4XWZY7vP2J42INqR9FJQbRW1OHvIkeGQQFp
	 uBCYksmhH7HE6OaG4D9ym/b893RmduQl4SpP0JiZwyMF3BNC3fvmpvB1RmIpvsXepi
	 DfFkHY0/gR6aJRNCjSdzlugiIA0yQlY7txVukxSAYJg5oBs5tW432Y/k7zJ3C35m36
	 +j4EikR/4v5vFeyHEmEG7BhaHzvhhTsPRPWFIm8wrAx8nLp781+VxGDyfk8VT7NiAg
	 cIy678urUpZjg==
Message-ID: <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>,
 Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 patches@opensource.cirrus.com
Date: Thu, 15 Feb 2024 15:12:12 -0800
User-Agent: alot/0.10
Message-ID-Hash: KTUJ344VP7C234Q66GXGL2TKJAL6XWOX
X-Message-ID-Hash: KTUJ344VP7C234Q66GXGL2TKJAL6XWOX
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTUJ344VP7C234Q66GXGL2TKJAL6XWOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Krzysztof Kozlowski (2024-02-08 08:37:10)
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

This will almost certainly break the build once it is merged to
linux-next. What's your plan to merge this?
