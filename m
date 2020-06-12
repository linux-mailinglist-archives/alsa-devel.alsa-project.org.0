Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F61F7BA5
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5951670;
	Fri, 12 Jun 2020 18:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5951670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591979521;
	bh=4LlTrbnAzIZFR6wHuayLVFm49WeLNfWz+dPx3QjZKGE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAiqdwfn/yZkLvF+4ZLvkYA70kXn5VZIg9zA+G/CWok5ZH9MWLXPwKoF+FHx0xXB/
	 ICEvAU7JsaRIDWvSZGBwR9pSyRI3Jr/Ny+9Bsy/pre70J5UFx7UAPf9PPBSeTskt+Q
	 LR+1BLcrY0NbWULfVjvusAFgLh7ieLJG7q3GeXCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB7DF800CC;
	Fri, 12 Jun 2020 18:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B19EDF8021C; Fri, 12 Jun 2020 18:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D491F80058
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D491F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y0hq5uQL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3802207ED;
 Fri, 12 Jun 2020 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591979413;
 bh=4LlTrbnAzIZFR6wHuayLVFm49WeLNfWz+dPx3QjZKGE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y0hq5uQLQbmGvIYSOXCy/asfYb3eBKTjQLU4Y6u76hjB69bblP6aJqrUF12KvLU9k
 Kd/+Rm8om3D8SXw8qJU0MQLi60Gp9Dp68ggohmcSGDShQmmmFezvzUQqvbe04WKTJG
 9IzmQh40CeIGEx/CjsZD5Ba9lFtXE5wCBPKEcj84=
Date: Fri, 12 Jun 2020 17:30:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/2] ASoC: tas2562: Update shutdown GPIO property
Message-ID: <20200612163009.GN5396@sirena.org.uk>
References: <20200612160603.2456-1-dmurphy@ti.com>
 <20200612160603.2456-2-dmurphy@ti.com>
 <20200612160922.GL5396@sirena.org.uk>
 <0e482167-71c2-a128-b8b4-a054557d30e9@ti.com>
 <20200612162200.GM5396@sirena.org.uk>
 <432c41fe-8afa-2ccb-8917-fd64f4895144@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v541l457l4DThMFo"
Content-Disposition: inline
In-Reply-To: <432c41fe-8afa-2ccb-8917-fd64f4895144@ti.com>
X-Cookie: As seen on TV.
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


--v541l457l4DThMFo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 11:27:04AM -0500, Dan Murphy wrote:

> Well should we then just revert back to the non-standard name and just fix
> up the code?

> Or should we support both properties?

Either option is fine for me, supporting both is a little nicer.

--v541l457l4DThMFo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jrZEACgkQJNaLcl1U
h9Bs4gf/YK7aSgRQxpt8N+GOcjobdxj76wwkgcRjsIHbJr8OYMe1r0Rgo3zU+IQ4
JirWgd4e4e5JP2JyZv1g856echYxneyYRwShozq+U/mtpu6VSPa11xF+wTRh+6hl
s7FTPn1EAEDEPyo91CHy5Abgx37H0BYbJg2sEdVnyvYogFaRmlGGfeBvvNnyP2Cw
8FSxlIziTxNGz8e7x5VK9nC3xGtG/Cuc1MjDfdjVcDi9/pKmPok6G0DeY5R7/pfJ
KcwJUOToL+QsPcbZYM3sCyDyWIcgvYX2Zn81yaCepoe8441HR+0awU17Y+etOB2e
cvCErmPpmmhnjbsnYZhI5QC+vlZp5Q==
=qJK+
-----END PGP SIGNATURE-----

--v541l457l4DThMFo--
