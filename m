Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE32817DE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 18:26:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDD281F28;
	Fri,  2 Oct 2020 18:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDD281F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601655994;
	bh=u1WjUx+3rOAKZqau+ndT20fcoRcf5RnxKPih+3hbsJ0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=voO8EaYENQRJLLTWBXrKziaarqM4mnTxuzoAHPaKKaRqe6N6+rpINDGhnlrQSora0
	 WK7ul46d1gvqopx3gNk0PAdLqAMfcaJLQ4N6uFKwpftzSjQr8d7efx1WbOCx2+Ex87
	 EIfwt9CY2q7gCTvGQ7xww40xvm1U43qhbLf8Q8xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08CAEF800AB;
	Fri,  2 Oct 2020 18:24:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AB6DF801F9; Fri,  2 Oct 2020 18:24:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33A8FF800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 18:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A8FF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="UYbCVYm6"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="q8tHztdT"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2A1805804D8;
 Fri,  2 Oct 2020 12:24:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 02 Oct 2020 12:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/Na0kRC1+fJJK0wPJ9qf9WplU4t
 XDhR5vxqGddIyCrw=; b=UYbCVYm6uNUvkTPT1CXHcpN0A0sKzZep1sloQWC7cc6
 Z6uc+PYvwS0KSgqwVEwlhMkiniQ5ESzva50/bgItKjZMRUtQZbguqN3rkt1COM2h
 LoPxtQyT1sAqQijVJKK3qEQ51wr/fbMtEXKZ+C8U7+cJDMozWup3fryix6QSLu3b
 AO3zmBoBPRrhpGWyUN/OX0Rch68zojC6urfNY0D8TgOqYOWtQfo3GVZKCXh5kJ4a
 nFeJjof00yf7ho3fgGoR9Sm8SmCRZJ5y7NbLfdBdMLNW+LmorYpAB6QE3YhjzZ34
 +uU52c453RHi3+kzFWm5Z9eBvSICFKkMHi+a+/OocrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/Na0kR
 C1+fJJK0wPJ9qf9WplU4tXDhR5vxqGddIyCrw=; b=q8tHztdTShmOcPdui24ohx
 oP0+pIQQj8HjoJ4NAkzJl8SDULqlbSlLYID/DfasQtM8vQX0oAWVvGiIcqT/9H4r
 0VDyV8KvwVqC1cuBkN30AisoY+IV6vR5Eq0Y3G/BCUpaBkEkV/Qbn3gMTnURoHua
 ODfpLDWITDXnZYe2pSPvia1rAq1IYOQk2dsvx01/Qgtl6xOoSynVkV/WLynmjiPi
 u8wj2Y1Jj7P80ZvGVY1pa3kuCuLhvU8a08H15rQvWhw/zJ+AcuKbCEXMGHpbf4Xs
 DQ4jQunj7/DFFPVyETwMXnmk55G1X2SfG2omQxTVkMSzEySMXXkZDVOHUpKt8HrQ
 ==
X-ME-Sender: <xms:Q1R3X7mLLu01yp-vw2Tj3kYqkey0LNwvPaLk8USLY1gF1s7PKlye2w>
 <xme:Q1R3X-3P21LmswRIA0T1zS5hJ5T-3SOr1Ha4cA-_1g-k3kCaxg4l3A0mS_Jm-uXRj
 8j2PBU-nZ6oDWsiobE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeigddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Q1R3XxrOQvByt7kHXDVKybkFEFse2x8sVamnz9GrDwSGnNvifQqOyw>
 <xmx:Q1R3XzmJeCJS-b2KxVLcZz7Am0HspgjV6lvgaKowFyzkql9C_OjYpQ>
 <xmx:Q1R3X51nayNSCzWd6EgP_sv-1grfoQ1PTIVevCrISRzsNp4nSHWlGQ>
 <xmx:RVR3X6s7SZjwuYtak9P9BMpHUFrmBG04UY6mcrE-fTmSXYNOrAxq6Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6BADB3064610;
 Fri,  2 Oct 2020 12:24:35 -0400 (EDT)
Date: Fri, 2 Oct 2020 18:24:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 09/20] arm64: dts: allwinner: h6: Add
 DAI node and soundcard for HDMI
Message-ID: <20201002162434.3jeksuelrig6yyo5@gilmour.lan>
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-10-peron.clem@gmail.com>
 <CAGb2v64uAHUd=Ag2pQDqH=gjtPVso5dnKKdCn3ihyiVh8V8L=g@mail.gmail.com>
 <CAGb2v64U9b1Ayq-XNCHb3z6spsds6eDaz3C4EsV9xFOquHrB7w@mail.gmail.com>
 <CAJiuCcfThSqpobeZW7ugnmokc4Xy0n9o+5jvOfP9eqzvDbu_BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pc2zpj5o3hm4cgp3"
Content-Disposition: inline
In-Reply-To: <CAJiuCcfThSqpobeZW7ugnmokc4Xy0n9o+5jvOfP9eqzvDbu_BQ@mail.gmail.com>
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


--pc2zpj5o3hm4cgp3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 06:01:21PM +0200, Cl=E9ment P=E9ron wrote:
> Hi Chen-Yu,
>=20
> On Mon, 28 Sep 2020 at 07:42, Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Mon, Sep 28, 2020 at 1:32 PM Chen-Yu Tsai <wens@csie.org> wrote:
> > >
> > > On Mon, Sep 28, 2020 at 3:29 AM Cl=E9ment P=E9ron <peron.clem@gmail.c=
om> wrote:
> > > >
> > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > >
> > > > Add the I2S node used by the HDMI and a simple-soundcard to
> > > > link audio between HDMI and I2S.
> > > >
> > > > Note that the HDMI codec requires an inverted frame clock and
> > > > a fixed I2S width. As there is no such option for I2S we use
> > > > TDM property of the simple-soundcard to do that.
> > > >
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++=
++++
> > > >  1 file changed, 33 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > >                 status =3D "disabled";
> > > >         };
> > > >
> > > > +       hdmi_sound: hdmi-sound {
> > > > +               compatible =3D "simple-audio-card";
> > > > +               simple-audio-card,format =3D "i2s";
> > > > +               simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > > +               simple-audio-card,mclk-fs =3D <128>;
> > > > +               simple-audio-card,frame-inversion;
> > > > +               status =3D "disabled";
> > > > +
> > > > +               simple-audio-card,codec {
> > > > +                       sound-dai =3D <&hdmi>;
> > > > +               };
> > > > +
> > > > +               simple-audio-card,cpu {
> > > > +                       sound-dai =3D <&i2s1>;
> > > > +                       dai-tdm-slot-num =3D <2>;
> > >
> > > Doesn't this end up limiting the number of audio channels HDMI can ca=
rry?
> > > AFAICT the TDM properties are all optional, so just leave it out.
> > >
> > > Same goes for the other two patches.
> > >
> > > > +                       dai-tdm-slot-width =3D <32>;
> > > > +               };
> > > > +       };
> > > > +
> > > >         osc24M: osc24M_clk {
> > > >                 #clock-cells =3D <0>;
> > > >                 compatible =3D "fixed-clock";
> > > > @@ -609,6 +628,19 @@ mdio: mdio {
> > > >                         };
> > > >                 };
> > > >
> > > > +               i2s1: i2s@5091000 {
> > > > +                       #sound-dai-cells =3D <0>;
> > > > +                       compatible =3D "allwinner,sun50i-h6-i2s";
> > > > +                       reg =3D <0x05091000 0x1000>;
> > > > +                       interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_H=
IGH>;
> > > > +                       clocks =3D <&ccu CLK_BUS_I2S1>, <&ccu CLK_I=
2S1>;
> > > > +                       clock-names =3D "apb", "mod";
> > > > +                       dmas =3D <&dma 4>, <&dma 4>;
> > > > +                       resets =3D <&ccu RST_BUS_I2S1>;
> > > > +                       dma-names =3D "rx", "tx";
> >
> > Sorry, missed this one.
> >
> > Given that usage for this interface is transmit only, and there is no
> > RX DRQ number assigned to it, you should drop the RX DMA number and nam=
e.
>=20
> Indeed if there is no DRQ number assigned we shouldn't have it in the
> device-tree
>=20
> but Samuel told me that the `make dtbs_check` reports:
>=20
> i2s@1c22800: dma-names:0: 'rx' was expected
> i2s@1c22800: dma-names: ['tx'] is too short
> i2s@1c22800: dmas: [[28, 27]] is too short
>=20
> Should I fix the YAML so?

Yep :)

Maxime

--pc2zpj5o3hm4cgp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3dUQgAKCRDj7w1vZxhR
xWNUAQDytEMJPPzTs+e8ZDtzT+2iNv0sKVHta5QD+LfuXZBmbgD/QisIsrbypwx5
fKJkl2netB5EWbzdHHzRhBS1gkZtpgc=
=1BCa
-----END PGP SIGNATURE-----

--pc2zpj5o3hm4cgp3--
