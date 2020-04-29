Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B01BD493
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 08:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 058C5168C;
	Wed, 29 Apr 2020 08:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 058C5168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588141562;
	bh=2h/bB9HhSa6zaeckNKxUcAcERDl9vxU7G56M+NgCEc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ugo8ARLHA0A621oNdyhKZD9Yg756vLi6xMf0ttBVGfj7sZhWcwSlaIalPe43R9V65
	 xHQQRybJhxls32F7R4QMvKn0dT+TEyYVN+gkQWiw/L0tkG4EVCv88/ErofWziSGv8d
	 7vFkfh5Mcnxq3ZLBvSI/cuNMBXAsAPWnVeD3GItk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2627CF80232;
	Wed, 29 Apr 2020 08:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EBBBF8022B; Wed, 29 Apr 2020 08:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3FDBF800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 08:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3FDBF800D2
Received: by mail-lf1-f67.google.com with SMTP id u10so643936lfo.8
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 23:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UMvE1bKhgPMPyH5g6riW7cDoy79w0qtcoyNsyUsk4iA=;
 b=PIudWSbOgGl9sMUnrPZcof5q5adhNclrgLVOeRgr7aZNon3vG4oRaJzLN/pOUZ91fX
 o9AH+FadeLA7EE607Uo+60zz0I1/LivRy5tAbtRq8lOzg9dnpR82yncoINEw7WPyIiar
 d2bsAupnHQPlB2ZPTEGa6DFS9Gvf8j6iqkCPgBWX+4F/35MYd8R10j6aTESXIvJdGBVi
 3KCodOKR+opr5Vn/hTqzSuaKkyQrqQx/TllkomGmLUL22WHAt8tvRcgNThYtnhIe9ADA
 lWEfIWxt1zNKrz/tCxc0d7QLhrpiMfoiqUFoc26ZkoB7oWxv67VwvoonNuBJ3I6v+dDs
 udQA==
X-Gm-Message-State: AGi0PuboUMlxEo7rNhazNO2mTuMVaGmEG9+77FvPs9Wowlj2vEh1BwOo
 Pm0+2W3z6a9eXlCYG851glagZG8AX5foag==
X-Google-Smtp-Source: APiQypJewK2QMrtahs90F4wjXscxfK7lNGP7C265A/naJrlsWHIGQPpAdKjPpKkP0F12U2tqmKxMCg==
X-Received: by 2002:a05:6512:d1:: with SMTP id
 c17mr21833017lfp.167.1588141452257; 
 Tue, 28 Apr 2020 23:24:12 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id a5sm152272lfi.20.2020.04.28.23.24.11
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 23:24:11 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id d25so634677lfi.11
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 23:24:11 -0700 (PDT)
X-Received: by 2002:ac2:5238:: with SMTP id i24mr5157585lfl.7.1588141451325;
 Tue, 28 Apr 2020 23:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
 <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
 <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
 <CAJiuCccFFUJJzXwygLQbDK4fGJ61p72Hv7vj3WVP-=z=J1Yj0Q@mail.gmail.com>
 <031ee5d3-8a30-82ee-76db-c0e8a1073046@arm.com>
In-Reply-To: <031ee5d3-8a30-82ee-76db-c0e8a1073046@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 Apr 2020 14:24:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v65rRbRpUTdkTF3hd5LnLQQt19YVOyVzM5te5XNVhQQH=A@mail.gmail.com>
Message-ID: <CAGb2v65rRbRpUTdkTF3hd5LnLQQt19YVOyVzM5te5XNVhQQH=A@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: Audio sound card name [was [PATCH 4/7] arm64:
 dts: allwinner: a64: Add HDMI audio]
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Robin Murphy <robin.murphy@arm.com>,
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

On Wed, Apr 29, 2020 at 1:11 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-04-28 5:49 pm, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Mark, Rob,
> >
> > On Tue, 28 Apr 2020 at 18:04, Maxime Ripard <maxime@cerno.tech> wrote:
> >>
> >> On Tue, Apr 28, 2020 at 10:54:00AM +0200, Cl=C3=A9ment P=C3=A9ron wrot=
e:
> >>> Hi Maxime,
> >>>
> >>> On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote=
:
> >>>>
> >>>> On Sun, Apr 26, 2020 at 02:04:39PM +0200, Cl=C3=A9ment P=C3=A9ron wr=
ote:
> >>>>> From: Marcus Cooper <codekipper@gmail.com>
> >>>>>
> >>>>> Add a simple-soundcard to link audio between HDMI and I2S.
> >>>>>
> >>>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >>>>> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> >>>>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >>>>> ---
> >>>>>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 ++++++++++++++=
+++++
> >>>>>   1 file changed, 21 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/a=
rm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>>>> index e56e1e3d4b73..08ab6b5e72a5 100644
> >>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>>>> @@ -102,6 +102,25 @@
> >>>>>                status =3D "disabled";
> >>>>>        };
> >>>>>
> >>>>> +     hdmi_sound: hdmi-sound {
> >>>>> +             compatible =3D "simple-audio-card";
> >>>>> +             simple-audio-card,format =3D "i2s";
> >>>>> +             simple-audio-card,name =3D "allwinner,hdmi";
> >>>>
> >>>> I'm not sure what the usual card name should be like though. I would=
 assume that
> >>>> this should be something specific enough so that you're able to diff=
erentiate
> >>>> between boards / SoC so that the userspace can choose a different co=
nfiguration
> >>>> based on it?
> >>>
> >>> I really don't know what we should use here,
> >>> I just have a look at other SoC:
> >>> rk3328: "HDMI"
> >>> rk3399: "hdmi-sound"
> >>> r8a774c0-cat874: "CAT874 HDMI sound"
> >>>
> >>> But maybe it's time to introduce proper name:
> >>> What about :
> >>> pat
> >>> sun50i-h6-hdmi
> >>
> >> It's pretty much what we've been using for the other sound cards we ha=
ve, so it
> >> makes sense to me.
> >
> > I have a question regarding the simple-audio-card,name.
> > In this patch, I would like to introduce a simple-audio-card for the
> > Allwinner A64 HDMI.
> >
> > What should be the preferred name for this sound card?
> > "sun50i-a64-hdmi" ? "allwinner, sun50i-a64-hdmi" ?
>
> I can at least speak for RK3328, and the reasoning there was that as the
> user looking at what `aplay -l` says, I don't give a hoot about what the
> SoC may be called, I see two cards and I want to know, with the least
> amount of uncertainty, which one will make the sound come out of the
> port that's labelled "HDMI" on the box ;)

I agree. The user really doesn't care what SoC the system uses. The only
real requirement is to be able to tell which output the card is related
to, i.e. is it onboard or an external DAC, is it analog or HDMI, etc..

ChenYu
