Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4EA3E458A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 14:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF391167E;
	Mon,  9 Aug 2021 14:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF391167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628511797;
	bh=3kFnfS+Dy7NmGU+ijvdxfcEyE+vtAAyO0mFOkgwcuAA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=af2GNaH0hBy6zuNjvnU1S+uZHJNzPXapUQjprICJvrHqpHdlxuKrQIt1VWUYzkesp
	 SOeu/8bmspHuCV7VM/lwyO3xRnLfY4IprRC6H4+p6SO0C6VYT4OfHEuYJTRnL7SOAF
	 Ypt8AuDRC7PHskT/qGRgb10r4ACZc/Acaq/O8kGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1913BF8032D;
	Mon,  9 Aug 2021 14:21:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FEF7F802D2; Mon,  9 Aug 2021 14:21:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D473CF800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 14:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D473CF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="slYnTMLr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF5A160C3F;
 Mon,  9 Aug 2021 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628511702;
 bh=3kFnfS+Dy7NmGU+ijvdxfcEyE+vtAAyO0mFOkgwcuAA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=slYnTMLrUeFRH40v30luW0Xn3tP+312crZgqGDDJJkKtEKuYugRnRDJ5V7FPBJH5Q
 3mGJ6fHdx5RcRcEJme/bcsnoQU0EbUoP6dZt1i6iii4qADSTezskMwDsngRzKysrG0
 jE3fgZGg3lY7+vzZhKVd3IIpCRJ4nnVVkkraNBC2HtOpJcL+7kSvH3TE/1slRif837
 YeRr8h0GkOudZ1frXTmhHf9SnVAJ6VCWODGrdcbd3RRWQhRhU8VOUPI3bHg5scT9X2
 NNBXLFG73AMqeE7FR7mywn25t9kmyaqtf4RYla/CZ7Yo6bZmHzuJpUkHJS0F7iiuwS
 YLNkbvjLs2TOg==
Date: Mon, 9 Aug 2021 13:21:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <SteveS.Lee@maximintegrated.com>
Subject: Re: [EXTERNAL] Re: [PATCH] ASoC: max98390: Add support change dsm
 param name
Message-ID: <20210809122125.GC4866@sirena.org.uk>
References: <20210806080834.16705-1-steves.lee@maximintegrated.com>
 <20210806110301.GW26252@sirena.org.uk>
 <CO1PR11MB5089212BFBF03F82AE41E34C92F69@CO1PR11MB5089.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <CO1PR11MB5089212BFBF03F82AE41E34C92F69@CO1PR11MB5089.namprd11.prod.outlook.com>
X-Cookie: Flattery will get you everywhere.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "steves.lee.maxim@gmail.com" <steves.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
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


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 09, 2021 at 12:57:48AM +0000, Steve Lee wrote:
> On Fri, Aug 06, 2021 at 05:08:34PM +0900, Steve Lee wrote:

> > This will break anything using dsm_param.bin as the default - why make the
> > change?

>  I'd like to make that as same name with other using SoF project line.
> This originally production default is "dsm_param_%s_%s.bin with vendor and product name".

If you want to add a new filename then that's fine but we shouldn't be
breaking backwards compatibility for a minor reason like that.

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmERHcQACgkQJNaLcl1U
h9BUhwf7BAZCA8ned1qlMpa1UllxHgfo0Ik5FEbiaGulDN7WWUvgdF0pKHYVFxAc
300Ly9VLhZvNbpGb42okPXkHPSgglxswYHRtLUArSvz0Tr5OjRgz1o+/geuBHrfy
z2FTjbgsDsqnCgrex86I+K1L4Srt2+0b9ycbkkSVtsJFj1mYbwfFUC7esb5Yei7c
KHnJ1XStCH4C52J0Wp2dLf7SjT4WIsHo46ZvlGYApxIzzCo3gbIf7Kd30rgNh+T0
4lhkcxuT1ypD5dxgPETQmXeug2UOdnw3E8VWA5AY2weWoD0i9xf3aEHdFETiRdX/
O0Pe8CClycH/bK3Wt/ChAQZEZA393g==
=r8T7
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
