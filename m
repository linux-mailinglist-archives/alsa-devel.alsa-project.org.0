Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E243BA4D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 21:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1221661;
	Tue, 26 Oct 2021 21:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1221661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635275212;
	bh=SIe13kO3gMVGDrQdZZw4yFNPkApPQuHUDJ28Zmv+36M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FKJeAaHkbS/VXNaLY2ASRzz/pWVEhkwhE1zFTVuTRakYvFTc96YiDujUGmQg/DRk/
	 OGztxiaPRbLzhbFtWF0/mIiEJ5WnBcqdyoFTEEw2nK5BezGs9AR2JGH7NhNMkcAuKx
	 VtmZhf1eRIsPS7paN8EQ8FU70lO59QUfgqN36QIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E5BF8014D;
	Tue, 26 Oct 2021 21:05:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50031F802C8; Tue, 26 Oct 2021 21:05:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50861F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 21:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50861F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BsqJNkO6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2ED0560EB9;
 Tue, 26 Oct 2021 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635275120;
 bh=SIe13kO3gMVGDrQdZZw4yFNPkApPQuHUDJ28Zmv+36M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BsqJNkO6uDpvzBmmbqKEwDGL92YfVaJoCK98dgfnRqsM4jLZIjAkrlu+GWIOg6zUa
 EZB8rc6ynC8o4DkteMANC81aG1H2aG3XvRMnRNeMDCOsiDHAfzgqurXv36oi8SoMlL
 V6JwcXiea6fm75Nm+8VcWno+q63vKQq5La4YwsmpM34Iz5auo9TO1H0jYGi3UbPktL
 Roz4+/dmjHtirh4WxAiDS1Vm2r5o2iLM7TOpJ7WeIEk143Qrf3eueyAkEXDWzH/gR9
 sN5mIaoByMBluLv9XeuYPRpFdR84dWwmQm2cVt59KbU8YWEzWN1LrhH8/sqDOipyV3
 nud2R9alMTHlQ==
Date: Tue, 26 Oct 2021 20:05:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: nau8825: add set_jack coponment support
Message-ID: <YXhRa5C8rRrslAkB@sirena.org.uk>
References: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
 <20211026093828.4188145-2-CTLIN0@nuvoton.com>
 <55937591-e1f1-9f1e-2355-e7680026f05d@linux.intel.com>
 <YXhBt0rEYSVP9CNR@sirena.org.uk>
 <71293267-0b7f-00bd-1c1a-10386db7132e@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nu7+ZYUjCrKCpskH"
Content-Disposition: inline
In-Reply-To: <71293267-0b7f-00bd-1c1a-10386db7132e@linux.intel.com>
X-Cookie: Times approximate.
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com, David Lin <CTLIN0@nuvoton.com>
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


--nu7+ZYUjCrKCpskH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2021 at 01:53:56PM -0500, Pierre-Louis Bossart wrote:

> >>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>

> > The signoff is there AFAICT?

> I meant the Signed-off-by: tag of the first co-developer. The rule is:
>=20
> "
> Since Co-developed-by: denotes authorship, every Co-developed-by: must
> be immediately followed by a Signed-off-by: of the associated co-author.
> "

> so each patch should be tagged as follows:

> Co-developed-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>

Oh, that makes the whole thing seem substantially less purposeful than
I'd though.  David, please update to reflect this.

--nu7+ZYUjCrKCpskH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF4UWoACgkQJNaLcl1U
h9B9FAgAgjlqFCJevHZz2AYmq/9RLxxCps8UhjuaAKvkJ3klHJTDwfARifsUyx0h
Cmfn4xpMPYtYzuV5Qlh8xFHKDwFnQp/+2IS1NQxMBRx/o14iJDdEdzFThR3/Sq1s
kHjtTz1Nhly4YX0NdtN32BgOfkKkEhnuxAKd5xGkWY3y+58qCSrd9jgevMwA9NKA
cgpO7vaCD/zXX8nOKsV5mCcuWuLpp9Pe7kPy87VsHbmU60sBtxyJc2Zqc04mi/rl
oFZC71tmz5GGzekybRPu57K/ZEFBHVrT/hLIDt1nbMsCxNeCBw7VHnufo3xz2pm1
ikrMcUPTtRkkNWJhFyqAO69VGzih8w==
=8kjW
-----END PGP SIGNATURE-----

--nu7+ZYUjCrKCpskH--
