Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE757492C84
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 18:36:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436382C86;
	Tue, 18 Jan 2022 18:35:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436382C86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642527400;
	bh=qMzBU33o1h25dpmtWo89Wxg5l+7hKomR8KeOL5BKubw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3gbgO03KrazyL5Vqxt3OLHfkJkflxN3+QQOP5PbSwSAYqY4x9Of19o4jhW16JTUT
	 xWGjeYZ00TWZpXGetQkvqI8So9fCjdhgSioSeaqC4yJbgrE5AsPSOmJi8hx+y8/MeA
	 IchH1e//74Hi2dulAs2z6eu0nIl77rwGfJsxas8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E7BF80246;
	Tue, 18 Jan 2022 18:35:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EE6CF8023B; Tue, 18 Jan 2022 18:35:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3DA5F800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 18:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DA5F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ptaUXx4y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 379E16123D;
 Tue, 18 Jan 2022 17:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DC9C340E0;
 Tue, 18 Jan 2022 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642527337;
 bh=qMzBU33o1h25dpmtWo89Wxg5l+7hKomR8KeOL5BKubw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ptaUXx4yuwtxtmAf2YCCFHlmgKVe5rLE3JdBPRpYiFe1tK995MGhuRvcSJs3b3tAT
 IFLklJ15uxxD2KYX03VAkD1RfTIwYuRfV8sTJkQ9e6f9x96Kxcx0uBSeMuKYp4ulxL
 NGN74ojNX7IYCk3A5ibHMbDm3TVSadNhRUEF9EOjgejsOrysdVcEibKxCpeA/A2+S8
 hL1ee4vPUzWlCX465p2Ik5yLwjgzq8NKPGHGy34sgusZheKQodnHenInFeso4XEy8q
 BkXWmC2ASJlfIJ/KIpSD+I7iaM7CrTgYhgYia8z7bt2loFm6xgcTDAirx/r3MQ7oR6
 /zwU/xoJNTilw==
Date: Tue, 18 Jan 2022 17:35:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: amd: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
Message-ID: <Yeb6YzIugFSmidQY@sirena.org.uk>
References: <20220117041528.59958-1-julianbraha@gmail.com>
 <Yeb0n9AVXeVzBHrT@sirena.org.uk>
 <26ec72a7-effa-7553-fc0f-4e016b651c09@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bBU/pd3VrGlA9S/Q"
Content-Disposition: inline
In-Reply-To: <26ec72a7-effa-7553-fc0f-4e016b651c09@linux.intel.com>
X-Cookie: Do YOU have redeeming social value?
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 fazilyildiran@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 Vijendar.Mukunda@amd.com, Julian Braha <julianbraha@gmail.com>,
 tanureal@opensource.cirrus.com
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


--bBU/pd3VrGlA9S/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2022 at 11:21:50AM -0600, Pierre-Louis Bossart wrote:
> On 1/18/22 11:10 AM, Mark Brown wrote:

> > Why is this a good fix and not removing the dependency on gpiolib from
> > DMIC?  While a DMIC *can* use a GPIO it's not something that's an
> > intrinsic requirement and it's entirely optional in the code.

> We also have similar 'depends on GPIOLIB' for Intel boards that are not
> really useful. see e.g. 4262ddc2ad63 ('ASoC: Intel: boards: add explicit
> dependency on GPIOLIB when DMIC is used'). IIRC we had this discussion
> before about doing a larger cleanup.

At first glance it's just that the gpiolib dependency on the DMIC driver
is spurious and should be deleted, the code looks fine and I'd not
expect any need for an actual dependency (but I'm out of office this
week so probably not going to actually poke at things properly right
now).

--bBU/pd3VrGlA9S/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm+mMACgkQJNaLcl1U
h9CyEgf7B4or95KreNOOC9KGSpHw3O2RfRdk8iBHMJYbjN4fPEMZ7C1kyER7j3F4
DvTXfw5BTamOl04W1YNmP6xms/S2OZ6Jxc+p/wTyQEKS64GRl9t8SWX090V3kUUo
ggwCXzb1TYG4Pb4DqpeQrCI34UbhSDa1twH73P9YBg9VtEIw0Hw9drxa8dZE22As
HFiidQGiTd89jhY/omGjudeFdCTutSaE+ROL4FZHK3Y4X+3eubptlbL6M2f9jbhw
3TCz/o0ZP4rUvu09r7CDutmHNyavRNLhfv3fz9UouO8aVMgyPJGOerehK8bhjOTc
3Rey2MR3FItXaOIt0R1UrbVxkMq+ww==
=3kwX
-----END PGP SIGNATURE-----

--bBU/pd3VrGlA9S/Q--
