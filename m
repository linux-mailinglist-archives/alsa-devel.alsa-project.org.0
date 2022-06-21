Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD120554FA9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:43:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BF50205A;
	Wed, 22 Jun 2022 17:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BF50205A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912613;
	bh=wpFt7kKhohrkGcVgcQN6Amak2pEy5x3pIeZEmPjNPG0=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KbeTIu8NwRL7ugSBZYfUCeW89EZJPR++qSMyvqS99apVKthCxGCJpZ+yH+u5ExJgg
	 nUKlNdH0ydsrbCU9z2Kp8YkgIRQAA6tRg/3wooQguwRTnPPlPGDpKH2hQs62FeFPPU
	 yv4qMY3yZQsCI/s7CTuv+/FN3YBaTj5/TUaRiq9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49B90F8077B;
	Wed, 22 Jun 2022 17:24:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E65FCF80155; Wed, 22 Jun 2022 00:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C06DF800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 00:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C06DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XrxToXrc"
Received: by mail-ej1-x62b.google.com with SMTP id ay16so11086549ejb.6
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Y9vEfXQDr8pG/4Ui8bgz+OuDCcEmTBK5ySYvjOoSsEs=;
 b=XrxToXrcmwlgqnIIb8qleGmtyPmtq0HqeIJ5X9pB95SO0ZHcj0rDH41tj8GHl/6bzW
 UN/VzH0YqWBcqv9LLCh052v8Nn5+fNhfC7Msu3d1ECXOvFEKv22TG2/liYmXB4o3mDi/
 Hvwpaa5O1xeKki1G+nXDVhyWVz6Y9LtlNKXasLsR15Rjqa+ho4iX2Hh0KUaY7C68GYgT
 JjG6aZRZ7LatuGkoQnbzs//SVgwaAHNr1qgHxaCwSFXAJ4P3STflXJaVJfJ7HelgK9mt
 V81lOufVgQ3zIcp1pqS6aao80UfVSoJAjfs+kZGjztPVsCyY2byfV1xFymA/N2kGQfuo
 pwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Y9vEfXQDr8pG/4Ui8bgz+OuDCcEmTBK5ySYvjOoSsEs=;
 b=zVFgXs06hslkJY2Vw1Y1yDoJ6mGKj1Khi3EomW8rdopTTUUU2rz/bDVwFMSDaFMTIS
 RNz1d5pXPx2xx62p7tUCsPtnvEi7x4dopi4XsGnpfmd/tnQ0owaWRaBO6OyiVBBDmnuW
 DbPhrMauRp05pLw6n5wmGTABmrM9x6MQaTsXjqvmNgf3r6x0q6Ne9qKJFlcrvZRs4hQ0
 3LkwVacJ5SycfQwhet6REUBvTeUCyfTJwlWiLKz5Zl84/rNlJA6Tukc6ChaBEnlEN7KL
 ZMeapzVoAK2chfPBcmVF/53uJNPBVVtaw9NFLG/ifkgGoc8PKzVOhe2TYiOkT0u3WUVH
 jzug==
X-Gm-Message-State: AJIora/u3A3WK3uuMgzdlOxzwF63VCPGNTaGCduw2pZSUbhbP7vDST6y
 M1dlXG32bPAkoRO19svEEbr9IApUi5lr9eaEWp4=
X-Google-Smtp-Source: AGRyM1uDbmHqRXEuiVLDwUblXJukXh8VRV2yAXetK1iXbSKj7S8p4ga+Uz7yGn6X1bbPdBYdsPFlhGYzW6oVnL09xSc=
X-Received: by 2002:a17:906:d550:b0:704:7ba6:9854 with SMTP id
 cr16-20020a170906d55000b007047ba69854mr289126ejc.579.1655851374994; Tue, 21
 Jun 2022 15:42:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:fb15:0:0:0:0 with HTTP; Tue, 21 Jun 2022 15:42:54
 -0700 (PDT)
In-Reply-To: <FQHPnJKuXUHf8vLiZoXidpoim5RtEYUC@localhost>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
 <CAHp75Vd7Sq9RMqin_y-8qUEAJLaGfuqxAbe+qcMB22=bqkyZqg@mail.gmail.com>
 <FQHPnJKuXUHf8vLiZoXidpoim5RtEYUC@localhost>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jun 2022 00:42:54 +0200
Message-ID: <CAHp75VfoMKo9-_OTF1AAC0KyNJOb5qvYPTgHxmkYwOfTJFSLkg@mail.gmail.com>
Subject: Re: [PATCH 15/49] regmap-irq: Change the behavior of mask_writeonly
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
 Andy Gross <agross@kernel.org>, "orsonzhai@gmail.com" <orsonzhai@gmail.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "tharvey@gateworks.com" <tharvey@gateworks.com>,
 "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "rjones@gateworks.com" <rjones@gateworks.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Walle <michael@walle.cc>,
 "zhang.lyra@gmail.com" <zhang.lyra@gmail.com>,
 "baolin.wang7@gmail.com" <baolin.wang7@gmail.com>,
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

On Tuesday, June 21, 2022, Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
wrote:

>
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
>
> > On Mon, Jun 20, 2022 at 10:08 PM Aidan MacDonald
> > <aidanmacdonald.0x0@gmail.com> wrote:
> >>
> >> No drivers currently use mask_writeonly, and in its current form
> >> it seems a bit misleading. When set, mask registers will be
> >> updated with regmap_write_bits() instead of regmap_update_bits(),
> >> but regmap_write_bits() still does a read-modify-write under the
> >> hood. It's not a write-only operation.
> >>
> >> Performing a simple regmap_write() is probably more useful, since
> >> it can be used for chips that have separate set & clear registers
> >> for controlling mask bits. Such registers are normally volatile
> >> and read as 0, so avoiding a register read minimizes bus traffic.
> >
> > Reading your explanations and the code, I would rather think about
> > fixing the regmap_write_bits() to be writeonly op.
>
> That's impossible without special hardware support.
>
> > Otherwise it's unclear what's the difference between
> > regmap_write_bits() vs. regmap_update_bits().
>
> This was not obvious to me either. They're the same except in how they
> issue the low-level write op -- regmap_update_bits() will only do the
> write if the new value differs from the current one. regmap_write_bits()
> will always do a write, even if the new value is the same.


Okay, it makes a lot of sense for W1C type of bits in the register. Also,
=E2=80=9Creading=E2=80=9D might imply to restore last value from cache, no?


>
> I think the problem is lack of documentation. I only figured this out
> by reading the implementation.
>
> >>         if (d->chip->mask_writeonly)
> >> -               return regmap_write_bits(d->map, reg, mask, val);
> >> +               return regmap_write(d->map, reg, val & mask);
> >>         else
> >>                 return regmap_update_bits(d->map, reg, mask, val);
>


--=20
With Best Regards,
Andy Shevchenko
