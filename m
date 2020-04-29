Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C071BD700
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 10:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F52E168C;
	Wed, 29 Apr 2020 10:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F52E168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588148365;
	bh=X4cJ6VC21aUkOLyl+OD7oiHcHkCuHr82EVH0NgrQmsg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kDgYhkg/xaGUcfXBy7JRjk3SGONxqPbWFmqgs2hgWsEEHlbGExjNZfgqUJlZ3M3jU
	 NegOK9s4rPn6AE8f1mJhRzvCCGv3cACBCZVnKa4l1D+SHg0zYCE+8Th2+HPyri0mnh
	 IBWHMRavF5uQzcyoS4OrbZqkNbrrUOHh+JrPWxvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A46F800B6;
	Wed, 29 Apr 2020 10:17:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2009FF8022B; Wed, 29 Apr 2020 10:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D3FF800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 10:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D3FF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="keE4AtNX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RMY1ao3D"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DDA5458027F;
 Wed, 29 Apr 2020 04:17:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Apr 2020 04:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9P7/0UPj4dCl+a9BcbVbxC2GgjY
 drzjTRocMwAg6NXE=; b=keE4AtNXGrlJztPQMSvbYzA7Oe3i6UvofEq6umdij9u
 Pux+ERdLZV7JTep+VMsZG5IsrOh444fgFLZl9YyywdvLKAfQyoPgjut0SQXoMkNg
 MHGXl9b7+6Y0BoQr2g6R/VG+4/h/XDkwBMhIKyzGp+wvh/jzyjGKEi5KHohISFaw
 zDyQU/FXhBE4V54O1LPLiylO4qSIM3zwtnp+CWayu2KXxTCe70//Ddo02l1ODMLd
 HqMbfr3mIQjQ+R6LTUEL1OCUpwU8FHNX4HBhpxj0i6iKbtSXP/daE4QTvhnsH3Nk
 ABybXh/saM33t73l/2NT5oiZIoMXeXOWHEW3anNfH6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9P7/0U
 Pj4dCl+a9BcbVbxC2GgjYdrzjTRocMwAg6NXE=; b=RMY1ao3DHXhAEwoo64/9W/
 Unc27nWmyVqTxWpZ5Kj/qOMTZBmTT1oygte96nP8AWbiNNARfWT1m89qqNQZvzOt
 VhHjcjw2etl5XyHGqS5Jpf7wsUt3ib3fvRdSmGeAtbw/amfNFZochFNcB2iVOgWl
 yRZZE4o8nQ96TECjUl9PmH6e5NTt0mXNW+OJaZlB/MR3MEWLKdE2pf9+V319E613
 wZjfVXqBR9Czu78uTwO0tx1wPomQ8ZZFc7Crru3/nnd5aGWKVIQTfq8HRUAFkd5H
 m1vCyW9OhIzTe4tXiNmsx4efwtSjoVDDVitG8IfFPZz7tsiCx2DZYw47D0HRtR1g
 ==
X-ME-Sender: <xms:HDipXu7Orb7mtmRyTUdO08HJWZCN3zjSbecqDbXTKzWsmuOfubFzag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HDipXsLkdyB2sG1xAavaIw6hOxf_IdCsCrC8B5mMM8fcgKyElVBcjQ>
 <xmx:HDipXoefFWuYxW3tciiXC1eTjQbRLfL5kjhrSjrqkKz-5sixcbKEQw>
 <xmx:HDipXvc_-zYT7s-dvtCYusmxXd0o1fK48WiUkuXcgs1kWs5fbGGbaw>
 <xmx:HzipXpKkrszbNmiG7DG5lVN15LJp3NBmmxbvcqPOnUAo1aQIYXxioQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F9863280063;
 Wed, 29 Apr 2020 04:17:32 -0400 (EDT)
Date: Wed, 29 Apr 2020 10:17:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] Re: Audio sound card name [was [PATCH 4/7] arm64:
 dts: allwinner: a64: Add HDMI audio]
Message-ID: <20200429081729.qa3gqtl5sof2jhem@gilmour.lan>
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
 <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
 <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
 <CAJiuCccFFUJJzXwygLQbDK4fGJ61p72Hv7vj3WVP-=z=J1Yj0Q@mail.gmail.com>
 <031ee5d3-8a30-82ee-76db-c0e8a1073046@arm.com>
 <CAGb2v65rRbRpUTdkTF3hd5LnLQQt19YVOyVzM5te5XNVhQQH=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gt2wxqg5mx7iouyn"
Content-Disposition: inline
In-Reply-To: <CAGb2v65rRbRpUTdkTF3hd5LnLQQt19YVOyVzM5te5XNVhQQH=A@mail.gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
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


--gt2wxqg5mx7iouyn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 02:24:00PM +0800, Chen-Yu Tsai wrote:
> On Wed, Apr 29, 2020 at 1:11 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 2020-04-28 5:49 pm, Cl=E9ment P=E9ron wrote:
> > > Hi Mark, Rob,
> > >
> > > On Tue, 28 Apr 2020 at 18:04, Maxime Ripard <maxime@cerno.tech> wrote:
> > >>
> > >> On Tue, Apr 28, 2020 at 10:54:00AM +0200, Cl=E9ment P=E9ron wrote:
> > >>> Hi Maxime,
> > >>>
> > >>> On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > >>>>
> > >>>> On Sun, Apr 26, 2020 at 02:04:39PM +0200, Cl=E9ment P=E9ron wrote:
> > >>>>> From: Marcus Cooper <codekipper@gmail.com>
> > >>>>>
> > >>>>> Add a simple-soundcard to link audio between HDMI and I2S.
> > >>>>>
> > >>>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > >>>>> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > >>>>> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > >>>>> ---
> > >>>>>   arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 ++++++++++++=
+++++++
> > >>>>>   1 file changed, 21 insertions(+)
> > >>>>>
> > >>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch=
/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > >>>>> index e56e1e3d4b73..08ab6b5e72a5 100644
> > >>>>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > >>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > >>>>> @@ -102,6 +102,25 @@
> > >>>>>                status =3D "disabled";
> > >>>>>        };
> > >>>>>
> > >>>>> +     hdmi_sound: hdmi-sound {
> > >>>>> +             compatible =3D "simple-audio-card";
> > >>>>> +             simple-audio-card,format =3D "i2s";
> > >>>>> +             simple-audio-card,name =3D "allwinner,hdmi";
> > >>>>
> > >>>> I'm not sure what the usual card name should be like though. I wou=
ld assume that
> > >>>> this should be something specific enough so that you're able to di=
fferentiate
> > >>>> between boards / SoC so that the userspace can choose a different =
configuration
> > >>>> based on it?
> > >>>
> > >>> I really don't know what we should use here,
> > >>> I just have a look at other SoC:
> > >>> rk3328: "HDMI"
> > >>> rk3399: "hdmi-sound"
> > >>> r8a774c0-cat874: "CAT874 HDMI sound"
> > >>>
> > >>> But maybe it's time to introduce proper name:
> > >>> What about :
> > >>> pat
> > >>> sun50i-h6-hdmi
> > >>
> > >> It's pretty much what we've been using for the other sound cards we =
have, so it
> > >> makes sense to me.
> > >
> > > I have a question regarding the simple-audio-card,name.
> > > In this patch, I would like to introduce a simple-audio-card for the
> > > Allwinner A64 HDMI.
> > >
> > > What should be the preferred name for this sound card?
> > > "sun50i-a64-hdmi" ? "allwinner, sun50i-a64-hdmi" ?
> >
> > I can at least speak for RK3328, and the reasoning there was that as the
> > user looking at what `aplay -l` says, I don't give a hoot about what the
> > SoC may be called, I see two cards and I want to know, with the least
> > amount of uncertainty, which one will make the sound come out of the
> > port that's labelled "HDMI" on the box ;)
>=20
> I agree. The user really doesn't care what SoC the system uses. The only
> real requirement is to be able to tell which output the card is related
> to, i.e. is it onboard or an external DAC, is it analog or HDMI, etc..

Yeah, but it's exactly the point.

If we also end up with "HDMI" as our card name, then the userspace has no w=
ay to
tell anymore if it's running from an rk3328 or an allwinner SoC, or somethi=
ng
else entirely. And therefore it cannot really configure anything to work ou=
t of
the box anymore.

Maxime

--gt2wxqg5mx7iouyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqk4GQAKCRDj7w1vZxhR
xdYuAQCSWAhkZ+elqEcbpxFkCF5lqsPWcmn8x+bXetvScA7cMgEAqsSiFvNk9/P6
g63BaHgYF/RoI8GqAS53kmmdYLmT1gs=
=tWdH
-----END PGP SIGNATURE-----

--gt2wxqg5mx7iouyn--
