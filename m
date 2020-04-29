Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249B1BDA25
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 12:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD35F1694;
	Wed, 29 Apr 2020 12:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD35F1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588157742;
	bh=aLhzEIROWJrEv2j+dJaICCCeIuFjXopw9pdj7jSOccs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bItesEfm3h2h5mJyPRdNvi1umUv7bS1CWLNzSvn41mSAfT8jcTcWSnxbR9tOWAckv
	 /d+B3GJoSqZ/t3X6Qw+ah/rg64hugqfO8zjOcuKD8EP11BSy3UBhuP4Na/jJi5lT3J
	 6aKXKKGt3zNxRwgZuEHocU9KuqfDE9hC3y0Gqw7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1723F800D2;
	Wed, 29 Apr 2020 12:54:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D9CEF80217; Wed, 29 Apr 2020 12:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.siol.net (mailoutvs56.siol.net [185.57.226.247])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D0FF800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 12:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D0FF800D2
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id C3AF3521BE9;
 Wed, 29 Apr 2020 12:53:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id WTuFh5kUYBaz; Wed, 29 Apr 2020 12:53:52 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 3A022521DDA;
 Wed, 29 Apr 2020 12:53:52 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id E16C2521BE9;
 Wed, 29 Apr 2020 12:53:49 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [linux-sunxi] Re: Audio sound card name [was [PATCH 4/7] arm64:
 dts: allwinner: a64: Add HDMI audio]
Date: Wed, 29 Apr 2020 12:53:49 +0200
Message-ID: <2545943.S5iK65abk1@jernej-laptop>
In-Reply-To: <f9b701d9-0c4e-6e41-1ce8-52adf0f59a2a@arm.com>
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200429081729.qa3gqtl5sof2jhem@gilmour.lan>
 <f9b701d9-0c4e-6e41-1ce8-52adf0f59a2a@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
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

Dne sreda, 29. april 2020 ob 12:43:06 CEST je Robin Murphy napisal(a):
> On 2020-04-29 9:17 am, Maxime Ripard wrote:
> > On Wed, Apr 29, 2020 at 02:24:00PM +0800, Chen-Yu Tsai wrote:
> >> On Wed, Apr 29, 2020 at 1:11 AM Robin Murphy <robin.murphy@arm.com>=20
wrote:
> >>> On 2020-04-28 5:49 pm, Cl=E9ment P=E9ron wrote:
> >>>> Hi Mark, Rob,
> >>>>=20
> >>>> On Tue, 28 Apr 2020 at 18:04, Maxime Ripard <maxime@cerno.tech> wrot=
e:
> >>>>> On Tue, Apr 28, 2020 at 10:54:00AM +0200, Cl=E9ment P=E9ron wrote:
> >>>>>> Hi Maxime,
> >>>>>>=20
> >>>>>> On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech>=20
wrote:
> >>>>>>> On Sun, Apr 26, 2020 at 02:04:39PM +0200, Cl=E9ment P=E9ron wrote:
> >>>>>>>> From: Marcus Cooper <codekipper@gmail.com>
> >>>>>>>>=20
> >>>>>>>> Add a simple-soundcard to link audio between HDMI and I2S.
> >>>>>>>>=20
> >>>>>>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >>>>>>>> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> >>>>>>>> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> >>>>>>>> ---
> >>>>>>>>=20
> >>>>>>>>    arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21
> >>>>>>>>    +++++++++++++++++++
> >>>>>>>>    1 file changed, 21 insertions(+)
> >>>>>>>>=20
> >>>>>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>>>>>>> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
> >>>>>>>> e56e1e3d4b73..08ab6b5e72a5 100644
> >>>>>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>>>>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> >>>>>>>> @@ -102,6 +102,25 @@
> >>>>>>>>=20
> >>>>>>>>                 status =3D "disabled";
> >>>>>>>>        =20
> >>>>>>>>         };
> >>>>>>>>=20
> >>>>>>>> +     hdmi_sound: hdmi-sound {
> >>>>>>>> +             compatible =3D "simple-audio-card";
> >>>>>>>> +             simple-audio-card,format =3D "i2s";
> >>>>>>>> +             simple-audio-card,name =3D "allwinner,hdmi";
> >>>>>>>=20
> >>>>>>> I'm not sure what the usual card name should be like though. I wo=
uld
> >>>>>>> assume that this should be something specific enough so that you'=
re
> >>>>>>> able to differentiate between boards / SoC so that the userspace
> >>>>>>> can choose a different configuration based on it?
> >>>>>>=20
> >>>>>> I really don't know what we should use here,
> >>>>>> I just have a look at other SoC:
> >>>>>> rk3328: "HDMI"
> >>>>>> rk3399: "hdmi-sound"
> >>>>>> r8a774c0-cat874: "CAT874 HDMI sound"
> >>>>>>=20
> >>>>>> But maybe it's time to introduce proper name:
> >>>>>> What about :
> >>>>>> pat
> >>>>>> sun50i-h6-hdmi
> >>>>>=20
> >>>>> It's pretty much what we've been using for the other sound cards we
> >>>>> have, so it makes sense to me.
> >>>>=20
> >>>> I have a question regarding the simple-audio-card,name.
> >>>> In this patch, I would like to introduce a simple-audio-card for the
> >>>> Allwinner A64 HDMI.
> >>>>=20
> >>>> What should be the preferred name for this sound card?
> >>>> "sun50i-a64-hdmi" ? "allwinner, sun50i-a64-hdmi" ?
> >>>=20
> >>> I can at least speak for RK3328, and the reasoning there was that as =
the
> >>> user looking at what `aplay -l` says, I don't give a hoot about what =
the
> >>> SoC may be called, I see two cards and I want to know, with the least
> >>> amount of uncertainty, which one will make the sound come out of the
> >>> port that's labelled "HDMI" on the box ;)
> >>=20
> >> I agree. The user really doesn't care what SoC the system uses. The on=
ly
> >> real requirement is to be able to tell which output the card is related
> >> to, i.e. is it onboard or an external DAC, is it analog or HDMI, etc..
> >=20
> > Yeah, but it's exactly the point.
> >=20
> > If we also end up with "HDMI" as our card name, then the userspace has =
no
> > way to tell anymore if it's running from an rk3328 or an allwinner SoC,
> > or something else entirely. And therefore it cannot really configure
> > anything to work out of the box anymore.
>=20
> OK, you're a userspace audio application - enlighten me as to what exact
> chip you're running on here, and why you need to know:
>=20
> card 0: HDMI [HDA ATI HDMI]
>=20
> or how about here?
>=20
> card 0: Intel [HDA Intel]
>=20
>=20
> Furthermore, your argument works both ways - if the equivalent (or in
> common cases like DesignWare IP blocks, exact same) thing across 3
> different SoCs has 3 different names, then it's that much harder for
> userspace that wants to present a consistent behaviour. I don't know
> exactly why LibreELEC have downstream patches that standardise all the
> Rockchip ones to "HDMI", but I can't help noting that they do.
>=20
> With simple-audio-card we're talking about trivial interfaces that often
> don't expose any controls at all, so there's unlikely to be much
> 'configuration' for userspace to do beyond choosing which card to output =
to.

This combination (DesignWare HDMI controller + I2S) is same as on Rockchip.=
=20
Only difference is slightly different version of HDMI controller and differ=
ent=20
I2S core. Not sure what kind of configuration do you have in mind, but all=
=20
these controllers support 2-8 channels, different sample sizes, even=20
passthrough mode can be set (but it's not implemented yet). I would say tha=
t=20
this audio output supports quiet a few possible configurations.

BTW, above patches were thoroughly tested in LibreELEC. The only missing th=
ing=20
is extending I2S driver to support channel allocation through DT, but that'=
s=20
outside the scope of this series. Currently only 2 channels will work=20
correctly.

Best regards,
Jernej



