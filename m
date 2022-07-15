Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA19457606D
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 13:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EB9A18CF;
	Fri, 15 Jul 2022 13:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EB9A18CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657884563;
	bh=93P6ibBtgyBmSbj36sQdO/bR/A2gqTi8pXQ05tGXodQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gi7dgUVafOEI21G1XFdac5mIW4eQuh/0wPOoZSCSyTQ8lwSvp2Xt7Km1Iwr+0eAek
	 If6iriM3jS8YC+0T4OwFCRD0TQrzwmOnNkHNjIcktfKqLJveHXQsynMS6fjMO/OtJr
	 ogCi5DsUwtrOou986PC1zkg0sb7IjJOs3UY/ZEtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C94E6F80212;
	Fri, 15 Jul 2022 13:28:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D65ADF8015B; Fri, 15 Jul 2022 13:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2A08F800AA
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 13:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2A08F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="peBbIHuB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65AE3622A8;
 Fri, 15 Jul 2022 11:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECA1C34115;
 Fri, 15 Jul 2022 11:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657884491;
 bh=93P6ibBtgyBmSbj36sQdO/bR/A2gqTi8pXQ05tGXodQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=peBbIHuBf8aWo+VVaobmbBFhLpLVzweAhl8Ax+P4kDGq3xUOVjme4Z7SfLViOLXTb
 y/5Xprn6KHnzcTo7f5MNdw2A7jt0VRs29ffKJJ8zo5RRj+DzOzlpfwDAQfDt/HkPXb
 0BNlwGFYQEEKtql2B6E2VNx5tmPshAlRisA2QSmt9iDP1OCod9jAFvGul9yP4V6SoF
 BOQ6aty6VFG+WN1KE+C0vjzaQE6kA5G/Hh4CtEO19MN1MVbCHzlNVu7MOFhFI80vLs
 k7ni7VdrM1248xxG1AdYhduqS+jBjGiQUT1L6LilDJWWS9HDxCohs+hWKQkTV7RBDI
 ao8LgibR270cA==
Date: Fri, 15 Jul 2022 12:28:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC fixes for v5.19-rc4-2
Message-ID: <YtFPR4HWi+KhMETV@sirena.org.uk>
References: <20220714180007.C9835C34114@smtp.kernel.org>
 <87edymx4bn.wl-tiwai@suse.de> <YtFAtL9hdT57Hb4n@sirena.org.uk>
 <87tu7ivf9a.wl-tiwai@suse.de> <87sfn2vf2e.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/K7O35AHnJeg6PEA"
Content-Disposition: inline
In-Reply-To: <87sfn2vf2e.wl-tiwai@suse.de>
X-Cookie: You dialed 5483.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--/K7O35AHnJeg6PEA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 15, 2022 at 12:35:37PM +0200, Takashi Iwai wrote:

> BTW, while we're at it: could you submit a PR for the current ASoC
> for-next branch ASAP?  There are a few pending HD-audio patches that
> wait for the missing recent ASoC HD-audio changes over weeks:
>  https://lore.kernel.org/all/87a69ii749.wl-tiwai@suse.de/
>  https://lore.kernel.org/all/874jzqi61l.wl-tiwai@suse.de/

Ah, sure - sorry, I hadn't seen those messages at all.  I'd just been
deleting that thread since it was all HDA stuff which people copy me in
on all the time even when it isn't relevant.  The stuff I send about
subject lines is getting sent for a reason!

--/K7O35AHnJeg6PEA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLRT0YACgkQJNaLcl1U
h9DICAf/eP4WyW+0dLAT+ntHTQ7d506ic5NiNztPZMvz0AHqoVgjemg4ImnYsmTG
oDG96F4wgfdvUqw1BOzZ379bigUS1/nTJWuWliOkcsSMXUA1J2+XusDdGm1b9TWb
FbXSCXnpZGM8MG3qJUoRj9drHVvjqpgPLSrSA9d9NM0ER2Ec1ekwekR0yWlf+MS7
Wjn7y/SOHqPbgiHM80kFqKxK3BngNiVzuqK0rigdQIsPHKd1HB32Re+u9Sjn26J3
N0EHUFp8bPUAaolk9denHGNeClRY7uICOFiOBPhCrvkGB4VyoDU/GzOFqG/k+j+k
yweOVPTuf9wbv8VnsF3PlCW6yhwOUA==
=5Ueh
-----END PGP SIGNATURE-----

--/K7O35AHnJeg6PEA--
