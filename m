Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2286E867
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 19:29:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014F3A4A;
	Fri,  1 Mar 2024 19:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014F3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709317793;
	bh=n3tZuP5NLQzsTe7i5sxGgzG9+AQvP+lFzjYwtGfGGBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nnG4SJXx9uJpzT26jXNYKDvP3CggmqWsd7QUqZ8wHJJ4YYwouNp83NNdGyNyZXaj+
	 pFKKuceUGFhIVtqtWjGeneKdONnC8gg6HqVA1ykaQsdjcPaqL7wYl5fSVf/7xAL9yx
	 KXB7u3LLL8ZyNyWdQu9dFMXufNolYNjraAcZ1k84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E0C9F8024E; Fri,  1 Mar 2024 19:29:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80BBEF80570;
	Fri,  1 Mar 2024 19:29:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDEA4F801C0; Fri,  1 Mar 2024 19:29:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8978F80088
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 19:29:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8978F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lHxQl4vt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE481CE139C;
	Fri,  1 Mar 2024 18:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37739C433C7;
	Fri,  1 Mar 2024 18:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709317740;
	bh=n3tZuP5NLQzsTe7i5sxGgzG9+AQvP+lFzjYwtGfGGBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHxQl4vtF8ecR8vVLIEPCflpN7neIeMaRVG8HUHk3+j7dgPKzIu74iswGJeS3OIgD
	 G6HjgNzu8bS/PeJdIZOcKhQQzwVFG6gXEYM4uG3OSRv7+yv58muX/8T6OvHcCzxsHX
	 +RRgcaPV3xm9gTGORVZ2rR1b5XWnkgRY6P21BBVzaj1lTTn+j+cGEuyMeFzISsPKw2
	 a2nRGa8i2sNB+Ay7ap6ci11enhKy96foHf5G+ebeoN6R89MHxwQlEyvF4OaQ5peCHC
	 ZF5ZUGPJVbC0uLLmNYpdsSpFDcNVySCd3DqeYpLMyypSReoDs7oBHTJzr+DscTvd2L
	 5ghxNNXhonz9A==
Date: Fri, 1 Mar 2024 18:28:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com
Subject: Re: [PATCH V3 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Message-ID: <188f7d68-0f13-42b4-99a5-897584fa46f2@sirena.org.uk>
References: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uszNmvFvI93s6IMy"
Content-Disposition: inline
In-Reply-To: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
X-Cookie: Schizophrenia beats being alone.
Message-ID-Hash: 7PZ2RZKREH3FKHCM527VCLTS55JXBIJP
X-Message-ID-Hash: 7PZ2RZKREH3FKHCM527VCLTS55JXBIJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PZ2RZKREH3FKHCM527VCLTS55JXBIJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--uszNmvFvI93s6IMy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 02:54:22PM +0530, Vijendar Mukunda wrote:
> This patch series is to redesign existing platform device creation logic
> for SoundWire managers and Implement generic functions for SoundWire
> manager probe, start and exit sequence which are common for both Legacy
> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for
> AMD SOF stack (ACP 6.3 based platform).

Any news on what's going on with the Soundwire part of this?

--uszNmvFvI93s6IMy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXiHmYACgkQJNaLcl1U
h9A9xgf/ZnKVuBfU3IdiCCDF0efaXRk9noEn9iF6Z+P+lSh6IRf0rYi+FQpdeKEo
T+h3hK5g+KbWeF1HeNpZnG1Y8vMRRA0UBjsEul4eRJ7clH0y4zsAsdwsrAnJ//zO
kaFNTJBQRueUR2npRdE9UJ2k+WwWGbVzCNOwxXOwFtHJwfYF4QYaQFEdZG8o5QTU
DSZXCU+B44B9nKmhcHYcpz+DDvd/GqPtp2Q5FPfOpLIaCQjuF69uYzxsDueyAfZq
sQKLYjizF5UwTJmFpDR40tHbXTmCoou1TY1pMUlNB4m3f8Rl4FPhfElR7e0qkums
mYYX3tqegrNPku7aS/OqcGINBM0Rng==
=WmML
-----END PGP SIGNATURE-----

--uszNmvFvI93s6IMy--
