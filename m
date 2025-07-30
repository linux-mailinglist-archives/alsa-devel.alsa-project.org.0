Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E773B15E7A
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jul 2025 12:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C718160220;
	Wed, 30 Jul 2025 12:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C718160220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753872576;
	bh=FwwIBzVLKrN7X/OD68/2tT4gL5lrrwNTMy8C5g55L3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T29QU+4XgPo0r/vGAMEHz43kD3QsI4FWcnvEiZSPgHOA+GYgrg6sR7aNsgbRGQmAY
	 fu9A4sV8OQQgZstE+TXhXRR9CaHTuCCGp3BK9dKT23nat9fQXXEVnOL7sEj8yxJxxL
	 5pslrZic3rnTXCozj9MKBBCCPd0AHC7st4DkXH1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35DB7F805C7; Wed, 30 Jul 2025 12:49:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DAEEF805C4;
	Wed, 30 Jul 2025 12:49:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C5DF80254; Wed, 30 Jul 2025 12:48:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55AB9F80152
	for <alsa-devel@alsa-project.org>; Wed, 30 Jul 2025 12:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55AB9F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hE91/pre
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D82775C6217;
	Wed, 30 Jul 2025 10:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8B5C4CEE7;
	Wed, 30 Jul 2025 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753872522;
	bh=FwwIBzVLKrN7X/OD68/2tT4gL5lrrwNTMy8C5g55L3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hE91/pre5fubNfPuOxM9GkqL55jdYcn9ZxeEKmZPi6GgLwM6f05z/9pN6zsbRb061
	 DdDfjHg4NIdXCM6/S4NE2rFsIF9/JiT8eCiz08VGeLYqmaUlI3cEs1UtaV6/Vucb1c
	 CfbabyZwdbuQ6np8tKynHndPVslHQZ7uhey6VwmDiRTxy7Fia3MR/gUe4izFmwmfNJ
	 ws+Vtoqssbi/Ewvn7Yb7S15IeSK3IThc/6TPCOx1/sozntix4nLnKp3QVGac+c+7tJ
	 g/dQXRna+k40Qyv5wYvoigqSEMy/VE02oACruWf54+gRR45twTkTza1bB7Gu9xdDe9
	 bzlclDqbZaQDw==
Date: Wed, 30 Jul 2025 11:48:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	13916275206@139.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: tas2781: Normalize the volume kcontrol name
Message-ID: <05fa81c8-2125-4275-8501-8d7790f0b68b@sirena.org.uk>
References: <20250730053236.57643-1-baojun.xu@ti.com>
 <e36cd0bf-fe0f-4edc-841c-83f688a5e75f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="twMYDlwnHUKAd+cL"
Content-Disposition: inline
In-Reply-To: <e36cd0bf-fe0f-4edc-841c-83f688a5e75f@sirena.org.uk>
X-Cookie: Linux is obsolete
Message-ID-Hash: UM6GRAYULZ3FLB2IYFQOPDIEXSRQDT2S
X-Message-ID-Hash: UM6GRAYULZ3FLB2IYFQOPDIEXSRQDT2S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UM6GRAYULZ3FLB2IYFQOPDIEXSRQDT2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--twMYDlwnHUKAd+cL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 11:17:49AM +0100, Mark Brown wrote:
> On Wed, Jul 30, 2025 at 01:32:36PM +0800, Baojun Xu wrote:
> > As more devices become supported, add "tas2781" as a suffix before the
> > TLV name, correct the DVC step, and normalize the volume kcontrol name.
>=20
> I'll apply this but this really should be several different commits, the
> variable renaming and the user visible renaming should at least be
> separate commits.

Sorry, actually no - there's also HDA changes mixed in here which should
be a separate commit as well.  Please split this up into separate
changes.

--twMYDlwnHUKAd+cL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiJ+IUACgkQJNaLcl1U
h9Axrgf/ekHxn5G90nadHECYU5gsVUPd+Cfy+Zzzizk0ZeeHZGcDLuw7x914Q+Ek
fF3Bp2mOffP4YtPhgqLaVaQ7IkOxxDWyhvEW3b/KxuE88UnNPwVYXoIBZrn1lfOE
ujy5wBl3hngasqGVSlqyF6iD3ur74ykzqsYz5jzifeyI16DAKi5+TNFHsjSjbCbl
muo4HtGjQk/1ftmArb3gbJVvacYr3lC38Bd/pSxZCyOtUL+jVWxJgxQEhKPuyV8c
YRPBvl6/8BBXspyHxZtA8sLJ45DIGJIneCKfzosbi9TUk7F0HX7/t9IWXzLnHG+4
5W4u3KNhltBSBbhucAi61/8qfHmaiQ==
=Mab2
-----END PGP SIGNATURE-----

--twMYDlwnHUKAd+cL--
