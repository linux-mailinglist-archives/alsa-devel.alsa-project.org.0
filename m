Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C43E7CD6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 17:51:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 102711775;
	Tue, 10 Aug 2021 17:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 102711775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628610714;
	bh=5VQb2yLmOxBNX2UvrvQB5Gb7/UfJYuDB49AivOuWzhw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTWOYcQ5E9JFL9mGD4brU9c5WoX4iPA+2Cg3FiFmY0Qmjy3Z+ickMM2eAGAHl4HEM
	 xMWUkCpBDcNEaCvfWH2WHBXdfTvh++9oZEOfCUeFUVzXpPO/sgnKi4wshLqVK/qe8W
	 zhkukFU/n4N98I0B6e0cpqSriG7dHeUAoai3U45g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6592EF8025D;
	Tue, 10 Aug 2021 17:50:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 465A0F80245; Tue, 10 Aug 2021 17:50:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5B60F800C8
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 17:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5B60F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YwysiIRX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C84E60E9B;
 Tue, 10 Aug 2021 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628610618;
 bh=5VQb2yLmOxBNX2UvrvQB5Gb7/UfJYuDB49AivOuWzhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YwysiIRXoAEshLo/nSGcG+owFCSv0ldyJLQFtIPDBGaWmoL3+vO6wgzxZ0IWLnQci
 HIlWsTS7qaDWnAYdHuho1b1RZx2Sn4U04PAd6RvlrzMqrUy23gVqFtiLc4L6VtSBjF
 /tzGuKRTszAScQmJK+hqV4Uq02LQIYuza8/q2qRdEJXp6L3GepZraKeAiOcRNb1aP+
 GShTkwUKf2KWrpLS82gHaQJa4KkEuwsGAMAfyID+KWNceb6JmqpfqshdST14onqibZ
 C21DQ7Q2dV6rZNG63mmcon64+5AF3f89HQux9suExu3jpiDnGehoEn71xehoaT45RW
 gsK6R4q9qfb2w==
Date: Tue, 10 Aug 2021 16:49:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 04/12] ASoC: cs42l42: Don't reconfigure the PLL while it
 is running
Message-ID: <20210810154959.GD4704@sirena.org.uk>
References: <20210810153759.24333-1-rf@opensource.cirrus.com>
 <20210810153759.24333-5-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline
In-Reply-To: <20210810153759.24333-5-rf@opensource.cirrus.com>
X-Cookie: Who is John Galt?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 10, 2021 at 04:37:51PM +0100, Richard Fitzgerald wrote:
> cs42l42_pcm_hw_params() must only configure the PLL if this is the first
> stream to become active, otherwise it will be overwriting the registers
> while the PLL is running.

Shouldn't the PLL code be noticing problematic attempts to reconfigure
the PLL while it's active rather than the individual callers?

--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmESoCYACgkQJNaLcl1U
h9DL6Af/VMKIUFo2FG9w/3/TvL2WcUgeppJcWnFc3mwnYf/caE1XfD8tjYFDUrzN
rrn79TJDa0URpk2+OyFf9CpHr9ojcoTHn+gI1jkTcW8sBPXy0V/OC0MxdXiZoCjj
tgv2rSjj0HSLns9deX8SEQxS17nxPogW2rwAM+kXhGiDi0TI0tkltIo8+V/ryDGw
cM16opc5sMUys66LJQeNwgWIPhrg+ZS1uTGUPaymM2ZronJ2uJhJxxjAeoLehNGX
szEnxRXKfMYr/FoJ7aZnrVo0IbjJxsfl2j9gDD/8sTJUqKoSYnjE7/yI6K+UummP
V41vVqSdJRFtKnYlasDfVe7pKhByrQ==
=ldD5
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
