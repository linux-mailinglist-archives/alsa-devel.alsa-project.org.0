Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E5554F82
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476712459;
	Wed, 22 Jun 2022 17:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476712459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912329;
	bh=YM+1kw6x3MRXUuxTTcEQgrUwqsMnH+VBM6rR/PB1X2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vW5TbTRWbg/pikk78B0qQkbom1e7swHmBlEGO0BAcHl6gAY4oFK2tUXbudHMuAD9E
	 kFjgUKfmNPWr+GQYklfkrGCJ36MVrPZ7ZvCOBR+RkQQPbnF7BVZJb4tmA/kKZTnnmT
	 mFgei3P+m7zp8IxRBDh7xrNNTURck7J4G/AQnLDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80994F806F1;
	Wed, 22 Jun 2022 17:24:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3FD3F80155; Tue, 21 Jun 2022 11:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F008CF800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 11:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F008CF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SZC4AJow"
Received: by mail-ej1-x631.google.com with SMTP id o7so26167818eja.1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 02:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nwSBD3PTloVRfceK56G2aCfoof4Hwc6nnq2tpaiVX1E=;
 b=SZC4AJowoOWLiXUnJNCXlRo+Fy21+43HuGqupG34NYAHev8FNX9LB4nFwui2g2ERc/
 2nAJjFE7gSxwK3AKqYoV1+xDYo3j7xKpCHwaEkBrfpjwItcvjJqbKZBmsBC6S6wk0LeP
 jECzrOFPrp+pM5SPwC+6kLb36nf+Eql2JHp+xmKVEp9KBopfkHCProz5vj1URUzLxuOc
 2gtMsViSY39FbLby9xOKwyFIHQnssNg0xndDzN3H/27fb1evpypF3YvV3oswAKpp+Rdc
 8SQN3kqU5KrBqva1r+R8tUi0Xkhp826IwLzXg6j6O1xwnr3vjRymNISR9wMWgtdGEpu5
 ffSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nwSBD3PTloVRfceK56G2aCfoof4Hwc6nnq2tpaiVX1E=;
 b=hAurqmRBhJwpijkoY6uz626d3/o6iqTbZ2fQQaBs9vk9X5oVC7yATCY8tQdCRaK36Z
 yxJma6xlluPFzSHH1f4FYYCY7de30fITn+AkC6Cd4JuDSwrP8EKMJAwHiBE+FLKGN1Jc
 RS09pTIahB2DZbaWvxLRm8HV96ks/dkBq73DVVxmqMohUM+vgN/FPodqrUVoO+cfCyBE
 ydfX9nOPIAzBbPJoB94uUeB/cC+VMPrCPIZdpJZU7dF2LU2EAkFohlc4eqScC9LTFB/r
 NP/7OHCsejYGx9twzo81jacaEFXSLgXRpW0Tt7wJb0n4vO75M7Tf9lcu0VbfPlGqLARb
 C+3A==
X-Gm-Message-State: AJIora/7mB+cgbIhu0G3NaUEATVCYwGykAdqvbMktcwb5n1oR+02bM7y
 WRH8Hg4+BrcMGpfrC4qIl9gNPB4jP3nVnUbSElk=
X-Google-Smtp-Source: AGRyM1st5l8YH2ggqJetd23NizO1SBXRfCSKIN2Ag6+snWa4U1k/4MnJ2Of8mZI6rssF1UlaIrePIaWD6CbQW7kd1/8=
X-Received: by 2002:a17:906:149:b0:711:fca6:bc2f with SMTP id
 9-20020a170906014900b00711fca6bc2fmr25088970ejh.497.1655803360410; Tue, 21
 Jun 2022 02:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-5-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-5-aidanmacdonald.0x0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 21 Jun 2022 11:22:03 +0200
Message-ID: <CAHp75VePD-ROfnFtwU33Jt_h9a-qBC0QwRQcQfgmEbyOV22CKA@mail.gmail.com>
Subject: Re: [PATCH 04/49] regmap-irq: Introduce config registers for irq types
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
> Config registers provide a more uniform approach to handling irq type
> registers. They are essentially an extension of the virtual registers
> used by the qcom-pm8008 driver.
>
> Config registers can be represented as a 2D array:
>
>     config_base[0]      reg0,0      reg0,1      reg0,2      reg0,3
>     config_base[1]      reg1,0      reg1,1      reg1,2      reg1,3
>     config_base[2]      reg2,0      reg2,1      reg2,2      reg2,3
>
> There are 'num_config_bases' base registers, each of which is used to
> address 'num_config_regs' registers. The addresses are calculated in
> the same way as for other bases. It is assumed that an irq's type is
> controlled by one column of registers; that column is identified by
> the irq's 'type_reg_offset'.
>
> The set_type_config() callback is responsible for updating the config
> register contents. It receives an array of buffers (each represents a
> row of registers) and the index of the column to update, along with
> the 'struct regmap_irq' description and requested irq type.
>
> Buffered values are written to registers in regmap_irq_sync_unlock().
> Note that the entire register contents are overwritten, which is a
> minor change in behavior from type registers via 'type_base'.

...

> +                       ret = regmap_write(map, reg, d->config_buf[i][j]);
> +                       if (ret != 0)

if (ret)

> +                               dev_err(d->map->dev,
> +                                       "Failed to write config %x: %d\n",
> +                                       reg, ret);
> +               }

...

> + * regmap_irq_set_type_config_simple() - Simple IRQ type configuration callback.

> + *

Redundant line.

...

> +               d->config_buf = kcalloc(chip->num_config_bases,
> +                                       sizeof(*d->config_buf), GFP_KERNEL);
> +               if (!d->config_buf)
> +                       goto err_alloc;
> +
> +               for (i = 0; i < chip->num_config_regs; i++) {
> +                       d->config_buf[i] = kcalloc(chip->num_config_regs,
> +                                                  sizeof(unsigned int),

Can it be sizeof(**d->config_buf) ?

> +                                                  GFP_KERNEL);
> +                       if (!d->config_buf[i])
> +                               goto err_alloc;
> +               }

-- 
With Best Regards,
Andy Shevchenko
