Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31633B5EA7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 15:04:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 381F6167A;
	Mon, 28 Jun 2021 15:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 381F6167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624885460;
	bh=Y26NYPMh7hRNMuctINof5yJOo5k8WTet6vA/hQSpDXI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8tmf7Nz6r4Usu/YmrAybEpaJz/YfszVtg3kMsCXwagR8BF8ftlCcyL6aStbiLEq6
	 A3bYJdAIrKB0jtIkr+G6OAnZgYBdb4oAQ8CfqBFXt5WJF314C+y8k3ZM/WDZbyRXpK
	 31HpTwXRxU7MKppHj2kiGnKW2PCxB+Bb7Ynd9EGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B82CAF80257;
	Mon, 28 Jun 2021 15:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3E7EF80229; Mon, 28 Jun 2021 15:02:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7255AF8020C
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 15:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7255AF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EmtcopAT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C04361C69;
 Mon, 28 Jun 2021 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624885361;
 bh=Y26NYPMh7hRNMuctINof5yJOo5k8WTet6vA/hQSpDXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmtcopATJkGEAjK8kZah+u23pZWB4XZLBNl3OhSp237m9Zc7/5pSCgTZIaq03mTSM
 l9fhEGbEKnG2Un5+V6Rz9Y8I6WHWhWWOxT5hgDLqJ6LtfWf3f9VMTin8VJZogGZQpg
 NAYqWMmoWkvPdo1AINeWqXoRv/v/DYgBevWxFX7itmXHlH4D/1i/8zGSwFnULg74T3
 I1qYEXcllSf7LE8gdRHE5Wz9v8SqvcfivPYp6feN4IFq/iyaRmS/2VPKDgNF/2oXmP
 9bADijpDp57Y77Rf/S5NhFM5o9u78OiBpOYCF6YNKU3lICrPgNKjSVAE8U6JvNC9hE
 TfQPkNSkS4oNA==
Date: Mon, 28 Jun 2021 14:02:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: atmel: ATMEL drivers depend on HAS_DMA
Message-ID: <20210628130214.GB4492@sirena.org.uk>
References: <20210530204851.3372-1-rdunlap@infradead.org>
 <9ba0da3b-dbdb-c91d-2def-f3dcd30cbde3@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <9ba0da3b-dbdb-c91d-2def-f3dcd30cbde3@infradead.org>
X-Cookie: Someone is speaking well of you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Bo Shen <voice.shen@atmel.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 27, 2021 at 03:28:59PM -0700, Randy Dunlap wrote:
> [adding LKML]
>=20
> ping?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDZyFUACgkQJNaLcl1U
h9Bt/wf8DWM389gRTL6jZi/DGboXJNS2QfPYTyMXCpfmcfQr2p+mJyijz59Aw4oU
tW1UDMrGmYvXI0euMGv3a8JsiRObGAK0rIQxmkU47hJODgKasgthC9BRumk8fktF
EfokNzzO2aOzORL1K2RaJ3vO50opo8uKzemVg/E5JqKUnmAlvPlbamETA9hdwEox
+GrNIKFTUiC8Oxc1tm18GnM44UysB1gqJDEx0heHAj/oGxFBwrpd1pCRwFd+zXu2
IjxFQkhmZQz1TFbZAu73NfVthd0++lgRv6HHmWpqQkZTT8nufLa+RsbR5JVKrBwr
IRJdbTzonmq8HqiailSlQlvtyoRxvA==
=wQXC
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
