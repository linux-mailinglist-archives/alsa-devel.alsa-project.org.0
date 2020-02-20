Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57F16668C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 19:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EA7316EC;
	Thu, 20 Feb 2020 19:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EA7316EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582224461;
	bh=if96Mc/y1YmJUZ3lpkYFyxgKXgKYudO9S+kOERoBIyI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZpJ8dVhZMCQKigrJUbUJ0v1P7vWxnA1VXHqJRE34Zdpfx3MaJ92uBFDduT84W+Ok
	 +st4IzJkkp3AK3PRwC6LfyFfFztz87FxVuVSyn64TR3MzZuNRKndIAnMB6vPLXu3zh
	 bsMMFQAzqZAaxSNMCO7zByKZZf0DeMCQ8CcKqlYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 220AAF8015C;
	Thu, 20 Feb 2020 19:45:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDD5BF80150; Thu, 20 Feb 2020 19:45:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 395D6F8014A
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 19:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 395D6F8014A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB1D230E;
 Thu, 20 Feb 2020 10:45:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4263F3F6CF;
 Thu, 20 Feb 2020 10:45:46 -0800 (PST)
Date: Thu, 20 Feb 2020 18:45:44 +0000
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] sound: Replace zero-length array with flexible-array
 member
Message-ID: <20200220184544.GG3926@sirena.org.uk>
References: <20200220132420.GA29765@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hTiIB9CRvBOLTyqY"
Content-Disposition: inline
In-Reply-To: <20200220132420.GA29765@embeddedor>
X-Cookie: You are number 6!  Who is number one?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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


--hTiIB9CRvBOLTyqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 07:24:20AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:

Acked-by: Mark Brown <broonie@kernel.org>

--hTiIB9CRvBOLTyqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5O09cACgkQJNaLcl1U
h9DNEgf7BrKTKxuld5LZ1ebYWQJO+bT5mSr17NAdXnhaLEAAeUHxhfI5Ly6MIjJm
Ljf8W2CHdYozlV3dzreRlVvjGdalVC8VGeF9HN1RXX2MTezDOQ5ub12AGbyLohp1
sNU6Ha8v/4P6XulizOdBNUbFmRCN1nVYSiRlxClmcU6rx0gvqt6V3ESYe5EGOUr8
EtuCOc7oHDe3neSdQwxZZgM0xWkmATg9k0HHF7b2lr9iR5GMKBdZWOAxl83kX9ac
a8kUwJMR+e8YOTbzY+8WCmjf7QSlmu5GOSS/AtM02zpADdHfcqfi649gelkmP4YR
y9AUYhYmxJcLsSK2z58Gms5JyYOLrQ==
=x8F5
-----END PGP SIGNATURE-----

--hTiIB9CRvBOLTyqY--
