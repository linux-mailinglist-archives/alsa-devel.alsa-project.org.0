Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F425954A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 17:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CAAF17EC;
	Tue,  1 Sep 2020 17:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CAAF17EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598975412;
	bh=g20pJFBb5iCOzQrBDPcn1dKM+QFrNxFVzYd3pzQcXac=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ied4SPncTgK7Cy+4bfZ8EA+gaI3dVvLYmbALcvkVsUQkRhdb/KgD9eSZ5djdl8B5O
	 XiZy9yPHtTy5WOoiuBnT53h810wdl3y58JICXaD7oll2+GNJydedVTPGAd8wS3w+3K
	 WZKP/HKiC1/f0v/pXwWCkoWtRPVJXGnYgC5i0UxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C41CF8021D;
	Tue,  1 Sep 2020 17:48:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFB47F80217; Tue,  1 Sep 2020 17:48:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA8D8F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 17:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA8D8F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GAEugd9b"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BFFD2064B;
 Tue,  1 Sep 2020 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598975296;
 bh=g20pJFBb5iCOzQrBDPcn1dKM+QFrNxFVzYd3pzQcXac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GAEugd9bLu5XC1xp7VyKySQWdULhHV358+1/mNvBamRil2a9oQAB3X5k8p5g5DGkM
 9uk7pfyhlSLOOO0gVzjUqJpa8RrnTRIkDtw7OLnOBrMJgRPyDNjFIRLc/ydXTV5bYW
 5LY8+8irTw45kmwTzNOvO5yr8vqT6somRaMFslQ0=
Date: Tue, 1 Sep 2020 16:47:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] Revert "ASoC: Intel: haswell: Power transition refactor"
Message-ID: <20200901154736.GG6262@sirena.org.uk>
References: <20200901153041.14771-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline
In-Reply-To: <20200901153041.14771-1-cezary.rojewski@intel.com>
X-Cookie: Equal bytes for women.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 05:30:41PM +0200, Cezary Rojewski wrote:
> This reverts commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a.
>=20
> While addressing existing power-cycle limitations for
> sound/soc/intel/haswell solution, change brings regression for standard
> audio userspace flows e.g.: when using PulseAudio.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9ObRcACgkQJNaLcl1U
h9BS8Af/Sqb0R7N7XfJqm7m57Xf3v75B/bhcrMJ6PbyfODQRKB6ucDVxxoGUFyio
h+1bTC4x7I17qfjQQ3n8ejEpjSNFFuIjju84lwpCyg3s6F7sFfg0ln4C3mYBeY5V
8Q/6iYSvA6OXdZzEC7Du1FJNgk98nABGjgf/AeTrH67ZwEjshlwalj8e2r2vS+Im
b0eHQ+NCvkvqJ6bLwEGa1ygRKOfIk6cKPn3s4mgAa2XDHg/t/xTRx4FbC+24/joD
aV/QWcdZqP4nO2ibM2R7lhxy8Iqp0K0Spi2YGgSjbX6Vw4XujdGPtH6yF1VNyYIj
kje8qUinLu9ZEIf/2MEwZ49ctXJLdQ==
=Mldc
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--
