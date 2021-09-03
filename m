Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B23D23FFBB5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 10:20:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3973C17D5;
	Fri,  3 Sep 2021 10:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3973C17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630657219;
	bh=5XnbT43XNelwVSFbOCPm8TT6AOB79w1sRRWE1DJJSAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WElqsJZJ6GMwtiLDtv8irrswYHU9aQbbIBcQoAYsGUGmCRCqpmqAGv38ikrONnafp
	 HriugpK39P8uRyKNfcLCtFvMoxWNpB3W+/mWdNtTXnMcW4T6RekfZVe6Wmv9Orq7Pv
	 zTzpyQdknXKfodcrF82PeeeKBEAVRFp6TKgwhAaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF98EF8020D;
	Fri,  3 Sep 2021 10:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1DA8F80254; Fri,  3 Sep 2021 10:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 431BFF80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 10:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431BFF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gn1LEqFm"
Received: by mail-pj1-x1030.google.com with SMTP id
 j10-20020a17090a94ca00b00181f17b7ef7so3339258pjw.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 01:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Phy4y+hK8VUG7m5ozeRhmhn2qn7hHWlVNnFuLnJTpjc=;
 b=gn1LEqFm5OmaNC3OgzH7jznj34Dikd547FTlAL9TVFOAYlYNHJPfhekk0eQk2Znxs5
 uocl0YFazDRkIFKdYErCaJjcR9vmP/H0TUon3uc+OsyKZCbuJBZHYRcIlwIkoXl2+THw
 R8hfIrWbdRc5th9rjyA1lHcLWd/Sl6XlKt7ET3Z7ujJDROG6UA1RvQwAZWNITFmAxand
 SIayzdGpAtmLJM+6KSnHENivuL7g1CPNhLugr+GoPRzmI03HNG4Y2KWT2o24vKq8UVgb
 Hxdbtb7A4TAFGSLGWXEZKGPHPZTD/yfwV9ob+lru6nrVqra51xGzyRTfSQ7WeuWmu6ow
 uSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Phy4y+hK8VUG7m5ozeRhmhn2qn7hHWlVNnFuLnJTpjc=;
 b=ms3XiZv2lOMsJIAShB5IfmlPHZZWCFe6KrQ0fiBNWIyrw9+q9IQil5389w4R/LPSMm
 jHNXeu3rgODQG3oifAMhlirC8Avfx1lQmhX92KhVYUyHHPl2pMKqaujui7UA6O6iWq1l
 4HTelhlYeYI5GJ3Acv7zGjx2fiNLDh7hATrw3kvMIru9P1ys7mzhI9XcmesBpBKLt+bp
 Zb3BZ6vmIQokK/+gNLqI9RlGrKxrGqlcl/LfhBJ0N4AJ3lDer1U8P8fTLqSSBLdK6hNA
 8v+BTWA9fs7vJ4WUIzZegHtQnD4q+l2GDADE+IKP15WvRKDdPoaC5xFGv6KwA7JjCwj4
 VzKg==
X-Gm-Message-State: AOAM533Ieaw3jtqQkzO6l6RtZ6bd7U1Sgb0uW/aSHZuWSCIx6yzO9fvd
 SbRK/vYvPkCaNgqweI/pjM+buhnR9RDmc7ozKkY=
X-Google-Smtp-Source: ABdhPJzjcz+T/rpM2xV4DX89iiUWYDC/IW9iTMT4R5z5HfU9u+eFFYZ/UnNTm5DTP0q6HUPwup3yQ4pjf3XiPYLlZwk=
X-Received: by 2002:a17:90a:6502:: with SMTP id
 i2mr8685279pjj.129.1630657130779; 
 Fri, 03 Sep 2021 01:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1630632805.git.atafalla@dnyon.com>
 <04a18f4115539752429da55fb857834cea0944e5.1630632805.git.atafalla@dnyon.com>
In-Reply-To: <04a18f4115539752429da55fb857834cea0944e5.1630632805.git.atafalla@dnyon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 3 Sep 2021 11:18:14 +0300
Message-ID: <CAHp75VeD8sbxcu==BF97yY4ZGtLbNAQSiTxq2cDvBSdCpXxsyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: max98927: Handle reset gpio when probing i2c
To: Alejandro <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Fri, Sep 3, 2021 at 4:51 AM Alejandro <atafalla@dnyon.com> wrote:
>
> From: Alejandro Tafalla <atafalla@dnyon.com>
>
> Drive the reset gpio if defined in the DTS node.

...

> +       reset_gpio
> +               = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(reset_gpio)) {
> +               ret = PTR_ERR(reset_gpio);
> +               return dev_err_probe(&i2c->dev, ret, "failed to request GPIO reset pin");

Not sure why my comments have been ignored here.

> +       }

--
With Best Regards,
Andy Shevchenko
