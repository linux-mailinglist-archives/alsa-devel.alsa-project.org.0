Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6004D7B47
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:09:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D036718A4;
	Mon, 14 Mar 2022 08:08:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D036718A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241751;
	bh=dOW1pzjrTFl2vvOF5B9bAHZONX/CLbQ2gBJepXaAskY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzetBtBUhIlnQNKu/Da7EAefU7KGqfK2gtuWr/DSpEJhxPGfGlTGzAhW43+7jopsZ
	 H4loOYiTVhS84b5I5J/IAJVlkVEWlWyBlQFZcs1j5U1X3Ecy49wXtvZibTfDOk96j4
	 lL1du+1d6Em0Akb8+PN56CyvlaL6IonjL6ACXKYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8C10F80475;
	Mon, 14 Mar 2022 07:59:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61100F8011C; Sun, 13 Mar 2022 06:41:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F035BF8011C
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 06:41:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F035BF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YKGzICi3"
Received: by mail-io1-xd43.google.com with SMTP id b16so14716719ioz.3
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 21:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSJXVOht+hxS+hKjGxwt1A2kwmz24g3we9uVLX8KopE=;
 b=YKGzICi38ZdGllMCcDcm5P019Hzk9qjMGjdUtEOTG6PrbMVwtdJED138/+dcUNJW37
 M4YDt8UYxW0rGnnszHqbINRl77Hy57S1GXAeN2NANfA12J3+gfXP8O4fazpmxCCkTOFM
 HcaMKQbX0E0+Jk14W7fQEaLurkevYy7+ez4GFFBwQ5QNZ7Mr9gnNEAIgw0eUdhWUc6mX
 vbpVvf6+7acpdDUkGFWnMdhwCP15pnvL3YFI3WuN02hmF6Y7cghfZr4ejvTHduHlte0q
 h9wKR8u3YcHJpGf2lw3JtCj1KIXj+bwHr0F65o0dzhMxNIoswE7zCM9peC4iNGbk28kw
 DgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSJXVOht+hxS+hKjGxwt1A2kwmz24g3we9uVLX8KopE=;
 b=udkBV0zA0XX4Tv0PDCeBK+5HismS0IZNZXoyLJLg1rYdzeORz5Go7lVZWqOcPfYD5B
 T4X9JztKwglZNOLNl80qc/hiwx2w5Fbu4Z+1Ao4QbVC11yo+xMY9uqIlwkiLrxvWzuba
 GtRrygAqSiBvJ4NmwdTW1OEMZmkREeg+iNHJLTnFJCjih0UdnKN379lIf9PRJ70I/N5m
 e/KaKovGObrux1z6i4Nl3BVjQLZruacYOMGv4MqvKMraf8eGVhD+Hrf5VPm2GMjOrltr
 Kuwu50/le12sj9fozZaCtjopkdNYct/Pz1SIaHyf2fRflT9hFnniUrE7MRAVlnjd1CGw
 o7ag==
X-Gm-Message-State: AOAM532uck3fqp77ux0lQUfUJTk+WD0rG5uXW48fCa5EwwAycGss5rR0
 frpHX9OgIm/xVzuqRGtFol1Npm4fPaSp6XTM0fw=
X-Google-Smtp-Source: ABdhPJxu7ye+5lUKnrkn1bUsxZOh3PujZfDdrVrbl47wn8G69XzlTWbp5OhrlNhDuwFwRjkewn9FUbk/Ra5fo2kWG+0=
X-Received: by 2002:a05:6602:1341:b0:637:d4dc:6f85 with SMTP id
 i1-20020a056602134100b00637d4dc6f85mr13993251iov.155.1647150058869; Sat, 12
 Mar 2022 21:40:58 -0800 (PST)
MIME-Version: 1.0
References: <20220312002429.16175-1-steve.lee.analog@gmail.com>
 <009acb4c-d59c-c1ad-60b0-cc85fe7ad73d@kernel.org>
In-Reply-To: <009acb4c-d59c-c1ad-60b0-cc85fe7ad73d@kernel.org>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Sun, 13 Mar 2022 14:40:48 +0900
Message-ID: <CA+Fz0PZ0+Fn3_X8vtcL52pQFn3kQCnU1cBFNwif3XkP76HYXYA@mail.gmail.com>
Subject: Re: [RESEND V2] ASoC: max98390: Add reset gpio control
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, ryans.lee@maximintegrated.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com, "Sa,
 Nuno" <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 geert@linux-m68k.org, shumingf@realtek.com, srinivas.kandagatla@linaro.org,
 rf@opensource.wolfsonmicro.com
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

On Sat, Mar 12, 2022 at 7:40 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/03/2022 01:24, Steve Lee wrote:
> >  Add reset gpio control to support RESET PIN connected to gpio.
> >
> > Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
> > ---
> >  sound/soc/codecs/max98390.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
> > index 40fd6f363f35..9a9299e5cc5a 100644
> > --- a/sound/soc/codecs/max98390.c
> > +++ b/sound/soc/codecs/max98390.c
> > @@ -1022,6 +1022,7 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
> >
> >       struct max98390_priv *max98390 = NULL;
> >       struct i2c_adapter *adapter = i2c->adapter;
> > +     struct gpio_desc *reset_gpio;
> >
> >       ret = i2c_check_functionality(adapter,
> >               I2C_FUNC_SMBUS_BYTE
> > @@ -1073,6 +1074,17 @@ static int max98390_i2c_probe(struct i2c_client *i2c,
> >               return ret;
> >       }
> >
> > +     reset_gpio = devm_gpiod_get_optional(&i2c->dev,
> > +                                          "maxim,reset-gpios", GPIOD_OUT_LOW);
> > +
>
> I don't know why did you CC me, but since I am looking at this - you
> have to update bindings.
>
> Do not add random properties to drivers without updating bindings.
>
> Best regards,
> Krzysztof

Thanks for comment. Yes, I update bingding too.
