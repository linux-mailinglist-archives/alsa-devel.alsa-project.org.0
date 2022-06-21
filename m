Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FAA554FA7
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:43:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A58C2816;
	Wed, 22 Jun 2022 17:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A58C2816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912581;
	bh=hwBB707LRkj/ZJu1yKhMIRiibMFA4O+bcuxfa5UzINw=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y30qyWKuWXNNyHV78cSW5S8dkd9e+CeLtQfYPSO9Dv93LqogrmanD4scDis9KcqzW
	 bwJuNCnV7PSvQLC4oD54x5IfrCvntO65+iIv2l/uEQIfESwshY2xkWzmrv7O7MEXsy
	 +bwJU3co5V2a/niU9/TWhZGtU2pM/qWWSfKRvqiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5399F8076D;
	Wed, 22 Jun 2022 17:24:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 239E9F80155; Tue, 21 Jun 2022 23:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58785F80104
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58785F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dBkR+OXn"
Received: by mail-wr1-x42c.google.com with SMTP id r20so219827wra.1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=references:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version; bh=5jGRxWa+Hik2xXu28OZInbUMDSK1LmZ28o9a5C6ustA=;
 b=dBkR+OXnEaZPr9uoaZB+DI5wT1AXufYbc+9qN44d74R1jy7oOaP5glLLgc/hzh3E8m
 VEYB0O8O8TiK3K0KU8aR4nbUvWWFGE7uePKS5PELYCU4SnEeJA8EVcTkrM2DoduTme8M
 T2w+A4Oj1CabUPV/iQcD8tJhe3/0P4UoInCNfQd2pdDiq/qrgQ6JtX7yLUUFdykN73bM
 NtCtwLELefp/0JcgOX6hIfK1mCyMbjfNrGysmUUfiSDKIuEdhMG6diRPWKvISTwtHa9N
 kgrC4FpslcP3XTRRhPHg48OrMHfSCIL2fPrOOeRY9LvrBNjg8LF3SLUYHP6wXsVMRurd
 LPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=5jGRxWa+Hik2xXu28OZInbUMDSK1LmZ28o9a5C6ustA=;
 b=AryOGo285tm2CMOI0N9XdwZCGytuW8IaNcI0lPJKMFqJv+KdsqNckXaFRklEMw+Pe9
 Ca8ufpq46nDhzeC5D72ckcTAQp+SgZK9YJNJLpyAEYh6zZRqd66YM9zmXdpkk53wXHIa
 XyCH9nhQEd9C1RE9xE0pPAp15+H0lnIAdfMBb5XRkVCSMM8GgOiseajqX+QK9+TSvK/X
 lNDC+XG/Y01HKm/BPky6LA+LX3jW1L/lpL98S5KUP6R+PIa6q8lUrd8h3HpDEdHtIEPZ
 X/hCzgXMbWqS/L+pZxMWjkInwy7ooYkndlBb5l2ZVKLxZ3inperPKkuFB0Sv+uQXb9fw
 moYw==
X-Gm-Message-State: AJIora9vK50c79KpLCT87YRURgrNxuprLhZ2I1oblPxDi9li+C/pBxYJ
 +LZRHGvnGUctz3Sr55+oSq8=
X-Google-Smtp-Source: AGRyM1uWGscZnGaavVg/uIQYsRslzM5t54de/BLxZBl+KXB10CZYw57ndf/q8EV3SUZ+AQYy58rh1w==
X-Received: by 2002:adf:fb10:0:b0:207:af88:1eb9 with SMTP id
 c16-20020adffb10000000b00207af881eb9mr30853557wrr.238.1655845918233; 
 Tue, 21 Jun 2022 14:11:58 -0700 (PDT)
Received: from localhost (92.40.168.122.threembb.co.uk. [92.40.168.122])
 by smtp.gmail.com with ESMTPSA id
 bv27-20020a0560001f1b00b0021b84ac7a05sm7979960wrb.0.2022.06.21.14.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 14:11:57 -0700 (PDT)
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
 <20220620200644.1961936-16-aidanmacdonald.0x0@gmail.com>
 <CAHp75Vd7Sq9RMqin_y-8qUEAJLaGfuqxAbe+qcMB22=bqkyZqg@mail.gmail.com>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 15/49] regmap-irq: Change the behavior of mask_writeonly
In-reply-to: <CAHp75Vd7Sq9RMqin_y-8qUEAJLaGfuqxAbe+qcMB22=bqkyZqg@mail.gmail.com>
Date: Tue, 21 Jun 2022 22:13:03 +0100
Message-ID: <FQHPnJKuXUHf8vLiZoXidpoim5RtEYUC@localhost>
MIME-Version: 1.0
Content-Type: text/plain
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
 linux-actions@lists.infradead.org, "open list:GPIO
 SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
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


Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Mon, Jun 20, 2022 at 10:08 PM Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> wrote:
>>
>> No drivers currently use mask_writeonly, and in its current form
>> it seems a bit misleading. When set, mask registers will be
>> updated with regmap_write_bits() instead of regmap_update_bits(),
>> but regmap_write_bits() still does a read-modify-write under the
>> hood. It's not a write-only operation.
>>
>> Performing a simple regmap_write() is probably more useful, since
>> it can be used for chips that have separate set & clear registers
>> for controlling mask bits. Such registers are normally volatile
>> and read as 0, so avoiding a register read minimizes bus traffic.
>
> Reading your explanations and the code, I would rather think about
> fixing the regmap_write_bits() to be writeonly op.

That's impossible without special hardware support.

> Otherwise it's unclear what's the difference between
> regmap_write_bits() vs. regmap_update_bits().

This was not obvious to me either. They're the same except in how they
issue the low-level write op -- regmap_update_bits() will only do the
write if the new value differs from the current one. regmap_write_bits()
will always do a write, even if the new value is the same.

I think the problem is lack of documentation. I only figured this out
by reading the implementation.

>>         if (d->chip->mask_writeonly)
>> -               return regmap_write_bits(d->map, reg, mask, val);
>> +               return regmap_write(d->map, reg, val & mask);
>>         else
>>                 return regmap_update_bits(d->map, reg, mask, val);
