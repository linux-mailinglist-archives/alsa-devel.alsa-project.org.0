Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABD6507204
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 17:41:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E831B08;
	Tue, 19 Apr 2022 17:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E831B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650382900;
	bh=/AUFVvDoKF2O0HMcXpISCcajxDkK53QK+FfXKXNGpqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRxfrl5UYRdquzJ6JTA6GKpbhb8HIy2iuDy0f7oqcxaIawz6+JeSxwgtWppDJgEN+
	 7efIlUe6HVvjY9ESgwjMmT3R/FtZltCIyqeCoExPm8i+oWRZHx8iGAcb27lBQmr3ca
	 BYlyyDdHjWyp6UwJ5RgZDhATwY4V/ZEkYiq5qmLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91BC1F80269;
	Tue, 19 Apr 2022 17:40:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE585F8025D; Tue, 19 Apr 2022 17:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82AE3F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 17:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82AE3F80121
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N17l4-1o4JrT3fDu-012UWY for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022
 17:40:37 +0200
Received: by mail-wr1-f53.google.com with SMTP id x18so15138147wrc.0
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 08:40:37 -0700 (PDT)
X-Gm-Message-State: AOAM530AMOr75UqezT8QnbbBlUapDKV92x8BkQTIac14y/9mvcK2/7Zc
 APZKUt2WiD/37lH6BXJcvqao98neUTF3zdaJnOU=
X-Google-Smtp-Source: ABdhPJx2j14opnoXVu+zRZ4O7R0W4B6Te+BYkmuTotpIld2KFF5dVZxiMPz0Ry5HHgFRVQndxUG068ioQAMMaGHobtE=
X-Received: by 2002:a5d:6983:0:b0:207:a226:df4b with SMTP id
 g3-20020a5d6983000000b00207a226df4bmr12156987wru.192.1650382837528; Tue, 19
 Apr 2022 08:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-21-arnd@arndb.de>
 <87o8y0lgs1.fsf@belgarion.home>
In-Reply-To: <87o8y0lgs1.fsf@belgarion.home>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 Apr 2022 17:40:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Rwh-+483nxgWhmst8VdEByb8HCE8H-mEhb=Laq9qc4w@mail.gmail.com>
Message-ID: <CAK8P3a0Rwh-+483nxgWhmst8VdEByb8HCE8H-mEhb=Laq9qc4w@mail.gmail.com>
Subject: Re: [PATCH 21/46] ARM: pxa: spitz: use gpio descriptors for audio
To: Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:bZlvTkZtMwdWSX/pKHPy1RfV7mMT3bEnLZMlGKJsXT7SBQomB1c
 vh+MsFPBi4kJdOSTjRyl61iY60ChwtGrGSlGlMAe9pnI5GIQ1R1hD/8PMo/acMxb3pH+3/1
 IQO9eSdGkw1CVI1jtTDam/bTDV88/SnkkeqAw3hIzUtlOh6cH9RbBItu3GYFBNOiuB6/Sud
 T7lWpHx5dj5DxfLtX2/kQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LJ73rHbhZpc=:f/zKKRRGGPpO38Iwuz4GFK
 fySVzr7TIz2u3VNhfHLlJYQ3h37f7pxhWcUiXvqrxITyWZMTnXyZbJY60drhBcFZRQ8ej+IZj
 Hi4rXZev6bBTUm6gObamrful8n6RsXfsuXUSQnv1KbAjcQNk6z+u++WI8VL535b3Anz9KbbVP
 THKtcAKGPJzm0MkMjIgPbc6wIML/6D5oOM55l/T4icZpMIbqjrFss9/jJqFTvron8f0bn3KVE
 invwn5TuBgp5pn109G4j0KmO4ZVCjGmO6nw+fOtCfU7zIwKZgbYgZ9ZMYoB4R9pp1QPlZcieW
 QIAEZD8zfICfo1MHOQxq35r7UiMKFF3YiSPKQKxTUGyPJ6dQf0QaRdSzbsSkrv11qeyJGtasy
 Yn5Fi2IaRcYnmFOhP4zTdrKnLwYwCm4Kf+Y268ONQs1X1yU+qZ65HdjCZgNyIXvo745+PYl7z
 6N8NobfFHAknRWZCXilpnrkaL6Gvmj8BEtRLheRCMCbS1L2Hi/YM8IcAAJhP6EmMnkm1VaQr/
 cN9/RPSt07Oqa7xy3Ac5h/Mn8C2Iak90PNOfSKrWJHbLSYZcxUKfmE4Pch4ZZhMZ8wqKQot9Q
 Bnq/tUDJDMncOd5HKK8wPUO4EiDbRIB7gBYE3T0MxdgzL5EczuAE22iPQrhHtR2D0Og04Y7in
 ObOqxb9LSS7sLlFHOJ3/5vlA81aBTlPSB06xfEJkB3z695Fp+sm8qj5n3ZGqzyp5yywA=
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Daniel Mack <daniel@zonque.org>
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

On Mon, Oct 28, 2019 at 10:08 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> > +static struct gpiod_lookup_table akita_audio_gpio_table = {
> > +     .dev_id = "spitz-audio",
> > +     .table = {
> > +             GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
> > +                         "mute-l", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
> > +                         "mute-r", GPIO_ACTIVE_HIGH),
> > +             GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_MIC_BIAS - AKITA_IOEXP_GPIO_BASE,
> > +                         "mic", GPIO_ACTIVE_HIGH),
> This last one looks a bit dubious, as it looks like a gpio on a gpio expander,
> could you cross-check that "gpio-pxa" shouldn't be an I2C expander gpio please ?

I'm revisiting this older patch series now, this was clearly a mistake
in my original
version, changed it now to

@@ -982,7 +982,7 @@ static struct gpiod_lookup_table akita_audio_gpio_table = {
                            "mute-l", GPIO_ACTIVE_HIGH),
                GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_R -
SPITZ_SCP_GPIO_BASE,
                            "mute-r", GPIO_ACTIVE_HIGH),
-               GPIO_LOOKUP("gpio-pxa", AKITA_GPIO_MIC_BIAS -
AKITA_IOEXP_GPIO_BASE,
+               GPIO_LOOKUP("i2c-max7310", AKITA_GPIO_MIC_BIAS -
AKITA_IOEXP_GPIO_BASE,
                            "mic", GPIO_ACTIVE_HIGH),
                { },
        },

I'm not 100% sure this is the correct name, as I don't fully
understand how i2c device
names are constructed. I see that Linus added a device name in commit
32d1544880aa ("ARM: pxa: Add gpio descriptor lookup tables for MMC CD/WP"),
and I guess I could do the same here, but I think that was only needed
to disambiguate
two instances of the same device in zylonite, which is not needed for spitz.

       Arnd
