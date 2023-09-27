Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DF7B0028
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 11:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1288AAE8;
	Wed, 27 Sep 2023 11:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1288AAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695807144;
	bh=cZsA2Bwd5dQg9fYOxwh55qsutXEo02ZTNVCxfZZnx0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=npDwRdjbllRWGiEkXpaY4NOgNo8FaFhKRsTnGSoX0gi3zZQEOQYRJC+Y+a/+CQWF2
	 8m9oOB1uSQMiorVajnSISF1fWhaWw26RFmkRrY3K4kRdyLiHcrYAkkJot4DUp14htw
	 16abo5ORSITqwdL2xQfCrU7doJio0j9QAwPkIt+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8F74F80558; Wed, 27 Sep 2023 11:31:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 705A7F8047D;
	Wed, 27 Sep 2023 11:31:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EBD3F8016A; Wed, 27 Sep 2023 11:31:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B94FBF80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 11:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B94FBF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y8P+kEwL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D3956175D;
	Wed, 27 Sep 2023 09:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A4EC433C8;
	Wed, 27 Sep 2023 09:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695807085;
	bh=cZsA2Bwd5dQg9fYOxwh55qsutXEo02ZTNVCxfZZnx0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8P+kEwL06U8frDbg5i9jjN17qhUSZOwPiDgpdAZnQx4QfYGB4Tq9t0bTW8k7ilfg
	 B4atijvydEMAXhYsJ9jRBWZmoMC1KQZhZEA+Mo2mg/gWhXxZbFr8chYsw/wpJFwVU8
	 pJdy1RIOxSvpdQ3zIYR3SwqBEy2ScBMVyzaQ7hXvh4JnWbGjuM+VfROVbMJ9QGNMmw
	 fNLlASOB0x/r+vSOMA6pL4tRQyNaSzGnHRKChxpe4T07nUqBshzpkq0mEyVz3gH14B
	 vHTBYztxuERLxslIQmqkBrn6yBsCHVnyY27UVJQnG9oqXbaaJ+OV/k+conhKfeD8yn
	 rCKTp92Pcyytg==
Date: Wed, 27 Sep 2023 11:31:22 +0200
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] ASoC: soc-pcm.c: Make sure DAI parameters cleared
 if the DAI becomes inactive
Message-ID: <ZRP2aghTvU4x3FUR@finisterre.sirena.org.uk>
References: <20230920153621.711373-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CnAeQwTRQV9vuxnA"
Content-Disposition: inline
In-Reply-To: <20230920153621.711373-1-chancel.liu@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: URXKLXZUWWG2BHKWTAWOZSSLF7PRUEGU
X-Message-ID-Hash: URXKLXZUWWG2BHKWTAWOZSSLF7PRUEGU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/URXKLXZUWWG2BHKWTAWOZSSLF7PRUEGU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CnAeQwTRQV9vuxnA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 11:36:20PM +0800, Chancel Liu wrote:
> It's reasonable that DAI parameters should be cleared if current DAI beco=
mes
> inactive.
>=20
> Only check DAI active status in soc_pcm_hw_free() is not enough since the=
re's
> the risk that DAI parameters never be cleared if there're more than one s=
tream
> [see A]. Only check DAI active status in soc_pcm_close() is also not enou=
gh
> since it will cause the cleanup just happening in soc_pcm_close() [see B].

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--CnAeQwTRQV9vuxnA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUT9mkACgkQJNaLcl1U
h9CZ7gf/TT2l6M7xebGR8UgDez3KbRn8MJrAq4wQDPw4rST8oHs5jSgX59/Neefh
fvfZ1NIAmstyP9g1O8lHM7H4ROVZ8vBgXNbqNgRdXWTssOHpadjJqWXkSOE3UYv6
ZDfdPcZuapuT8p65DUv7lsnZaKogJ/WuW8uR5+9cmVFP6CZ/A4r6kzMoqi2W6B6h
UeTKydJrVgo+X0pfO8OJdbjU+3np4ozx7rc19yU2m3l1pM4ZJrDL6A2/3929MZkn
83aOAoiyNXUZb2JXXdoxeFj9UtR11Aq/32oKdHt0VXLyNgpo9Ak2q//08KGTStaL
3eFeQDEsvL/YLfyGPR3xwiKxFNk7fw==
=IksO
-----END PGP SIGNATURE-----

--CnAeQwTRQV9vuxnA--
