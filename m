Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 984ED3D92E8
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 18:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BCCE1FE5;
	Wed, 28 Jul 2021 18:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BCCE1FE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627488694;
	bh=kyZ1KJI1rvCVsOwDl/SsgMb6gh5MhG+3LuR4pAcoLeo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y2ZmXc3Uefm8y07i2zUprMhUGNA22vg2G7umW0Z9zZNf7ZwL4Gh6/MHPWBGb4aKpZ
	 QZbuA9L0xc/knLU4i55AARcvTqVbuJ9J4SV3SpgmZL1CaHcpetWPeOBnLwWBclqR45
	 CG7nv/vPHTkMKY3zooJa6RUjJSso+K15AHJhZNjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D39F80212;
	Wed, 28 Jul 2021 18:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F350EF80253; Wed, 28 Jul 2021 18:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94474F8020D
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 18:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94474F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bctTfQbg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 944C76069E;
 Wed, 28 Jul 2021 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627488599;
 bh=kyZ1KJI1rvCVsOwDl/SsgMb6gh5MhG+3LuR4pAcoLeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bctTfQbg6hhb45zejSKPM4EF4dwPXO9LmNNOcrSt74XQvCzmdxv2i57aZcTxZMdxh
 sIM23GgU/BkCtIS4bbsYGhOu/51wLbcRW+jKBuwG5ZICo8rzPiE81875mhGPTe+Q/W
 +r40gkbKslFaM1hy2s6rHv1/MpF++EckGvLxdjHDwYYw93Xd4n6Ko4whhY9yisvLlj
 gl33LtCmHmOfiY+uCEZAz3W8lZKrEm1OgQRUqpcfFByLyyfTgI6MThsO2xrVpvynhH
 IZFRzHeceysjvbed3exCnN7vzzIlK+5PsXnmXHW1NxUr9J4Dg6mQaXXomPqNK8B9Kz
 ViYYughdvLrbA==
Date: Wed, 28 Jul 2021 17:09:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: dapm: Revert "use component prefix when checking
 widget names"
Message-ID: <20210728160948.GE4670@sirena.org.uk>
References: <20210703125034.24655-1-rf@opensource.cirrus.com>
 <20210705165041.GC4574@sirena.org.uk>
 <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Vx/N56bIaYnO6ICL"
Content-Disposition: inline
In-Reply-To: <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 shumingf@realtek.com, rander.wang@linux.intel.com
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


--Vx/N56bIaYnO6ICL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2021 at 10:55:23AM +0100, Richard Fitzgerald wrote:

> I don't mind if someone wants to change the core dapm functions if that
> is generally useful, providing that it also updates all callers of those
> functions to still work.

> Changing the behaviour of core code to fix the Realtek driver without
> updating other callers of those functions is a problem.

The thing here is that nobody would have thought that that any caller
would have been open coding this stuff like the component things were,
it's simply the wrong abstraction level to be implementing something
like this so people wouldn't think of auditing the callers to find uses
which might notice that prefixing suddenly worked.

--Vx/N56bIaYnO6ICL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEBgUsACgkQJNaLcl1U
h9BMgQf+PalyhGjExV/oRAmKS31UCcBtye8lKsXrMc+XX4t3uWdkNkEXB/Sw1HDb
vmWb46mGawRE/nQvNCYFCSh2NmSVL7lz0dGvTY72/X7TEhkVx8ceFoq/VL1m8NBM
eXBPu2ww5VI8i02FYPo6s/DLnA9JHhKqFZZZq6PGTZy1fAUeCqYZFoMMSAchNle4
LxDh5tO134EG151LJFTBCFKQFJsYxSW1nhznw/a9MqOnpcxacCsGzDSpGHmZ6/bm
9bLxojsH60Bfw9HhDMvUYLmznpz8uBPgr2CB21dXhQWCioAKwzv8ufol7GMTWBhD
RX/6urs3NmTgXmi0ICbce5MlQFlsgw==
=sHcF
-----END PGP SIGNATURE-----

--Vx/N56bIaYnO6ICL--
