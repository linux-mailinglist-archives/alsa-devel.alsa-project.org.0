Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE953059C3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 12:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880E416DD;
	Wed, 27 Jan 2021 12:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880E416DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611747107;
	bh=MeXh87PhrXGbxuFNLGsx1zwPAc25m19iwuT8SQtjfxM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWmX6V83LEleJqb1JstJ20+I4gFiMckGDBxc9noAO2Cwaqj5ALAiG14CavjXKXXhW
	 wKfltbB9IhLnFE/9zGoCfJvmnI7Bfzbz0Yo7eX8cf1RVhJ4X23+uU+cxzspl0qDuPv
	 cXdByET4Qfav9sM9XdPbW31xhGY9mmJoA5igdcP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA49F8025F;
	Wed, 27 Jan 2021 12:30:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE4C7F80259; Wed, 27 Jan 2021 12:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBFCAF800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 12:29:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBFCAF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mN3AANCp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2EE32076E;
 Wed, 27 Jan 2021 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611746980;
 bh=MeXh87PhrXGbxuFNLGsx1zwPAc25m19iwuT8SQtjfxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mN3AANCpN24xFffemzewOHV6grTdbxxS9mB86vkxuBnaH3UP65G7fhJ4XbU6mlVuE
 bOiBn8AfBKsWcqHfnUgWPLEAy33uVN10uS5fxR406SbIoPD4l268dDhS1W4Vxl9ezo
 x4y55qp7EzLbFu321LifyESl+IQmsbmjvi2F3gTdPIiLWNZhEtRkdbub/V9Zo/3vO5
 amAQlDSJT2ZV8QlvHhU2KUn5QsFEpcfSYWtWqntRrXXnT2HdrN2pIHjQUXjdBvLpx5
 1JHhFLbfXqlhonfYw2i2gWc5UclrLPTcG5HvjMB8+FAlq2V/GQAECRgaSoZioVa5hO
 BTi4jsm5haKKw==
Date: Wed, 27 Jan 2021 11:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] ACPI: Test for ACPI_SUCCESS rather than !ACPI_FAILURE
Message-ID: <20210127112857.GA4387@sirena.org.uk>
References: <20210126202317.2914080-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20210126202317.2914080-1-helgaas@kernel.org>
X-Cookie: La-dee-dee, la-dee-dah.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 Jean Delvare <jdelvare@suse.com>, acpi4asus-user@lists.sourceforge.net,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Corentin Chary <corentin.chary@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-spi@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>
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


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 02:23:17PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> The double negative makes it hard to read "if (!ACPI_FAILURE(status))".
> Replace it with "if (ACPI_SUCCESS(status))".

Acked-by: Mark Brown <broonie@kernel.org>

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmARTngACgkQJNaLcl1U
h9C2dwf9GE0PHhDzOzGae10MRkXBNzBdmeTf035YAM12jQ6o9G9kDK3xBSA64Jcy
rr3+mkHvYkCEBEdAzV25MDRg2iXAoLBYJdmfMHXt/u9D0aJf80gMEXgrUDE6yjQo
AJvXTJrJqu+KS2RMpnxIHfO1rXRZrQMIAln9GbePtqKjGUN5cx6QJKUDYyrMlevp
9KZr/ClGQmLOYJ7suU9mr1NFgEgf6XnsU7Gq6BGuyo10GO62Qg3bztHtkiiRxz/x
zvr9PngfutrIGT7qfvKBSmWk2y50qe5XDeJRD8e6YbFS/Ge5LnOwmNc24jjts04w
OE5TwTVKRHFfy39WTQ3IdmJaznDhqg==
=b7Y/
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
