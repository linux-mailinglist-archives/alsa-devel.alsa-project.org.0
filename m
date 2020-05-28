Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3601E5EAA
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 13:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F6B17AE;
	Thu, 28 May 2020 13:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F6B17AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590666503;
	bh=8BTCUMLGE2jM0HCnOdk+q+R6SLabFZgOKEweVzYFFDA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYcE0rR8aqDAUz6mK5U7nj1o4DIizC5KG2wGvaEoKLRT81CNEYCCu28cbUwGPDeYb
	 45+62mMMUSPx9cExP8Qi5/ojzsl3HmmRqYupi04kCSjssBkP7QItyXKufz3fHUHhE3
	 MktOIXyjC6JcI3G0grpcv+UCwStSUOCVMi/uL+Io=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12A7FF80107;
	Thu, 28 May 2020 13:46:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37515F80150; Thu, 28 May 2020 13:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF7D9F80107
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 13:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF7D9F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Xm22UQSY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3A5420888;
 Thu, 28 May 2020 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590666388;
 bh=8BTCUMLGE2jM0HCnOdk+q+R6SLabFZgOKEweVzYFFDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xm22UQSYowIkAffquBoTn13+eY3dfB5FWFDNOgYA7iGYxw1UeHMhlJ9z2Rh4Fupk3
 o7g7CWtqsDCUVcSZI+LLEgAx8zkpQQ7eSmqpWCozUeJFeh+k9cEwZrr/dHaLFLpI8S
 D3m7AQTBKu8JtMVrwsfW7wiUu/c2e9BoMnzufFvE=
Date: Thu, 28 May 2020 12:46:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Subject: Re: [PATCH] add I2C device and compatible ID
Message-ID: <20200528114625.GA20331@sirena.org.uk>
References: <20200528070510.29959-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20200528070510.29959-1-wtli@nuvoton.com>
X-Cookie: Available while quantities last.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: YHCHuang@nuvoton.com, alsa-devel@alsa-project.org, KCHSU0@nuvoton.comgit,
 CTLIN0@nuvoton.com, lgirdwood@gmail.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 03:05:10PM +0800, Seven Lee wrote:
> The nau8810 driver can also compatible with nau8812 and nau8814.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7PpJAACgkQJNaLcl1U
h9Bj7gf/dTfOv/mlPlq1CzJ1uBYztzbx6khsmJ0D4z0VsViOZb0SwwaDoy7uJWQl
fLDAe4Vgm+pwG1Yi3tmMEUbRKi+0CjRMZJdwsbLoHLxOo9bm9p4aO+LtDADFCXPV
8tyS0qZW/MOb8b4mAWVKr3sHykoFpHypLCyWnY4d40jxcoiOdjrAsfJgvxaHB+9i
87go9Yb6qxmXcdwPf4vN6gWZQxDj9CQNE6YXPN27LEPhEjobq8OWuiaGNtxOVFbK
IByfL+K96g254uJBQrKICj53stoQFoOt5lhvHiiUI/1TU4CyF0G2jx9Ny4JZEvxX
mG3Cbi3Ltik9Z7QiFm3zW2Kr0mwt7Q==
=Ug8C
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
