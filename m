Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C891ABFE7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 13:44:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4451662;
	Thu, 16 Apr 2020 13:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4451662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587037469;
	bh=PMemjoCt4EMKF+iaj5mfbjvOgSWo2uOQlvsUZEFak2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BPjkCJqIPVWlBuC9cHXhjcBrA803TDBbQvB6dMFXlVAdfpiZg5Ypi+WfhiGFKy40D
	 52XeJ5sxRDDUOoOBCIcUtkClfosZHvG3ETNAP14vDbS/vkCcS1ina6yDti9KQPOnMs
	 ZJI2tKWeIevkpdvW1pu9+zIj9ETbwGYtvtZReiLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A1DF8016F;
	Thu, 16 Apr 2020 13:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2B03F8014E; Thu, 16 Apr 2020 13:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6D24F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 13:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6D24F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="d+ge5ueO"
Received: by mail-lj1-x241.google.com with SMTP id z26so7392801ljz.11
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PMemjoCt4EMKF+iaj5mfbjvOgSWo2uOQlvsUZEFak2w=;
 b=d+ge5ueOEBxL85/Rug3S7EEuX77yMsrtiKnGUaRtQ7w1l8OIu5l5bvFy7ZuS4+iIDc
 vEuvxgrjdYRMjzfB1i5140XxLorLvTk+XhU8Lw4ySKdwNEyiBqJ1e11vOAimeEDdeFsq
 d5G10/xEhTp5FHT0pJH7mGsdf7DK30sWc0QPDKj4xkmzQvUvk97GJouZCpzE97tjVwAk
 5vuoYW/mt34Hi9rtm+iEnu0/oKgBGroShdTRV5HUW+iduqhk9LagtACmFRFCGZT7azR9
 htL5Wotiu2zhlKEoa4o/iQd5efO8JDhDuyekp+xZ2jonjMgCc03NFrnveMG4VUo2epW5
 6Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PMemjoCt4EMKF+iaj5mfbjvOgSWo2uOQlvsUZEFak2w=;
 b=Y9ssceuE9HEwUoh4l5vc4zSfeon16fjN2u5WnK0T3WEdsFSDhYp7Zt4zhJyzsJW289
 9SlsV6EhCT37kR3TCRxpG56l6O1s8slKLXa+4BA0/7lfIiCDfAoz6/VwkaCBhUBQEmAB
 s+KRASHDitr2RqoR6YR++y+NBZUADMEnPHgJlIPgE/ztoEHwKBiVdy6AszbOaF8Ybbi+
 i4IJ3KU4Y6nLtGdoIGQMAKnIoSi7Jb64HEiFuSHIeTtyTDU8dke8mH5sTvx21inEp77b
 20YzvPA7pwijLmeqFD0dnVajgbU7fls5C6pv058iyKtMdX6OhTp4DdwScA6TqMFJqJIz
 aiAA==
X-Gm-Message-State: AGi0Pua4uR7TOnY0sIrYOgHGG7H5T1PqUkLU+rAFnP2W1enNbiZCLM52
 h5yJMoL28A0mdm0t7KuSBbAebTTck1GrBniB1EM1Lw==
X-Google-Smtp-Source: APiQypIiZuLzQrvYkiNeyORy157fLPptCAM8hPVcZFSfyIeA/0Aw/t8tq6u9+QYki+nEJa9ACas6eAvqHD2XaCatgUw=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr1319254ljp.277.1587037358214; 
 Thu, 16 Apr 2020 04:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
 <20200414170934.GA34613@smile.fi.intel.com>
In-Reply-To: <20200414170934.GA34613@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Apr 2020 13:42:27 +0200
Message-ID: <CACRpkdZRnSUhmVPKjJ6dWnSfhnvrAKUrBY6tWLkxPgT28CzbHw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Michael Turquette <mturquette@baylibre.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>
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

On Tue, Apr 14, 2020 at 7:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Apr 09, 2020 at 02:58:26PM -0500, Pierre-Louis Bossart wrote:
> > The GPIOs are used e.g. on HifiBerry DAC+ HATs to control the LED
> > (GPIO3) and the choice of the 44.1 (GPIO6) or 48 (GPIO3) kHz
> > oscillator (when present).
> >
> > Enable basic gpio_chip to get/set values and get/set
> > directions. Tested with GPIO_LIB from sys/class/gpio, the LED turns
> > on/off as desired.
>
>
> One question, can this use existing GPIO infrastructure, like bgpio_init()?
> Ah, I see, that one operates over MMIO, while we would need something based on
> regmap API.
>
> Bartosz, do we have plans to have bgpio_regmap_init() or alike?

Michael Walle is working on that:
https://lore.kernel.org/linux-gpio/20200402203656.27047-11-michael@walle.cc/

I think we should try to merge it sooner rather than later.
I can provide an ib-* branch for ASoC whenever we agreed
on a basic generic driver.

Yours,
Linus Walleij
