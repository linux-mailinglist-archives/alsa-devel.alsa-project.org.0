Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47234CC52D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 19:26:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EED019FD;
	Thu,  3 Mar 2022 19:25:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EED019FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646331969;
	bh=3MZNzrhAk/+psbz8VzU1OByNwI7vUL1qSMbaehVjBIc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGw7GdTTNH4De7hre4KOMyKoj2O+v9DsuWXhaJeovxye7P68ycHn8zGGdlPZ1IGQz
	 KAPsBBsYUIIwRROkazYHVYbobsGX1zaR4qzQn29sLobHwJzqMq2aR4+7Keqm9Bj+I0
	 1BQTYE9cw6uqPmzM+9Elmo8mQPGwGQ4VyhQJTe8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD9E6F80167;
	Thu,  3 Mar 2022 19:25:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B74F80166; Thu,  3 Mar 2022 19:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE55EF8013D
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 19:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE55EF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="unqwnnoI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1BF6BB8267E;
 Thu,  3 Mar 2022 18:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB8CC004E1;
 Thu,  3 Mar 2022 18:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646331889;
 bh=3MZNzrhAk/+psbz8VzU1OByNwI7vUL1qSMbaehVjBIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unqwnnoIczOaQY52OttmcXQyJLAjp0Oai11cxoDhm9fxfyzNYxCbGG5xfBCE/6k7k
 tpAYbd0AHpmgDoYYINTeAnJELhdWCb7hHSS1UzI3y7ctVNpLJ1YMWXqjJceDSpT+7f
 RgHJ76zABcWbFYzI2+4dJe+lMPudHm+xq97Q/faBLY/SNBy0DXvPtmAU86zed9hLVC
 YCXNnsMnl1D8sBI1v7EKD1sPKrJIsRzwGFDwoAZ3X21P/Fuep0sg+u1fiF4RXVzg/i
 lf1qZ6niI+cDhDNa//BJaA2mXBvCtE5GGIX3hD4+MH3VwwOisTpw82Ti4tXkXF3Ui6
 +c2tm0AjiX9lg==
Date: Thu, 3 Mar 2022 18:24:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 20/20] Documentation: devicetree: CS35l41 External Boost
Message-ID: <YiEH7B3btDrwGW5M@sirena.org.uk>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
 <20220303173059.269657-21-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5+pn/WO7t9hPQNbs"
Content-Disposition: inline
In-Reply-To: <20220303173059.269657-21-tanureal@opensource.cirrus.com>
X-Cookie: Password:
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
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


--5+pn/WO7t9hPQNbs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 05:30:59PM +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
>=20
> Document external boost feature on CS35L41

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Generally DT bindings patches come before the changes that they
document.

--5+pn/WO7t9hPQNbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIhB+sACgkQJNaLcl1U
h9B2fQf+JyZdYpzru6DQzdgIuNNm9UZokagqpucw/b8YH2hd1KNhxnM24CP6DS+J
AJvhMrlvuHTNsQYS9rSKb+FI897TAuwTyFp9yrdy5xiJf0RaNaGcq41to0/I7Gvd
ZTFNXf23QKUbkfDN8bdzxksByfCrFX41IcrPxt9qSo4M2DLrmvty8vSYgYa8nsU+
QIytNm6Uyrd7e5IPufaM9XrRA1aztpjQwmaP9jSYUJvI3Pl/T894JtiA89V9ntxG
cBXI3GNifKfG4mOXw7fgs70+1lmfvKdFN9TqYf71s4DNhoWhqwmnDXEL7k4OEW23
UBIRaCDbl3gJevI5BmfhOa2tpOtQcQ==
=/fvV
-----END PGP SIGNATURE-----

--5+pn/WO7t9hPQNbs--
