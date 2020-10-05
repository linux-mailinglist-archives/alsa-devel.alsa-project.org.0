Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA942283532
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2421117EB;
	Mon,  5 Oct 2020 13:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2421117EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601898747;
	bh=UZVfuP1aRfwrbBFJKfqea9aS4yvWgRH18g0vwiE7JUQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P19ClbjSbQmb3jLrCrkOOxu8DAdFtJ++p8J57d2jaHMrHISP0y376FnrFDBOt1Unz
	 pViT/ajahYYhJ1d7dTnmsnQ0YAO8MDaabej6p7Xtp5fZBTl4XVH0IjEm/QW7k8HPeM
	 aZ2ht4leNqFwMxQZ3lDrrtmAi/SfVFjpACLy9w4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48E7BF80121;
	Mon,  5 Oct 2020 13:50:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A7FEF8025A; Mon,  5 Oct 2020 13:50:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 030FCF80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030FCF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BaKL8xo7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B904A20757;
 Mon,  5 Oct 2020 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601898628;
 bh=UZVfuP1aRfwrbBFJKfqea9aS4yvWgRH18g0vwiE7JUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BaKL8xo71qV17N/t9fGAhq+bn8wwCb+dG7ioGRxw9SMDW/iz7JSuFPnVdsEf5uhpf
 hvCe6dW0au36/1bvUY4cCIGkqCmK0uKJbPzEbiEjiQDKR4xi2P+x68916e+34Ovcd+
 YIs51l1towxws7uWgEFMtLbhc3MF5/KhlLuy2wHg=
Date: Mon, 5 Oct 2020 12:49:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: fsl_ssi: add ac97 fixed mode support
Message-ID: <20201005114925.GC5139@sirena.org.uk>
References: <20201005111644.3131604-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <20201005111644.3131604-1-primoz.fiser@norik.com>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
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


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2020 at 01:16:43PM +0200, Primoz Fiser wrote:

> bits. But in summary, when SSI operates in AC'97 variable mode of
> operation, CODECs can sometimes send SLOTREQ bits for non-existent audio
> slots which then "stick" in SSI and completely break audio output.

If this is something that happens based on the CODEC shouldn't we be
doing this by quirking based on the CODEC the system has rather than
requiring people set a separate DT property?

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl97CEQACgkQJNaLcl1U
h9C96gf/T7WsDXzutk8Io6bB7BZKUlJPkuMr5OzGzWy+TQhGS8Cl3gtnQjYIuliB
VN5TrTI7TL7+sXZNYESI6Nlljf+B7ick4s/8Xtc+ymdiJ3azdp3GRGWbh9SirX1P
3N6IOrNs9aoT8RnRrKtpKBWnvsAt9yecZ83/giXvUue7Rj9NDwR4E+s8MeIy0Z9f
xk7qGwQTCmz5cjzQldBvVxW8SmpSsaRN1q6EwCh9GG3Agx+DlfmcrKjxRMrQCkXH
azhMKoi16YLjLG3nNvykcor08tE8NtjfByY0yBmsl/fZlBC4mXUwNt+cnMT83Jan
6vjlx2j+zxe+gNqIjFORCDLIImZ1Gw==
=B5dM
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
