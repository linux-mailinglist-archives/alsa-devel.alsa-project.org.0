Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08432A78A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 18:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1AF18CE;
	Tue,  2 Mar 2021 18:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1AF18CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614705491;
	bh=SNTgpDB+ecERim5nF4TTFA/XHzpSIpiD84MoUyGNFSg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlrhgyDIRYgU6Wk4UZNkNx2ONswgbb52PqLTCNVIvNVBwc07VvS9kVRcbL+YDnPBk
	 DxP5SQ9RP5/7kkaamyTNt3GtvaBbAqqwfmGFoLiFZaaKY1MsJnBXaux4RCZwadYHgb
	 E0LTvJHKnwP9PQjktYwwR4XWtcuwHEPVQjSCcAcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78546F80271;
	Tue,  2 Mar 2021 18:16:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0625DF80269; Tue,  2 Mar 2021 18:16:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB7E9F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 18:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB7E9F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nv+7DP1I"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6620C64EED;
 Tue,  2 Mar 2021 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614705394;
 bh=SNTgpDB+ecERim5nF4TTFA/XHzpSIpiD84MoUyGNFSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nv+7DP1Iog97Ie5lxh67SmX0GTBZVQc7Lw4Sq8pZu4qANsPr/DxZXcif+i5uHQcSL
 t+/sPfxjHz99TmzBxR5rmVy/1GBN76dZYdwRlwoHPmQUAPxcc5CEeTVZjA6oBuyO9X
 MIOSQ7IcrBVj638fOQgF3u6/L8PCSJjNzExajVNoDGGt4bZKvf4j532foSI/dgSxEz
 WzRra/oxJdNv0hmsNPDNz8086Bcx08IMGsGmMTMwmbv3PsTrJAoC57rRysG5uZqW6I
 8uI1gr0u5KMFm3bXYoBk+2vWDxdrK6G9I9f9uUZ0A2r16D+2LX3Qznz7Wg3HbMwF/4
 x4GGVaW5HLIKg==
Date: Tue, 2 Mar 2021 17:15:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 05/15] ASoC: cs42l42: Fix Bitclock polarity inversion
Message-ID: <20210302171527.GP4522@sirena.org.uk>
References: <20210302170454.39679-1-tanureal@opensource.cirrus.com>
 <20210302170454.39679-6-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Bzq2cJcN05fcPrs+"
Content-Disposition: inline
In-Reply-To: <20210302170454.39679-6-tanureal@opensource.cirrus.com>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
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


--Bzq2cJcN05fcPrs+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 05:04:44PM +0000, Lucas Tanure wrote:
> The driver was setting bit clock polarity opposite to intended polarity.

This is a bug fix which should be a separate patch and at the start of
the series so it should be sent separately before any non-fix stuff.

> Also simplify the code by grouping ADC and DAC clock configurations into
> a single field.

--Bzq2cJcN05fcPrs+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+cq8ACgkQJNaLcl1U
h9DxWAf9H+zQC6ubW9zf3dXH3HHb8UC3Uru8hrNUoc6T6dAhCEZnBzU0A2vfA+VS
YTpvvBWnFQ737bkHNjVw/1I7+f1AM0+RFOtcyGYHXw2XwgEOVxYrekw2dcfhpFdR
Zx5WiiGkMxzCNv6E2Jd0pGXDcL3cZ13N/E/Di6AcKWgpPL/r31rNGpK9Qg7kpsLP
1zZSIab8vf9d5gRZDuWCxDamlAZBU9X4HowguMzAOOY1hNuOJw5RNewsk4TViKQT
Q4xPc+F6KuwpGIHVQzWlfJ5GLLHXGq/Y4gx8e2fYQSJhC9Ou3e/ptkMzuk83YCDD
lBNDcSj6IrGy1gmUEWg0zRd4OmZH4Q==
=8Yc8
-----END PGP SIGNATURE-----

--Bzq2cJcN05fcPrs+--
