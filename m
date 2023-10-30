Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1437DBB6D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 15:10:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2233A4C;
	Mon, 30 Oct 2023 15:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2233A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698675048;
	bh=iQ6jApxvO0tpKLVPe96hOuy4lWviNxqW9uMETdsE5r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aldTgBj+iryUORwdJ4/b/JS6mRcCLEY1rxo4jPCXmwcdBNTRh6snIpiONgIufvz/u
	 KkXFVESLR7Ai9C9/psxB7XwCtxK8WhDNdzUq00lXnSOE/0kHjpHZ0d8f54k+qswZBW
	 0fKhFHYIho50xjx9OH+8D96Dn3UaMMQjTph1JbJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3351FF80290; Mon, 30 Oct 2023 15:09:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6192F80166;
	Mon, 30 Oct 2023 15:09:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2DDCF8016D; Mon, 30 Oct 2023 15:09:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9364CF8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 15:09:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9364CF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WeChsi/u
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12952CE12A8;
	Mon, 30 Oct 2023 14:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC25C433C9;
	Mon, 30 Oct 2023 14:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698674982;
	bh=iQ6jApxvO0tpKLVPe96hOuy4lWviNxqW9uMETdsE5r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeChsi/ujxqN8nejpo6BLV5+ZV27PgDFDD/qIECUQXG6D1ZPOfSAwy74goSlb2z4m
	 pOWz+yR6KC7e24Gaaz5YFbJjNC9oMhD9oJ41JXpPlZoPlk5KukWteVifYjCDUnmzR/
	 PlKaNeyQWuLbZpZ4ksTnA5n7AiYmIcOZQzhGGEtTPJMWYKWp38WkMc27uj/VgVGAXX
	 12d+ZA0M7wDqycxIHdbzniLKQ5ELF+iZfBKJFidnzBKYplbaWZGbmbwyGmbX69Xl5a
	 HG+JwOHcjQbgGJ3hoYl+/gmLJtXMkPCCgTX4k/ONbP31Gt64ftiXisxElf9k2f6wBr
	 Lst5Pzr5s0fdA==
Date: Mon, 30 Oct 2023 14:09:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.7-2
Message-ID: <54533b94-2692-4fa1-aeb0-c20466754b82@sirena.org.uk>
References: <20231030133347.21FE1C433C8@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XUqC6BQmSOYHfmzp"
Content-Disposition: inline
In-Reply-To: <20231030133347.21FE1C433C8@smtp.kernel.org>
X-Cookie: Boy!  Eucalyptus!
Message-ID-Hash: TBJDRKF5FKL2FKDRSXCN2GOPF3QV3A6O
X-Message-ID-Hash: TBJDRKF5FKL2FKDRSXCN2GOPF3QV3A6O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBJDRKF5FKL2FKDRSXCN2GOPF3QV3A6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--XUqC6BQmSOYHfmzp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 01:33:37PM +0000, Mark Brown wrote:

> ----------------------------------------------------------------
> ASoC: Updates for v6.7
>=20
> More updates for v6,7 following the early merge request:
>=20
>   - Fixes for handling of component name prefixing when name prefixes
>     are used by the machine driver.
>   - Fixes for noise when stopping some Sounwire CODECs.
>   - Support for AMD ACP 6.3 and 7.0, Awinc AW88399, more Intel
>     platforms and more Qualcomm SC7180 platforms.
>=20
> ----------------------------------------------------------------

Due to a merge up of Linus' tree there wasn't a great base to do the
diffstat against.

--XUqC6BQmSOYHfmzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU/uSEACgkQJNaLcl1U
h9Bcgwf/Xsh8XcpjZFXf+ON8s99PMQ0pREWm5l8VyU3YHe0q5TB0hs6nRd2Xejvd
FBbMLA6Myi9Iieo1iIgQ1UhYYZVV4cKeNEO/7p+Y+eAbdIaIRWB0MDKh4LnksckQ
zI1KgefLz6VRx8PbvXTE/6OcLq0CCSZOczLgtDSUoiGR9jmkqj8b16drN8cE4Dr1
2mrN00wiHt6DWjebPX21yLPLo70invxHQ15f8oXfkJOMowORz5NoW5gf/K8VM8Gx
bdBZdKltzqmIJ8b6JrGkzuSDd8WEajiA8hUgH2j91y3eeJORix+8+HqlmoYshNBH
CNT5WQOPsxrJ7E2zpmoLPmIxnUO3Sw==
=77e6
-----END PGP SIGNATURE-----

--XUqC6BQmSOYHfmzp--
