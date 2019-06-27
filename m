Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C673581C4
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 13:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12DF21727;
	Thu, 27 Jun 2019 13:39:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12DF21727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561635645;
	bh=sZ9Crvb1H1J+QtWY7HLbrZtk/fHHUVQXSi0pMnkOUn0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tkJHQ33rO6mL3iVXsXLa7aGOVxMEqnNCnzNVB9SvB1soHoWhGSDt/DY1ldzqG9QfV
	 9Owm5/xrJLtKuliPMuUUD0YE5ajmP5FSzn+1RTHbQZviQiihGsgQeFg0om9fA87npb
	 OTwkMT7Q7b3ozwZtbREisTI4GYnejHGjYc6YCRkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2BA7F896F0;
	Thu, 27 Jun 2019 13:39:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CA0BF896F6; Thu, 27 Jun 2019 13:38:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30446F89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 13:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30446F89678
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rTRO7OpC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TYQTx4mS/Fju6tyiIfIR56gdZaB+q5lI81D+gM4ZTxU=; b=rTRO7OpCXNe2abjcMpIB60X5B
 gvd2IkNyZ+h1oiMh/nwVFHeFm4y9diDY3ry4DhueKNaX0AmzSpz0VJ8ZWrzbvcxy1WLmSKvnkkIKT
 laDzUb5cnmn1uoBqJ79FElE+7BelKFSpZQ/YAwtTgDx61GH+PoIr9iOUZJJ1dOAJ/K1Kw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hgSju-0003ew-Sd; Thu, 27 Jun 2019 11:38:54 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 457A7440046; Thu, 27 Jun 2019 12:38:54 +0100 (BST)
Date: Thu, 27 Jun 2019 12:38:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190627113854.GD5379@sirena.org.uk>
References: <8736jvkcy1.wl-kuninori.morimoto.gx@renesas.com>
 <871rzfkcxb.wl-kuninori.morimoto.gx@renesas.com>
 <20190627094316.35057063@xxx>
 <e6327e0c-a657-4fe5-4513-562835783eb0@microchip.com>
 <87woh7h1zf.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <87woh7h1zf.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You need not be present to win.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Codrin.Ciubotariu@microchip.com, alsa-devel@alsa-project.org,
 amadeuszx.slawinski@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 01/23] ASoC: atmel: atmel-pcm:dma.c: use
 devm_snd_dmaengine_pcm_register()
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
Content-Type: multipart/mixed; boundary="===============4581573701875354191=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4581573701875354191==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 27, 2019 at 05:24:37PM +0900, Kuninori Morimoto wrote:

> I'm asking it to Mark now.
> pattern1 is I will post v2 which cares empty function.
> pattern2 is I will post "remove empty function" patch set.

Removing the empty functions immediately is probably best.

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Uqs0ACgkQJNaLcl1U
h9DDPgf/ebk4NrkkklKvyewn+pyJmAxjkEjs+xbwNG6QnTCbpRE6HVWdwAvC56qe
6AAvt2FrZIsfm93Fxp+64iRlxsafPisq9a43pbQw490Iq2z62ITwyJQI66YHCfoU
+OrWsUnDOMHCr8E5iswnNuboQvaKaGtU+acUKwS8KDUUEX4K++p3T0pP0FfIKt+Y
FrSug9VLd00QQBFWqTKZnU5d34bsEY24NiNeFwp7NTDobsPxbdLeSiBgqIWRGWKH
lB5w5sGwGczBPA7H/mEaM/JmyEQRu7Roq0DM9FhciC3njU73pC7dN9xCkcruNeAW
J3g1cqS7cXQNeua3KG3Ta8+fvQYp5A==
=4Po1
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--

--===============4581573701875354191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4581573701875354191==--
