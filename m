Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A57A7A1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:06:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5088817DD;
	Tue, 30 Jul 2019 14:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5088817DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564488410;
	bh=xgBT8bfD5hT1ZI0Y7CME+nFDwzOgZfDoMDloTYsGhrY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7s2r/2Gyc0MG0xwuEe0l8o7UJyyk0T/1kUC7QOa+0qsZok4M7fv1dJNjKmkNAeWa
	 DoX/TIbzvavGUF2tJepDfC5BcqP3vqzfDGBKKxg4Ycx794b4P4cNUj++2GdKuhcYQY
	 bbfBVgPN41BJpZKKx7kXPs7X9QsB2uBjLkQmSz9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7854EF80482;
	Tue, 30 Jul 2019 14:05:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C692F804CA; Tue, 30 Jul 2019 14:05:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CE6FF80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CE6FF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="CUbKJOSw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xHN5JoqHKamARZpeNV4nfdGOcqIZaC5iBwfGs29oFM=; b=CUbKJOSwv4V3JsWTmEv/hECy/
 jMqU1C6z8dcefdwH5lbwt7prDmE+zhSzcosPTSnuLqxI4wfiepZlCmFq7y6DZEe0AzuBKAXdfNpSp
 rNrBwa5r1HyOfspwdp/epPoOwnVTPqXusLgTpf4xfjngkv+MsBb/DC3sZWPXByFoab90U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsQsC-0007Ly-Ey; Tue, 30 Jul 2019 12:04:56 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 920E72742CB5; Tue, 30 Jul 2019 13:04:55 +0100 (BST)
Date: Tue, 30 Jul 2019 13:04:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Message-ID: <20190730120455.GA4264@sirena.org.uk>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-8-daniel.baluta@nxp.com>
 <20190730080135.GB5892@Asurada>
 <CAEnQRZAUOzmP2yPb4utyDTnYUDNyqesXJPb5-Ms0tfPy8TMBig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEnQRZAUOzmP2yPb4utyDTnYUDNyqesXJPb5-Ms0tfPy8TMBig@mail.gmail.com>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Viorel Suman <viorel.suman@nxp.com>,
 Timur Tabi <timur@kernel.org>, Rob Herring <robh@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mihai Serban <mihai.serban@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 7/7] ASoC: dt-bindings: Introduce
 compatible strings for 7ULP and 8MQ
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
Content-Type: multipart/mixed; boundary="===============0567162583525249664=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0567162583525249664==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 03:02:30PM +0300, Daniel Baluta wrote:

> I removed the 'or' on purpose because I don't want to move it
> around each time we add a new compatible.

> Anyhow, I can put it back if this is the convention.

You could convert to the YAML binding format and sidestep the problem a
different way!

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AMmQACgkQJNaLcl1U
h9AMEAf+L6HeZMKwL3JgS35lz8KJn8puYlz6JlAgu8b5kJD5U15z/ScSQXE8uJOt
CMauZ7x1gmPQXGEdGQHFSFa365yso1EB4MgsReZDTurM0YYdi9I2038gqzLrtKB0
r+avuU0EzhaljA0ZugeMbEN6v5YiZGf2yrlzOFUyyUb83zTCFQsHscmnH+cw5QCH
HhjVqWPaGLUKuPmJRWO8ol9QMKghvRP5y5N2e+Yohj+mb3xNHdHvXN1Qa/G9koeA
uJU3R7ifuKcvxbGmu/HoWpcvfpWVMPyF/ej2BC2i1uKdiwSsvxFrN3OP8EfUlL5p
syfgAj372TEvfhTQ/2190PTyHrr++A==
=VqB7
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

--===============0567162583525249664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0567162583525249664==--
