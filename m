Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BE933C538
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 19:06:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE0718C6;
	Mon, 15 Mar 2021 19:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE0718C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615831600;
	bh=OOnibZwVS4QXe9DaGiP/Jf/4UZuNzsZTE76LNhLdRAQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j967yer9m/+u792U51gXjVm/Yzb/CMGBCqDQjviiVe0gquAdz4UNf4vlVO1ijUQeB
	 Ihd40vsXQ4C22zWUL1BaYZxugzVIPWcID6w+fCO9uAe9WTblp6h3dPkluMIcYKW+/Q
	 SY/gxF3rPWvfFDB/xptMWCtU42mVRLE6dr+cwIq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52634F80100;
	Mon, 15 Mar 2021 19:05:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE138F80171; Mon, 15 Mar 2021 19:05:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E3C6F8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 19:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E3C6F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SZhjJqAb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4BEA64F2A;
 Mon, 15 Mar 2021 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615831501;
 bh=OOnibZwVS4QXe9DaGiP/Jf/4UZuNzsZTE76LNhLdRAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZhjJqAbLuEQKi10OD1YOdVbpgYJYXxyQd5qRuURaH43m7HXPCr4KytneHIaFxeqh
 J7oXfTmo3WZcM0aBNrHNh6+Q7QlqZJau6LBhfthlE6IBJrWwpVm8ExdTYpJOKj3N3y
 5iD5nq3UnQwKQaH/vWV8wQ3NboVWSz+9nlx6yUrPsVkWpGEw1ueWQuUY85G5x4N8X1
 uqq1Ds4tKg2s3mF4x35/ZufjVHl8mjWLK6KiaxGC42xyuZ6k5QjpQm+2JSBFyWnvBm
 m48dGvd9aqv5z3oWztxH33cA7dHAFddzVSxOsTypGHQIHI+w0EF3Mt8GqFiZ47kCJJ
 4DnANaCS6YpgA==
Date: Mon, 15 Mar 2021 18:03:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 0/2] Do not handle MCLK device clock in simple-card-utils
Message-ID: <20210315180345.GD4595@sirena.org.uk>
References: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OaZoDhBhXzo6bW1J"
Content-Disposition: inline
In-Reply-To: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
X-Cookie: Close cover before striking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, jonathanh@nvidia.com, sharadg@nvidia.com,
 michael@walle.cc, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


--OaZoDhBhXzo6bW1J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2021 at 11:01:30PM +0530, Sameer Pujar wrote:
> With commit 1e30f642cf29 ("ASoC: simple-card-utils: Fix device module clock")
> simple-card-utils can control MCLK clock for rate updates or enable/disable.
> But this is breaking some platforms where it is expected that codec drivers
> would actually handle the MCLK clock. One such example is following platform.
>   - "arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts"

Thanks both Sameer and Michael for getting this resolved!

--OaZoDhBhXzo6bW1J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBPoYEACgkQJNaLcl1U
h9AtuAf/e1BD/13HSmTPeMLC/4qUqTdjmE9nF5bQErVZMroH4MMJ6db7mtVD7QPS
BX2kiqtlD3uhRAjsu2lOCY6ElVvXZe+16Q2d7uW/aWG3DsgxUv7DqEvkHWx2g0Kw
8iT85QMANx4OSRs1r2/Z27NhBehTqv2qJBzsfnIyv4OW1+72DVMe486OoIkVxAVY
5zDxF8BMgQJErkmCTb+u8PNmIYEZLsoSIePE1YLaXid7adRGU0u8G5B3Eg1js3du
GMGXnuLCC6S8UN7bDfH3hOYSg2+fbiGe3S6wd24O+DaOt5MOwzBmwUXpOhc/ScS8
v6mUjOyk9voBRkUPARLJDb6Kgdc1ag==
=2Y8Z
-----END PGP SIGNATURE-----

--OaZoDhBhXzo6bW1J--
