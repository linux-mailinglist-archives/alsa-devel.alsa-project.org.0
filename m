Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440432B7DE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 13:45:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7A3E1738;
	Wed,  3 Mar 2021 13:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7A3E1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614775539;
	bh=cXZDI8w+v+WsjZlp81DKHcLF6pulRicjjsRUnzCRmzw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXL15FSCpyWFMZTNvrj50SpIY80KaKdI6uVZo3hL2Hltm8miwnwOm8CUZfnyFprU7
	 7TwV+/ciybZBq3SCWMFN1hDnL7/lPwegqf07t3YBfL5kkJhiiKVtWbIqK0qJ98xBQN
	 o0nR32/Mryt3Pd+h1T89fWWCAPUqta/Mp7bcmRF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3577FF8026A;
	Wed,  3 Mar 2021 13:44:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7E22F8025E; Wed,  3 Mar 2021 13:44:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36BCAF8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 13:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36BCAF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mwuZhP+N"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32F5064ECF;
 Wed,  3 Mar 2021 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614775439;
 bh=cXZDI8w+v+WsjZlp81DKHcLF6pulRicjjsRUnzCRmzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mwuZhP+NbazvgI8HRHDMXUaI0QWNlG0IGLBE+NJ92vnfhjJwb59ZaH1je7cggKEJG
 oSD02pMdQ/YSh/NLM0kSbUmxsNsSVRlzzLfnX9HOkYWSzr1OcdKw71vvx7SJDdB/f4
 fLao4mZ8b95oc2KHaJ3WqTQhIh9El+6YhoBcrJI4q/X5U2OJQ35dOiqKzyvqZNd/Ye
 zbt9Dx4HfDxCErCI4UgXn9idNkeEvNTYLiiavfTzAEUvP8FPqwFNeDuIa/T9F0pKNI
 LjggfGb/YuMhcwpPvrUPrxxl29eoP8v5W+DQJeS0ADGMIVkR2TW6WUOGfepQPq23cX
 81oIInBV37oLA==
Date: Wed, 3 Mar 2021 12:42:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] SoC: codecs: fix platform_no_drv_owner.cocci warnings
Message-ID: <20210303124252.GA5027@sirena.org.uk>
References: <1614762481-102466-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <1614762481-102466-1-git-send-email-yang.lee@linux.alibaba.com>
X-Cookie: Results are not typical.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 05:08:01PM +0800, Yang Li wrote:
> ./sound/soc/codecs/lpass-rx-macro.c:3588:3-8: No need to set .owner here.=
=20
> The core will do it.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA/hEsACgkQJNaLcl1U
h9A03gf/XgwMVVLCnTTglb+pJaMtLyI+eaitGf+Ngq2SU3HGg8VqLUvSRK3THzT5
H+ZF1X/v8oz2HmFttwpX4GsqSnpwgnIcxMc65KQGC6dZg9gzVioIQxx9Asj16tRM
QSoL9iDIMMpzlTQJJrsuPOttCazstPdZxtVU7qAm6sRd82taTzuzjAaLsc9EdjWV
Oi3MZMKCuUwkNUbGc7aiBo9A5VzWeGhNGmXTgW+qBxKYk4qy0P+oe65gYc61KE9A
KktG3oTdu8yPILzPDtHyTO/RXyveemKWHTEY9ZAnjGROjeCDfRNjrHxMBB9xOF7f
sZB5TuTmbQFusi74x3bCjdWZhguARA==
=2PxD
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
