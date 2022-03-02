Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2DA4CA641
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 14:45:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6636A1EE2;
	Wed,  2 Mar 2022 14:44:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6636A1EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646228746;
	bh=7SdohgjdZwr8XTSeKb1Wfr0MU6JR/xVezniOJDAD0D8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRuwM2bZg8SGaJpB7pufaieRRKAQvqo3vywwbk6kacw4wZiqQR1/mgSSIHEFFOVfW
	 psA4WgA+bMOnygtO0Q3yiUR4lD93tLZbt8yicq53KpDvgCxy31oND8qPTucTkVDDrL
	 75xVJcYwd463gqA/Ns7rvpxa2mTUSld8vpIWq6UA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD03FF8027D;
	Wed,  2 Mar 2022 14:44:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04DCFF801D5; Wed,  2 Mar 2022 14:44:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BACA6F80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 14:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BACA6F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sbdUZEy5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5C0CB81FE8;
 Wed,  2 Mar 2022 13:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D05BC004E1;
 Wed,  2 Mar 2022 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646228672;
 bh=7SdohgjdZwr8XTSeKb1Wfr0MU6JR/xVezniOJDAD0D8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sbdUZEy5XWy9rag6+3KL0fKGXtDHwJbOs58Xoe1Y/Il9vAAzHO5wrJYKdcwelbc1q
 BMnnpOmqKSwlv+cw/jKa3gdKliTrZF9HnwgT995w/R0yDaBuxar5n0Gut+vwTa7+OW
 8QGikadkhVEeivYvv12FpuYwWDne5f32adLp8zePja/q3EiAEj6csKS9J7aro2qt8L
 bmCVTS0nDWPmAlA3QfKIUNvvcqFu0W4YFtn6ReNmfRGqkzKw1v6cfpUi7trfL/CL06
 wbumDzA5RDt26Fpcn00WI9M/1ALSxsM0mFXmpK+qiXAFZwZegDLYsN1KIXIDveajzZ
 XO9xZiaZmm2UQ==
Date: Wed, 2 Mar 2022 13:44:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Fix error handling in pcm030_fabric_probe
Message-ID: <Yh90u+E3RTuGEDWU@sirena.org.uk>
References: <20220301075351.31691-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zPKg93Nv3+dx0TgJ"
Content-Disposition: inline
In-Reply-To: <20220301075351.31691-1-linmq006@gmail.com>
X-Cookie: All men have the right to wait in line.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--zPKg93Nv3+dx0TgJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2022 at 07:53:48AM +0000, Miaoqian Lin wrote:
> This will call twice platform_device_put()
> if both platform_device_add() and snd_soc_register_card() fails.
> Fix it by using goto label to avoid duplicating the error code logic.

This doesn't apply against current code, please check and resend.

--zPKg93Nv3+dx0TgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIfdLsACgkQJNaLcl1U
h9DSmggAgh1dqp4/bgEI+eYNLVecexRuzd1XFEdwTsACPSdAnD3VV5YWjgHO2p5/
SAVJpJ9YQFWEtlCG+wA+LHiEv4BwzBCk0ga7fCzfju5x4PaNh2WyQ9hu2ZjyAHu5
9mHMiKGa2zhEUz8K7yrEEg/diJKIYAi5C+9HwjjJMj7M+N5OF//sW2Oso5zaiC7L
j/wVzr1lvjnkkF0lNdBEUhPM6AIptIRmq5bXGraLaBda23wNrC2pXQEcumpXjzRF
e1Ru2AfhkpDS+0RmXtrZOpiAm2AsDfjlU21QCC51c1JrxLikvrTsrc24QBoDJtN/
mpMt7ItjjJ7ryuxZDCThtJQLAj2WhQ==
=l523
-----END PGP SIGNATURE-----

--zPKg93Nv3+dx0TgJ--
