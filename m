Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDBE3FFF4A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DB1D1897;
	Fri,  3 Sep 2021 13:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DB1D1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630669091;
	bh=OEDmR4negKnOGDPQ+EoysnEMdMzaAmjeJI6XSFGbwP0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=feexNEuutOmRdzeFtES6+OLoc2ZtrL85PlvFRbVyOEtVkBE5QvwZVjEQAsNFNhRXO
	 pHJMYrwQ5zvQ+12RoK55xdniEgnbgMQctf/FCMP4IrJhAG2fqwxyHatfGZgTU1KKgV
	 A/FrQ2/dVeLhut39FKBDG+52LTGJ/et94zTv8cPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B053CF80088;
	Fri,  3 Sep 2021 13:36:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97948F80254; Fri,  3 Sep 2021 13:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CDEDF8020D
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CDEDF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YS5C1hEB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE24D60EE3;
 Fri,  3 Sep 2021 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630669005;
 bh=OEDmR4negKnOGDPQ+EoysnEMdMzaAmjeJI6XSFGbwP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YS5C1hEBeTDQA27HAXjWaLnON3yXeEr99CMJk0e8zarkJUmUO2ebTBKqDBVGz8B3j
 HuABTAp4+j0yOenl+57f51Kb5HKTs138UVjqMWJoSJtx1OZh3Pmw9WdokNkOSLkDIU
 +m1STXVNgEcbODXKFnaYS7KNWFBkeVTsGl4U9czYjPvquJFNV6WpKkWUaxDcZ0WcrN
 RtmQ7GZ0ykpxTxdjxyTdmMcAcS74hN+1ORXGvyPNN8orxJk3aFywVfzDLimAHnTpqR
 KxQdct9hz4co7bt0FXEPe9/Bpb3t4vGbUChX171cz0YmOzpoptVZkKRr1TMwBPxPYa
 KvNqKC1eXppXA==
Date: Fri, 3 Sep 2021 12:36:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 01/52] ASoC: dt-bindings: Add WM8978 Binding
Message-ID: <20210903113611.GG4932@sirena.org.uk>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-2-maxime@cerno.tech>
 <20210901143950.GE5976@sirena.org.uk>
 <20210903103706.jhyn4ancyfr6bjcy@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cyV/sMl4KAhiehtf"
Content-Disposition: inline
In-Reply-To: <20210903103706.jhyn4ancyfr6bjcy@gilmour>
X-Cookie: Darth Vader sleeps with a Teddywookie.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, patches@opensource.cirrus.com,
 linux-sunxi@googlegroups.com,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
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


--cyV/sMl4KAhiehtf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 12:37:06PM +0200, Maxime Ripard wrote:
> On Wed, Sep 01, 2021 at 03:39:50PM +0100, Mark Brown wrote:

> > What's the story with dependencies here?  I don't have a cover letter or
> > anything and there seem to be a bunch of tangentially related patches in
> > a series here.

> There's no dependency, you can pick the ASoC patches safely

Oh, OK.  In cases like this it's generally better to not combine random
unrelated stuff into one series - as well as making it look like there
are dependencies it can also cause problems for tooling (eg, b4 is going
to want to fetch the whole series and my personal tooling doesn't like
the same series going to more than one of the subsystems I maintain.

--cyV/sMl4KAhiehtf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEyCKsACgkQJNaLcl1U
h9Cc1wf/d0cuKA+rHU2WN8WYQh5LbPAz4e8P7acnfuh7oKCRIH9V9jRNgUILevrE
uCq+Qv9/8rDBmCvtGEgqh+OZurQg+Eo3RVsXxha9DeSJjwGFb3EpRK3srD3poRLh
FHqHch5BL7h+hbSS719H/ouC2mNEvblu33X7WGRd/nBnDpV0v4sPH15XeBgK23o5
rCHb+jwW22Zv0bMvKF9FHsP14D6vaqlTGmfdDSnF0yDVJhJvviG6sfhqFcqjsYO2
gYrAmdhyAaAici2yc0yn5XjSk1Xc/DTrn5JE1uuTd8jroEECaEjA9RfMo7/GJoK1
wooyvMcGHchu1wQ6s3welkbtahdTFg==
=rh7W
-----END PGP SIGNATURE-----

--cyV/sMl4KAhiehtf--
