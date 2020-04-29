Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E71BD9FF
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 12:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 350EC1693;
	Wed, 29 Apr 2020 12:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 350EC1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588157078;
	bh=n6/ay3QeJrJ5ELBkOk861UqODjAYVcIfpMmBUaw7w78=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bn8l0qt9NNK1B+Q6OoKx0dK7aSfJDGgXUDk5I179rf6BTbPvlorSWSoL2sTVRXgXx
	 WXuNBmGD/eO8BAUGqmqNotq+W5NnrX9W8SYywb6abCtBbSr5DMtnzrX5BFV299zVxU
	 tBLOIDQuXhmGIj1yd3Fb2HjCytP28r+sbSV6vgB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCC00F8022B;
	Wed, 29 Apr 2020 12:42:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A524EF80217; Wed, 29 Apr 2020 12:42:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E42A8F800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 12:42:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E42A8F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AtVONm21"
Received: by mail-il1-x141.google.com with SMTP id b18so1962929ilf.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 03:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HQCeKCJ5flepvrlwaiupKHsPEVU0GNt4+HY/TULi0WE=;
 b=AtVONm21nVueyYOEjkLYejUuBgYmxhMXAOBhsMlPX4Y63BJoJJznDF9cqHZmyfgW0O
 04PtTzKuPGXkTqiqqqBvOSFQU/tY5aTy3h+MquydTM6cAPaBtEd6QeD2Uzsepwoacgm7
 EUrA3PX0EU8XgdtbJ+bZsdmKkufFj0oNquC3cxRGn+RecOq7qZDjjp7hZ3uPz2wH+Ry3
 NBfwS8axrMNb1W6FT32Z/fQgaiBUd8Qps4nva+s2HqC0qOFnAJ9rzcatLlD9PeMgx70t
 136uEHWPN8bvCD/EyvQ9ojuvl8tslWqieT1qIV8Aa3jT2L0yGihxHY1V4GtkXlSo53l+
 B9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HQCeKCJ5flepvrlwaiupKHsPEVU0GNt4+HY/TULi0WE=;
 b=b2aUT4J187Ft72MwZxDEVolrXzHluHS8LMn15FwNLrcD8pOweHQ7JZTJ3pYPU/rZQY
 RGhYu2qUClGpCsBJZWcTsXC/moRp9Gzj6FrPPYb6fz3YSVDoyNMFatt5m/iIZUuD1jdg
 vWoHOFX0zC1YbqtG592c7CZmIsFoxdNQ5AeanczzKqTAINeL+kiCIo5Gb20T84cAD8jK
 5nXs3mJOJpQ01Kgkj4JwBCvOSY7w3qRM7NikRrvqEA+rVgyfZ818FjqVBXx1UGSFU+FA
 TqH6X5zGchog7zVyhZA053UF/YWTFtCGt4jyB5VHPC9LYUJjyDnBrmRSreBJqIX4WoZA
 KSlA==
X-Gm-Message-State: AGi0PuYG6iTuNtQTCKtzr1M0OCy3hPzW1ih1YGzHMDltliAOfRgUmJKs
 W+BPK7BsU3bYWTwANmdOC1D6c+HbKyOepaewCY4=
X-Google-Smtp-Source: APiQypKL531i2NUS2jYYEqcP5uqHNVeBcZJLsXULczyPxkeF1g0mvYUtPJLWYzGXNriIVhhoi4PDnZCKXk4FbGoGWwc=
X-Received: by 2002:a92:d443:: with SMTP id r3mr31485691ilm.293.1588156964317; 
 Wed, 29 Apr 2020 03:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
 <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
 <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
 <CAJiuCccFFUJJzXwygLQbDK4fGJ61p72Hv7vj3WVP-=z=J1Yj0Q@mail.gmail.com>
 <031ee5d3-8a30-82ee-76db-c0e8a1073046@arm.com>
 <CAGb2v65rRbRpUTdkTF3hd5LnLQQt19YVOyVzM5te5XNVhQQH=A@mail.gmail.com>
 <20200429081729.qa3gqtl5sof2jhem@gilmour.lan>
In-Reply-To: <20200429081729.qa3gqtl5sof2jhem@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Wed, 29 Apr 2020 12:42:33 +0200
Message-ID: <CAJiuCceGDm3HJydesXvL=Wr1_LCAsewfKAB73YV5J7eAgTRpOA@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: Audio sound card name [was [PATCH 4/7] arm64:
 dts: allwinner: a64: Add HDMI audio]
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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

Hi,

On Wed, 29 Apr 2020 at 10:17, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Wed, Apr 29, 2020 at 02:24:00PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Apr 29, 2020 at 1:11 AM Robin Murphy <robin.murphy@arm.com> wro=
te:
> > >
> > > On 2020-04-28 5:49 pm, Cl=C3=A9ment P=C3=A9ron wrote:
> > > > Hi Mark, Rob,
> > > >
> > > > On Tue, 28 Apr 2020 at 18:04, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >>
> > > >> On Tue, Apr 28, 2020 at 10:54:00AM +0200, Cl=C3=A9ment P=C3=A9ron =
wrote:
> > > >>> Hi Maxime,
> > > >>>
> > > >>> On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > >>>>
> > > >>>> On Sun, Apr 26, 2020 at 02:04:39PM +0200, Cl=C3=A9ment P=C3=A9ro=
n wrote:
> > > >>>>> From: Marcus Cooper <codekipper@gmail.com>
> > > >>>>>
> > > >>>>> Add a simple-soundcard to link audio between HDMI and I2S.
> > > >>>>>
> > > >>>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > >>>>> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > >>>>> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > >>>>> ---
> > > >>>>>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 ++++++++++=
+++++++++
> > > >>>>>   1 file changed, 21 insertions(+)
> > > >>>>>
> > > >>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/ar=
ch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > >>>>> index e56e1e3d4b73..08ab6b5e72a5 100644
> > > >>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > >>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > >>>>> @@ -102,6 +102,25 @@
> > > >>>>>                status =3D "disabled";
> > > >>>>>        };
> > > >>>>>
> > > >>>>> +     hdmi_sound: hdmi-sound {
> > > >>>>> +             compatible =3D "simple-audio-card";
> > > >>>>> +             simple-audio-card,format =3D "i2s";
> > > >>>>> +             simple-audio-card,name =3D "allwinner,hdmi";
> > > >>>>
> > > >>>> I'm not sure what the usual card name should be like though. I w=
ould assume that
> > > >>>> this should be something specific enough so that you're able to =
differentiate
> > > >>>> between boards / SoC so that the userspace can choose a differen=
t configuration
> > > >>>> based on it?
> > > >>>
> > > >>> I really don't know what we should use here,
> > > >>> I just have a look at other SoC:
> > > >>> rk3328: "HDMI"
> > > >>> rk3399: "hdmi-sound"
> > > >>> r8a774c0-cat874: "CAT874 HDMI sound"
> > > >>>
> > > >>> But maybe it's time to introduce proper name:
> > > >>> What about :
> > > >>> pat
> > > >>> sun50i-h6-hdmi
> > > >>
> > > >> It's pretty much what we've been using for the other sound cards w=
e have, so it
> > > >> makes sense to me.
> > > >
> > > > I have a question regarding the simple-audio-card,name.
> > > > In this patch, I would like to introduce a simple-audio-card for th=
e
> > > > Allwinner A64 HDMI.
> > > >
> > > > What should be the preferred name for this sound card?
> > > > "sun50i-a64-hdmi" ? "allwinner, sun50i-a64-hdmi" ?
> > >
> > > I can at least speak for RK3328, and the reasoning there was that as =
the
> > > user looking at what `aplay -l` says, I don't give a hoot about what =
the
> > > SoC may be called, I see two cards and I want to know, with the least
> > > amount of uncertainty, which one will make the sound come out of the
> > > port that's labelled "HDMI" on the box ;)
> >
> > I agree. The user really doesn't care what SoC the system uses. The onl=
y
> > real requirement is to be able to tell which output the card is related
> > to, i.e. is it onboard or an external DAC, is it analog or HDMI, etc..
>
> Yeah, but it's exactly the point.
>
> If we also end up with "HDMI" as our card name, then the userspace has no=
 way to
> tell anymore if it's running from an rk3328 or an allwinner SoC, or somet=
hing
> else entirely. And therefore it cannot really configure anything to work =
out of
> the box anymore.

Yes the final user doesn't care if it's sun50i A64 HDMI or sun50i H6
HDMI, but like Maxime said between final user and the sound-card name
you may want to have a configuration layer.
This configuration layer can apply different settings depending on the
sound card.
Having too generic name will make impossible specific card configuration.

Also you can have specific name per board which can be quite clear for
final user.
 - sun50i-a64-hdmi
 - sun50i-a64-spdif
is not so hard to understand that one point to the HDMI whereas the
other point to SPDIF.

Regards,
Clement

>
> Maxime
