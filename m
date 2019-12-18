Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F612503E
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 19:08:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16DA51655;
	Wed, 18 Dec 2019 19:07:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16DA51655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576692507;
	bh=On1X9qQ/tEorqwz9QKtRZKxCUo9ye+cx5TiB/4c4vpo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mFrPqKtQQcmB4v0RqkWKPBECVCW0ZXKs4zBauaQiAMITma2V9cppISwgJjhv1xttf
	 TaP1LiUPKs59wUgvlehrRf6bvDKvKZ2XzVbPgF+q7Yi1sKL4RcFpC8pD7/xi8iKly1
	 QH2mKZtaPeLrVpUw7vBsrmSbSbP7o0otJd3tBTEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 812CCF8014C;
	Wed, 18 Dec 2019 19:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50883F8022C; Wed, 18 Dec 2019 19:06:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E8752F80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 19:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8752F80096
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D56951FB;
 Wed, 18 Dec 2019 10:06:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5599E3F67D;
 Wed, 18 Dec 2019 10:06:37 -0800 (PST)
Date: Wed, 18 Dec 2019 18:06:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191218180635.GO3219@sirena.org.uk>
References: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w6jqrk.wl-kuninori.morimoto.gx@renesas.com>
 <CAFQqKeWWdwCMEO9idW4sANYio3y1ye3Q3okbOEd=zwYrRXDSYg@mail.gmail.com>
 <87eex2jnck.wl-kuninori.morimoto.gx@renesas.com>
 <bc4cef12-0095-e2af-5c91-63b06d815b8c@linux.intel.com>
 <20191218171415.GJ3219@sirena.org.uk>
 <aa512532-908d-c1e4-6284-b550da05d3f2@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <aa512532-908d-c1e4-6284-b550da05d3f2@linux.intel.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 2/7] ASoC: soc-core: care
 .ignore_suspend for Component suspend
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
Content-Type: multipart/mixed; boundary="===============7679344252943906617=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7679344252943906617==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvq4FPIYehQuVelz"
Content-Disposition: inline


--pvq4FPIYehQuVelz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2019 at 11:48:18AM -0600, Pierre-Louis Bossart wrote:
> On 12/18/19 11:14 AM, Mark Brown wrote:

> > These numbered suspend states are a platform specific concept, other
> > systems will typically just suspend or not suspend.  It sounds like this
> > feature does not map onto your systems.

> Correct. What is not clear to me is how we can specify a behavior that would
> be dependent on the target states.

You can't currently, you'd need to extend the framework to support that.

--pvq4FPIYehQuVelz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36aqsACgkQJNaLcl1U
h9BTDwf/UgvPt7V1NtwebZ7PiGI9dKihLDuNPGGm7VB6TIszJb1EcooEc6JdaxFu
t/jILD2M8DEbpbLlB6ckR9UUXN9E7hFzmyy36ycBQCkKyzYmwPZQAzJixtlbJDnC
zYw9qbVUwkMWxDAGibPJ3fk1Qv+sIc3PO+DMxv2cGEqTRIw3Iutv5WRKG1u2eQ3T
cJ6EAgob3bbb3t+BQBXxyoupO3omXOTsHCBzur6JwtbECcKw7ustLrSFg3pblpoZ
xPwbWWlC5e8DKa2R9KsGPDaPi3KLKwFrk6GTeOJTVs55iQycjdERnDUZ2oJ8NsV0
vaJbHAEbD5Pt1eixSGNa9sj3So5+bw==
=5GLb
-----END PGP SIGNATURE-----

--pvq4FPIYehQuVelz--

--===============7679344252943906617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7679344252943906617==--
