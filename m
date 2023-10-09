Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FA7BDAAE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 14:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A0DDEC;
	Mon,  9 Oct 2023 14:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A0DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696853213;
	bh=lm6HOp0bcp8j4kmmGSSU2qqzsmIalB+XEyaDQUMgqHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sc5pqLSAYG6M7E395sE4XV4mruhXH+e+DZDElsSd18pRl8YCEYTURgJHkdihjF176
	 6e8zfKtwWZ/wcHw05sPbGKJQsR//hAXsdIMp5well03g0LZ06o8QQNXcpRR6eoivhM
	 BD0q3MKzWK+R7kVxyZscVsVemgnGYj15cBLzJ8/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30317F80536; Mon,  9 Oct 2023 14:06:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB6EDF8027B;
	Mon,  9 Oct 2023 14:06:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A77F7F802BE; Mon,  9 Oct 2023 14:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68917F80130
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 14:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68917F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EQdUHr9a
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4A3861115;
	Mon,  9 Oct 2023 12:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B12C433C8;
	Mon,  9 Oct 2023 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853151;
	bh=lm6HOp0bcp8j4kmmGSSU2qqzsmIalB+XEyaDQUMgqHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQdUHr9akUjnWLxtC4wI5TsVA4I1dZfATVsF8WdYpzdH+n0BaF7wrbfk3eLTE1DQh
	 FgWnd1pZPZtpHLPFT0xAHD+0HmwFb4MSmTlX4MR6WMH5A6sZ7Ta8x0HwX8vEzC06U1
	 eB2k6YXaJnukR9yQF/dDqYxpeO3kjXVkpOQE1E5OdRwnugaQxGL/qVKjiEbFJ+P6nn
	 1pmzHnUEe5XCIokUjUZ/impnxMpj16l+SoZlvvfvZoGWkKJA/xOpobCxR/EXcC0OMt
	 TUmzMkOAD+E8H78sFNlVJMIz/iofu5rlVK2T8XJWPMWr94AsjQjrjSvn+Qow5blj1d
	 ul0PcSH8jQp+A==
Date: Mon, 9 Oct 2023 13:05:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Fix cx81801_receive() argument types
Message-ID: <eb1a215f-6061-4a92-aa17-4f163610c6aa@sirena.org.uk>
References: <20231007213820.376360-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t/8IS+UkRldiLwR4"
Content-Disposition: inline
In-Reply-To: <20231007213820.376360-1-jmkrzyszt@gmail.com>
X-Cookie: What is the sound of one hand clapping?
Message-ID-Hash: HPVXLNKMRVFIWR2QYELPCQ7OJMIVIQZV
X-Message-ID-Hash: HPVXLNKMRVFIWR2QYELPCQ7OJMIVIQZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPVXLNKMRVFIWR2QYELPCQ7OJMIVIQZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--t/8IS+UkRldiLwR4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 07, 2023 at 11:38:18PM +0200, Janusz Krzysztofik wrote:
> Since types of arguments accepted by tty_ldis_ops::receive_buf() have
> changed, the driver no longer builds.

Acked-by: Mark Brown <broonie@kernel.org>

--t/8IS+UkRldiLwR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUj7JkACgkQJNaLcl1U
h9BSGwf+P0HdiRyyeltm0lbcQLuLddOVzbKwsiVaVR8sTCX/3GbtGLDEJZLRMNpe
sKOqdGTYsaeKdOkgzR2XVXc7wVviqBic+yjmdZP0E8lXuPAJkCzhOtqPWVxTfGKa
cuHfa4GGXWSfFXsNq1MG/UnpOGQ0bSPTQ1KzuFMqnxp7uWsZJA1Bq80HLzMMzTKh
jYKn063428GnTW/XJUswhv0b4/PLHndd0a34zROzGepdtTcD7s4ZWJpeGhhlvVip
0dR02qBRWd3AVd1rMQmASdEMh8UV7vO1SP2AWdMwpvCgZQy+XSUxaqyd08QYeCgt
ovYXzNtvIrRcgGkGYIJaWTCVZpMd4A==
=W6ad
-----END PGP SIGNATURE-----

--t/8IS+UkRldiLwR4--
