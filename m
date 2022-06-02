Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C5B53B541
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 10:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95AB5173E;
	Thu,  2 Jun 2022 10:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95AB5173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654159252;
	bh=U1aWVLGU5Nbklsewh81srxz3J8Pp8xG+AVTOKsKeYuk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkYFmGD1ldy7q+e8H0NsjDkiQFKKooa0rgY1rQprDXapAPyoUPG9KlDqFY31HmfED
	 CiFw+2PNxgk8J9PjUjmeSA0gihZvs58dNyMxME6d613qXAc9sgirb+ivny7ZlwGOb/
	 Xqv7FsZ4VqrWxs3N7KFRwXeLJH/7dI6kwrPkRrbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 056E6F80149;
	Thu,  2 Jun 2022 10:39:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA5FF80236; Thu,  2 Jun 2022 10:39:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C159F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 10:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C159F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C6d4R9hx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0A5160E71;
 Thu,  2 Jun 2022 08:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FD1C385A5;
 Thu,  2 Jun 2022 08:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654159184;
 bh=U1aWVLGU5Nbklsewh81srxz3J8Pp8xG+AVTOKsKeYuk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6d4R9hxryibnqn9zpBsSjFzFApKcoIytLnmSbwK5wl2u3ksO4aRUIPFKRH8wNFJ8
 Ala7rgLn8yBoZpHRQCc1Rx/R4fkxjkI3x7X6flgiiYxDwv4E1pfAXawbBs+V0tl3w8
 CffCzOwxavKSpyD9FCALn8okLWZEBYhhkYg1sGsZLl3Pm9mWQQJQwUOeCISJwcdNJW
 UY6bLHQD0iVG6qbA8WgX0i6NH8g3ePJAu5UwZ38EJ78CjxifXLt2IdEtiGuGG+IwYO
 mXQuX3Q366QuAmwRZw9YzFHuhq4uOeUWA/U/zT/55nlKxE/eCnwHuWu877gEaSuoSw
 y1QFeS0JiJJeQ==
Date: Thu, 2 Jun 2022 10:39:41 +0200
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Subject: Re: [PATCH 2/2] ASoC: nau8822: Disable internal PLL if freq_out is
 zero
Message-ID: <Yph3TT+EHN+CyrD3@sirena.org.uk>
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-3-hui.wang@canonical.com>
 <db674fa6-37cc-9dc6-ed87-f9fee681db9a@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q9wJ6YnUFQapy5xo"
Content-Disposition: inline
In-Reply-To: <db674fa6-37cc-9dc6-ed87-f9fee681db9a@canonical.com>
X-Cookie: May your camel be as swift as the wind.
Cc: wtli@nuvoton.com, ctlin0@nuvoton.com, alsa-devel@alsa-project.org,
 kchsu0@nuvoton.com, ctlin0.linux@gmail.com
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


--q9wJ6YnUFQapy5xo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 10:12:06AM +0800, Hui Wang wrote:
> Hi Mark,
>=20
> I saw you merged the [PATCH 1/2], the [PATCH 2/2] is also needed. Please
> take a look.

Patch 2 isn't a bug fix, it's a new feature so will need to wait
until after the merge window.

--q9wJ6YnUFQapy5xo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKYd00ACgkQJNaLcl1U
h9ABeQf9Fs1iubK8ezfrOqfQtMq5JW5ePQibABlzKb5nRMlBt+cnX3L96muMNTTc
snb3vWoivX6O4DSM3cvNWU64peGEBVHOIl4shpB7lOZRGzd43XbpybVzF7VbeuVF
LN13nGQfps7c9GW7ortZR4FUBgeFPnBYhBUMl4UahBhHWcAqT6NzAP3+JFd1ggve
PJqWV2TpN8uzyrwskHIxQ9arDWUzM+cFsoAUdTl3a80Yx3B5Kb9dI3CAtWaeijXK
6301cnFi1bDIWJVKQse4S4GY7yxqj9RbQ75npZsO/hAk6rW8hQdDWzdRHtUaQWgf
1Ig1OvvHz7OoQGSjvC+di7IuP1wvIg==
=XEBY
-----END PGP SIGNATURE-----

--q9wJ6YnUFQapy5xo--
