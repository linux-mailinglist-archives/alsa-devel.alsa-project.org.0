Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2264D7B49
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:09:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A790E18AE;
	Mon, 14 Mar 2022 08:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A790E18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241768;
	bh=BxrdF7+pjZIA4s7HZhixZnl4QP+gphepUj5sU1G4nFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A8eI5/QdMqgvpLn6xBb7hXyRsuVhUFiOfl2I1djHM3mPLmoq8eK9fqlDfYB4zNrX7
	 Ki1xHqDhKt+wu1YhGEMSdTo1eQdQ0R2gMAoBKJJkMd16e94UZ2KDpXtZEYQ66QZk+Y
	 fwvX4F2p9FuUQmjePkdN9VydpPhgUTPH2318VFpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 833E1F805F8;
	Mon, 14 Mar 2022 07:59:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37E8FF80310; Sun, 13 Mar 2022 06:43:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83937F80095
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 06:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83937F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d15j8gZE"
Received: by mail-il1-x141.google.com with SMTP id l13so8778069iln.13
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 21:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yeehAnwXiFpjq47LCkJzC+vZeMh+kdhUAc1wvTjLTKQ=;
 b=d15j8gZEJQ2cUKh8lIyS1UGKxT0GQRDadj6U6b5zp/zFIkaK8rHI0s8XZuz4eqi8ob
 I3K6xhmzr5iV/ZIk+GweWX06qMX0wTcI41QSx+nyDNUrsaSHf4KK9ipFE2F9udgT4r1/
 bMRzGQrpRmnoWIS+vkfBy3Uku9G+ZJzXECwUIcznZ1g25LQtEeIIspETWyFJr/lUj85F
 oCGYCLmFGRNpviEw5oYvW/gDFKnBJ8waBRZjdNRb+e9mQEYuTZln7NGY7ZBd4ZKcOyr5
 gPw554sJanMM/5vvrGRKQWpsXIDM7yBzFMu1YXvqqftKcvu/HCfQVgOMJMvpd8oJPG+8
 cWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yeehAnwXiFpjq47LCkJzC+vZeMh+kdhUAc1wvTjLTKQ=;
 b=Oz99v9ZpwvYTLxw0koFBEpmGnwA8GAsOS9uiNfvNfUFa5uArYO8R1it5RXUMn8tpnu
 lTOnwEHwLHASEYQcRA07crkgKyvxLruRwli8fCJzvD0QQBakw3v86Y0HfyPO2jQJlKul
 mitwE6vCixfNJxQlRtev9Wmy/Eu8XY2SqMEpvc/xF24EDhVnz8+K7xzEarLzLV7vi8y3
 NS2HAxWT/O6wQFWr26aGRyzKFM8ahkkWjPjTCEJf/AnQ2Z9kYSKg1/96hdokG8Mnzx9r
 +NZcX9uJi0+nhMvAfj8f6SYVDtnQJWOu/M5gM/yotfI1b6q3ttG22zCCG3royNP7Rn18
 MRsg==
X-Gm-Message-State: AOAM533/HqRIQMxEzKKJvbvKSF+438sB7gZxoRi8A1fKhLJMOSnoiGOJ
 l2H2TWSR0TeSmc/4Eyd9h0Yuz+/NogBLw3OyUgk=
X-Google-Smtp-Source: ABdhPJyLTEK5UR27XDcIpYknILzSaUN8Y3JJAFOiT/4220BDdd+8py7fiGMLjHgDdFYZ9jhehUyR6JKiC7uNev8Uebs=
X-Received: by 2002:a92:cdad:0:b0:2c6:7b76:a086 with SMTP id
 g13-20020a92cdad000000b002c67b76a086mr14632088ild.5.1647150181750; Sat, 12
 Mar 2022 21:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20220312002429.16175-1-steve.lee.analog@gmail.com>
 <8f4a088ffc0fc1d4aa14aa1d0adf575cdc94291b.camel@gmail.com>
In-Reply-To: <8f4a088ffc0fc1d4aa14aa1d0adf575cdc94291b.camel@gmail.com>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Sun, 13 Mar 2022 14:42:50 +0900
Message-ID: <CA+Fz0PaRM7zCShHsK1WDAaFGwz1D2dV5LrvRqnYXkiB5i=rFPQ@mail.gmail.com>
Subject: Re: [RESEND V2] ASoC: max98390: Add reset gpio control
To: =?UTF-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, ryans.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, krzk@kernel.org,
 lgirdwood@gmail.com, "Sa, Nuno" <nuno.sa@analog.com>,
 Mark Brown <broonie@kernel.org>, geert@linux-m68k.org, shumingf@realtek.com,
 srinivas.kandagatla@linaro.org, rf@opensource.wolfsonmicro.com
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

On Sat, Mar 12, 2022 at 9:58 PM Nuno S=C3=A1 <noname.nuno@gmail.com> wrote:
>
> On Sat, 2022-03-12 at 09:24 +0900, Steve Lee wrote:
> >  Add reset gpio control to support RESET PIN connected to gpio.
> >
> > Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
> > ---
> >  sound/soc/codecs/max98390.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/sound/soc/codecs/max98390.c
> > b/sound/soc/codecs/max98390.c
> > index 40fd6f363f35..9a9299e5cc5a 100644
> > --- a/sound/soc/codecs/max98390.c
> > +++ b/sound/soc/codecs/max98390.c
> > @@ -1022,6 +1022,7 @@ static int max98390_i2c_probe(struct i2c_client
> > *i2c,
> >
> >         struct max98390_priv *max98390 =3D NULL;
> >         struct i2c_adapter *adapter =3D i2c->adapter;
> > +       struct gpio_desc *reset_gpio;
> >
> >         ret =3D i2c_check_functionality(adapter,
> >                 I2C_FUNC_SMBUS_BYTE
> > @@ -1073,6 +1074,17 @@ static int max98390_i2c_probe(struct
> > i2c_client *i2c,
> >                 return ret;
> >         }
> >
> > +       reset_gpio =3D devm_gpiod_get_optional(&i2c->dev,
> > +                                            "maxim,reset-gpios",
> > GPIOD_OUT_LOW);
>
> A reset GPIO is a standard property so there's no need for a vendor
> prefix. This should be devm_gpiod_get_optional(&i2c->dev, "reset",
> ...). And, as said before, you need to add a reset-gpios property to
> the bindings in a different patch.
>
> I'm also not sure why you have this as RESEND...
>
> - Nuno S=C3=A1
> >
>

I forgot to add another patch mail. I will check it before sending patch ag=
ain.
