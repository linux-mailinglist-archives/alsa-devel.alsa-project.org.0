Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC690B0DE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 16:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8363DDEC;
	Mon, 17 Jun 2024 16:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8363DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718633116;
	bh=ylXG9T1s/w0I5grxUZNmPMRkeKEwCLIrufq/Y8Gs9Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZdpUz95q6wPJHjG9+1ebm8uiuIXORsg2djPwQ1tXyaXHJMaeW3V9AA/IzaEMViOPr
	 iPgR+l4kwF8rhInGPHVeo91keiODEfwNVrNjapW/P9U84ABXt+d9pJCiMg+Ojkoe+E
	 koATUXlGPQaijAF6ymmZywsWCUblXyvbTm/WUcbs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41B99F805B5; Mon, 17 Jun 2024 16:04:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA178F805AE;
	Mon, 17 Jun 2024 16:04:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81C17F8023A; Mon, 17 Jun 2024 16:04:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEF5DF800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 16:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF5DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jnyChMSR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2208611E6;
	Mon, 17 Jun 2024 14:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D87C4AF48;
	Mon, 17 Jun 2024 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718633058;
	bh=ylXG9T1s/w0I5grxUZNmPMRkeKEwCLIrufq/Y8Gs9Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jnyChMSRTqGap+axtGx0PgnMUJhL7fWGOxxHrJ4eJKqbcBLlx54P5lhpajSLCck4P
	 aZdNwRs/gxYk1IDsmac/8hY25kHePZbOyU1NqopWpfnSozuFDkqvWf7S9PR7ib+LeM
	 KsmVlsaE6AgJ5uX8hVo9MIZsIXKHVZdCfGHlkxooXhz7I7Cu9sGaBW/XjL7Tlsv/YU
	 gQmUqNr1mmIELheHdZdntV+zfcm39HXm5UA+PkNW5NBhF56PvBCLqwwIi3jYCePOy9
	 Hq1Ns9KULEC44zeg6HagnjdiNfKNfdFL+wqaPqk23iyZso234UQzduTAyRk3Kjbdsk
	 vHjM8xjflSMGg==
Date: Mon, 17 Jun 2024 15:04:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
Message-ID: <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WSEc7iFNh20inuIX"
Content-Disposition: inline
In-Reply-To: <20240617135338.82006-1-simont@opensource.cirrus.com>
X-Cookie: Life is the urge to ecstasy.
Message-ID-Hash: SVCXS72VT5LTIM2XNVGLBBARSXS26BY7
X-Message-ID-Hash: SVCXS72VT5LTIM2XNVGLBBARSXS26BY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVCXS72VT5LTIM2XNVGLBBARSXS26BY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--WSEc7iFNh20inuIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 02:53:38PM +0100, Simon Trimmer wrote:
> IRQ lookup functions such as those in ACPI can return error values when
> an IRQ is not defined. The i2c core driver converts the error codes to a
> value of 0 and the SPI bus driver passes them unaltered to client device
> drivers.
>=20
> The cs35l56 driver should only accept positive non-zero values as IRQ
> numbers.

Have all architectures removed 0 as a valid IRQ?

--WSEc7iFNh20inuIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwQl0ACgkQJNaLcl1U
h9D9tQf/bEbw7y+SIWUsoPAb3wxezENJBQyjbCgq/zNceaWTonGZdtAALJsb6VAK
TkCrdKHl9fQIH+/wHHEPmB6t48a1K0W/GrdXL7kFPFEhMFXjyKsLCuhk2th2Rn0z
HNqYYofKazzQd/XbVXZKJ4/PFUHZatGoWxd3ChcDxJB1X5bvwmAIk3xjsX5mbKJA
cb+sneKM3cnbgeuTgWHMJrQ6PIdFwH03IGU5k76TnMJ+2Gd2vP9OGzBXpjUvx34i
gk6BtjC5T8hq8DFa8arA0OMKIqDhaluGAGKQvZIjWTYN2bR4qX7PYXxeWJCYfZ6Q
3EvIfRl7rpOx0FVkhQhxeCcEI59v1Q==
=9X7s
-----END PGP SIGNATURE-----

--WSEc7iFNh20inuIX--
