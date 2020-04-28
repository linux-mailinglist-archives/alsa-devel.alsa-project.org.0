Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CD51BBC28
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 13:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 193C31690;
	Tue, 28 Apr 2020 13:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 193C31690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588072564;
	bh=6DTJndgItc1WFWhpZyZ1xM0bC2J9mb3KRo6Obnb4WmI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nw6FyAzWAapuRz0BBIu/rJl9B1Mjc05XwySa01lFy9doa6bVb12qHdMIvjLFXYmOg
	 xO5GvPrGnVaAi9d/FmI7Y/WoNK2z9/0Lmy8U5tV+Tyjb6jPIf7QNlqB7Vlhnu7wAOR
	 qU05HdDsl0jATxR6ewni0nDXZJd03QyEVi8ooq/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B107F801DB;
	Tue, 28 Apr 2020 13:14:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4E4CF8010A; Tue, 28 Apr 2020 13:14:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F82AF8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 13:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F82AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q3qb34E4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BC04206F0;
 Tue, 28 Apr 2020 11:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588072455;
 bh=6DTJndgItc1WFWhpZyZ1xM0bC2J9mb3KRo6Obnb4WmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3qb34E4bp44JWa6pDDT90Gk7LeUH02t8lh2VwWR1c9Oaw66ERl/dzd5ezZl4DCtW
 iQ7bTY9xXuwovratP2T6vv33tNHxFYnVfCJtej/koTp/bP7CscKrtfOXwKt0MfSfKv
 P6BAeAhkD7oshYsng08lhA2nUgKNAdqTdFkr9aZs=
Date: Tue, 28 Apr 2020 12:14:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/4] ASoC: wm8994: Silence warnings during deferred probe
Message-ID: <20200428111413.GD5677@sirena.org.uk>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p1a3a265df0c7f14b0aaec25eb65daf606@eucas1p1.samsung.com>
 <20200427074832.22134-5-m.szyprowski@samsung.com>
 <20200427112202.GB4272@sirena.org.uk> <20200428103638.GP3559@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline
In-Reply-To: <20200428103638.GP3559@dell>
X-Cookie: Eschew obfuscation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2020 at 11:36:38AM +0100, Lee Jones wrote:
> On Mon, 27 Apr 2020, Mark Brown wrote:

> > This completely eliminates the diagnostics which means that if the clock
> > isn't there the user is a bit stuck trying to work out what's missing.
> > There should still be a diagnostic.

> The driver won't defer forever though.  The final pass should fail
> with a different error.  At which point the error will be released to
> the system log, no?

One of the really common cases is that someone forgot to build the
driver for the dependency so it'll just defer forever waiting for
something that never loads.

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6oEAQACgkQJNaLcl1U
h9BdrQf+NCklPpWwravEIRIAH1rwyigfjx2trNsyl7yEA2AwXk8z7UPMlVo/5tAx
U6MrMNyYDvWsAgZVED3Xd20d7R/7M9+E7vg/73nnG4GIsQSbx1CGxfkaovbmWGWl
jGsqydTS7K3eMMSq2WiwiwfJW6qtX2ah3KWNM/hOkxzzxfkYoBY4whG+0AMJzwzZ
X+ciwLknAY2GiigH3viTy0t9vrAJZq8JpsbLrxzlh55YYPmM9sCfwN9Vi5bCfuet
pbGBfCGj4puRpt9bXB0fcO9q34kGsmGVG0cz/BcNc/hGM4y5xSYbGGeBTAPB0Qg0
3VfbJLNHhewSONj2A74OCuxVJqG47A==
=4bNe
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
