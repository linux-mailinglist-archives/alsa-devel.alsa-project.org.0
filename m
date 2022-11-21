Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6266633893
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:34:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E8BE16CE;
	Tue, 22 Nov 2022 10:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E8BE16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109651;
	bh=UeT6iM2KUGf961TTStN8VXzwZpxUEsrLAiuHP8tH0ZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WLRrKPfSukjVZj+a7/bz4AtdsE+av9Tp0kOYuNwgKOOUR/G8UXH+MDHX4sqyw3ksq
	 SQlWzpumfj2RRdknj8PxvfidKP7ibWTU6BHMLkgOIw6n/tXLTM947WxIIEJ7z8jjhv
	 1IrKkSjup+GkcJrzWIIlIgZS1Xsv+qjLAKZISFQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4710FF805EB;
	Tue, 22 Nov 2022 10:27:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E90F8028D; Mon, 21 Nov 2022 14:33:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F14F800F3
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 14:33:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F14F800F3
Received: by mail-qk1-f169.google.com with SMTP id p18so7956358qkg.2
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 05:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W52hjy2XgXbLvoau/TZhYUdh0mFs9ky77EejBWrKJL0=;
 b=kNluTRNJxV6cwlBk2pnrHMi3dxvUbvUjr2WT5LwosDauXvLEdJ2b5PknMJMe5xJnjq
 jHcPRCBrcy2JlH/0cNAZRKcHr3ILrt4xD5D549TJTqJWBnk/Z/ECiuZYiYTiWFJehzFq
 e8jnD35YZIqNkyaEDDw9vVsfOgK34LdIFd/mYtMxfzneSIz+JRgb6FthioJ88QzWM+gD
 /x6gCGe0/ZPVRyg0SqDgCr6dA7e+FQm/dQDpPD5vCl4DPG1TKH8wPIYNONNVdm2bUcvw
 Vq5rSHWDRXZuLILn81Lb59qC47U3lONiu/BcAB5yiTL66BqCbNfsjEVtF0vOpXHmm1CF
 OK0w==
X-Gm-Message-State: ANoB5pmXDU5ILXiBfnTpM45zYajOUZY/83udL10ULMfqVWGVH2lZ7KUU
 X9rBQulJUUQvfHIP0kvHibSSQtxQH7Y3Rw==
X-Google-Smtp-Source: AA0mqf5/Ca/vI/x5dUB1wys951xUrTiPqVwp/XQqC4ZaVhqXyNRk80apE+d55x9safxCfxqaQJvppQ==
X-Received: by 2002:a05:620a:2707:b0:6fa:25d4:8034 with SMTP id
 b7-20020a05620a270700b006fa25d48034mr16203986qkp.197.1669037604408; 
 Mon, 21 Nov 2022 05:33:24 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 z7-20020ac87107000000b003a57a317c17sm6609092qto.74.2022.11.21.05.33.23
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 05:33:23 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-3a3961f8659so21557807b3.2
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 05:33:23 -0800 (PST)
X-Received: by 2002:a81:4f4c:0:b0:357:66a5:bb25 with SMTP id
 d73-20020a814f4c000000b0035766a5bb25mr17212924ywb.383.1669037603130; Mon, 21
 Nov 2022 05:33:23 -0800 (PST)
MIME-Version: 1.0
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2022 14:33:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtT3=F-3XLb604VUvKxNQBWK1y0rMnMn0kASKjQGw=3g@mail.gmail.com>
Message-ID: <CAMuHMdUtT3=F-3XLb604VUvKxNQBWK1y0rMnMn0kASKjQGw=3g@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] dt-bindings: drop redundant part of title
 (beginning)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Jonathan Cameron <jic23@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Nov 21, 2022 at 12:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
>
> Drop beginning "Devicetree bindings" in various forms:
>
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD]evice[ -]\?[tT]ree [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
>
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
>
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD][tT] [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml  | 2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
