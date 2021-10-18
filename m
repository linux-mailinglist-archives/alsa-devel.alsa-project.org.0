Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70A432837
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 22:14:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8226316DC;
	Mon, 18 Oct 2021 22:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8226316DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634588076;
	bh=+lS5kHIyjwnfYHKgJMTUauxWdHZgSV9xSrTbK54/hj4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NT6Of8B+iMH42DD4NvL0JlP198Ddi2eBKM6nYHaqLZ/s55xthUltv0dcylcqVCXk1
	 K9lNoGAoNy9wsVMR5yIZlUAJgZxK97N7dUjqJvTE3DgUjvtdgmtmwHtGaJG3dr3Vx7
	 6kd8+CCUn6E9EnsnCEIhdxDGa6fxo6jVqVoBNOJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F33F80253;
	Mon, 18 Oct 2021 22:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F08C9F80224; Mon, 18 Oct 2021 22:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C12FF801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 22:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C12FF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hvPMuTr6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 534D4610A1;
 Mon, 18 Oct 2021 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634587986;
 bh=+lS5kHIyjwnfYHKgJMTUauxWdHZgSV9xSrTbK54/hj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvPMuTr60m7GPIQet8CRTOHntnvIggo1HyHAkse+yblsZZ0vemub+ArHz+GQwazsx
 6FDAAlLuaGGTvkfqCuYQANqrMewR+NnpM5t0YLwInA3HGw9yKzqVflh+TVI/uw3Lyw
 xfWZLnWhpyEUcBHQLrSzoskvoGDQYlgpx2zwl1vmc5zV+0q9Tx/emr4URFcVvplE5b
 fxFSihtDn39mvMhq7EQAmbuzKwdp7seZ1uZVR3XQCPh4Ku0C7oTTRen16Vaif49o2R
 +nAqg/nCL/1WnVzwkxHWXWTjHAC7WdQlP1EikjRMvCR8Jb07siRXhEdFBGN1RmRJ8F
 UWQLupkcd+zww==
Date: Mon, 18 Oct 2021 21:13:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH v3 1/8] ASoC: amd: Add common framework to support I2S on
 ACP SOC
Message-ID: <YW3VUMT9Rjs2+A1G@sirena.org.uk>
References: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
 <20211012071939.97002-2-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UAG1RRAEZBUpbXJS"
Content-Disposition: inline
In-Reply-To: <20211012071939.97002-2-AjitKumar.Pandey@amd.com>
X-Cookie: An idle mind is worth two in the bush.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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


--UAG1RRAEZBUpbXJS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 12, 2021 at 12:49:32PM +0530, Ajit Kumar Pandey wrote:
> We are using legacy way of exposing dais and DMA configuration that
> requires separate driver modules for various ACP SOC with almost
> similar hw configuration. Moreover the legacy approach requires
> separate I2S and DMA module platform devices registration and need
> machine specific quirk to control various I2S endpoints. Add generic
> dai driver and platform driver for I2S controller on ACP hw block.

This doesn't apply against current code, please check and resend:

pplying: ASoC: amd: Add common framework to support I2S on ACP SOC
Using index info to reconstruct a base tree...
M	sound/soc/amd/Kconfig
Falling back to patching base and 3-way merge...
Auto-merging sound/soc/amd/Kconfig
CONFLICT (content): Merge conflict in sound/soc/amd/Kconfig

--UAG1RRAEZBUpbXJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFt1U8ACgkQJNaLcl1U
h9A4FQf/aEjjqZ34431puWcsp5Booidsz7yFPt1mzexZ/OJS9X5ZnyqhENI4+2CW
6/TTKq1ktGKVHGP5Ty+06MTY3CKH0Z8OEBWi6tu7hsWdVBji4yNT/jKfzJDlRm8j
jx86ZJjt7VLTtmjxY5crM/K0hProILbfKk0KnBBJs5VFHfHgxX2yvNzhVy81dMcj
G0XVnC+fAEUyBYWZ0Y5ZMOG6Nx3ufkLhpEwqqEPeyEuETtftSaN67n30aUNUeeo5
mnvEto51AE/Stk5s9M9sNlt7gLQRDs6ifBBRORH1VkRN+E4g/R6F8KO5LILU3k/O
1fHxa2r4XHLpqFL12BjLyj06+plLug==
=dfrz
-----END PGP SIGNATURE-----

--UAG1RRAEZBUpbXJS--
