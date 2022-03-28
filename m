Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B34E9716
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 14:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC7318AC;
	Mon, 28 Mar 2022 14:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC7318AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648471981;
	bh=DpFzxoGPxHl3EdHB5r9zh3fBGQ9q32jcPXp9KX2/md0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cOELrfTxpz+3Jgs9V8f3+Gg+783erK4ZjResbkh7gKwJ0c80eg/EDUaqw4cXfMAET
	 EDQjvo0/LadL3XLPjIUXnVw7Gpq/28XJZQqPOkltHhDqpwen9FcHASWa4M2ScPaBIW
	 teVI8ARNpx8Ockf0mZ1aBS1VVyHLSq3ekM9BYnA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E989F80516;
	Mon, 28 Mar 2022 14:51:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77A7DF8050F; Mon, 28 Mar 2022 14:51:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C91FF804DA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 14:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C91FF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="icASZrSd"
Received: by mail-io1-xd43.google.com with SMTP id q11so16853722iod.6
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 05:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hl62ZZF9xXxGgi6ZZphdBA1i//kHz1iBa2y3695NrsA=;
 b=icASZrSdFNGQbdG/IOShlTLaQfwjDp+8NApwJepYPtkO2VaC8ATzL5GB0O7w1lwJnC
 gQK/lMYDEIt2Uhb+6lmuiTqoPwhBpKt6V+zk0WyvV6JqFZkkq3lcEDuX1leU7siSlnLA
 3KBEzm2uuxPJiizEuJX544AU8uZXfi3+gLQM5j+1wjsTAPiJqc+7miG69zs/cEcN4eli
 yRLAsRf6Kty/Wh5lXqdQATNNQY3BpTJAuEsokXdbyXJTTJ7Fm3sXLqJ4POh4aMKQASxa
 EuinR2GO4dDxqRAJ7/fQj1zOgInecsrGs+2pRx0vv1bAz4R/BzKdXcYv89C6F+C9sHxN
 h2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hl62ZZF9xXxGgi6ZZphdBA1i//kHz1iBa2y3695NrsA=;
 b=qk1ZPx/fH2/nRJwD1Gse373IKgnF/LSWru0aqvLZqVfmf8qkC1WsqZQdGaNUU/fp/C
 XBsQsBM1rp89PxFGFsYtkzOUYb83JvDJlUCWU7tM2J6uy5hm8ZvgVBX+WthV14F3V8Gc
 za/JJcme001F8TT+O8Z/355RIND4/B4qDreqwcNLXRthNGWi8WRHA4+wFTvxnYPpQ79M
 Uq3Q/SQuPWycIxR8cVfSi+xWIRYzb6kz6/tdkUbr7btEiKVSlOQurmButa4Q8m5FoyVU
 ugZDGJNyVm4f9jNFk1Tv12rFxtSE+IITDN38dY3koql4jYT3ydjd2FrdFWcGgScnagDm
 13eQ==
X-Gm-Message-State: AOAM5321gegSkVMLcuOCB02KmQEvSdkkbg83vd4ZJmw5W4gWXYVDNGw4
 ODg2D1628dzd7rf7gEUk8ii+hVLNd48fLhXuOlA=
X-Google-Smtp-Source: ABdhPJwjOhlugyhQlt5yYxr+1HihIKi/r9Q2nmaXntqRiDx9IpPxhh1ziluusQ/rSAQ46Z5+SMaNsJ5FYPJaYLRk8b4=
X-Received: by 2002:a05:6602:1683:b0:649:f7d3:f0cf with SMTP id
 s3-20020a056602168300b00649f7d3f0cfmr6162906iow.197.1648471910425; Mon, 28
 Mar 2022 05:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220328021139.8700-1-steve.lee.analog@gmail.com>
 <PH0PR03MB6786EB43BFAD3B711096F69B991D9@PH0PR03MB6786.namprd03.prod.outlook.com>
In-Reply-To: <PH0PR03MB6786EB43BFAD3B711096F69B991D9@PH0PR03MB6786.namprd03.prod.outlook.com>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Mon, 28 Mar 2022 21:51:39 +0900
Message-ID: <CA+Fz0PaxSFhZG9dOYOWd4MOtHLxwyC3fXmCDZtOTwg4+aQ+jOA@mail.gmail.com>
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

On Mon, Mar 28, 2022 at 5:46 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
>
>
>
> > -----Original Message-----
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
>
> Forgot to mention,
>
> As you stated in the bindings the gpio is active low, this should also be
> GPIOD_OUT_HIGH, if we want to have the device in reset after this call.
>
> - Nuno S=C3=A1
>

This also agree with your comment. I will update next version patch if
there is other concern.
