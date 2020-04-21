Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB631B2F21
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A4B16CE;
	Tue, 21 Apr 2020 20:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A4B16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587493867;
	bh=IAB1hYp4T2cXR48+/SE/q61FjbYrajIeNd8WK0RL0Kw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4cNniJDWwWAHSzyMSOG7k9JiYqiFRPoyuT4zopaW8I3Yt8f3d9QXOxwNydZlsr0y
	 XfBMWSLOk39wNNfxog1mogf8rTBAbYbtoFQ33bOVw1cmpiQrZqlCDhDiNPkuRDgTBo
	 iYQzrO3JXUixx7ejgJp9uMlTksk2oYLfv/7h/n0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C89F801ED;
	Tue, 21 Apr 2020 20:29:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B685DF801EC; Tue, 21 Apr 2020 20:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90280F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90280F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n9YeaSQt"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE431206B9;
 Tue, 21 Apr 2020 18:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493754;
 bh=IAB1hYp4T2cXR48+/SE/q61FjbYrajIeNd8WK0RL0Kw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n9YeaSQt0a0TPoMThlep9kkbcMGRyuCWZgegcWfSst+Iz63lVe6S+6WEsqH6J9/CQ
 0lmiRIcF6aKNkiUiteuEiEfYNxhLwQbOtQEr/AfdRqSIvpZYGwOMbGWawY+p/tKZD+
 IgH2HpD95gMbko5B1pxu935Zt/+/OlyxOMmC9sKo=
Date: Tue, 21 Apr 2020 19:29:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: intel/skl/hda - fix oops on systems without
 i915 audio codec
Message-ID: <20200421182911.GH4540@sirena.org.uk>
References: <20200420205431.13070-1-kai.vehmanen@linux.intel.com>
 <20200421180350.GA36150@sirena.org.uk>
 <2396af30-f854-fbf2-8da3-7b92ae96eede@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U3BNvdZEnlJXqmh+"
Content-Disposition: inline
In-Reply-To: <2396af30-f854-fbf2-8da3-7b92ae96eede@linux.intel.com>
X-Cookie: Non-sequiturs make me eat lampshades.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: hui.wang@canonical.com, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, jaska.uimonen@linux.intel.com
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


--U3BNvdZEnlJXqmh+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2020 at 01:15:30PM -0500, Pierre-Louis Bossart wrote:
> On 4/21/20 1:03 PM, Mark Brown wrote:

> > This still doesn't apply against current code, please check and resend.

> works for me with git am on the for-next and for-5.8 branches? The patch
> does not indeed apply on for-5.7 but not sure if this was the intended
> target?

Ah, my script for checking what branch a fix is in was broken by all the
x86 build breaks keeping the ASoC tree out of -next :(

--U3BNvdZEnlJXqmh+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6fO3cACgkQJNaLcl1U
h9B/2Af9FOg6kKfzXkCOdSofjPtwv0rpKo35WPuQ8joMEtcv3xjG5MwVr9n1pGHG
PSdkgMxko7CCIUIjcAVrkx6X9P92+aBqWM1TWGGlH43V8HFOc+l/gSVrl5T846k1
n5rPgDEszsmoj0Jn64jxD4rdAoUG1G/jvmHPXhZo1oRekwexSAULzbG6mV7fnYOz
eymHRJ48/p1uvV88rGayJdqQFuMUY4Jk5zVi1oSWuK5orOHzkpEgy/yLdLEPPZCG
VmftR9HKo7d8v+JDw3EcPvQ865JPqvq0qJE3xFV3e7Ke+SnK3qO9kcYCAzQqAdr5
DfPOEzDDtrsXf4FDBO0WjfNN3ulTLA==
=ONtQ
-----END PGP SIGNATURE-----

--U3BNvdZEnlJXqmh+--
