Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD8350B920
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0CA16C2;
	Fri, 22 Apr 2022 15:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0CA16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635485;
	bh=SVJ1k2v3tWdUGg+iydyQsi4Bq8zjjEYtWiKbWgwFaLw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vx7P4fjMy9bkV4S/cET1bphn/g07Ehrrh0POKcRALNCVjszWgU6wHEyM01r6P8P+I
	 /QIfxO3zMUGGRf30lF8ln5oi2S5PNLxiwGhT7z8oEarWD0OZAurze4iZ8CvKzE62zX
	 N2v+RLdBmmbyWePMhuFEh789gsWzZGfKWvuxU8wI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8002F8081B;
	Fri, 22 Apr 2022 15:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42DD2F80125; Wed, 20 Apr 2022 13:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F98F8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 13:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F98F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sQ6L9Sz7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4773661939
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 11:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6B3C385A0
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650454351;
 bh=SVJ1k2v3tWdUGg+iydyQsi4Bq8zjjEYtWiKbWgwFaLw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sQ6L9Sz7HsTeFplAqNVVqZ6QvDLXO7taCfdy4bCI083iKPBu4Tu1W3tAjRXjBMJP+
 vEnLCGH51YORxEsFGOcZi/zoMsoYQoogO656Bx3dJCN3iokeUHMcZ/sRdJXG/FEfPy
 OVbCsNPPUvMBA4ygYO3ABwIPljbcDkM69w6wy8bq4hi0dZRIAMv8YMoKSdGB49RoPV
 7T06gmGwLx2hqcDTbF36X1GFj0Gux2+ukzAt7yv7JaGdNy5Qv43jNDhgQacW6a+5lC
 7ziU5CwWVIqq9dL54xJaRWmMjZZOJMF8J98DaHAPKZKsUB+PqhqrA4wPmQhlfKvBIW
 qSWfkWYIEhJww==
Received: by mail-wr1-f48.google.com with SMTP id m14so1846759wrb.6
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 04:32:31 -0700 (PDT)
X-Gm-Message-State: AOAM530/q3Oxqqh6/0QvG1CUvmLevtNHP4YEzvy6Re5hT5/3YwIdkC/T
 v2ABII7Z3KXKYb6/W0TgZcDH2jizOLVIuPjmel0=
X-Google-Smtp-Source: ABdhPJyiDPtmjdTUE7gVl98mXVlPUP43tSlAHIUMCCxTRsYmEILlWV1BOcaVw3t9k0Uq80bvmC166gAUNNWM192dlCo=
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr15873027wrp.407.1650454349319; Wed, 20
 Apr 2022 04:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-2-arnd@kernel.org>
 <ddaf112d-f997-84b7-2c57-bab3d0cca382@gmail.com>
In-Reply-To: <ddaf112d-f997-84b7-2c57-bab3d0cca382@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 20 Apr 2022 13:32:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+5p5i2Nxy6AxH5qDsVqqxwSR_5ufjoYCALProSLNspg@mail.gmail.com>
Message-ID: <CAK8P3a3+5p5i2Nxy6AxH5qDsVqqxwSR_5ufjoYCALProSLNspg@mail.gmail.com>
Subject: Re: [PATCH 01/41] video: fbdev: omapfb: lcd_ams_delta: fix unused
 variable warning
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
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

On Wed, Apr 20, 2022 at 11:24 AM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 4/19/22 4:36 PM, Arnd Bergmann wrote:
>
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > A recent cleanup patch removed the only reference to a local variable
> > in some configurations.
> >
> > Move the variable into the one block it is still used in, inside
> > of an #ifdef, to avoid this warning.
> >
> > Fixes: 9d773f103b89 ("video: fbdev: omapfb: lcd_ams_delta: Make use of the helper function dev_err_probe()")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/video/fbdev/omap/lcd_ams_delta.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
> > index bbf871f9d862..01944ce46aa1 100644
> > --- a/drivers/video/fbdev/omap/lcd_ams_delta.c
> > +++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
> [...]
> > @@ -145,7 +144,7 @@ static int ams_delta_panel_probe(struct platform_device *pdev)
> >                                               &ams_delta_lcd_ops);
> >
> >       if (IS_ERR(lcd_device)) {
> > -             ret = PTR_ERR(lcd_device);
> > +             int ret = PTR_ERR(lcd_device);
>
>    How about inserting an empty line after declaration?

Ok, done.

        Arnd
