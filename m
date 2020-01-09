Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C11361E1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 21:37:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174501702;
	Thu,  9 Jan 2020 21:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174501702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578602261;
	bh=gq6k6nOf5O1I5ajseT8sq9wcB3deZsMxTlPOn+TFL14=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FgGaYxTiUc/Hit35vJaRK+rFYYoCyKvXRQIvFg6h/6nYo/cEJfEqvbmp4ua6yi7n5
	 ytGJLoU12SE2gcgSaxmX9q+a6l3CPGd7is3jwMvveROoXT4fCkV/5wHBft+3oTOxXQ
	 Qob5smU4crDvyiixeuk0Vj8GrxGhw6OVv8HV+vT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45253F8014E;
	Thu,  9 Jan 2020 21:35:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AEC8F8015B; Thu,  9 Jan 2020 21:35:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8283EF800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 21:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8283EF800E4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 782AD31B;
 Thu,  9 Jan 2020 12:35:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDF083F534;
 Thu,  9 Jan 2020 12:35:48 -0800 (PST)
Date: Thu, 9 Jan 2020 20:35:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20200109203547.GF3702@sirena.org.uk>
References: <20191227152056.9903-1-ps.report@gmx.net>
 <20191227225204.GQ27497@sirena.org.uk>
 <20200106214534.39378927@gmx.net>
MIME-Version: 1.0
In-Reply-To: <20200106214534.39378927@gmx.net>
X-Cookie: Killing turkeys causes winter.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>
Subject: Re: [alsa-devel] [PATCH v1] ASoC: tlv320aic32x4: handle regmap_read
 error gracefully
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
Content-Type: multipart/mixed; boundary="===============8675180160720614666=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8675180160720614666==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cz6wLo+OExbGG7q/"
Content-Disposition: inline


--cz6wLo+OExbGG7q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2020 at 09:45:34PM +0100, Peter Seiderer wrote:
> On Fri, 27 Dec 2019 22:52:04 +0000, Mark Brown <broonie@kernel.org> wrote:
> > On Fri, Dec 27, 2019 at 04:20:56PM +0100, Peter Seiderer wrote:

> > Please think hard before including complete backtraces in upstream
> > reports, they are very large and contain almost no useful information
> > relative to their size so often obscure the relevant content in your
> > message. If part of the backtrace is usefully illustrative then it's
> > usually better to pull out the relevant sections.

> Thanks for review..., but a little disagree here, do not know much which
> is more informative than a complete back trace for a division by zero (and
> which is the complete information/starting point for investigating the
> reason therefore) and it would be a pity to loose this valuable information?

Right, some backtrace is definitely often useful for understanding where
things broke and helping people search for problems - it's just
providing the *full* backtrace that can be an issue as a lot of it can
end up being redundant.  As a rule of thumb I'd tend to say that once
you get out of the driver or subsystem you're starting to loose
relevance.  For example with a probe failure like this once you get out
of the driver probe function it almost never matters exactly what the
stack in the device model core is, it's not adding anything and it's
usually more than a screenful that needs to be paged through.  Cutting
that out helps people focus on the bits that matter.

> Maybe I should have added more information about why and how the failing
> regmap_read() call leads to a division by zero?

Any analysis you've done about why things got confused and broken is
definitely good to include!

--cz6wLo+OExbGG7q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4XjqIACgkQJNaLcl1U
h9Cp2wf/YJiRtkQvhbTHYFHL1Nxg5pueZnzeL+EEaSw+j+5E4OSX+sWbuf16NXYq
k+HWa02py4PZcKYQVmxf9b4PTjmpqcGiMWOtjDVj6/TafOEs0ovOwLQLAwuUb9By
oh/jsZ2VwIhBVTAKxmEOyFvy+eYBMonIv4QVAD9Mv8vLpuHGm9FUEPw3D2uy/33s
1PFU4BscfvDufOHEIe3afqutQNzPYb2KTZXqmYuEw5hUgf1h0vxBIAtO5YTwhvGT
cTCbYdzVq1cwTlzH3EpiQZGhXUJ11agI5gaNys662gzIvtq7kIpx20N2Kuy0+kif
9L3c5IlUHB3yAzpoowuDrrRqIKWI+g==
=VKVc
-----END PGP SIGNATURE-----

--cz6wLo+OExbGG7q/--

--===============8675180160720614666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8675180160720614666==--
