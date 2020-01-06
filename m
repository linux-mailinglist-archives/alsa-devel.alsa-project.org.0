Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F126131C42
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 00:21:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5661812;
	Tue,  7 Jan 2020 00:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5661812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578352883;
	bh=6Zbmao85zQbY3873sWGBdMdFbQZT8ylkm31Esz/nVro=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FbDsphqeR5v45lopCJVnqYl64HMovDKuZBZpxMbVNk7FabhIdwax+sMfCq4YW7Xsy
	 Wbpy1YmNF6hJoM/D2lmproYbgk4KWzqqv1uw3V7vE6ot9YUZbM+5YKLQyQ8UQyawF9
	 yLpoQYTb3IGmZcnZMDFiRKdSJmQiThhCqq5xIy04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C81F801ED;
	Tue,  7 Jan 2020 00:19:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B06A6F80159; Tue,  7 Jan 2020 00:19:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4830F8010C
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 00:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4830F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pyrjEmMh"
Received: by mail-lj1-x242.google.com with SMTP id y6so44676659lji.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 15:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ifLICUP3yJ2Jc69aKyPrFElbdfNiE/0Qf5WDAsEJ7k=;
 b=pyrjEmMhzxyrQ1hUcrahOg9m+TH53ZbznItKyNMvrY/fK9J7ew5E739goWY8PcP9KE
 osp4+WXa6IXcUIoxC6oD/scn2Onhm9/F5WLSauRcFyqPnaJoVvPfFzwD+F5P8GTeBsbs
 IKj8xSuE8o4iWnYrwVGJXJHOyotZUEfxCkQMHSfKpuSQQzPqiDDzL5OlFx4j1FOnf8l4
 spxkANE2K6lr2bophpOyTCu3bGpeqx808DpHV/jZSnQMRLbigYYQh4wpTK5LTFz8AmWZ
 F6FWtkrhW3/4vcP+x1KiWc0xlIsBb724CeRwPedJKwiQ92ZcHTft0Qj0PMSU3GQvHilz
 fvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ifLICUP3yJ2Jc69aKyPrFElbdfNiE/0Qf5WDAsEJ7k=;
 b=hF/UqbhBh4Ei1ZuM2EmupviB9+6wDHlx5dUQ6IG1DlOug4+9U3n0J+ZNaJOhqEv2va
 oB151uHHM4+gkhotxyZrA7w1d33oUFrNITcRnsrRy/zY7wxu8dU4SMBdtQhqerqAGrI1
 EWR6kVo/lCLYISkUv5JTdiZGoorXJqH4AoplsVpNy7wAMOnGiuyLoFHkCz2h+CIAYCnP
 rxVAylbOwlnctRU7tCnm0roQrgnCcaIo5TNHh+as7tBsEj91KF22IuB6CvsUgcjYE3kk
 fZHbdn36hv35ErsKfvagFVecGVxbPTsTe7I9W6HLKYNSvpnJaPHF0b7S6mw5FsdVgA/9
 VdMg==
X-Gm-Message-State: APjAAAVFNzoNtWOIxM4416dsLIgLS6uiAPjwR1UoJ1c7uAlCqu9+uAvj
 0imldrTdgo7OabzldaF0Bw8V2V/E7hzdd+LHPuwB5A==
X-Google-Smtp-Source: APXvYqxVrJvf9BPRKtKqrWl9CB2TzK8f78daLojWiACCChF+prk4cqTGQs5ip21no8hv5sSnLvVrxbWEWln/dkHJOQk=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr50504659ljj.77.1578352774218; 
 Mon, 06 Jan 2020 15:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20191217121642.28534-1-srinivas.kandagatla@linaro.org>
 <20191217121642.28534-10-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191217121642.28534-10-srinivas.kandagatla@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 00:19:23 +0100
Message-ID: <CACRpkdbQCc3AUgj81JLfzeUDt4XyVWLTzwkhAQS+0PSskL4ggA@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, bgoswami@codeaurora.org,
 Vinod Koul <vinod.koul@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH v5 09/11] gpio: wcd934x: Add support to
	wcd934x gpio controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 17, 2019 at 1:17 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> This patch adds support to wcd934x gpio block found in
> WCD9340/WC9341 Audio codecs.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This looks mostly finished, some minor comments.

> +config GPIO_WCD934X
> +       tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
> +       depends on MFD_WCD934X && OF_GPIO
> +       select GPIO_GENERIC

You're not using GPIO_GENERIC so select GPIOLIB instead.

> +#include <linux/module.h>
> +#include <linux/gpio.h>

Don't use this legacy header, use
<linux/gpio/driver.h>

> +static int wcd_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct wcd_gpio_data *data;
> +       struct gpio_chip *chip;
> +
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->map = dev_get_regmap(dev->parent, NULL);
> +       if (!data->map) {
> +               dev_err(dev, "%s: failed to get regmap\n", __func__);
> +               return  -EINVAL;
> +       }
> +
> +       chip = &data->chip;
> +       chip->direction_input  = wcd_gpio_direction_input;
> +       chip->direction_output = wcd_gpio_direction_output;
> +       chip->get = wcd_gpio_get;
> +       chip->set = wcd_gpio_set;

If you can, please implement .get_direction(), see other drivers
under gpio for examples.

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
