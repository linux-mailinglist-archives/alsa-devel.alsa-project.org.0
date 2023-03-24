Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA56CEED4
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:09:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D99A1FE;
	Wed, 29 Mar 2023 18:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D99A1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106143;
	bh=ozq+vH75mAjNkKi3jfaobvjryF3L2Ni1S1Tn6tmagvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kNJUZHIvRsfAhHJy80rvp2AbLvKx2sRtStMFTbgMfsGPqOFE/Yl4+a/9kmG7ZFl20
	 U1MEz9hF7ElVdvAV4wsz4rr+w8W7M4JWbrybdrYGLUoDzZmkJr0+c/foh8ATldC/ys
	 fbMlAj/afEZWXmChNDcIsezXL89f2Q/5qHIeVXuc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64BF0F80482;
	Wed, 29 Mar 2023 18:06:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D386F802E8; Fri, 24 Mar 2023 15:34:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2181FF800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 15:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2181FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lwiXRb2i
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A8A662B2C
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 14:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7143C433A7
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679668454;
	bh=ozq+vH75mAjNkKi3jfaobvjryF3L2Ni1S1Tn6tmagvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lwiXRb2iEXrDB+SiECZJsaGr+ZPWpvDVobXKSZxI3R/2BonDrW+T45JU8V4ybQXkf
	 WpLnx1F2jVOz+eboiDJaGWwG8JzHp+W8OKnzQxEXWIq1g4E1nBUlyqrOn/RqhecPgY
	 8pY7Mv53TIN43pmE6/SegvDys/Qur4lldwf0dKGTRHtzggZmldApWpq/M/G0n+eZSg
	 A3me5yZQSwEwtxCSVcCpaM+cw+ptQ1Hpv1QKX5CdY4Vd2wKjMnu6uYZht5FGsBTyhF
	 OBnRRMLMC5Q1Yns01rzlcZ2fPGF4vchj1Vedc2mx5/hp23hx7F5jOd3WxH/7g7OQ+B
	 G2cX5HrcJiQEA==
Received: by mail-pf1-f173.google.com with SMTP id cu12so1347405pfb.13
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 07:34:14 -0700 (PDT)
X-Gm-Message-State: AAQBX9fK85a9cgHVkfsgjf3ionEtwEuX/vTW63Jbiutj3JsXZXISDqvm
	YQrgjUyQLvfHbbLI1VZe36iDRU1Dk6gKIcmFqw==
X-Google-Smtp-Source: 
 AKy350Y57cQ3/TzcctMtJeBkZVGy3RaGVnEiqyzqBxcgVPo3gFc72P+HHXJ3tIgI+qnw4mjDX3xPaiNQsV4yB10ee/Y=
X-Received: by 2002:a81:b149:0:b0:543:9065:b225 with SMTP id
 p70-20020a81b149000000b005439065b225mr1122523ywh.5.1679668433642; Fri, 24 Mar
 2023 07:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
 <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
In-Reply-To: 
 <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 24 Mar 2023 09:33:42 -0500
X-Gmail-Original-Message-ID: 
 <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
Message-ID: 
 <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6PZWGL2ASTLF6DLBNLQ7VKKIQZB32RNS
X-Message-ID-Hash: 6PZWGL2ASTLF6DLBNLQ7VKKIQZB32RNS
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:06:15 +0000
CC: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PZWGL2ASTLF6DLBNLQ7VKKIQZB32RNS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 23, 2023 at 3:40=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
>
> > Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> > checking for this can be enabled in yamllint.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Should I queue this patch by the way, or do you need it to go into some
> DT-related tree?

Stands on its own. You can take it.

Rob
