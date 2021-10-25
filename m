Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD807439BBE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3193116CF;
	Mon, 25 Oct 2021 18:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3193116CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635179935;
	bh=ziEBjHr12sDzvOXR776wc/eAW0tq78737ORT5LIMvzE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qNxmtW2DMOofn11C4NakY5SqUyRxMtiujnQPL++Vzs/JErw5DiHvdFDvJc0CzdbZp
	 urCvhy3bicnTshMSugE1wScekJxtt8IHAWdWLlhgH3BDMqtpsWCWjXV930GuvMr0OW
	 GvPnELMqQC6KovHb4hSSIngfGpM0hqjBDvAIAk9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 980CBF80086;
	Mon, 25 Oct 2021 18:37:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A08F8025A; Mon, 25 Oct 2021 18:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0697F80086
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0697F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DB4PlJoI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC25560F22;
 Mon, 25 Oct 2021 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635179845;
 bh=ziEBjHr12sDzvOXR776wc/eAW0tq78737ORT5LIMvzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DB4PlJoIgWHti2Yn4n7JUn8wZSdZgArq6BzzVWLKYvBBXAzfdvBpnidNa2ST/tgCt
 4Ge0r6GErKsiZTrwz6VmTVAi4SCgxrmu4fHySYzNSewPz0ppkMWvlmZP+vVCauZcmK
 p6FX9027m6gL/HfRc0tz+aC1yBHgPCw7D7M2Z5bIDM9EBdGSNJI/Er0w7jSDaoc5z5
 oZtv6M2cBu2YPXZiGFBBxp82QXn9+9hOScgaJte74W4O/4pG3C3ayrpwxLlRrObymD
 M881b17uwn6C+t49+BvTJERMuaCjfkCs84L6g3iMY6KT3Ice48MLf7iAxkrcWto9Ph
 MhQ0nztVmjubg==
Date: Mon, 25 Oct 2021 17:37:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v9 12/17] ASoC: qdsp6: audioreach: add Kconfig and Makefile
Message-ID: <YXbdQkAkRq0ntpLk@sirena.org.uk>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
 <20211006113950.10782-13-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K05r9NFRM1dKDS2Y"
Content-Disposition: inline
In-Reply-To: <20211006113950.10782-13-srinivas.kandagatla@linaro.org>
X-Cookie: diplomacy, n:
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
 bjorn.andersson@linaro.org
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


--K05r9NFRM1dKDS2Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 12:39:45PM +0100, Srinivas Kandagatla wrote:
> Now that all the code for audioreach and q6apm are in at this point to be
> able to compile, start adding Kconfig and Makefile changes.

With the previous issue fixed this continues to break the build for
arm64 defconfig:

ERROR: modpost: "audioreach_tplg_init" [sound/soc/qcom/qdsp6/snd-q6apm.ko] undefined!

--K05r9NFRM1dKDS2Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF23UEACgkQJNaLcl1U
h9CnQQf+NwQLMPVU6qVyhIO/3BI+s+tvCEI2aMW692vdJ8ftmAf0hJ3OPIy8CY55
VXH/oq2kFVC6FP8HvbmZmaLBBcFRJfVu2m69IbFX7IjYALakXVHzLslBSshjJC+k
0z5b1vAr91XMxPhfy4xJCAsLom09J+COlOPbsAMzEV3Nu4v86Fpm58iL/yPkLato
9O7yas3SOGO7qGh0Nh4WmYN49CslN1/5sdLdL2ke2oVQco/CRQg1NbMiu/Z0xuJv
iTxuGKQjUKE0EvzKSXtCubyg3fJopbQAI32dugWxeqpLMAAqwaO84w8igY+Md/BL
G81MujVNTsCf0Uy4qcxvzuHd8J0Jpw==
=1Tju
-----END PGP SIGNATURE-----

--K05r9NFRM1dKDS2Y--
