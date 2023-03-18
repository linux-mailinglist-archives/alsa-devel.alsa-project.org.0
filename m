Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC16C216C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F09820;
	Mon, 20 Mar 2023 20:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F09820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340650;
	bh=BtV1NDPI/DaksX3m+V1oYG735zLUgwvK/qQQSWf29Qo=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W1Fgd26EwVHc5/zWsYbrEkw4P+tGGYhhGcHr6mY1jGCx4detyQ4EsiBDs29r6K/dz
	 alkwEoi8ncgqIFA9FXMoEpQB4MVwMxj1x1TMC7aPM4VfTNpKtZMrY5rvpjZqV4f1SC
	 FZOhifozczRUslhj0Ka/jHcZpmJsmoY6/AAbqWt4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 099FFF80552;
	Mon, 20 Mar 2023 20:28:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02373F80423; Sat, 18 Mar 2023 09:21:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42CC4F80272
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 09:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42CC4F80272
Received: by mail-ot1-f54.google.com with SMTP id
 m20-20020a9d6094000000b0069caf591747so4111232otj.2
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 01:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679127668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok0/fcUUjYf3VJvre1cNZ96FcwH4JhSJwBxsOnlRNhc=;
        b=v5N8vxxw53BNISF19FzVbf60fQtFDVqJNMp6fg06+h3N7Oe39ETZ56ovmXsuiT8Tm2
         8ZuaeZa4uyO3FOtIGCsN7C36Mb6NBb5lxaZiWRTFtWLAhwy3xBju4w+ftbuBBybr1Sg1
         aj9pCH+Is4dMZcyifkCRWIX++SZi1CVmkxUCq2w5L7PyDo/j3XvwaqbaJwHQOX+PukRe
         RDYET0BCCxCHtiI6Q+IlZMEJyNGHceAaR4gm9uneh7DnxolrvMqt2y3HFDLRCi+tbVYw
         2wJ6ir1MuKMMJ1FgREX1Vm5FaI88qHWV9c0ym5MsqCtXNmjtUrQ063uqe7mPdsDWIwit
         1AwA==
X-Gm-Message-State: AO0yUKWZWZ+K2tjTXWcN+LHwx3Sgx5MA1TC+hcfXP7gODTztDILzHtZ6
	sJEFGOeXoGG2fbQ0Zp7mg7uvaCBm33GEIQ==
X-Google-Smtp-Source: 
 AK7set8jhjVLQ4br8FYTYtvAJxmCucFq5y4B5k711tiQpUPmM6+zA5DcmGo75E3qvNYnyylo4OmVGA==
X-Received: by 2002:a9d:7cda:0:b0:68b:ba93:6c11 with SMTP id
 r26-20020a9d7cda000000b0068bba936c11mr590359otn.23.1679127667842;
        Sat, 18 Mar 2023 01:21:07 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com.
 [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a9d6a46000000b00699b9550e87sm471433otn.76.2023.03.18.01.21.06
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 01:21:07 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-17aaa51a911so8119740fac.5
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
X-Received: by 2002:a5b:c47:0:b0:b56:1f24:7e9f with SMTP id
 d7-20020a5b0c47000000b00b561f247e9fmr897441ybr.12.1679127645593; Sat, 18 Mar
 2023 01:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 18 Mar 2023 09:20:34 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Message-ID: 
 <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: FHUQ2YGIHNEESBHGHFLX4UAMOJWBG5JR
X-Message-ID-Hash: FHUQ2YGIHNEESBHGHFLX4UAMOJWBG5JR
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:28:22 +0000
CC: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHUQ2YGIHNEESBHGHFLX4UAMOJWBG5JR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Mar 18, 2023 at 12:37=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/pinctrl/renesas,pfc.yaml       |  2 +-
>  .../bindings/pinctrl/renesas,rza1-ports.yaml           |  2 +-
>  .../bindings/pinctrl/renesas,rza2-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
