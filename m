Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6C212209
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 13:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9D7316D9;
	Thu,  2 Jul 2020 13:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9D7316D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593688829;
	bh=cdxltecagHq0EhFz9ytGE2lSNdIS5KFyWAPrZ4YswO8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZTVNxa1id65YTXEC1siBj2pW6uJh+L8PUNGPB+OBOjnNA6slYU/EzOZYR2oNipfhm
	 3veIke4+/Ng0zgTcSGOYrAJSuzzB7d/mzHioSbGSM1+vptBt7n8XSVziWRvDFvd6pr
	 aHX+NGt867nEvtVDtDHLD91xYYNYdDfnYpI8eEF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8D8FF800C1;
	Thu,  2 Jul 2020 13:18:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1721CF80134; Thu,  2 Jul 2020 13:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 310FBF80134;
 Thu,  2 Jul 2020 13:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 310FBF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aptMTPAO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 203BD20884;
 Thu,  2 Jul 2020 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593688717;
 bh=cdxltecagHq0EhFz9ytGE2lSNdIS5KFyWAPrZ4YswO8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aptMTPAOA7IY62Fx1xUbr7O9ST1hTCE5Ki36F+yfcSHwHmOr7oG1Trk1dlPbhtn4y
 kh23SjYSmUsd3oF88DiK6oLsNY4lSvJ5edS1c45cT3mCftIOdRgcoWjjFDPzQ+NAWN
 BHgEWSxVqjWdIOvaGJWIsbubrLtN0THuS6B6/wG0=
Date: Thu, 2 Jul 2020 12:18:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 15/53] ASoC: SOF: Intel: add PCI IDs for
 ICL-H and TGL-H
Message-ID: <20200702111835.GB4483@sirena.org.uk>
References: <20200702012202.2700645-1-sashal@kernel.org>
 <20200702012202.2700645-15-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <20200702012202.2700645-15-sashal@kernel.org>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 09:21:24PM -0400, Sasha Levin wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>=20
> [ Upstream commit c8d2e2bfaeffa0f914330e8b4e45b986c8d30b58 ]
>=20
> Usually the DSP is not traditionally enabled on H skews but this might
> be used moving forward.

"This might be used moving forward"?

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl79wooACgkQJNaLcl1U
h9AyIQf/XN9wbFDf4Xk7vo1dpnqGOIeu+UDDCw+HCrfG8Z5Io5AC7HOsDfkBKttH
L05GcIeXRt1Qq7x2EFUSnmLkkhDyQI4nTRl2ujhpcTMLHYNCXGbrocUQTpwJVYok
YsbMN0In//I59ey77NKiQwUIj2p/72Lpsq+20HRMzsmfBqQ21i9T7aSZLJmUBrUT
yU43VWKbJUGnYcbsNLygVJCVQdLAEj997Xdqm/CNGyGfzCtFiyk8jLt7jFfVvvw/
jPCloGH0InhuVrPCyVjxnSxpOdr7mxvK3e84hjPL+SfW4ut8fsdcS+xqogf2DFOf
0zRvJzZMv3nuMbhJUx3wwZXm2k1TyQ==
=/OZK
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
