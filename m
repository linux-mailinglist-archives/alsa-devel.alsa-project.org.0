Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 034C26D3617
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Apr 2023 10:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F889829;
	Sun,  2 Apr 2023 10:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F889829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680423193;
	bh=qEBi/2/XGVf3QpqvzWB/GksrhasWX5+9m/gmHY0HB0s=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jaZ/XxBOSO6u2ykh35Csatklvtfv1hGDC4EfvMksd1ZbeBmNpOuQBJGd1qQ6G1323
	 VK9R8R8nl/rS8ZXc9HYBvcbjWE06w+GHYirLvVx755L+cGw3J6IefeVYAFa4qxuCJY
	 I2SneojC1qrEVZms8CSx7wgoNDZR31O1uRlXWlf8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7409FF8024C;
	Sun,  2 Apr 2023 10:11:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D572AF8024E; Fri, 31 Mar 2023 14:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC1E0F80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 14:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC1E0F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZMrC7RQQ
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-545cb3c9898so337082327b3.7
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=ZMrC7RQQSpVfgy/SHMpfC+E2QpLMDaY5/yaDkSHUKYAESGTlYtEL7g/qRUeknQy91P
         zUvgfNL0L6h3FNfh9c8D2HFAFVYOCP9WG625XToYyxYEiXALrCS5KsLDkaIeSbXlXde1
         eg6UEhsSIBdX6MmhPhtTRLpJ9X4gdd+QI1NZNQSGtPnmNcH0Md5Wv/wDx/8mZJzSNT7K
         vAZIJkR9VzoIqc5aO0g4o0xB+IpDOheOKDhB6ttu5EMPirHAV26dyaOz/pB9Dw1cQhWl
         Nw5HjfOlvF3F0OheAjfDdZPbDekSVJ+CefyXJevdAGQrjbRZSi8YsUnd1+evdQw6Mb3h
         4YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680266252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6lKdgk6THqQzNp4VvxVKewKaHaWOnEhQknxk2acjn0=;
        b=Cx8EO8GTO9QOtUQP2f4MZR6NbH/7LMoaFsSRdmTLwrD40ANBuvELAGe0NAGp+KwNGr
         ui9uQNix4zOiI+RZXSp53/MalOWcaETXu4TF40uO0GGVUepN1GPPYZOfNUpwBY5uRnk4
         wemnt7wdgWI95bI7Yb3GAUfam/uPgWFZV5aO5pjk8UXhCi1Dc6B/0gliUv55N81t2MYZ
         wxQdQFxnO0rZbL6Vhvmb+727zcL5xLU9l2vp4DdmV7sZRy779qdCJMoIMd76nhZZre6A
         e6NBAKXLfGBt5BF+dl3EbjT+27B/ezUGi4mVV7EQZ5XjfBpTQU251wuMnalzDIFYP6O6
         J6wg==
X-Gm-Message-State: AAQBX9e8RxNiiG17w3xRB3N0OF+sDQj+wMERlLt48vlFuC+j4146JIN4
	tZG/e8sitCutwCe9pdPgtgHjSSE8tdFvpg4AHdwF+w==
X-Google-Smtp-Source: 
 AKy350aQG4pTb9063C5UpGPTZlWu/1jB1S9bOfbEf1bci1cyW8YxugalTaCiIXNAm4RWMBbCrWxYKS+tBxFA+9FzOXI=
X-Received: by 2002:a81:c84a:0:b0:541:753d:32f9 with SMTP id
 k10-20020a81c84a000000b00541753d32f9mr13384037ywl.9.1680266252481; Fri, 31
 Mar 2023 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230330200402.2731992-1-robh@kernel.org>
In-Reply-To: <20230330200402.2731992-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 31 Mar 2023 14:37:21 +0200
Message-ID: 
 <CACRpkdYwM5Kw4XB9S5qoqdK-boiYp2iu=LRZ-B-vJb1k9fNnig@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: KERGS6HEMTE4CSMQBYMIPCGGBTRWEFO6
X-Message-ID-Hash: KERGS6HEMTE4CSMQBYMIPCGGBTRWEFO6
X-Mailman-Approved-At: Sun, 02 Apr 2023 08:07:50 +0000
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
 Michal Simek <michal.simek@xilinx.com>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 Jonas Gorski <jonas.gorski@gmail.com>, - <patches@opensource.cirrus.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>, Peng Fan <peng.fan@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Rahul Tanwar <rahul.tanwar@linux.intel.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Chris Brandt <chris.brandt@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Drew Fustini <drew@beagleboard.org>,
 Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KERGS6HEMTE4CSMQBYMIPCGGBTRWEFO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 30, 2023 at 10:05=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Hector Martin <marcan@marcan.st>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Rebase on pinctrl tree

I applied it quickly before something else changes!

Thanks for respinning, and thanks as always for driving these changes.

Yours,
Linus Walleij
