Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DAE573A5F
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 17:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08762173E;
	Wed, 13 Jul 2022 17:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08762173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657727043;
	bh=WXZhgTm7ZUEq08MypU+05kZlDrSJRZYlXbfXWFnmzsc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EHLBeI717x1jrkvObLXCaFzk/9ldb/ThF/7eovAfwUGoD6vX6zguyGqRJ+O4u3Z8F
	 BPNrinalXho2/sGFEhdI5YmYK/eNSxsBiFyFvEDcT9cNB5Hm1BPBMIs7PII6+j2Qfk
	 oH9pGgzb2/cshGm7yIRBhkjF9hbyoE3s5DsG6aNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 700D9F80254;
	Wed, 13 Jul 2022 17:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 258EFF80249; Wed, 13 Jul 2022 17:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1BD6F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 17:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1BD6F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="npvIhX9J"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACA7BB8203D;
 Wed, 13 Jul 2022 15:42:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD52C34114;
 Wed, 13 Jul 2022 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657726976;
 bh=WXZhgTm7ZUEq08MypU+05kZlDrSJRZYlXbfXWFnmzsc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npvIhX9JY+DKzes/kOc0jcWTBBuISIXum5tEmfDkQMJmbikdCcjrauu01Gz9bCZOZ
 SbszeDufS3CZihmmZem8zeKO4WUaTUWS7YmXBJ5IEIB5zbgU7B5/k+8FGKC/WBacME
 /cG01ZHwuTFI2o9feNIdNQxj/XxSbq1hKL3/8VX3gD4d0s8FL5fZXWM5IcrBSDLx5J
 LKsme8Jd6PLYWjt7nFcvNcAXtyZNjUimCL9vfra4YBplX4NA+9TRN1rcYxWp1iTD7S
 jAAtY+6siau7eGIQPnBoUSafv20TiHrWKXXB4rvmaI+/IYlUanX1wifEgDlU0qF56S
 nGmMyw5wUKD6w==
Date: Wed, 13 Jul 2022 16:42:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] ASoC: rockchip-i2s: Undo BCLK pinctrl changes
Message-ID: <Ys7n+/9v+CygvODo@sirena.org.uk>
References: <20220713130451.31481-1-broonie@kernel.org>
 <Ys7SS/ueE66CBpZK@monolith.localdoman>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UdpAuSrsDLyrSnR8"
Content-Disposition: inline
In-Reply-To: <Ys7SS/ueE66CBpZK@monolith.localdoman>
X-Cookie: Positively no smoking.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
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


--UdpAuSrsDLyrSnR8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 13, 2022 at 03:25:27PM +0100, Alexandru Elisei wrote:
> On Wed, Jul 13, 2022 at 02:04:51PM +0100, Mark Brown wrote:
> > The version of the BCLK pinctrl management changes that made it into
> > v5.19 has caused problems on some systems due to overly strict DT
> > requirements but attempts to fix it have caused further breakage on
> > other platforms.  Just drop the changes for this release, we already
> > have a better version queued for -next.

> For what it's worth, I am now able to boot my rockpro64-v2 with this patch.

So Tested-by: then?

--UdpAuSrsDLyrSnR8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLO5/sACgkQJNaLcl1U
h9C90wf9FvlnbM2orcmSNgy2ButDiTqZ+TRFxucOf2tRQgifCKRk9+Fz2oXus3CN
lTZaNb4vtF76VSjn8yDfPCaUjAy9AsuE6tLlkznpOQzQ5LGc5yir6VK0HIEZfkGM
zemxItNVnxhmQqIrhh532NmX+FV4DTBGcIrTXNSvfkEaZ5nJ7woaqMN7amCl5y1P
nyx3ERrpuSojq7hnSf1d3iBnW/h7jbMRdFNVLIDFexEhGeyhVaoGtSVFk8htW5Ez
DuL0aRJki35wzJqAR1XiMDxTm2JNrFU9a4bGhebk3UqOl1u+x6HdnVRxdq8ACWlX
aDvHlEDGLaJC9hQkrp22lA2TIcFbbg==
=3pQ2
-----END PGP SIGNATURE-----

--UdpAuSrsDLyrSnR8--
