Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF1554F9C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:41:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BDD27FB;
	Wed, 22 Jun 2022 17:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BDD27FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912503;
	bh=M37JMKAP8wO8y59C0bJ9mu6UVQ2NzYaWSLUw6aW6euI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YhVqXJC3PJ8JCBZE21O0ybj0vCeV4QcXzqlaEIZwkRhjipiOOQo3DPX2RjUPRDvZa
	 PRHI+ngJSDprPB1YEwEjisNid8bnn4H3n6uNdhsCjWoc0KPPCkKTPIThcLTsrJ/PfB
	 Lv28EvEsRR9pAuxqiEEB8sbfsYlHNS7RuC6ejDEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17374F8074E;
	Wed, 22 Jun 2022 17:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE378F80155; Tue, 21 Jun 2022 11:51:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1199DF800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1199DF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="F0iKTn0I"
Received: by mail-ed1-x535.google.com with SMTP id ej4so14643662edb.7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4W5iRCpxf3logbYUk+vaaUqbarkwwxMMo6upR9gUBQ=;
 b=F0iKTn0IOPk1RyoIOXx/9fQrQDEUk5S+5p/PPjKPXwc6epvlQST71mWhxR+3waqXCB
 8hYjHeK4kQBeh/zfnt8/Gd8m+FNvsHQojomMiE00ZoSMMoPCBmxiqXxRF2r1SU5v9k46
 Kv5bnO0ly5N7kd0NckGXgl7qGBHBvHYAhAN63gHHeZyCo6bAMhnaJ2sYiwp3oPpXGEH3
 6XchV5hNnxVAkNSd3UVw0UzBrN2cQ6+/VTxPNrklzoDcSUwASVvijaAQrWC95FgtqYxJ
 fSkvYOc61sxOfweyaUW/pFZcpDp7Gv/lyIqAEKbVzLxcPJEMGWZW70kD4F7aQeiKBMkB
 jArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4W5iRCpxf3logbYUk+vaaUqbarkwwxMMo6upR9gUBQ=;
 b=WDrQcMXzPHt+MPhwz9Qh58zB06LMJHDaTNj4Nf589qWZRQwStUxah+ovqgZXctC5sw
 4Uvpy9lZeEBSOzqmVdRB+SkCcXiRV3vMA89L6/gT03fDVuBPhtHRbCt4TPw866CjCLY8
 cTBWZ3VOSCn9od7Yh2uDQ9jX78+bFrkIibrVuTcaZ/8h8cgeidCN/MYZ0OWMNgqBbo8S
 3kvAUrNvaOEcinDyPO3A5szKjEpyDzUwmmv2irVR2p6hWIvqsywGGSTFDU/7b5E+EWqB
 mQb2/GR14P7ebQ9C9xvrimPJnee4ilvhboMxXlRoAMDCdBH88JqGG9zqy5lyiB8Ss2Ws
 hLcg==
X-Gm-Message-State: AJIora/4N+/dKOjOZlZnbDwdTHYivKU9CI1Han11KjWnjVQCCOKHNfXm
 M7gOEGAcup+Zt6opKtXYNLDuLOMbgOMD3Ca7bBg=
X-Google-Smtp-Source: AGRyM1uSpltIo/3tQd5aozJm5BFkUH3HKZnQozi1BRUdyqFMI1s00iuw7CgJCEeiuzaGluK7dwLzZcUki9IF9TJ/www=
X-Received: by 2002:aa7:d29a:0:b0:435:705f:1319 with SMTP id
 w26-20020aa7d29a000000b00435705f1319mr18633856edq.54.1655805113414; Tue, 21
 Jun 2022 02:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-48-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-48-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:51:16 +0200
Message-ID: <CAHp75VeGfBUq+jhyZ3F9M2JaaSZMe1+y9+-89bQTW0SCRgUkVg@mail.gmail.com>
Subject: Re: [PATCH 47/49] regmap-irq: Add get_irq_reg() callback
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

On Mon, Jun 20, 2022 at 10:12 PM Aidan MacDonald
<aidanmacdonald.0x0@gmail.com> wrote:
>
> Replace the internal sub_irq_reg() function with a public callback
> that drivers can use when they have more complex register layouts.
> The default implementation is regmap_irq_get_irq_reg_linear(), used
> if the chip doesn't provide its own callback.

...

> +       /*
> +        * While possible that a user-defined get_irq_reg callback might be

->get_irq_reg()

> +        * linear enough to support bulk reads, most of the time it won't.
> +        * Therefore only allow them if the default callback is being used.
> +        */
>         return !map->use_single_read && map->reg_stride == 1 &&
> -               data->irq_reg_stride == 1;
> +               data->irq_reg_stride == 1 &&
> +               data->get_irq_reg == regmap_irq_get_irq_reg_linear;

If initially this had been as

return _reg_stride && irq_reg_stride &&
  !map->use_single_read;

you would have done less changes by squeezing a new condition just in
between the other two. It will preserve the grouping of the checks as
well.

>  }

...

> +               /*
> +                * Note we can't use get_irq_reg() here because the offsets

->get_irq_reg()

> +                * in 'subreg' are *not* interchangeable with indices.
> +                */

...

> +                       /*
> +                        * For not_fixed_stride, don't use get_irq_reg().

Ditto.

> +                        * It would produce an incorrect result.
> +                        */

...

> +                               reg = chip->main_status +
> +                                       (i * map->reg_stride *
> +                                        data->irq_reg_stride);

Parentheses are not necessary. And perhaps the last two can be put on
a single line.

...

> +       /*
> +        * NOTE: This is for backward compatibility only and will be removed

FIXME ?

> +        * when not_fixed_stride is dropped (it's only used by qcom-pm8008).
> +        */

-- 
With Best Regards,
Andy Shevchenko
