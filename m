Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A7832E1F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 18:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22BD97F4;
	Fri, 19 Jan 2024 18:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22BD97F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705685166;
	bh=iwpLtpC3VoaXo/9dNwwAnOeyq3xO3HPbvtrcusavOkU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NchjFqLCsY+rgnyv0Sd92f7p1aj6zhsDSUrK/xtqgRFQoNGkjtf7Y7csvFzgasZt6
	 QbxSG77IZFx0qhcHgv+gPEOM8paiqjBhecr4oNeZEP1L3phsfMGLQpevaDabNzFDxp
	 gPPMvIpf2rY0MAWqA9gmBh6iub5+Vnm+QYrZKaLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54FCBF801F5; Fri, 19 Jan 2024 18:25:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C6FF80564;
	Fri, 19 Jan 2024 18:25:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D439FF801F5; Fri, 19 Jan 2024 18:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85653F800C1
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 18:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85653F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eRu3zTpX
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e5a9bcec9so1166161e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jan 2024 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705685122; x=1706289922;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2xwilmGBZvQQTbXPdBchYmIXQPAhkMfZIZcjK72Cz0=;
        b=eRu3zTpXc42oHeUDM8AnM03vYfVqaEhjPfLbsXBeCUMtKtoe8BAokOyajGDctN7BBR
         hUS8+yjZWh2kcWn0gExMlLKedv7aclad+zud1SPP6JcOzHxN8HXLX6YXeimXwF0966Ps
         Y0SUG8pBayUBNwyeDXMuN4ebdNVo1C8gAkTiQUWG/Jx5cYWhT//NjfrKthEWuIkeP0bQ
         PXexPWMg/Vw6p4WLfG9HF8aDMTvwFpvOi4LNv3pfTZuKYUCKOgGyfXDO+QboGwhOKrAs
         29sEpQDeQJ+ewU4ntLyAbHpv0y5qadgHlHom03WnC8PblpKK+9ImhZqdHi3f4HkRywKs
         cbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705685122; x=1706289922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2xwilmGBZvQQTbXPdBchYmIXQPAhkMfZIZcjK72Cz0=;
        b=NulB+7+ZsQrO64cQxvWnCxjVqr612tpFLTplTqA4lLTsEMoAl+otCNMh/dV4V6IOpA
         0M99IMOHizYCszjD6ytkHLKoVMas62szNDvA/gpvMgzMeAaEgLAMlINhbHPIiSEUXg60
         tmTi3OmkRzF8gUCcsxzrvca8GJVdXOdXscomKbLlh/KjV7t52ap3aSmE6yQCmu3lzBe8
         L7TdbkXI1Vxpv5JWBpYUXC3DXfFq0dEIyUzMvvTzcwsPOkWgxPg6ESXJMULaXrD3ELEG
         WHPaaE0KMyq+Dy+GybKp29ZM/n7aqmU7dx2YJVRtclGtJWsyxvzJz77L0ZrPdayIQYuV
         LdgA==
X-Gm-Message-State: AOJu0YxAqbeJzQdV2Y4AULx4tzr2nQTNTuKZcv+v/Vn8CqHqsqN7cxM6
	CQpgy1Q0/w8hyL+cIgItIrbZrDqI12B5kW3rpH5CTTGnl3ECv2IwGl4m9VLGvxlxFEKOgWeDME+
	z7p1mvbKDnvjLV2ecxaH9jByjhs0=
X-Google-Smtp-Source: 
 AGHT+IF5XBmlwwuB2LVSDw9ikBo4az/a9C2r6G+L3etJbaHVu5L0DLlw90iBG9K5c+qoRpuFYDN6QuG5tfAYOseHeIE=
X-Received: by 2002:a19:ca18:0:b0:50e:aedd:ed76 with SMTP id
 a24-20020a19ca18000000b0050eaedded76mr463lfg.131.1705685122156; Fri, 19 Jan
 2024 09:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-7-ckeepax@opensource.cirrus.com>
 <Zali4qxdegY7H6eY@surfacebook.localdomain>
 <20240119165917.GC16899@ediswmail.ad.cirrus.com>
In-Reply-To: <20240119165917.GC16899@ediswmail.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 Jan 2024 19:24:45 +0200
Message-ID: 
 <CAHp75Vd_hnnuHQxmiPTkS5GdpEf3iMik9=51x55_Xgr+7LDJ3Q@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] ASoC: cs42l43: Add support for the cs42l43
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WNXMJLVNYMSMN2AIX74JZ3EIEBPAOZG5
X-Message-ID-Hash: WNXMJLVNYMSMN2AIX74JZ3EIEBPAOZG5
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNXMJLVNYMSMN2AIX74JZ3EIEBPAOZG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 19, 2024 at 6:59=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Thu, Jan 18, 2024 at 07:41:54PM +0200, andy.shevchenko@gmail.com wrote=
:
> > Fri, Aug 04, 2023 at 11:46:02AM +0100, Charles Keepax kirjoitti:

...

> > > +   BUILD_BUG_ON(ARRAY_SIZE(cs42l43_jack_override_modes) !=3D
> > > +                ARRAY_SIZE(cs42l43_jack_text) - 1);
> >
> > Use static_assert() instead.
>
> I am happy either way, but for my own education what is the
> reason to prefer static_assert here, is it just to be able to use
> =3D=3D rather than !=3D? Or is there in general a preference to use
> static_assert, there is no obvious since BUILD_BUG_ON is being
> deprecated?

It's generally preferred since there are (known) issues with it:
- it can't be put without the scope (globally);
- it produces a lot of a noise and hard to read error report;
- ...anything I forgot / don't know (yet) about...

BUILD_BUG_ON() might be useful in some cases, but I don't see how.

...

> > > +   ret =3D cs42l43_shutter_get(priv, CS42L43_STATUS_MIC_SHUTTER_MUTE=
_SHIFT);
> > > +   if (ret < 0)
> > > +           return ret;
> > > +   else if (!ret)
> >
> > Reundant 'else'
> >
> > > +           ucontrol->value.integer.value[0] =3D ret;
> > > +   else
> > > +           ret =3D cs42l43_dapm_get_volsw(kcontrol, ucontrol);
> >
> > and why not positive check?
> >
> > > +   return ret;
> >
> > Or even simply as
> >
> >       if (ret > 0)
> >               ret =3D cs42l43_dapm_get_volsw(kcontrol, ucontrol);
> >       else if (ret =3D=3D 0)
> >               ucontrol->value.integer.value[0] =3D ret;
> >
> >       return ret;
>
> Yeah will update, that is definitely neater.

Note before doing that the last one has a downside from the

if (ret < 0)
  return ret;
if (ret)
  ret =3D ...
else
  ...
return ret;

as it assumes that there will be no additional code in between
'if-else-if' and last 'return'. Purely a maintenance aspect, but
still... So, think about it which one you would prefer,

...

> > > +   while (freq > cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs)=
 - 1].freq) {
> > > +           div++;
> > > +           freq /=3D 2;
> > > +   }
> >
> > fls() / fls_long()?
>
> Apologies but I might need a little bit more of a pointer here.
> We need to scale freq down to under 3.072MHz and I am struggling
> a little to see how to do that with fls.

The second argument of > operator is invariant to the loop, correct?
So it can be written as (pseudocode)

 y =3D 0;
 while (x > CONST) {
   x /=3D 2;
   y++;
 }

This is basically the open coded 'find the scale of x against CONST as
power of 2 value'. Okay, it might be not directly fls(), but something
along those types of bit operations (I believe something similar is
used in spi-pxa2xx.c for calculating the divider for the Intel Quark
case).

y =3D fls(x) - fls(CONST); // roughly looks like this, needs careful checki=
ng

...

> > > +   // Don't use devm as we need to get against the MFD device
> >
> > This is weird...
> >
> > > +   priv->mclk =3D clk_get_optional(cs42l43->dev, "mclk");
> > > +   if (IS_ERR(priv->mclk)) {
> > > +           dev_err_probe(priv->dev, PTR_ERR(priv->mclk), "Failed to =
get mclk\n");
> > > +           goto err_pm;
> > > +   }
> > > +
> > > +   ret =3D devm_snd_soc_register_component(priv->dev, &cs42l43_compo=
nent_drv,
> > > +                                         cs42l43_dais, ARRAY_SIZE(cs=
42l43_dais));
> > > +   if (ret) {
> > > +           dev_err_probe(priv->dev, ret, "Failed to register compone=
nt\n");
> > > +           goto err_clk;
> > > +   }
> > > +
> > > +   pm_runtime_mark_last_busy(priv->dev);
> > > +   pm_runtime_put_autosuspend(priv->dev);
> > > +
> > > +   return 0;
> > > +
> > > +err_clk:
> > > +   clk_put(priv->mclk);
> > > +err_pm:
> > > +   pm_runtime_put_sync(priv->dev);
> > > +
> > > +   return ret;
> > > +}
> > > +
> > > +static int cs42l43_codec_remove(struct platform_device *pdev)
> > > +{
> > > +   struct cs42l43_codec *priv =3D platform_get_drvdata(pdev);
> > > +
> > > +   clk_put(priv->mclk);
> >
> > You have clocks put before anything else, and your remove order is brok=
en now.
> >
> > To fix this (in case you may not used devm_clk_get() call), you should =
drop
> > devm calls all way after the clk_get(). Do we have
> > snd_soc_register_component()? If yes, use it to fix.
> >
> > I believe you never tested rmmod/modprobe in a loop.
>
> Hmm... will need to think this through a little bit, so might take
> a little longer on this one. But I guess this only becomes a problem
> if you attempt to remove the driver whilst you are currently playing
> audio, and I would expect the card tear down would stop the clock
> running before we get here.

I don't know the HW, it is up to you how to address this. The issue
really exists and might become a hard to hunt bug (e.g., if there is
an IRQ fired or async work which would like to access the HW with
clock off and hang the system).

--=20
With Best Regards,
Andy Shevchenko
