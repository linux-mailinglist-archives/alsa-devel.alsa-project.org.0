Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42D216F74
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB0F1683;
	Tue,  7 Jul 2020 16:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB0F1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133786;
	bh=r9ttJzbwNMPEIjDSJnzYZR6HKchBlJoonLfgRTvUz5c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TYhqq8o89nhMszJDbNshO7Y7tujVVWV0xkMUH75oSwuYzcruoKKbO6pEU/+MCJJDe
	 Z4voY/hkTSLcOsPkPpQ0ZUvb0I3EPbr8/y/hyFnHmB4W1vqPrFhfE4b2L8sxrliIsc
	 ZExBuPuxe3La9V084nSQSNrBeAVMpOO94ekH18dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB6DF803FC;
	Tue,  7 Jul 2020 16:39:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B645F803FB; Tue,  7 Jul 2020 16:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30F46F800D0
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30F46F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eCg+Fw9D"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E568B20738;
 Tue,  7 Jul 2020 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594132735;
 bh=r9ttJzbwNMPEIjDSJnzYZR6HKchBlJoonLfgRTvUz5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eCg+Fw9D/hvKjh1hwMD/KZB3at6oNNLyoEW/JdgW6qiFOtWy0AuscQGvW9q4jN9iU
 Egy3SnMliLCIpIEnWEaGdY5gfwDqjS3+tF+n0uOnIcbSpK1mEImjXB1jDdYKFoJ6Ol
 437oXaFoBQ4u2VC9gNz9/JiyB41Cfr501379Rn9E=
Date: Tue, 7 Jul 2020 15:38:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 00/28] Clean-up ASoC's W=1 build warnings
Message-ID: <20200707143850.GJ4870@sirena.org.uk>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cDtQGJ/EJIRf/Cpq"
Content-Disposition: inline
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
X-Cookie: I hate dying.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, linux-arm-kernel@lists.infradead.org
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


--cDtQGJ/EJIRf/Cpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 03:37:14PM +0100, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Copying in Pierre again.

--cDtQGJ/EJIRf/Cpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8EiPkACgkQJNaLcl1U
h9C9VQf+LIs1umxkyVoBW+jFn6404dyxCv5nE38FXB5cAIcgv2kCNYf+MyTcPJS9
vUEzFhpgn97z4vNJKls2nG5kmlysLYjdkCBrP7xCzP6VmgjpX4YEYk7HHBhfRDTd
hs2OMuDnAWgHp+oSYDApPDsCJ/t53xLb/+KQa5dN9oN88P9vshP6cI/MqzXuYNZu
hM9eeUHq82iCpRdQ8uejePWUUmEEKLoyVEIrAf9H+dOQZef05gYCnkcex/YmUHTP
8rXGDQ54YqfGM5ftTB7QTEpUiTgG+AipLnXncd79EnUGsOkD3iWVpy8Q3XyZ2Vb+
q+kt3kLOcz7DKiUqDfHyBu/iSymF5Q==
=C0zI
-----END PGP SIGNATURE-----

--cDtQGJ/EJIRf/Cpq--
