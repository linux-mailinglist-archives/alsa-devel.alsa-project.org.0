Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7891F425F
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 19:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B410B167E;
	Tue,  9 Jun 2020 19:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B410B167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591723964;
	bh=K0BGTYODR/iV0wXVelqhnKL30cXjlfOcm9U6wurUmVk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AwbzKlA78LbCsu9KOgprPIlwGLg1SiqiTHS6hS4+jwCFENM9SwkmfZgzNQKsNd1oa
	 3oznycdq0ejRS2c/ZanX4FJzFOM9SgUFZk38Nbok/ixgJkZ6cNkKU6BJvTkdlkAYYZ
	 DMninC4jrEiaeA2YKEH/wqrhxUVGvRVUM+0Vq0I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D09F80124;
	Tue,  9 Jun 2020 19:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE814F8028C; Tue,  9 Jun 2020 19:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47312F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 19:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47312F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QcmALxhA"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B35E20774;
 Tue,  9 Jun 2020 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591723905;
 bh=K0BGTYODR/iV0wXVelqhnKL30cXjlfOcm9U6wurUmVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcmALxhAjslUXnR6YC7eg8kryfNAJrhmSweugHk354NYxFsktyjtrsT4HD1rk4dsQ
 3Xegf9abdCNTeo8ST5RgTYxBtK/l7h8TBi7Yc+O2qwb3pwHDDS3Eum+Wgt4XvB4eVk
 w2Ll9jFjOhQHwgavtiCkF4P5PDyOgcBaq8D0Nqjg=
Date: Tue, 9 Jun 2020 18:31:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware support for
 tas2563
Message-ID: <20200609173143.GN4583@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nRwNdQxTdQ7rZk9A"
Content-Disposition: inline
In-Reply-To: <20200609172841.22541-2-dmurphy@ti.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--nRwNdQxTdQ7rZk9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2020 at 12:28:40PM -0500, Dan Murphy wrote:
> Add a property called firmware-name that will be the name of the
> firmware that will reside in the file system or built into the kernel.

Why not just use a standard name for the firmware?  If the firmwares
vary per-board then building it using the machine compatible (or DMI
info) could handle that, with a fallback to a standard name for a
default setup.

--nRwNdQxTdQ7rZk9A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7fx34ACgkQJNaLcl1U
h9B4Pgf/ehxijrs0I1XM6a7jjZd7I2o0Qr+iNYOZ2FZzlvfc/ctItyP+oleKNvu0
Z+7bX/9Qz0KlfxABFmoUxik3859oNIASDdnZ9uPC7damLes7HkxLmixASJRcEyJT
cMUPqPVVu2SYP8g5Zl4wDJKFBdg9vpsm7yUT/DJWEgwOS9MRXfM72rnxl5mgqN27
mF77C5XHmIJu/kUg1g+KMjEBpwY7iTBWfDXLecGikn+egcUdRnx2NMDQegDN9AuI
51ClUyGEYBsKX4KN1i4S1VdVA9db0Sd/Bsfkv2AS431i435xbfJSRZ40AUYFyWPJ
kasHwah+rBUXN1Ue9hukXgdCrO3T3w==
=JKgl
-----END PGP SIGNATURE-----

--nRwNdQxTdQ7rZk9A--
