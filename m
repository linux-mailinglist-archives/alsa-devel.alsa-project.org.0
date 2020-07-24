Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A37522CB44
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 18:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3871687;
	Fri, 24 Jul 2020 18:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3871687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595609090;
	bh=LFdJwHelCPUb1xduFalB8+JYOGx/M3VqbZ/ygzyO5Ps=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAJfXeXKm5O6b50Db0g+Gtaz4h5ltB6vPb/u8JX5xDnLDzg1g1KzsKM57WjEJdHAz
	 QcbMQqf8d+vQqL9+1g0C1fwJi0ZqNdPyES+TlTG0HEMG0wSnWEwqYY3vpoQV5eNk0j
	 n+o3x+pdO6fubEynmb2ABKup8s4AGtQ0bjtUC5g4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB39FF8011F;
	Fri, 24 Jul 2020 18:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E0A4F8014C; Fri, 24 Jul 2020 18:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD4CF8011F
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 18:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD4CF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J9L+IJIc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 459AB206F0;
 Fri, 24 Jul 2020 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595608975;
 bh=LFdJwHelCPUb1xduFalB8+JYOGx/M3VqbZ/ygzyO5Ps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J9L+IJIcDu08FPqK1tgKsZ+PhwTJhZUsqtv7ysifDeFoXN094YQF5im7vynJ5hju2
 GrnbzbrYFLuLHg4599tUP/RGqAxHlNAl/yC+0i1BqyeOxyWKUfH6+jxKbHOp86P8Hs
 9LB2Xi7krCHTGzw6HZcQ+xaXpKtkbOXowWXsIHYs=
Date: Fri, 24 Jul 2020 17:42:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: dapm: don't call pm_runtime_* on card device
Message-ID: <20200724164240.GH5664@sirena.org.uk>
References: <20200724070731.451377-1-tzungbi@google.com>
 <20200724111634.GB5664@sirena.org.uk>
 <CA+Px+wU-R2qOFK8RhLzTXTqDheZhzOyKuiR-1S9qXj02QdruAA@mail.gmail.com>
 <20200724130151.GG5664@sirena.org.uk>
 <CA+Px+wVteAt5_QrGmRXcPVHJ5bEtXn9RiXH-bgcRiY_OezFj9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Content-Disposition: inline
In-Reply-To: <CA+Px+wVteAt5_QrGmRXcPVHJ5bEtXn9RiXH-bgcRiY_OezFj9w@mail.gmail.com>
X-Cookie: You will wish you hadn't.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2020 at 10:41:41PM +0800, Tzung-Bi Shih wrote:

> The challenge I'm facing: (&card->dapm)->bias_level is always
> SND_SOC_BIAS_OFF.  Commit 4e872a46823c stops to update it.  It has
> nowhere to add the missing puts().

> Ideally, if the bias_level goes away SND_SOC_BIAS_OFF in
> dapm_pre_sequence_async(), it calls pm_runtime_get().  If the
> bias_level goes into SND_SOC_BIAS_OFF in dapm_post_sequence_async(),
> it calls pm_runtime_put().

Right, I see the problem now.  This is probably fine.

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8bD38ACgkQJNaLcl1U
h9ACagf9FqEWTNUCGKkk5ImVEUn4UDW+uzpzhfg4Hh1leoD6HPPLZlsLYbsTE6Ra
9ohyLXIkytq+Us/Vt7h69RXPSgn0B3oPwx0PhWHo/4zRaOmPWalup/RBZOrNPpZ0
ftDumZj3U8NLL8mYF4p6KJwdM2Wptu78LBaZ9czijFu6MGsT2fXPLq87nJmbMmX3
UZmTCFQ/tM/PYQCLs8bihRZEovNDgbPpl/dXaBeUXLZUf3ZP0qJ8DpsVxJLaWZLC
fgdeq8NA+NrgUBYHf5Vuh7Gt/Mim6gNugOzf8kxc7AbxJkgJWHeN7KdCvm+02tBr
K42HOwvU9Xj/cqeyOIoedD600QH3IA==
=i2uL
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--
