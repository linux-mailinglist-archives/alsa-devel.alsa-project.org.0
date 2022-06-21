Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A027C554F8F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:40:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 478B12800;
	Wed, 22 Jun 2022 17:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 478B12800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912439;
	bh=aT9oijFQKqSAoB/E3Dgb4GiCc++W6dk3sfYp4bZHxJQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMI5RrEicxWJM2C7u79uuVgzkj+0uWn4R7et1INjZ0M/ieeUDELCIj68znEMztpCz
	 rKAVMOa5QJdq2vDXcCeAwip25IQ7ifzShzyZR1R2gItlMvoeIrRIteXVmv5OL0xwiX
	 edoN9Ee1G4atcVrvfqmg3WTavC8MWR2JOXx+Y0kM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1FA0F80727;
	Wed, 22 Jun 2022 17:24:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BDFEF80155; Tue, 21 Jun 2022 11:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B91EEF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B91EEF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MiT9YSgq"
Received: by mail-ej1-x635.google.com with SMTP id mf9so5919058ejb.0
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yO9ZPtHQWlDG8pJW5AjR6r/iVBmTjGfBSQKVmAjwZYM=;
 b=MiT9YSgqAyyHbC2NgSFHcI9mU0I4SmbelZoevB0+h8amRGfyUTmMrWazwaITPEHarp
 ymKzl2T79u9M7zLSooXOXyVg4z58w0poQeJaq3PyZdrpSWwinByRfTzDd3MJMVKc+Jh1
 HrosNpkC9SLF6USdA/ZDhAg0uPAMPxz5wZw22PnS/SvBpuDabh76flqB27+QDjuz85Rk
 kVWCot5G6uKY0ebmYx0cAKxiYNCgHV9fAO4fsWARBr5Cz29I6Pl4NDihgDbx49z6TXgM
 upDr6OeHbZyVU5E1CaDMSJLWT9I584x/Nsc/beJSY8ZvpOWxhrcr5L3ty9BdiC7iyRCj
 44Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yO9ZPtHQWlDG8pJW5AjR6r/iVBmTjGfBSQKVmAjwZYM=;
 b=fk9B+kS7TBteJd7alNtw7VCCdMsVCZfY1Ot4Oh3rAb/wWyJKT7cDNXrDtcxjT+kBR+
 MkUowC0GCr88KtE1uk2FeEMXJTWockndyEwTTJweGKUScv+qhMZCKQsUNXKbMdJbysCE
 ukER5+BiXGHiDOIjmVTQzP0WZK9BmaxkXZ9XxI390s6wl+UyeCs/z6GxgBoUirJI4xg/
 JFlFZEWqmEiqkV5YSSRnPG0xoJmf3Do3PXI34a1D5VFs02t7qEYxgNtQ2e/P22NYGYDa
 LAWcDjg+WTGNQYeAa0wSkjT2vwu1/+LTWvcv1HuSoX70nUV4abV0f/x7Q8tNjPz/0bDA
 Ijzw==
X-Gm-Message-State: AJIora+3YiwiDbCDLMUdt+p/Aht41lnR9thEP6M2JNB9gLx4Sa0j8Q2/
 x9OpecBtp8H7vsO47CMamZYMCIbVG2dWchvBoE8=
X-Google-Smtp-Source: AGRyM1t+MEvnyKMMSOFbe0KDznz+llRYAN363T+/fom4dMy2mWe1LxJilznTSxS3mrmOTfCBkGAcauPWgPhktFyIGgA=
X-Received: by 2002:a17:907:72c7:b0:722:e5af:f666 with SMTP id
 du7-20020a17090772c700b00722e5aff666mr1301982ejc.44.1655804448287; Tue, 21
 Jun 2022 02:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-21-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-21-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:40:12 +0200
Message-ID: <CAHp75VdRC5_AUZttMqY8f9gBAct+q5sEUjqOAwVfdtCvwsE_dg@mail.gmail.com>
Subject: Re: [PATCH 20/49] regmap-irq: Fix inverted handling of unmask
 registers
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

On Mon, Jun 20, 2022 at 10:08 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> To me "unmask" suggests that we write 1s to the register when
> an interrupt is enabled. This also makes sense because it's the
> opposite of what the "mask" register does (write 1s to disable
> an interrupt).
>
> But regmap-irq does the opposite: for a disabled interrupt, it
> writes 1s to "unmask" and 0s to "mask". This is surprising and
> deviates from the usual way mask registers are handled.
>
> Additionally, mask_invert didn't interact with unmask registers
> properly -- it caused them to be ignored entirely.
>
> Fix this by making mask and unmask registers orthogonal, using
> the following behavior:
>
> * Mask registers are written with 1s for disabled interrupts.
> * Unmask registers are written with 1s for enabled interrupts.
>
> This behavior supports both normal or inverted mask registers
> and separate set/clear registers via different combinations of
> mask_base/unmask_base. The mask_invert flag is made redundant,
> since an inverted mask register can be described more directly
> as an unmask register.
>
> To cope with existing drivers that rely on the old "backward"
> behavior, check for the broken_mask_unmask flag and swap the
> roles of mask/unmask registers. This is a compatibility measure
> which can be dropped once the drivers are updated to use the
> new, more consistent behavior.

...

> +                       if (ret != 0)

if (ret)

> +                               dev_err(d->map->dev, "Failed to sync masks in %x\n",
> +                                       reg);

...

> +                       if (ret != 0)

Ditto.

> +                               dev_err(d->map->dev, "Failed to sync masks in %x\n",

...

> +       /*
> +        * Swap role of mask_base and unmask_base if mask bits are inverted.

the roles

> +        *
> +        * Historically, chips that specify both mask_base and unmask_base
> +        * got inverted mask behavior; this was arguably a bug in regmap-irq
> +        * and there was no way to get the normal, non-inverted behavior.
> +        * Those chips will set the broken_mask_unmask flag. They don't set
> +        * mask_invert so there is no need to worry about interactions with
> +        * that flag.
> +        */

Reading this comment perhaps the code needs a validator part that will
issue a WARN_ON / dev_warn() / etc in case where the above is not
satisfied?

...

> +                       if (ret != 0) {

if (ret)


> +                               dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
> +                                       reg, ret);

...

> +                       if (ret != 0) {

Ditto.

> +                               dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
> +                                       reg, ret);

-- 
With Best Regards,
Andy Shevchenko
