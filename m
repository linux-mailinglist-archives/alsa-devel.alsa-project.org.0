Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57626B302E4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 21:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DCD060244;
	Thu, 21 Aug 2025 21:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DCD060244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755804696;
	bh=qOtYYU5DnAi3h88Dlu/1yK7RrxeKt61Hb/3IUjxfT0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oqKfWqrm1UeoUBB/dYOMgMWQL3T85kFCa0dzgvXEyzaherG4u2pHfWwtU1DtWgVZO
	 89n1p+Dh5by27Em2O5etKw/NucWN1Vz2fKpnbU5ncRLKn74AKV2Ks0sxwJFwkaMtKB
	 Aw2XNgGpTnihofifZcS3m2DIa4sUA0Qr2nJLmwX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 432D1F805C9; Thu, 21 Aug 2025 21:31:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDA4F805C8;
	Thu, 21 Aug 2025 21:31:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA4D8F80518; Thu, 21 Aug 2025 21:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D495AF80254
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 21:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D495AF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cnd6mGVF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B989441B3;
	Thu, 21 Aug 2025 19:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2D1C4CEEB;
	Thu, 21 Aug 2025 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755804647;
	bh=qOtYYU5DnAi3h88Dlu/1yK7RrxeKt61Hb/3IUjxfT0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cnd6mGVFk3u84kJXHaYjH24LBU+FPVKixLsLue89ZEi10BTu+3geQBLmXdDRe89rP
	 epSGFwk+kWzZi40lBJ885bbP6DYpZlbWdrDozzbNl/VAqeSAT6XVvz/WYaPc1ck2Jz
	 otSZH/0vE7+qm/nt/JqkhQalEX/Sa8gqTWuASNTvcuF72yyUSsYZ3hL5KhL6hvXhsp
	 xoHuKo6cN0UM9UiS2M/ON3UMr/720ysQttQHtcKgvadMsm0CIDc95xbSJmEof5GFvI
	 3n5RNCawStKEOgQO64RQu8VV2vB20whSX4qT9s43QGgyX9k6o4MGUcXYEj5ZhEoEOE
	 dncoOLnLmfpqQ==
Date: Thu, 21 Aug 2025 20:30:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc2
Message-ID: <7bf6bc8a-ffb9-464e-9fbd-b06030af9044@sirena.org.uk>
References: <66897958e77c5e8fe5cdbbad27fcc725.broonie@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OwmDKqVDnAtZDGGn"
Content-Disposition: inline
In-Reply-To: <66897958e77c5e8fe5cdbbad27fcc725.broonie@kernel.org>
X-Cookie: Warp 7 -- It's a law we can live with.
Message-ID-Hash: 2M4FNQD4E6K76E3BSWC52DDFAZQEKOZB
X-Message-ID-Hash: 2M4FNQD4E6K76E3BSWC52DDFAZQEKOZB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2M4FNQD4E6K76E3BSWC52DDFAZQEKOZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OwmDKqVDnAtZDGGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 08:20:41PM +0100, Mark Brown wrote:
> The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0=
b9:
>=20
>   Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)
>=20
> are available in the Git repository at:

Sorry, my script didn't cope with me sending this to you on a different
machine to my usual one - it only checked for things being in Linus'
tree, not yours.  I've fixed that now.

--OwmDKqVDnAtZDGGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminc+IACgkQJNaLcl1U
h9DHHAf+NELq5rzM8HbA0RKsccJE2WtEYWuLLxRlLQckq367hddxVx1suj/2lrpw
JBCwpqW25D0bZWLBtt0oLwDk5qdCBJ00BuiQNlAtZH1AbocJ8D2sQZZhgUatBoOT
fmW4u6MrnvXcxjOG8bPsl/FSuebobUjSQW27je9biv25AbHGVr0uJVHmhOeCNvj3
e7JXKGDwKpZS/WFYKCteQid+fPuIqPBKtpM5cvlL+F+129Uot2rxMAMrunB7x0T9
FDOtKc6y5kI/diy0FsHuDrxpilk5clf5qrI+4g7QC6wqdt35++xvu9SUOkfvP4VL
+hrn9XzbAzNlyQhGlqWYWo9hVKUAjQ==
=JTUE
-----END PGP SIGNATURE-----

--OwmDKqVDnAtZDGGn--
