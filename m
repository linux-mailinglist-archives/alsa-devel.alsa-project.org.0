Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A569C551F77
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 16:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B561831;
	Mon, 20 Jun 2022 16:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B561831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655737065;
	bh=iuHCJsCWRrFc8xRE1pPf353DnYJkGMJluzCFMW+Nr6Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+80YSM1rcKjWWFEGJ3oH7USnujBFDzBBpc6YMbqNSI7CdFPKKi3BrpLZzOo79LzP
	 a02WSjH6pFAUKO/VWOZx/3bcVXKhWH/i1xQmS9qmnD0eIvFWvBhc0qk2D8JsRyjX0S
	 6VZMM4Og5xWsi+PBNSsLo5QgNvZR2+JknTFM0oHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E3FF804D8;
	Mon, 20 Jun 2022 16:56:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C101EF804D2; Mon, 20 Jun 2022 16:56:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90392F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 16:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90392F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Maa4UXxT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C13A0B811D7;
 Mon, 20 Jun 2022 14:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01640C3411B;
 Mon, 20 Jun 2022 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655736998;
 bh=iuHCJsCWRrFc8xRE1pPf353DnYJkGMJluzCFMW+Nr6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Maa4UXxTdt3KZpgrG3Bdx+W/MPuQawr5e4TNJJ861YViGUrJ0N5wel/7n6wsgIZ+g
 tyve74E9CTe/JKawsgozk5sAZfqVl+m9dsj9540Z2Pk9PYPSs5N96jM6yw/0Pe+5up
 OuZUE3yFNLH9+2PHOOjek94zMLsKyEejQEJyNFhwBOArVeI2YsY3FtieoN0W3VlY/Q
 t21P/3MIqx2FNfrkU7U/0+x90M3A4gAXtFQBemeNpRHXWUzOhzCfDvmM+OqmEYu7m5
 XuoHD19cmutNfSdAPAdklL31pj7efFk1CWj0YORIyMzkVpwMpBAgpkThMdut9k67m7
 30DSA9rk+tzYQ==
Date: Mon, 20 Jun 2022 15:56:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrCKn6UgvdwOQqAu@sirena.org.uk>
References: <AM6PR08MB437614D88A0F44746C2B88BAFFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AbQUs8uU3Zo5uRnw"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB437614D88A0F44746C2B88BAFFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Eran Matityahu <eran.m@variscite.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alifer Willians de Moraes <alifer.m@variscite.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>
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


--AbQUs8uU3Zo5uRnw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 02:49:51PM +0000, Pierluigi Passaro wrote:

> > > +static const char *cin_text[] =3D {
> > > +=A0=A0=A0=A0 "ADC", "DMIC"
> > > +};

> > > +static SOC_ENUM_SINGLE_DECL(cin_enum,
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 WM8904_DIGITAL_MICROPHONE_0, 12, cin_text);

> > Why would this be runtime selectable?=A0 I'd expect the decision to use
> > an analogue or digital microphone to be made in the hardware design.

> I agree that dedicated HW is required, but currently SW side there's no s=
upport at all.
> This patch is aiming to provide a way to enable DMIC on boards using it.
> Is this supposed to be managed in a different way ?

Via firmware description.

--AbQUs8uU3Zo5uRnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwip4ACgkQJNaLcl1U
h9COyQf/e1DSNnLS5C1cVLwYjiESEN2bZYjPBZvXZ/Nil+AvbRsE6mebr8M1RLAW
2Hhd0EnevkPtZygo8C0zz92XHbocSuNy15oYDIhYb7M3cG7VEOhqK8i2izZcs7CY
pR4TpxfAncFHht0NaOPWauJOlapDytWDmSNKtmi0Y1EXbJi86winalwy//S7Q3nO
Q/87q+YM253/joHhJK/cHMbz6ONqF1VodXrPX3SIJC40T3hW3mSqeNV/UFWkejdG
ROH4DIdG6ydfG+Kiwsy6aAVVr9Fg2XqkoEQPZzHUv3Laujd6U2Z3HgRI4eDgsOJC
hBOpo+Aw3wIT6Hjw5v4VY2YpcsD0YQ==
=elfJ
-----END PGP SIGNATURE-----

--AbQUs8uU3Zo5uRnw--
