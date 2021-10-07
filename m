Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBD7427FE4
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1945016A4;
	Sun, 10 Oct 2021 09:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1945016A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852327;
	bh=ouX73xpYDgRzR8jsdshn8e5UTVHURBHWdpBN+4Hq5Qg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T8mXOuE6GYoE6DSqHuNs2eQndhEWGigEptnJm8K+fo5TdmBEPicu3q9+ln22fFqF2
	 huoqLqsjk4+GNlz5l4hACTgS439WfyDsw4aqYIskknlcfZunfjKM/hYR9zsUX3qMvz
	 fTpFWkwNkMpYhNMnu0fN+1xxta9bqACfZvqGcWe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B695FF804ED;
	Sun, 10 Oct 2021 09:49:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4BCF8027D; Thu,  7 Oct 2021 04:45:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68653F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 04:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68653F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZxF3Sf93"
Received: by mail-lf1-x132.google.com with SMTP id x27so18444214lfa.9
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 19:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UbB1cUHSIw/ZuVAsACZPiSQBpvCldBuU8f84dBJFpe8=;
 b=ZxF3Sf93cWa/sNLhOiRbipSo8A6czSa7naFHt5giZ4rfxgaj3tT+BBoco1p2QgsJpg
 nAaul1l1b4FG9IfCzwLEMBb4mR0kssPrfnpjuLYbfr449KVnQOrTbJY2GiMCihSz7OFW
 bp11TL1vFPQ5V3aMoAU/AW/WXpp32NylvrcHQG3CsODRSvz5LOks1/x871cDIjF8z9hj
 4TZ3vqS4nlY4MQeAMV7AsQ+XbtfvH+shm4qqhZD4BgZKXhkGKgb2F/ZkbZVT//W6diat
 LECZmN+KQLL5W6jGK/vqWmCQe9/qNLTvGaDY6it1TATDz22TQv+mnmkwV/LGH+K6xtSz
 J5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UbB1cUHSIw/ZuVAsACZPiSQBpvCldBuU8f84dBJFpe8=;
 b=JB95HVVxZoizrELab7yre1wtZ6zOe+C0upL0ZP7iWYhqQE95CZwvvXzvgtdjzUbA6M
 ByWr+coXknDoihLC+rG7TJa3cI/PzMtIUuFPsWqYLHCNmR1kH1uz5/q+xDAtp5Q04QEY
 ZDKWLRaK3jCiToDNYr2RwsvGLdgU+Bt+wN4AIUfi+9XjWTozm95NTOiGtcx9N46BEl+R
 g238MWMvfKCQcjTSLgVcjKBNykLawJuzOkA4eKaJ0VboxOdIZGhivAH7m2ztzk2JEOoF
 i+ndtFcY6kiGcL5NHCCCT4ChqSQb2eFkIa35up05Wwcj9fjPZr/bhycSHuSujzFEw+BL
 3EKQ==
X-Gm-Message-State: AOAM533WpYJm8CYvVsRwJsESiA0tYiW0W/U5aWf89QaMdBM98TSnPYF5
 bbpKnThkXVOGv3CjuxNQS6x8GEECQ8IYc3qiXfs=
X-Google-Smtp-Source: ABdhPJxOTJCZIiXIJyvWaIfIHwO/yvWic8ASH+U1t55w2J3UciFgAKlsHlSnSyer4bHTgKAWS83/ea7fGdRwXCpesa0=
X-Received: by 2002:ac2:4da4:: with SMTP id h4mr1582381lfe.356.1633574701728; 
 Wed, 06 Oct 2021 19:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <1633396615-14043-1-git-send-email-u0084500@gmail.com>
 <YVw7vbpu4TS+7Su8@sirena.org.uk>
 <CADiBU39dvKS_a5FDgw9yMVFe8Uycn6bfjGwBWq+7MN_DdxkL1g@mail.gmail.com>
 <YVxFMaPhZdAFniMa@sirena.org.uk>
 <CADiBU3_TuHKiVG-r1TG-8WK_tW2GXi4VuqkidPwTyebOgE60OA@mail.gmail.com>
 <CADiBU3-4F-FdJxaa4Qp4xmUD3vsA=6u5_ojwDSr8zrDuW8JbXg@mail.gmail.com>
In-Reply-To: <CADiBU3-4F-FdJxaa4Qp4xmUD3vsA=6u5_ojwDSr8zrDuW8JbXg@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 7 Oct 2021 10:44:49 +0800
Message-ID: <CADiBU38zCZk_P-q8BtbPfdeSacUF7LOvQYUFgvidbWZwcLY=wA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: rt9120: Add initial bindings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 10 Oct 2021 09:49:29 +0200
Cc: oder_chiou@realtek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.com, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, allen lin <allen_lin@richtek.com>
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

Hi,

ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:47=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi, Mark:
> ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:39=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:29=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > On Tue, Oct 05, 2021 at 08:25:43PM +0800, ChiYuan Huang wrote:
> > > > Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > > On Tue, Oct 05, 2021 at 09:16:54AM +0800, cy_huang wrote:
> > >
> > > > > > +  richtek,use-dvdd-1p8v:
> > > > > > +    description: Indicate DVDD 1P8V is used, default for 3P3V =
or 5V design
> > > > > > +    type: boolean
> > >
> > > > > I would expect this to be done through the regulator bindings, th=
ey
> > > > > would allow the driver to query the supply voltage.
> > >
> > > > It's more like as the I/O pad voltage.
> > > > Must be the same as I2C and I2S signal high level.
> > > > It depends on the application SOC design.
> > > > From my understanding, not all application SOC I/O voltage uses
> > > > regulator interface.
> > >
> > > It doesn't really matter what the SoC is doing here, you can always a=
dd
> > > regulator support to your device - you'd be requesting the supplies t=
o
> > > your device, if the SoC doesn't request the supplies that go to it th=
at
> > > doesn't really make a difference to what your driver does.
> > >
> > > Please don't take things off-list unless there is a really strong rea=
son
> > > to do so.  Sending things to the list ensures that everyone gets a
> > > chance to read and comment on things.
> >
> After contacting our HW RD, to support DVDD 1.8V not just SW config,
> also HW connections.
> To get only DVDD supply voltage is not enough to meet the HW design.
> The property seems indeed and need to be used by user's HW connection.
>
> Can this property to be kept?

After thinking, This property name may be improper.
I think this change depends on HW external circuit for lowv application.
Currently, I'm modifying the V3 change, this property name also affect
the property parsing code change.
May I directly change the name to 'richtek,dvdd-lowv-application' and
submit the patch v3?

Any comment is appreciated.
> > Sorry, my fault.
> > I just noticed the mail not reply all. Loop all again.
