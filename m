Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C5869119
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:57:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6D9828;
	Tue, 27 Feb 2024 13:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6D9828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709038668;
	bh=apcxIyzn0k7+m12GtqffHekIeQvQq1MA8T3i+VB34z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fpv/8QizItSLqoopsA+PsVL0D0wtYCzt8Xe0E4XFydkRp/VNfYxuXH6Isx/EPDJzQ
	 bQByZaN1MOqjCQYsy1AT5ytQM/momGWo7EKXrtF7L26NUutJ6SFjuMeW7rzntVBBCh
	 4qDtRvyBCc3uMll4vAd8b3Hu7qEviAFfngG7lvl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8327FF80578; Tue, 27 Feb 2024 13:57:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA0CF80588;
	Tue, 27 Feb 2024 13:57:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FC8FF801C0; Tue, 27 Feb 2024 13:57:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6DADF800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:57:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6DADF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tUo8ltF1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 92BCBCE1C9C;
	Tue, 27 Feb 2024 12:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF135C433F1;
	Tue, 27 Feb 2024 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709038616;
	bh=apcxIyzn0k7+m12GtqffHekIeQvQq1MA8T3i+VB34z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUo8ltF1j64VnsC26KES1wChaS26QqTrp61YOIGHMHhZxScak6IKV2RWQtzoE9thm
	 kLXSfT0/G8rTwU1OGzTfZhdeJ2kxVLGwY7UTk8pVm40tqNJNRAyLTyngpiI0LuGwq+
	 j03DRUz1EX7GleuhrOf/TcJfotZV3wxhg5aJsI+MPf1FH+r7bkObaWPqM9GDccXHaj
	 h+UoVYaTSp2WsYWtz/srtLi74k+AEmimwGvMoClPv5LjCq+ub6867ZfXXNsYHrnjLU
	 bosIgaCA/FmPW04D7tnxCX2iEe/OImYWqYH7uS+ReWNffJzwOSJ6f5oW81VVmVcj5J
	 J5SPOWmsZH8qA==
Date: Tue, 27 Feb 2024 12:56:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier =?iso-8859-1?Q?Garc=EDa?= <javier.garcia.ta@udima.es>
Cc: daniel.baluta@nxp.com, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Convert the Imagination Technologies SPDIF Input
 Controllerto DT schema.
Message-ID: <4b4b4eb8-a160-455f-a787-156d3c933306@sirena.org.uk>
References: <20240227123602.258190-1-javier.garcia.ta@udima.es>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h+L9bvOLfgbqbaMj"
Content-Disposition: inline
In-Reply-To: <20240227123602.258190-1-javier.garcia.ta@udima.es>
X-Cookie: Please go away.
Message-ID-Hash: ZNPTVU2B7D4JI56YST64DFOWKYNDOKGK
X-Message-ID-Hash: ZNPTVU2B7D4JI56YST64DFOWKYNDOKGK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNPTVU2B7D4JI56YST64DFOWKYNDOKGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--h+L9bvOLfgbqbaMj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 01:35:55PM +0100, Javier Garc=EDa wrote:
> Convert the Imagination Technologies SPDIF Input Controllerto DT schema.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

> +title: Imagination Technologies SPDIF Input Controller

> +maintainers:
> +  - Rob Herring <robh+dt@kernel.org>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

I'm not sure they'd agree with that...

--h+L9bvOLfgbqbaMj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXd3BMACgkQJNaLcl1U
h9BFeAf9F2UrHSUmj5HdrZl50lIgzVj+ydziDWHATv5g06rwiGkOPZBpBwwwPZLn
AamwLnKbU2jaHXzVfkcpjdsjUHmPVOyZyAY5VKClzx8x/cjQJa+kMyb4HOjfudpy
adLQrz6l+Vv2N+y49R05UImy+r6NNiYvO6zTyUu/Nxi6efggwqZJ1iWSpC7fU5wd
HWZ/K0wgvc26vGsy5biTtR2L8MQY+qEEh1Rx3rnG+jUuLWt6K51BobL88b1GyV+b
gX7BF5vj9Ekj47UtSK4rtqV1BvZeERgmGKjiEgnR3PNXe0yGqMOheKNvvGyI9SuK
qh7Nc6dNcdzCJmtEM1K5tH8BonlyoQ==
=lxob
-----END PGP SIGNATURE-----

--h+L9bvOLfgbqbaMj--
