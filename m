Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC62554F84
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DBAE1F43;
	Wed, 22 Jun 2022 17:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DBAE1F43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912361;
	bh=SNkcqVkhr/cdJukpDYH/RlAsbYhpk3LhzUDkbSQZ1G0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMGg7tS0qz0o/1mxWAL1u0xePnwL2DrCOiuc5IXVrEmcDgBMRjIXvTcibnWUQWB1L
	 KsZ72LwLjPHpXhTmT0LETv46+/z4fZhHaea7n1241/RgLjoTeBxlm0okpAOrM5X4vZ
	 bh/X7jpxmUpJlfr3gy4U/IGmFN/81jGRBri44szw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDBFF806F9;
	Wed, 22 Jun 2022 17:24:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F241AF80155; Tue, 21 Jun 2022 11:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96279F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96279F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SkWmIxEV"
Received: by mail-ed1-x52c.google.com with SMTP id ej4so14571000edb.7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eVfQd3XPechRFli107C/XOXRbeHsShcnB7OFUBR1wN4=;
 b=SkWmIxEV+ESyHsCbsR1Xt7I9SQuAWrV1KNmPiHSefbw6tjpPMuthp3LqtVQ2N+GIyh
 BF0EUqeIjZ/fTFqxBB6wXJ7xGaqQxl7IRe8eZi1sO2oZD7dNwzX7VC5QBndK7WTzX8pW
 ar9X/Z0jZRtZLQ6fUs2aQmiDZ2d91v914nUh+KGkyPNtXOmVVYNnVMMqb+EzlDt8o66V
 a0FVH1Zp8dBl16N3CmVzQ4p+Wj0SgKmTk9HwQkqHXo0LNrXTGtskvMPd3alLj3K0vLA/
 //ny6WHJ/gvkwxF84HzdQy++kjBUu8yXxysyZC5+Z+VkMghwv8Mv/zySzZVeO0ePODU+
 GlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVfQd3XPechRFli107C/XOXRbeHsShcnB7OFUBR1wN4=;
 b=4PHRvvIrDOTXpQb1XlDGy5nUXzjN3J36pmVuFvi1hJgbxbDAuY5kHvWaTSdUbPSbo+
 7VLoac1DAqomoN67AIUZpywjiIxP7bOw49N9DYZoPeYqLoXhNPl4Evb4Xct8fJr4004i
 HaPNiFn65w2MB88s5rSYk2R2TKvavc463SsSQWEUfT47C4qAim/rJBXqLv7P8b6a8XGZ
 lOPDHlkAjIZHONG9TPQhqyCVkvcsZD27sEabMX/NS2K718Tf9DiL6WlHuXFiG+Uhki2f
 gw3JjTEWE45jnRlMpvUVydpE6MysaXTwHIuBcFRNbrsWY6n6F1LouNqviTPy8UO/43bQ
 Evzw==
X-Gm-Message-State: AJIora9pKD0K/PmCwY/9fIoBW5ZNzpHIH0EpQr1vhWdLx3XdJ9A3exSf
 T2mFVtJ6p9ri66wNcCLuXRkWIbHVau5bB2eTmrs=
X-Google-Smtp-Source: AGRyM1tM0xU4gMjk8srBUxoaihaU7C2henLT+DWnWAydDDa7goTMcwvw8+NLuBGCqmwgWP4p2sY0HbLwAwb7ohmPFDY=
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr34685476edc.97.1655803800295; Tue, 21
 Jun 2022 02:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:29:23 +0200
Message-ID: <CAHp75Vd7Sq9RMqin_y-8qUEAJLaGfuqxAbe+qcMB22=bqkyZqg@mail.gmail.com>
Subject: Re: [PATCH 15/49] regmap-irq: Change the behavior of mask_writeonly
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
> No drivers currently use mask_writeonly, and in its current form
> it seems a bit misleading. When set, mask registers will be
> updated with regmap_write_bits() instead of regmap_update_bits(),
> but regmap_write_bits() still does a read-modify-write under the
> hood. It's not a write-only operation.
>
> Performing a simple regmap_write() is probably more useful, since
> it can be used for chips that have separate set & clear registers
> for controlling mask bits. Such registers are normally volatile
> and read as 0, so avoiding a register read minimizes bus traffic.

Reading your explanations and the code, I would rather think about
fixing the regmap_write_bits() to be writeonly op.

Otherwise it's unclear what's the difference between
regmap_write_bits() vs. regmap_update_bits().

...

>         if (d->chip->mask_writeonly)
> -               return regmap_write_bits(d->map, reg, mask, val);
> +               return regmap_write(d->map, reg, val & mask);
>         else
>                 return regmap_update_bits(d->map, reg, mask, val);

-- 
With Best Regards,
Andy Shevchenko
