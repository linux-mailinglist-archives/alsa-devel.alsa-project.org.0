Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C1721864F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 13:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82BFF168D;
	Wed,  8 Jul 2020 13:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82BFF168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594208421;
	bh=ezQlaBGQZXQXwJAowe+NnHrBPYd0tIftkbIQDBk6yyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loOouX9hnosGPSwVirsgFybwlTC11QcEQBcsIPEGq6NSJ4awfgxtmjj7L93klVUkT
	 AOatsUpF35dLXro2AbyEwhYkoq+a78QfNvWkmaVB+9luNURcdKX5yr5VuezcL15zEJ
	 nD+0hZdoBYjTntfF6CytUJ89IHxg3514mt2WAxQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FE3F8015C;
	Wed,  8 Jul 2020 13:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEEE4F8015A; Wed,  8 Jul 2020 13:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0E4BF80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 13:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E4BF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lMXSreCk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69610204EC;
 Wed,  8 Jul 2020 11:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594208313;
 bh=ezQlaBGQZXQXwJAowe+NnHrBPYd0tIftkbIQDBk6yyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMXSreCkoAD7JE+93R08fy8LdOhm3cKfn6tSm/50v1dLKBSrz7mMNE+eIm74/dwih
 czvTqZIupbzUMMVEilWTA4NKarwcCDNlVkACiN3inc0WDE6ZSt2rqiMOEABzE+b4JJ
 EKwwERvOtEcjPtxWsCXK8gVKevNzKlOM4jhhw+h4=
Date: Wed, 8 Jul 2020 12:38:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/6] ASoC: codecs: max98373: split I2C and common parts
Message-ID: <20200708113828.GI4655@sirena.org.uk>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
 <20200707205740.114927-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0z5c7mBtSy1wdr4F"
Content-Disposition: inline
In-Reply-To: <20200707205740.114927-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Rander Wang <rander.wang@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


--0z5c7mBtSy1wdr4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 03:57:35PM -0500, Pierre-Louis Bossart wrote:
> To prepare support for SoundWire, let's first split the I2C and common
> parts. No new functionality, just indents and formatting to make
> checkpatch happy.

You've got a couple of fixes after this patch, the fixes should've been
first.

--0z5c7mBtSy1wdr4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8FsDMACgkQJNaLcl1U
h9DAXwf/UKPuAKU8djRsq4JMdl4DD1MYUvFgx2ZOCegwVYmdd/p7JODYiAE94R5q
KFNtRb9VPriJHssAPfMfczl5jDA5ezzZJR+1Rrg2gnylgdmjUG2j9eiHxP/4vA/w
EVJq+6YgLwYHx8XtcdPQTQ9gWjdFUgGJqSos3O5kwGBQWz259fZHJAC+SPGpGW0o
/IsR9zDImcGsbytAAxMw9Ih2uhM4yvcMo9V1eZERMEmMjfyG/RfqpLIrCq6yYl5U
txdruVZZsOIkuIkiZgbhhP2PZuHHdJ4PkVXUMDXfFPKBuJAHKQa2tK3i3cNlI811
Dc5b1laWRWL4ZxmvmhJ4Fdg1DK/Lbg==
=sP6Y
-----END PGP SIGNATURE-----

--0z5c7mBtSy1wdr4F--
