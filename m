Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3C175B5A
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 14:13:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319FF16BD;
	Mon,  2 Mar 2020 14:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319FF16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583154808;
	bh=N9HqMGdVq+3ukr+ElMzBF4bW6fhpKt7uH2245qfO1BE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ANterlX+5V1eIyg85IH1FbkkEsCz1tWDli2kG9Xz71PT5EjnKQGHBAlxpVU3fXojU
	 LvZ1cFe7UjHUQN5t6Wx/eLhMtgTSJ4LwFD92vqHO+eXfTHRvm9PrIfnFie/41ZwsvP
	 Jlbil4dRFiDj+JSOZe3o8oMpUuWrU7zNfgNPN2QA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3511CF801EC;
	Mon,  2 Mar 2020 14:11:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1D6FF801ED; Mon,  2 Mar 2020 14:11:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9C97EF80131
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 14:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C97EF80131
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CCD92F;
 Mon,  2 Mar 2020 05:11:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45463F534;
 Mon,  2 Mar 2020 05:11:39 -0800 (PST)
Date: Mon, 2 Mar 2020 13:11:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: Intel: machine driver updates for 5.7
Message-ID: <20200302131138.GD4166@sirena.org.uk>
References: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline
In-Reply-To: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Whistler's mother is off her rocker.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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


--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2020 at 05:11:55PM -0600, Pierre-Louis Bossart wrote:

> base-commit: 6941b0b5f919e9839e8c25efaeb53854efee14e5

Since for-next gets rebuilt all the time it's not ideal to base things
off, for-5.x branches are better.  If you need dependencies it's fine
though.

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5dBgkACgkQJNaLcl1U
h9CDCQf+OpmsJYyHy2Idu4m6WCbqzNX98Aksc8Ay6kJh8LTbIupo+KT4a1RyvyxO
onAl60SyOGDuah9pXMp+ZI+38aP4fCKqehUM8fsdMitXmH1WBPws0+ARruRFVuho
0RL7hLxi8AYkGKCmLhouQrJAOoEobZfatWkUwFdzlnloz4rPL+ndzGATCoP0Zsb7
4tHcV9WeNBE/q3FW1beyjclR8AsW2XSUvy2itIvatiEfDH2TSThgxv6dDA4O45U/
PeVmTRwxiW8JjLUQXSjGyZdCS7qmfEOmLNn79FOwp6rpKdxv9fEkousNxPcwvTMX
4baG2IMmEYfWc4b/u+/jtKUXEArXmw==
=2vu5
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--
