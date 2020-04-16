Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB7B1AC998
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 375121666;
	Thu, 16 Apr 2020 17:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 375121666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587050718;
	bh=qyktDWyIxOzKbRIdzcqzJY7BhQiOjWuETy1SwrwuqvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ENvAi2M1TSmzpCoGbmR1LTdipJBjzFhavB8CKL6Te8VEurWGyciH5/rmn2FFOev93
	 gUAo20xJWfmGfEkTcpbaCk67o1dBAyEJGQhf7D5E9cO+yrfPIDsedY3AzB89c4kwJF
	 pCme5fa9uACznNpc+6drHb/ymFaFccR4kR0fr2ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE35F8014E;
	Thu, 16 Apr 2020 17:23:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D845F80115; Thu, 16 Apr 2020 17:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1242FF80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1242FF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qzuDzGpL"
Received: by mail-ot1-x342.google.com with SMTP id j26so3411556ots.0
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sDKDxRsvr9/0tnocd3cnf/IOYw0smGMIaggntAhf7sA=;
 b=qzuDzGpLCGu7BUgaNTFhhEejkw0MvAlN2DPmQLMrBqU1v4yWsiG1tEqyPbXbNvUjeo
 bLcBrNKgxIgnQVm4Pew28MRBLZUTdZVShPop7K3izBQBymzxAxLjDf6pXZI5xRsDE7L5
 DVkwvDK0nGVpckgYmdkRer8sDuQ5EMrmIx6eKhPKl4sCoDB7+KxvNX7MYKmPAjWWLCJ0
 iIre7bCji+qEPwN41tTHgeU2eKhSv57vbXZhW06MIRJSa+wsQRo27LG+aJYSnQM3YJF9
 26R5vq4zelVgz+BGRozeyaD1U/bEVK1Eq0pZrVtUTBjnxuO7kf4VDUqrvmuqMD08k6LF
 8skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sDKDxRsvr9/0tnocd3cnf/IOYw0smGMIaggntAhf7sA=;
 b=bT27Iq8dKYU2WsrW5g/uvF2s7rWE8fMnKRQl4Wf4Shk3RRmM5FE6kmyIodE7VTGiGq
 nzHeUSbZhp1SuUJygMxLdbdfXqrrNKLC06BIDE4FryWHAcRZPYUGmupZQNvMJDR11dQd
 JKizt92MLJZTr72qNEqXUx9Qbtp6ktl/syaLPO39N3iAAYcVKp4+ehmvPy9djAACDjuQ
 k1XubLkFsafZ+0Zdq5oK+Dyn8mL9cGzLGT3SvpOP+89rXvIG7BA4dJCK61Tmwf5snI5u
 L2EMguF0tZz4NQ5anMpTzTdYRTes71/2Z1YZO0VbmuWzxAA4GhCOkf4pphtj8h5/2yII
 Oz5g==
X-Gm-Message-State: AGi0PuY2DuSkHuGjlvihi+h5I0+D48mztzoxCFpKLRSGblzaT7Xo7o4F
 qW80VhlJuo4SqMx3XzzfZXH3zsDlRCJ03PCbxuw=
X-Google-Smtp-Source: APiQypJE2h+x6KBr6qqRxBMg3KHROW+KikW03R+TXV1d2SClZNdS7Dc8Qzpwvc2hixH/5z7JnCNbiVjdFOBVmuUm0oU=
X-Received: by 2002:a9d:19ca:: with SMTP id k68mr27607601otk.232.1587050605773; 
 Thu, 16 Apr 2020 08:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200416001414.25746-1-TheSven73@gmail.com>
 <20200416001414.25746-2-TheSven73@gmail.com>
 <20200416124239.GH5354@sirena.org.uk>
In-Reply-To: <20200416124239.GH5354@sirena.org.uk>
From: Sven Van Asbroeck <thesven73@gmail.com>
Date: Thu, 16 Apr 2020 11:23:14 -0400
Message-ID: <CAGngYiVXk+1Qzs3yLwyne3X567_yvbuRfXkjihmGc0EigHo50A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ASoC: Add initial ZL38060 driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>
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

Thank you Mark for the constructive feedback !
A few follow-up questions below.

On Thu, Apr 16, 2020 at 8:42 AM Mark Brown <broonie@kernel.org> wrote:
>
> > +++ b/sound/soc/codecs/zl38060.c
> > @@ -0,0 +1,643 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Codec driver for Microsemi ZL38060 Connected Home Audio Processor.
> > + *
>
> Please make the entire comment a C++ one so things look more
> intentional.

The 'weird' combination of // SPDX and /* Description/copyright */ seems to
be a kernel-wide standard (for C files, at least) ?

E.g.:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wm9090.c?h=v5.7-rc1#n2
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/wm8904.c?h=v5.7-rc1#n2

Ok to keep?

>
> > +skip_setup:
> > +     if (priv->amp_en_gpio && tx) {
> > +             /* enable the external amplifier before playback starts */
> > +             gpiod_set_value_cansleep(priv->amp_en_gpio, 1);
> > +             if (priv->amp_startup_delay_ms)
> > +                     msleep(priv->amp_startup_delay_ms);
> > +     }
>
> This external amplifier support shouldn't be here, if there's other
> devices in the system then they will have their own drivers and the
> machine driver will take care of linking things together.

In our application, the amp is a "dumb" class-D amp with a single enable line:
https://www.onsemi.com/pub/Collateral/FAB3103-D.pdf

I am not sure how I could make this more general. Could you point me to an
example somewhere in the tree?

>
> > +     priv->regmap = devm_regmap_init(dev, &zl38_regmap_bus, spi,
> > +                                     &zl38_regmap_conf);
> > +     if (IS_ERR(priv->regmap))
> > +             return PTR_ERR(priv->regmap);
>
> devm_regmap_init_spi()

I wish !! This chip has complex SPI addressing, using an "address" which:
- is variable length, depending on the page of the register being accessed;
- contains a field with the length of the data to follow.

Unfortunately, during firmware programming, multi-writes are mandatory
(usually address header + 32 data bytes).

Implementing my own regmap_bus looked like the only way out.
