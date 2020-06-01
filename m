Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1F1E9B47
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 03:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57F3E1698;
	Mon,  1 Jun 2020 03:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57F3E1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590974787;
	bh=x3q6tAQxZbzWLNWp+EzpZxtpjFppd67U8ALjqG/T71Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fpO6Okmftr8398QbsFVyGRL6qQBnWP2lOC7JHARkGtwZnWGx4eEwp7vHalM589G6d
	 1uMqCTl7DiE8QOq45V0lmR3UtDAt3EeaaeUH3xXPZAAXIGPyRFmcdwtOeh/yOxxWz5
	 seM6618ziK6k5FQUKJ75NT4xGRPzZ2WWayu5t/Lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EA2F80213;
	Mon,  1 Jun 2020 03:24:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4CC2F8023F; Mon,  1 Jun 2020 03:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92425F800D2
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 03:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92425F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kxJQF59b"
Received: by mail-lj1-x244.google.com with SMTP id m18so6126511ljo.5
 for <alsa-devel@alsa-project.org>; Sun, 31 May 2020 18:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7YhQH8I2I3NjxjK27pEINQezU+RgZa56+2s6b1VECNM=;
 b=kxJQF59bGNtUydcDUuV16HcI8FvlqgLfyAkWAqIXcJTzMNbXEmTKsC8DtpxH0EzX2e
 sJn8sm/bH7sjBmuMnPlxMqzZI5JLte31xRJHRr5XkMUPo4XWqXPLG8wN/nrXwQPzGG8h
 GZhTJd+B8nteMqWigdB2pXZHMlCgyOf6EFYKXtv0/6NI21oH0IgoUS+mogX/3LirEnOw
 KfWZzAzIZYXn7ofwnLlkBpskRERMezT6sQ4r49eJ+dE5QGNaUrCjux+LkzBCHTc2QJbd
 3Daj03nPQIfIiq5+KEqmwhu76rUbM0GE0VfhW1m9QnOrww+MUkgKN1TBY7zDyxcWla1C
 eKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7YhQH8I2I3NjxjK27pEINQezU+RgZa56+2s6b1VECNM=;
 b=k5eFEYkuC6j7P5lGYhLOxw8qt1H1GZO0W2hr3caeTHkXuF93HNMCnvfaWGd+D0ckxT
 CespACJO7HzD9tqXKdFKfgEF3Q3s37RdqlSQhR+4IfSwD5n6BR/IhwJfSKUNsAeKDCCS
 e4I0akNZyYUyJ1PILlKkfUFCLqBIH24mo0PBShM5L2a0KIKhZkLHfZ9i03Abi3q1clTU
 QRhDcEPWwhNuI8j6s8S01KsEl6xAl4eDccZuVTdSNTlyoKkgNAzLMdh3V6XjJoT1kMpc
 MjAurXZHcHf6b45qKA1qm3tVq+ybcwsbYLVWc/99yFBlXcfOVbZO2lFWQmPN35qKO1O2
 /t7Q==
X-Gm-Message-State: AOAM530eAIIlS6hBh7f2yQlOSNPR/Ws1tXdO5L9S8LjO7izCtY2LQFxw
 fv63Dzbx757tRLcUX7b+U3Om06PBBawDxZri2rY=
X-Google-Smtp-Source: ABdhPJztAAqlzWoZXptW+WMrbkw+sZ1Zs06fNPzwuk1dGmymYCi9KdhB/cd0Q+4V9l6beKHigLm33Isg/7gWGgTwgmk=
X-Received: by 2002:a2e:5712:: with SMTP id l18mr6938608ljb.87.1590974672898; 
 Sun, 31 May 2020 18:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200528103942.17432-1-steves.lee@maximintegrated.com>
 <20200528115408.GA15800@sirena.org.uk>
 <CABff4NSc6oW9dt-2VbdKUnk=+8Tc52m8f2irr1P4_cGyXNq41A@mail.gmail.com>
 <20200529093502.GA4610@sirena.org.uk>
In-Reply-To: <20200529093502.GA4610@sirena.org.uk>
From: Steve Lee <steves.lee.maxim@gmail.com>
Date: Mon, 1 Jun 2020 10:24:21 +0900
Message-ID: <CABff4NR4AE6FEN-szVJ_3df=4k1t_tVTH4ZAHo_TsbLKhK4adQ@mail.gmail.com>
Subject: Re: [V6 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 ryans.lee@maximintegrated.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, nuno.sa@analog.com,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, geert@linux-m68k.org,
 dmurphy@ti.com,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Steve Lee <steves.lee@maximintegrated.com>, rf@opensource.wolfsonmicro.com
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

On Fri, May 29, 2020 at 6:35 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 29, 2020 at 05:04:36PM +0900, Steve Lee wrote:
> > On Thu, May 28, 2020 at 8:54 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > > Reported-by: kbuild test robot <lkp@intel.com>
>
> > > Don't think the lkp bot asked for this driver! :P
>
> >   Thanks, I will send split patch for this.
>
> No, just don't add the line when it's a new driver.

 Now I understand, thanks for guide.
