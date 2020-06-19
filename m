Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3924E200A27
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 15:30:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD09D1668;
	Fri, 19 Jun 2020 15:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD09D1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592573428;
	bh=FlatgOiI92mzBuygghhmYIRwTVULyRdwLvB5mhTW5h4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ULUSEhEXLEn6ATYSYmQ2gfOYfN7kjeMIs5qzfR1Z8y7jz5GZSz7zbnkRrwj0DWPIe
	 pV0TfnH36NPwp8og1F9Eww24wBL6CWwsgxik4mbXsashzcPnejxEOYU3AwoiN5Hs7V
	 TBrQCI8J4r+6zEiDcmQtNFaAiDE629gD0XdSkaIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C907F80271;
	Fri, 19 Jun 2020 15:28:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C2E7F802A1; Fri, 19 Jun 2020 15:28:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95C10F8028F
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 15:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95C10F8028F
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 863BA1C0BD2; Fri, 19 Jun 2020 15:28:10 +0200 (CEST)
Date: Fri, 19 Jun 2020 15:28:10 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.19 047/172] ASoC: meson: add missing free_irq()
 in error path
Message-ID: <20200619132810.GA1345@amd>
References: <20200618012218.607130-1-sashal@kernel.org>
 <20200618012218.607130-47-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20200618012218.607130-47-sashal@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: alsa-devel@alsa-project.org, "Pavel Machek \(CIP\)" <pavel@denx.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: "Pavel Machek (CIP)" <pavel@denx.de>
>=20
> [ Upstream commit 3b8a299a58b2afce464ae11324b59dcf0f1d10a7 ]
>=20
> free_irq() is missing in case of error, fix that.
>=20
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>=20
> Link: https://lore.kernel.org/r/20200606153103.GA17905@amd
> Signed-off-by: Mark Brown <broonie@kernel.org>

Notice that the bug this fixes is theoretical (found by code review)
and the fix itself was not tested by me as I don't have the hardware.

It may be good idea to for mainline to test the change a bit...

Best regards,
							Pavel
						=09
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7svWoACgkQMOfwapXb+vKgPwCfatdZSXBo7eyLKEUcWoN1nKrh
K8kAn2+x3sAUwlj/zrlpo9y3mh1nlBDY
=nSQo
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
