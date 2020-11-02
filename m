Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA372A2821
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 11:23:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9232E16F5;
	Mon,  2 Nov 2020 11:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9232E16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604312588;
	bh=3fwwv6N8rGXyGohOaB5b75RvxekLyKPqHt6XuivmcdE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k6OabES+iloPeRCwR+Ib+nPLXadFaggiCa+HN21zmWMHnPB1XlAVrfXxIkCCtoMNq
	 cWDgn1VsaRX/2cU/zD6fU8tz+YeW6ia5Dr/KDjCwDvRK2mLMoitchvjVuo7S2foHdk
	 GCCTXvhyskE1QYc5nkFh+IDPiCJsLWbwd83BwP08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0AAAF8012B;
	Mon,  2 Nov 2020 11:21:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7724EF8012B; Mon,  2 Nov 2020 11:21:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DE50F8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 11:21:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DE50F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="rNItlLLh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kQtgAJMe"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 706D7F71;
 Mon,  2 Nov 2020 05:21:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 05:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=PvFF3ynvj8U9AtuE3ZXAxZ0vfte
 XxoZS6p/F5lE5ZUo=; b=rNItlLLhUaXKUKvpkOZQI4MBT1PL40dE549Jlr0KYud
 h3lxs1TjuiDfPLcEYClhrsQm6UFijcQsvl0cL8Upzzgj0QNMExnTnxl2ij2yuBht
 GcELvN5flwEarHutIId945VxvYRaRlFp2BzhptWFpSgzVFXXd29enZOYPORGibig
 OKH4sNvm+C5i9cSujiwEPIvgVWbQko5moGyLIUhVkXrX1urL87yzTYfc5S2n6mPK
 D2B/7r+BWsZUmcc54GgTKbci/KDUYUjOabDhuo+5Zdu2MOFe3Pp2FGHrmBY1NWot
 ihVcul1prQ5ENesU/8mP/7pRzT+pl4u+w4aI5HCP5qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PvFF3y
 nvj8U9AtuE3ZXAxZ0vfteXxoZS6p/F5lE5ZUo=; b=kQtgAJMe4hP+mVi1WfQB9b
 Iu/pBo7d8mdMLwYmX9FcPjwHlCWaGtoPNV5sPMi3ga3gwQVYwcdmpzgfuELjDrGj
 /DPLVVKMOJKW/AU3D9gOzqLU8Q0VKplDlfRPjXEQ1DGljuk8KizmKai+aMcjbRLu
 quXyQCxWLP+NzyS79MpokG/qd0dNO/hXg+QJGMJcoYVpjMW017pokIOPnHqKHN5a
 N8tduTSYfucnRunb7CuyAGB+z7z2SeM+6nPeBRXYKvSGzT+sX+UWGJz7myiDDfUV
 4TOnKjVo9anmeeJkgWOo1NOe54HmyhlAsiyBd/tAD2cyyX2C41kEGR68LvYO6CLQ
 ==
X-ME-Sender: <xms:n92fX8i3PMiJFmX6BmaFgoYnsu71xxFOcvvkwHwuH6-nXHHquSYYDg>
 <xme:n92fX1AMTvMM1sgqsDr7EkhjBGWW3rVTSqnuQMRC0k8sV6EX5ykkglePA72toM3kh
 WQLP_e-e-0zGEPGz6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n92fX0F2a2hdOv4H94nlSljmQNDrilb4whcChrOAEjrXP-6qhmwaig>
 <xmx:n92fX9Qrz6jyCRNRjOeOrPQSioNDPgh2CQnUKFpBZjls2h7spJEA_w>
 <xmx:n92fX5zlSX1rEl5UdtLKjT9KpZO3Kz2U_bf1kFO1FOBVgc3Lfub08g>
 <xmx:od2fX_4FF38OAQ0kQzzSx88W0PatPX3I3piDDDBR0PETqU7xyQjXc9rs45w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 583293280063;
 Mon,  2 Nov 2020 05:21:19 -0500 (EST)
Date: Mon, 2 Nov 2020 11:21:17 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
Message-ID: <20201102102117.hp6v5nnkhzp3bful@gilmour.lan>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
 <CAJiuCcfz9A_Vmzq=s3LK2kGB_1tZPkC9Ux+Brdocp9py0fovAg@mail.gmail.com>
 <59286578.E0qSRroNqr@kista>
 <20200928084308.eipnvlfqe3c5lfmg@gilmour.lan>
 <CAJiuCceHXr_5PvG-FW+hRNV7Q33hGrp8kLbO0EgfqqBxF7wbqQ@mail.gmail.com>
 <20200930101915.sultshdvxgu5u2rs@gilmour.lan>
 <CAJiuCcdMbMQGoBG-SmgQ5=25v3AB+kh0H8ZdX7rFMHAXQ2A=QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jj7xuc7e5l6brfxg"
Content-Disposition: inline
In-Reply-To: <CAJiuCcdMbMQGoBG-SmgQ5=25v3AB+kh0H8ZdX7rFMHAXQ2A=QA@mail.gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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


--jj7xuc7e5l6brfxg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 01, 2020 at 04:27:05PM +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> On Wed, 30 Sep 2020 at 12:19, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Sep 28, 2020 at 04:27:42PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > > On Mon, 28 Sep 2020 at 10:43, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > On Mon, Sep 21, 2020 at 08:37:09PM +0200, Jernej =C5=A0krabec wrote:
> > > > > Dne ponedeljek, 21. september 2020 ob 19:23:49 CEST je Cl=C3=A9me=
nt P=C3=A9ron
> > > > > napisal(a):
> > > > > > Hi Maxime,
> > > > > >
> > > > > > On Mon, 21 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > > >
> > > > > > > On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=C3=A9ment P=C3=
=A9ron wrote:
> > > > > > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > > >
> > > > > > > > Add a simple-soundcard to link audio between HDMI and I2S.
> > > > > > > >
> > > > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.co=
m>
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++=
++++++++++++
> > > > > > > >  1 file changed, 33 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b=
/arch/arm64/
> > > > > boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > > > > > >               status =3D "disabled";
> > > > > > > >       };
> > > > > > > >
> > > > > > > > +     hdmi_sound: hdmi-sound {
> > > > > > > > +             compatible =3D "simple-audio-card";
> > > > > > > > +             simple-audio-card,format =3D "i2s";
> > > > > > > > +             simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > > > > > > +             simple-audio-card,mclk-fs =3D <128>;
> > > > > > > > +             simple-audio-card,frame-inversion;
> > > > > > > > +             status =3D "disabled";
> > > > > > > > +
> > > > > > > > +             simple-audio-card,codec {
> > > > > > > > +                     sound-dai =3D <&hdmi>;
> > > > > > > > +             };
> > > > > > > > +
> > > > > > > > +             simple-audio-card,cpu {
> > > > > > > > +                     sound-dai =3D <&i2s1>;
> > > > > > > > +                     dai-tdm-slot-num =3D <2>;
> > > > > > > > +                     dai-tdm-slot-width =3D <32>;
> > > > > > >
> > > > > > > It looks weird to have both some TDM setup here, and yet the =
format in
> > > > > > > i2s?
>=20
>=20
> I was looking at sound documentation regarding how I can properly
> write the multi-lane I2S support.
> And I think we made a wrong interpretation here.
>=20
> TDM slot-num and slot-width are not referencing the format called PCM
> or DSP_A / DSP_B.
> But really the physical time division representation of a format.
>=20
> For example Amlogic do the following representation for Multi-lane I2S:
>=20
> dai-link-7 {
>     sound-dai =3D <&tdmif_b>;
>     dai-format =3D "i2s";
>     dai-tdm-slot-tx-mask-0 =3D <1 1>;
>     dai-tdm-slot-tx-mask-1 =3D <1 1>;
>     dai-tdm-slot-tx-mask-2 =3D <1 1>;
>     dai-tdm-slot-tx-mask-3 =3D <1 1>;
>     mclk-fs =3D <256>;
>=20
>     codec {
>         sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_B>;
>     };
> };
>=20
> So i think for 2 channels HDMI using the simple sound card with TDM
> property is not a hack but the correct way to represent it.
>=20
> Do you agree ?
>=20
> If so, can I resend the simple sound card for HDMI audio ?

I mean, it's not less weird :)

And like I said before we still have the option to write a card driver
ourselves that doesn't take anything from the DT beside the phandle of
the i2s controller and the HDMI controller.

If it's a fixed configuration, I'm not sure why we bother trying to make
it dynamic in the DT.

Maxime

--jj7xuc7e5l6brfxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5/dnQAKCRDj7w1vZxhR
xc3bAQDBBpdG6ljuCnnKETw/b11AG4Dbuw87Ymom2IQ23dS3MQEA5SG0IuuH3KYe
7Mcyw1rA6SqUu/RyQgBPqGUtPacGmQ8=
=ErtU
-----END PGP SIGNATURE-----

--jj7xuc7e5l6brfxg--
