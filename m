Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 606308C9E14
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5949E1DA;
	Mon, 20 May 2024 15:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5949E1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716211454;
	bh=C+VaKB5ZHbJZl4o5Sv1ldXPb5YUdSFosua8CAo3BsZw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MlIj7uJ70EdqN2dp6dvAp3whPEa9prILV0YXsb2fgOdHa7+v7f9rBhQcZJF7teWJv
	 n5/uEsNa7Q69l8Zfg7SlkPWSAaiXqSzS1v0fBEq/z3B4waqu11s6ASYU5fQHgoY/Bq
	 8Fhw5ngn59FwvFtLUZng0hFtIFy+mpWFifNN/gYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC43AF805E0; Mon, 20 May 2024 15:23:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D0CAF805DA;
	Mon, 20 May 2024 15:23:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5603BF805C1; Mon, 20 May 2024 15:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02209F80578
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02209F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BzQ7DoyP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D7DD61D23;
	Fri, 17 May 2024 15:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40C5C2BD10;
	Fri, 17 May 2024 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715958647;
	bh=C+VaKB5ZHbJZl4o5Sv1ldXPb5YUdSFosua8CAo3BsZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzQ7DoyPmvRaKuzC8/U9zOxkwozvtR4PQqdOvQuPmzncSRKlPkHpoepMbBa/cOuR9
	 4283tHi1m7Rfh7PQRA4iGAhQUMZvxystgbeTsBkEQd7I3uTmMhG7755C5gu96IVT8R
	 7s55+t2KehaVrMASMOJOkCHYlFdHKXIVyB4A65LocivAhXMfhUOdXFmbr5QG7GcPdl
	 DwjjUrSLklu7L51Q+JXbis0MkPy4vBTSrycNp9aIkg/zfWMVucGdVirYgRyKe+KI2L
	 gFF3Cg3eKDKO55qpnkAqMqTMOZ/55JAoImRrJJ3tSEYaH+7608/9RkIcmrzc2A7DRY
	 /jqtp6IVFGQ5w==
Date: Fri, 17 May 2024 16:10:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Message-ID: <a1ce97df-480e-4dc9-88f1-a77c7a716f5b@sirena.org.uk>
References: <20240517072814.330597-1-shumingf@realtek.com>
 <e7ff0998-696c-4551-923d-7f04c7e89ba0@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qze8JbXR5ZfJaqhV"
Content-Disposition: inline
In-Reply-To: <e7ff0998-696c-4551-923d-7f04c7e89ba0@linux.intel.com>
X-Cookie: Function reject.
Message-ID-Hash: 67QUJ6CCE22L63QISXYCP44G7BVCAHZG
X-Message-ID-Hash: 67QUJ6CCE22L63QISXYCP44G7BVCAHZG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: shumingf@realtek.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
 jack.yu@realtek.com, derek.fang@realtek.com
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qze8JbXR5ZfJaqhV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 17, 2024 at 09:38:55AM -0500, Pierre-Louis Bossart wrote:

> > +static const struct reg_sequence rt1320_blind_write[] = {
> > +	{ 0xc003, 0xe0 },
> ...
> > +	{ 0xd486, 0xc3 },
> > +};

> I would add a comment that the 'blind writes' is an SDCA term to deal
> with platform-specific initialization, but in this case it seems that
> all the addresses targeted are in the vendor-specific space

TBH it seems perfectly intelligable without knowing anything about SCDA.

--qze8JbXR5ZfJaqhV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZHc3EACgkQJNaLcl1U
h9Aw4wf9El+rhnMfzi2WjH2wr57vk6mzDoUtLX06rvIZT+fqDJYdz2mJBMEpsXHs
h5JXPOGgRHHVamGn6XvOkQYTEm9ekmrg9/eBn2MF7uhQME5hx5WIGYzQnoZWGnmV
R6dDhPQ6roaxJFM4A7IyXb7wyBNObHomLraZxCKMPBs5sl3gj5Co8/uGVO7xQAKh
qLUXOhOBPbTilhEYJnGkaWi3W17tXk5Qe2weZ3g+4lXvVPQsAJriaYoZU/b/oPBS
6l6QO2ekG5gia2SdWgK0reb5dvz1PDBC1Z6hbYETmCXZ0+CuF4M7ASrsEE/+SJ6D
a2aJBPIJpracy1Vz6bJ0FKdijNgVOw==
=osqb
-----END PGP SIGNATURE-----

--qze8JbXR5ZfJaqhV--
