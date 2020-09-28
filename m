Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F2127A9DA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 10:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D641EF4;
	Mon, 28 Sep 2020 10:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D641EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601282713;
	bh=Dn0PnclB2x/zUDGvS3WUxH6Xrc56a9U+9h7uVWwy0cc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2cxCEjVPfAp45l7QL5cnXcSzq0Dx2ggo3OO65n+WbGYQKUuXsMwSrWEwQmADYSrK
	 Dt5bipDfLK/NnVO8TDOMZz3sNbXkcTo1KBYiWLRXhI+MvkGRws7TC/bW1cYO1Pi3uD
	 YPnJYHRh11x3z58Ot0a8eWgwvHo7X0okhr/Y1zcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B515F80228;
	Mon, 28 Sep 2020 10:43:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20AA1F801F9; Mon, 28 Sep 2020 10:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89808F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 10:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89808F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="pnNGbA6R"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="t2qgWJin"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 943AB2BD;
 Mon, 28 Sep 2020 04:43:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 28 Sep 2020 04:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=oxCK4wZOYpID0KZNTWauBK7/zlc
 BHvmxDD57Zu4cEmY=; b=pnNGbA6Rd0/uCTZbqMkjs3TBsnmQi5Dr0UcDALXDm5A
 h9MmxQojzlLgXVXeANvDCI30nfhO35jBHrOwgz0nYENDOTyUdlmkLGZllQkZXOhi
 LxjJRXxEuNq/rYKan5TQl76mBLlhi/kCRXh8T59OyuYd5IV5FQLxjAr3UPAL9NFP
 FvCscbTea0418vZMpBhAVHxkMXvL9KybOtc+iSPz50uYqLpMvQIfx9d21+f7GgBR
 thvZGJ25fvimeG/NSVoAjlegEbbeTuDRJEMPGxsPiv0Mlw2yY8vJvK9vS+MpgYaN
 v+kFDUqfriqimfYfHmiArCUaV0l5S6tATF5wmkyZ2FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oxCK4w
 ZOYpID0KZNTWauBK7/zlcBHvmxDD57Zu4cEmY=; b=t2qgWJinD9T7l3X1sihDHk
 ulEywM7SzPKT+6dU8eLtTG4gAK1VU+fyn/LlTwR1uvvi65awadNnc1p3QwCd/mb5
 r8kXyzFHd5m+XiQZvHOmpm4+tmaZiI18rmWVV1D/hz89cl/y1bUNQGTPXPKfd4uH
 xO+emcKI7P8Amep8W6PaFRN701o5Z/F4mQZN2iAraCsadLA1THXn0XbRcFw1OpsD
 JSsXgEahaltzX5N6UbwiIUmFWLN4TB4DzwLQKcELnqr4mEnBguKPmgeaDuGxYBsO
 nmfLBxYD7kqR7Lg7VhpPsIq/iXeMIaoHXGfmYxDtIFBZL7RlpPRMgNM6xHH//ATQ
 ==
X-ME-Sender: <xms:HaJxX7PuJ-nF_htxSNLayG2wkIE5Qy_vig5bKDSNsWgtdp3VfC0LGw>
 <xme:HaJxX1-Qb7UWydyGCoMUet2DaSL5wdpTkxMMQ5gAVueEtwgeH1MSLR1A4B-aFdKxj
 wBQa3CLZUwZaFE0ogA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeigddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HaJxX6QqKu1sbBcrM3Vqdd_7DNaDHWOjRvtX_KDOhJsFuKgj090E0Q>
 <xmx:HaJxX_vrVqnABFSrYRI87_AIF_PDvRw1R-TuwIM3YwaFnms2YtiVPA>
 <xmx:HaJxXzfAraMPGmSyjPDsA70wfrC2Fkq3jApl5luJmmbRsi6I_w8kwA>
 <xmx:IaJxX73Z86hGDsfvbP3ciDw-4ks039rpkwkLEJsUiubSwNMk546t2d9GOzc>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A310C328005A;
 Mon, 28 Sep 2020 04:43:09 -0400 (EDT)
Date: Mon, 28 Sep 2020 10:43:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
Message-ID: <20200928084308.eipnvlfqe3c5lfmg@gilmour.lan>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
 <CAJiuCcfz9A_Vmzq=s3LK2kGB_1tZPkC9Ux+Brdocp9py0fovAg@mail.gmail.com>
 <59286578.E0qSRroNqr@kista>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nywbcxkwq6lidb2p"
Content-Disposition: inline
In-Reply-To: <59286578.E0qSRroNqr@kista>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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


--nywbcxkwq6lidb2p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 08:37:09PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 21. september 2020 ob 19:23:49 CEST je Cl=C3=A9ment P=C3=
=A9ron=20
> napisal(a):
> > Hi Maxime,
> >=20
> > On Mon, 21 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > >
> > > > Add a simple-soundcard to link audio between HDMI and I2S.
> > > >
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++=
++++
> > > >  1 file changed, 33 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/ar=
m64/
> boot/dts/allwinner/sun50i-h6.dtsi
> > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > >               status =3D "disabled";
> > > >       };
> > > >
> > > > +     hdmi_sound: hdmi-sound {
> > > > +             compatible =3D "simple-audio-card";
> > > > +             simple-audio-card,format =3D "i2s";
> > > > +             simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > > +             simple-audio-card,mclk-fs =3D <128>;
> > > > +             simple-audio-card,frame-inversion;
> > > > +             status =3D "disabled";
> > > > +
> > > > +             simple-audio-card,codec {
> > > > +                     sound-dai =3D <&hdmi>;
> > > > +             };
> > > > +
> > > > +             simple-audio-card,cpu {
> > > > +                     sound-dai =3D <&i2s1>;
> > > > +                     dai-tdm-slot-num =3D <2>;
> > > > +                     dai-tdm-slot-width =3D <32>;
> > >
> > > It looks weird to have both some TDM setup here, and yet the format in
> > > i2s?
> >=20
> > Yes, I agree I will check if it's really needed.
>=20
> I think this was explained before.

Possibly, but this should be in a comment or at least the commit log

> Anyway, this is needed to force width to 32, no matter actual sample
> width. That's a requirement of HDMI codec. I believe Marcus Cooper
> have another codec which also needs fixed width.
>=20
> There is no similar property for I2S, so TDM one is used here.

Except it's really dedicated to the TDM mode and doesn't really make
much sense here.

If we have special requirements like this on the codec setup, that
sounds like a good justification for creating a custom codec instead of
shoehorning it into simple-card

Maxime

--nywbcxkwq6lidb2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3GiHAAKCRDj7w1vZxhR
xWJJAP0VYV8qr8oRUJQXa1gO/KEHRiAM2KN5mADU4A/LD48/EwEA0ZjSWx11FGHU
uKbSn9mGmvKiACaWrHELDAqBdx6ooA0=
=GeNy
-----END PGP SIGNATURE-----

--nywbcxkwq6lidb2p--
