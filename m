Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2107056B3
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 21:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5197810E;
	Tue, 16 May 2023 21:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5197810E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684263924;
	bh=TI6HLvuKh/DN+JWZkwAxn440t9SvhKVCOBOH/HBTjkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ArWO6Sil77yMS5hha/1YQikJ0vNeXchWckEwLrTN9SCBRSaTATRPi6xxnxWY55Yz/
	 bmYgPO2nFYUgpTErdE2/1XXV+RdzfEQzWNnBsvuHl6mkBl21sR/trVbSNoTcql/NEq
	 WtZNAN5dj8u0zF/fEprhtyZH9BMK0aN1FAE5p2dI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93D0CF8016D; Tue, 16 May 2023 21:04:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E5EBF8025A;
	Tue, 16 May 2023 21:04:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DDBBF80272; Tue, 16 May 2023 21:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 134A5F80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 21:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 134A5F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=YCIgNOuR
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6216a09ec38so29082896d6.3
        for <alsa-devel@alsa-project.org>;
 Tue, 16 May 2023 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684263862; x=1686855862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX3aJGWh9j6fi4Zbxck+TdbVfuJLOzsnRuRtmwi0h5g=;
        b=YCIgNOuRxAGICG9PO3E4TWClRO4dC2m/394gwLQCEMGSCGSS4Fnoeaw3K+gtklgHAg
         MdrbkFj/7njcvYzyOUWGHe1FncyZ8sq1k7sX/eLBXRPeYSVFEHNLNt/Xma/Q0PYH5neW
         gPimepduH6uaEniGwLeolbNIZGqj2ov/0L0Mzq0xwUsDQ1q0lhiFZSlUDE96O3qJMO+Z
         g0sDwu5o68R0llVAr/YZibnTjl/qi8g6CnDNRA4M9d0t3wBJjSAP2Fk+7atKWiG4eokF
         s1yhRCh9YfhruWLp2AoNq/KkzLaNtN0cbBTCR6CCgIVoCEelGe7WhJ8eaGpCkVKE6di4
         fjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684263862; x=1686855862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX3aJGWh9j6fi4Zbxck+TdbVfuJLOzsnRuRtmwi0h5g=;
        b=JPw5tiy2cDMZozJgDnCARLWUmB465veQTB4/YLXVnAxq4Xv7dF7Hg2v+nAgxL9oom2
         koPxePgNYdF1yPwjR1ic1vKojZvRaYAlIEbFDaXnmSIzzvK6DF+h0fy7nZeG2idIazsX
         Gg2Eha/A+p9TdPrf3Jpw4yZGbzgmkXeg6cMkOCAKdnxP2Zlgdwm9vZDFYeKNRMUtD7gE
         AduHNLZo0NGcXA/6Ih9wIR7nROZ7/F8bWEmtPnEnpF65HVNztYJgqs7rBfMpX87sANRy
         yISBnrIGIaGcuayVkB8dD8SFn8fzLz1Gj7So1zxBeVmlZlMG/+wWW5iucUYeVrhKk4W1
         5Qkw==
X-Gm-Message-State: AC+VfDwyuAwAxGGUjBJpolkvFoAy34myhwuEcRm5CEUmw8stMb8omDkY
	kpzZ4FCTUEyBUVHBNfIzmeQH3sYXEBdjkMgCJVA=
X-Google-Smtp-Source: 
 ACHHUZ7o8SFUdFq9oKXTGUhKpKM024MomgycM5cRyraXgXMUY8hYYFWGvp2kmKAoXAMuXsr50mnQ+x3iKUkHuJVog/Q=
X-Received: by 2002:ad4:5dc9:0:b0:623:557d:91a9 with SMTP id
 m9-20020ad45dc9000000b00623557d91a9mr17484711qvh.31.1684263861900; Tue, 16
 May 2023 12:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
 <ZF6RMqElYZVMpWRt@surfacebook>
 <20230515101350.GS68926@ediswmail.ad.cirrus.com>
In-Reply-To: <20230515101350.GS68926@ediswmail.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 May 2023 22:03:45 +0300
Message-ID: 
 <CAHp75Vcizrucc-2KFdFNeHNrxCzz4GwX1OzZYyjPH7P9RgnKYQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] pinctrl: cs42l43: Add support for the cs42l43
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de,
	maz@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
	lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LGHJAL5HX6O6G5ECYLUEPGKAS2SPZXOO
X-Message-ID-Hash: LGHJAL5HX6O6G5ECYLUEPGKAS2SPZXOO
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGHJAL5HX6O6G5ECYLUEPGKAS2SPZXOO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 15, 2023 at 1:13=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Fri, May 12, 2023 at 10:19:14PM +0300, andy.shevchenko@gmail.com wrote=
:
> > Fri, May 12, 2023 at 01:28:36PM +0100, Charles Keepax kirjoitti:

...

> > > +   dev_dbg(priv->dev, "Setting gpio%d to %s\n",
> > > +           offset + 1, input ? "input" : "output");
> >
> > How ' + 1' part won't be confusing?
>
> Kinda an un-avoidable confusion somewhere, the GPIOs in the datasheet are
> numbered from one. So this makes the debug print match the
> datasheet name for the pin, which is used in the pinctrl strings
> as well.

The problem here is that the entire Linux pin control and GPIO cores
in their debug/info/error messages will use offset + 0. With the above
invention it will well make users confused a lot. I think you need a
Linus W blessing for this.

...

> > > +   if (!of_property_read_bool(dev_of_node(cs42l43->dev), "gpio-range=
s")) {
> > > +           ret =3D gpiochip_add_pin_range(&priv->gpio_chip, priv->gp=
io_chip.label,
> > > +                                        0, 0, CS42L43_NUM_GPIOS);
> > > +           if (ret) {
> > > +                   dev_err(priv->dev, "Failed to add GPIO pin range:=
 %d\n", ret);
> > > +                   goto err_pm;
> > > +           }
> > > +   }
> >
> > Besides the fact that we have a callback for this, why GPIO library can=
't
> > handle this for you already?
>
> Apologies but I am not quite sure I follow you, in the device
> tree case this will be handled by the GPIO library. But for ACPI
> this information does not exist so has to be called manually, the
> library does not necessarily know which values to call with,
> although admittedly our case is trivial but not all are.

Why can't the firmware provide this information? _DSD() is a part of
ACPI v5.1 IIRC.

Although it might require moving some code from gpiolib-of.c to
gpiolib.c with replacing OF APIs with agnostic ones.

...

> > > +static int cs42l43_pin_remove(struct platform_device *pdev)
> > > +{
> > > +   pm_runtime_disable(&pdev->dev);
> >
> > This is simply wrong order because it's a mix of non-devm_*() followed =
by
> > devm_*() calls in the probe.
> >
>
> I had missed there are now devm_pm_runtime calls, I will switch
> to that. But I would like to understand the wrong order, remove
> will be called before the devm bits are destroyed and it seems
> reasonable to disable the pm_runtime before destroying the
> pinctrl device. What exactly would run in the wrong order here?

At the ->remove() stage after this call an IRQ can be fired (or on SMP
systems any other APIs can be called), for example. So, would it be a
problem to service it with PM disabled?

But in any case the shuffling ordering like this is prone to subtle
bugs. I prefer to have strict ordering if there is nothing preventing
from doing that way.

--=20
With Best Regards,
Andy Shevchenko
