Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD804E9713
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 14:52:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30889188A;
	Mon, 28 Mar 2022 14:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30889188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648471946;
	bh=mDUsLGNCkN5yyk67UjTmslWnnMXanXwAW5M2yhQrNsY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D58K5nxaFydEQFsF5+e9VXjquOJZIL6sSE9WZZSD9v3RN1okC8wb928529k5KsW18
	 BURPz139povuHWJrrFm/PQsE4DW+ycIvD3DqAOtt09axhVhNg6fSmovI9EERMf2lbI
	 foMm3wj/t2/sjwkN7ZvuKIeFFHJZteDRTfvokpQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98ED3F80121;
	Mon, 28 Mar 2022 14:51:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4DACF80121; Mon, 28 Mar 2022 14:51:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC988F80121
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 14:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC988F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fmnUk8fz"
Received: by mail-il1-x143.google.com with SMTP id h18so5347353ila.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NmQMOl74rWGRWzafuyJ5jjCyGGjWrcet8PudU8eNoTM=;
 b=fmnUk8fzFuPNcQLP4BGXA1S9aa97ooEg6VvUkroT0u2nlfdICTx4oy6TaPbWXhvP2p
 ycG9uUulYtBRRjLm9QXjKOnv6AXp/13Jj48+DV1eeBRQcSNHZBR8E/63/XFTjZ4F2U1Z
 /yWrDsUP0Axr8AP3acYeBwfDZz53FpCWg20obz6FBTMIy6DyWhoK3XEuP3vzdYNdNFi8
 +0A4Z/J7Mlr9Z394QGOI1u0UNFDGE7BJASd2oJy7o5ajLXTTwx3PsG+wubUAG6Tzsn1M
 e99RFMzotoXtGAcBMws38D0LjwZFIdFfjgVk2ZTTXM/RkrDzZs84Ula9HelT/mD+AsNs
 pjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NmQMOl74rWGRWzafuyJ5jjCyGGjWrcet8PudU8eNoTM=;
 b=fmrJMhTYqr+a9HAaKYxmbLSoQQ4TI7m7kK6JKWnErVqXgJH4R4KIbxvAzipDRRhzJu
 fU21mrACw+AkP2GMdm2dTcYITe61pQx/YBpB+1H/vqnt+92lW3AiYdwdgtyFjJ4ozTpd
 fbGYsY6eP4dUbBX9R2Zbq+ysBDN08v2fL3B5A6cSsd8F1L0OAvs56b7zrb9Bc8tFRJLG
 mCHupwZVhdf5klc6SPf8qxIo2oESbHfA3p1UhuNbavzT/h9loMiRRhRSec2VNU8AxQtN
 s3QBldKv4cblNS7eszMojhcGvXsa3+i5eO63+/vyw+gBmJLmVI1WUNJPRjo0f7OHkCki
 C4IQ==
X-Gm-Message-State: AOAM531IzNwFZTDzK2XefJo6sprjEuATrMJsAFllW/G+P5tLoZfPWeKR
 ipG6PlWQa2JqpLGqUeAbHq5cexLn2U7qrrs23dc=
X-Google-Smtp-Source: ABdhPJxh9OmbBwag5bvEGizKUKZLQbnirkyw/QJTsPJZeG6mVqa3cTPMDPAy/NRf7yrVNUIQBEFYGZcMWITxadtTRCQ=
X-Received: by 2002:a92:cdad:0:b0:2c6:7b76:a086 with SMTP id
 g13-20020a92cdad000000b002c67b76a086mr6014966ild.5.1648471870337; Mon, 28 Mar
 2022 05:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220328021139.8700-1-steve.lee.analog@gmail.com>
 <PH0PR03MB678617C7A854827D0EC99010991D9@PH0PR03MB6786.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB678617C7A854827D0EC99010991D9@PH0PR03MB6786.namprd03.prod.outlook.com>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Mon, 28 Mar 2022 21:50:59 +0900
Message-ID: <CA+Fz0PZQUcjLL2fmOLcyYxhqfyoY0jVKtz1GgRTur9XJDs_wag@mail.gmail.com>
Subject: Re: [V3 1/2] ASoC: max98390: Add reset gpio control
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryans.lee@maximintegrated.com" <ryans.lee@maximintegrated.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "krzk@kernel.org" <krzk@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "broonie@kernel.org" <broonie@kernel.org>
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

On Mon, Mar 28, 2022 at 4:42 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
>
> > From: Steve Lee <steve.lee.analog@gmail.com>
> > Sent: Monday, March 28, 2022 4:12 AM
> > To: lgirdwood@gmail.com; broonie@kernel.org; perex@perex.cz;
> > tiwai@suse.com; ryans.lee@maximintegrated.com; linux-
> > kernel@vger.kernel.org; alsa-devel@alsa-project.org
> > Cc: krzk@kernel.org; Sa, Nuno <Nuno.Sa@analog.com>; Steve Lee
> > <steve.lee.analog@gmail.com>
> > Subject: [V3 1/2] ASoC: max98390: Add reset gpio control
> >
> > [External]
> >
> >  Add reset gpio control to support RESET PIN connected to gpio.
> >
> > Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
> > ---
> >  sound/soc/codecs/max98390.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/sound/soc/codecs/max98390.c
> > b/sound/soc/codecs/max98390.c
> > index 40fd6f363f35..05df9b85d9b0 100644
> > --- a/sound/soc/codecs/max98390.c
> > +++ b/sound/soc/codecs/max98390.c
> > @@ -1022,6 +1022,7 @@ static int max98390_i2c_probe(struct
> > i2c_client *i2c,
> >
> >       struct max98390_priv *max98390 =3D NULL;
> >       struct i2c_adapter *adapter =3D i2c->adapter;
> > +     struct gpio_desc *reset_gpio;
> >
> >       ret =3D i2c_check_functionality(adapter,
> >               I2C_FUNC_SMBUS_BYTE
> > @@ -1073,6 +1074,17 @@ static int max98390_i2c_probe(struct
> > i2c_client *i2c,
> >               return ret;
> >       }
> >
> > +     reset_gpio =3D devm_gpiod_get_optional(&i2c->dev,
> > +                                          "reset", GPIOD_OUT_LOW);
> > +
> > +     /* Power on device */
> > +     if (reset_gpio) {
> > +             usleep_range(1000, 2000);
> > +             /* bring out of reset */
> > +             gpiod_set_value_cansleep(reset_gpio, 1);
>
> Note this will set the gpio in the asserted state. Being it active low, t=
his will
> do the opposite thing that you are trying to accomplish...
>
> - Nuno S=C3=A1

I agree with your comment. I will update next version patch if there
is other concern.
