Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F4554FA1
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C172034;
	Wed, 22 Jun 2022 17:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C172034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912535;
	bh=hoetdcZUDckCVz1LG7Suq/7P7r1pBVIFo0Mc9wsofSc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AUxdSrGEv2mF7tJzhqOY+/4a9OazSKLkfsaI1yv2NIqDrsBq75FLRuDzIEEjt4k52
	 9UE0NNkBtAVnBn3fbcbebFDGEFOp3sKS3C6dl7bY1G4GNygunMpFV5R9aHhsgOHbQ8
	 SeYjX67pRd9iMbHT5by+iIcs0q4NbrpZK9mIMGiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37814F8075B;
	Wed, 22 Jun 2022 17:24:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6B9EF80155; Tue, 21 Jun 2022 19:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91A2FF80104
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 19:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91A2FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RuybSt0j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0502361548;
 Tue, 21 Jun 2022 17:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A5EC3411C;
 Tue, 21 Jun 2022 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655831345;
 bh=hoetdcZUDckCVz1LG7Suq/7P7r1pBVIFo0Mc9wsofSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RuybSt0jNYMAYfRsWXHYhHsk+0ofBeXFoZvGmqCeMqMzipoVYqGmD/I7MRQtP6yZ/
 f2OrqFGZDKu2+YU5eEKKAxb/XnhnOW1ZiYTxI8BfYBDGIeWxc5rnfznR3+zzyBBWPY
 l+OI573tJCSGgKT0iuPnOaDTDKa2XFj58pb5RNTm6I6QqKTZghMu9Xt8SmlG7hFaB6
 T5JhW3h0TVGylxUTwooVthkO6xg+2d5FZexgNBSgeq+B7hKMbML8eZkTg23BR4PCys
 sd3hltj6VukI77Q0dhGBCVocjx6KSic5cZMNvVCk+TZokH4jRCz2nGKiRABmOsSiS/
 iivCrzf0kFV6Q==
Date: Tue, 21 Jun 2022 18:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH 00/49] regmap-irq cleanups and refactoring
Message-ID: <YrH7JurP2LAl1uYU@sirena.org.uk>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rrIaw91LstEgu4tF"
Content-Disposition: inline
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
X-Cookie: Edited for television.
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:19 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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


--rrIaw91LstEgu4tF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 09:05:55PM +0100, Aidan MacDonald wrote:

> Here's a bunch of cleanups for regmap-irq focused on simplifying the API
> and generalizing it a bit. It's broken up into three refactors, focusing
> on one area at a time.

This series is very large and the way it is interleaving patches for
several different subsystems adds to the difficulty managing it.  As
you've identified there's several different subserieses in here, if you
need to resend any of this (I've not even started looking at the actual
patches yet) it would be easier to digest with some combination of
sending as separate serieses and reordering things so that all the
things for each subsystem are grouped together.  That'd help with both
review and with merging, both large serieses and cross subsystem
dependencies tend to slow things down.

--rrIaw91LstEgu4tF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKx+yUACgkQJNaLcl1U
h9ARhgf/d9WNHkTS7uOL1AjmOAryEB+Kl4XpvM2bPc6J1x3bJLQr0kY7ASfsP+sn
EovP2WnmZcMN+6QP3IXqYa66Zs0TNpF9a+kE+ZRtrR+CA0IU2h1F+hxxXQqj0qnW
mZN71F66k/6WM7N5ybsoQNBJpfE2nrPhFErbYaGlRX3XwNl3I2VKtR66QeX/wKUY
7ZQWLnzg5a3cQ+WrIffyuSsjXVDB91hdPSXy0OhvCImHKadkEIps/tppbRY63kNe
8jszRNa9Uwkkq2wLkt7L+8oxBdIoxui9RRaEPeUunjb63lzyzeCSv1ZYtUtU/dbR
kf3eYLXPbjwDpknw9n3EJz21ZUZ12g==
=maZ4
-----END PGP SIGNATURE-----

--rrIaw91LstEgu4tF--
