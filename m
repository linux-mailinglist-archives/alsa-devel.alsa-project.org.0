Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3A828749
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 14:45:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D7FE64;
	Tue,  9 Jan 2024 14:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D7FE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704807910;
	bh=oZbsvbcYKrnKOzs1a9qFYc7djkM/eqiNuOcJq5oQz8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZcOorPsOq/ZlPHYRBeV+ExxUHyy/9GhfHNpsRaqS4WohRLDQlTxVW15Np4cWAd+Wc
	 G2dvHNB6tKX+ohkGabc2EwBKMqZ9AkR58OEnKi9N9V8p0UTKkWqH0PZWDNlxebimiF
	 SXaTCA7oj9q1wtc+wEbbrb7Cq/MULqZANW8vgFKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D021BF80570; Tue,  9 Jan 2024 14:44:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 580DCF80567;
	Tue,  9 Jan 2024 14:44:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B050F80254; Tue,  9 Jan 2024 14:44:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE066F80086
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 14:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE066F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZgNQz+K8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80F4DCE18AD;
	Tue,  9 Jan 2024 13:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA78EC433C7;
	Tue,  9 Jan 2024 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704807858;
	bh=oZbsvbcYKrnKOzs1a9qFYc7djkM/eqiNuOcJq5oQz8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZgNQz+K8r0a+acfTFx5rH821QxT3q3A8frOJuo/AiOiz+GJmM9egcQUWKmDRX0gCT
	 T3Bx2g1u2PxZ5TL2uBly1nMJ7iUqSGPSG3aNfY12yA9PlE8G6fWPKYG1Q2vlMMMCOB
	 bRyT3aoQcymEpTc9jp8NnJo0dgz2f6Yp1+qJnc6ONziJ07ZAhLjh0VVZ87I+G7VZOY
	 437tPxwYAFYSA7VESGZTO6S7l15xBRAR3vWQM6ZVcoNVP/4+xQztKfvCAOS65RWSaS
	 lMEDJmA4nf+y9QF8F1n5fDkl8cJwfEL6cq5vmYs92p1l+myYY768eykp4A7G3YHbXr
	 HTfR1FoEic5Gg==
Date: Tue, 9 Jan 2024 13:44:13 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	pierre-louis.bossart@linux.intel.com, vinod.koul@intel.com,
	venkataprasad.potturu@amd.com,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/12] soundwire/SOF: add SoundWire Interface support for
 AMD SOF stack
Message-ID: <0dc78a1e-6d0a-4cef-8c7d-360e9cf1578d@sirena.org.uk>
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
 <084fcb95-7418-4898-bcb2-8eec993cc39e@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p5xBkw3i6raQTkdN"
Content-Disposition: inline
In-Reply-To: <084fcb95-7418-4898-bcb2-8eec993cc39e@amd.com>
X-Cookie: Your present plans will be successful.
Message-ID-Hash: 3QS2ERV5C5Z6DP2QDOXSWAR3B25RGNSC
X-Message-ID-Hash: 3QS2ERV5C5Z6DP2QDOXSWAR3B25RGNSC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QS2ERV5C5Z6DP2QDOXSWAR3B25RGNSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--p5xBkw3i6raQTkdN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 06:11:18PM +0530, Mukunda,Vijendar wrote:

> SOF patch " ASoC: SOF: amd: add code for invoking soundwire manager
> helper functions" has dependency on SoundWire patch set.

> As this patch series has to go in two different sub systems,
> Please suggest how can we push the patch series to get it reviewed and me=
rged
> at one go.=A0

I'd expect Vinod to review the Soundwire bits and either ack them or
provide a pull request with them that I can fetch into the ASoC tree.

--p5xBkw3i6raQTkdN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWdTawACgkQJNaLcl1U
h9BK9gf47VHqu8IX2H36i48z81PPYl5zDtOBlzVBCXxC6lt9uonzH04gY3ra4VDu
Nsbdm9N/Ek8b7OognezVX8m7UjQfFPuVNgGzPg/vJoFlcyfKIEkxRgvAiROFkpov
03IJSUE7ZBkJQfpBuy9n9BvpDLsy2nXBl2vlESXzQ32X13J6RLw9vaiOV3/OO84s
XVCfteWCo88XxqL3n9FYQOk/Lh84GAdaZj5gRPe+XxR/Hnwv1o0D/sabxxXfY+DS
IzxI3pzMvbyiw6P5co4UU6MAAteAM+ra99u4Zl8eB1Q/fBR1VpVEQ4z/NNQIjCcc
VoXCd7KLb0Y+kg39NI1UAl8slkRx
=W+Q7
-----END PGP SIGNATURE-----

--p5xBkw3i6raQTkdN--
