Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CB107352
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 14:36:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2385181A;
	Fri, 22 Nov 2019 14:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2385181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574429783;
	bh=+aGVafGmYOz120gHmEnbP2GKCWZfcfN6R3mUGGdCpkU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZH2FIy4hT4e1gsegH9MMmEkRLvJSTrEGVFnT3mmuSvIGn+Bn+IN87chBOCg7oyPl/
	 zjVtpkNS6xrobFmAEgG/zpIhvx8H8QQ+lOBc8PkaBvhPnhoI5xnDJjDa1ixhplM022
	 V9wMGiRPYd4zi9zCjgMOsKToVgg6PoYJ41mYeYF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C5CF80150;
	Fri, 22 Nov 2019 14:34:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 287A8F80140; Fri, 22 Nov 2019 14:34:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DC9FEF800EE
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 14:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9FEF800EE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17AB531B;
 Fri, 22 Nov 2019 05:34:34 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AD063F703;
 Fri, 22 Nov 2019 05:34:33 -0800 (PST)
Date: Fri, 22 Nov 2019 13:34:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191122133431.GE6849@sirena.org.uk>
References: <20191121190709.29121-1-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191121190709.29121-1-tiwai@suse.de>
X-Cookie: sillema sillema nika su
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 0/2] ASoC: Follow the recent ALSA core API
	changes
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
Content-Type: multipart/mixed; boundary="===============5575523255641526793=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5575523255641526793==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 08:07:07PM +0100, Takashi Iwai wrote:
> Hi,
>=20
> this is a follow-up patch set for ASoC to adapt the recent ALSA PCM
> core changes.  It's merely a preliminary and this itself doesn't
> change the current driver behavior.  The purpose of this submission is
> to get the basic API changes done in 5.5-rc1, so that other trees can

Acked-by: Mark Brown <broonie@kernel.org>

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3X4+cACgkQJNaLcl1U
h9AUXgf/X5SL9V+tGgEqehFkbe74Kf0/W/INvjBEjQ5NkMy+Q5Ugfmika/1yi3FM
HLhbhKqlkBoERQNh5L3lFmYiXssgFAxgDrRTsEvFky5gM0D4ZM9bFyDG/URjYgwr
qnG7IxyZxNf9y+jhjcx7n5TWRheqoC1bdyKu/6VeyRLyBnG4VSFwK20wd1ZZf+3l
HKK7RgpPGRRaavWMis05Oh3xpDy130sodWblIV3J2uKLI3WeqZLgx3IcvuO1Ycii
9vgueqPZm9wnkWeLJIMZrRYMopmGM5S6t38Tzy/4SLEuXRI8Luqt8BkBTdenX9wf
Y8ZNHkrEHcI0p5MT3QU1sREwQ/zrfA==
=JdGn
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--

--===============5575523255641526793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5575523255641526793==--
