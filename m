Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F8E554F94
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948822016;
	Wed, 22 Jun 2022 17:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948822016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912456;
	bh=+6qqSr+klp8AtSdn5UlPmZ9Z4JjVHctjeNCqwxz/c7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxexqCwPn/xPMGOx4cIWFQ18MwEN0lDcr1BBmMsFFwX7+wPIrq4UQn8ctE8qlRBlx
	 H7w/HubSdLJnELhRzn+onHtMSKmx2ibZBq93ABVmqv9ypJGaiK+TpcrLewch/i7co9
	 wW7jIlyKUIB+iFWuKWkf13sgIdHoG0gfaSYxyY+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A307F80730;
	Wed, 22 Jun 2022 17:24:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02BAFF80155; Tue, 21 Jun 2022 11:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FFF9F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FFF9F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XoZerS+q"
Received: by mail-ej1-x62b.google.com with SMTP id pk21so3132915ejb.2
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7W8pS4HaYS/K/F5s5QPICn7aqLZXMuTyRRVdAfsAcPg=;
 b=XoZerS+qv1R28f40K6hoLnLM4Ct5C+e/yqRmtv+kzV9PCDFL/LS7bsUEdldOD+RyHB
 ukczq/1O7qTvO3tyrlZrzFhXQ33KoFDifHZODZVFjJ3TigoHkBk7geFdz+QWVVDhdZd0
 4QXA3Mcp4UOLWIVfOEaXgpOhro4R7EyEOzGxZz//6kMGNLexIQ1RMMhIHoy6Fmqp95s3
 edH6j4r60Egf0+IoooN2Kl4dh1amXJKmc5SerDqp0IPAetq8boVtQMtd1V4UihFiytjO
 i7exWG8M8Vy6qOonHlsopob38cCHeq//DmG2j5wMnELgMi7YdE2S591sC4Eqab5J28+F
 vr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7W8pS4HaYS/K/F5s5QPICn7aqLZXMuTyRRVdAfsAcPg=;
 b=jYvxNr82OOqGSpgbjkiD1fmWxPI++GrdOMWXdHyGC6XUCBqmF/6OX9A2Y0DGcsmnZh
 X6lC5TYuQqP2vSKpU8kV3/sX7Mp2CKSoGJpDbsxXwdeYps3bw/qCpslbtM2z3mAzmTur
 QyPyJJJZES2zblBXvmTZdOnauLIOr0oFXiIPEST0x5m62+WiMGurS+uLXgexZffYdkMC
 LTR42e3MQZLyeD1hGHaoZlDRyfkIcDd5D50Ux1p4qVqKvQ3F98WkbpVTrqWUOUzJm+Rq
 tga5WuI+WXyy4AeMkzGgdth5SyQMTDPJxRPZA1IPyJXUZtIU6yiCg13MgZjgGPEKgbBt
 WP1w==
X-Gm-Message-State: AJIora/lZYPYpYeLg1esMYZJ240u4KNRBZB7EWjaIk7hNyZVzxulkdpH
 9CEISmWmzRLdu2V00LU2Bvi8gJxw2zZXIdfvoY0=
X-Google-Smtp-Source: AGRyM1uYARWsSweZJveSPRopcUyqQF9g3LZ0zGnE7aD5N8bF+zyg2cKewkA1ySgZCwIP7Hmn7pVNYQGyGOFlItx8/YQ=
X-Received: by 2002:a17:906:434f:b0:711:eb76:c320 with SMTP id
 z15-20020a170906434f00b00711eb76c320mr24832521ejm.636.1655804587541; Tue, 21
 Jun 2022 02:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:42:31 +0200
Message-ID: <CAHp75VfYebbY47_jOmyC0PapZB=ne1XA4gfV4OPuHcurFR6JCA@mail.gmail.com>
Subject: Re: [PATCH 39/49] gpio: sl28cpld: replace irqchip mask_invert with
 unmask_base
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>,
 Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, tharvey@gateworks.com,
 linux-actions@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 rjones@gateworks.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Walle <michael@walle.cc>, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 Matti Vaittinen <mazziesaccount@gmail.com>
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

On Mon, Jun 20, 2022 at 10:10 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> An inverted mask register can be described more directly
> as an unmask register.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  drivers/gpio/gpio-sl28cpld.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
> index 52404736ac86..2195f88c2048 100644
> --- a/drivers/gpio/gpio-sl28cpld.c
> +++ b/drivers/gpio/gpio-sl28cpld.c
> @@ -70,8 +70,7 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
>         irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
>         irq_chip->num_regs = 1;
>         irq_chip->status_base = base + GPIO_REG_IP;
> -       irq_chip->mask_base = base + GPIO_REG_IE;
> -       irq_chip->mask_invert = true;
> +       irq_chip->unmask_base = base + GPIO_REG_IE;
>         irq_chip->ack_base = base + GPIO_REG_IP;
>
>         ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
> --
> 2.35.1
>


-- 
With Best Regards,
Andy Shevchenko
