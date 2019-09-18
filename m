Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D457DB611D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:11:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 422671670;
	Wed, 18 Sep 2019 12:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 422671670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568801467;
	bh=be/kGF+86M+Ew8zx8vXjD/iZ4pUxftsdyVF5FXrxXB0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzXJ36TSLGKEdm2LoBM5drlLxN9GZI+He8aMHl0WK1SDjZFSzXWhhtfqSzgPQB+rY
	 WjOsmmKgi+JA8Nu15Vhip3UDcZ0if+N+torvBy2VyaKVSLwU/5DEtSudI5Y5VZ+gxE
	 /08ChH+fjIq/nkZpVY1/AI+BZehziVfH8BKOsu70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD721F805F7;
	Wed, 18 Sep 2019 12:08:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0015F804FF; Wed, 18 Sep 2019 12:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 621FEF80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 621FEF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="crqdLtR3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xwyKq2Af8oOa9Ecpf/EsUlNUNhPF1CKO7lVawL3W8PY=; b=crqdLtR3tMdN/woibuiHnuAPk
 qth15KSpYVLk2B4daGEt5o/WB+Z6W+o1Kb3ja6r71gkma0+zpi0oFBRnV7pHRWNg3Lg9sunk1S37K
 boYOxaKfZD4OWl27trwBcYZU1yhn2NK9wFg/7m86VGBxieE21WUi7cpxis91TkDkZ1R68=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAWsv-0004bc-HJ; Wed, 18 Sep 2019 10:08:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7C73E2742927; Wed, 18 Sep 2019 11:08:28 +0100 (BST)
Date: Wed, 18 Sep 2019 11:08:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Message-ID: <20190918100828.GA2596@sirena.co.uk>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-3-ben.dooks@codethink.co.uk>
 <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
 <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
X-Cookie: The devil finds work for idle glands.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@lists.codethink.co.uk, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit
 samples
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
Content-Type: multipart/mixed; boundary="===============6306935486631129263=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6306935486631129263==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 18, 2019 at 08:44:50AM +0100, Ben Dooks wrote:
> On 2019-09-17 19:26, Pierre-Louis Bossart wrote:

> > You need to add your own Signed-off-by when sending patches from other
> > people

> Yes, will do when this series has been reviewed and modifications done.

I didn't look at it due to the lack of signoffs.

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2CAhsACgkQJNaLcl1U
h9C46Af9HqUug+yYqtvuz1iJgkDg06+OGdgZCZt3LzD03CVMezkETohpjdENSa97
vGv0ncXvs+B9obWMBxamAZQLIB02nbOaJRgV4KTB+BIs8Kea3S8MBiKnMJz4ImZN
cRw7fZzOihl2sWacVixGQmwyucX72YjyqLWR0fqTxyp61YxW2kgBGkiLiljGF+mC
I+AZ5Ad+INt/fMknuOqhvms1sLYjvWbGBgA1ShqHlw6OydHSR4QEBfNt57O4HPXr
wjvyk+vbVnhZcSSewJzHMQCfC33alghK12ORM6K+58CwN8SNh2OQrkQBwVMKqm9l
nvBqwW2hxdivNkRAvTT6d5wclb0MCQ==
=yQx4
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--

--===============6306935486631129263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6306935486631129263==--
