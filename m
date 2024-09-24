Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78A9841DD
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 11:17:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1404DF8;
	Tue, 24 Sep 2024 11:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1404DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727169471;
	bh=B5zSRQNFNomZZShsW2jsE1RB5SBo1V3wEcvrvwTUZYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J0nhLN9ECh3ihcQviCJd7VuJ+liCyjkcdT9lMrz4Zi4mcxNHrF6AcF9l8Hl6q0hLm
	 /+Gnqa43CGtiHz/G370CelC/jYekHKmiL7JGMlMy6VV+gL2Ph7Cb+SwN+J7Mi3oobI
	 kubkK2qXNQjAqROZcL2J7XgoHgMshyCuTUf50a5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 922C0F805C5; Tue, 24 Sep 2024 11:17:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE6FAF805D4;
	Tue, 24 Sep 2024 11:17:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A46EF805A0; Tue, 24 Sep 2024 11:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 891AAF805A1
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 11:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891AAF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iV8d04Di
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 776ED5C5B7E;
	Tue, 24 Sep 2024 09:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D78C4CEC4;
	Tue, 24 Sep 2024 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169435;
	bh=B5zSRQNFNomZZShsW2jsE1RB5SBo1V3wEcvrvwTUZYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iV8d04DipCfbGJqS89wNvqisKOXUAYPIx02qQtrAMs7uQKplA8uBJ2eRsw1jEu0iC
	 0+YOKcUzI6qy6oj0KMh1vfyQlCG3Mh/CuMuYrSWjksMhr8VcZn0dvVU3HjCzYRFMNI
	 90TtbhGhr9o8+inGGGINaS2deZmC8zia2cMuiTCZ/gAag3o0mnTeL15iXqUDS1G96M
	 oqfx6e+7YGoZLZxyxsPrx3LRbx5lL6g9qSouwjzYjsWWrdDTqC2asXVjr//yAE9BNh
	 J583te1M4zF/WKRMcKfsqCUBKHGfZ4j1SXTsBiK8zEKyDSj3xLe7MdxhGgpSSbOHaa
	 E6LAlGvDIzv/A==
Date: Tue, 24 Sep 2024 11:17:09 +0200
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: amd: ps: pass acp pci revision id as soundwire
 resource data
Message-ID: <ZvKDlYwZRikFwbB6@finisterre.sirena.org.uk>
References: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
 <20240924081846.1834612-5-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HGCXSJI3QLy/wo0L"
Content-Disposition: inline
In-Reply-To: <20240924081846.1834612-5-Vijendar.Mukunda@amd.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: YVHAOROFCK6TC7FIGLXQIJNPQYBCUWJG
X-Message-ID-Hash: YVHAOROFCK6TC7FIGLXQIJNPQYBCUWJG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVHAOROFCK6TC7FIGLXQIJNPQYBCUWJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HGCXSJI3QLy/wo0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 01:48:46PM +0530, Vijendar Mukunda wrote:
> Add acp_rev as structure member in acp pci driver private data structure
> to store acp pci revision id and assign this variable to SoundWire resource
> data acp_rev variable.

Acked-by: Mark Brown <broonie@kernel.org>

--HGCXSJI3QLy/wo0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyg5QACgkQJNaLcl1U
h9CZkgf7BQHJTT8YqbIGugXWAF7sjxgyA+AsPM+rJqOLjVx+34K3IWQV4VwWhltW
mmGSGmSieEjlvNMdEP6qvfF/s+gLhUHL+6ay9GxetFlF6YImtyb5g112qhJmhQkg
0Wei209F1bxar6FLzcGBRMC0qtsNyWwo88CdX4oh47aIiywtY77RCknwO7/VxGKm
5fNXXLvfpKIcDHt7xmU6PGisgoOO8rY3dze+GznqUyLCWaNtcVUhbFJJ+CZQ1ui6
NNt/QQ4ciEdxYo1lpVz6Z3G8OGp29+N12uoPDsmUFkOASOxYMRcDwBDeb6DQ63wM
FzUsOdZ+FzTjoGIduV7zM09Ckx/zyg==
=iFEZ
-----END PGP SIGNATURE-----

--HGCXSJI3QLy/wo0L--
