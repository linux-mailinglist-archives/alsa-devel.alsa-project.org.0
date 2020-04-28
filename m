Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2881BC47F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 18:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEA21669;
	Tue, 28 Apr 2020 18:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEA21669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588089975;
	bh=V2CF0U248duBAvKwdSsGpETSpVvi/MThEPjSzBUHlqQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rdqvnk1w+Zbdh6zttZXUboy7z5Eeg559HjPiWFdKkgmtVGFrEP0N7o+NXOjwU7Sfe
	 mCBObIeqx+E1APRMmEYBNojzYpwJNsQTu2nuNjpiaBTQUtg49VLigP/aVL9UjHGxul
	 hykFMD4JY/p0RcEBCGwSaDYKM/Irfoxd0dYsQc7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4F1F8010A;
	Tue, 28 Apr 2020 18:04:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 761C2F801DB; Tue, 28 Apr 2020 18:04:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ECE5F8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 18:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ECE5F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="ekHX1BRP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gXKvxnxN"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2FE3D5FA;
 Tue, 28 Apr 2020 12:04:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Apr 2020 12:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=sOFZ1jPclsSm3u+h/VuhDsJZx7b
 YOtqGCr5nWlpsVh8=; b=ekHX1BRP+1TfVz1t22l+bCdNvO/JzeQA6e1nC954d4t
 rugCIEuZ2M2dWlEhMvSRZ4oA5UJN/TFTwHhTkMpX1eHjW/IJqhA24mA1ZLW6ADi2
 ds41Pi/0PKU7IBUJztJ2fMbH24oDPRpcSKr6TSlUTNwnoEfEms/G9QS+fKVl2iKT
 g17IGuNcD1m7j2dzaLwyBq/6ZKpJhDjPiYaWNu/1F6BavVzE/KrjFM7DsilU6TLr
 0lHD+FzZygGLcEevSvRb7A7f4NwRtsm2kphDtYfD1ry+lzvYJvHRigGWVNR+z6+T
 69c0QuwMZlF4ksNiGEovncrc1hbLSbJT8v1snxvA1Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sOFZ1j
 PclsSm3u+h/VuhDsJZx7bYOtqGCr5nWlpsVh8=; b=gXKvxnxNmCf3WzsWvfJxkq
 RNCq20RIfaux0rfvjpbZCbZgyGFomX2PW8pAhVUDi0QyecEHnbpX6L5R7JlQ1EpD
 aWZSxc8TjVtV/jCZlbvZ6UFzl+c0Z6sIfRUmbtnKfgnKE8XRtgjUEh6tk/dEy/bH
 NrGFoDPbAk6vIDYzpPMPbJh7RqPmEXKOp6tnBRLNah4Wuoj9k73C/VlBfQV+H4SC
 1kdf8Ieh8ZjyLvNXatnoL4SRDZBt2lidxPam/d8XFQMLbSvKCXDpHvYkMHgyb6Nr
 mj2OTA1MuhWAd3DkcEOFCMtT7c3E5O7D9A15hCLzhdqhDMajahNsznB2+jBc1Iew
 ==
X-ME-Sender: <xms:A1SoXgPyPISErhLyus-Su-GMKMbZFWO0F3E6774q64G3isa-TqfrWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedugdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:A1SoXgqgsqFCW-8s3uz2IiEo8frR3GgpaC4i3pHB53t_H9S02lhFcw>
 <xmx:A1SoXmlhcIkmeYJJhvXDDXSA7D1pqfRXHo3SIVaJiuGm_E6fEuZRag>
 <xmx:A1SoXgzuKmdtl820vHTZvitDHafGzX5L1UfDZrxYMyTmPJNgbsVMng>
 <xmx:BFSoXu5UwG_QI_x28zWwyD59bvLsERgxEGoqiXQ7gqsokpHr_cgGY4ZNc2I>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0FF803280059;
 Tue, 28 Apr 2020 12:04:18 -0400 (EDT)
Date: Tue, 28 Apr 2020 18:04:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: allwinner: a64: Add HDMI audio
Message-ID: <20200428160417.6q5oab2guaumhhwi@gilmour.lan>
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
 <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rbultuas4kxpkny5"
Content-Disposition: inline
In-Reply-To: <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
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


--rbultuas4kxpkny5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 10:54:00AM +0200, Cl=E9ment P=E9ron wrote:
> Hi Maxime,
>=20
> On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Sun, Apr 26, 2020 at 02:04:39PM +0200, Cl=E9ment P=E9ron wrote:
> > > From: Marcus Cooper <codekipper@gmail.com>
> > >
> > > Add a simple-soundcard to link audio between HDMI and I2S.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++++=
++
> > >  1 file changed, 21 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm=
64/boot/dts/allwinner/sun50i-a64.dtsi
> > > index e56e1e3d4b73..08ab6b5e72a5 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > > @@ -102,6 +102,25 @@
> > >               status =3D "disabled";
> > >       };
> > >
> > > +     hdmi_sound: hdmi-sound {
> > > +             compatible =3D "simple-audio-card";
> > > +             simple-audio-card,format =3D "i2s";
> > > +             simple-audio-card,name =3D "allwinner,hdmi";
> >
> > I'm not sure what the usual card name should be like though. I would as=
sume that
> > this should be something specific enough so that you're able to differe=
ntiate
> > between boards / SoC so that the userspace can choose a different confi=
guration
> > based on it?
>=20
> I really don't know what we should use here,
> I just have a look at other SoC:
> rk3328: "HDMI"
> rk3399: "hdmi-sound"
> r8a774c0-cat874: "CAT874 HDMI sound"
>=20
> But maybe it's time to introduce proper name:
> What about :
> sun50i-a64-hdmi
> sun50i-h6-hdmi

It's pretty much what we've been using for the other sound cards we have, s=
o it
makes sense to me.

> How should we handle this with h3 / h5 ?
> settings the simple-audio-card,name in each SoC dts?
> Or using sun50i-h3-hdmi as they are both identical?

Yeah, we can do the latter

Maxime

--rbultuas4kxpkny5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqhUAQAKCRDj7w1vZxhR
xThzAQCdfGqGBenInfXFcERmsGo6KmDYj/IpfZqqLJhS7hMAmAEAu4oEes/hmj4+
lop9h0Zfn5J8S9rkeex26DXrp2LOsQY=
=x+kX
-----END PGP SIGNATURE-----

--rbultuas4kxpkny5--
