Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F14814D7B17
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:00:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E6DA16FC;
	Mon, 14 Mar 2022 07:59:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E6DA16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241235;
	bh=MzugfhH0npgGULwctmUuJQ6Ev7L0hXMit6v9E+v50Ac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebNer9L0Z8MWDYYkXTLCVfer9zsVOWdgMRXkOsJt+zJgJ0dcjfP47U1L/Wy5bGnlM
	 7u+2302OjBA1JpVjf2/ZUI27Jts+ktYUG+M65EyY7M8KQ/PIiUHTGAQuhgX9skhNiI
	 TojOTs6MrZmlxq/XA2mqv90Jp7xo0b0quxVeQY8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59060F80510;
	Mon, 14 Mar 2022 07:58:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B7C9F80227; Fri, 11 Mar 2022 06:50:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA518F8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 06:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA518F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QZGS63PS"
Received: by mail-io1-xd42.google.com with SMTP id r11so9023993ioh.10
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 21:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3B8QjIlmdJC8Bd0Vem9hqomGTMW6ZUxC9fqa1LEpXd8=;
 b=QZGS63PS9pfUSfyFr/oDhhJNtJFuik3KIdwKY3PpvuP3fY8aefSNurgtEJ75OAJyXL
 CbRQeVKeQor4yz60nSIWEdR5TZyN0QV5+FekbuenDvWrWpkFpxM/C4z3yTEHlb/CMZsz
 3tk7l0R0YAf4zaLJ8CRpfdHIa8eu6xV20zKYwP2lEhHwTocUGa2bGeUbL+8BP4kzFmk/
 qspHqatyaz920KEXdhgy+7n0G4bWFdblmhL49w9f0cn27W06zm6HVcD9ApjQMvrHUGEc
 nEV34M7C8hyfoRJKqjBc5ni9sld+2F3Ibx0OyfKLTKdJiIRDULBT4HlyFk2YUmbGdvLr
 7VsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3B8QjIlmdJC8Bd0Vem9hqomGTMW6ZUxC9fqa1LEpXd8=;
 b=wP25gJszaBvhx5qxp/e4lK6oAjXCDpy1Yn/BOHn2TQiwj8BVG+ruPwHOqJYXUJyPt1
 SpoTsZhkloNw9i8DAmLA/0862OHf9s0dSSqik0Kc9fJ1GGLDn9ECwt2wzgCFyFjLR9SD
 RKyMKoplGVPiRTjdL6d5Ap2zvI4llOlmcp15oSvg0bXTWPIfguWU64Q8n7JgJGyFaxpu
 jJX8Fsew5N7It4Z0mYIyPKK4onxvTsuQMF4N2yAfscXOjzUPACnzkYN7GRzejlVtjigm
 Y0s66+yYKzzNJuth0OVhodf2hRsV2/gckVDjrxheg1FbjKiPD+jKcof8e5CmRCKXrUKE
 T17A==
X-Gm-Message-State: AOAM533nUa3XRRJXBUXUN4wioQ6r4tF8Teuv6298f4U8LBt1VHscokXa
 R2TuC+BT11jl6PkM8TR/1QLkLmekXxxtG4vDQ/8=
X-Google-Smtp-Source: ABdhPJzAbtdKwaCEOZhQzztbjFX7GP+aQtiKKok15pkU1whKZ1twhEO8IZfK457hIHx3+Bb+/kd5NE5f7iIGcTsyC+U=
X-Received: by 2002:a05:6602:168f:b0:648:c800:3d61 with SMTP id
 s15-20020a056602168f00b00648c8003d61mr514167iow.197.1646977829264; Thu, 10
 Mar 2022 21:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20220310081548.31846-1-steve.lee.analog@gmail.com>
 <SJ0PR03MB67794358405FA661992A206D990B9@SJ0PR03MB6779.namprd03.prod.outlook.com>
In-Reply-To: <SJ0PR03MB67794358405FA661992A206D990B9@SJ0PR03MB6779.namprd03.prod.outlook.com>
From: Lee Steve <steve.lee.analog@gmail.com>
Date: Fri, 11 Mar 2022 14:50:18 +0900
Message-ID: <CA+Fz0PbNBXfC_0SYKVuHDic0ZREpHBk+oSqU5sO9Mq0AjY8_-w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: max98390: Add reset gpio control
To: "Sa, Nuno" <Nuno.Sa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "steves.lee@maximintegrated.com" <steves.lee@maximintegrated.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
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

On Thu, Mar 10, 2022 at 5:48 PM Sa, Nuno <Nuno.Sa@analog.com> wrote:
>
> Hi Steve,
>
> > From: Steve Lee <steve.lee.analog@gmail.com>
> > Sent: Thursday, March 10, 2022 9:16 AM
> > To: lgirdwood@gmail.com; broonie@kernel.org; perex@perex.cz;
> > tiwai@suse.com; ckeepax@opensource.cirrus.com; geert@linux-
> > m68k.org; rf@opensource.wolfsonmicro.com; shumingf@realtek.com;
> > srinivas.kandagatla@linaro.org; krzk@kernel.org; dmurphy@ti.com;
> > jack.yu@realtek.com; Sa, Nuno <Nuno.Sa@analog.com>;
> > steves.lee@maximintegrated.com; linux-kernel@vger.kernel.org;
> > alsa-devel@alsa-project.org
> > Cc: Steve Lee <steve.lee.analog@gmail.com>
> > Subject: [PATCH] ASoC: max98390: Add reset gpio control
> >
> > [External]
> >
> >  Add reset gpio control to support RESET PIN connected to gpio.
> >
> > Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
> > ---
> >  sound/soc/codecs/max98390.c | 18 ++++++++++++++++++
> >  sound/soc/codecs/max98390.h |  1 +
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/sound/soc/codecs/max98390.c
> > b/sound/soc/codecs/max98390.c
> > index b392567c2b3e..574d8d5f1119 100644
> > --- a/sound/soc/codecs/max98390.c
> > +++ b/sound/soc/codecs/max98390.c
> > @@ -1073,6 +1073,24 @@ static int max98390_i2c_probe(struct
> > i2c_client *i2c,
> >               return ret;
> >       }
> >
> > +     max98390->reset_gpio =3D of_get_named_gpio(i2c-
> > >dev.of_node,
> > +                                             "maxim,reset-gpios", 0);
>
> Why not using devm_gpiod_get_optional()? We could request the pin
> already in the asserted state and make the code slightly better...
>
> /* I guess there's no need to save it in our struct as we only use it her=
e? */
> struct gpio_desc *reset_gpio;
>
> reset_gpio =3D devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH=
);
> if (reset_gpio) {
>       usleep_range(1000, 2000);
>      /* bring out of reset */
>       gpio_direction_output(max98390->reset_gpio, 0);
>       usleep_range(1000, 2000);
> }
>
> Also, do we have this on the bindings doc? If not, it should be done on a=
 second
> patch on this series...
>
> - Nuno S=C3=A1
>

Thanks for comment on this patch. I will check and update as commented.
