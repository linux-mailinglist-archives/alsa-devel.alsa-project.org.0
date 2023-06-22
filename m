Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E9E73A0A1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 14:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85CCC86F;
	Thu, 22 Jun 2023 14:13:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85CCC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687436066;
	bh=PGOGQGOXTZziMMV8nEYl3izDXzKlD36UBk87Cs8a5Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mCQrAboWTMip7ibAMQ7Ti3BQybblREMfbmPJL2fpitj+yNESzM0a5yPdSdxsvFFm5
	 GwncORZziYIDnq73hiYPPuuFV6l+ToS2vaksRs8QDjKHLrgi5Etm9P8DAatumfiFSc
	 BzaTVtWwCdVxPrDNkfCkfTOC+BiQcF4pVa0yHP14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37FB3F80130; Thu, 22 Jun 2023 14:13:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B2ACF80132;
	Thu, 22 Jun 2023 14:13:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5457FF80141; Thu, 22 Jun 2023 14:13:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E6C2F80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 14:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E6C2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qg8ETrRo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1B1C61812;
	Thu, 22 Jun 2023 12:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05272C433C0;
	Thu, 22 Jun 2023 12:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687436009;
	bh=PGOGQGOXTZziMMV8nEYl3izDXzKlD36UBk87Cs8a5Jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qg8ETrRo6Fh49qASL295/66y1yxMWmP5rwPmEcppgEw6EIyO+evpneQl9i88UGlR3
	 2Ry0++2IJkFPcosKI0xsQpQSNT8azxSK+YhwsX8Qrq78D2qLvywdWrn6VN2vCvdOVc
	 vrodZg7mIRCwLL0ulQ3C2OjxyS9ooPWrgvEdy93TX0Eiw4SRWb4R01u1jWDtkX/MCR
	 aGiBiBs4WXUS+Q5LBEWfR/W7RVHez0U2O/U/NV7GhCnU/65Jd6t+kf4BKFh90KBEcV
	 NES4r+wJN1X44Bwkgfh8UOknDwNXHA/lp67xpOf2eA5v0jhHFQ2mtydvxniXqWweIx
	 3HfFsXNUcOrrQ==
Date: Thu, 22 Jun 2023 13:13:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Cc: robh+dt@kernel.org, krzk+dt@kernel.org, thierry.reding@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	jonathanh@nvidia.com, mkumard@nvidia.com, sheetal@nvidia.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 7/8] arm64: tegra: Update AHUB clock parent and rate on
 Tegra234
Message-ID: <410e46f1-11ab-4775-9328-48aa45906b48@sirena.org.uk>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
 <1687433656-7892-8-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MhoiR7vHGfkcD/ZI"
Content-Disposition: inline
In-Reply-To: <1687433656-7892-8-git-send-email-spujar@nvidia.com>
X-Cookie: Please ignore previous fortune.
Message-ID-Hash: FMR6BBLIBLS2Y4GYTETKIG4A4ERWW6U6
X-Message-ID-Hash: FMR6BBLIBLS2Y4GYTETKIG4A4ERWW6U6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMR6BBLIBLS2Y4GYTETKIG4A4ERWW6U6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MhoiR7vHGfkcD/ZI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 05:04:15PM +0530, Sameer Pujar wrote:
> From: Sheetal <sheetal@nvidia.com>
>=20
> I2S data sanity tests fail beyond a bit clock frequency of 6.144MHz.
> This happens because the AHUB clock rate is too low and it shows
> 9.83MHz on boot.
>=20
> The maximum rate of PLLA_OUT0 is 49.152MHz and is used to serve I/O
> clocks. It is recommended that AHUB clock operates higher than this.
> Thus fix this by using PLLP_OUT0 as parent clock for AHUB instead of
> PLLA_OUT0 and fix the rate to 81.6MHz.
>=20
> Fixes: dc94a94daa39 ("arm64: tegra: Add audio devices on Tegra234")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sheetal <sheetal@nvidia.com>

Fixes should come before cleanups in a patch series to ensure that they
can be applied and sent as fixes without dependencies on non-fixes.

--MhoiR7vHGfkcD/ZI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSUOuIACgkQJNaLcl1U
h9BQ/wf6A4ZIp6SU+zUdNVkskOaaEKPYmqfrTPDbpRk/OjSwjwUkjhFHjTHRqgru
XB1GbDE8bpF3kcHit/PkdtdrUmYNyfrZ5PNmv+56UlyObu4TBSr6hkAieHg9HDF4
Oa9hQ0CxfK/IOmUKPG+uSZtXcpk1orWMzx/Q1Yg5RpikhgodSsBwUXlkw79Q68FY
ybogyto/jHAUshuJ9PsP9T9SEs2hQKKybh0ckaXIXI4XYjXkX/D2Ds91YAGxmKnz
DOhIpH8tASXpujxD2mdYoX62sIKrUdtirlgAMUYH8RUbPL7+NiZrL+9H5J/vPLmZ
zxRtzlYRZN88Vt8t9ah8dI8kFm/56w==
=bQo1
-----END PGP SIGNATURE-----

--MhoiR7vHGfkcD/ZI--
