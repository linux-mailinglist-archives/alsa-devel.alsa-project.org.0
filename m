Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3934A64A8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 20:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27171831;
	Tue,  1 Feb 2022 20:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27171831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643742551;
	bh=/7nwD0857k5RRnuBuPkebfdRKv9VsIHTDSEpOD2PgCE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QY47iGj5pk7yO7eY0TcNI/Od78rLmvmqSfdBHF8xawmKcK1UwEcTRmZlugpLuycpT
	 CE1PH4oC83888du3+gxu5KvomaA8LzgKaKRLAOBBa2g+xWBzO/pquh8xNjLhUW35Ly
	 2l8b0QLK/ZM4jZiAjKx5p8Y66gi3rVHzdGPf7TxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BCE7F80089;
	Tue,  1 Feb 2022 20:08:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49801F80130; Tue,  1 Feb 2022 20:08:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8758F800F8
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 20:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8758F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="W4+gzE+Q"
Received: by mail-qv1-xf2f.google.com with SMTP id b12so16886441qvz.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 11:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+waSuOm7gTJoL9qmUGf7KzdBTnpQ7ZmpBxWBSsXeifs=;
 b=W4+gzE+QaDaRUkAZSUg56kP8piow+KiWPQMIfNZy8ELbQSvQkxBqoTtHWQfW9h2ues
 U8ZymGC+dc26VBK0G/CUK0C2eHc8JKrSTreZnS+nU9KuQytXutdjOLoKclfsYfbjgX6D
 PT6VFQcHjfOAuDg2sFhrONAdvDTs+atBhZw0ucTPBAggbOsGo90hNO/caQ+ZuiNrC0YP
 L7QmYxSI/Xqu2OJlIhLSkc+XdGPm2g7rRU3AiLfEdriEBGkhtqDr1SJeGPuvzp3Ne+i6
 cHeEfF4HUHUHJswUkNpqKJLYvQ52I9vciOGko/8GPUXhd9fDOxu0Zq1TakxkkNozJ2Mr
 LGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+waSuOm7gTJoL9qmUGf7KzdBTnpQ7ZmpBxWBSsXeifs=;
 b=nMAAl59o68q4AfsJgIEWv5YwnUEs29xuJRo3dZgNIYPISqSojedoEPxPFOjDYD6Sli
 nU1ERIz1GcAAPzlKPhLF/AWs5xPCX/XJh2E0VYlkT0Mz8z7C3Gkm8aUHzin7IxL9eZXO
 2ieAfkqmf52dLw8dO5k8GaK5KhxXbJI4mwTRpO0YYBad0rwJhhiIAxjt2jKwavOkQce6
 hfMTYU2MdP8QTilVjHLBvuM+PJEffVBwY3qSscrDcAvDd/AJCbhIqnCv0pdXtXq3GisX
 QqUJgMuC8sOp+9ZVtauInn7HOb+jiSSwf2aI2EnfvTYG6NKs3dkxfv5Z1W8jNKaWfoi0
 OWYg==
X-Gm-Message-State: AOAM531HzXn2/vhMEYX7eEpF3tPRWi5xjRvtiSv5MO1XwkD8prNZJiW+
 weJlx2Z+LCPygsT46xc6BR9tcQy9SnJS3PnqD+b29A==
X-Google-Smtp-Source: ABdhPJwdik6Ll1SwXUdVk6yTH1tugrp22/D8dW0wSkFsxErhkVuFI5cWL9tZCbwXDyWWCr8TTkSbMbjrwhXnrspgJ+c=
X-Received: by 2002:a05:6214:238a:: with SMTP id
 fw10mr23296031qvb.15.1643742476608; 
 Tue, 01 Feb 2022 11:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20220129000837.6207-1-cujomalainey@chromium.org>
 <a8ffb740-9f03-340f-a7ba-5e0f1a074b22@amd.com>
 <CAGXAbSq4+YY3qNt2c8J-P278QtUMTkJAo7x3=6UvJof4bH2C2Q@mail.gmail.com>
 <Yfl+rZEucvLEmFjD@sirena.org.uk>
In-Reply-To: <Yfl+rZEucvLEmFjD@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 1 Feb 2022 11:07:45 -0800
Message-ID: <CAOReqxgK54Gzz=L78Xh1U2bY+rPacJ86h+Ssy6=x11skDevSXw@mail.gmail.com>
Subject: Re: [PATCH] Revert "ASoC: amd: acp: Power on/off the speaker enable
 gpio pin based on DAPM callback."
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Curtis Malainey <cujomalainey@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Eric Peers <epeers@google.com>,
 Rob Barnes <robbarnes@google.com>
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

On Tue, Feb 1, 2022 at 10:40 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jan 31, 2022 at 10:39:00AM -0800, Curtis Malainey wrote:
>
> > > I feel instead of reverting this complete patch we can quickly submit a
> > > new patch set with "gpio_spk_en = NONE" for maxim codec case. As codec
> > > driver is anyhow controlling that gpio we don't need to do it from
> > > machine driver. We've already done that here
> > > https://patchwork.kernel.org/project/alsa-devel/patch/20220131203225.1418648-1-vsujithkumar.reddy@amd.com/
>
> > I'm pretty sure the proper solution is to shove this logic into the
> > alc1019 driver like it is in the max98357 driver. The header is
> > already there for gpio which makes me think it was planned but
> > forgotten. Otherwise everyone else who uses this codec and associated
> > pin will have to duplicate this logic in their machine driver.
>
> In general if there's something like a speaker amplifier that's just
> controlled via GPIO I'd expect that to be something that's set up by the
> machine driver.  If the CODEC is a GPIO provider then the pattern should
> be that the CODEC registers with gpiolib and then the machine driver
> uses that GPIO, that way the GPIO can get used for any other purpose and
> if a system picks another GPIO for whatever reason then that'll just
> work.

Just to confirm, by provider, you mean it has on codec gpio it is
exposing to the kernel correct? Interestingly, this appears to be
counter to the max98357a.c driver. It has the SDMODE pin which can put
it into a low power state. The codec driver appears to consume this
pin from FW lookup and toggle it on trigger. I am just curious why we
would not want the codec to handle its own pins? That way the control
logic for the pin is collected into a non-chipset dependent location
that is close to the internal state of the driver.

>
> This gets more annoying for ACPI systems due to their lack of
> standards based enumeration of course, the endemic reliance on board
> specific quirks causes breakage all over - it looks like this is just an
> example of some ACPI systems using firmware description and some not.
> Are the systems that need the hard coding here shipping, for example if
> the Windows drivers rely on such hard coding rather than enumeration
> from ACPI?  If we need the quirking then the fix isn't just a simple
> revert, we need to do something that ensures that the support for all
> the different systems plays nicely with each other.

The board this patch fixes is not shipping, the board it breaks is
planned to ship from my understanding. Eric, feel free to correct me.
We could do a partial revert and remove the _NP fields and both boards
would work (Sujith already sent a patch for this "ASoC: amd: acp: Set
gpio_spkr_en to None for max speaker amplifer in machine driver") but
I think we should still consider a patch to stop hard coding the GPIO
as it should be available via a lookup.
