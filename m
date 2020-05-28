Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C41E5EC5
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 13:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0B917D0;
	Thu, 28 May 2020 13:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0B917D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590666962;
	bh=Jq88qShvPLUl1jSHeV+HkTpQ/DEqP0CcIR4U0/qY5Wc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VGRjo9gvPGxyXvkl0pXzopAPZQQ6s6gWnhbyD+OLVhX+xNX9t4ETGajjbx335BFSq
	 m6Eot7dyRNdMdVnw9aFqkvJLvsafT+fl6d3Q97aFJbkJPSY9IFGT64D1Uy3WeL6nbc
	 fnEGTS32jodE1jYB2zlx+BeaDaXKkaseLe24GICM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E15F8015C;
	Thu, 28 May 2020 13:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 474D2F80150; Thu, 28 May 2020 13:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CDFAF800E4
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 13:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CDFAF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zSCuC/Gd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19208207D3;
 Thu, 28 May 2020 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590666851;
 bh=Jq88qShvPLUl1jSHeV+HkTpQ/DEqP0CcIR4U0/qY5Wc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zSCuC/GdyC1xvDEeZtfH+KztwBTdusP9Jn9Qo081KnVeRTifE5bbwKgpfgvzGSOJB
 f8Wwi4S/afpXabkNBcAdx3VHGl6PyOmuz8dIWERfvBq/PiUr32VXziW9Ur6rgCOUcG
 +ZxAYFkTLlaMc9+RxpO/60q0FEId87wu16JU96Do=
Date: Thu, 28 May 2020 12:54:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steves.lee@maximintegrated.com>
Subject: Re: [V6 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Message-ID: <20200528115408.GA15800@sirena.org.uk>
References: <20200528103942.17432-1-steves.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20200528103942.17432-1-steves.lee@maximintegrated.com>
X-Cookie: It is your destiny.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, ryan.lee.maxim@gmail.com,
 ckeepax@opensource.cirrus.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 krzk@kernel.org, lgirdwood@gmail.com, nuno.sa@analog.com, geert@linux-m68k.org,
 dmurphy@ti.com, shumingf@realtek.com, srinivas.kandagatla@linaro.org,
 rf@opensource.wolfsonmicro.com
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


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 07:39:42PM +0900, Steve Lee wrote:
> This is the initial amplifier driver for max98390.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

> Reported-by: kbuild test robot <lkp@intel.com>

Don't think the lkp bot asked for this driver! :P

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Ppl8ACgkQJNaLcl1U
h9D2Cwf/Qy+1GYjYeCfDvjmqMPaI3X7St5/fWnywllbLp9VBVpQfpvVVblIm5kSv
ar+TVL9TRPLG0Za0y2udP4JxjHivDO+BJRInFTtl+8E2sP81BF+iz0nAjO073vFR
9+zoiZK+Y0XqH6j7cjFw0XRjkBduft6iQ/X9oeCT6Bhe5o0XTJz9yQO5GVgNvl3g
hDj5sh+bwDgGblV+LfavnqbzYe1jchiqa9kwFokig7mE6AURsV0XmPgxKig3gCvC
fXxEwkORlUh3VFAIoSmT7FEI2qqECkrvpPY4KiVuxIlbzJmkJgPwwzgI4n2AcBRu
VcM7W+rLl8wX4LwTvE6YjNvXWGxssQ==
=ieAp
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
