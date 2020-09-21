Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A872730D1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:25:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAE8A16D3;
	Mon, 21 Sep 2020 19:24:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAE8A16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600709119;
	bh=poPWLFY+9momGpTunvhICW+hxay0d2RUqm1uGIkZ4Zk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5LeTVX/V9D5lIaAcafKBo0nZ1/VsVfTNJWXFWqZvVNhCGO2x/XewqhoB5bXEU44s
	 VrMvCY+ZrJBZHDSlDWXkXzea6MBYbXSMDUsYsI4d2QMh4EtKKw48L8KzRMdFJR5e6+
	 YWuOjljFxpuYBQk7t3udpZ2JAj9piaaLTgU3BbMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B80F8020B;
	Mon, 21 Sep 2020 19:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B02F801EC; Mon, 21 Sep 2020 19:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D057F800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 19:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D057F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HfV6houL"
Received: by mail-il1-x143.google.com with SMTP id t13so14518986ile.9
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5SRK8la0UXnQ7Dkerw1wuAG4a5/gTc1jllTQAlHfhlg=;
 b=HfV6houLmggUcURCcB6v+pPJlKPQ+gtN2WmmpK7oEGFgQbNm2B7uM903QVkjDTDbgf
 yPTC+cL1sDL1lVJmkAYnew56seWAZq3HGlZKn5ywC1NvjMuA0a21j1mWTmdIQLUUnU5k
 T9fl6S1HhzA6ycjv+PM1HmprtPTaYdBfRrHddu1LB5ZDrHJQe98EXMMGWVfoV3dR0FAv
 a9UhnG9Aa1lx6fRy/obN/RwN0sx0W33gt1lyz7c0lvlnpkVjFaB95qxWN4F+UmklmZHF
 sd0VDgGDpkCuVprKuBqLQ/9P3CDO6t0VyjtddPAUEgBvFvsErc9EJBEwZTvATAzUQdlh
 2S/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5SRK8la0UXnQ7Dkerw1wuAG4a5/gTc1jllTQAlHfhlg=;
 b=P/yOXbDi9gNYjf5PJ80n2LqfUGH+uWGs5E4lz1jSE5Q79wgb5heCWVYlo/SjG/PJH4
 5bosdUrSWzQIUWldsmWhhjR2VYisZ30mfS6fXF8LZiogViYNaGortGYLruv0tdwgS83g
 aUNhFa0OUmGPlwuJbfAxl2rpJo5iQtfqQgFJxAQ87a/FM2PNOWhD30FAX+3CERDGigpk
 X5QpmhVc6cuzNOc+nXXrWNHX9JUQh8SZX0Vuj28eMX0VKaTRg+/WebqZKvbgOde3wM6c
 bYE1P2SrcLhsU91ZJgbtPzpl9z9GYU18NH99AOmMV19lUPPTH8Zi29R6JkWiizeS3YmK
 ZdKg==
X-Gm-Message-State: AOAM530a0J6ZKJv6/3HdCTjyHX9JU/bvL6w7MM/EdaEJZqjTdvKbBJon
 QIgsmmcMB7JTTlJpm/0QWEC3iBThPEGgDLw9lYY=
X-Google-Smtp-Source: ABdhPJyUU4d4z0gn2QudzccbYRdOIKm+8ufVR0mc2IHAdHigfni2XUwbY8FX+jNpFzfnsMIjl7iDtl0Hk35QzmAF8Do=
X-Received: by 2002:a05:6e02:bc9:: with SMTP id
 c9mr865485ilu.150.1600709040237; 
 Mon, 21 Sep 2020 10:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921102731.747736-10-peron.clem@gmail.com>
 <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
In-Reply-To: <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 21 Sep 2020 19:23:49 +0200
Message-ID: <CAJiuCcfz9A_Vmzq=s3LK2kGB_1tZPkC9Ux+Brdocp9py0fovAg@mail.gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Maxime,

On Mon, 21 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > Add a simple-soundcard to link audio between HDMI and I2S.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h6.dtsi
> > index 28c77d6872f6..a8853ee7885a 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -67,6 +67,25 @@ de: display-engine {
> >               status =3D "disabled";
> >       };
> >
> > +     hdmi_sound: hdmi-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,name =3D "sun50i-h6-hdmi";
> > +             simple-audio-card,mclk-fs =3D <128>;
> > +             simple-audio-card,frame-inversion;
> > +             status =3D "disabled";
> > +
> > +             simple-audio-card,codec {
> > +                     sound-dai =3D <&hdmi>;
> > +             };
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai =3D <&i2s1>;
> > +                     dai-tdm-slot-num =3D <2>;
> > +                     dai-tdm-slot-width =3D <32>;
>
> It looks weird to have both some TDM setup here, and yet the format in
> i2s?

Yes, I agree I will check if it's really needed.

Clement

>
> Maxime
