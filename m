Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C8C75C5C6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 13:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B766D3E7;
	Fri, 21 Jul 2023 13:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B766D3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689938357;
	bh=gRBC20aytk4E+AsRAk9j6F+lTwb9bh9QTjEPh9fGdQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MIn63ApQipXzOFwITL/Pw52xsD+e2JBUdlCic+UfyixX9xVMdP0YnhrjycYAL6XHX
	 7du61pLAEd76iCbAcHFZNhIla9GihJOlU8I7GWaaacogQKXNnrmC9dGxaA6IvINjMA
	 3o2QLQLFHaoRyN42MHu/YBFx58a4VxMOaWSIz8D0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36399F8053B; Fri, 21 Jul 2023 13:18:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF732F8032D;
	Fri, 21 Jul 2023 13:18:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B404F8047D; Fri, 21 Jul 2023 13:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17D4EF8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 13:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D4EF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UO4rQ8af
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7046C619FD;
	Fri, 21 Jul 2023 11:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC9FC433C7;
	Fri, 21 Jul 2023 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689938294;
	bh=gRBC20aytk4E+AsRAk9j6F+lTwb9bh9QTjEPh9fGdQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UO4rQ8afYUVEpProtHudVeGKOWgeKgnqS18pT0C+07gEmNbqIuzEY6ZGb/+QRNuOh
	 6HjHqVDAP2N+QQqBCUeQTetuFU166XcowHP/WwYsPply77qu0xCGDRBVntskyvwq+e
	 V0fOb1/kuawGsgeH2oxhaIfZa6YVVaTAivP+7E9DbPM1jkQDYoIylBABSyrDoZHnZ8
	 bHOYUNyN6sMp35q9GhZKHA4pJK51G/IpYTkgrdSM6GQ+2ImSkpHcB+Pj+FZ1MUwFbz
	 1nuo1a7V8WG0ysgSVJ7DqVyIgixfEOWPoB/g3bkQjdYAOow6ZJJhA2MgP8/Iz/fnMR
	 CJ5yHk5sCow3A==
Date: Fri, 21 Jul 2023 12:18:08 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 2/2] ASoC: rt1316: fix key tone missing
Message-ID: <3f407d2e-fe11-4ad1-8fb3-561053d343a9@sirena.org.uk>
References: <20230721081807.113125-1-shumingf@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aXITDXCFiAwgHOY5"
Content-Disposition: inline
In-Reply-To: <20230721081807.113125-1-shumingf@realtek.com>
X-Cookie: Do, or do not
Message-ID-Hash: BS5Z3RAC7LSPOPS4GKDHDLTCKAQRCFYV
X-Message-ID-Hash: BS5Z3RAC7LSPOPS4GKDHDLTCKAQRCFYV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BS5Z3RAC7LSPOPS4GKDHDLTCKAQRCFYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--aXITDXCFiAwgHOY5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 04:18:07PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This patch disables the soft ramp to output immediately.

>  	{ 0xc09d, 0x80 },
>  	{ 0xc0b0, 0x77 },
> -	{ 0xc010, 0xa5 },
> +	{ 0xc010, 0x25 },
>  	{ 0xc050, 0x83 },

This should probably be an actual control not something patched into the
registers - some users might prefer toe soft ramp.

--aXITDXCFiAwgHOY5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS6aW8ACgkQJNaLcl1U
h9AcYQf/b64J64j/TVoPr5gX2o9mxb6FLOxSX5S2mOBTXfRdeRcyoxjdT6c48fjn
im/uTQG7viTcZ7KQ4A6Q0reG2I8m+Yo68CwkJZNHVNW/JSuqEi1NQtJwu8RZ8CxD
E023FEHOOWC3Yk84Y6izmLUHzNEMUZI729Qs72yrydbiqFz/Hhhuy4wUc+mZKYiE
y9CRHObQMyPGWU1nQcUVgNqcdaf8S8Daw3sS4ccUMoLYHnfMeOSEk3Lu8jtI4OUg
XdZ1qj9ZiXgKkL1v2mC3f5N1lLu/o7mg2eokYv4IKKLk1IU1SSZ3rR9eKfTB989K
E8LVSsQ6d2iD1dxwgO+D8gjF2sBB1g==
=QABC
-----END PGP SIGNATURE-----

--aXITDXCFiAwgHOY5--
