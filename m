Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A43142F87D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 993881848;
	Fri, 15 Oct 2021 18:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 993881848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634316221;
	bh=MqfdCFm14PytNEmLejFPRRe+6weg1eBQdyMQbiDyM1g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pLK3Kpve5c/qPYQtn9lAGC+vCTLmsCZO7t3H+AMVJbKtL0D9daw1yQCGIkIizWq26
	 cbhQ5lSOKfwOBQaKNwqmjBH+COWimTWrZc4kl/P5eCdfAhBBcoOma8hm6OTetGgmj9
	 uxxDQUHJWmz9gY11bR4HEACEJ/HfbuqkVxdhxp+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BFEF8028D;
	Fri, 15 Oct 2021 18:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FF80F8016C; Fri, 15 Oct 2021 18:42:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B905F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B905F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KI65fw7I"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76E5160E0C;
 Fri, 15 Oct 2021 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634316131;
 bh=MqfdCFm14PytNEmLejFPRRe+6weg1eBQdyMQbiDyM1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KI65fw7IdjdnXr0urBu0VWoYkAZn5Fa0bkZvZ89ywtRtPFtBsNCw1Hk3GWVGyMHk6
 aRQyOzXEPwgaGmJ6dR01TEMQ1al8MKFQV25rAR4oAMQGLHG2MSwGgFu96zudFb5lHq
 N2u4wankzcEqyWRfcssUJi/nvk7tQKu5ThKbt/0MLRTM2TSE+EF6ypj1W8ABpDww3q
 ePo9E+xOdgg8Z5gLRJ6dSzdlvoMBrJNSvW8tyPlMwaLVGACo6grM9PaoxsuEsv3cnP
 IdpD9Ovif3ovuSz4p2XQrLz0F6Protyop7DQ92Ic0zvXsAg4YL/a0uLH4UsBIrCXmC
 /R775oxIs7DKw==
Date: Fri, 15 Oct 2021 17:42:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 5/5] ASoC: Intel: Skylake: Use NHLT API to search for blob
Message-ID: <YWmvYAr9EvVLDih5@sirena.org.uk>
References: <20211015164047.44492-1-cezary.rojewski@intel.com>
 <20211015164047.44492-6-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6XqSQZXjiKpiBR5C"
Content-Disposition: inline
In-Reply-To: <20211015164047.44492-6-cezary.rojewski@intel.com>
X-Cookie: 1: No code table for op: ++post
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, hdegoede@redhat.com,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--6XqSQZXjiKpiBR5C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2021 at 06:40:47PM +0200, Cezary Rojewski wrote:
> From: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
>=20
> With NHLT enriched with new search functions, remove local code in
> favour of them. This also fixes broken behaviour: search should be based
> on significant bits count rather than container size.

Acked-by: Mark Brown <broonie@kernel.org>

--6XqSQZXjiKpiBR5C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFpr18ACgkQJNaLcl1U
h9CP0Qf/UuyCdPN0w3iJ9gd2iHR3zT2tn9gxs2wWWSLcA4naFZAWFKRt7KWeuRPn
CX4oiJYwYIdbmJXtdYVbnCCsBbvko8SAMnXneSAAnP6R/0EOVjA41BERArtjeSe8
jmRxQCOfa2Y5TyiZqZMIs6lnzFgqehUuXMuqASV7ixLD6njcstUk0Ohh+KQI0uoF
f81dGOGZpTC7G2B4GcKONRm5O9JJZuI+x5Nrz0A6lFFiCNz4gIgxiGwNaHmcBbHM
eDDrGqoii7HxxDp1p8Mm5LkvBmJhenDRwEYRM53xTQgH72IIVMHGAqyQdJ+1gu9l
abKUFf6gBG+yJ0mVn9bfNwSthqnkHQ==
=coQ7
-----END PGP SIGNATURE-----

--6XqSQZXjiKpiBR5C--
