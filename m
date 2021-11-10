Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE29C44C2E1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 15:20:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ABAF1661;
	Wed, 10 Nov 2021 15:19:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ABAF1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636554032;
	bh=hA/nFdbKqQcRgApfgKw2CXnFmecHb87F3NKnhNL5Vzk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DgxdRut4wFCZ4fB+pbs6KFV2R0oNWuwrwMtgIqXP12dHGB+NcicYYrm7PwBpS4ljY
	 flWJrTSHy9zdA8TCjoRA+BWqnGv7jKtITMx98Qz6Qnqz15sr3gyJxzyjtxRFWCBkZU
	 ZEaKQsQYTKwvJ4htRBNKslX9hr23fj3lxpUYVakQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9E8F804B1;
	Wed, 10 Nov 2021 15:19:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE248F8049E; Wed, 10 Nov 2021 15:19:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57E81F800C1
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 15:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57E81F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U4RX9wxO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35F18610CF;
 Wed, 10 Nov 2021 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636553943;
 bh=hA/nFdbKqQcRgApfgKw2CXnFmecHb87F3NKnhNL5Vzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U4RX9wxOCzFucBhhVgjP3syAwAb0nxp6hZvu1hdwt9sCEq6XNX/S4RRyDczv326uj
 /YStOAyH9/YLnXuhOenWF4bQZH7lcEmVsC8HGPWWcD1R4GbRfFj3ojPoXcweyPtHES
 jJ4NeV3IzvTcQf7SVXhVzuA5Cf9kuPcA2GP2h1/TG6HzlvygqEYp7U2QJbYTZEPzTd
 +DM31iBHUPiKU2g+ey5bfFYtWlCM/h6EciC0215R47vPmBr3bwUooIbNpcT+yLGZQj
 LJOKGXCNo4jj0MSiXyrrNPlA4k9jGYnBkJPgrXvnSMVZDfEpxxW8N9AtX4/5xQsSnC
 MTcnsTIeK5sWQ==
Date: Wed, 10 Nov 2021 14:18:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 4/4] ASoC: Intel: Skylake: Use NHLT API to search for
 blob
Message-ID: <YYvU04nFBSNrrYTJ@sirena.org.uk>
References: <20211110103117.3142450-1-cezary.rojewski@intel.com>
 <20211110103117.3142450-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+3ue7RapnSFBegBt"
Content-Disposition: inline
In-Reply-To: <20211110103117.3142450-5-cezary.rojewski@intel.com>
X-Cookie: You have junk mail.
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


--+3ue7RapnSFBegBt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2021 at 11:31:17AM +0100, Cezary Rojewski wrote:
> From: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
>=20
> With NHLT enriched with new search functions, remove local code in
> favour of them. This also fixes broken behaviour: search should be based
> on significant bits count rather than container size.

Acked-by: Mark Brown <broonie@kernel.org>

--+3ue7RapnSFBegBt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGL1NIACgkQJNaLcl1U
h9Bs5wf/WpkDcD0wFiVxgS7l3hRUV398Wl+5oiXkMPOsFO/4lBVN+/zWxVOHh8fl
W2Ck7yQie7mz/vikrySRnMF0SrL/TqBnqyvsJ84th2RXNQ8F0Q0lzFbxSvAuzkkU
sSVUH5RY4IcmJGcnlfQs6a4fSLOushBLBGEE2Dn81lOzATJZgyUFjChtaJo3LnRF
Gpq/zjh4irTrowWV2qRD2ivoEOTgT44TlQvLWtqfxZGIaTvkKyuWF8mp++VOrian
bPiJe2on+AKfvA5HE7CBkxKRY6llTGmB9bz3vGihjn62REgj5liS1/n6Ozf7veTh
dNWNFbK+FL/XCwBUlTbwmlsQ9t72Qw==
=PFS5
-----END PGP SIGNATURE-----

--+3ue7RapnSFBegBt--
