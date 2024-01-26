Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0F83DAB2
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jan 2024 14:24:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99C8C210;
	Fri, 26 Jan 2024 14:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99C8C210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706275467;
	bh=dx7w9EMnjGILrQiljfrxWnwmHQBWw3WGRnZAMGzH/ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=couil6+YcLaaatZMvuQeTRi/ZMh9S0jsR3n5dgT72mBigoRIdSa/Fn8biv42DSD1H
	 UzJC3BZhfYS7zzCpDeSkx7fjlkFdnyFRdJhI1YOeRP6WeJRZrKfGGWVlzQaIdviGyT
	 eRmoXgbfveP1i2ynBraAH0Rh5zjTMzTNeaY8b/as=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC7BCF805C7; Fri, 26 Jan 2024 14:23:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5665CF805B4;
	Fri, 26 Jan 2024 14:23:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA000F80588; Fri, 26 Jan 2024 14:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9949F80053
	for <alsa-devel@alsa-project.org>; Fri, 26 Jan 2024 14:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9949F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lBJJIF5D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8036B624E0;
	Fri, 26 Jan 2024 13:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB20CC433C7;
	Fri, 26 Jan 2024 13:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706275409;
	bh=dx7w9EMnjGILrQiljfrxWnwmHQBWw3WGRnZAMGzH/ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBJJIF5D9YA6l5Yv83zct+7ggkzaVNV5DempgoFjho0PR/B1uwcXAHS09111+MOCz
	 I2evgMpy7w119Ki38D44o/L4w8nfVk86xLtZeiXTAPhCUPmXdqMRKw/mrvvRBpLa7Q
	 Uj/aebrYd+H0Mz+3Wmo7ScjKblTulSppI2JOBF19/WhnziPmQ8u/+Nhl8Y8DbJCFF4
	 3IUUbDxpL4yy0uTH+U0y2WGYjam4r2QWrsh+YTJHkDl/WFWkH3LcNvbu3CKinvQ7bE
	 PQd6VrOJbbwRI3xfbK8uNBkyRgMc0oDVKLfBa6Wg5Kb16DSExzwZbiedtVWjglQwXw
	 bo34KHsy8DZ2w==
Date: Fri, 26 Jan 2024 13:23:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH] ASoC: codecs: ES8326: Adding new kcontrols about
 Headphone resistance
Message-ID: <55a743f0-43ef-4a4b-86a3-500a51c6246c@sirena.org.uk>
References: <20240126074512.62013-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylJaipNLXnMMBccU"
Content-Disposition: inline
In-Reply-To: <20240126074512.62013-1-zhangyi@everest-semi.com>
X-Cookie: Excellent day to have a rotten day.
Message-ID-Hash: QD4CUSYVUV7NIK3FDNQ26CTZSJFEY4JX
X-Message-ID-Hash: QD4CUSYVUV7NIK3FDNQ26CTZSJFEY4JX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QD4CUSYVUV7NIK3FDNQ26CTZSJFEY4JX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ylJaipNLXnMMBccU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 26, 2024 at 03:45:12PM +0800, Zhang Yi wrote:

> We get headphone detect issue.And we fix it with the new kcontrols

> +static const char *const hp_det_resistance[] = {
> +	"10K",
> +	"5K",
> +};
> +
> +static const char *const micbias_resistance[] = {
> +	"5.5K",
> +	"4.5K",
> +	"3.6K",
> +	"2.8K",
> +	"2.1K",
> +	"1.5K",
> +	"1.0K",
> +	"0.6K",
> +};
> +
> +static const char *const button_resistance[] = {
> +	"100 percent",
> +	"90 percent",
> +	"80 percent",
> +	"70 percent",
> +};

These all look like they should be fixed properties of the system that
come from the hardware design rather than runtime variables in which
case I'd expect them to come from firmware rather than be changed at
runtime.  Unfortunately for x86 systems that'll tend to mean a lot of
per system quirks :(

--ylJaipNLXnMMBccU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWzskwACgkQJNaLcl1U
h9B9hQf/QjSqOCGNF4++OzERkih6pU4b60KdG/WnDABUYJffGBQDvNH1OrIyhKdQ
tDrdAtY3VUUHGiDPZ/QzRYTdMF8XUBfkVJtlZiDnSpq0VkUPSGSXlXQM5oe/3GJg
fo4s9s/rHENWSw4JXM3EN6bml7vtnlEuDUz6njq4HHPHisuxnCHAqhQjPM06PPjl
fBdmVLrX2+JDt7c9m9IkS9KN4sBXORmBWvjJGuwRaM/c1JwTVyX/5ovmVkj8gwSD
yfZqTwTHsIXe51ItOdVrOGxlUsgsxB24RdXlB2LORN77GcWrA6DuIc3tbxD6hrCB
uLNiOZlxwmUGVx6bg51lu+01WDC89w==
=7rwk
-----END PGP SIGNATURE-----

--ylJaipNLXnMMBccU--
