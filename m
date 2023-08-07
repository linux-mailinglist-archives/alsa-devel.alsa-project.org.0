Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB6B7732D4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 00:12:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1E8829;
	Tue,  8 Aug 2023 00:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1E8829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691446336;
	bh=I7PTtY0Y1K4bVfv+ey+R3oZVTdF4P6a3d5E/mIAjJ8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jwk0M473jq0GLYKAAuArT+vu+xRE3PFm2XeX2Zs5M4+MP5W9w3rZ60EVZ6bJQTdP9
	 udMzA5/hkFT5wHdZzM5XAA7N27xq4t2e2GYBUR3z0+ENc96QtwMbXwc3FYL6pcCX24
	 8o0/vu2Gfp7K5uVH3QL+WcJuaYIKKECM/sY97UHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1759BF8016B; Tue,  8 Aug 2023 00:11:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89530F8016A;
	Tue,  8 Aug 2023 00:11:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E520F8016B; Tue,  8 Aug 2023 00:11:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 52132F80087
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 00:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52132F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZZ00iCsm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F473622B1;
	Mon,  7 Aug 2023 22:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571C9C433C7;
	Mon,  7 Aug 2023 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691446275;
	bh=I7PTtY0Y1K4bVfv+ey+R3oZVTdF4P6a3d5E/mIAjJ8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZ00iCsm6gLmZ4xFZHBcUlR8d/U7gsU5F4LXg/9ZVrPsvrjTHc4ngifl4feEgYfC+
	 HqtFsUqjtoB8+xlDOoF7dFcb7dkTMQkCIxO0EBhWd/YJLCOY6hRxHz3dCaWSiJLcwz
	 PFu43hP4IX1lzm0HcIS3MtajVBiFdoUA3AND8nKDCptXSc1gUMRmj1yLwMpAeolcUG
	 8FIjB2p8oDsjGBfTKMUVKy/kKNYs7x4fhh6LL/a2Rtaj52tnz0BOwGK82fguyTdM1Z
	 aUdYrMi7lbgFA3NoVn5xjp+1qT+ymPARmsuHNk8Nmy2SlAyLaasi8ii+xO27qBmh0r
	 CQqxAxTusgVXg==
Date: Mon, 7 Aug 2023 23:11:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
	jairaj-arava <jairaj.arava@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: sof-sdw-cs42142: fix for codec button
 mapping
Message-ID: <3d6850b0-d6e4-4ca6-9f06-98deabeac33e@sirena.org.uk>
References: <20230807215000.515846-1-pierre-louis.bossart@linux.intel.com>
 <20230807215000.515846-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OSg9i6YcoUXaUtN2"
Content-Disposition: inline
In-Reply-To: <20230807215000.515846-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: idleness, n.:
Message-ID-Hash: WZNXBZDQRPEMDQR3DNSQPEWFFTT2DKPI
X-Message-ID-Hash: WZNXBZDQRPEMDQR3DNSQPEWFFTT2DKPI
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OSg9i6YcoUXaUtN2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 04:49:59PM -0500, Pierre-Louis Bossart wrote:
> From: jairaj-arava <jairaj.arava@intel.com>
>=20
> The CS42142 soundwire codec button mapping is corrected to
> handle the button detection correctly.
>=20
> Fixes: 1340018d8683 ("ASoC: Intel: sof_sdw: Add helper function for cs42l=
42 codec")

Sorry, it's this one with the incorrect ID - you've referenced something
=66rom the SOF tree I guess.  I'll fix it up.

--OSg9i6YcoUXaUtN2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTRa/4ACgkQJNaLcl1U
h9Dr0Af+I/xOdRgSdgOlhAcZiqeIWD3UUjQR/Tu0Vleciq2UQwX0rDOr3wtWnwwn
hm9xr/6N4IjXI47MDNHhAhYD3PDVrgjapvWJ8JxT82iBwIjH3aZOQ42M62WIHOc3
OlkGiiXssrehb9Lbaq4ZOgipj6APQEdgefW1Wv36pD0vBSKMDxikDdCT5ss1oMBo
FaJLeVfa/9wF4Z/NZkqnDbETQ88vvEaF0MoZIolgzW4dWJqapVNeOeoJjMdPK1ew
YMp2SWVciDzjmVUiUdADM+UOn4FfXPEIdFTpLc0c7fE9B5KIFqH1Zd5Zg6OrGDOO
0rPKqZq4tpStTmrX2Mrpl4GduELImw==
=ZAW/
-----END PGP SIGNATURE-----

--OSg9i6YcoUXaUtN2--
