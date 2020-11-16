Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5D2B51C1
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 21:00:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F24173D;
	Mon, 16 Nov 2020 20:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F24173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605556820;
	bh=d5fnY7U13HO6I7Ut7sqDaEc5L2A8sFA76A1LXU1zJ9c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EtFYyUQ5JeTc5Cx5RQFB4hVSvWig5/a2XdBSZEd2+rhbIfJXB96yRP2GQhfsK8wVy
	 AU5WUMdNKk+kKruiUsA0QbzZ3gtqPiDFuWv0jMWRB+h6jMeug2pDL514GwUalqFPwi
	 doZjRe6AJP1Z4aRffSuRt55x7YOtuoYVSPbdnSH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D69DCF8016C;
	Mon, 16 Nov 2020 20:58:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AF18F80168; Mon, 16 Nov 2020 20:58:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 554E4F800D8
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 20:58:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 554E4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LXHxqxXs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5BEA20DD4;
 Mon, 16 Nov 2020 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605556715;
 bh=d5fnY7U13HO6I7Ut7sqDaEc5L2A8sFA76A1LXU1zJ9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LXHxqxXsQ3HimLH12pqHgkkF/dvOu1x5h0YNO8Vp3EGB7wlOIMDWFElISAxrLNRKI
 gvnhZo0ZMycdNw6o/G0DaUQLSL6aOghj842jGRXZJtlVBiObbRiVBI0Uc7RmonLjPR
 K7gjkZEtHrH0t5go0Ph14Sectfby7NgsLOWjx/bg=
Date: Mon, 16 Nov 2020 19:58:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH 3/5] ASoC: soc-generic-dmaengine-pcm: Add custom prepare
 and submit function
Message-ID: <20201116195816.GH4739@sirena.org.uk>
References: <20201116061905.32431-1-michael.wei.hong.sit@intel.com>
 <20201116061905.32431-4-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gKijDXBCEH69PxaN"
Content-Disposition: inline
In-Reply-To: <20201116061905.32431-4-michael.wei.hong.sit@intel.com>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 vinod.koul@linux.intel.com, andriy.shevchenko@intel.com,
 alsa-devel@alsa-project.org, jee.heng.sia@intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, lars@metafoo.de
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


--gKijDXBCEH69PxaN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2020 at 02:19:03PM +0800, Michael Sit Wei Hong wrote:

> In the Intel KeemBay solution, the DW AXI-based DMA has a limitation on
> the number of DMA blocks per transfer. In the case of 16 bit audio ASoC
> would allocate blocks exceeding the DMA block limitation.

> The ASoC layers are not aware of such DMA limitation, and the DMA engine
> does not provide an API to set the maximum number of blocks per linked link.

Can we not extend the dmaengine API so that the ASoC layer (and any
other users) can become aware of this limitation and handle it
appropriately rather than jumping straight to some client driver
specific handling?

--gKijDXBCEH69PxaN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+y2dcACgkQJNaLcl1U
h9DYQgf+Mrg433+qIkXsfacTHqJMiqkjHZnsvpg7RYkZwUZIwfNqNk9VFYje6H3z
WtAXiAq2mmPJlATmDmIQw30CrTe6UylBQBkn5iO5X8ZUcOitKrkx9067vknylMmY
dwz4sr6YacxCjRqBYUJbUSy1LNMPib/m6xEMmj0H0cObES8G+R62yFzmHvrjniw7
tp29s3KxIGEOV+Rzns8OMe833/KxjJJqlvjAY7Uj4YsWWeMVgfadUzAhdt6TKIhp
Adn/EtQNRx0dWc/ewHAx5NKvey9BeDWKvmLMTfA5VaVpEBMPuHVMcRF9Ed250RDE
G6TgOY8m3yyp45PhQK2lOERoJygQnQ==
=iApt
-----END PGP SIGNATURE-----

--gKijDXBCEH69PxaN--
