Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C119629D28C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 22:33:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E50843;
	Wed, 28 Oct 2020 22:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E50843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603920803;
	bh=LB7IIgnXLRPsvFSUKfcokjOHLKCLUEJ1lH4XLR7MgK0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VoarrNTjEzxsaNV47T1//MR0fbT0QgvRv6z4WMbpEdJDVSLQC9e+QpJfH1VkBhWkR
	 JKnfqAN24t5EuvAjYPBRVPDtYvqwVHafyWKJKdGFd1x8ZLKl6qhho4iimH0p4PkL/S
	 ZlQIgXqXxKOY65lMFVskvS5O9PGCj6RuCDWahtMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E60F80249;
	Wed, 28 Oct 2020 22:31:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44818F80212; Wed, 28 Oct 2020 22:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03AF9F800FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 22:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03AF9F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k+A7w0xI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34CE2247C7;
 Wed, 28 Oct 2020 21:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603920698;
 bh=LB7IIgnXLRPsvFSUKfcokjOHLKCLUEJ1lH4XLR7MgK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k+A7w0xItkNypDfSE7bzwrJqNiCTMGib6IX7NpCgnWnSUwFpafXnO36QAYiJdnpnf
 EOvurTDYgXlZqJIYCL1avYRyhlWXUbxuL74ZdIigPGd9Xcx4lyLEQ17m6Jmf3f4zF8
 PQ1E4zSN9hqRZ3SMZF3Mf+sqJgazYPWF4Pvzo0OA=
Date: Wed, 28 Oct 2020 21:31:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v2] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
Message-ID: <20201028213132.GC6302@sirena.org.uk>
References: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Allow 6 to 8 weeks for delivery.
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


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 05:04:34PM +0530, Srinivasa Rao Mandadapu wrote:

> Fixes: cba62c8b49be ("ASoC: qcom: Add support for SC7180 lpass variant")

This commit is actually

    Merge series "ASoC: qcom: Add support for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:

which is not the commit that should be pointed at here.

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Z4zMACgkQJNaLcl1U
h9BhgAf/REPtAdUvxZvoB6gjMUFKH76y/rzERDgx0/fE+V/YDYb4P7Y45oXgGgwX
qHVXKLHq5BO4CsRGk1pozAgu4JsLRmTe/nmOkhSKl03VOUxAOrdJ5aYbQJotmEJD
oJEo4v4slQWlq1e4zfR7KF6f/eX/kF1r7GSErZBZ+RjGJETpfqsIbfL7wOZs4u9q
xsA7JJzVfzObYngoBJTZ7gHvuGYrbNXowOWkGrR/CiYFlDLMtPgWkZgtWSIjpbzc
mQCm+OOXp8ImuP3fc8Y02yzDlnus5yiPwareUbYjLPRKwOZQW88FfbfzyAA5AJDK
Uzo/iywf8dc8Nr9VGZGyXr1Zrj5k1w==
=ANOe
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
