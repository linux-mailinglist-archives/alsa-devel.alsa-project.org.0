Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D0604C48
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 17:53:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C0C3CB1;
	Wed, 19 Oct 2022 17:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C0C3CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666194829;
	bh=fJdI2PBQOaREVvpTxeqc6G49+0wfiPXAfQXbuZuicAI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPu1e1njJb28eCdZCJXUJLKbXfZYl/hukjrdyU2hcbT5nq7Z4B2vltxp/FO36FqbR
	 GhdZnu1hSVBum/336UYAFNj7tqpraGCPCnI5iAiKAjtuS3IunDTs9Cm3pBsL2WmJ30
	 pERV6v7wZgZKCwujTVx63aYxFu7iP3DLpSSVS1r4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D917F80087;
	Wed, 19 Oct 2022 17:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABC03F80137; Wed, 19 Oct 2022 17:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A11CFF80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 17:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A11CFF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KzYxiWbt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B304761943;
 Wed, 19 Oct 2022 15:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D796C433C1;
 Wed, 19 Oct 2022 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666194765;
 bh=fJdI2PBQOaREVvpTxeqc6G49+0wfiPXAfQXbuZuicAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzYxiWbt8AF/qFab0s3SEUyzaWb0qtYbQAWg9WYsn0nImZapgtW1W5B2dG4aRhDaB
 KWy7SS8AMOHx2v1KcaSvQ/7FT0dK43aPxl5t50tMzkCBMEhqYH9jA+0pNWuO4KSyzg
 qi2Q5B677LGUnpefIVMMwww4ts/Uf6R2sQBVVEH34caMO1ofjE8tt4YDzqZ7UtmltF
 cQYotxV+Is06tXeQurY2GV9w20fGnqmb1zEo6j43Kp7ZiF5GFT3nfXnRu1eyWMVefO
 EqqDwX4eWZlB7bFHCd62PceggAb7kjU2pUHr9ULcdzpoWg7qLCcoEi2y+6HrN/p5T4
 et62X2YEgQTEA==
Date: Wed, 19 Oct 2022 16:52:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 09/14] ASoC: remove unused davinci support
Message-ID: <Y1AdRh3JaPFZLn60@sirena.org.uk>
References: <20221019152947.3857217-1-arnd@kernel.org>
 <20221019152947.3857217-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t3dbVmTiil0pAD+H"
Content-Disposition: inline
In-Reply-To: <20221019152947.3857217-10-arnd@kernel.org>
X-Cookie: Only God can make random selections.
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Takashi Iwai <tiwai@suse.com>,
 Sekhar Nori <nsekhar@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--t3dbVmTiil0pAD+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 05:29:35PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The dm644x and dm3xx SoCs have been removed, as have the
> da850_evm/da830_evm machines, the remaining machines all use the
> DT based probing and do not use the vcif driver.

Acked-by: Mark Brown <broonie@kernel.org>

--t3dbVmTiil0pAD+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNQHUYACgkQJNaLcl1U
h9BTdwf453mQSwA5Mv146gjM9oiK/qfm7cNpWjxlZhT4KRrSVisjgjeGCKLzsqiU
uOofwzIGivVdJGQ3xLUW2k8Jg9X6TI7Sfzje1kbMSBj698mkmb7RYsyos7BDzLDJ
M83G0sZ3eOhJlX0tcZM20N9zqv5VPV6oEauZK58M+39jogswQ3LKWFGiaR+aoIkR
yHUZqevTzYT1Y/+78LwAA6XTV6Y8kPPPvUKDwx9AVBPwYimqLqOnfnJhny7vOLdc
R8D2GJkfAv0ON0KVpr4inwyyHYS9Lc/jnIuNp9WDt+GcccZR4NF5SJlqQU/mn6yO
n3yv5QQR4mjnoTASLuUQ6cNVDEHW
=jAkz
-----END PGP SIGNATURE-----

--t3dbVmTiil0pAD+H--
