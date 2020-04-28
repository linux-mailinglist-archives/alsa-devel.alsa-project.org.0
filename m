Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F0B1BC5C4
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 18:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A23D1676;
	Tue, 28 Apr 2020 18:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A23D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588092676;
	bh=c14in/XGNFlMNn026ml7lFp93DVtu2l85+bugZpBtZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5VeYMtRnE8wVYSZAK0IdLhXdNM2rXrer884NduCuRvC1k0zM30/Qt1MWTOBGmVHO
	 ZuXdhWil8dMbMeFpPHdD7/3jr8GekcZ2enuBx86UAEUkoK7b1Dq9ESrTpA66spodfh
	 Yyvd+44wJz95BcXqVlH0tRvQzDG2znz0pQp1an4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEC5F800D2;
	Tue, 28 Apr 2020 18:49:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71A93F801DB; Tue, 28 Apr 2020 18:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A284FF800D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 18:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A284FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V2Zm63dU"
Received: by mail-io1-xd32.google.com with SMTP id w4so23695131ioc.6
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 09:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JS/Zae/slzX90tyUKT8r1SH4RG9V4TT4VPt705M4mKg=;
 b=V2Zm63dUiV3TTv4NusICrNtW9C+4hSQl0AvbqXXwN9RUmiI2qh/MP3EwePMMaD6a3H
 kFLvQEXGLfR1WPfk4I0a9Y2RxpET6/nFUP4Ft4xTMJcAII5++HFxk1cCU3ABcP0WGCBv
 nndZMG95rXNmP//mN3kFoluvP77qYaq7X9cyIGn8PEzpTldV/jmN3iYRV7+m55+o0q8V
 q07b1GUUU5enXKzG3nfwrzvw+qOQ73O7dRelONAy1hj+91aCmG8VWR4zYfgXV/fjDWx6
 sMJi9jhhaPpWcMWsBcS3Gue2AI67aQf4styimAP23+ASIOpa5fzTd70raNY04b0R9qT2
 ibjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JS/Zae/slzX90tyUKT8r1SH4RG9V4TT4VPt705M4mKg=;
 b=F4s6JbPi36Xwn5LzGTTX9gtqsz5sL4NHDWuTmqSNFU8FVPnfYepYkhwzI1kP3Z2FLj
 CBsfeSUi9iYN2pZcKFWxekq2mCMwUgmoxCtOZUrFN2B1xqI1+DBuAoJ/QvSuqIb5MiQl
 1qhUYk42PrCAHUBnmUnjaWtGIhR7wxkE5/mSxGqBfzMFYeMO2zhUWrxMjRjYAd2qndn2
 otde3Ktm6A3gsGSm0JtwUnSA24ZDkQJGvJIddkSAmMXhP72KvnFlR6Rk5YlsGtqbI0gd
 X5gMOASwH02nGa3EGc1ROSZBaYLpWn5ae83JLMY49jXU1ysRTmtafS6jiBXU+w0cVnUO
 JmKg==
X-Gm-Message-State: AGi0PubKI5N7UefXblTCyvc7kCQmEqgxWQXRStmUxMcHwkakFYeE9ZPa
 6jH0vUV3aTd696ptar8cyUivcL5XQTt8gZpgMII=
X-Google-Smtp-Source: APiQypKVVDj4+SrA1Wh3npapyS8is6Ny7tWN7gGRKKd2wbPbADnpfEAZaApyWXCE8Ach3PRxG824Bn1lotSb4OuXfiE=
X-Received: by 2002:a5d:9494:: with SMTP id v20mr26961821ioj.101.1588092561434; 
 Tue, 28 Apr 2020 09:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
 <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
 <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
In-Reply-To: <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 28 Apr 2020 18:49:10 +0200
Message-ID: <CAJiuCccFFUJJzXwygLQbDK4fGJ61p72Hv7vj3WVP-=z=J1Yj0Q@mail.gmail.com>
Subject: Audio sound card name [was [PATCH 4/7] arm64: dts: allwinner: a64:
 Add HDMI audio]
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
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

Hi Mark, Rob,

On Tue, 28 Apr 2020 at 18:04, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Apr 28, 2020 at 10:54:00AM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Maxime,
> >
> > On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Sun, Apr 26, 2020 at 02:04:39PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > From: Marcus Cooper <codekipper@gmail.com>
> > > >
> > > > Add a simple-soundcard to link audio between HDMI and I2S.
> > > >
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++=
++++
> > > >  1 file changed, 21 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > > index e56e1e3d4b73..08ab6b5e72a5 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > > @@ -102,6 +102,25 @@
> > > >               status =3D "disabled";
> > > >       };
> > > >
> > > > +     hdmi_sound: hdmi-sound {
> > > > +             compatible =3D "simple-audio-card";
> > > > +             simple-audio-card,format =3D "i2s";
> > > > +             simple-audio-card,name =3D "allwinner,hdmi";
> > >
> > > I'm not sure what the usual card name should be like though. I would =
assume that
> > > this should be something specific enough so that you're able to diffe=
rentiate
> > > between boards / SoC so that the userspace can choose a different con=
figuration
> > > based on it?
> >
> > I really don't know what we should use here,
> > I just have a look at other SoC:
> > rk3328: "HDMI"
> > rk3399: "hdmi-sound"
> > r8a774c0-cat874: "CAT874 HDMI sound"
> >
> > But maybe it's time to introduce proper name:
> > What about :
> > pat
> > sun50i-h6-hdmi
>
> It's pretty much what we've been using for the other sound cards we have,=
 so it
> makes sense to me.

I have a question regarding the simple-audio-card,name.
In this patch, I would like to introduce a simple-audio-card for the
Allwinner A64 HDMI.

What should be the preferred name for this sound card?
"sun50i-a64-hdmi" ? "allwinner, sun50i-a64-hdmi" ?

Thanks for your tips,
Clement

>
> > How should we handle this with h3 / h5 ?
> > settings the simple-audio-card,name in each SoC dts?
> > Or using sun50i-h3-hdmi as they are both identical?
>
> Yeah, we can do the latter
>
> Maxime
