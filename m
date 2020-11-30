Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B97822C844A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 13:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F50A1735;
	Mon, 30 Nov 2020 13:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F50A1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606740509;
	bh=PoKaM+9VAqr74Km1DXBLBd3BN67RnM1YtLNRRtHIVdo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b9iLo1Mcg1Hg5LYUSXru9fMDS3FOd5iZ9bo7vkE1rpcs7tKwh83qX8RbaIJ+U66v5
	 9dWXaVCHpuZwtJ/SkdLhRulv6yV79yFzGJtbBvOrybBK8MHXwe3ubEh17qHuHiOgST
	 HEaMN+ZBSpQbJxzEFfMm/T6mvdq3GUo4qawuAwS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 966C6F8049C;
	Mon, 30 Nov 2020 13:46:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6558F8025F; Mon, 30 Nov 2020 13:46:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD9DFF800D0
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 13:46:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD9DFF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BFoB4OgH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F6C820691;
 Mon, 30 Nov 2020 12:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606740406;
 bh=PoKaM+9VAqr74Km1DXBLBd3BN67RnM1YtLNRRtHIVdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BFoB4OgHy31PKJuyUjNtKDRAhYEdTOV/gxVt7xwXLxzDqabs9/9WDyftYbpGzJQzK
 Wzy6c/ZVYEBe6ig5983BnoFfIUJLsKLHoV0G2yjyM8TJPsIkRjXmzHvPDkQAd9w6Pl
 jPvYmPyYVrze02gFfTa++62kzvpIbDSUXWu42Xrc=
Date: Mon, 30 Nov 2020 12:46:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK
 and LRCLK in LPAIF invalid state
Message-ID: <20201130124617.GC4756@sirena.org.uk>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
X-Cookie: Space is limited.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 agross@kernel.org, srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-kernel@vger.kernel.org
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


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2020 at 10:29:18AM +0530, Srinivasa Rao Mandadapu wrote:
> This reverts part of commit b1824968221c
> ("ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state")
>=20
> To identify LPAIF invalid state after device suspend and resume,
> made I2S and DMA control registers not volatile, which is not necessary.
> Instead invalid reg state can be handled with regcache APIs.
> The BCLK ref count is necessary to enable clock only it's in disable stat=
e.

Part of this commit message says that the problem was making the registers
non-volatile but both the change and the rest of the commit message say
that the issue was that the registers were made volatile.  I'm also
still unclear as to what the issue is either way - how does reading the
state of the registers from the hardware instead of the cache affect
things?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/E6ZgACgkQJNaLcl1U
h9CVJwf/cthAiDDzgCy+8jtekEtWgrAysykABOq/eTIZgtkirE582hD928n9uEGY
RiAsvBOiEFRnm4nQn9xLuCRw4XEKolqJyKL5cOJiQUQcqXDvuB8nOEejzC0RWRte
S88D2dEd4vm7X7MjyierwcwmuBHbT9WHKozi0e45bQJXjZCoSaEDw7Sq+h1kiUCy
z0RKAWIPOFpRl7AmkMu2hjonp/cM8/GiH0C2bYNMS0LN+nGt2+rLer+sX5P+jlev
gZuWWzTP7RCzaBub+xNVCZK2fmlIX/ePLDiXs0JAGFs0HFI+UMV1L0GVePlxsGgR
7JxoFBFJ7hKNfy4Dsn5RlwqwawcyfA==
=ueKi
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
