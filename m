Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E45912A9625
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 13:22:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EFF61698;
	Fri,  6 Nov 2020 13:21:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EFF61698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604665336;
	bh=ytvuoO2Mq5FaNKZ1Q85w5qAMaKu/pEcZqevEu/XewjU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bSsdF4Z5tm8g64YDgmPY45Wi/7OrUCncZPX97cP2CcY3fIPQM/BaUHk9DOoECjWoY
	 eGmzwPqZi2bldvHjrTIot5utMJbzg1QsOn6vMmf+IOhPEL6cwlQJXZ3TbByJ8xQf7I
	 fG3xy4kWWhNxG5u4Ew0z6UEcFNHtzaTOu50afYKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3345F8023E;
	Fri,  6 Nov 2020 13:21:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A98F8023E; Fri,  6 Nov 2020 13:21:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42118F80234
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 13:21:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42118F80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mrGaOxPe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B29320715;
 Fri,  6 Nov 2020 12:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604665270;
 bh=ytvuoO2Mq5FaNKZ1Q85w5qAMaKu/pEcZqevEu/XewjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mrGaOxPe1ZcFfNw7mvUDda7neUNo6SV0eMzExoW+KRsMQeayJLN7BQhlv0iAJOJT/
 wRyV81pqnRs0d5VK11GoQZHGhHfW4HTqbHjhDGnSp/mc4D1PKEL8zMOsKSVXmCHRjy
 L7J65LWw69feMxQuwHs8p911RndVRejx0B23+/Pw=
Date: Fri, 6 Nov 2020 12:20:58 +0000
From: Mark Brown <broonie@kernel.org>
To: CTLIN0 <CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
Message-ID: <20201106122058.GC49612@sirena.org.uk>
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
 <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
 <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
 <CA+Px+wVGosx=pmSkJKtYd9dQZ98D0aYG0KaDq6-ov67UoiV8Jw@mail.gmail.com>
 <20201105150249.GC4856@sirena.org.uk>
 <bd3d3b6f-2cca-cd4b-2eff-b32792b3b2e4@linux.intel.com>
 <b1b1efee-b19e-2d5c-3806-5532c39c7c47@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline
In-Reply-To: <b1b1efee-b19e-2d5c-3806-5532c39c7c47@nuvoton.com>
X-Cookie: When does later become never?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>, YHCHuang@nuvoton.com,
 WTLI@nuvoton.com, KCHSU0@nuvoton.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>
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


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 11:31:36AM +0800, CTLIN0 wrote:

> Thanks for your comments. However, I also agree the opinion from
> Tzung-Bi Shih @ Google.
> May I confirm whether I should keep this patch, and remove dapm widget
> of EN_PIN next patch?

Please send incremental patches on top of this one with any changes.

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+lP6kACgkQJNaLcl1U
h9BLyQf/RvIIfqCi7CDWRfp+Nbbtd9R03riQjCzJP5ImnCJw2OpyJjg7atPJVijc
93qovcpHDxKCShp1NK1iWCypwCSDFFQx7BxJqakywgN50XJ61yzoQfFfwJr1WsDi
DYWT/zK4lIQbZUQDrB+ioPgHUw7XypV6KeTf1ou0GwFTSnVer9B7k/FJT1GIckWk
RyRcazX4a4xEmFJPnXbf8/zDvyEymFLRpCMLinihbsAxyXcdNZILKGcveQPZSyBj
b51Q56ggpwfuL8fs/FcLODJbYZucFT5Gf78P0nuYppBk6PRQSkJtIKlSQbiLrVHW
7Gof71hhWOkm77Wy5jDvK+bh3omvzQ==
=iQzm
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
