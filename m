Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41501624C37
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 21:54:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C63FF1664;
	Thu, 10 Nov 2022 21:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C63FF1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668113680;
	bh=J6mfoht5qBrFBxrC6sH4TYOnxV6LF52emDjer2Ypdwg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbzeBU5YwCqkQ0oafL7/mQjh7/ofcLVk7RBbYJTTpiQGBOYDblAOUl5WQf8VOAJe7
	 yQ5k25lqToxks05xMp/65BW63c1BXTvFp9I6F+0alGhGG3p17Uc6Dp6sorVqN1bWcI
	 qj8YRjZNBi7MHWW5DRFy9P15P0GF3kbtEIYlb8FY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55A8EF802E8;
	Thu, 10 Nov 2022 21:53:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 586DBF8021D; Thu, 10 Nov 2022 21:53:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E86BAF80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 21:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E86BAF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WH7TRMx7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9CCA061E38;
 Thu, 10 Nov 2022 20:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7196AC433C1;
 Thu, 10 Nov 2022 20:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668113618;
 bh=J6mfoht5qBrFBxrC6sH4TYOnxV6LF52emDjer2Ypdwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WH7TRMx7C5cotdLr9EDFhUqhQiizydM+OKkWtChuu54yxZ5+cbJaIDl2Ce3iPuuYL
 Em5IoexpZDpO95CAG61oVilno/P4KjfrtR8/uHu76MjLwphcqSBVzlvSNLmTlc7kkq
 qZPjPly3CfH5o5Rfhm7SKTXUJdxXq7uklbniD8dzy6M7W+ef5H2n5UA1+0vRHS+9Ke
 O6MN4AD0yPgGVSeHg1LjyWiPssBp6xTQ8SukHR6UueTJNjA3HSYJK8AqljQLWtDZU9
 vlC5DO9lZjAzQd1rxdBJBsYAifKnAxG9LviHCsPEUB4qMJLPVr0jVgGTxdEYB7NLD8
 OK32ps9JyB2Ww==
Date: Thu, 10 Nov 2022 20:53:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 00/12] Add support for the Cirrus Logic CS48L32 audio
 codecs
Message-ID: <Y21kzH4gDd6ZrpVm@sirena.org.uk>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="O8txgz163g9adksm"
Content-Disposition: inline
In-Reply-To: <20221109165331.29332-1-rf@opensource.cirrus.com>
X-Cookie: Torque is cheap.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, maz@kernel.org,
 linus.walleij@linaro.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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


--O8txgz163g9adksm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 09, 2022 at 04:53:19PM +0000, Richard Fitzgerald wrote:

>   regulator: arizona-micsupp: Don't hardcode use of ARIZONA defines
>   regulator: arizona-micsupp: Don't use a common regulator name
>   ASoC: wm_adsp: Allow client to hook into pre_run callback

The regulator and ASoC bits look good.  It looks like this is going to
need another spin for at least the DT and irqchip bits, I think it'd
make sense to take the above cleanup patches for this release even if
everything else misses it to cut down on future patch volume.  I'll
leave it for a bit and do that unless someone has concerns, it's going
to be easier than applying and sending pull requests.

--O8txgz163g9adksm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNtZMsACgkQJNaLcl1U
h9D4zAf7BAdmu24FzKu8K/VatxXXCPdtwbu8htaSXj1JNOmeGwQq1PghD43yTI2D
w09fTstt6knzfqx3NI991TN+bU4EQhXBRpYbRqoDiTMeB6Ov0X9GOiugQNuplkwO
tAn56mY3y+59XOeqkq8V4dC8DcvRqoZqIgVqFjguhUtCgH1BURUXfa8dbChg3jsI
HxTcpmlQCeQwGTypJC3B1v78Z9rlwMm2xlm3u4uxzEwWcFSUz1T7T+z90a/GzlL9
1C/QqTZIllH+HbabJ4Hb1Jt1gdGNqi5ZmMghTSF5XRMkWQNDN9QwuJ2hLDZ8ti0k
942m5A0H518y12xFzo3EJ0zJmx62Lg==
=3Mhi
-----END PGP SIGNATURE-----

--O8txgz163g9adksm--
