Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636863BEE5
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 12:26:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7917716BC;
	Tue, 29 Nov 2022 12:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7917716BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669721180;
	bh=YK8MGpJdBuaPZGJd2P9e8MZ4HREyWerCc5ZAcQIVXEg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ji+tzCgku2von50ym48t237cqwL8uP5+qEzpVefjhANN6fxAB7Jkob6X1mjKXJ+z7
	 OhMOIcrEIR2mhHKVAtJVkOhp1csp9iFlzfVxSST+iWcjs5dnBxBKZc2e2e1iyxVNBV
	 y3pSGtQB9QcB1quDzyAjWvH4nJGYUxlGYJ9k8KVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5DFAF801F5;
	Tue, 29 Nov 2022 12:25:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5002AF801F7; Tue, 29 Nov 2022 12:25:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D74F800B6
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 12:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D74F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="glp9ihcs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 528B8CE12AA;
 Tue, 29 Nov 2022 11:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54014C433D7;
 Tue, 29 Nov 2022 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669721115;
 bh=YK8MGpJdBuaPZGJd2P9e8MZ4HREyWerCc5ZAcQIVXEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=glp9ihcsq2HSGUF/PrBetup8qde/RgU3rMMMfGjYjM14d5gxEx9jhEBHpMi8rR7hb
 c81hrA4gFV9+RSosNaHI3tFHzlS4mNOg8lrYwZsP6rZNKoUVdozwl75j89zmQeaEyF
 mm8NDJkAM6b9jV2FexkLQQtWlwnlRBYy2EuMXfvo6EvIACzs3X8bMWzjNeIXr8iHJS
 bbYnULSIE0/6mB669kR3+0evGKkYEDcouGsYMFtog6pPwsWqevBs0VjtUUf0x7Oc2C
 9ITt5vqI+4sYxMkrxTm7+VVZ9hsu8Q7trgspAwZSIf9Suy0N/l62Ziha+vv3A0aAL1
 YyxaH8ZLvbI+Q==
Date: Tue, 29 Nov 2022 11:25:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] selftests: alsa - move shared library configuration code
 to conf.c
Message-ID: <Y4XsF2tir8bNS14i@sirena.org.uk>
References: <20221129085306.2345763-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/mMC9lhECteaEL4T"
Content-Disposition: inline
In-Reply-To: <20221129085306.2345763-1-perex@perex.cz>
X-Cookie: An apple a day makes 365 apples a year.
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
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


--/mMC9lhECteaEL4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2022 at 09:53:06AM +0100, Jaroslav Kysela wrote:
> The minimal alsa-lib configuration code is similar in both mixer
> and pcm tests. Move this code to the shared conf.c source file.

Tested-by: Mark Brown <broonie@kernel.org>

--/mMC9lhECteaEL4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOF7BYACgkQJNaLcl1U
h9AcUQf9EkIRMut8eWxXQH5qqrq4g4RGzHNakyEjhasONpYTWVvbDRA91KrziWaa
UQPUSZijdEPjE26/rkmfVyJNDKuGTwRnjEwO3ulmb8lbUs44rMzjNCdJnEZt8OOw
rg3PYX4bwbDeFNZqiNRBemXH3nDTNiKrGkbWLfl7TW5fQP6bwW1w6hZ/i0nStJnD
OnuF11E4UUcadloc2u562W6NWHHtRyoH3Krl9Df8zDJ0SbEamOTQnFnkxBIbMGK7
faP1lQ3BxCNnozC1GImlAKJkhGiQc4BUNcbO3u6uOiZzlwkMJLoUmRs+U4ppnzB3
FENh2r7nhcww1FqrJh2IAagTIWOpaA==
=AK+i
-----END PGP SIGNATURE-----

--/mMC9lhECteaEL4T--
