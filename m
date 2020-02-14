Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C458315D7ED
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE981679;
	Fri, 14 Feb 2020 14:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE981679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581685582;
	bh=7QY7vBOE0bgML9XXjR5buyq+i0Gj4OOu/ohz0xJ55xw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Idwn0rYtQSWLUwdP4T04KdiohLay2zsJJH3aNUX2aB7/2XZbHkQUAytn/ji1+VDLM
	 yRiy0s4wf5guorrS5OE2+IK5MfXk/qiYaa28woij4mwGtQkZuGNtrpw8l35FaNnTFf
	 tD3NAZJJCnDAMR3pXpToY/B/XFNY5ek1OV+sW78Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37B49F80138;
	Fri, 14 Feb 2020 14:04:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82FCFF8014F; Fri, 14 Feb 2020 14:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20414F80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20414F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PlL/l3Z7"
Received: from earth.universe (dyndsl-095-033-170-229.ewe-ip-backbone.de
 [95.33.170.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 021942168B;
 Fri, 14 Feb 2020 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581685471;
 bh=Whpmh17W3kSxzCbioGOu19PQoaptQmnJO000zV6cl/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PlL/l3Z7kdOoZpVyGq4Roudbx0tJgxPrPX2KIHigFeXx4RIrrrT+QNcPyJFJjicgb
 qxc27FG+O+7IGNWpHE0t33kVWRXs4y3BEylH+Lsal/AqdD/0i59RTOC4sTKBI9292O
 X0ddPyfqq3ku12pGk9j3YuYrLx9AJfVNmaYFZ4T0=
Received: by earth.universe (Postfix, from userid 1000)
 id A5A543C0C83; Fri, 14 Feb 2020 14:04:28 +0100 (CET)
Date: Fri, 14 Feb 2020 14:04:28 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Message-ID: <20200214130428.gkhmr55ptmi2bh2x@earth.universe>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <20200214003452.xuadnylj2udqyljs@earth.universe>
 <20200214013454.GX64767@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20200214013454.GX64767@atomide.com>
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Allocate dais dynamically for
 TDM and audio graph card
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
Content-Type: multipart/mixed; boundary="===============7443330097114439882=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7443330097114439882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="grqobqlnl2f7lvmu"
Content-Disposition: inline


--grqobqlnl2f7lvmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 13, 2020 at 05:34:54PM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sre@kernel.org> [200214 00:35]:
> > On Wed, Feb 12, 2020 at 06:35:43AM -0800, Tony Lindgren wrote:
> > > Yes this should follow the audio-graph-card.txt example. We end up wi=
th
> > > mcbsp3 dts node as below on droid4:
> > >=20
> > > &mcbsp3 {
> > >         #sound-dai-cells =3D <0>;
> > >         pinctrl-names =3D "default";
> > >         pinctrl-0 =3D <&mcbsp3_pins>;
> > >         status =3D "okay";
> > >=20
> > >         ports {
> > >                 mcbsp3_port: port@0 {
> > >                         #address-cells =3D <1>;
> > >                         #size-cells =3D <0>;
> > >=20
> > >                         cpu_dai3: endpoint@0 {
> >=20
> > cpu_dai3_cpcap
> >=20
> > >                                 reg =3D <0>;
> > >                                 dai-format =3D "dsp_a";
> > >                                 frame-master =3D <&cpcap_audio_codec1=
>;
> > >                                 bitclock-master =3D <&cpcap_audio_cod=
ec1>;
> > >                                 remote-endpoint =3D <&cpcap_audio_cod=
ec1>;
> > >                         };
> > >=20
> > >                         cpu_dai_mdm: endpoint@1 {
> >=20
> > cpu_dai3_mdm
>=20
> OK
>=20
> > >                                 reg =3D <1>;
> > >                                 dai-format =3D "dsp_a";
> > >                                 frame-master =3D <&cpcap_audio_codec1=
>;
> > >                                 bitclock-master =3D <&cpcap_audio_cod=
ec1>;
> > >                                 remote-endpoint =3D <&mot_mdm6600_aud=
io_codec0>;
> > >                         };
> > >                 };
> > >         };
> > > };
> > >=20
> > > That is pretty much the same as the 'Multi DAI with DPCM' example, wi=
th
> > > dne dai, and multiple endpoints. I think we still have just one port
> > > for one i2s transport on the mcbsp :)
> > >=20
> > > Does the above look as what you would expect based on the binding?
> >=20
> > I haven't had a look at this for quite some time. I suppose the
> > cpcap voice DAI and the modem will also have two endpoints? So
> > once the BT support is added it will looks like this [simplified]?
>=20
> Well it will be even simpler, no need for extra endpoints at
> the codecs, see below.
> =20
> > &mcbsp3 {
> >     ports {
> >         port@0 {
> >             cpu_dai3_cpcap: endpoint@0 {};
> >             cpu_dai3_modem: endpoint@1 {};
> >             cpu_dai3_bt: endpoint@2 {};
> >         };
> >     };
> > };
>=20
> But yes, bluetooth would be just added as above under mcbsp3.
>=20
[...]
>
> Then the modem codec looks like this:
>=20
> mot_mdm6600_audio: audio-codec {
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
> 	#sound-dai-cells =3D <1>;
>=20
> 	port@0 {
> 		mot_mdm6600_audio_codec0: endpoint {
> 			remote-endpoint =3D <&cpu_dai_mdm>;
> 		};
> 	};
> };
>=20
> > &bluetooth {
> >     ports {
> >         port@0 {
> >             bt_dai_cpu: endpoint@0 {};
> >             bt_dai_modem: endpoint@1 {};
> >             bt_dai_cpcap: endpoint@2 {};
> >         };
> >     };
> > };
>=20
> And bluetooth would be similar to cpcap_audio and mot_mdm6600_audio
> above.

My understanding is, that CPU is not involved for calls (except for
setting up cpcap registers correctly). Basically McBSP3 should
remain idle for a call and data goes directly from modem to cpcap.
The same should work for modem <-> BT, except that CPCAP seems to
always provide the clock. That would imply a direct link between
modem and codec / BT?

> My guess is that only cpcap registers and clock rate needs to be
> changed for bluetooth audio BTW, so if somebody havs a bluetooth
> headset just do the following in Android:
>=20
> # cpcaprw --all > /tmp/before
> configure bluetooth headset for audio in android and start
> playing some music or make a phone call
> ...
> # cpcaprw --all > /tmp/after
> stop playing music or phone call
> ...
> diff -u /tmp/before /tmp/after
>=20
> The registers will be different for a bluetooth phone call and
> playing music.

I can provider register values once I find some time.

-- Sebastian

--grqobqlnl2f7lvmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5GmtMACgkQ2O7X88g7
+poqlxAAoWvnDgIQ89tEJ3QSMvEfczJKLhj/o5/V9vMZaFmtaPu/FfV1uSgVl62E
u7yH8XYBz/SFzkspyURXuBR0BVN8HYqgIDT7sMGfF56SqWR31aUgEPQP2W1SVZeR
W7x2NcPDRBpRciEqiwEWWp7ikRd5XWvDOwFL6moH1fNhHK3ckznQzC4AAg1FvAdv
9YYdYfq+HV+TXGlGZHS8NV0+a+jzVUDrHY4FN/WaHBFnfoPMzZXicdtWv5gYcS8A
5Iq1Rm28VX/r0aOsk6UaPOeKkynjHfueQhPHnlao5SRsaA4dLJG4OXIkJdbLs0xw
Bt9AumrNmMpfMh5l4jmNezh+EBHARY0pgnzptPga/cdaCjIFMBwsSVHtkJmNT5Z1
iXujx+GP838sqdnKE141bo2fePlZ6cn4qY5kWsN4jf8BkxNKexP8Qz8UVc3820rn
WFhzRdDVLJLBZga464CWaYAdUxnv52TcfmDyETUeGs4CQVcM5a3s00Xn+U70cFvd
oz4TD7OsXcyrhQgisbrUpQ3rhLVr4zzn2Bj9/3jOodJezPXp/TJSaWnZsEwRH3jg
tyCsODn49aYuJEc6lGLwH8edtbJyU0eApVzQ5XCA3pwmcRZzA34sefpYyw791kdM
8H0dpVRfaBxg8VBFhb437qUMAukYjN9rj8MuzPi/rdDrCOKopZ0=
=s63e
-----END PGP SIGNATURE-----

--grqobqlnl2f7lvmu--

--===============7443330097114439882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7443330097114439882==--
