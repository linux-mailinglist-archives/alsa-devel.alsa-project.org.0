Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D071D89
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:20:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4545718E3;
	Tue, 23 Jul 2019 19:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4545718E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902410;
	bh=RGxy7hDUCJ72sMxCrsGzPCgGdaOWHj/QFgqLisVl6Us=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTy9YiXB7hGdD8iI/Ly/+0DK1X7jGOi5xiJCO7yFVPQjy8UPCa6Bm2O1r+d0abTFt
	 YDX+B0yAk47QTvSv5jLQOzt/tv0auGZyJvQORaNE1kUspcqFH8YOxq0YN1EoiIph+E
	 D7bwnYfsQhdThxBA6LZchmm6q3tH0gBhF0Wkd6RE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE88F80447;
	Tue, 23 Jul 2019 19:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C494F80447; Tue, 23 Jul 2019 19:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59D9AF80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D9AF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JGH3UWfe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kyS8UoyEXLK9klPXBrfSLR6RZyvQr6RpHt8wwJVmpgY=; b=JGH3UWfecknIwyubS3CMgNY+H
 rOiIidkBoW8oXQVuwRgcQ2pbCW0HW1VxN+eYgIhD2DlICwqpFT/QJdl3Je2O4tV5YcJtPQoew4mvd
 +hw80g23eqcI4A7htRPFBHkm366xAwQH8/IHplNychyonnV7dE5opYL6iKISs1TGDqo38=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyQb-0004L3-W4; Tue, 23 Jul 2019 17:18:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 255272742B59; Tue, 23 Jul 2019 18:18:17 +0100 (BST)
Date: Tue, 23 Jul 2019 18:18:17 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190723171817.GP5365@sirena.org.uk>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <ee65cc7b889b2a8d1139d1d25977842c956d1cf4.1563819483.git.mirq-linux@rere.qmqm.pl>
X-Cookie: Avoid contact with eyes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/5] ASoC: atmel: enable SSC_PCM_DMA in
	Kconfig
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
Content-Type: multipart/mixed; boundary="===============5187100273942754756=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5187100273942754756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bvgsfYmVhxWy/2TA"
Content-Disposition: inline


--bvgsfYmVhxWy/2TA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 08:27:20PM +0200, Micha=C5=82 Miros=C5=82aw wrote:

>  config SND_ATMEL_SOC_SSC_DMA
> -	tristate
> +	tristate "SoC PCM DAI support for AT91 SSC controller using DMA"

This breaks the build for me:

ld: sound/soc/atmel/atmel_ssc_dai.o: in function `atmel_ssc_set_audio':
atmel_ssc_dai.c:(.text+0xbd9): undefined reference to `ssc_request'
ld: sound/soc/atmel/atmel_ssc_dai.o: in function `atmel_ssc_put_audio':
atmel_ssc_dai.c:(.text+0xc74): undefined reference to `ssc_free'

It's not selecting the SSC comon code.  It also looks like it'd be
sensible to add a dependency on the platform (or at least architecture),
with a || COMPILE_TEST to help with build coverage.

--bvgsfYmVhxWy/2TA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl03QVgACgkQJNaLcl1U
h9DBZQf+JgxSye18m4nNkKnsgjUuG28GzeGRZgauDTClvkb/W5198CjJg1y7Xxbd
gEMn+eyBP2iwXez0dYeRw0mye4Zbl9VJfhCwN31JslTIlXwpNZxSH1TF/tgYnoXn
hkM3zfs7b5OdVmZKVY5Y7+27JkL105jf5yf7V6oj+8s+hVSmuwZZqodwy0LF+NsM
A0CDfSaTFQuM5NV6FmA4xoqju935Eo7pWauKRhJr4zsSCk5R+R5SbHzNtcBO24Kk
Rcbb+/BoLFdhySnAf1+FhvsNNNiHSTC8PM6sCmDU2sTI8NXj9F6BbP7DFq+NoqsG
qEFuuCbXXLuFYmtHWHII3zEkqcAPHg==
=pVk3
-----END PGP SIGNATURE-----

--bvgsfYmVhxWy/2TA--

--===============5187100273942754756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5187100273942754756==--
